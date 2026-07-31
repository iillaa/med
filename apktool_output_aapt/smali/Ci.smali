.class public final LCi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LAi;
.implements LKd;


# instance fields
.field public final synthetic c:LEi;


# direct methods
.method public synthetic constructor <init>(LEi;)V
    .locals 0

    .line 1
    iput-object p1, p0, LCi;->c:LEi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public n(LMd;)V
    .locals 4

    .line 1
    iget-object v0, p0, LCi;->c:LEi;

    .line 2
    .line 3
    iget-object v1, v0, LEi;->a:LHi;

    .line 4
    .line 5
    iget-object v1, v1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroidx/appcompat/widget/Toolbar;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v0, v0, LEi;->b:Landroid/view/Window$Callback;

    .line 12
    .line 13
    const/16 v2, 0x6c

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0, v2, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-interface {v0, v1, v3, p1}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, v2, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public r(LMd;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method
