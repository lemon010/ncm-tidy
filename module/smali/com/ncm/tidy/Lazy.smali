.class public Lcom/ncm/tidy/Lazy;
.super Ljava/lang/Object;


# static fields
.field private static DONE:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static hookActivity(Ljava/lang/ClassLoader;)V
    .locals 7

    :try_start_0
    const-string v0, "android.app.Activity"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Lcom/ncm/tidy/ActHook;

    invoke-direct {v3}, Lcom/ncm/tidy/ActHook;-><init>()V

    aput-object v3, v1, v2

    const-string v4, "onResume"

    invoke-static {v0, v4, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v4, "hook activity ok"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    const-string v4, "hook activity FAIL"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookAttach(Ljava/lang/ClassLoader;)V
    .locals 7

    :try_start_0
    const-string v0, "android.app.Instrumentation"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "android.app.Application"

    invoke-static {v1, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lcom/ncm/tidy/InitHook;

    invoke-direct {v4}, Lcom/ncm/tidy/InitHook;-><init>()V

    aput-object v4, v2, v3

    const-string v5, "callApplicationOnCreate"

    invoke-static {v0, v5, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v5, "hook attach ok"

    invoke-static {v5}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v6

    const-string v5, "hook attach FAIL"

    invoke-static {v5}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookDialog(Ljava/lang/ClassLoader;)V
    .locals 6

    :try_start_0
    const-string v0, "android.app.Dialog"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Lcom/ncm/tidy/DialogHook;

    invoke-direct {v3}, Lcom/ncm/tidy/DialogHook;-><init>()V

    aput-object v3, v1, v2

    const-string v3, "show"

    invoke-static {v0, v3, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v3, "hook dialog ok"

    invoke-static {v3}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    const-string v3, "hook dialog FAIL"

    invoke-static {v3}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookScroll(Ljava/lang/ClassLoader;)V
    .locals 7

    :try_start_0
    const-string v0, "com.facebook.react.views.scroll.ReactScrollView"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/view/MotionEvent;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lcom/ncm/tidy/ScrollHook;

    invoke-direct {v4}, Lcom/ncm/tidy/ScrollHook;-><init>()V

    aput-object v4, v2, v3

    const-string v4, "onInterceptTouchEvent"

    invoke-static {v0, v4, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lcom/ncm/tidy/ScrollHook;

    invoke-direct {v4}, Lcom/ncm/tidy/ScrollHook;-><init>()V

    aput-object v4, v2, v3

    const-string v4, "onTouchEvent"

    invoke-static {v0, v4, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v4, "hook scroll ok"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v6

    const-string v4, "hook scroll FAIL"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookSplash(Ljava/lang/ClassLoader;)V
    .locals 8

    :try_start_0
    const-string v0, "p60.l"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "androidx.fragment.app.FragmentActivity"

    invoke-static {v1, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    new-instance v4, Lcom/ncm/tidy/SplashHook;

    invoke-direct {v4}, Lcom/ncm/tidy/SplashHook;-><init>()V

    aput-object v4, v2, v3

    const-string v4, "x"

    invoke-static {v0, v4, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v4, "hook splash ok"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    const-string v4, "hook splash FAIL"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookTab(Ljava/lang/ClassLoader;)V
    .locals 7

    :try_start_0
    const-string v0, "nh0.h"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Lcom/ncm/tidy/TabHook;

    invoke-direct {v3}, Lcom/ncm/tidy/TabHook;-><init>()V

    aput-object v3, v1, v2

    const-string v4, "h"

    invoke-static {v0, v4, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v4, "hook tab ok"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v5

    const-string v4, "hook tab FAIL"

    invoke-static {v4}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static hookTheme(Ljava/lang/ClassLoader;)V
    .locals 5

    :try_start_0
    const-string v0, "com.netease.cloudmusic.utils.in"

    invoke-static {v0, p0}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Lcom/ncm/tidy/ThemeHook;

    invoke-direct {v3}, Lcom/ncm/tidy/ThemeHook;-><init>()V

    aput-object v3, v1, v2

    const-string v3, "H0"

    invoke-static {v0, v3, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-string v3, "hook theme ok"

    invoke-static {v3}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v4

    const-string v3, "hook theme FAIL"

    invoke-static {v3}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static install(Ljava/lang/ClassLoader;)V
    .locals 1

    sget-boolean v0, Lcom/ncm/tidy/Lazy;->DONE:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/ncm/tidy/Lazy;->DONE:Z

    const-string v0, "install start"

    invoke-static {v0}, Lcom/ncm/tidy/Lazy;->log(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookAttach(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookActivity(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookSplash(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookTab(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookScroll(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookDialog(Ljava/lang/ClassLoader;)V

    invoke-static {p0}, Lcom/ncm/tidy/Lazy;->hookTheme(Ljava/lang/ClassLoader;)V

    invoke-static {}, Lcom/ncm/tidy/Watch;->start()V

    :cond_0
    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 2

    const-string v0, "NCMTIDY"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
