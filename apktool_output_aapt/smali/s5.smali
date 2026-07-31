.class public abstract Ls5;
.super Lo3;
.source "SourceFile"


# instance fields
.field public final d:LY5;

.field public transient e:Lr5;


# direct methods
.method public constructor <init>(Lr5;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 1
    invoke-interface {p1}, Lr5;->getContext()LY5;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Ls5;-><init>(Lr5;LY5;)V

    return-void
.end method

.method public constructor <init>(Lr5;LY5;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lo3;-><init>(Lr5;)V

    iput-object p2, p0, Ls5;->d:LY5;

    return-void
.end method


# virtual methods
.method public getContext()LY5;
    .locals 1

    .line 1
    iget-object v0, p0, Ls5;->d:LY5;

    .line 2
    .line 3
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ls5;->e:Lr5;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eq v0, p0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ls5;->getContext()LY5;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lt5;->d:Lt5;

    .line 12
    .line 13
    invoke-interface {v1, v2}, LY5;->c(LX5;)LW5;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Llc;->e(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    check-cast v1, Lu5;

    .line 21
    .line 22
    check-cast v0, LO6;

    .line 23
    .line 24
    :cond_0
    sget-object v1, LO6;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v3, Llc;->c:Li0;

    .line 31
    .line 32
    if-eq v2, v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    instance-of v1, v0, LP3;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    check-cast v0, LP3;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, LP3;->m()V

    .line 49
    .line 50
    .line 51
    :cond_2
    sget-object v0, LH4;->d:LH4;

    .line 52
    .line 53
    iput-object v0, p0, Ls5;->e:Lr5;

    .line 54
    .line 55
    return-void
.end method
