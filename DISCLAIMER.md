# 免责声明 / Disclaimer

**最后更新：2026-11-21**

## 中文

1. **本仓库（`com.ncm.tidy`，"精简入口"模块）为作者个人自用、出于学习与研究目的开发的 Xposed/LSPatch 模块源码，按"现状"（AS IS）提供，不提供任何明示或默示的保证。**

2. 本模块通过运行时 Hook 修改第三方应用（网易云音乐 Android 客户端）的界面与行为，**仅供个人学习 Android 逆向、RN 界面 Hook、smali 开发等技术研究使用**。请勿将本模块或其衍生版本用于商业用途、二次分发牟利、或任何侵犯网易公司合法权益的场景。

3. **测试范围有限**：本模块**仅**在「网易云音乐 9.5.81 + LSPatch embed（内置模块）方案 + MuMu Android 15 模拟器（x86_64）」环境下由作者测试通过。**未在任何真机、任何其它宿主版本（包括网易云音乐的后续或历史版本）、或 Magisk/LSPosed root 环境下测试，不保证可用性，也不承诺跟进版本适配。** 使用者需自行评估并承担在其它环境下使用的全部风险。

4. 使用本模块需要对宿主 APK 进行重打包与重签名（LSPatch embed 方案），这会：
   - 触发应用完整性校验风险（部分场景下宿主可能拒绝运行）；
   - 替换原签名，导致与官方版本**无法覆盖安装**、账号风控风险由使用者自担；
   - 违反网易云音乐用户协议的可能性。**是否使用、如何使用，请自行判断并承担一切后果，作者不为任何人的使用行为承担责任。**

5. 本仓库不含任何网易云音乐官方代码、受版权保护的资源文件或原始 APK；仓库中出现的网易云相关名称、商标归网易公司所有，仅作技术说明性引用。如网易公司认为本仓库内容不适当，请联系作者删除。

6. 任何人下载、编译、修改或使用本仓库代码，即视为**已阅读、理解并同意本免责声明**。不同意者请勿使用。

## English (Summary)

1. This repository (`com.ncm.tidy`) is a personal, study-and-research-only Xposed/LSPatch module, provided "AS IS", without warranty of any kind.
2. It modifies the behavior of a third-party app (NetEase CloudMusic for Android) via runtime hooks, for personal learning of Android reverse engineering, RN view hooking, and smali development only. **No commercial use, no redistribution for profit, no infringement of NetEase's rights.**
3. **Tested ONLY by the author on: NetEase CloudMusic 9.5.81 repacked with the LSPatch embed scheme, on a MuMu Android 15 emulator (x86_64). NOT tested on real devices, other host versions, or rooted LSPosed environments. No fitness for any other environment is promised.**
4. Using it requires repacking and re-signing the host APK, which replaces the official signature and may conflict with the app's integrity checks, its Terms of Service, and its account risk control. **Use at your own risk; the author is not liable for any consequence of anyone's use.**
5. This repository contains no NetEase code, copyrighted assets, or original APKs. NetEase trademarks belong to NetEase, Inc.; references are for technical documentation only. Takedown requests are honored upon contact.
6. Downloading, building, modifying, or using this code means you have read, understood, and accepted this disclaimer.
