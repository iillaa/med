.class public final Lzf;
.super Lf;
.source "SourceFile"

# interfaces
.implements LAf;
.implements LY3;


# instance fields
.field public final f:LY3;


# direct methods
.method public constructor <init>(LY5;LE3;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lf;-><init>(LY5;Z)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, Lzf;->f:LY3;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final N(Ljava/lang/Throwable;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lzf;->f:LY3;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LZg;->f(Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Lf;->e:LY5;

    .line 12
    .line 13
    invoke-static {p2, p1}, Lu6;->o(LY5;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final O(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lfj;

    .line 2
    .line 3
    iget-object p1, p0, Lzf;->f:LY3;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, v0}, LZg;->f(Ljava/lang/Throwable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final a(Ljava/util/concurrent/CancellationException;)V
    .locals 2

    .line 1
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, LI4;

    .line 8
    .line 9
    if-nez v1, :cond_2

    .line 10
    .line 11
    instance-of v1, v0, LAc;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    check-cast v0, LAc;

    .line 16
    .line 17
    invoke-virtual {v0}, LAc;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-nez p1, :cond_1

    .line 25
    .line 26
    new-instance p1, Lvc;

    .line 27
    .line 28
    invoke-virtual {p0}, Lf;->q()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {p1, v0, v1, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-virtual {p0, p1}, Lzf;->o(Ljava/util/concurrent/CancellationException;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    return-void
.end method

.method public final d(Lr5;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lzf;->f:LY3;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, LZg;->d(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    return-object p1
.end method

.method public final f(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lzf;->f:LY3;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LZg;->f(Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    return p1
.end method

.method public final iterator()LC3;
    .locals 1

    .line 1
    iget-object v0, p0, Lzf;->f:LY3;

    .line 2
    .line 3
    invoke-interface {v0}, LSf;->iterator()LC3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public final o(Ljava/util/concurrent/CancellationException;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lzf;->f:LY3;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LSf;->a(Ljava/util/concurrent/CancellationException;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, LBc;->n(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
