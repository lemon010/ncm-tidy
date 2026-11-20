.class public Lcom/ncm/tidy/Glyph;
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

    const-string v0, "\u62e6\u622a\u5f00\u5c4f\u5e7f\u544a"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\ud83d\udec7"

    return-object v0

    :cond_0
    const-string v0, "\u663e\u793a\u641c\u7d22\u6807\u7b7e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "\ud83d\udd0d"

    return-object v0

    :cond_1
    const-string v0, "\u663e\u793a\u7b14\u8bb0\u6807\u7b7e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\ud83d\uddd2"

    return-object v0

    :cond_2
    const-string v0, "\u663e\u793a\u62bd\u5c49\u0056\u0049\u0050\u533a\u5757"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "\ud83d\udc51"

    return-object v0

    :cond_3
    const-string v0, "\u542f\u52a8\u9ed8\u8ba4\u663e\u793a\u6211\u7684"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "\ud83d\udc4b"

    return-object v0

    :cond_4
    const-string v0, "\u62e6\u622a\u7248\u672c\u66f4\u65b0\u5f39\u7a97"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "\ud83d\udd04"

    return-object v0

    :cond_5
    const-string v0, "\u5c4f\u853d\u64ad\u653e\u5668\u4e0a\u65b9\u5e7f\u544a\u6761"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "\u23ef"

    return-object v0

    :cond_6
    const-string v0, "\u8ddf\u968f\u7cfb\u7edf\u6df1\u6d45\u8272"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "\ud83c\udf19"

    return-object v0

    :cond_7
    const-string v0, "\u6211\u7684\u6d88\u606f"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "\u2709"

    return-object v0

    :cond_8
    const-string v0, "\u6211\u7684\u4e91\u8d1d"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "\u2601"

    return-object v0

    :cond_9
    const-string v0, "\u88c5\u626e\u4e2d\u5fc3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "\ud83d\udc55"

    return-object v0

    :cond_a
    const-string v0, "\u521b\u4f5c\u8005\u4e2d\u5fc3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "\ud83c\udfc5"

    return-object v0

    :cond_b
    const-string v0, "\u6700\u8fd1\u64ad\u653e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "\u23f0"

    return-object v0

    :cond_c
    const-string v0, "\u5b9a\u65f6\u5173\u95ed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "\u23f3"

    return-object v0

    :cond_d
    const-string v0, "\u5546\u57ce"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "\ud83c\udf88"

    return-object v0

    :cond_e
    const-string v0, "\u4e91\u6751\u6709\u7968"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "\ud83c\udfab"

    return-object v0

    :cond_f
    const-string v0, "\u4e91\u63a8\u6b4c"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const-string v0, "\ud83c\udfb5"

    return-object v0

    :cond_10
    const-string v0, "\u6211\u7684\u5ba2\u670d"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "\ud83c\udfa7"

    return-object v0

    :cond_11
    const-string v0, "\u6211\u7684\u597d\u53cb"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const-string v0, "\ud83d\udc65"

    return-object v0

    :cond_12
    const-string v0, "\u6211\u7684\u6536\u85cf"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "\u2b50"

    return-object v0

    :cond_13
    const-string v0, "\u6211\u7684\u64ad\u5ba2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const-string v0, "\ud83c\udf99"

    return-object v0

    :cond_14
    const-string v0, "\u6211\u7684\u7535\u53f0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    const-string v0, "\ud83d\udcfb"

    return-object v0

    :cond_15
    const-string v0, "\u6211\u7684\u535a\u5ba2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "\ud83d\udd8a"

    return-object v0

    :cond_16
    const-string v0, "\u76f4\u64ad"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string v0, "\ud83d\udcf9"

    return-object v0

    :cond_17
    const-string v0, "\u4e91\u6751"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "\ud83c\udfe0"

    return-object v0

    :cond_18
    const-string v0, "\u6e38\u620f\u4e2d\u5fc3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-string v0, "\ud83c\udfae"

    return-object v0

    :cond_19
    const-string v0, "\u514d\u6d41\u91cf\u670d\u52a1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const-string v0, "\ud83d\udcf6"

    return-object v0

    :cond_1a
    const-string v0, "\u9752\u5c11\u5e74\u6a21\u5f0f"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "\ud83d\udee1"

    return-object v0

    :cond_1b
    const-string v0, "\u514d\u8d39\u542c\u0056\u0049\u0050\u6b4c\u66f2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string v0, "\ud83d\udcbf"

    return-object v0

    :cond_1c
    const-string v0, "\u2022"

    return-object v0

    :cond_end
    const-string v0, "\u2022"

    return-object v0
.end method
