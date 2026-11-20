.class public Lcom/ncm/tidy/SaveBtn;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    sget v1, Lcom/ncm/tidy/Dlg;->CNT:I

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/ncm/tidy/Dlg;->FUNC:[Z

    aget-boolean v1, v1, v0

    sget-object v2, Lcom/ncm/tidy/Dlg;->CB:[Landroid/widget/CheckBox;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v2

    sget-object v3, Lcom/ncm/tidy/Dlg;->KEY:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v1, :cond_0

    invoke-static {v3, v2}, Lcom/ncm/tidy/Prefs;->setBool(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_0
    invoke-static {v3, v2}, Lcom/ncm/tidy/Prefs;->setHidden(Ljava/lang/String;Z)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/ncm/tidy/DrawerGuard;->refresh()V

    :try_start_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    check-cast p1, Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v2, "com.netease.cloudmusic"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_2

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_2
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-static {v2}, Landroid/os/Process;->killProcess(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v4

    :cond_3
    :goto_2
    return-void
.end method
