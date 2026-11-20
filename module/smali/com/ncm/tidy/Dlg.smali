.class public Lcom/ncm/tidy/Dlg;
.super Ljava/lang/Object;


# static fields
.field public static CB:[Landroid/widget/CheckBox;

.field public static CNT:I

.field public static FUNC:[Z

.field public static KEY:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static header(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const v1, -0xcccccd

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    const/4 v1, 0x0

    const/16 v2, 0x18

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private static item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 8

    if-nez p3, :cond_0

    move-object p3, p2

    :cond_0
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-static {p2}, Lcom/ncm/tidy/Glyph;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41900000    # 18.0f

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz p4, :cond_1

    invoke-static {p3, p5}, Lcom/ncm/tidy/Prefs;->getBool(Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0

    :cond_1
    invoke-static {p2}, Lcom/ncm/tidy/Prefs;->hidden(Ljava/lang/String;)Z

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    sget-object v1, Lcom/ncm/tidy/Dlg;->CB:[Landroid/widget/CheckBox;

    sget v2, Lcom/ncm/tidy/Dlg;->CNT:I

    aput-object v0, v1, v2

    sget-object v1, Lcom/ncm/tidy/Dlg;->KEY:[Ljava/lang/String;

    aput-object p3, v1, v2

    sget-object v1, Lcom/ncm/tidy/Dlg;->FUNC:[Z

    aput-boolean p4, v1, v2

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/ncm/tidy/Dlg;->CNT:I

    return-void
.end method

.method public static show(Landroid/content/Context;)V
    .locals 8

    :try_start_0
    move-object v7, p0

    const/16 v0, 0x24

    new-array v0, v0, [Landroid/widget/CheckBox;

    sput-object v0, Lcom/ncm/tidy/Dlg;->CB:[Landroid/widget/CheckBox;

    const/16 v0, 0x24

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/ncm/tidy/Dlg;->KEY:[Ljava/lang/String;

    const/16 v0, 0x24

    new-array v0, v0, [Z

    sput-object v0, Lcom/ncm/tidy/Dlg;->FUNC:[Z

    const/4 v0, 0x0

    sput v0, Lcom/ncm/tidy/Dlg;->CNT:I

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v7}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x30

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    const-string v2, "\u529f\u80fd"

    invoke-static {v0, v7, v2}, Lcom/ncm/tidy/Dlg;->header(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;)V

    const-string v2, "\u62e6\u622a\u5f00\u5c4f\u5e7f\u544a"

    const-string v3, "splash_block"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u663e\u793a\u641c\u7d22\u6807\u7b7e"

    const-string v3, "tab_search"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u663e\u793a\u7b14\u8bb0\u6807\u7b7e"

    const-string v3, "tab_note"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u663e\u793a\u62bd\u5c49VIP\u533a\u5757"

    const-string v3, "drawer_vip"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u542f\u52a8\u9ed8\u8ba4\u663e\u793a\u6211\u7684"

    const-string v3, "start_mine"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u62e6\u622a\u7248\u672c\u66f4\u65b0\u5f39\u7a97"

    const-string v3, "update_block"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u5c4f\u853d\u64ad\u653e\u5668\u4e0a\u65b9\u5e7f\u544a\u6761"

    const-string v3, "bar_hide"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u8ddf\u968f\u7cfb\u7edf\u6df1\u6d45\u8272"

    const-string v3, "theme_sync"

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v1, v7

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    const-string v2, "\u5c4f\u853d\u9879"

    invoke-static {v0, v7, v2}, Lcom/ncm/tidy/Dlg;->header(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;)V

    const/4 v6, 0x0

    :goto_0
    sget-object v2, Lcom/ncm/tidy/RowList;->PRESET:[Ljava/lang/String;

    array-length v3, v2

    if-ge v6, v3, :cond_0

    aget-object v2, v2, v6

    move-object v1, v7

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/ncm/tidy/Dlg;->item(Landroid/widget/LinearLayout;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v7}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u7f51\u6613\u4e91\u7cbe\u7b80"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u4fdd\u5b58\u5e76\u91cd\u542f"

    new-instance v3, Lcom/ncm/tidy/SaveBtn;

    invoke-direct {v3}, Lcom/ncm/tidy/SaveBtn;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u5173\u95ed"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    const-string v1, "NCMTIDY"

    const-string v2, "dlg fail"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method
