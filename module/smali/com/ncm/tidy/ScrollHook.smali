.class public Lcom/ncm/tidy/ScrollHook;
.super Lde/robv/android/xposed/XC_MethodHook;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method

.method private static isDrawer(Landroid/view/View;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    move-object v1, p0

    const/4 v2, 0x0

    :goto_0
    if-eqz v1, :cond_1

    const/16 v3, 0x30

    if-ge v2, v3, :cond_1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ScrimInsetsFrameLayout"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v5, v3, Landroid/view/View;

    if-eqz v5, :cond_1

    move-object v1, v3

    check-cast v1, Landroid/view/View;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 3

    :try_start_0
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lcom/ncm/tidy/ScrollHook;->isDrawer(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, v2}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method
