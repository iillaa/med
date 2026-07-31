.class public final LDi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhe;


# instance fields
.field public c:Z

.field public final synthetic d:LEi;


# direct methods
.method public constructor <init>(LEi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LDi;->d:LEi;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(LMd;Z)V
    .locals 2

    .line 1
    iget-boolean p2, p0, LDi;->c:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p2, 0x1

    .line 7
    iput-boolean p2, p0, LDi;->c:Z

    .line 8
    .line 9
    iget-object p2, p0, LDi;->d:LEi;

    .line 10
    .line 11
    iget-object v0, p2, LEi;->a:LHi;

    .line 12
    .line 13
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 14
    .line 15
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->v:Lj0;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lj0;->f()Z

    .line 24
    .line 25
    .line 26
    iget-object v0, v0, Lj0;->v:Le0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lbe;->b()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v0, v0, Lbe;->j:LYd;

    .line 37
    .line 38
    invoke-interface {v0}, Lgh;->dismiss()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p2, p2, LEi;->b:Landroid/view/Window$Callback;

    .line 42
    .line 43
    const/16 v0, 0x6c

    .line 44
    .line 45
    invoke-interface {p2, v0, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 46
    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput-boolean p1, p0, LDi;->c:Z

    .line 50
    .line 51
    return-void
.end method

.method public final u(LMd;)Z
    .locals 2

    .line 1
    iget-object v0, p0, LDi;->d:LEi;

    .line 2
    .line 3
    iget-object v0, v0, LEi;->b:Landroid/view/Window$Callback;

    .line 4
    .line 5
    const/16 v1, 0x6c

    .line 6
    .line 7
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    return p1
.end method
