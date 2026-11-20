.class public Lcom/ncm/tidy/SettingEntry;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/app/Activity;)V
    .locals 9

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "ncm_tidy_entry"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "\u5b58\u50a8\u7a7a\u95f4"

    invoke-static {v0, v1}, Lcom/ncm/tidy/SettingEntry;->hasText(Landroid/view/View;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "ncm_tidy_entry"

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const-string v1, "\u7cbe\u7b80\u5165\u53e3"

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {}, Lcom/ncm/tidy/SettingEntry;->density()F

    move-result v1

    const v3, -0x33c4c4c5    # -4.908158E7f

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v3, v1

    float-to-int v3, v3

    const/high16 v4, 0x40a00000    # 5.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    invoke-virtual {v2, v3, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    new-instance v3, Lcom/ncm/tidy/EntryClick;

    invoke-direct {v3}, Lcom/ncm/tidy/EntryClick;-><init>()V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0x35

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/high16 v4, 0x421c0000    # 39.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    const/high16 v4, 0x41800000    # 16.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    move-object v4, v0

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    :cond_0
    :goto_0
    return-void
.end method

.method private static density()F
    .locals 3

    sget-object v0, Lcom/ncm/tidy/Prefs;->APP:Landroid/content/Context;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    return v0

    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    return v0
.end method

.method public static hasText(Landroid/view/View;Ljava/lang/String;)Z
    .locals 5

    if-eqz p0, :cond_2

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, p0

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/ncm/tidy/SettingEntry;->hasText(Landroid/view/View;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method
