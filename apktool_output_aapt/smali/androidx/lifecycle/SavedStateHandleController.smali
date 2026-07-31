.class public final Landroidx/lifecycle/SavedStateHandleController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:LAg;

.field public e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LAg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/lifecycle/SavedStateHandleController;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/lifecycle/SavedStateHandleController;->d:LAg;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(LTc;LGg;)V
    .locals 2

    .line 1
    const-string v0, "registry"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lifecycle"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Landroidx/lifecycle/SavedStateHandleController;->e:Z

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    xor-int/2addr v0, v1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iput-boolean v1, p0, Landroidx/lifecycle/SavedStateHandleController;->e:Z

    .line 18
    .line 19
    invoke-virtual {p1, p0}, LTc;->a(LXc;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Landroidx/lifecycle/SavedStateHandleController;->d:LAg;

    .line 23
    .line 24
    iget-object p1, p1, LAg;->e:LFg;

    .line 25
    .line 26
    iget-object v0, p0, Landroidx/lifecycle/SavedStateHandleController;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p1}, LGg;->c(Ljava/lang/String;LFg;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    const-string p2, "Already attached to lifecycleOwner"

    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p1
.end method

.method public final d(LYc;LRc;)V
    .locals 1

    .line 1
    sget-object v0, LRc;->ON_DESTROY:LRc;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    iput-boolean p2, p0, Landroidx/lifecycle/SavedStateHandleController;->e:Z

    .line 7
    .line 8
    invoke-interface {p1}, LYc;->getLifecycle()LTc;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, p0}, LTc;->b(LXc;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
