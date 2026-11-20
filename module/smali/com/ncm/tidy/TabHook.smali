.class public Lcom/ncm/tidy/TabHook;
.super Lde/robv/android/xposed/XC_MethodHook;


# static fields
.field public static CODES:[Ljava/lang/String;

.field private static LOGGED:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 10

    :try_start_0
    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_7

    check-cast v0, Ljava/util/List;

    move-object v1, v0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v3, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "getTabCode"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v5, v6, v7}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Ljava/lang/String;

    if-eqz v7, :cond_0

    check-cast v6, Ljava/lang/String;

    aput-object v6, v3, v4

    goto :goto_1

    :cond_0
    const-string v6, "?"

    aput-object v6, v3, v4

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const-string v4, "tab_search"

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v4

    const-string v6, "tab_note"

    invoke-static {v6, v5}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v4, :cond_2

    if-eqz v6, :cond_2

    sput-object v3, Lcom/ncm/tidy/TabHook;->CODES:[Ljava/lang/String;

    goto :goto_3

    :cond_2
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v2, :cond_6

    aget-object v9, v3, v8

    const-string v0, "search"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz v4, :cond_5

    :cond_3
    const-string v0, "social"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz v6, :cond_5

    :cond_4
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_6
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    sput-object v0, Lcom/ncm/tidy/TabHook;->CODES:[Ljava/lang/String;

    invoke-virtual {p1, v5}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_3

    :cond_7
    :goto_3
    return-void
.end method
