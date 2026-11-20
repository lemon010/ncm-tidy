.class public Lcom/ncm/tidy/MinibarGuard;
.super Ljava/lang/Object;


# static fields
.field private static final BAR:Ljava/lang/String;

.field private static LOGGED:Z

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "MinibarNewStyleHintRootView"

    sput-object v0, Lcom/ncm/tidy/MinibarGuard;->BAR:Ljava/lang/String;

    const-string v0, "NCMTIDY"

    sput-object v0, Lcom/ncm/tidy/MinibarGuard;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/app/Activity;)V
    .locals 5

    if-eqz p0, :cond_0

    :try_start_0
    const-string v0, "bar_hide"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f092107

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1}, Lcom/ncm/tidy/MinibarGuard;->hideBanner(Landroid/view/ViewGroup;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-boolean v3, Lcom/ncm/tidy/MinibarGuard;->LOGGED:Z

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    sput-boolean v3, Lcom/ncm/tidy/MinibarGuard;->LOGGED:Z

    sget-object v3, Lcom/ncm/tidy/MinibarGuard;->TAG:Ljava/lang/String;

    const-string v4, "minibar banner hidden"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :cond_0
    :goto_0
    return-void
.end method

.method private static hideBanner(Landroid/view/ViewGroup;)Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :cond_0
    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/ncm/tidy/MinibarGuard;->BAR:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x1

    goto :goto_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v6

    :cond_1
    return v0
.end method
