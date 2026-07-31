.class final Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;
.implements LN3;


# instance fields
.field public final c:LTc;

.field public final d:LNe;

.field public e:LTe;

.field public final synthetic f:Landroidx/activity/a;


# direct methods
.method public constructor <init>(Landroidx/activity/a;LTc;LNe;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onBackPressedCallback"

    .line 5
    .line 6
    invoke-static {v0, p3}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->f:Landroidx/activity/a;

    .line 10
    .line 11
    iput-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:LTc;

    .line 12
    .line 13
    iput-object p3, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->d:LNe;

    .line 14
    .line 15
    invoke-virtual {p2, p0}, LTc;->a(LXc;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:LTc;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, LTc;->b(LXc;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->d:LNe;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, LNe;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->e:LTe;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, LTe;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->e:LTe;

    .line 25
    .line 26
    return-void
.end method

.method public final d(LYc;LRc;)V
    .locals 9

    .line 1
    sget-object p1, LRc;->ON_START:LRc;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->f:Landroidx/activity/a;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->d:LNe;

    .line 11
    .line 12
    const-string p2, "onBackPressedCallback"

    .line 13
    .line 14
    invoke-static {p2, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, v2, Landroidx/activity/a;->b:LZ2;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, LZ2;->addLast(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance p2, LTe;

    .line 23
    .line 24
    invoke-direct {p2, v2, p1}, LTe;-><init>(Landroidx/activity/a;LNe;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, LNe;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Landroidx/activity/a;->e()V

    .line 33
    .line 34
    .line 35
    new-instance v8, LUe;

    .line 36
    .line 37
    const-string v5, "updateEnabledCallbacks()V"

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    const/4 v1, 0x0

    .line 41
    const-class v3, Landroidx/activity/a;

    .line 42
    .line 43
    const-string v4, "updateEnabledCallbacks"

    .line 44
    .line 45
    const/4 v7, 0x1

    .line 46
    move-object v0, v8

    .line 47
    invoke-direct/range {v0 .. v7}, LUe;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    iput-object v8, p1, LNe;->c:Ly9;

    .line 51
    .line 52
    iput-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->e:LTe;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    sget-object p1, LRc;->ON_STOP:LRc;

    .line 56
    .line 57
    if-ne p2, p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->e:LTe;

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p1}, LTe;->cancel()V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    sget-object p1, LRc;->ON_DESTROY:LRc;

    .line 68
    .line 69
    if-ne p2, p1, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->cancel()V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method
