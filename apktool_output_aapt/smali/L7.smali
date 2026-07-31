.class public abstract LL7;
.super LM7;
.source "SourceFile"

# interfaces
.implements LG6;


# static fields
.field public static final synthetic h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic j:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;


# instance fields
.field private volatile synthetic _delayed$volatile:Ljava/lang/Object;

.field private volatile synthetic _isCompleted$volatile:I

.field private volatile synthetic _queue$volatile:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "_queue$volatile"

    .line 2
    .line 3
    const-class v1, LL7;

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
    sput-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 12
    .line 13
    const-string v0, "_delayed$volatile"

    .line 14
    .line 15
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, LL7;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 20
    .line 21
    const-string v0, "_isCompleted$volatile"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, LL7;->j:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lc6;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LL7;->_isCompleted$volatile:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final d(LY5;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, LL7;->o(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 6

    .line 1
    sget-object v0, Lmi;->a:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, LL7;->j:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, p0, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    .line 11
    .line 12
    .line 13
    :goto_0
    sget-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-object v4, LMk;->e:Li0;

    .line 20
    .line 21
    if-nez v3, :cond_2

    .line 22
    .line 23
    :cond_0
    invoke-virtual {v0, p0, v1, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    instance-of v5, v3, LDd;

    .line 38
    .line 39
    if-eqz v5, :cond_3

    .line 40
    .line 41
    check-cast v3, LDd;

    .line 42
    .line 43
    invoke-virtual {v3}, LDd;->b()Z

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    if-ne v3, v4, :cond_4

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_4
    new-instance v4, LDd;

    .line 51
    .line 52
    const/16 v5, 0x8

    .line 53
    .line 54
    invoke-direct {v4, v5, v2}, LDd;-><init>(IZ)V

    .line 55
    .line 56
    .line 57
    move-object v5, v3

    .line 58
    check-cast v5, Ljava/lang/Runnable;

    .line 59
    .line 60
    invoke-virtual {v4, v5}, LDd;->a(Ljava/lang/Object;)I

    .line 61
    .line 62
    .line 63
    :cond_5
    invoke-virtual {v0, p0, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-eqz v5, :cond_7

    .line 68
    .line 69
    :cond_6
    :goto_1
    invoke-virtual {p0}, LL7;->r()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    const-wide/16 v2, 0x0

    .line 74
    .line 75
    cmp-long v0, v0, v2

    .line 76
    .line 77
    if-lez v0, :cond_6

    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 80
    .line 81
    .line 82
    sget-object v0, LL7;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, LK7;

    .line 89
    .line 90
    return-void

    .line 91
    :cond_7
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    if-eq v5, v3, :cond_5

    .line 96
    .line 97
    goto :goto_0
.end method

.method public o(Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, LL7;->p()V

    .line 2
    .line 3
    .line 4
    :goto_0
    sget-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget-object v2, LL7;->j:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 11
    .line 12
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    if-nez v1, :cond_3

    .line 20
    .line 21
    :cond_1
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, p0, v1, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_2
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    instance-of v2, v1, LDd;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    if-eqz v2, :cond_7

    .line 40
    .line 41
    move-object v2, v1

    .line 42
    check-cast v2, LDd;

    .line 43
    .line 44
    invoke-virtual {v2, p1}, LDd;->a(Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_b

    .line 49
    .line 50
    if-eq v4, v3, :cond_4

    .line 51
    .line 52
    const/4 v0, 0x2

    .line 53
    if-eq v4, v0, :cond_8

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    invoke-virtual {v2}, LDd;->c()LDd;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_5
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_6

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_6
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    if-eq v3, v1, :cond_5

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_7
    sget-object v2, LMk;->e:Li0;

    .line 75
    .line 76
    if-ne v1, v2, :cond_9

    .line 77
    .line 78
    :cond_8
    :goto_1
    sget-object v0, Ly6;->k:Ly6;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ly6;->o(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_9
    new-instance v2, LDd;

    .line 85
    .line 86
    const/16 v4, 0x8

    .line 87
    .line 88
    invoke-direct {v2, v4, v3}, LDd;-><init>(IZ)V

    .line 89
    .line 90
    .line 91
    move-object v3, v1

    .line 92
    check-cast v3, Ljava/lang/Runnable;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, LDd;->a(Ljava/lang/Object;)I

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, p1}, LDd;->a(Ljava/lang/Object;)I

    .line 98
    .line 99
    .line 100
    :cond_a
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_d

    .line 105
    .line 106
    :cond_b
    :goto_2
    invoke-virtual {p0}, LM7;->h()Ljava/lang/Thread;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eq v0, p1, :cond_c

    .line 115
    .line 116
    invoke-static {p1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 117
    .line 118
    .line 119
    :cond_c
    :goto_3
    return-void

    .line 120
    :cond_d
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    if-eq v3, v1, :cond_a

    .line 125
    .line 126
    goto :goto_0
.end method

.method public final p()V
    .locals 1

    .line 1
    sget-object v0, LL7;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LK7;

    .line 8
    .line 9
    return-void
.end method

.method public final q()Z
    .locals 7

    .line 1
    iget-object v0, p0, LM7;->g:LZ2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, LZ2;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v2

    .line 16
    :cond_1
    sget-object v0, LL7;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, LK7;

    .line 23
    .line 24
    sget-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    instance-of v3, v0, LDd;

    .line 34
    .line 35
    if-eqz v3, :cond_3

    .line 36
    .line 37
    check-cast v0, LDd;

    .line 38
    .line 39
    sget-object v3, LDd;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    const-wide/32 v5, 0x3fffffff

    .line 46
    .line 47
    .line 48
    and-long/2addr v5, v3

    .line 49
    long-to-int v0, v5

    .line 50
    const-wide v5, 0xfffffffc0000000L

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    and-long/2addr v3, v5

    .line 56
    const/16 v5, 0x1e

    .line 57
    .line 58
    shr-long/2addr v3, v5

    .line 59
    long-to-int v3, v3

    .line 60
    if-ne v0, v3, :cond_4

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    sget-object v3, LMk;->e:Li0;

    .line 64
    .line 65
    if-ne v0, v3, :cond_4

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    move v1, v2

    .line 69
    :goto_1
    return v1
.end method

.method public final r()J
    .locals 9

    .line 1
    invoke-virtual {p0}, LM7;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-wide v1

    .line 10
    :cond_0
    invoke-virtual {p0}, LL7;->p()V

    .line 11
    .line 12
    .line 13
    :goto_0
    sget-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x0

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    instance-of v5, v3, LDd;

    .line 24
    .line 25
    if-eqz v5, :cond_5

    .line 26
    .line 27
    move-object v4, v3

    .line 28
    check-cast v4, LDd;

    .line 29
    .line 30
    invoke-virtual {v4}, LDd;->d()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    sget-object v6, LDd;->g:Li0;

    .line 35
    .line 36
    if-eq v5, v6, :cond_2

    .line 37
    .line 38
    move-object v4, v5

    .line 39
    check-cast v4, Ljava/lang/Runnable;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    invoke-virtual {v4}, LDd;->c()LDd;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    :cond_3
    invoke-virtual {v0, p0, v3, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_4

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_4
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    if-eq v4, v3, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_5
    sget-object v5, LMk;->e:Li0;

    .line 61
    .line 62
    if-ne v3, v5, :cond_6

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_6
    invoke-virtual {v0, p0, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_e

    .line 70
    .line 71
    move-object v4, v3

    .line 72
    check-cast v4, Ljava/lang/Runnable;

    .line 73
    .line 74
    :goto_1
    if-eqz v4, :cond_7

    .line 75
    .line 76
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 77
    .line 78
    .line 79
    return-wide v1

    .line 80
    :cond_7
    iget-object v0, p0, LM7;->g:LZ2;

    .line 81
    .line 82
    const-wide v3, 0x7fffffffffffffffL

    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    if-nez v0, :cond_8

    .line 88
    .line 89
    :goto_2
    move-wide v5, v3

    .line 90
    goto :goto_3

    .line 91
    :cond_8
    invoke-virtual {v0}, LZ2;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_9

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_9
    move-wide v5, v1

    .line 99
    :goto_3
    cmp-long v0, v5, v1

    .line 100
    .line 101
    if-nez v0, :cond_a

    .line 102
    .line 103
    goto :goto_6

    .line 104
    :cond_a
    sget-object v0, LL7;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 105
    .line 106
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_c

    .line 111
    .line 112
    instance-of v5, v0, LDd;

    .line 113
    .line 114
    if-eqz v5, :cond_b

    .line 115
    .line 116
    check-cast v0, LDd;

    .line 117
    .line 118
    sget-object v5, LDd;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 119
    .line 120
    invoke-virtual {v5, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    const-wide/32 v7, 0x3fffffff

    .line 125
    .line 126
    .line 127
    and-long/2addr v7, v5

    .line 128
    long-to-int v0, v7

    .line 129
    const-wide v7, 0xfffffffc0000000L

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    and-long/2addr v5, v7

    .line 135
    const/16 v7, 0x1e

    .line 136
    .line 137
    shr-long/2addr v5, v7

    .line 138
    long-to-int v5, v5

    .line 139
    if-ne v0, v5, :cond_d

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_b
    sget-object v5, LMk;->e:Li0;

    .line 143
    .line 144
    if-ne v0, v5, :cond_d

    .line 145
    .line 146
    :goto_4
    move-wide v1, v3

    .line 147
    goto :goto_6

    .line 148
    :cond_c
    :goto_5
    sget-object v0, LL7;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 149
    .line 150
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, LK7;

    .line 155
    .line 156
    goto :goto_4

    .line 157
    :cond_d
    :goto_6
    return-wide v1

    .line 158
    :cond_e
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    if-eq v5, v3, :cond_6

    .line 163
    .line 164
    goto/16 :goto_0
.end method
