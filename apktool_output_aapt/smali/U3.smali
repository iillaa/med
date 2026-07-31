.class public final LU3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:LV3;

.field public final synthetic d:Landroid/view/MenuItem;

.field public final synthetic e:LMd;

.field public final synthetic f:Li0;


# direct methods
.method public constructor <init>(Li0;LV3;LTd;LMd;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU3;->f:Li0;

    .line 5
    .line 6
    iput-object p2, p0, LU3;->c:LV3;

    .line 7
    .line 8
    iput-object p3, p0, LU3;->d:Landroid/view/MenuItem;

    .line 9
    .line 10
    iput-object p4, p0, LU3;->e:LMd;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, LU3;->c:LV3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, LU3;->f:Li0;

    .line 6
    .line 7
    iget-object v2, v1, Li0;->d:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, LW3;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    iput-boolean v3, v2, LW3;->C:Z

    .line 13
    .line 14
    iget-object v0, v0, LV3;->b:LMd;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v2}, LMd;->c(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, v1, Li0;->d:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, LW3;

    .line 23
    .line 24
    iput-boolean v2, v0, LW3;->C:Z

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, LU3;->d:Landroid/view/MenuItem;

    .line 27
    .line 28
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-interface {v0}, Landroid/view/MenuItem;->hasSubMenu()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    iget-object v2, p0, LU3;->e:LMd;

    .line 42
    .line 43
    const/4 v3, 0x4

    .line 44
    invoke-virtual {v2, v0, v1, v3}, LMd;->q(Landroid/view/MenuItem;Lie;I)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method
