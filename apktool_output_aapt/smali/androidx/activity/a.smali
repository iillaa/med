.class public final Landroidx/activity/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public final b:LZ2;

.field public c:LNe;

.field public final d:Landroid/window/OnBackInvokedCallback;

.field public e:Landroid/window/OnBackInvokedDispatcher;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/activity/a;->a:Ljava/lang/Runnable;

    .line 5
    .line 6
    new-instance p1, LZ2;

    .line 7
    .line 8
    invoke-direct {p1}, LZ2;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Landroidx/activity/a;->b:LZ2;

    .line 12
    .line 13
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    const/16 v0, 0x21

    .line 16
    .line 17
    if-lt p1, v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x22

    .line 20
    .line 21
    if-lt p1, v0, :cond_0

    .line 22
    .line 23
    sget-object p1, LSe;->a:LSe;

    .line 24
    .line 25
    new-instance v0, LOe;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-direct {v0, p0, v1}, LOe;-><init>(Landroidx/activity/a;I)V

    .line 29
    .line 30
    .line 31
    new-instance v1, LOe;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-direct {v1, p0, v2}, LOe;-><init>(Landroidx/activity/a;I)V

    .line 35
    .line 36
    .line 37
    new-instance v2, LPe;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-direct {v2, p0, v3}, LPe;-><init>(Landroidx/activity/a;I)V

    .line 41
    .line 42
    .line 43
    new-instance v3, LPe;

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    invoke-direct {v3, p0, v4}, LPe;-><init>(Landroidx/activity/a;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0, v1, v2, v3}, LSe;->a(LJ9;LJ9;Ly9;Ly9;)Landroid/window/OnBackInvokedCallback;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget-object p1, LQe;->a:LQe;

    .line 55
    .line 56
    new-instance v0, LPe;

    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    invoke-direct {v0, p0, v1}, LPe;-><init>(Landroidx/activity/a;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, LQe;->a(Ly9;)Landroid/window/OnBackInvokedCallback;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    :goto_0
    iput-object p1, p0, Landroidx/activity/a;->d:Landroid/window/OnBackInvokedCallback;

    .line 67
    .line 68
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(LYc;LNe;)V
    .locals 9

    .line 1
    const-string v0, "owner"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onBackPressedCallback"

    .line 7
    .line 8
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, LYc;->getLifecycle()LTc;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    move-object v0, p1

    .line 16
    check-cast v0, Landroidx/lifecycle/a;

    .line 17
    .line 18
    iget-object v0, v0, Landroidx/lifecycle/a;->c:LSc;

    .line 19
    .line 20
    sget-object v1, LSc;->c:LSc;

    .line 21
    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;-><init>(Landroidx/activity/a;LTc;LNe;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p2, LNe;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/activity/a;->e()V

    .line 36
    .line 37
    .line 38
    new-instance p1, LUe;

    .line 39
    .line 40
    const-class v4, Landroidx/activity/a;

    .line 41
    .line 42
    const-string v5, "updateEnabledCallbacks"

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    const-string v6, "updateEnabledCallbacks()V"

    .line 46
    .line 47
    const/4 v7, 0x0

    .line 48
    const/4 v8, 0x0

    .line 49
    move-object v1, p1

    .line 50
    move-object v3, p0

    .line 51
    invoke-direct/range {v1 .. v8}, LUe;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p2, LNe;->c:Ly9;

    .line 55
    .line 56
    return-void
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/activity/a;->c:LNe;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/activity/a;->b:LZ2;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-interface {v0, v2}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    move-object v3, v2

    .line 27
    check-cast v3, LNe;

    .line 28
    .line 29
    iget-boolean v3, v3, LNe;->a:Z

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move-object v2, v1

    .line 35
    :goto_0
    check-cast v2, LNe;

    .line 36
    .line 37
    :cond_2
    iput-object v1, p0, Landroidx/activity/a;->c:LNe;

    .line 38
    .line 39
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/activity/a;->c:LNe;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/activity/a;->b:LZ2;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-interface {v0, v2}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    move-object v3, v2

    .line 27
    check-cast v3, LNe;

    .line 28
    .line 29
    iget-boolean v3, v3, LNe;->a:Z

    .line 30
    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move-object v2, v1

    .line 35
    :goto_0
    move-object v0, v2

    .line 36
    check-cast v0, LNe;

    .line 37
    .line 38
    :cond_2
    iput-object v1, p0, Landroidx/activity/a;->c:LNe;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-virtual {v0}, LNe;->a()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    iget-object v0, p0, Landroidx/activity/a;->a:Ljava/lang/Runnable;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 51
    .line 52
    .line 53
    :cond_4
    return-void
.end method

.method public final d(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/activity/a;->e:Landroid/window/OnBackInvokedDispatcher;

    iget-object v1, p0, Landroidx/activity/a;->d:Landroid/window/OnBackInvokedCallback;

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    const/4 v2, 0x0

    sget-object v3, LQe;->a:LQe;

    if-eqz p1, :cond_0

    iget-boolean v4, p0, Landroidx/activity/a;->f:Z

    if-nez v4, :cond_0

    invoke-virtual {v3, v0, v2, v1}, LQe;->b(Ljava/lang/Object;ILjava/lang/Object;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/activity/a;->f:Z

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-boolean p1, p0, Landroidx/activity/a;->f:Z

    if-eqz p1, :cond_1

    invoke-virtual {v3, v0, v1}, LQe;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean v2, p0, Landroidx/activity/a;->f:Z

    :cond_1
    :goto_0
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Landroidx/activity/a;->g:Z

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/activity/a;->b:LZ2;

    .line 4
    .line 5
    instance-of v2, v1, Ljava/util/Collection;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, LNe;

    .line 32
    .line 33
    iget-boolean v2, v2, LNe;->a:Z

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    :cond_2
    :goto_0
    iput-boolean v3, p0, Landroidx/activity/a;->g:Z

    .line 39
    .line 40
    if-eq v3, v0, :cond_3

    .line 41
    .line 42
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 43
    .line 44
    const/16 v1, 0x21

    .line 45
    .line 46
    if-lt v0, v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0, v3}, Landroidx/activity/a;->d(Z)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method
