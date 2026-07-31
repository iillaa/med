.class public LBc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luc;
.implements Lk4;
.implements Lif;


# static fields
.field public static final synthetic c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _parentHandle$volatile:Ljava/lang/Object;

.field private volatile synthetic _state$volatile:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "_state$volatile"

    .line 2
    .line 3
    const-class v1, LBc;

    .line 4
    .line 5
    const-class v2, Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 12
    .line 13
    const-string v0, "_parentHandle$volatile"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, LBc;->d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lu6;->m:LC7;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object p1, Lu6;->l:LC7;

    .line 10
    .line 11
    :goto_0
    iput-object p1, p0, LBc;->_state$volatile:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public static E(LAd;)Lj4;
    .locals 2

    .line 1
    :goto_0
    invoke-virtual {p0}, LAd;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, LAd;->f()LAd;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v1, LAd;->b:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, LAd;

    .line 20
    .line 21
    :goto_1
    invoke-virtual {p0}, LAd;->i()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, LAd;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object p0, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p0}, LAd;->h()LAd;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, LAd;->i()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    instance-of v0, p0, Lj4;

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    check-cast p0, Lj4;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_3
    instance-of v0, p0, LHe;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return-object p0
.end method

.method public static K(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    instance-of v0, p0, LAc;

    .line 2
    .line 3
    const-string v1, "Active"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, LAc;

    .line 8
    .line 9
    invoke-virtual {p0}, LAc;->e()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v1, "Cancelling"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, LAc;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_5

    .line 25
    .line 26
    const-string v1, "Completing"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    instance-of v0, p0, LXb;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    check-cast p0, LXb;

    .line 34
    .line 35
    invoke-interface {p0}, LXb;->b()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const-string v1, "New"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    instance-of p0, p0, LI4;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "Cancelled"

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_4
    const-string v1, "Completed"

    .line 53
    .line 54
    :cond_5
    :goto_0
    return-object v1
.end method


# virtual methods
.method public final A(ZLyc;)LU6;
    .locals 7

    .line 1
    iput-object p0, p2, Lyc;->d:LBc;

    .line 2
    .line 3
    :cond_0
    :goto_0
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v2, v1, LC7;

    .line 10
    .line 11
    sget-object v3, LIe;->a:LIe;

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    const/4 v5, 0x0

    .line 15
    if-eqz v2, :cond_4

    .line 16
    .line 17
    move-object v2, v1

    .line 18
    check-cast v2, LC7;

    .line 19
    .line 20
    iget-boolean v6, v2, LC7;->a:Z

    .line 21
    .line 22
    if-eqz v6, :cond_3

    .line 23
    .line 24
    :cond_1
    invoke-virtual {v0, p0, v1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    goto :goto_4

    .line 31
    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eq v2, v1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    invoke-virtual {p0, v2}, LBc;->I(LC7;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_4
    instance-of v2, v1, LXb;

    .line 43
    .line 44
    if-eqz v2, :cond_b

    .line 45
    .line 46
    move-object v2, v1

    .line 47
    check-cast v2, LXb;

    .line 48
    .line 49
    invoke-interface {v2}, LXb;->d()LHe;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    if-nez v6, :cond_5

    .line 54
    .line 55
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.JobNode"

    .line 56
    .line 57
    invoke-static {v0, v1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    check-cast v1, Lyc;

    .line 61
    .line 62
    invoke-virtual {p0, v1}, LBc;->J(Lyc;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    invoke-virtual {p2}, Lyc;->k()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_a

    .line 71
    .line 72
    instance-of v1, v2, LAc;

    .line 73
    .line 74
    if-eqz v1, :cond_6

    .line 75
    .line 76
    check-cast v2, LAc;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_6
    move-object v2, v5

    .line 80
    :goto_1
    if-eqz v2, :cond_7

    .line 81
    .line 82
    invoke-virtual {v2}, LAc;->c()Ljava/lang/Throwable;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    goto :goto_2

    .line 87
    :cond_7
    move-object v1, v5

    .line 88
    :goto_2
    if-nez v1, :cond_8

    .line 89
    .line 90
    const/4 v1, 0x5

    .line 91
    invoke-virtual {v6, p2, v1}, LAd;->e(LAd;I)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    goto :goto_3

    .line 96
    :cond_8
    if-eqz p1, :cond_9

    .line 97
    .line 98
    invoke-virtual {p2, v1}, Lyc;->l(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    :cond_9
    return-object v3

    .line 102
    :cond_a
    invoke-virtual {v6, p2, v4}, LAd;->e(LAd;I)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    :goto_3
    if-eqz v1, :cond_0

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_b
    const/4 v4, 0x0

    .line 110
    :goto_4
    if-eqz v4, :cond_c

    .line 111
    .line 112
    return-object p2

    .line 113
    :cond_c
    if-eqz p1, :cond_f

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    instance-of v0, p1, LI4;

    .line 120
    .line 121
    if-eqz v0, :cond_d

    .line 122
    .line 123
    check-cast p1, LI4;

    .line 124
    .line 125
    goto :goto_5

    .line 126
    :cond_d
    move-object p1, v5

    .line 127
    :goto_5
    if-eqz p1, :cond_e

    .line 128
    .line 129
    iget-object v5, p1, LI4;->a:Ljava/lang/Throwable;

    .line 130
    .line 131
    :cond_e
    invoke-virtual {p2, v5}, Lyc;->l(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :cond_f
    return-object v3
.end method

.method public B()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final C(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    :cond_0
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1}, LBc;->L(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lu6;->g:Li0;

    .line 12
    .line 13
    if-ne v0, v1, :cond_3

    .line 14
    .line 15
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "Job "

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, " is already complete or completing, but is being completed with "

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    instance-of v2, p1, LI4;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    check-cast p1, LI4;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-object p1, v3

    .line 48
    :goto_0
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object v3, p1, LI4;->a:Ljava/lang/Throwable;

    .line 51
    .line 52
    :cond_2
    invoke-direct {v0, v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw v0

    .line 56
    :cond_3
    sget-object v1, Lu6;->i:Li0;

    .line 57
    .line 58
    if-eq v0, v1, :cond_0

    .line 59
    .line 60
    return-object v0
.end method

.method public D()Ljava/lang/String;
    .locals 1

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
    return-object v0
.end method

.method public final F(LHe;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    new-instance v0, Led;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Led;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, LAd;->e(LAd;I)Z

    .line 8
    .line 9
    .line 10
    sget-object v0, LAd;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode"

    .line 17
    .line 18
    invoke-static {v1, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    check-cast v0, LAd;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_2

    .line 29
    .line 30
    instance-of v2, v0, Lyc;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    move-object v2, v0

    .line 35
    check-cast v2, Lyc;

    .line 36
    .line 37
    invoke-virtual {v2}, Lyc;->k()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    :try_start_0
    move-object v2, v0

    .line 44
    check-cast v2, Lyc;

    .line 45
    .line 46
    invoke-virtual {v2, p2}, Lyc;->l(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception v2

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-static {v1, v2}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    new-instance v1, LJ4;

    .line 58
    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v4, "Exception in completion handler "

    .line 62
    .line 63
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v4, " for "

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-direct {v1, v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_1
    invoke-virtual {v0}, LAd;->h()LAd;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    if-eqz v1, :cond_3

    .line 90
    .line 91
    invoke-virtual {p0, v1}, LBc;->y(LJ4;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    invoke-virtual {p0, p2}, LBc;->p(Ljava/lang/Throwable;)Z

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public G(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    return-void
.end method

.method public final I(LC7;)V
    .locals 3

    .line 1
    new-instance v0, LHe;

    .line 2
    .line 3
    invoke-direct {v0}, LAd;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p1, LC7;->a:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance v1, LWb;

    .line 12
    .line 13
    invoke-direct {v1, v0}, LWb;-><init>(LHe;)V

    .line 14
    .line 15
    .line 16
    move-object v0, v1

    .line 17
    :cond_1
    :goto_0
    sget-object v1, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 18
    .line 19
    invoke-virtual {v1, p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eq v1, p1, :cond_1

    .line 31
    .line 32
    :goto_1
    return-void
.end method

.method public final J(Lyc;)V
    .locals 3

    .line 1
    new-instance v0, LHe;

    .line 2
    .line 3
    invoke-direct {v0}, LAd;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    sget-object v1, LAd;->b:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 10
    .line 11
    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, LAd;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 15
    .line 16
    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eq v2, p1, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {v1, p1, p1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    invoke-virtual {v0, p1}, LAd;->g(LAd;)V

    .line 33
    .line 34
    .line 35
    :goto_1
    invoke-virtual {p1}, LAd;->h()LAd;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :cond_1
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 40
    .line 41
    invoke-virtual {v0, p0, p1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eq v0, p1, :cond_1

    .line 53
    .line 54
    :goto_2
    return-void

    .line 55
    :cond_3
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    if-eq v2, p1, :cond_0

    .line 60
    .line 61
    goto :goto_0
.end method

.method public final L(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p1, LXb;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Lu6;->g:Li0;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    instance-of v0, p1, LC7;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    instance-of v0, p1, Lyc;

    .line 13
    .line 14
    if-eqz v0, :cond_5

    .line 15
    .line 16
    :cond_1
    instance-of v0, p1, Lj4;

    .line 17
    .line 18
    if-nez v0, :cond_5

    .line 19
    .line 20
    instance-of v0, p2, LI4;

    .line 21
    .line 22
    if-nez v0, :cond_5

    .line 23
    .line 24
    move-object v0, p1

    .line 25
    check-cast v0, LXb;

    .line 26
    .line 27
    instance-of p1, p2, LXb;

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    new-instance p1, LYb;

    .line 32
    .line 33
    move-object v1, p2

    .line 34
    check-cast v1, LXb;

    .line 35
    .line 36
    invoke-direct {p1, v1}, LYb;-><init>(LXb;)V

    .line 37
    .line 38
    .line 39
    move-object v1, p1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move-object v1, p2

    .line 42
    :cond_3
    :goto_0
    sget-object p1, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 43
    .line 44
    invoke-virtual {p1, p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0, p2}, LBc;->G(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0, p2}, LBc;->r(LXb;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-object p2

    .line 57
    :cond_4
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-eq p1, v0, :cond_3

    .line 62
    .line 63
    sget-object p1, Lu6;->i:Li0;

    .line 64
    .line 65
    return-object p1

    .line 66
    :cond_5
    check-cast p1, LXb;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, LBc;->w(LXb;)LHe;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-nez v0, :cond_6

    .line 73
    .line 74
    sget-object p1, Lu6;->i:Li0;

    .line 75
    .line 76
    goto/16 :goto_5

    .line 77
    .line 78
    :cond_6
    instance-of v1, p1, LAc;

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    if-eqz v1, :cond_7

    .line 82
    .line 83
    move-object v1, p1

    .line 84
    check-cast v1, LAc;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_7
    move-object v1, v2

    .line 88
    :goto_1
    if-nez v1, :cond_8

    .line 89
    .line 90
    new-instance v1, LAc;

    .line 91
    .line 92
    invoke-direct {v1, v0, v2}, LAc;-><init>(LHe;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    :cond_8
    monitor-enter v1

    .line 96
    :try_start_0
    sget-object v3, LAc;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 97
    .line 98
    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-eqz v4, :cond_9

    .line 103
    .line 104
    sget-object p1, Lu6;->g:Li0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    .line 106
    monitor-exit v1

    .line 107
    goto/16 :goto_5

    .line 108
    .line 109
    :cond_9
    const/4 v4, 0x1

    .line 110
    :try_start_1
    invoke-virtual {v3, v1, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    .line 111
    .line 112
    .line 113
    if-eq v1, p1, :cond_c

    .line 114
    .line 115
    sget-object v3, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 116
    .line 117
    :cond_a
    invoke-virtual {v3, p0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-eqz v5, :cond_b

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_b
    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    if-eq v5, p1, :cond_a

    .line 129
    .line 130
    sget-object p1, Lu6;->i:Li0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    .line 132
    monitor-exit v1

    .line 133
    goto :goto_5

    .line 134
    :cond_c
    :goto_2
    :try_start_2
    invoke-virtual {v1}, LAc;->e()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    instance-of v3, p2, LI4;

    .line 139
    .line 140
    if-eqz v3, :cond_d

    .line 141
    .line 142
    move-object v3, p2

    .line 143
    check-cast v3, LI4;

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catchall_0
    move-exception p1

    .line 147
    goto :goto_6

    .line 148
    :cond_d
    move-object v3, v2

    .line 149
    :goto_3
    if-eqz v3, :cond_e

    .line 150
    .line 151
    iget-object v3, v3, LI4;->a:Ljava/lang/Throwable;

    .line 152
    .line 153
    invoke-virtual {v1, v3}, LAc;->a(Ljava/lang/Throwable;)V

    .line 154
    .line 155
    .line 156
    :cond_e
    invoke-virtual {v1}, LAc;->c()Ljava/lang/Throwable;

    .line 157
    .line 158
    .line 159
    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    xor-int/2addr p1, v4

    .line 161
    if-eqz p1, :cond_f

    .line 162
    .line 163
    move-object v2, v3

    .line 164
    :cond_f
    monitor-exit v1

    .line 165
    if-eqz v2, :cond_10

    .line 166
    .line 167
    invoke-virtual {p0, v0, v2}, LBc;->F(LHe;Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    :cond_10
    invoke-static {v0}, LBc;->E(LAd;)Lj4;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    if-eqz p1, :cond_11

    .line 175
    .line 176
    invoke-virtual {p0, v1, p1, p2}, LBc;->M(LAc;Lj4;Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_11

    .line 181
    .line 182
    :goto_4
    sget-object p1, Lu6;->h:Li0;

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_11
    new-instance p1, Led;

    .line 186
    .line 187
    const/4 v2, 0x2

    .line 188
    invoke-direct {p1, v2}, Led;-><init>(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, p1, v2}, LAd;->e(LAd;I)Z

    .line 192
    .line 193
    .line 194
    invoke-static {v0}, LBc;->E(LAd;)Lj4;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    if-eqz p1, :cond_12

    .line 199
    .line 200
    invoke-virtual {p0, v1, p1, p2}, LBc;->M(LAc;Lj4;Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-eqz p1, :cond_12

    .line 205
    .line 206
    goto :goto_4

    .line 207
    :cond_12
    invoke-virtual {p0, v1, p2}, LBc;->t(LAc;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    :goto_5
    return-object p1

    .line 212
    :goto_6
    monitor-exit v1

    .line 213
    throw p1
.end method

.method public final M(LAc;Lj4;Ljava/lang/Object;)Z
    .locals 3

    .line 1
    :cond_0
    new-instance v0, Lzc;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lzc;-><init>(LBc;LAc;Lj4;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p2, Lj4;->e:Lk4;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v1, v2, v0}, Lr3;->s(Luc;ZLyc;)LU6;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, LIe;->a:LIe;

    .line 14
    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    return p1

    .line 19
    :cond_1
    invoke-static {p2}, LBc;->E(LAd;)Lj4;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    return v2
.end method

.method public a(Ljava/util/concurrent/CancellationException;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Lvc;

    .line 4
    .line 5
    invoke-virtual {p0}, LBc;->q()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {p1, v0, v1, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0, p1}, LBc;->o(Ljava/util/concurrent/CancellationException;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b()Z
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
    instance-of v1, v0, LXb;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, LXb;

    .line 12
    .line 13
    invoke-interface {v0}, LXb;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    return v0
.end method

.method public final c(LX5;)LW5;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LSi;->r(LW5;LX5;)LW5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final getKey()LX5;
    .locals 1

    .line 1
    sget-object v0, Lt5;->g:Lt5;

    .line 2
    .line 3
    return-object v0
.end method

.method public final i(LX5;)LY5;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LSi;->y(LW5;LX5;)LY5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final j(Ljava/lang/Object;LN9;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p2, p1, p0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final k(LY5;)LY5;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LE7;->c:LE7;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    move-object p1, p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, LC4;->f:LC4;

    .line 13
    .line 14
    invoke-interface {p1, p0, v0}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, LY5;

    .line 19
    .line 20
    :goto_0
    return-object p1
.end method

.method public l(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LBc;->l(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n(Ljava/lang/Object;)Z
    .locals 9

    .line 1
    sget-object v0, Lu6;->g:Li0;

    .line 2
    .line 3
    instance-of v1, p0, Lwc;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v1, :cond_3

    .line 8
    .line 9
    :cond_0
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, LXb;

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    instance-of v1, v0, LAc;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    move-object v1, v0

    .line 24
    check-cast v1, LAc;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    sget-object v4, LAc;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 30
    .line 31
    invoke-virtual {v4, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance v1, LI4;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, LBc;->s(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-direct {v1, v4, v2}, LI4;-><init>(Ljava/lang/Throwable;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, LBc;->L(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v1, Lu6;->i:Li0;

    .line 52
    .line 53
    if-eq v0, v1, :cond_0

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    sget-object v0, Lu6;->g:Li0;

    .line 57
    .line 58
    :goto_1
    sget-object v1, Lu6;->h:Li0;

    .line 59
    .line 60
    if-ne v0, v1, :cond_3

    .line 61
    .line 62
    return v3

    .line 63
    :cond_3
    sget-object v1, Lu6;->g:Li0;

    .line 64
    .line 65
    if-ne v0, v1, :cond_11

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    move-object v1, v0

    .line 69
    :cond_4
    :goto_2
    sget-object v4, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 70
    .line 71
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    instance-of v5, v4, LAc;

    .line 76
    .line 77
    if-eqz v5, :cond_9

    .line 78
    .line 79
    monitor-enter v4

    .line 80
    :try_start_0
    move-object v5, v4

    .line 81
    check-cast v5, LAc;

    .line 82
    .line 83
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    sget-object v6, LAc;->d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 87
    .line 88
    invoke-virtual {v6, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    sget-object v6, Lu6;->k:Li0;

    .line 93
    .line 94
    if-ne v5, v6, :cond_5

    .line 95
    .line 96
    sget-object p1, Lu6;->j:Li0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .line 98
    monitor-exit v4

    .line 99
    :goto_3
    move-object v0, p1

    .line 100
    goto/16 :goto_7

    .line 101
    .line 102
    :cond_5
    :try_start_1
    move-object v5, v4

    .line 103
    check-cast v5, LAc;

    .line 104
    .line 105
    invoke-virtual {v5}, LAc;->e()Z

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    if-nez v1, :cond_6

    .line 110
    .line 111
    invoke-virtual {p0, p1}, LBc;->s(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    goto :goto_4

    .line 116
    :catchall_0
    move-exception p1

    .line 117
    goto :goto_6

    .line 118
    :cond_6
    :goto_4
    move-object p1, v4

    .line 119
    check-cast p1, LAc;

    .line 120
    .line 121
    invoke-virtual {p1, v1}, LAc;->a(Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    move-object p1, v4

    .line 125
    check-cast p1, LAc;

    .line 126
    .line 127
    invoke-virtual {p1}, LAc;->c()Ljava/lang/Throwable;

    .line 128
    .line 129
    .line 130
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    xor-int/lit8 v1, v5, 0x1

    .line 132
    .line 133
    if-eqz v1, :cond_7

    .line 134
    .line 135
    move-object v0, p1

    .line 136
    :cond_7
    monitor-exit v4

    .line 137
    if-eqz v0, :cond_8

    .line 138
    .line 139
    check-cast v4, LAc;

    .line 140
    .line 141
    iget-object p1, v4, LAc;->a:LHe;

    .line 142
    .line 143
    invoke-virtual {p0, p1, v0}, LBc;->F(LHe;Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    :goto_5
    sget-object p1, Lu6;->g:Li0;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :goto_6
    monitor-exit v4

    .line 150
    throw p1

    .line 151
    :cond_9
    instance-of v5, v4, LXb;

    .line 152
    .line 153
    if-eqz v5, :cond_10

    .line 154
    .line 155
    if-nez v1, :cond_a

    .line 156
    .line 157
    invoke-virtual {p0, p1}, LBc;->s(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    :cond_a
    move-object v5, v4

    .line 162
    check-cast v5, LXb;

    .line 163
    .line 164
    invoke-interface {v5}, LXb;->b()Z

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    if-eqz v6, :cond_e

    .line 169
    .line 170
    invoke-virtual {p0, v5}, LBc;->w(LXb;)LHe;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    if-nez v6, :cond_b

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_b
    new-instance v7, LAc;

    .line 178
    .line 179
    invoke-direct {v7, v6, v1}, LAc;-><init>(LHe;Ljava/lang/Throwable;)V

    .line 180
    .line 181
    .line 182
    :cond_c
    sget-object v4, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 183
    .line 184
    invoke-virtual {v4, p0, v5, v7}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v8

    .line 188
    if-eqz v8, :cond_d

    .line 189
    .line 190
    invoke-virtual {p0, v6, v1}, LBc;->F(LHe;Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    goto :goto_5

    .line 194
    :cond_d
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    if-eq v4, v5, :cond_c

    .line 199
    .line 200
    goto/16 :goto_2

    .line 201
    .line 202
    :cond_e
    new-instance v5, LI4;

    .line 203
    .line 204
    invoke-direct {v5, v1, v2}, LI4;-><init>(Ljava/lang/Throwable;Z)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, v4, v5}, LBc;->L(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    sget-object v6, Lu6;->g:Li0;

    .line 212
    .line 213
    if-eq v5, v6, :cond_f

    .line 214
    .line 215
    sget-object v4, Lu6;->i:Li0;

    .line 216
    .line 217
    if-eq v5, v4, :cond_4

    .line 218
    .line 219
    move-object v0, v5

    .line 220
    goto :goto_7

    .line 221
    :cond_f
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 222
    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    const-string v1, "Cannot happen in "

    .line 226
    .line 227
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    throw p1

    .line 245
    :cond_10
    sget-object p1, Lu6;->j:Li0;

    .line 246
    .line 247
    goto/16 :goto_3

    .line 248
    .line 249
    :cond_11
    :goto_7
    sget-object p1, Lu6;->g:Li0;

    .line 250
    .line 251
    if-ne v0, p1, :cond_12

    .line 252
    .line 253
    :goto_8
    move v2, v3

    .line 254
    goto :goto_9

    .line 255
    :cond_12
    sget-object p1, Lu6;->h:Li0;

    .line 256
    .line 257
    if-ne v0, p1, :cond_13

    .line 258
    .line 259
    goto :goto_8

    .line 260
    :cond_13
    sget-object p1, Lu6;->j:Li0;

    .line 261
    .line 262
    if-ne v0, p1, :cond_14

    .line 263
    .line 264
    goto :goto_9

    .line 265
    :cond_14
    invoke-virtual {p0, v0}, LBc;->l(Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    goto :goto_8

    .line 269
    :goto_9
    return v2
.end method

.method public o(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LBc;->n(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p(Ljava/lang/Throwable;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, LBc;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    .line 10
    .line 11
    sget-object v2, LBc;->d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 12
    .line 13
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Li4;

    .line 18
    .line 19
    if-eqz v2, :cond_4

    .line 20
    .line 21
    sget-object v3, LIe;->a:LIe;

    .line 22
    .line 23
    if-ne v2, v3, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-interface {v2, p1}, Li4;->c(Ljava/lang/Throwable;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_3

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 v1, 0x0

    .line 36
    :cond_3
    :goto_0
    return v1

    .line 37
    :cond_4
    :goto_1
    return v0
.end method

.method public q()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Job was cancelled"

    .line 2
    .line 3
    return-object v0
.end method

.method public final r(LXb;Ljava/lang/Object;)V
    .locals 6

    .line 1
    sget-object v0, LBc;->d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Li4;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {v1}, LU6;->a()V

    .line 12
    .line 13
    .line 14
    sget-object v1, LIe;->a:LIe;

    .line 15
    .line 16
    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    instance-of v0, p2, LI4;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p2, LI4;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move-object p2, v1

    .line 28
    :goto_0
    if-eqz p2, :cond_2

    .line 29
    .line 30
    iget-object p2, p2, LI4;->a:Ljava/lang/Throwable;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    move-object p2, v1

    .line 34
    :goto_1
    instance-of v0, p1, Lyc;

    .line 35
    .line 36
    const-string v2, " for "

    .line 37
    .line 38
    const-string v3, "Exception in completion handler "

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    :try_start_0
    move-object v0, p1

    .line 43
    check-cast v0, Lyc;

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Lyc;->l(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :catchall_0
    move-exception p2

    .line 51
    new-instance v0, LJ4;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {v0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, LBc;->y(LJ4;)V

    .line 75
    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_3
    invoke-interface {p1}, LXb;->d()LHe;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_7

    .line 83
    .line 84
    new-instance v0, Led;

    .line 85
    .line 86
    const/4 v4, 0x1

    .line 87
    invoke-direct {v0, v4}, Led;-><init>(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0, v4}, LAd;->e(LAd;I)Z

    .line 91
    .line 92
    .line 93
    sget-object v0, LAd;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 94
    .line 95
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v4, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode"

    .line 100
    .line 101
    invoke-static {v4, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    check-cast v0, LAd;

    .line 105
    .line 106
    :goto_2
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-nez v4, :cond_6

    .line 111
    .line 112
    instance-of v4, v0, Lyc;

    .line 113
    .line 114
    if-eqz v4, :cond_5

    .line 115
    .line 116
    move-object v4, v0

    .line 117
    check-cast v4, Lyc;

    .line 118
    .line 119
    :try_start_1
    move-object v4, v0

    .line 120
    check-cast v4, Lyc;

    .line 121
    .line 122
    invoke-virtual {v4, p2}, Lyc;->l(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 123
    .line 124
    .line 125
    goto :goto_3

    .line 126
    :catchall_1
    move-exception v4

    .line 127
    if-eqz v1, :cond_4

    .line 128
    .line 129
    invoke-static {v1, v4}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_4
    new-instance v1, LJ4;

    .line 134
    .line 135
    new-instance v5, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-direct {v1, v5, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    :goto_3
    invoke-virtual {v0}, LAd;->h()LAd;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    goto :goto_2

    .line 161
    :cond_6
    if-eqz v1, :cond_7

    .line 162
    .line 163
    invoke-virtual {p0, v1}, LBc;->y(LJ4;)V

    .line 164
    .line 165
    .line 166
    :cond_7
    :goto_4
    return-void
.end method

.method public final s(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 4

    .line 1
    instance-of v0, p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Throwable;

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    check-cast p1, Lif;

    .line 9
    .line 10
    check-cast p1, LBc;

    .line 11
    .line 12
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v1, v0, LAc;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    move-object v1, v0

    .line 24
    check-cast v1, LAc;

    .line 25
    .line 26
    invoke-virtual {v1}, LAc;->c()Ljava/lang/Throwable;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    instance-of v1, v0, LI4;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    move-object v1, v0

    .line 36
    check-cast v1, LI4;

    .line 37
    .line 38
    iget-object v1, v1, LI4;->a:Ljava/lang/Throwable;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    instance-of v1, v0, LXb;

    .line 42
    .line 43
    if-nez v1, :cond_5

    .line 44
    .line 45
    move-object v1, v2

    .line 46
    :goto_0
    instance-of v3, v1, Ljava/util/concurrent/CancellationException;

    .line 47
    .line 48
    if-eqz v3, :cond_3

    .line 49
    .line 50
    move-object v2, v1

    .line 51
    check-cast v2, Ljava/util/concurrent/CancellationException;

    .line 52
    .line 53
    :cond_3
    if-nez v2, :cond_4

    .line 54
    .line 55
    new-instance v2, Lvc;

    .line 56
    .line 57
    invoke-static {v0}, LBc;->K(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v3, "Parent job is "

    .line 62
    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-direct {v2, v0, v1, p1}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    move-object p1, v2

    .line 71
    :goto_1
    return-object p1

    .line 72
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v2, "Cannot be cancelling child in this state: "

    .line 77
    .line 78
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw p1
.end method

.method public final t(LAc;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p2, LI4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move-object v0, p2

    .line 7
    check-cast v0, LI4;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object v0, v1

    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, v0, LI4;->a:Ljava/lang/Throwable;

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move-object v0, v1

    .line 17
    :goto_1
    monitor-enter p1

    .line 18
    :try_start_0
    invoke-virtual {p1}, LAc;->e()Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, LAc;->f(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    const/4 v4, 0x1

    .line 30
    const/4 v5, 0x0

    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, LAc;->e()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_6

    .line 38
    .line 39
    new-instance v3, Lvc;

    .line 40
    .line 41
    invoke-virtual {p0}, LBc;->q()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-direct {v3, v6, v1, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 46
    .line 47
    .line 48
    move-object v1, v3

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_4

    .line 59
    .line 60
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    move-object v7, v6

    .line 65
    check-cast v7, Ljava/lang/Throwable;

    .line 66
    .line 67
    instance-of v7, v7, Ljava/util/concurrent/CancellationException;

    .line 68
    .line 69
    xor-int/2addr v7, v4

    .line 70
    if-eqz v7, :cond_3

    .line 71
    .line 72
    move-object v1, v6

    .line 73
    :cond_4
    check-cast v1, Ljava/lang/Throwable;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_5
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Ljava/lang/Throwable;

    .line 83
    .line 84
    :cond_6
    :goto_2
    if-eqz v1, :cond_9

    .line 85
    .line 86
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-gt v3, v4, :cond_7

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    new-instance v6, Ljava/util/IdentityHashMap;

    .line 98
    .line 99
    invoke-direct {v6, v3}, Ljava/util/IdentityHashMap;-><init>(I)V

    .line 100
    .line 101
    .line 102
    invoke-static {v6}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    :cond_8
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    if-eqz v6, :cond_9

    .line 115
    .line 116
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    check-cast v6, Ljava/lang/Throwable;

    .line 121
    .line 122
    if-eq v6, v1, :cond_8

    .line 123
    .line 124
    if-eq v6, v1, :cond_8

    .line 125
    .line 126
    instance-of v7, v6, Ljava/util/concurrent/CancellationException;

    .line 127
    .line 128
    if-nez v7, :cond_8

    .line 129
    .line 130
    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-eqz v7, :cond_8

    .line 135
    .line 136
    invoke-static {v1, v6}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_9
    :goto_4
    monitor-exit p1

    .line 141
    if-nez v1, :cond_a

    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_a
    if-ne v1, v0, :cond_b

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_b
    new-instance p2, LI4;

    .line 148
    .line 149
    invoke-direct {p2, v1, v5}, LI4;-><init>(Ljava/lang/Throwable;Z)V

    .line 150
    .line 151
    .line 152
    :goto_5
    if-eqz v1, :cond_d

    .line 153
    .line 154
    invoke-virtual {p0, v1}, LBc;->p(Ljava/lang/Throwable;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_c

    .line 159
    .line 160
    invoke-virtual {p0, v1}, LBc;->x(Ljava/lang/Throwable;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_d

    .line 165
    .line 166
    :cond_c
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally"

    .line 167
    .line 168
    invoke-static {v0, p2}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    move-object v0, p2

    .line 172
    check-cast v0, LI4;

    .line 173
    .line 174
    sget-object v1, LI4;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 175
    .line 176
    invoke-virtual {v1, v0, v5, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    .line 177
    .line 178
    .line 179
    :cond_d
    invoke-virtual {p0, p2}, LBc;->G(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    sget-object v0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 183
    .line 184
    instance-of v1, p2, LXb;

    .line 185
    .line 186
    if-eqz v1, :cond_e

    .line 187
    .line 188
    new-instance v1, LYb;

    .line 189
    .line 190
    move-object v2, p2

    .line 191
    check-cast v2, LXb;

    .line 192
    .line 193
    invoke-direct {v1, v2}, LYb;-><init>(LXb;)V

    .line 194
    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_e
    move-object v1, p2

    .line 198
    :cond_f
    :goto_6
    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-eqz v2, :cond_10

    .line 203
    .line 204
    goto :goto_7

    .line 205
    :cond_10
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    if-eq v2, p1, :cond_f

    .line 210
    .line 211
    :goto_7
    invoke-virtual {p0, p1, p2}, LBc;->r(LXb;Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    return-object p2

    .line 215
    :catchall_0
    move-exception p2

    .line 216
    monitor-exit p1

    .line 217
    throw p2
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, LBc;->D()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const/16 v2, 0x7b

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sget-object v2, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, LBc;->K(Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const/16 v2, 0x7d

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const/16 v1, 0x40

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Lu6;->m(Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    return-object v0
.end method

.method public final u()Ljava/util/concurrent/CancellationException;
    .locals 4

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
    instance-of v1, v0, LAc;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const-string v3, "Job is still new or active: "

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    check-cast v0, LAc;

    .line 15
    .line 16
    invoke-virtual {v0}, LAc;->c()Ljava/lang/Throwable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v3, " is cancelling"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    instance-of v3, v0, Ljava/util/concurrent/CancellationException;

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    move-object v2, v0

    .line 41
    check-cast v2, Ljava/util/concurrent/CancellationException;

    .line 42
    .line 43
    :cond_0
    if-nez v2, :cond_6

    .line 44
    .line 45
    new-instance v2, Lvc;

    .line 46
    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, LBc;->q()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :cond_1
    invoke-direct {v2, v1, v0, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw v0

    .line 79
    :cond_3
    instance-of v1, v0, LXb;

    .line 80
    .line 81
    if-nez v1, :cond_7

    .line 82
    .line 83
    instance-of v1, v0, LI4;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    check-cast v0, LI4;

    .line 88
    .line 89
    iget-object v0, v0, LI4;->a:Ljava/lang/Throwable;

    .line 90
    .line 91
    instance-of v1, v0, Ljava/util/concurrent/CancellationException;

    .line 92
    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    move-object v2, v0

    .line 96
    check-cast v2, Ljava/util/concurrent/CancellationException;

    .line 97
    .line 98
    :cond_4
    if-nez v2, :cond_6

    .line 99
    .line 100
    new-instance v1, Lvc;

    .line 101
    .line 102
    invoke-virtual {p0}, LBc;->q()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-direct {v1, v2, v0, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 107
    .line 108
    .line 109
    move-object v2, v1

    .line 110
    goto :goto_0

    .line 111
    :cond_5
    new-instance v0, Lvc;

    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v3, " has completed normally"

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-direct {v0, v1, v2, p0}, Lvc;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Luc;)V

    .line 128
    .line 129
    .line 130
    move-object v2, v0

    .line 131
    :cond_6
    :goto_0
    return-object v2

    .line 132
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 133
    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw v0
.end method

.method public v()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public final w(LXb;)LHe;
    .locals 3

    .line 1
    invoke-interface {p1}, LXb;->d()LHe;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    instance-of v0, p1, LC7;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, LHe;

    .line 12
    .line 13
    invoke-direct {v0}, LAd;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    instance-of v0, p1, Lyc;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p1, Lyc;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, LBc;->J(Lyc;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "State should have list: "

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw v0

    .line 52
    :cond_2
    :goto_0
    return-object v0
.end method

.method public x(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public y(LJ4;)V
    .locals 0

    .line 1
    throw p1
.end method

.method public final z(Luc;)V
    .locals 8

    .line 1
    sget-object v0, LIe;->a:LIe;

    .line 2
    .line 3
    sget-object v1, LBc;->d:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p1, LBc;

    .line 12
    .line 13
    :goto_0
    sget-object v2, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    instance-of v4, v3, LC7;

    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v7, -0x1

    .line 24
    if-eqz v4, :cond_4

    .line 25
    .line 26
    move-object v4, v3

    .line 27
    check-cast v4, LC7;

    .line 28
    .line 29
    iget-boolean v4, v4, LC7;->a:Z

    .line 30
    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    goto :goto_3

    .line 34
    :cond_1
    sget-object v4, Lu6;->m:LC7;

    .line 35
    .line 36
    :cond_2
    invoke-virtual {v2, p1, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_3

    .line 41
    .line 42
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move v6, v5

    .line 46
    goto :goto_3

    .line 47
    :cond_3
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    if-eq v6, v3, :cond_2

    .line 52
    .line 53
    :goto_2
    move v6, v7

    .line 54
    goto :goto_3

    .line 55
    :cond_4
    instance-of v4, v3, LWb;

    .line 56
    .line 57
    if-eqz v4, :cond_7

    .line 58
    .line 59
    move-object v4, v3

    .line 60
    check-cast v4, LWb;

    .line 61
    .line 62
    iget-object v4, v4, LWb;->a:LHe;

    .line 63
    .line 64
    :cond_5
    invoke-virtual {v2, p1, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-eqz v6, :cond_6

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_6
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    if-eq v6, v3, :cond_5

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_7
    :goto_3
    if-eqz v6, :cond_8

    .line 79
    .line 80
    if-eq v6, v5, :cond_8

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_8
    new-instance v3, Lj4;

    .line 84
    .line 85
    invoke-direct {v3, p0}, Lj4;-><init>(LBc;)V

    .line 86
    .line 87
    .line 88
    iput-object p1, v3, Lyc;->d:LBc;

    .line 89
    .line 90
    :goto_4
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    instance-of v6, v4, LC7;

    .line 95
    .line 96
    if-eqz v6, :cond_c

    .line 97
    .line 98
    move-object v6, v4

    .line 99
    check-cast v6, LC7;

    .line 100
    .line 101
    iget-boolean v7, v6, LC7;->a:Z

    .line 102
    .line 103
    if-eqz v7, :cond_b

    .line 104
    .line 105
    :cond_9
    invoke-virtual {v2, p1, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    if-eqz v6, :cond_a

    .line 110
    .line 111
    goto/16 :goto_9

    .line 112
    .line 113
    :cond_a
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    if-eq v6, v4, :cond_9

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_b
    invoke-virtual {p1, v6}, LBc;->I(LC7;)V

    .line 121
    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_c
    instance-of v6, v4, LXb;

    .line 125
    .line 126
    const/4 v7, 0x0

    .line 127
    if-eqz v6, :cond_13

    .line 128
    .line 129
    move-object v6, v4

    .line 130
    check-cast v6, LXb;

    .line 131
    .line 132
    invoke-interface {v6}, LXb;->d()LHe;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    if-nez v6, :cond_d

    .line 137
    .line 138
    const-string v6, "null cannot be cast to non-null type kotlinx.coroutines.JobNode"

    .line 139
    .line 140
    invoke-static {v6, v4}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    check-cast v4, Lyc;

    .line 144
    .line 145
    invoke-virtual {p1, v4}, LBc;->J(Lyc;)V

    .line 146
    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_d
    const/4 v4, 0x7

    .line 150
    invoke-virtual {v6, v3, v4}, LAd;->e(LAd;I)Z

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    if-eqz v4, :cond_e

    .line 155
    .line 156
    goto :goto_9

    .line 157
    :cond_e
    const/4 v4, 0x3

    .line 158
    invoke-virtual {v6, v3, v4}, LAd;->e(LAd;I)Z

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    instance-of v6, p1, LAc;

    .line 167
    .line 168
    if-eqz v6, :cond_f

    .line 169
    .line 170
    check-cast p1, LAc;

    .line 171
    .line 172
    invoke-virtual {p1}, LAc;->c()Ljava/lang/Throwable;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    goto :goto_6

    .line 177
    :cond_f
    instance-of v6, p1, LI4;

    .line 178
    .line 179
    if-eqz v6, :cond_10

    .line 180
    .line 181
    check-cast p1, LI4;

    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_10
    move-object p1, v7

    .line 185
    :goto_5
    if-eqz p1, :cond_11

    .line 186
    .line 187
    iget-object v7, p1, LI4;->a:Ljava/lang/Throwable;

    .line 188
    .line 189
    :cond_11
    :goto_6
    invoke-virtual {v3, v7}, Lj4;->l(Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    if-eqz v4, :cond_12

    .line 193
    .line 194
    goto :goto_9

    .line 195
    :cond_12
    :goto_7
    move-object v3, v0

    .line 196
    goto :goto_9

    .line 197
    :cond_13
    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    instance-of v4, p1, LI4;

    .line 202
    .line 203
    if-eqz v4, :cond_14

    .line 204
    .line 205
    check-cast p1, LI4;

    .line 206
    .line 207
    goto :goto_8

    .line 208
    :cond_14
    move-object p1, v7

    .line 209
    :goto_8
    if-eqz p1, :cond_15

    .line 210
    .line 211
    iget-object v7, p1, LI4;->a:Ljava/lang/Throwable;

    .line 212
    .line 213
    :cond_15
    invoke-virtual {v3, v7}, Lj4;->l(Ljava/lang/Throwable;)V

    .line 214
    .line 215
    .line 216
    goto :goto_7

    .line 217
    :goto_9
    invoke-virtual {v1, p0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    instance-of p1, p1, LXb;

    .line 225
    .line 226
    xor-int/2addr p1, v5

    .line 227
    if-eqz p1, :cond_16

    .line 228
    .line 229
    invoke-interface {v3}, LU6;->a()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1, p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    :cond_16
    return-void
.end method
