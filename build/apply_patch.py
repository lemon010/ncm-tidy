from pathlib import Path
import re

source = Path(__file__).parent / 'smali/com/ncm/tidy/DrawerGuard.smali'
text = source.read_text(encoding='utf-8')
assert '.field private static SH:Landroid/view/View;' in text

guard = '''.method public static guard(Landroid/view/View;Landroid/view/MotionEvent;)Z
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
.end method'''

seal = '''.method public static seal(Landroid/view/View;)V
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
.end method'''

sealHost = '''.method private static sealHost(Landroid/view/View;)V
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
.end method'''

for name, method in [('guard', guard), ('seal', seal), ('sealHost', sealHost)]:
    text, count = re.subn(r'(?ms)^\.method [^\n]*\b' + name + r'\([^\n]*\n.*?^\.end method$', lambda _: method, text)
    assert count == 1, name
source.write_text(text, encoding='utf-8', newline='\n')
print('patched guard(seal gate)+findScroll+seal(SH capture)')
