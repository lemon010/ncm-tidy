.class public Lcom/ncm/tidy/TapGuard;
.super Landroid/view/View;


# instance fields
.field private CE:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ncm/tidy/TapGuard;->CE:I

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-static {p0, p1}, Lcom/ncm/tidy/DrawerGuard;->guard(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setChainEnd(I)V
    .locals 0

    iput p1, p0, Lcom/ncm/tidy/TapGuard;->CE:I

    return-void
.end method
