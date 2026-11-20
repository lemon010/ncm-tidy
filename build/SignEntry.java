import java.io.File;
import java.io.FileInputStream;
import java.security.*;
import java.security.cert.X509Certificate;
import java.util.List;
import com.android.apksig.ApkSigner;
import com.android.apksig.ApkVerifier;
class SignEntry {
    public static void main(String[] args) throws Exception {
        var password = System.getenv("NCM_BUILD_KEYPASS").toCharArray();
        var keystore = KeyStore.getInstance("PKCS12");
        try (FileInputStream input = new FileInputStream(args[0])) {
            keystore.load(input, password);
        }
        var key = (PrivateKey) keystore.getKey("ncm", password);
        var cert = (X509Certificate) keystore.getCertificate("ncm");
        var config = new ApkSigner.SignerConfig.Builder("CERT", key, List.of(cert)).build();
        var apk = new File(args[2]);
        new ApkSigner.Builder(List.of(config))
            .setInputApk(new File(args[1])).setOutputApk(apk)
            .setV1SigningEnabled(false).setV2SigningEnabled(true).setV3SigningEnabled(true)
            .setAlignmentPreserved(true).build().sign();
        for (int sdk : new int[] {27, 28, 33, 37}) {
            var result = new ApkVerifier.Builder(apk).setMinCheckedPlatformVersion(sdk)
                .setMaxCheckedPlatformVersion(sdk).build().verify();
            System.out.printf("API %d verified=%s v2=%s v3=%s errors=%s%n", sdk, result.isVerified(),
                result.isVerifiedUsingV2Scheme(), result.isVerifiedUsingV3Scheme(), result.getAllErrors());
            if (!result.isVerified() || !result.getSignerCertificates().contains(cert)) {
                throw new IllegalStateException("APK verification failed at API " + sdk);
            }
        }
    }
}
