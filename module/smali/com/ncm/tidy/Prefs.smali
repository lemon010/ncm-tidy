.class public Lcom/ncm/tidy/Prefs;
.super Ljava/lang/Object;


# static fields
.field public static APP:Landroid/content/Context;

.field public static SP:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBool(Ljava/lang/String;Z)Z
    .locals 3

    invoke-static {}, Lcom/ncm/tidy/Prefs;->sp()Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v1

    :cond_0
    return p1
.end method

.method public static hidden(Ljava/lang/String;)Z
    .locals 3

    if-eqz p0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hide:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static initWith(Landroid/content/Context;)V
    .locals 1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    sput-object v0, Lcom/ncm/tidy/Prefs;->APP:Landroid/content/Context;

    goto :goto_0

    :cond_0
    sput-object p0, Lcom/ncm/tidy/Prefs;->APP:Landroid/content/Context;

    :cond_1
    :goto_0
    return-void
.end method

.method public static setBool(Ljava/lang/String;Z)V
    .locals 3

    invoke-static {}, Lcom/ncm/tidy/Prefs;->sp()Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method public static setHidden(Ljava/lang/String;Z)V
    .locals 2

    if-eqz p0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hide:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/ncm/tidy/Prefs;->setBool(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public static sp()Landroid/content/SharedPreferences;
    .locals 3

    sget-object v0, Lcom/ncm/tidy/Prefs;->SP:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    sget-object v0, Lcom/ncm/tidy/Prefs;->APP:Landroid/content/Context;

    if-eqz v0, :cond_1

    :try_start_0
    const-string v1, "ncm_tidy"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/ncm/tidy/Prefs;->SP:Landroid/content/SharedPreferences;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    return-object v0

    :catchall_0
    move-exception v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
