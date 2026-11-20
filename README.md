# 精简入口 (com.ncm.tidy)

网易云音乐 Android 客户端的 Xposed/LSPatch 精简模块：隐藏侧边抽屉指定条目、屏蔽开屏广告与版本更新弹窗、隐藏播放器上方广告条、跟随系统深浅色等，模块设置入口注入宿主设置页（显示为「精简入口」）。

> **本项目为个人自用，仅供学习研究。仅在与 [LSPatch](https://github.com/LSPosed/LSPatch) `--embed` 方案打包的网易云音乐 9.5.81 上实测通过，不保证任何其它版本可用。**

## 声明

- **免责声明**：见 [DISCLAIMER.md](DISCLAIMER.md)。本模块修改第三方应用运行行为，仅供个人学习与技术研究，请勿用于任何商业或侵权用途，使用产生的一切后果由使用者自行承担。
- **开源协议**：本项目源码以 [MIT License](LICENSE) 开源。仅为技术交流开放源码，**不构成对网易云音乐任何官方立场的关联或背书**；网易云音乐及相关商标归网易公司所有。
- **测试范围**：模块仅在 `网易云 9.5.81 + LSPatch 内置(embed) 方案` 的组合下测试通过（MuMu Android 15 模拟器）。**未在任何真机、任何其它宿主版本、任何 Magisk/LSPosed root 环境下测试**，亦不承诺跟进后续版本适配（随缘）。

## 功能

| 分组 | 项 |
|---|---|
| 功能（8 项） | 拦截开屏广告 / 屏蔽底部搜索标签 / 屏蔽底部笔记标签 / 屏蔽抽屉VIP区块 / 启动默认显示我的 / 拦截版本更新弹窗 / 屏蔽播放器上方广告条 / 跟随系统深浅色 |
| 屏蔽项（21 项） | 我的消息、我的云贝、装扮中心、创作者中心、最近播放、定时关闭、商城、云村有票、云推歌、我的客服、我的好友、我的收藏、我的播客、我的电台、我的博客、直播、云村、游戏中心、免流量服务、青少年模式、免费听VIP歌曲 |



## 仓库结构

```
module/            模块源码（apktool 工程，可 apktool b 直接构建）
  smali/com/ncm/tidy/   全部 23 个类的 smali 源码
  AndroidManifest.xml   Xposed 模块声明
  assets/xposed_init    入口类
build/             构建与出包脚本
  gen_glyph_emoji.py    生成 Glyph.smali（标题→emoji 映射，注意 UTF-16 代理对）
  repack_emoji.py       将模块 APK 塞回 LSPatch 大包（保持 arsc/so 对齐）
  apply_patch.py        DrawerGuard 触摸拦截修复补丁（历史工作产物，已应用在源码中）
  SignEntry.java        apksig 签名辅助（v2+v3，对齐保持）
```

## 构建

模块本身是一个标准 apktool 工程，无 Android SDK 依赖：

```powershell
# 1. 构建模块 APK
java -jar apktool.jar b module -o mod.apk

# 2.（可选）修改 emoji 映射后重新生成 Glyph.smali
python build/gen_glyph_emoji.py   # 写回 module/smali/com/ncm/tidy/Glyph.smali

# 3. 塞回 LSPatch 大包（保持 resources.arsc 4 字节 / liblspatch.so 4096 对齐）
python build/repack_emoji.py <mod.apk> <unsigned.apk>

# 4. 官方 apksig 签名（v2+v3，必须 setAlignmentPreserved(true)）
java -cp apksig-8.5.2.jar <ApkSign 封装> keystore ... <unsigned.apk> <signed.apk>
```

**签名**：使用 Google 官方 [apksig](https://maven.google.com/web/index.html#com.android.apksig:apksig) 签名并开启对齐保持。


## 致谢

- [LSPosed / LSPatch](https://github.com/LSPosed/LSPatch)
- [iBotPeaches / apktool](https://github.com/iBotPeaches/Apktool)
- Google apksig
