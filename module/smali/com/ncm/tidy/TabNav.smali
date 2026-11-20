.class public Lcom/ncm/tidy/TabNav;
.super Ljava/lang/Object;


# static fields
.field private static LOGGED:Z

.field private static TRY:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/app/Activity;)V
    .locals 9

    if-eqz p0, :cond_1

    :try_start_0
    sget-object v0, Lcom/ncm/tidy/TabHook;->CODES:[Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "bottomNav"

    const-string v3, "id"

    const-string v4, "com.netease.cloudmusic"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    array-length v3, v0

    if-gt v2, v3, :cond_1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    invoke-static {v4}, Lcom/ncm/tidy/TabNav;->wantHide(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_0

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    return-void
.end method

.method private static clickDeep(Landroid/view/View;I)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    const/4 v1, 0x5

    if-gt p1, v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    invoke-static {v4, v5}, Lcom/ncm/tidy/TabNav;->clickDeep(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method private static clickLast(Landroid/app/Activity;)Z
    .locals 7

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "bottomNav"

    const-string v3, "id"

    const-string v4, "com.netease.cloudmusic"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    move-object v2, v1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_0
    if-ltz v3, :cond_1

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_0

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/ncm/tidy/TabNav;->clickDeep(Landroid/view/View;I)Z

    move-result v0

    return v0

    :cond_0
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private static ready(Landroid/app/Activity;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v3, "loadingContainer"

    const-string v4, "id"

    const-string v5, "com.netease.cloudmusic"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public static selectMine(Landroid/app/Activity;)V
    .locals 2

    sget v0, Lcom/ncm/tidy/TabNav;->TRY:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    const-string v0, "start_mine"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/ncm/tidy/TabNav;->ready(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/ncm/tidy/TabNav;->clickLast(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Lcom/ncm/tidy/TabNav;->TRY:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/ncm/tidy/TabNav;->TRY:I

    :cond_0
    return-void
.end method

.method public static selectTab(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    sget-object v1, Lcom/ncm/tidy/TabHook;->CODES:[Ljava/lang/String;

    if-eqz v1, :cond_1

    const/4 v2, 0x0

    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "bottomNav"

    const-string v5, "id"

    const-string v6, "com.netease.cloudmusic"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_1

    move-object v4, v3

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_1

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/ncm/tidy/TabNav;->clickDeep(Landroid/view/View;I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    return v0
.end method

.method private static wantHide(Ljava/lang/String;)Z
    .locals 3

    if-eqz p0, :cond_1

    const-string v0, "search"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "tab_search"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_0
    const-string v0, "social"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "tab_note"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method
