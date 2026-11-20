.class public Lcom/ncm/tidy/DrawerGuard;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewGroup$OnHierarchyChangeListener;


# static fields
.field private static SH:Landroid/view/View;

.field public static final WATCHED:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ncm/tidy/DrawerGuard;->WATCHED:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static anyHidden()Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/ncm/tidy/RowList;->PRESET:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v0, v1, v3

    invoke-static {v0}, Lcom/ncm/tidy/Prefs;->hidden(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static applyChildren(Landroid/view/ViewGroup;)V
    .locals 8

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lcom/ncm/tidy/DrawerGuard;->wantHideView(Landroid/view/View;)Z

    move-result v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    if-gtz v6, :cond_0

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    :cond_0
    if-eqz v5, :cond_1

    const/16 v7, 0x8

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    add-int/2addr v2, v6

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Landroid/view/View;->setVisibility(I)V

    neg-int v7, v2

    int-to-float v7, v7

    invoke-virtual {v3, v7}, Landroid/view/View;->setTranslationY(F)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/ncm/tidy/DrawerGuard;->anyHidden()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/ncm/tidy/DrawerGuard;->hideThin(Landroid/view/View;I)V

    :cond_3
    return-void
.end method

.method public static firstText(Landroid/view/View;)Ljava/lang/String;
    .locals 4

    if-eqz p0, :cond_2

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    return-object v0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lcom/ncm/tidy/DrawerGuard;->firstText(Landroid/view/View;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static guard(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 14

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I
    move-result v0
    if-eqz v0, :down
    const/4 v0, 0x1
    return v0

    :down
    :try_start
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    check-cast v0, Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F
    move-result v1
    float-to-int v1, v1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F
    move-result v2
    float-to-int v2, v2
    const/4 v3, 0x2
    new-array v3, v3, [I
    new-instance v4, Landroid/graphics/Rect;
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    sget-object v12, Lcom/ncm/tidy/DrawerGuard;->SH:Landroid/view/View;
    if-eqz v12, :gate_done
    invoke-static {v12, v0}, Lcom/ncm/tidy/DrawerGuard;->inHost(Landroid/view/View;Landroid/view/View;)Z
    move-result v13
    if-eqz v13, :gate_done
    invoke-static {v12, v1, v2, v3, v4}, Lcom/ncm/tidy/DrawerGuard;->hitVisible(Landroid/view/View;II[ILandroid/graphics/Rect;)Z
    move-result v13
    if-nez v13, :gate_done
    const/4 v0, 0x0
    return v0

    :gate_done
    sget-object v5, Lcom/ncm/tidy/DrawerGuard;->WATCHED:Ljava/util/ArrayList;
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I
    move-result v6
    const/4 v7, 0x0

    :next_list
    add-int/lit8 v6, v6, -0x1
    if-ltz v6, :done
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Landroid/view/ViewGroup;
    invoke-static {v8, v0}, Lcom/ncm/tidy/DrawerGuard;->inHost(Landroid/view/View;Landroid/view/View;)Z
    move-result v9
    if-eqz v9, :next_list
    invoke-static {v8, v1, v2, v3, v4}, Lcom/ncm/tidy/DrawerGuard;->hitVisible(Landroid/view/View;II[ILandroid/graphics/Rect;)Z
    move-result v9
    if-eqz v9, :next_list
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v9

    :next_child
    add-int/lit8 v9, v9, -0x1
    if-ltz v9, :next_list
    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v10
    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I
    move-result v11
    if-nez v11, :hidden_child
    invoke-static {v10, v1, v2, v3, v4}, Lcom/ncm/tidy/DrawerGuard;->hitVisible(Landroid/view/View;II[ILandroid/graphics/Rect;)Z
    move-result v11
    if-eqz v11, :next_child
    goto :pass

    :hidden_child
    if-nez v7, :next_child
    invoke-static {v10}, Lcom/ncm/tidy/DrawerGuard;->wantHideView(Landroid/view/View;)Z
    move-result v7
    goto :next_child

    :done
    return v7
    :try_end
    .catchall {:try_start .. :try_end} :error

    :error
    move-exception v0
    const/4 v0, 0x1
    return v0

    :pass
    const/4 v0, 0x0
    return v0
.end method

.method private static findScroll(Landroid/view/View;)Landroid/view/View;
    .locals 3

    :loop
    if-eqz p0, :none
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v1, v0, Landroid/view/View;
    if-eqz v1, :none
    check-cast v0, Landroid/view/View;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "ReactScrollView"
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v2
    if-nez v2, :found
    move-object p0, v0
    goto :loop

    :found
    return-object v0

    :none
    const/4 v0, 0x0
    return-object v0
.end method

.method private static hitVisible(Landroid/view/View;II[ILandroid/graphics/Rect;)Z
    .locals 4

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :miss
    invoke-virtual {p0, p4}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z
    move-result v0
    if-eqz v0, :miss
    invoke-virtual {p0, p3}, Landroid/view/View;->getLocationOnScreen([I)V
    const/4 v0, 0x0
    aget v1, p3, v0
    const/4 v0, 0x1
    aget v2, p3, v0
    sub-int v1, p1, v1
    sub-int v2, p2, v2
    invoke-virtual {p4, v1, v2}, Landroid/graphics/Rect;->contains(II)Z
    move-result v0
    return v0

    :miss
    const/4 v0, 0x0
    return v0
.end method

.method private static inHost(Landroid/view/View;Landroid/view/View;)Z
    .locals 2

    :next
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v1, v0, Landroid/view/View;
    if-eqz v1, :no
    if-eq v0, p1, :yes
    move-object p0, v0
    check-cast p0, Landroid/view/View;
    goto :next

    :yes
    const/4 v0, 0x1
    return v0

    :no
    const/4 v0, 0x0
    return v0
.end method

.method private static hitVisible(Landroid/view/View;II[ILandroid/graphics/Rect;)Z
    .locals 4

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z
    move-result v0
    if-eqz v0, :miss
    invoke-virtual {p0, p4}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z
    move-result v0
    if-eqz v0, :miss
    invoke-virtual {p0, p3}, Landroid/view/View;->getLocationOnScreen([I)V
    const/4 v0, 0x0
    aget v1, p3, v0
    const/4 v0, 0x1
    aget v2, p3, v0
    sub-int v1, p1, v1
    sub-int v2, p2, v2
    invoke-virtual {p4, v1, v2}, Landroid/graphics/Rect;->contains(II)Z
    move-result v0
    return v0

    :miss
    const/4 v0, 0x0
    return v0
.end method

.method private static inHost(Landroid/view/View;Landroid/view/View;)Z
    .locals 2

    :next
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    instance-of v1, v0, Landroid/view/View;
    if-eqz v1, :no
    if-eq v0, p1, :yes
    move-object p0, v0
    check-cast p0, Landroid/view/View;
    goto :next

    :yes
    const/4 v0, 0x1
    return v0

    :no
    const/4 v0, 0x0
    return v0
.end method

.method private static hideThin(Landroid/view/View;I)V
    .locals 6

    if-eqz p0, :cond_1

    const/4 v0, 0x3

    if-gt p1, v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    const/16 v2, 0x64

    if-lt v1, v2, :cond_0

    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    invoke-static {v3, v4}, Lcom/ncm/tidy/DrawerGuard;->hideThin(Landroid/view/View;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method private static isPreset(Ljava/lang/String;)Z
    .locals 4

    if-eqz p0, :cond_1

    sget-object v0, Lcom/ncm/tidy/RowList;->PRESET:[Ljava/lang/String;

    array-length v3, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static isVip(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :cond_0

    const-string v0, "\u7279\u6743\u7b49\u4f60\u89e3\u9501"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "SVIP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u9650\u65f6\u798f\u5229"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u7acb\u4eab\u7279\u60e0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u5c0a\u4eab\u7279\u6743"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u4f18\u60e0\u5f00\u901a"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u9886\u4f1a\u5458"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u7279\u6743\u5df2\u5931\u6548"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u4e13\u5c5e\u7279\u60e0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u6bcf\u65e5\u6253\u5361"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u7eed\u8d39\u6062\u590d"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static presetText(Landroid/view/View;I)Ljava/lang/String;
    .locals 6

    const/16 v0, 0x8

    if-gt p1, v0, :cond_2

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ncm/tidy/DrawerGuard;->isPreset(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    add-int/lit8 v5, p1, 0x1

    invoke-static {v3, v5}, Lcom/ncm/tidy/DrawerGuard;->presetText(Landroid/view/View;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static refresh()V
    .locals 4

    :try_start_0
    sget-object v0, Lcom/ncm/tidy/DrawerGuard;->WATCHED:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v3}, Lcom/ncm/tidy/DrawerGuard;->applyChildren(Landroid/view/ViewGroup;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method public static scan(Landroid/view/View;)V
    .locals 2

    if-eqz p0, :cond_0

    :try_start_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/ncm/tidy/DrawerGuard;->walk(Landroid/view/View;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method public static seal(Landroid/view/View;)V
    .locals 6

    if-eqz p0, :done
    :try_start
    sget-object v0, Lcom/ncm/tidy/DrawerGuard;->WATCHED:Ljava/util/ArrayList;
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    move-result v1

    :next_list
    add-int/lit8 v1, v1, -0x1
    if-ltz v1, :done
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z
    move-result v3
    if-eqz v3, :next_list
    invoke-static {v2, p0}, Lcom/ncm/tidy/DrawerGuard;->inHost(Landroid/view/View;Landroid/view/View;)Z
    move-result v3
    if-eqz v3, :next_list

    invoke-static {v2}, Lcom/ncm/tidy/DrawerGuard;->findScroll(Landroid/view/View;)Landroid/view/View;
    move-result-object v3
    sput-object v3, Lcom/ncm/tidy/DrawerGuard;->SH:Landroid/view/View;

    :parent
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v3
    instance-of v4, v3, Landroid/view/View;
    if-eqz v4, :next_list
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v4
    const-string v5, "DrawerLayout"
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v4
    if-nez v4, :mount
    move-object v2, v3
    check-cast v2, Landroid/view/View;
    goto :parent

    :mount
    invoke-static {v2}, Lcom/ncm/tidy/DrawerGuard;->sealHost(Landroid/view/View;)V
    :try_end
    .catchall {:try_start .. :try_end} :error

    :done
    return-void

    :error
    move-exception v0
    return-void
.end method

.method private static sealHost(Landroid/view/View;)V
    .locals 5

    :try_start
    instance-of v0, p0, Landroid/widget/FrameLayout;
    if-eqz v0, :done
    check-cast p0, Landroid/widget/FrameLayout;
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    add-int/lit8 v1, v0, -0x1

    :find_guard
    if-ltz v1, :mount
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    instance-of v3, v2, Lcom/ncm/tidy/TapGuard;
    if-nez v3, :guard_found
    add-int/lit8 v1, v1, -0x1
    goto :find_guard

    :guard_found
    add-int/lit8 v0, v0, -0x1
    if-eq v1, v0, :done
    invoke-virtual {v2}, Landroid/view/View;->bringToFront()V
    goto :done

    :mount
    new-instance v2, Lcom/ncm/tidy/TapGuard;
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v3
    invoke-direct {v2, v3}, Lcom/ncm/tidy/TapGuard;-><init>(Landroid/content/Context;)V
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;
    const/4 v4, -0x1
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end
    .catchall {:try_start .. :try_end} :error

    :done
    return-void

    :error
    move-exception v0
    return-void
.end method

.method private static vipText(Landroid/view/View;I)Ljava/lang/String;
    .locals 6

    const/16 v0, 0xa

    if-gt p1, v0, :cond_2

    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ncm/tidy/DrawerGuard;->isVip(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    add-int/lit8 v5, p1, 0x1

    invoke-static {v3, v5}, Lcom/ncm/tidy/DrawerGuard;->vipText(Landroid/view/View;I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private static walk(Landroid/view/View;I)V
    .locals 8

    const/16 v0, 0x40

    if-gt p1, v0, :cond_3

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    move-object v1, v0

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_2

    const/16 v3, 0x3c

    if-gt v2, v3, :cond_2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-static {v5}, Lcom/ncm/tidy/DrawerGuard;->firstText(Landroid/view/View;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/ncm/tidy/DrawerGuard;->isPreset(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    add-int/lit8 v4, v4, 0x1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x4

    if-lt v4, v3, :cond_2

    sget-object v3, Lcom/ncm/tidy/DrawerGuard;->WATCHED:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v6, Lcom/ncm/tidy/DrawerGuard;

    invoke-direct {v6}, Lcom/ncm/tidy/DrawerGuard;-><init>()V

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    invoke-static {v1}, Lcom/ncm/tidy/DrawerGuard;->applyChildren(Landroid/view/ViewGroup;)V

    :cond_2
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_3

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    add-int/lit8 v6, p1, 0x1

    invoke-static {v5, v6}, Lcom/ncm/tidy/DrawerGuard;->walk(Landroid/view/View;I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private static wantHide(Ljava/lang/String;)Z
    .locals 2

    if-eqz p0, :cond_1

    invoke-static {p0}, Lcom/ncm/tidy/DrawerGuard;->isVip(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "drawer_vip"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-static {p0}, Lcom/ncm/tidy/Prefs;->hidden(Ljava/lang/String;)Z

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static wantHideView(Landroid/view/View;)Z
    .locals 4

    invoke-static {p0}, Lcom/ncm/tidy/DrawerGuard;->firstText(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ncm/tidy/DrawerGuard;->wantHide(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    return v1

    :cond_0
    const/4 v2, 0x0

    invoke-static {p0, v2}, Lcom/ncm/tidy/DrawerGuard;->presetText(Landroid/view/View;I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lcom/ncm/tidy/Prefs;->hidden(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    return v1

    :cond_1
    const/4 v2, 0x0

    invoke-static {p0, v2}, Lcom/ncm/tidy/DrawerGuard;->vipText(Landroid/view/View;I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string v2, "drawer_vip"

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v1, 0x1

    return v1

    :cond_2
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public onChildViewAdded(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/ncm/tidy/DrawerGuard;->applyChildren(Landroid/view/ViewGroup;)V

    :cond_0
    return-void
.end method

.method public onChildViewRemoved(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p1}, Lcom/ncm/tidy/DrawerGuard;->applyChildren(Landroid/view/ViewGroup;)V

    :cond_0
    return-void
.end method
