.class public Lcom/ncm/tidy/Watch;
.super Ljava/lang/Object;


# static fields
.field private static BOOT:I

.field private static CUR:Ljava/lang/ref/WeakReference;

.field private static H:Landroid/os/Handler;

.field private static R:Ljava/lang/Runnable;

.field private static TICK:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static act()Landroid/app/Activity;
    .locals 1

    sget-object v0, Lcom/ncm/tidy/Watch;->CUR:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static apply()V
    .locals 4

    :try_start_0
    invoke-static {}, Lcom/ncm/tidy/Watch;->act()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/ncm/tidy/Prefs;->initWith(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/ncm/tidy/Watch;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/ncm/tidy/SettingEntry;->attach(Landroid/app/Activity;)V

    invoke-static {v1}, Lcom/ncm/tidy/DrawerGuard;->scan(Landroid/view/View;)V

    invoke-static {v1}, Lcom/ncm/tidy/DrawerGuard;->seal(Landroid/view/View;)V

    invoke-static {v0}, Lcom/ncm/tidy/TabNav;->apply(Landroid/app/Activity;)V

    invoke-static {v0}, Lcom/ncm/tidy/MinibarGuard;->apply(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method private static decor(Landroid/app/Activity;)Landroid/view/View;
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static loop()V
    .locals 5

    :try_start_0
    invoke-static {}, Lcom/ncm/tidy/Watch;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    sget-object v0, Lcom/ncm/tidy/Watch;->H:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v1, Lcom/ncm/tidy/Watch;->R:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    const-wide/16 v2, 0x2bc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public static onResume(Landroid/app/Activity;)V
    .locals 2

    if-eqz p0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/ncm/tidy/Watch;->CUR:Ljava/lang/ref/WeakReference;

    :cond_0
    const/16 v0, 0x28

    sput v0, Lcom/ncm/tidy/Watch;->BOOT:I

    invoke-static {}, Lcom/ncm/tidy/Watch;->start()V

    invoke-static {}, Lcom/ncm/tidy/Watch;->apply()V

    return-void
.end method

.method public static run()V
    .locals 3

    :try_start_0
    sget v0, Lcom/ncm/tidy/Watch;->BOOT:I

    if-lez v0, :cond_0

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/ncm/tidy/Watch;->BOOT:I

    invoke-static {}, Lcom/ncm/tidy/Watch;->act()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/ncm/tidy/Watch;->tick(Landroid/app/Activity;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/ncm/tidy/Watch;->act()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/ncm/tidy/DrawerGuard;->refresh()V

    invoke-static {v1}, Lcom/ncm/tidy/TabNav;->apply(Landroid/app/Activity;)V

    sget v2, Lcom/ncm/tidy/Watch;->TICK:I

    and-int/lit8 v2, v2, 0x0

    if-nez v2, :cond_1

    invoke-static {}, Lcom/ncm/tidy/Watch;->act()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lcom/ncm/tidy/Watch;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lcom/ncm/tidy/DrawerGuard;->scan(Landroid/view/View;)V

    invoke-static {v2}, Lcom/ncm/tidy/DrawerGuard;->seal(Landroid/view/View;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    :goto_0
    sget v0, Lcom/ncm/tidy/Watch;->TICK:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/ncm/tidy/Watch;->TICK:I

    return-void
.end method

.method public static start()V
    .locals 5

    sget-object v0, Lcom/ncm/tidy/Watch;->R:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/ncm/tidy/Watch;->H:Landroid/os/Handler;

    new-instance v1, Lcom/ncm/tidy/Watch$1;

    invoke-direct {v1}, Lcom/ncm/tidy/Watch$1;-><init>()V

    sput-object v1, Lcom/ncm/tidy/Watch;->R:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2bc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private static tick(Landroid/app/Activity;)V
    .locals 3

    if-eqz p0, :cond_0

    invoke-static {p0}, Lcom/ncm/tidy/Watch;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/ncm/tidy/SettingEntry;->attach(Landroid/app/Activity;)V

    invoke-static {v0}, Lcom/ncm/tidy/DrawerGuard;->scan(Landroid/view/View;)V

    invoke-static {v0}, Lcom/ncm/tidy/DrawerGuard;->seal(Landroid/view/View;)V

    invoke-static {p0}, Lcom/ncm/tidy/TabNav;->selectMine(Landroid/app/Activity;)V

    invoke-static {p0}, Lcom/ncm/tidy/MinibarGuard;->apply(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method
