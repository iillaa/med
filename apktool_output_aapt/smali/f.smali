.class public abstract Lf;
.super LBc;
.source "SourceFile"

# interfaces
.implements Lr5;
.implements Lh6;


# instance fields
.field public final e:LY5;


# direct methods
.method public constructor <init>(LY5;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, LBc;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lt5;->g:Lt5;

    .line 5
    .line 6
    invoke-interface {p1, p2}, LY5;->c(LX5;)LW5;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Luc;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, LBc;->z(Luc;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p0}, LY5;->k(LY5;)LY5;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lf;->e:LY5;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final G(Ljava/lang/Object;)V
    .locals 2

    .line 1
    instance-of v0, p1, LI4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, LI4;

    .line 6
    .line 7
    iget-object v0, p1, LI4;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    sget-object v1, LI4;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    :goto_0
    invoke-virtual {p0, v0, p1}, Lf;->N(Ljava/lang/Throwable;Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p0, p1}, Lf;->O(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :goto_1
    return-void
.end method

.method public N(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public O(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final P(Lk6;Lf;LN9;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Lfj;->a:Lfj;

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p1, v1, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p1, v1, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    iget-object p1, p0, Lf;->e:LY5;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p1, v0}, Lr3;->J(LY5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    invoke-static {v1, p3}, LSi;->b(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p3, p2, p0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    :try_start_2
    invoke-static {p1, v0}, Lr3;->D(LY5;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    sget-object p1, Li6;->c:Li6;

    .line 36
    .line 37
    if-eq p2, p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0, p2}, Lf;->h(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_0

    .line 45
    :catchall_1
    move-exception p2

    .line 46
    :try_start_3
    invoke-static {p1, v0}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lf;->h(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    new-instance p1, LJ4;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 61
    .line 62
    .line 63
    throw p1

    .line 64
    :cond_1
    invoke-static {p3, p2, p0}, LMk;->j(LN9;Ljava/lang/Object;Lr5;)Lr5;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, LMk;->w(Lr5;)Lr5;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1, v0}, Lr5;->h(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    :try_start_4
    invoke-static {p3, p2, p0}, LMk;->j(LN9;Ljava/lang/Object;Lr5;)Lr5;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, LMk;->w(Lr5;)Lr5;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1, v0}, Llc;->G(Lr5;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_1
    return-void

    .line 88
    :catchall_2
    move-exception p1

    .line 89
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p0, p2}, Lf;->h(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    throw p1
.end method

.method public final g()LY5;
    .locals 1

    .line 1
    iget-object v0, p0, Lf;->e:LY5;

    .line 2
    .line 3
    return-object v0
.end method

.method public final getContext()LY5;
    .locals 1

    .line 1
    iget-object v0, p0, Lf;->e:LY5;

    .line 2
    .line 3
    return-object v0
.end method

.method public final h(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, LI4;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {p1, v0, v1}, LI4;-><init>(Ljava/lang/Throwable;Z)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, LBc;->C(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, Lu6;->h:Li0;

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0, p1}, Lf;->m(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, " was cancelled"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public final y(LJ4;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lf;->e:LY5;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lu6;->o(LY5;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
