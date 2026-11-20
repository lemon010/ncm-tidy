.class public Lcom/ncm/tidy/DialogHook;
.super Lde/robv/android/xposed/XC_MethodHook;


# static fields
.field private static final IDS:[I
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ncm/tidy/DialogHook;->IDS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f09512f
        0x7f095134
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method

.method private static isUpdateDialog(Landroid/app/Dialog;)Z
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "update_block"

    const/4 v4, 0x1

    invoke-static {v1, v4}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_1

    move-object v3, v2

    check-cast v3, Landroid/view/View;

    sget-object v4, Lcom/ncm/tidy/DialogHook;->IDS:[I

    array-length v5, v4

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_1

    aget v1, v4, v6

    invoke-virtual {v3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    :goto_1
    return v0
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 6

    :try_start_0
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Dialog;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Landroid/app/Dialog;

    invoke-static {v1}, Lcom/ncm/tidy/DialogHook;->isUpdateDialog(Landroid/app/Dialog;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    const-string v2, "NCMTIDY"

    const-string v3, "blocked update dialog"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method
