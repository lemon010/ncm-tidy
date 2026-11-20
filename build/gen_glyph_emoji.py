"""Regenerate Glyph.smali mapping titles to soft/light-looking emoji."""
from pathlib import Path

TITLES = [
    "拦截开屏广告", "显示搜索标签", "显示笔记标签", "显示抽屉VIP区块",
    "启动默认显示我的", "拦截版本更新弹窗", "屏蔽播放器上方广告条", "跟随系统深浅色",
    "我的消息", "我的云贝", "装扮中心", "创作者中心", "最近播放", "定时关闭",
    "商城", "云村有票", "云推歌", "我的客服", "我的好友", "我的收藏",
    "我的播客", "我的电台", "我的博客", "直播", "云村", "游戏中心",
    "免流量服务", "青少年模式", "免费听VIP歌曲",
]

# soft / light-toned emoji, one per title, in the same order
EMOJI = [
    "\N{PROHIBITED SIGN}",              # 拦截开屏广告 -> 🚫
    "\N{LEFT-POINTING MAGNIFYING GLASS}",  # 显示搜索标签 -> 🔍
    "\N{SPIRAL NOTE PAD}",              # 显示笔记标签 -> 🗒
    "\N{CROWN}",                        # 显示抽屉VIP区块 -> 👑
    "\N{WAVING HAND SIGN}",             # 启动默认显示我的 -> 👋
    "\N{ANTICLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS}",  # 拦截版本更新弹窗 -> 🔄
    "\N{BLACK RIGHT-POINTING TRIANGLE WITH DOUBLE VERTICAL BAR}",  # 屏蔽播放器上方广告条 -> ⏭ (stop ad)
    "\N{CRESCENT MOON}",                # 跟随系统深浅色 -> 🌙
    "\N{ENVELOPE}",                     # 我的消息 -> ✉
    "\N{CLOUD}",                        # 我的云贝 -> ☁
    "\N{T-SHIRT}",                      # 装扮中心 -> 👕
    "\N{SPORTS MEDAL}",                 # 创作者中心 -> 🏅
    "\N{ALARM CLOCK}",                  # 最近播放 -> ⏰
    "\N{HOURGLASS WITH FLOWING SAND}",  # 定时关闭 -> ⏳
    "\N{BALLOON}",                      # 商城 -> 🎈
    "\N{TICKET}",                       # 云村有票 -> 🎫
    "\N{MUSICAL NOTE}",                 # 云推歌 -> 🎵
    "\N{HEADPHONE}",                    # 我的客服 -> 🎧
    "\N{BUSTS IN SILHOUETTE}",          # 我的好友 -> 👥
    "\N{WHITE MEDIUM STAR}",            # 我的收藏 -> ⭐
    "\N{STUDIO MICROPHONE}",            # 我的播客 -> 🎙
    "\N{RADIO}",                        # 我的电台 -> 📻
    "\N{LOWER LEFT BALLPOINT PEN}",    # 我的博客 -> 🖊
    "\N{VIDEO CAMERA}",                 # 直播 -> 📹
    "\N{HOUSE BUILDING}",               # 云村 -> 🏠
    "\N{VIDEO GAME}",                   # 游戏中心 -> 🎮
    "\N{ANTENNA WITH BARS}",            # 免流量服务 -> 📶
    "\N{SHIELD}",                       # 青少年模式 -> 🛡
    "\N{OPTICAL DISC}",                 # 免费听VIP歌曲 -> 💿
]

HEADER = """.class public Lcom/ncm/tidy/Glyph;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_end

"""


def esc(s: str) -> str:
    """Escape to smali \\uXXXX literals; supplementary chars become surrogate pairs."""
    units: list[int] = []
    for ch in s:
        cp = ord(ch)
        if cp > 0xFFFF:
            cp -= 0x10000
            units.append(0xD800 + (cp >> 10))
            units.append(0xDC00 + (cp & 0x3FF))
        else:
            units.append(cp)
    return "".join(f"\\u{u:04x}" for u in units)


def main() -> None:
    assert len(TITLES) == len(EMOJI) == 29
    out = [HEADER]
    for i, (title, emoji) in enumerate(zip(TITLES, EMOJI)):
        out.append(f"    const-string v0, \"{esc(title)}\"\n\n")
        out.append("    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n\n")
        out.append("    move-result v0\n\n")
        out.append(f"    if-eqz v0, :cond_{i:x}\n\n")
        out.append(f"    const-string v0, \"{esc(emoji)}\"\n\n")
        out.append("    return-object v0\n\n")
        out.append(f"    :cond_{i:x}\n")
    out.append("    const-string v0, \"\\u2022\"\n\n    return-object v0\n\n"
               "    :cond_end\n    const-string v0, \"\\u2022\"\n\n    return-object v0\n.end method\n")
    path = Path(__file__).parent / "smali/com/ncm/tidy/Glyph.smali"
    path.write_text("".join(out), encoding="utf-8", newline="\n")
    print(f"wrote {path} ({len(TITLES)} mappings)")

if __name__ == "__main__":
    main()
