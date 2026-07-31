.class public abstract LQ6;
.super Lci;
.source "SourceFile"


# instance fields
.field public e:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-direct {p0, v0, v1, v2}, Lci;-><init>(JZ)V

    .line 5
    .line 6
    .line 7
    iput p1, p0, LQ6;->e:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract c()Lr5;
.end method

.method public d(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 2

    .line 1
    instance-of v0, p1, LI4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, LI4;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object p1, v1

    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v1, p1, LI4;->a:Ljava/lang/Throwable;

    .line 13
    .line 14
    :cond_1
    return-object v1
.end method

.method public f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final g(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    new-instance v0, Ll6;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Fatal exception in coroutines machinery for "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ". Please read KDoc to \'handleFatalException\' method and report this incident to maintainers"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1, p1}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, LQ6;->c()Lr5;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Lr5;->getContext()LY5;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1, v0}, Lu6;->o(LY5;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public abstract i()Ljava/lang/Object;
.end method

.method public final run()V
    .locals 9

    .line 1
    :try_start_0
    invoke-virtual {p0}, LQ6;->c()Lr5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<T of kotlinx.coroutines.DispatchedTask>"

    .line 6
    .line 7
    invoke-static {v1, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    check-cast v0, LO6;

    .line 11
    .line 12
    iget-object v1, v0, LO6;->g:Lr5;

    .line 13
    .line 14
    iget-object v0, v0, LO6;->i:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-interface {v1}, Lr5;->getContext()LY5;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v2, v0}, Lr3;->J(LY5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v3, Lr3;->t:Li0;

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    if-eq v0, v3, :cond_0

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, LMk;->N(Lr5;LY5;Ljava/lang/Object;)Ldj;

    .line 30
    .line 31
    .line 32
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_5

    .line 36
    :cond_0
    move-object v3, v4

    .line 37
    :goto_0
    :try_start_1
    invoke-interface {v1}, Lr5;->getContext()LY5;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {p0}, LQ6;->i()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {p0, v6}, LQ6;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    if-nez v7, :cond_1

    .line 50
    .line 51
    iget v8, p0, LQ6;->e:I

    .line 52
    .line 53
    invoke-static {v8}, LSi;->x(I)Z

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-eqz v8, :cond_1

    .line 58
    .line 59
    sget-object v4, Lt5;->g:Lt5;

    .line 60
    .line 61
    invoke-interface {v5, v4}, LY5;->c(LX5;)LW5;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Luc;

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_1
    move-exception v1

    .line 69
    goto :goto_4

    .line 70
    :cond_1
    :goto_1
    if-eqz v4, :cond_2

    .line 71
    .line 72
    invoke-interface {v4}, Luc;->b()Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-nez v5, :cond_2

    .line 77
    .line 78
    check-cast v4, LBc;

    .line 79
    .line 80
    invoke-virtual {v4}, LBc;->u()Ljava/util/concurrent/CancellationException;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {p0, v4}, LQ6;->b(Ljava/util/concurrent/CancellationException;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v4}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    :goto_2
    invoke-interface {v1, v4}, Lr5;->h(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_2
    if-eqz v7, :cond_3

    .line 96
    .line 97
    invoke-static {v7}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    goto :goto_2

    .line 102
    :cond_3
    invoke-virtual {p0, v6}, LQ6;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 106
    goto :goto_2

    .line 107
    :goto_3
    if-eqz v3, :cond_4

    .line 108
    .line 109
    :try_start_2
    invoke-virtual {v3}, Ldj;->Q()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_7

    .line 114
    .line 115
    :cond_4
    invoke-static {v2, v0}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    goto :goto_6

    .line 119
    :goto_4
    if-eqz v3, :cond_5

    .line 120
    .line 121
    invoke-virtual {v3}, Ldj;->Q()Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_6

    .line 126
    .line 127
    :cond_5
    invoke-static {v2, v0}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    :goto_5
    invoke-virtual {p0, v0}, LQ6;->g(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :cond_7
    :goto_6
    return-void
.end method
