.class public LE3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LY3;


# static fields
.field public static final synthetic e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic h:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

.field public static final synthetic i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic l:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field public static final synthetic m:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _closeCause$volatile:Ljava/lang/Object;

.field private volatile synthetic bufferEnd$volatile:J

.field private volatile synthetic bufferEndSegment$volatile:Ljava/lang/Object;

.field public final c:I

.field private volatile synthetic closeHandler$volatile:Ljava/lang/Object;

.field private volatile synthetic completedExpandBuffersAndPauseFlag$volatile:J

.field public final d:LJ9;

.field private volatile synthetic receiveSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic receivers$volatile:J

.field private volatile synthetic sendSegment$volatile:Ljava/lang/Object;

.field private volatile synthetic sendersAndCloseStatus$volatile:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "sendersAndCloseStatus$volatile"

    .line 2
    .line 3
    const-class v1, LE3;

    .line 4
    .line 5
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    const-string v0, "receivers$volatile"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 18
    .line 19
    const-string v0, "bufferEnd$volatile"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 26
    .line 27
    const-string v0, "completedExpandBuffersAndPauseFlag$volatile"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, LE3;->h:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 34
    .line 35
    const-string v0, "sendSegment$volatile"

    .line 36
    .line 37
    const-class v2, Ljava/lang/Object;

    .line 38
    .line 39
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 44
    .line 45
    const-string v0, "receiveSegment$volatile"

    .line 46
    .line 47
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 52
    .line 53
    const-string v0, "bufferEndSegment$volatile"

    .line 54
    .line 55
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 60
    .line 61
    const-string v0, "_closeCause$volatile"

    .line 62
    .line 63
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, LE3;->l:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 68
    .line 69
    const-string v0, "closeHandler$volatile"

    .line 70
    .line 71
    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, LE3;->m:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>(ILJ9;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LE3;->c:I

    .line 5
    .line 6
    iput-object p2, p0, LE3;->d:LJ9;

    .line 7
    .line 8
    if-ltz p1, :cond_3

    .line 9
    .line 10
    sget-object p2, LG3;->a:Lf4;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const p2, 0x7fffffff

    .line 15
    .line 16
    .line 17
    if-eq p1, p2, :cond_0

    .line 18
    .line 19
    int-to-long p1, p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-wide p1, 0x7fffffffffffffffL

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-wide/16 p1, 0x0

    .line 28
    .line 29
    :goto_0
    iput-wide p1, p0, LE3;->bufferEnd$volatile:J

    .line 30
    .line 31
    sget-object p1, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 34
    .line 35
    .line 36
    move-result-wide p1

    .line 37
    iput-wide p1, p0, LE3;->completedExpandBuffersAndPauseFlag$volatile:J

    .line 38
    .line 39
    new-instance p1, Lf4;

    .line 40
    .line 41
    const/4 v5, 0x3

    .line 42
    const-wide/16 v1, 0x0

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    move-object v0, p1

    .line 46
    move-object v4, p0

    .line 47
    invoke-direct/range {v0 .. v5}, Lf4;-><init>(JLf4;LE3;I)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, LE3;->sendSegment$volatile:Ljava/lang/Object;

    .line 51
    .line 52
    iput-object p1, p0, LE3;->receiveSegment$volatile:Ljava/lang/Object;

    .line 53
    .line 54
    invoke-virtual {p0}, LE3;->t()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_2

    .line 59
    .line 60
    sget-object p1, LG3;->a:Lf4;

    .line 61
    .line 62
    const-string p2, "null cannot be cast to non-null type kotlinx.coroutines.channels.ChannelSegment<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 63
    .line 64
    invoke-static {p2, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iput-object p1, p0, LE3;->bufferEndSegment$volatile:Ljava/lang/Object;

    .line 68
    .line 69
    sget-object p1, LG3;->s:Li0;

    .line 70
    .line 71
    iput-object p1, p0, LE3;->_closeCause$volatile:Ljava/lang/Object;

    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v0, "Invalid channel capacity: "

    .line 77
    .line 78
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p1, ", should be >=0"

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p2
.end method

.method public static final b(LE3;JLf4;)Lf4;
    .locals 12

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, LG3;->a:Lf4;

    .line 5
    .line 6
    sget-object v0, LF3;->k:LF3;

    .line 7
    .line 8
    :goto_0
    invoke-static {p3, p1, p2}, Lr3;->n(LYg;J)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, LMk;->y(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_4

    .line 17
    .line 18
    invoke-static {v0}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :cond_0
    :goto_1
    sget-object v2, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 23
    .line 24
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, LYg;

    .line 29
    .line 30
    iget-wide v4, v3, LYg;->c:J

    .line 31
    .line 32
    iget-wide v6, v1, LYg;->c:J

    .line 33
    .line 34
    cmp-long v4, v4, v6

    .line 35
    .line 36
    if-ltz v4, :cond_1

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_1
    invoke-virtual {v1}, LYg;->i()Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-nez v4, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-virtual {v2, p0, v3, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_3

    .line 51
    .line 52
    invoke-virtual {v3}, LYg;->e()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_4

    .line 57
    .line 58
    invoke-virtual {v3}, La5;->d()V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    if-eq v4, v3, :cond_2

    .line 67
    .line 68
    invoke-virtual {v1}, LYg;->e()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_0

    .line 73
    .line 74
    invoke-virtual {v1}, La5;->d()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    :goto_2
    invoke-static {v0}, LMk;->y(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/4 v2, 0x0

    .line 83
    sget-object v3, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    invoke-virtual {p0}, LE3;->j()V

    .line 88
    .line 89
    .line 90
    sget p1, LG3;->b:I

    .line 91
    .line 92
    int-to-long p1, p1

    .line 93
    iget-wide v0, p3, LYg;->c:J

    .line 94
    .line 95
    mul-long/2addr v0, p1

    .line 96
    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 97
    .line 98
    .line 99
    move-result-wide p0

    .line 100
    cmp-long p0, v0, p0

    .line 101
    .line 102
    if-gez p0, :cond_9

    .line 103
    .line 104
    :goto_3
    invoke-virtual {p3}, La5;->a()V

    .line 105
    .line 106
    .line 107
    goto :goto_5

    .line 108
    :cond_5
    invoke-static {v0}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    check-cast p3, Lf4;

    .line 113
    .line 114
    iget-wide v0, p3, LYg;->c:J

    .line 115
    .line 116
    cmp-long p1, v0, p1

    .line 117
    .line 118
    if-lez p1, :cond_8

    .line 119
    .line 120
    sget p1, LG3;->b:I

    .line 121
    .line 122
    int-to-long p1, p1

    .line 123
    mul-long/2addr p1, v0

    .line 124
    :cond_6
    sget-object v4, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 125
    .line 126
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v6

    .line 130
    const-wide v8, 0xfffffffffffffffL

    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    and-long/2addr v8, v6

    .line 136
    cmp-long v5, v8, p1

    .line 137
    .line 138
    if-ltz v5, :cond_7

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_7
    const/16 v5, 0x3c

    .line 142
    .line 143
    shr-long v10, v6, v5

    .line 144
    .line 145
    long-to-int v10, v10

    .line 146
    int-to-long v10, v10

    .line 147
    shl-long/2addr v10, v5

    .line 148
    add-long/2addr v8, v10

    .line 149
    move-object v5, p0

    .line 150
    invoke-virtual/range {v4 .. v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    if-eqz v4, :cond_6

    .line 155
    .line 156
    :goto_4
    sget p1, LG3;->b:I

    .line 157
    .line 158
    int-to-long p1, p1

    .line 159
    mul-long/2addr v0, p1

    .line 160
    invoke-virtual {v3, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 161
    .line 162
    .line 163
    move-result-wide p0

    .line 164
    cmp-long p0, v0, p0

    .line 165
    .line 166
    if-gez p0, :cond_9

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_8
    move-object v2, p3

    .line 170
    :cond_9
    :goto_5
    return-object v2
.end method

.method public static final c(LE3;Ljava/lang/Object;LP3;)V
    .locals 2

    .line 1
    iget-object v0, p0, LE3;->d:LJ9;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p2, LP3;->g:LY5;

    .line 6
    .line 7
    invoke-static {v0, p1, v1}, LMk;->b(LJ9;Ljava/lang/Object;LY5;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, LE3;->o()Ljava/lang/Throwable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p2, p0}, LP3;->h(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static final e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2, p3}, Lf4;->m(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    if-eqz p7, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual/range {p0 .. p7}, LE3;->A(Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    invoke-virtual {p1, p2}, Lf4;->k(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p0, p4, p5}, LE3;->g(J)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    sget-object v0, LG3;->d:Li0;

    .line 29
    .line 30
    invoke-virtual {p1, v2, p2, v0}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    move p0, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    if-nez p6, :cond_3

    .line 39
    .line 40
    const/4 p0, 0x3

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    invoke-virtual {p1, v2, p2, p6}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x2

    .line 49
    goto :goto_0

    .line 50
    :cond_4
    instance-of v3, v0, Lbk;

    .line 51
    .line 52
    if-eqz v3, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1, p2, v2}, Lf4;->m(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0, p3}, LE3;->x(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    sget-object p0, LG3;->i:Li0;

    .line 64
    .line 65
    invoke-virtual {p1, p2, p0}, Lf4;->n(ILjava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    goto :goto_0

    .line 70
    :cond_5
    sget-object p0, LG3;->k:Li0;

    .line 71
    .line 72
    iget-object p3, p1, Lf4;->f:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 73
    .line 74
    mul-int/lit8 p4, p2, 0x2

    .line 75
    .line 76
    add-int/2addr p4, v1

    .line 77
    invoke-virtual {p3, p4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    if-eq p3, p0, :cond_6

    .line 82
    .line 83
    invoke-virtual {p1, p2, v1}, Lf4;->l(IZ)V

    .line 84
    .line 85
    .line 86
    :cond_6
    const/4 p0, 0x5

    .line 87
    :goto_0
    return p0
.end method

.method public static q(LE3;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, LE3;->h:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 5
    .line 6
    const-wide/16 v1, 0x1

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 13
    .line 14
    and-long/2addr v1, v3

    .line 15
    const-wide/16 v5, 0x0

    .line 16
    .line 17
    cmp-long v1, v1, v5

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    :goto_0
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    and-long/2addr v1, v3

    .line 26
    cmp-long v1, v1, v5

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public static y(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p0, LO3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<kotlin.Unit>"

    .line 6
    .line 7
    invoke-static {v0, p0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    check-cast p0, LO3;

    .line 11
    .line 12
    sget-object v0, Lfj;->a:Lfj;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {p0, v0, v1}, LG3;->a(LO3;Ljava/lang/Object;LO9;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "Unexpected waiter: "

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0
.end method


# virtual methods
.method public final A(Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I
    .locals 5

    .line 1
    :cond_0
    invoke-virtual {p1, p2}, Lf4;->k(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x4

    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    invoke-virtual {p0, p4, p5}, LE3;->g(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    if-nez p7, :cond_1

    .line 17
    .line 18
    sget-object v0, LG3;->d:Li0;

    .line 19
    .line 20
    invoke-virtual {p1, v3, p2, v0}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    if-eqz p7, :cond_2

    .line 28
    .line 29
    sget-object v0, LG3;->j:Li0;

    .line 30
    .line 31
    invoke-virtual {p1, v3, p2, v0}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p1}, LYg;->h()V

    .line 38
    .line 39
    .line 40
    return v2

    .line 41
    :cond_2
    if-nez p6, :cond_3

    .line 42
    .line 43
    const/4 p1, 0x3

    .line 44
    return p1

    .line 45
    :cond_3
    invoke-virtual {p1, v3, p2, p6}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const/4 p1, 0x2

    .line 52
    return p1

    .line 53
    :cond_4
    sget-object v4, LG3;->e:Li0;

    .line 54
    .line 55
    if-ne v0, v4, :cond_5

    .line 56
    .line 57
    sget-object v2, LG3;->d:Li0;

    .line 58
    .line 59
    invoke-virtual {p1, v0, p2, v2}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    return v1

    .line 66
    :cond_5
    sget-object p4, LG3;->k:Li0;

    .line 67
    .line 68
    const/4 p5, 0x5

    .line 69
    if-ne v0, p4, :cond_6

    .line 70
    .line 71
    invoke-virtual {p1, p2, v3}, Lf4;->m(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return p5

    .line 75
    :cond_6
    sget-object p6, LG3;->h:Li0;

    .line 76
    .line 77
    if-ne v0, p6, :cond_7

    .line 78
    .line 79
    invoke-virtual {p1, p2, v3}, Lf4;->m(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return p5

    .line 83
    :cond_7
    sget-object p6, LG3;->l:Li0;

    .line 84
    .line 85
    if-ne v0, p6, :cond_8

    .line 86
    .line 87
    invoke-virtual {p1, p2, v3}, Lf4;->m(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, LE3;->j()V

    .line 91
    .line 92
    .line 93
    return v2

    .line 94
    :cond_8
    invoke-virtual {p1, p2, v3}, Lf4;->m(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    instance-of p6, v0, Lck;

    .line 98
    .line 99
    if-eqz p6, :cond_9

    .line 100
    .line 101
    check-cast v0, Lck;

    .line 102
    .line 103
    iget-object v0, v0, Lck;->a:Lbk;

    .line 104
    .line 105
    :cond_9
    invoke-virtual {p0, v0, p3}, LE3;->x(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-eqz p3, :cond_a

    .line 110
    .line 111
    sget-object p3, LG3;->i:Li0;

    .line 112
    .line 113
    invoke-virtual {p1, p2, p3}, Lf4;->n(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    const/4 p5, 0x0

    .line 117
    goto :goto_0

    .line 118
    :cond_a
    iget-object p3, p1, Lf4;->f:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 119
    .line 120
    mul-int/lit8 p6, p2, 0x2

    .line 121
    .line 122
    add-int/2addr p6, v1

    .line 123
    invoke-virtual {p3, p6, p4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    if-eq p3, p4, :cond_b

    .line 128
    .line 129
    invoke-virtual {p1, p2, v1}, Lf4;->l(IZ)V

    .line 130
    .line 131
    .line 132
    :cond_b
    :goto_0
    return p5
.end method

.method public final a(Ljava/util/concurrent/CancellationException;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/util/concurrent/CancellationException;

    .line 4
    .line 5
    const-string v0, "Channel was cancelled"

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, p1, v0}, LE3;->h(Ljava/lang/Throwable;Z)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d(Lr5;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 26

    .line 1
    move-object/from16 v9, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    sget-object v10, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 6
    .line 7
    invoke-virtual {v10, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lf4;

    .line 12
    .line 13
    :cond_0
    :goto_0
    sget-object v11, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    invoke-virtual {v11, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    const-wide v12, 0xfffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    and-long v14, v2, v12

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    invoke-virtual {v9, v2, v3, v8}, LE3;->r(JZ)Z

    .line 28
    .line 29
    .line 30
    move-result v16

    .line 31
    sget v7, LG3;->b:I

    .line 32
    .line 33
    int-to-long v2, v7

    .line 34
    div-long v4, v14, v2

    .line 35
    .line 36
    rem-long v2, v14, v2

    .line 37
    .line 38
    long-to-int v6, v2

    .line 39
    iget-wide v2, v1, LYg;->c:J

    .line 40
    .line 41
    cmp-long v2, v2, v4

    .line 42
    .line 43
    sget-object v3, Lfj;->a:Lfj;

    .line 44
    .line 45
    sget-object v12, Li6;->c:Li6;

    .line 46
    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-static {v9, v4, v5, v1}, LE3;->b(LE3;JLf4;)Lf4;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    if-eqz v16, :cond_0

    .line 56
    .line 57
    invoke-virtual/range {p0 .. p2}, LE3;->v(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-ne v0, v12, :cond_1b

    .line 62
    .line 63
    :goto_1
    move-object v3, v0

    .line 64
    goto/16 :goto_e

    .line 65
    .line 66
    :cond_1
    move-object v13, v2

    .line 67
    goto :goto_2

    .line 68
    :cond_2
    move-object v13, v1

    .line 69
    :goto_2
    const/16 v19, 0x0

    .line 70
    .line 71
    move-object/from16 v1, p0

    .line 72
    .line 73
    move-object v2, v13

    .line 74
    move-object v5, v3

    .line 75
    move v3, v6

    .line 76
    move-object/from16 v4, p2

    .line 77
    .line 78
    move-object/from16 v21, v5

    .line 79
    .line 80
    move/from16 v20, v6

    .line 81
    .line 82
    move-wide v5, v14

    .line 83
    move/from16 v22, v7

    .line 84
    .line 85
    move-object/from16 v7, v19

    .line 86
    .line 87
    move v0, v8

    .line 88
    move/from16 v8, v16

    .line 89
    .line 90
    invoke-static/range {v1 .. v8}, LE3;->e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1a

    .line 95
    .line 96
    const/4 v8, 0x1

    .line 97
    if-eq v1, v8, :cond_6

    .line 98
    .line 99
    const/4 v7, 0x2

    .line 100
    if-eq v1, v7, :cond_19

    .line 101
    .line 102
    sget-object v5, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 103
    .line 104
    const/4 v6, 0x5

    .line 105
    const/4 v4, 0x4

    .line 106
    const/4 v3, 0x3

    .line 107
    if-eq v1, v3, :cond_7

    .line 108
    .line 109
    if-eq v1, v4, :cond_4

    .line 110
    .line 111
    if-eq v1, v6, :cond_3

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_3
    invoke-virtual {v13}, La5;->a()V

    .line 115
    .line 116
    .line 117
    :goto_3
    move-object/from16 v0, p2

    .line 118
    .line 119
    move-object v1, v13

    .line 120
    goto :goto_0

    .line 121
    :cond_4
    invoke-virtual {v5, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    cmp-long v0, v14, v0

    .line 126
    .line 127
    if-gez v0, :cond_5

    .line 128
    .line 129
    invoke-virtual {v13}, La5;->a()V

    .line 130
    .line 131
    .line 132
    :cond_5
    invoke-virtual/range {p0 .. p2}, LE3;->v(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    if-ne v3, v12, :cond_6

    .line 137
    .line 138
    goto/16 :goto_e

    .line 139
    .line 140
    :cond_6
    move-object/from16 v3, v21

    .line 141
    .line 142
    goto/16 :goto_e

    .line 143
    .line 144
    :cond_7
    invoke-static/range {p1 .. p1}, LMk;->w(Lr5;)Lr5;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-static {v1}, Llc;->r(Lr5;)LP3;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const/16 v16, 0x0

    .line 153
    .line 154
    move-object/from16 v1, p0

    .line 155
    .line 156
    move-object/from16 p1, v2

    .line 157
    .line 158
    move-object v2, v13

    .line 159
    move/from16 v3, v20

    .line 160
    .line 161
    move v0, v4

    .line 162
    move-object/from16 v4, p2

    .line 163
    .line 164
    move-object/from16 v23, v5

    .line 165
    .line 166
    move-wide v5, v14

    .line 167
    move v0, v7

    .line 168
    move-object/from16 v7, p1

    .line 169
    .line 170
    move v0, v8

    .line 171
    move/from16 v8, v16

    .line 172
    .line 173
    :try_start_0
    invoke-static/range {v1 .. v8}, LE3;->e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 174
    .line 175
    .line 176
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 177
    if-eqz v1, :cond_17

    .line 178
    .line 179
    if-eq v1, v0, :cond_11

    .line 180
    .line 181
    const/4 v2, 0x2

    .line 182
    if-eq v1, v2, :cond_16

    .line 183
    .line 184
    const/4 v2, 0x4

    .line 185
    if-eq v1, v2, :cond_14

    .line 186
    .line 187
    const-string v14, "unexpected"

    .line 188
    .line 189
    const/4 v15, 0x5

    .line 190
    if-ne v1, v15, :cond_13

    .line 191
    .line 192
    :try_start_1
    invoke-virtual {v13}, La5;->a()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v10, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Lf4;

    .line 200
    .line 201
    :goto_4
    invoke-virtual {v11, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 202
    .line 203
    .line 204
    move-result-wide v2

    .line 205
    const-wide v16, 0xfffffffffffffffL

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    and-long v24, v2, v16

    .line 211
    .line 212
    const/4 v4, 0x0

    .line 213
    invoke-virtual {v9, v2, v3, v4}, LE3;->r(JZ)Z

    .line 214
    .line 215
    .line 216
    move-result v10

    .line 217
    sget v13, LG3;->b:I

    .line 218
    .line 219
    int-to-long v2, v13

    .line 220
    div-long v5, v24, v2

    .line 221
    .line 222
    rem-long v2, v24, v2

    .line 223
    .line 224
    long-to-int v8, v2

    .line 225
    iget-wide v2, v1, LYg;->c:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 226
    .line 227
    cmp-long v2, v2, v5

    .line 228
    .line 229
    if-eqz v2, :cond_a

    .line 230
    .line 231
    :try_start_2
    invoke-static {v9, v5, v6, v1}, LE3;->b(LE3;JLf4;)Lf4;

    .line 232
    .line 233
    .line 234
    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 235
    if-nez v2, :cond_9

    .line 236
    .line 237
    if-eqz v10, :cond_8

    .line 238
    .line 239
    move-object/from16 v5, p1

    .line 240
    .line 241
    move-object/from16 v7, p2

    .line 242
    .line 243
    :try_start_3
    invoke-static {v9, v7, v5}, LE3;->c(LE3;Ljava/lang/Object;LP3;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 244
    .line 245
    .line 246
    move-object v2, v5

    .line 247
    :goto_5
    move-object/from16 v3, v21

    .line 248
    .line 249
    goto/16 :goto_b

    .line 250
    .line 251
    :catchall_0
    move-exception v0

    .line 252
    :goto_6
    move-object v2, v5

    .line 253
    goto/16 :goto_d

    .line 254
    .line 255
    :cond_8
    move-object/from16 v7, p2

    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_9
    move-object/from16 v5, p1

    .line 259
    .line 260
    move-object/from16 v7, p2

    .line 261
    .line 262
    move/from16 v18, v4

    .line 263
    .line 264
    move-object v6, v2

    .line 265
    goto :goto_7

    .line 266
    :catchall_1
    move-exception v0

    .line 267
    move-object/from16 v5, p1

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_a
    move-object/from16 v5, p1

    .line 271
    .line 272
    move-object/from16 v7, p2

    .line 273
    .line 274
    move/from16 v18, v4

    .line 275
    .line 276
    move-object v6, v1

    .line 277
    :goto_7
    move-object/from16 v1, p0

    .line 278
    .line 279
    move-object v2, v6

    .line 280
    move v3, v8

    .line 281
    move-object/from16 v4, p2

    .line 282
    .line 283
    move-object/from16 p1, v5

    .line 284
    .line 285
    move-object/from16 v19, v6

    .line 286
    .line 287
    move-wide/from16 v5, v24

    .line 288
    .line 289
    move-object/from16 v7, p1

    .line 290
    .line 291
    move/from16 v20, v8

    .line 292
    .line 293
    move v8, v10

    .line 294
    :try_start_4
    invoke-static/range {v1 .. v8}, LE3;->e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-eqz v1, :cond_12

    .line 299
    .line 300
    if-eq v1, v0, :cond_11

    .line 301
    .line 302
    const/4 v2, 0x2

    .line 303
    if-eq v1, v2, :cond_f

    .line 304
    .line 305
    const/4 v3, 0x3

    .line 306
    if-eq v1, v3, :cond_e

    .line 307
    .line 308
    const/4 v4, 0x4

    .line 309
    if-eq v1, v4, :cond_c

    .line 310
    .line 311
    if-eq v1, v15, :cond_b

    .line 312
    .line 313
    goto :goto_8

    .line 314
    :cond_b
    invoke-virtual/range {v19 .. v19}, La5;->a()V

    .line 315
    .line 316
    .line 317
    :goto_8
    move-object/from16 v1, v19

    .line 318
    .line 319
    goto :goto_4

    .line 320
    :catchall_2
    move-exception v0

    .line 321
    move-object/from16 v2, p1

    .line 322
    .line 323
    goto/16 :goto_d

    .line 324
    .line 325
    :cond_c
    move-object/from16 v0, v23

    .line 326
    .line 327
    invoke-virtual {v0, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 328
    .line 329
    .line 330
    move-result-wide v0

    .line 331
    cmp-long v0, v24, v0

    .line 332
    .line 333
    if-gez v0, :cond_d

    .line 334
    .line 335
    invoke-virtual/range {v19 .. v19}, La5;->a()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 336
    .line 337
    .line 338
    :cond_d
    move-object/from16 v2, p1

    .line 339
    .line 340
    move-object/from16 v1, p2

    .line 341
    .line 342
    :goto_9
    :try_start_5
    invoke-static {v9, v1, v2}, LE3;->c(LE3;Ljava/lang/Object;LP3;)V

    .line 343
    .line 344
    .line 345
    goto :goto_5

    .line 346
    :cond_e
    move-object/from16 v2, p1

    .line 347
    .line 348
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 349
    .line 350
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    throw v0

    .line 358
    :catchall_3
    move-exception v0

    .line 359
    goto/16 :goto_d

    .line 360
    .line 361
    :cond_f
    move-object/from16 v2, p1

    .line 362
    .line 363
    move-object/from16 v1, p2

    .line 364
    .line 365
    if-eqz v10, :cond_10

    .line 366
    .line 367
    invoke-virtual/range {v19 .. v19}, LYg;->h()V

    .line 368
    .line 369
    .line 370
    goto :goto_9

    .line 371
    :cond_10
    add-int v8, v20, v13

    .line 372
    .line 373
    move-object/from16 v1, v19

    .line 374
    .line 375
    invoke-virtual {v2, v1, v8}, LP3;->a(LYg;I)V

    .line 376
    .line 377
    .line 378
    goto/16 :goto_5

    .line 379
    .line 380
    :cond_11
    move-object/from16 v2, p1

    .line 381
    .line 382
    move-object/from16 v3, v21

    .line 383
    .line 384
    invoke-virtual {v2, v3}, LP3;->h(Ljava/lang/Object;)V

    .line 385
    .line 386
    .line 387
    goto :goto_b

    .line 388
    :cond_12
    move-object/from16 v2, p1

    .line 389
    .line 390
    move-object/from16 v1, v19

    .line 391
    .line 392
    move-object/from16 v3, v21

    .line 393
    .line 394
    invoke-virtual {v1}, La5;->a()V

    .line 395
    .line 396
    .line 397
    :goto_a
    invoke-virtual {v2, v3}, LP3;->h(Ljava/lang/Object;)V

    .line 398
    .line 399
    .line 400
    goto :goto_b

    .line 401
    :cond_13
    move-object/from16 v2, p1

    .line 402
    .line 403
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 404
    .line 405
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    throw v0

    .line 413
    :cond_14
    move-object/from16 v2, p1

    .line 414
    .line 415
    move-object/from16 v1, p2

    .line 416
    .line 417
    move-object/from16 v3, v21

    .line 418
    .line 419
    move-object/from16 v0, v23

    .line 420
    .line 421
    invoke-virtual {v0, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 422
    .line 423
    .line 424
    move-result-wide v4

    .line 425
    cmp-long v0, v14, v4

    .line 426
    .line 427
    if-gez v0, :cond_15

    .line 428
    .line 429
    invoke-virtual {v13}, La5;->a()V

    .line 430
    .line 431
    .line 432
    :cond_15
    invoke-static {v9, v1, v2}, LE3;->c(LE3;Ljava/lang/Object;LP3;)V

    .line 433
    .line 434
    .line 435
    goto :goto_b

    .line 436
    :cond_16
    move-object/from16 v2, p1

    .line 437
    .line 438
    move-object/from16 v3, v21

    .line 439
    .line 440
    add-int v6, v20, v22

    .line 441
    .line 442
    invoke-virtual {v2, v13, v6}, LP3;->a(LYg;I)V

    .line 443
    .line 444
    .line 445
    goto :goto_b

    .line 446
    :cond_17
    move-object/from16 v2, p1

    .line 447
    .line 448
    move-object/from16 v3, v21

    .line 449
    .line 450
    invoke-virtual {v13}, La5;->a()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 451
    .line 452
    .line 453
    goto :goto_a

    .line 454
    :goto_b
    invoke-virtual {v2}, LP3;->o()Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    if-ne v0, v12, :cond_18

    .line 459
    .line 460
    goto :goto_c

    .line 461
    :cond_18
    move-object v0, v3

    .line 462
    :goto_c
    if-ne v0, v12, :cond_1b

    .line 463
    .line 464
    goto/16 :goto_1

    .line 465
    .line 466
    :goto_d
    invoke-virtual {v2}, LP3;->s()V

    .line 467
    .line 468
    .line 469
    throw v0

    .line 470
    :cond_19
    move-object/from16 v1, p2

    .line 471
    .line 472
    move-object/from16 v3, v21

    .line 473
    .line 474
    if-eqz v16, :cond_1b

    .line 475
    .line 476
    invoke-virtual {v13}, LYg;->h()V

    .line 477
    .line 478
    .line 479
    invoke-virtual/range {p0 .. p2}, LE3;->v(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    if-ne v0, v12, :cond_1b

    .line 484
    .line 485
    goto/16 :goto_1

    .line 486
    .line 487
    :cond_1a
    move-object/from16 v3, v21

    .line 488
    .line 489
    invoke-virtual {v13}, La5;->a()V

    .line 490
    .line 491
    .line 492
    :cond_1b
    :goto_e
    return-object v3
.end method

.method public final f(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, LE3;->h(Ljava/lang/Throwable;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    return p1
.end method

.method public final g(J)Z
    .locals 4

    .line 1
    sget-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    cmp-long v0, p1, v0

    .line 8
    .line 9
    if-ltz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget v2, p0, LE3;->c:I

    .line 18
    .line 19
    int-to-long v2, v2

    .line 20
    add-long/2addr v0, v2

    .line 21
    cmp-long p1, p1, v0

    .line 22
    .line 23
    if-gez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 29
    :goto_1
    return p1
.end method

.method public final h(Ljava/lang/Throwable;Z)Z
    .locals 13

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    const-wide v1, 0xfffffffffffffffL

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    sget-object v9, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 9
    .line 10
    const/4 v10, 0x1

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {v9, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v5

    .line 17
    shr-long v3, v5, v0

    .line 18
    .line 19
    long-to-int v3, v3

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    and-long v3, v5, v1

    .line 23
    .line 24
    sget-object v7, LG3;->a:Lf4;

    .line 25
    .line 26
    int-to-long v7, v10

    .line 27
    shl-long/2addr v7, v0

    .line 28
    add-long/2addr v7, v3

    .line 29
    move-object v3, v9

    .line 30
    move-object v4, p0

    .line 31
    invoke-virtual/range {v3 .. v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    :cond_1
    sget-object v3, LG3;->s:Li0;

    .line 38
    .line 39
    :cond_2
    sget-object v4, LE3;->l:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 40
    .line 41
    invoke-virtual {v4, p0, v3, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_3

    .line 46
    .line 47
    move v11, v10

    .line 48
    goto :goto_0

    .line 49
    :cond_3
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    if-eq v4, v3, :cond_2

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    move v11, p1

    .line 57
    :goto_0
    const/4 v12, 0x3

    .line 58
    if-eqz p2, :cond_5

    .line 59
    .line 60
    :cond_4
    invoke-virtual {v9, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    and-long p1, v5, v1

    .line 65
    .line 66
    int-to-long v3, v12

    .line 67
    shl-long/2addr v3, v0

    .line 68
    add-long v7, v3, p1

    .line 69
    .line 70
    move-object v3, v9

    .line 71
    move-object v4, p0

    .line 72
    invoke-virtual/range {v3 .. v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_4

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_5
    invoke-virtual {v9, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v5

    .line 83
    shr-long p1, v5, v0

    .line 84
    .line 85
    long-to-int p1, p1

    .line 86
    if-eqz p1, :cond_7

    .line 87
    .line 88
    if-eq p1, v10, :cond_6

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_6
    and-long p1, v5, v1

    .line 92
    .line 93
    int-to-long v3, v12

    .line 94
    :goto_1
    shl-long/2addr v3, v0

    .line 95
    add-long/2addr v3, p1

    .line 96
    move-wide v7, v3

    .line 97
    goto :goto_2

    .line 98
    :cond_7
    and-long p1, v5, v1

    .line 99
    .line 100
    const/4 v3, 0x2

    .line 101
    int-to-long v3, v3

    .line 102
    goto :goto_1

    .line 103
    :goto_2
    move-object v3, v9

    .line 104
    move-object v4, p0

    .line 105
    invoke-virtual/range {v3 .. v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_5

    .line 110
    .line 111
    :goto_3
    invoke-virtual {p0}, LE3;->j()V

    .line 112
    .line 113
    .line 114
    if-eqz v11, :cond_c

    .line 115
    .line 116
    :goto_4
    sget-object p1, LE3;->m:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    if-nez p2, :cond_8

    .line 123
    .line 124
    sget-object v0, LG3;->q:Li0;

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_8
    sget-object v0, LG3;->r:Li0;

    .line 128
    .line 129
    :cond_9
    :goto_5
    invoke-virtual {p1, p0, p2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_b

    .line 134
    .line 135
    if-nez p2, :cond_a

    .line 136
    .line 137
    goto :goto_6

    .line 138
    :cond_a
    invoke-static {v10, p2}, LSi;->b(ILjava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    check-cast p2, LJ9;

    .line 142
    .line 143
    invoke-virtual {p0}, LE3;->n()Ljava/lang/Throwable;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-interface {p2, p1}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    goto :goto_6

    .line 151
    :cond_b
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    if-eq v1, p2, :cond_9

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_c
    :goto_6
    return v11
.end method

.method public final i(J)Lf4;
    .locals 12

    .line 1
    sget-object v0, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lf4;

    .line 14
    .line 15
    iget-wide v2, v1, LYg;->c:J

    .line 16
    .line 17
    move-object v4, v0

    .line 18
    check-cast v4, Lf4;

    .line 19
    .line 20
    iget-wide v4, v4, LYg;->c:J

    .line 21
    .line 22
    cmp-long v2, v2, v4

    .line 23
    .line 24
    if-lez v2, :cond_0

    .line 25
    .line 26
    move-object v0, v1

    .line 27
    :cond_0
    sget-object v1, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lf4;

    .line 34
    .line 35
    iget-wide v2, v1, LYg;->c:J

    .line 36
    .line 37
    move-object v4, v0

    .line 38
    check-cast v4, Lf4;

    .line 39
    .line 40
    iget-wide v4, v4, LYg;->c:J

    .line 41
    .line 42
    cmp-long v2, v2, v4

    .line 43
    .line 44
    if-lez v2, :cond_1

    .line 45
    .line 46
    move-object v0, v1

    .line 47
    :cond_1
    check-cast v0, La5;

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    sget-object v1, La5;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v2, Lr3;->n:Li0;

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    if-ne v1, v2, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    check-cast v1, La5;

    .line 65
    .line 66
    if-nez v1, :cond_15

    .line 67
    .line 68
    :cond_3
    sget-object v1, La5;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 69
    .line 70
    invoke-virtual {v1, v0, v3, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_14

    .line 75
    .line 76
    :goto_1
    check-cast v0, Lf4;

    .line 77
    .line 78
    invoke-virtual {p0}, LE3;->s()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/4 v2, -0x1

    .line 83
    const/4 v4, 0x1

    .line 84
    if-eqz v1, :cond_a

    .line 85
    .line 86
    move-object v1, v0

    .line 87
    :cond_4
    sget v5, LG3;->b:I

    .line 88
    .line 89
    sub-int/2addr v5, v4

    .line 90
    :goto_2
    const-wide/16 v6, -0x1

    .line 91
    .line 92
    if-ge v2, v5, :cond_9

    .line 93
    .line 94
    sget v8, LG3;->b:I

    .line 95
    .line 96
    int-to-long v8, v8

    .line 97
    iget-wide v10, v1, LYg;->c:J

    .line 98
    .line 99
    mul-long/2addr v10, v8

    .line 100
    int-to-long v8, v5

    .line 101
    add-long/2addr v10, v8

    .line 102
    sget-object v8, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 103
    .line 104
    invoke-virtual {v8, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 105
    .line 106
    .line 107
    move-result-wide v8

    .line 108
    cmp-long v8, v10, v8

    .line 109
    .line 110
    if-gez v8, :cond_5

    .line 111
    .line 112
    :goto_3
    move-wide v10, v6

    .line 113
    goto :goto_5

    .line 114
    :cond_5
    invoke-virtual {v1, v5}, Lf4;->k(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v8

    .line 118
    if-eqz v8, :cond_7

    .line 119
    .line 120
    sget-object v9, LG3;->e:Li0;

    .line 121
    .line 122
    if-ne v8, v9, :cond_6

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_6
    sget-object v9, LG3;->d:Li0;

    .line 126
    .line 127
    if-ne v8, v9, :cond_8

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_7
    :goto_4
    sget-object v9, LG3;->l:Li0;

    .line 131
    .line 132
    invoke-virtual {v1, v8, v5, v9}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    if-eqz v8, :cond_5

    .line 137
    .line 138
    invoke-virtual {v1}, LYg;->h()V

    .line 139
    .line 140
    .line 141
    :cond_8
    add-int/lit8 v5, v5, -0x1

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_9
    sget-object v5, La5;->b:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 145
    .line 146
    invoke-virtual {v5, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, La5;

    .line 151
    .line 152
    check-cast v1, Lf4;

    .line 153
    .line 154
    if-nez v1, :cond_4

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :goto_5
    cmp-long v1, v10, v6

    .line 158
    .line 159
    if-eqz v1, :cond_a

    .line 160
    .line 161
    invoke-virtual {p0, v10, v11}, LE3;->k(J)V

    .line 162
    .line 163
    .line 164
    :cond_a
    move-object v1, v0

    .line 165
    :goto_6
    if-eqz v1, :cond_11

    .line 166
    .line 167
    sget v5, LG3;->b:I

    .line 168
    .line 169
    sub-int/2addr v5, v4

    .line 170
    :goto_7
    if-ge v2, v5, :cond_10

    .line 171
    .line 172
    sget v6, LG3;->b:I

    .line 173
    .line 174
    int-to-long v6, v6

    .line 175
    iget-wide v8, v1, LYg;->c:J

    .line 176
    .line 177
    mul-long/2addr v8, v6

    .line 178
    int-to-long v6, v5

    .line 179
    add-long/2addr v8, v6

    .line 180
    cmp-long v6, v8, p1

    .line 181
    .line 182
    if-ltz v6, :cond_11

    .line 183
    .line 184
    :cond_b
    invoke-virtual {v1, v5}, Lf4;->k(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    if-eqz v6, :cond_e

    .line 189
    .line 190
    sget-object v7, LG3;->e:Li0;

    .line 191
    .line 192
    if-ne v6, v7, :cond_c

    .line 193
    .line 194
    goto :goto_9

    .line 195
    :cond_c
    instance-of v7, v6, Lck;

    .line 196
    .line 197
    if-eqz v7, :cond_d

    .line 198
    .line 199
    sget-object v7, LG3;->l:Li0;

    .line 200
    .line 201
    invoke-virtual {v1, v6, v5, v7}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v7

    .line 205
    if-eqz v7, :cond_b

    .line 206
    .line 207
    check-cast v6, Lck;

    .line 208
    .line 209
    iget-object v6, v6, Lck;->a:Lbk;

    .line 210
    .line 211
    :goto_8
    invoke-static {v3, v6}, LSi;->A(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-virtual {v1, v5, v4}, Lf4;->l(IZ)V

    .line 216
    .line 217
    .line 218
    goto :goto_a

    .line 219
    :cond_d
    instance-of v7, v6, Lbk;

    .line 220
    .line 221
    if-eqz v7, :cond_f

    .line 222
    .line 223
    sget-object v7, LG3;->l:Li0;

    .line 224
    .line 225
    invoke-virtual {v1, v6, v5, v7}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v7

    .line 229
    if-eqz v7, :cond_b

    .line 230
    .line 231
    goto :goto_8

    .line 232
    :cond_e
    :goto_9
    sget-object v7, LG3;->l:Li0;

    .line 233
    .line 234
    invoke-virtual {v1, v6, v5, v7}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    if-eqz v6, :cond_b

    .line 239
    .line 240
    invoke-virtual {v1}, LYg;->h()V

    .line 241
    .line 242
    .line 243
    :cond_f
    :goto_a
    add-int/lit8 v5, v5, -0x1

    .line 244
    .line 245
    goto :goto_7

    .line 246
    :cond_10
    sget-object v5, La5;->b:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 247
    .line 248
    invoke-virtual {v5, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    check-cast v1, La5;

    .line 253
    .line 254
    check-cast v1, Lf4;

    .line 255
    .line 256
    goto :goto_6

    .line 257
    :cond_11
    if-eqz v3, :cond_13

    .line 258
    .line 259
    instance-of p1, v3, Ljava/util/ArrayList;

    .line 260
    .line 261
    if-nez p1, :cond_12

    .line 262
    .line 263
    check-cast v3, Lbk;

    .line 264
    .line 265
    invoke-virtual {p0, v3, v4}, LE3;->w(Lbk;Z)V

    .line 266
    .line 267
    .line 268
    goto :goto_c

    .line 269
    :cond_12
    check-cast v3, Ljava/util/ArrayList;

    .line 270
    .line 271
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    sub-int/2addr p1, v4

    .line 276
    :goto_b
    if-ge v2, p1, :cond_13

    .line 277
    .line 278
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    check-cast p2, Lbk;

    .line 283
    .line 284
    invoke-virtual {p0, p2, v4}, LE3;->w(Lbk;Z)V

    .line 285
    .line 286
    .line 287
    add-int/lit8 p1, p1, -0x1

    .line 288
    .line 289
    goto :goto_b

    .line 290
    :cond_13
    :goto_c
    return-object v0

    .line 291
    :cond_14
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    if-eqz v1, :cond_3

    .line 296
    .line 297
    goto/16 :goto_0

    .line 298
    .line 299
    :cond_15
    move-object v0, v1

    .line 300
    goto/16 :goto_0
.end method

.method public final iterator()LC3;
    .locals 1

    .line 1
    new-instance v0, LC3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LC3;-><init>(LE3;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final j()V
    .locals 3

    .line 1
    sget-object v0, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v0, v1, v2}, LE3;->r(JZ)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k(J)V
    .locals 10

    .line 1
    sget-object v0, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lf4;

    .line 8
    .line 9
    :cond_0
    :goto_0
    sget-object v1, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 10
    .line 11
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v8

    .line 15
    iget v2, p0, LE3;->c:I

    .line 16
    .line 17
    int-to-long v2, v2

    .line 18
    add-long/2addr v2, v8

    .line 19
    sget-object v4, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 20
    .line 21
    invoke-virtual {v4, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    cmp-long v2, p1, v2

    .line 30
    .line 31
    if-gez v2, :cond_1

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const-wide/16 v2, 0x1

    .line 35
    .line 36
    add-long v5, v8, v2

    .line 37
    .line 38
    move-object v2, p0

    .line 39
    move-wide v3, v8

    .line 40
    invoke-virtual/range {v1 .. v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    sget v1, LG3;->b:I

    .line 47
    .line 48
    int-to-long v1, v1

    .line 49
    div-long v3, v8, v1

    .line 50
    .line 51
    rem-long v1, v8, v1

    .line 52
    .line 53
    long-to-int v1, v1

    .line 54
    iget-wide v5, v0, LYg;->c:J

    .line 55
    .line 56
    cmp-long v2, v5, v3

    .line 57
    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0, v3, v4, v0}, LE3;->m(JLf4;)Lf4;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-nez v2, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    move-object v0, v2

    .line 68
    :cond_3
    const/4 v7, 0x0

    .line 69
    move-object v2, p0

    .line 70
    move-object v3, v0

    .line 71
    move v4, v1

    .line 72
    move-wide v5, v8

    .line 73
    invoke-virtual/range {v2 .. v7}, LE3;->z(Lf4;IJLC3;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget-object v2, LG3;->o:Li0;

    .line 78
    .line 79
    if-ne v1, v2, :cond_4

    .line 80
    .line 81
    invoke-virtual {p0}, LE3;->p()J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    cmp-long v1, v8, v1

    .line 86
    .line 87
    if-gez v1, :cond_0

    .line 88
    .line 89
    invoke-virtual {v0}, La5;->a()V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {v0}, La5;->a()V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, LE3;->d:LJ9;

    .line 97
    .line 98
    if-eqz v2, :cond_0

    .line 99
    .line 100
    const/4 v3, 0x0

    .line 101
    invoke-static {v2, v1, v3}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    if-nez v1, :cond_5

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_5
    throw v1
.end method

.method public final l()V
    .locals 16

    .line 1
    move-object/from16 v6, p0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, LE3;->t()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v7, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 11
    .line 12
    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lf4;

    .line 17
    .line 18
    move-object v8, v0

    .line 19
    :goto_0
    sget-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 20
    .line 21
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v9

    .line 25
    sget v0, LG3;->b:I

    .line 26
    .line 27
    int-to-long v0, v0

    .line 28
    div-long v0, v9, v0

    .line 29
    .line 30
    invoke-virtual/range {p0 .. p0}, LE3;->p()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    cmp-long v2, v2, v9

    .line 35
    .line 36
    if-gtz v2, :cond_2

    .line 37
    .line 38
    iget-wide v2, v8, LYg;->c:J

    .line 39
    .line 40
    cmp-long v2, v2, v0

    .line 41
    .line 42
    if-gez v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {v8}, La5;->b()La5;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {v6, v0, v1, v8}, LE3;->u(JLf4;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static/range {p0 .. p0}, LE3;->q(LE3;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-wide v2, v8, LYg;->c:J

    .line 58
    .line 59
    cmp-long v2, v2, v0

    .line 60
    .line 61
    if-eqz v2, :cond_d

    .line 62
    .line 63
    sget-object v2, LF3;->k:LF3;

    .line 64
    .line 65
    :goto_1
    invoke-static {v8, v0, v1}, Lr3;->n(LYg;J)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v2}, LMk;->y(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-nez v3, :cond_7

    .line 74
    .line 75
    invoke-static {v2}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    :cond_3
    :goto_2
    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    check-cast v4, LYg;

    .line 84
    .line 85
    iget-wide v11, v4, LYg;->c:J

    .line 86
    .line 87
    iget-wide v13, v3, LYg;->c:J

    .line 88
    .line 89
    cmp-long v5, v11, v13

    .line 90
    .line 91
    if-ltz v5, :cond_4

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_4
    invoke-virtual {v3}, LYg;->i()Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-nez v5, :cond_5

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_5
    invoke-virtual {v7, v6, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-eqz v5, :cond_6

    .line 106
    .line 107
    invoke-virtual {v4}, LYg;->e()Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_7

    .line 112
    .line 113
    invoke-virtual {v4}, La5;->d()V

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_6
    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    if-eq v5, v4, :cond_5

    .line 122
    .line 123
    invoke-virtual {v3}, LYg;->e()Z

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    if-eqz v4, :cond_3

    .line 128
    .line 129
    invoke-virtual {v3}, La5;->d()V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    :goto_3
    invoke-static {v2}, LMk;->y(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    const/4 v11, 0x0

    .line 138
    if-eqz v3, :cond_9

    .line 139
    .line 140
    invoke-virtual/range {p0 .. p0}, LE3;->j()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6, v0, v1, v8}, LE3;->u(JLf4;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    invoke-static/range {p0 .. p0}, LE3;->q(LE3;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_9
    invoke-static {v2}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lf4;

    .line 155
    .line 156
    iget-wide v3, v2, LYg;->c:J

    .line 157
    .line 158
    cmp-long v0, v3, v0

    .line 159
    .line 160
    if-lez v0, :cond_a

    .line 161
    .line 162
    const-wide/16 v0, 0x1

    .line 163
    .line 164
    add-long v12, v9, v0

    .line 165
    .line 166
    sget v0, LG3;->b:I

    .line 167
    .line 168
    int-to-long v0, v0

    .line 169
    mul-long v14, v3, v0

    .line 170
    .line 171
    sget-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 172
    .line 173
    move-object/from16 v1, p0

    .line 174
    .line 175
    move-wide v2, v12

    .line 176
    move-wide v4, v14

    .line 177
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-eqz v0, :cond_8

    .line 182
    .line 183
    sub-long/2addr v14, v9

    .line 184
    sget-object v0, LE3;->h:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 185
    .line 186
    invoke-virtual {v0, v6, v14, v15}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->addAndGet(Ljava/lang/Object;J)J

    .line 187
    .line 188
    .line 189
    move-result-wide v1

    .line 190
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 191
    .line 192
    and-long/2addr v1, v3

    .line 193
    const-wide/16 v12, 0x0

    .line 194
    .line 195
    cmp-long v1, v1, v12

    .line 196
    .line 197
    if-eqz v1, :cond_b

    .line 198
    .line 199
    :goto_4
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 200
    .line 201
    .line 202
    move-result-wide v1

    .line 203
    and-long/2addr v1, v3

    .line 204
    cmp-long v1, v1, v12

    .line 205
    .line 206
    if-eqz v1, :cond_b

    .line 207
    .line 208
    goto :goto_4

    .line 209
    :cond_a
    move-object v11, v2

    .line 210
    :cond_b
    :goto_5
    if-nez v11, :cond_c

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :cond_c
    move-object v8, v11

    .line 215
    :cond_d
    sget v0, LG3;->b:I

    .line 216
    .line 217
    int-to-long v0, v0

    .line 218
    rem-long v0, v9, v0

    .line 219
    .line 220
    long-to-int v0, v0

    .line 221
    invoke-virtual {v8, v0}, Lf4;->k(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    instance-of v2, v1, Lbk;

    .line 226
    .line 227
    sget-object v3, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 228
    .line 229
    if-eqz v2, :cond_f

    .line 230
    .line 231
    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 232
    .line 233
    .line 234
    move-result-wide v4

    .line 235
    cmp-long v2, v9, v4

    .line 236
    .line 237
    if-ltz v2, :cond_f

    .line 238
    .line 239
    sget-object v2, LG3;->g:Li0;

    .line 240
    .line 241
    invoke-virtual {v8, v1, v0, v2}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    if-eqz v2, :cond_f

    .line 246
    .line 247
    invoke-static {v1}, LE3;->y(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-eqz v1, :cond_e

    .line 252
    .line 253
    sget-object v1, LG3;->d:Li0;

    .line 254
    .line 255
    invoke-virtual {v8, v0, v1}, Lf4;->n(ILjava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    goto/16 :goto_8

    .line 259
    .line 260
    :cond_e
    sget-object v1, LG3;->j:Li0;

    .line 261
    .line 262
    invoke-virtual {v8, v0, v1}, Lf4;->n(ILjava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v8}, LYg;->h()V

    .line 266
    .line 267
    .line 268
    goto :goto_7

    .line 269
    :cond_f
    :goto_6
    invoke-virtual {v8, v0}, Lf4;->k(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    instance-of v2, v1, Lbk;

    .line 274
    .line 275
    if-eqz v2, :cond_12

    .line 276
    .line 277
    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 278
    .line 279
    .line 280
    move-result-wide v4

    .line 281
    cmp-long v2, v9, v4

    .line 282
    .line 283
    if-gez v2, :cond_10

    .line 284
    .line 285
    new-instance v2, Lck;

    .line 286
    .line 287
    move-object v4, v1

    .line 288
    check-cast v4, Lbk;

    .line 289
    .line 290
    invoke-direct {v2, v4}, Lck;-><init>(Lbk;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v8, v1, v0, v2}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    if-eqz v1, :cond_f

    .line 298
    .line 299
    goto/16 :goto_8

    .line 300
    .line 301
    :cond_10
    sget-object v2, LG3;->g:Li0;

    .line 302
    .line 303
    invoke-virtual {v8, v1, v0, v2}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    if-eqz v2, :cond_f

    .line 308
    .line 309
    invoke-static {v1}, LE3;->y(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    if-eqz v1, :cond_11

    .line 314
    .line 315
    sget-object v1, LG3;->d:Li0;

    .line 316
    .line 317
    invoke-virtual {v8, v0, v1}, Lf4;->n(ILjava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    goto :goto_8

    .line 321
    :cond_11
    sget-object v1, LG3;->j:Li0;

    .line 322
    .line 323
    invoke-virtual {v8, v0, v1}, Lf4;->n(ILjava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v8}, LYg;->h()V

    .line 327
    .line 328
    .line 329
    goto :goto_7

    .line 330
    :cond_12
    sget-object v2, LG3;->j:Li0;

    .line 331
    .line 332
    if-ne v1, v2, :cond_13

    .line 333
    .line 334
    :goto_7
    invoke-static/range {p0 .. p0}, LE3;->q(LE3;)V

    .line 335
    .line 336
    .line 337
    goto/16 :goto_0

    .line 338
    .line 339
    :cond_13
    if-nez v1, :cond_14

    .line 340
    .line 341
    sget-object v2, LG3;->e:Li0;

    .line 342
    .line 343
    invoke-virtual {v8, v1, v0, v2}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v1, :cond_f

    .line 348
    .line 349
    goto :goto_8

    .line 350
    :cond_14
    sget-object v2, LG3;->d:Li0;

    .line 351
    .line 352
    if-ne v1, v2, :cond_15

    .line 353
    .line 354
    goto :goto_8

    .line 355
    :cond_15
    sget-object v2, LG3;->h:Li0;

    .line 356
    .line 357
    if-eq v1, v2, :cond_19

    .line 358
    .line 359
    sget-object v2, LG3;->i:Li0;

    .line 360
    .line 361
    if-eq v1, v2, :cond_19

    .line 362
    .line 363
    sget-object v2, LG3;->k:Li0;

    .line 364
    .line 365
    if-ne v1, v2, :cond_16

    .line 366
    .line 367
    goto :goto_8

    .line 368
    :cond_16
    sget-object v2, LG3;->l:Li0;

    .line 369
    .line 370
    if-ne v1, v2, :cond_17

    .line 371
    .line 372
    goto :goto_8

    .line 373
    :cond_17
    sget-object v2, LG3;->f:Li0;

    .line 374
    .line 375
    if-ne v1, v2, :cond_18

    .line 376
    .line 377
    goto :goto_6

    .line 378
    :cond_18
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 379
    .line 380
    new-instance v2, Ljava/lang/StringBuilder;

    .line 381
    .line 382
    const-string v3, "Unexpected cell state: "

    .line 383
    .line 384
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    throw v0

    .line 402
    :cond_19
    :goto_8
    invoke-static/range {p0 .. p0}, LE3;->q(LE3;)V

    .line 403
    .line 404
    .line 405
    return-void
.end method

.method public final m(JLf4;)Lf4;
    .locals 11

    .line 1
    sget-object v0, LG3;->a:Lf4;

    .line 2
    .line 3
    sget-object v0, LF3;->k:LF3;

    .line 4
    .line 5
    :goto_0
    invoke-static {p3, p1, p2}, Lr3;->n(LYg;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, LMk;->y(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_4

    .line 14
    .line 15
    invoke-static {v0}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    :goto_1
    sget-object v2, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 20
    .line 21
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, LYg;

    .line 26
    .line 27
    iget-wide v4, v3, LYg;->c:J

    .line 28
    .line 29
    iget-wide v6, v1, LYg;->c:J

    .line 30
    .line 31
    cmp-long v4, v4, v6

    .line 32
    .line 33
    if-ltz v4, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    invoke-virtual {v1}, LYg;->i()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-nez v4, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-virtual {v2, p0, v3, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_3

    .line 48
    .line 49
    invoke-virtual {v3}, LYg;->e()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {v3}, La5;->d()V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    if-eq v4, v3, :cond_2

    .line 64
    .line 65
    invoke-virtual {v1}, LYg;->e()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    invoke-virtual {v1}, La5;->d()V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    :goto_2
    invoke-static {v0}, LMk;->y(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v2, 0x0

    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {p0}, LE3;->j()V

    .line 83
    .line 84
    .line 85
    sget p1, LG3;->b:I

    .line 86
    .line 87
    int-to-long p1, p1

    .line 88
    iget-wide v0, p3, LYg;->c:J

    .line 89
    .line 90
    mul-long/2addr v0, p1

    .line 91
    invoke-virtual {p0}, LE3;->p()J

    .line 92
    .line 93
    .line 94
    move-result-wide p1

    .line 95
    cmp-long p1, v0, p1

    .line 96
    .line 97
    if-gez p1, :cond_d

    .line 98
    .line 99
    :goto_3
    invoke-virtual {p3}, La5;->a()V

    .line 100
    .line 101
    .line 102
    goto/16 :goto_7

    .line 103
    .line 104
    :cond_5
    invoke-static {v0}, LMk;->r(Ljava/lang/Object;)LYg;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    check-cast p3, Lf4;

    .line 109
    .line 110
    invoke-virtual {p0}, LE3;->t()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iget-wide v3, p3, LYg;->c:J

    .line 115
    .line 116
    if-nez v0, :cond_9

    .line 117
    .line 118
    sget-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v0

    .line 124
    sget v5, LG3;->b:I

    .line 125
    .line 126
    int-to-long v5, v5

    .line 127
    div-long/2addr v0, v5

    .line 128
    cmp-long v0, p1, v0

    .line 129
    .line 130
    if-gtz v0, :cond_9

    .line 131
    .line 132
    :cond_6
    :goto_4
    sget-object v0, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 133
    .line 134
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, LYg;

    .line 139
    .line 140
    iget-wide v5, v1, LYg;->c:J

    .line 141
    .line 142
    cmp-long v5, v5, v3

    .line 143
    .line 144
    if-gez v5, :cond_9

    .line 145
    .line 146
    invoke-virtual {p3}, LYg;->i()Z

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    if-eqz v5, :cond_9

    .line 151
    .line 152
    :cond_7
    invoke-virtual {v0, p0, v1, p3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_8

    .line 157
    .line 158
    invoke-virtual {v1}, LYg;->e()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_9

    .line 163
    .line 164
    invoke-virtual {v1}, La5;->d()V

    .line 165
    .line 166
    .line 167
    goto :goto_5

    .line 168
    :cond_8
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v5

    .line 172
    if-eq v5, v1, :cond_7

    .line 173
    .line 174
    invoke-virtual {p3}, LYg;->e()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    invoke-virtual {p3}, La5;->d()V

    .line 181
    .line 182
    .line 183
    goto :goto_4

    .line 184
    :cond_9
    :goto_5
    cmp-long p1, v3, p1

    .line 185
    .line 186
    if-lez p1, :cond_c

    .line 187
    .line 188
    sget p1, LG3;->b:I

    .line 189
    .line 190
    int-to-long p1, p1

    .line 191
    mul-long/2addr p1, v3

    .line 192
    :cond_a
    sget-object v5, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 193
    .line 194
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 195
    .line 196
    .line 197
    move-result-wide v7

    .line 198
    cmp-long v0, v7, p1

    .line 199
    .line 200
    if-ltz v0, :cond_b

    .line 201
    .line 202
    goto :goto_6

    .line 203
    :cond_b
    move-object v6, p0

    .line 204
    move-wide v9, p1

    .line 205
    invoke-virtual/range {v5 .. v10}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_a

    .line 210
    .line 211
    :goto_6
    sget p1, LG3;->b:I

    .line 212
    .line 213
    int-to-long p1, p1

    .line 214
    mul-long/2addr v3, p1

    .line 215
    invoke-virtual {p0}, LE3;->p()J

    .line 216
    .line 217
    .line 218
    move-result-wide p1

    .line 219
    cmp-long p1, v3, p1

    .line 220
    .line 221
    if-gez p1, :cond_d

    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_c
    move-object v2, p3

    .line 225
    :cond_d
    :goto_7
    return-object v2
.end method

.method public final n()Ljava/lang/Throwable;
    .locals 1

    .line 1
    sget-object v0, LE3;->l:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Throwable;

    .line 8
    .line 9
    return-object v0
.end method

.method public final o()Ljava/lang/Throwable;
    .locals 2

    .line 1
    invoke-virtual {p0}, LE3;->n()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lr4;

    .line 8
    .line 9
    const-string v1, "Channel was closed"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object v0
.end method

.method public final p()J
    .locals 4

    .line 1
    sget-object v0, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide v2, 0xfffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    and-long/2addr v0, v2

    .line 13
    return-wide v0
.end method

.method public final r(JZ)Z
    .locals 18

    .line 1
    move-object/from16 v6, p0

    .line 2
    .line 3
    const/16 v0, 0x3c

    .line 4
    .line 5
    shr-long v0, p1, v0

    .line 6
    .line 7
    long-to-int v0, v0

    .line 8
    const/4 v7, 0x0

    .line 9
    if-eqz v0, :cond_22

    .line 10
    .line 11
    const/4 v8, 0x1

    .line 12
    if-eq v0, v8, :cond_22

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    sget-object v9, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 16
    .line 17
    const-wide v2, 0xfffffffffffffffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    if-eq v0, v1, :cond_13

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    if-ne v0, v1, :cond_12

    .line 26
    .line 27
    and-long v0, p1, v2

    .line 28
    .line 29
    invoke-virtual {v6, v0, v1}, LE3;->i(J)Lf4;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    move-object v2, v1

    .line 35
    move-object v3, v2

    .line 36
    :cond_0
    sget v4, LG3;->b:I

    .line 37
    .line 38
    sub-int/2addr v4, v8

    .line 39
    :goto_0
    const/4 v5, -0x1

    .line 40
    if-ge v5, v4, :cond_c

    .line 41
    .line 42
    sget v10, LG3;->b:I

    .line 43
    .line 44
    int-to-long v10, v10

    .line 45
    iget-wide v12, v0, LYg;->c:J

    .line 46
    .line 47
    mul-long/2addr v12, v10

    .line 48
    int-to-long v10, v4

    .line 49
    add-long/2addr v12, v10

    .line 50
    :cond_1
    :goto_1
    invoke-virtual {v0, v4}, Lf4;->k(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v10

    .line 54
    sget-object v11, LG3;->i:Li0;

    .line 55
    .line 56
    if-eq v10, v11, :cond_d

    .line 57
    .line 58
    sget-object v11, LG3;->d:Li0;

    .line 59
    .line 60
    iget-object v14, v0, Lf4;->f:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 61
    .line 62
    iget-object v15, v6, LE3;->d:LJ9;

    .line 63
    .line 64
    if-ne v10, v11, :cond_3

    .line 65
    .line 66
    invoke-virtual {v9, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v16

    .line 70
    cmp-long v11, v12, v16

    .line 71
    .line 72
    if-ltz v11, :cond_d

    .line 73
    .line 74
    sget-object v11, LG3;->l:Li0;

    .line 75
    .line 76
    invoke-virtual {v0, v10, v4, v11}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v10

    .line 80
    if-eqz v10, :cond_1

    .line 81
    .line 82
    if-eqz v15, :cond_2

    .line 83
    .line 84
    mul-int/lit8 v5, v4, 0x2

    .line 85
    .line 86
    invoke-virtual {v14, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-static {v15, v5, v2}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    :cond_2
    :goto_2
    invoke-virtual {v0, v4, v1}, Lf4;->m(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    :goto_3
    invoke-virtual {v0}, LYg;->h()V

    .line 98
    .line 99
    .line 100
    goto :goto_7

    .line 101
    :cond_3
    sget-object v11, LG3;->e:Li0;

    .line 102
    .line 103
    if-eq v10, v11, :cond_b

    .line 104
    .line 105
    if-nez v10, :cond_4

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :cond_4
    instance-of v11, v10, Lbk;

    .line 109
    .line 110
    if-nez v11, :cond_7

    .line 111
    .line 112
    instance-of v11, v10, Lck;

    .line 113
    .line 114
    if-eqz v11, :cond_5

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    sget-object v11, LG3;->g:Li0;

    .line 118
    .line 119
    if-eq v10, v11, :cond_d

    .line 120
    .line 121
    sget-object v14, LG3;->f:Li0;

    .line 122
    .line 123
    if-ne v10, v14, :cond_6

    .line 124
    .line 125
    goto :goto_8

    .line 126
    :cond_6
    if-eq v10, v11, :cond_1

    .line 127
    .line 128
    goto :goto_7

    .line 129
    :cond_7
    :goto_4
    invoke-virtual {v9, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 130
    .line 131
    .line 132
    move-result-wide v16

    .line 133
    cmp-long v11, v12, v16

    .line 134
    .line 135
    if-ltz v11, :cond_d

    .line 136
    .line 137
    instance-of v11, v10, Lck;

    .line 138
    .line 139
    if-eqz v11, :cond_8

    .line 140
    .line 141
    move-object v11, v10

    .line 142
    check-cast v11, Lck;

    .line 143
    .line 144
    iget-object v11, v11, Lck;->a:Lbk;

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_8
    move-object v11, v10

    .line 148
    check-cast v11, Lbk;

    .line 149
    .line 150
    :goto_5
    sget-object v5, LG3;->l:Li0;

    .line 151
    .line 152
    invoke-virtual {v0, v10, v4, v5}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    if-eqz v5, :cond_a

    .line 157
    .line 158
    if-eqz v15, :cond_9

    .line 159
    .line 160
    mul-int/lit8 v5, v4, 0x2

    .line 161
    .line 162
    invoke-virtual {v14, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-static {v15, v5, v2}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    :cond_9
    invoke-static {v3, v11}, LSi;->A(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    goto :goto_2

    .line 175
    :cond_a
    const/4 v5, -0x1

    .line 176
    goto :goto_1

    .line 177
    :cond_b
    :goto_6
    sget-object v5, LG3;->l:Li0;

    .line 178
    .line 179
    invoke-virtual {v0, v10, v4, v5}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-eqz v5, :cond_a

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :goto_7
    add-int/lit8 v4, v4, -0x1

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_c
    sget-object v4, La5;->b:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 191
    .line 192
    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, La5;

    .line 197
    .line 198
    check-cast v0, Lf4;

    .line 199
    .line 200
    if-nez v0, :cond_0

    .line 201
    .line 202
    :cond_d
    :goto_8
    if-eqz v3, :cond_f

    .line 203
    .line 204
    instance-of v0, v3, Ljava/util/ArrayList;

    .line 205
    .line 206
    if-nez v0, :cond_e

    .line 207
    .line 208
    check-cast v3, Lbk;

    .line 209
    .line 210
    invoke-virtual {v6, v3, v7}, LE3;->w(Lbk;Z)V

    .line 211
    .line 212
    .line 213
    goto :goto_a

    .line 214
    :cond_e
    check-cast v3, Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    sub-int/2addr v0, v8

    .line 221
    const/4 v1, -0x1

    .line 222
    :goto_9
    if-ge v1, v0, :cond_f

    .line 223
    .line 224
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Lbk;

    .line 229
    .line 230
    invoke-virtual {v6, v4, v7}, LE3;->w(Lbk;Z)V

    .line 231
    .line 232
    .line 233
    add-int/lit8 v0, v0, -0x1

    .line 234
    .line 235
    goto :goto_9

    .line 236
    :cond_f
    :goto_a
    if-nez v2, :cond_11

    .line 237
    .line 238
    :cond_10
    :goto_b
    move v7, v8

    .line 239
    goto/16 :goto_10

    .line 240
    .line 241
    :cond_11
    throw v2

    .line 242
    :cond_12
    const-string v1, "unexpected close status: "

    .line 243
    .line 244
    invoke-static {v1, v0}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 249
    .line 250
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    throw v1

    .line 258
    :cond_13
    and-long v0, p1, v2

    .line 259
    .line 260
    invoke-virtual {v6, v0, v1}, LE3;->i(J)Lf4;

    .line 261
    .line 262
    .line 263
    if-eqz p3, :cond_10

    .line 264
    .line 265
    :cond_14
    :goto_c
    sget-object v0, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 266
    .line 267
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    check-cast v1, Lf4;

    .line 272
    .line 273
    invoke-virtual {v9, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 274
    .line 275
    .line 276
    move-result-wide v2

    .line 277
    invoke-virtual/range {p0 .. p0}, LE3;->p()J

    .line 278
    .line 279
    .line 280
    move-result-wide v4

    .line 281
    cmp-long v4, v4, v2

    .line 282
    .line 283
    if-gtz v4, :cond_15

    .line 284
    .line 285
    goto :goto_d

    .line 286
    :cond_15
    sget v4, LG3;->b:I

    .line 287
    .line 288
    int-to-long v4, v4

    .line 289
    div-long v10, v2, v4

    .line 290
    .line 291
    iget-wide v12, v1, LYg;->c:J

    .line 292
    .line 293
    cmp-long v12, v12, v10

    .line 294
    .line 295
    if-eqz v12, :cond_16

    .line 296
    .line 297
    invoke-virtual {v6, v10, v11, v1}, LE3;->m(JLf4;)Lf4;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    if-nez v1, :cond_16

    .line 302
    .line 303
    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    check-cast v0, Lf4;

    .line 308
    .line 309
    iget-wide v0, v0, LYg;->c:J

    .line 310
    .line 311
    cmp-long v0, v0, v10

    .line 312
    .line 313
    if-gez v0, :cond_14

    .line 314
    .line 315
    :goto_d
    goto :goto_b

    .line 316
    :cond_16
    invoke-virtual {v1}, La5;->a()V

    .line 317
    .line 318
    .line 319
    rem-long v4, v2, v4

    .line 320
    .line 321
    long-to-int v0, v4

    .line 322
    :cond_17
    invoke-virtual {v1, v0}, Lf4;->k(I)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    if-eqz v4, :cond_20

    .line 327
    .line 328
    sget-object v5, LG3;->e:Li0;

    .line 329
    .line 330
    if-ne v4, v5, :cond_18

    .line 331
    .line 332
    goto :goto_e

    .line 333
    :cond_18
    sget-object v0, LG3;->d:Li0;

    .line 334
    .line 335
    if-ne v4, v0, :cond_19

    .line 336
    .line 337
    goto :goto_10

    .line 338
    :cond_19
    sget-object v0, LG3;->j:Li0;

    .line 339
    .line 340
    if-ne v4, v0, :cond_1a

    .line 341
    .line 342
    goto :goto_f

    .line 343
    :cond_1a
    sget-object v0, LG3;->l:Li0;

    .line 344
    .line 345
    if-ne v4, v0, :cond_1b

    .line 346
    .line 347
    goto :goto_f

    .line 348
    :cond_1b
    sget-object v0, LG3;->i:Li0;

    .line 349
    .line 350
    if-ne v4, v0, :cond_1c

    .line 351
    .line 352
    goto :goto_f

    .line 353
    :cond_1c
    sget-object v0, LG3;->h:Li0;

    .line 354
    .line 355
    if-ne v4, v0, :cond_1d

    .line 356
    .line 357
    goto :goto_f

    .line 358
    :cond_1d
    sget-object v0, LG3;->g:Li0;

    .line 359
    .line 360
    if-ne v4, v0, :cond_1e

    .line 361
    .line 362
    goto :goto_10

    .line 363
    :cond_1e
    sget-object v0, LG3;->f:Li0;

    .line 364
    .line 365
    if-ne v4, v0, :cond_1f

    .line 366
    .line 367
    goto :goto_f

    .line 368
    :cond_1f
    invoke-virtual {v9, v6}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 369
    .line 370
    .line 371
    move-result-wide v0

    .line 372
    cmp-long v0, v2, v0

    .line 373
    .line 374
    if-nez v0, :cond_21

    .line 375
    .line 376
    goto :goto_10

    .line 377
    :cond_20
    :goto_e
    sget-object v5, LG3;->h:Li0;

    .line 378
    .line 379
    invoke-virtual {v1, v4, v0, v5}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    if-eqz v4, :cond_17

    .line 384
    .line 385
    invoke-virtual/range {p0 .. p0}, LE3;->l()V

    .line 386
    .line 387
    .line 388
    :cond_21
    :goto_f
    const-wide/16 v0, 0x1

    .line 389
    .line 390
    add-long v4, v2, v0

    .line 391
    .line 392
    sget-object v0, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 393
    .line 394
    move-object/from16 v1, p0

    .line 395
    .line 396
    invoke-virtual/range {v0 .. v5}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->compareAndSet(Ljava/lang/Object;JJ)Z

    .line 397
    .line 398
    .line 399
    goto/16 :goto_c

    .line 400
    .line 401
    :cond_22
    :goto_10
    return v7
.end method

.method public s()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final t()Z
    .locals 4

    .line 1
    sget-object v0, LE3;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    const-wide v2, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 26
    :goto_1
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 9
    .line 10
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const/16 v4, 0x3c

    .line 15
    .line 16
    shr-long/2addr v2, v4

    .line 17
    long-to-int v2, v2

    .line 18
    const/4 v3, 0x2

    .line 19
    const/4 v4, 0x3

    .line 20
    if-eq v2, v3, :cond_1

    .line 21
    .line 22
    if-eq v2, v4, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const-string v2, "cancelled,"

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const-string v2, "closed,"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v5, "capacity="

    .line 37
    .line 38
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v5, v0, LE3;->c:I

    .line 42
    .line 43
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const/16 v5, 0x2c

    .line 47
    .line 48
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v2, "data=["

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    new-array v2, v4, [Lf4;

    .line 64
    .line 65
    sget-object v4, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 66
    .line 67
    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    const/4 v6, 0x0

    .line 72
    aput-object v4, v2, v6

    .line 73
    .line 74
    sget-object v4, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 75
    .line 76
    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    const/4 v7, 0x1

    .line 81
    aput-object v4, v2, v7

    .line 82
    .line 83
    sget-object v4, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 84
    .line 85
    invoke-virtual {v4, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    aput-object v4, v2, v3

    .line 90
    .line 91
    invoke-static {v2}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    new-instance v3, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_3

    .line 109
    .line 110
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    move-object v8, v4

    .line 115
    check-cast v8, Lf4;

    .line 116
    .line 117
    sget-object v9, LG3;->a:Lf4;

    .line 118
    .line 119
    if-eq v8, v9, :cond_2

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_16

    .line 134
    .line 135
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-nez v4, :cond_4

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_4
    move-object v4, v3

    .line 147
    check-cast v4, Lf4;

    .line 148
    .line 149
    iget-wide v8, v4, LYg;->c:J

    .line 150
    .line 151
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    move-object v10, v4

    .line 156
    check-cast v10, Lf4;

    .line 157
    .line 158
    iget-wide v10, v10, LYg;->c:J

    .line 159
    .line 160
    cmp-long v12, v8, v10

    .line 161
    .line 162
    if-lez v12, :cond_6

    .line 163
    .line 164
    move-object v3, v4

    .line 165
    move-wide v8, v10

    .line 166
    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    if-nez v4, :cond_5

    .line 171
    .line 172
    :goto_3
    check-cast v3, Lf4;

    .line 173
    .line 174
    sget-object v2, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 175
    .line 176
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 177
    .line 178
    .line 179
    move-result-wide v10

    .line 180
    invoke-virtual/range {p0 .. p0}, LE3;->p()J

    .line 181
    .line 182
    .line 183
    move-result-wide v12

    .line 184
    :goto_4
    sget v2, LG3;->b:I

    .line 185
    .line 186
    move v4, v6

    .line 187
    :goto_5
    if-ge v4, v2, :cond_11

    .line 188
    .line 189
    iget-wide v8, v3, LYg;->c:J

    .line 190
    .line 191
    sget v14, LG3;->b:I

    .line 192
    .line 193
    int-to-long v14, v14

    .line 194
    mul-long/2addr v8, v14

    .line 195
    int-to-long v14, v4

    .line 196
    add-long/2addr v8, v14

    .line 197
    cmp-long v14, v8, v12

    .line 198
    .line 199
    if-ltz v14, :cond_7

    .line 200
    .line 201
    cmp-long v15, v8, v10

    .line 202
    .line 203
    if-gez v15, :cond_12

    .line 204
    .line 205
    :cond_7
    invoke-virtual {v3, v4}, Lf4;->k(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v15

    .line 209
    iget-object v6, v3, Lf4;->f:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 210
    .line 211
    mul-int/lit8 v7, v4, 0x2

    .line 212
    .line 213
    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    instance-of v7, v15, LO3;

    .line 218
    .line 219
    if-eqz v7, :cond_a

    .line 220
    .line 221
    cmp-long v7, v8, v10

    .line 222
    .line 223
    if-gez v7, :cond_8

    .line 224
    .line 225
    if-ltz v14, :cond_8

    .line 226
    .line 227
    const-string v7, "receive"

    .line 228
    .line 229
    goto/16 :goto_7

    .line 230
    .line 231
    :cond_8
    if-gez v14, :cond_9

    .line 232
    .line 233
    if-ltz v7, :cond_9

    .line 234
    .line 235
    const-string v7, "send"

    .line 236
    .line 237
    goto :goto_7

    .line 238
    :cond_9
    const-string v7, "cont"

    .line 239
    .line 240
    goto :goto_7

    .line 241
    :cond_a
    instance-of v7, v15, Lck;

    .line 242
    .line 243
    if-eqz v7, :cond_b

    .line 244
    .line 245
    new-instance v7, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    const-string v8, "EB("

    .line 248
    .line 249
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const/16 v8, 0x29

    .line 256
    .line 257
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    goto :goto_7

    .line 265
    :cond_b
    sget-object v7, LG3;->f:Li0;

    .line 266
    .line 267
    invoke-static {v15, v7}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v7

    .line 271
    if-nez v7, :cond_e

    .line 272
    .line 273
    sget-object v7, LG3;->g:Li0;

    .line 274
    .line 275
    invoke-static {v15, v7}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v7

    .line 279
    if-eqz v7, :cond_c

    .line 280
    .line 281
    goto :goto_6

    .line 282
    :cond_c
    if-eqz v15, :cond_10

    .line 283
    .line 284
    sget-object v7, LG3;->e:Li0;

    .line 285
    .line 286
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v7

    .line 290
    if-nez v7, :cond_10

    .line 291
    .line 292
    sget-object v7, LG3;->i:Li0;

    .line 293
    .line 294
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v7

    .line 298
    if-nez v7, :cond_10

    .line 299
    .line 300
    sget-object v7, LG3;->h:Li0;

    .line 301
    .line 302
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v7

    .line 306
    if-nez v7, :cond_10

    .line 307
    .line 308
    sget-object v7, LG3;->k:Li0;

    .line 309
    .line 310
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result v7

    .line 314
    if-nez v7, :cond_10

    .line 315
    .line 316
    sget-object v7, LG3;->j:Li0;

    .line 317
    .line 318
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result v7

    .line 322
    if-nez v7, :cond_10

    .line 323
    .line 324
    sget-object v7, LG3;->l:Li0;

    .line 325
    .line 326
    invoke-virtual {v15, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v7

    .line 330
    if-eqz v7, :cond_d

    .line 331
    .line 332
    goto :goto_9

    .line 333
    :cond_d
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    goto :goto_7

    .line 338
    :cond_e
    :goto_6
    const-string v7, "resuming_sender"

    .line 339
    .line 340
    :goto_7
    if-eqz v6, :cond_f

    .line 341
    .line 342
    new-instance v8, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    const-string v9, "("

    .line 345
    .line 346
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    const-string v6, "),"

    .line 359
    .line 360
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v6

    .line 367
    :goto_8
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    goto :goto_9

    .line 371
    :cond_f
    new-instance v6, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v6

    .line 386
    goto :goto_8

    .line 387
    :cond_10
    :goto_9
    add-int/lit8 v4, v4, 0x1

    .line 388
    .line 389
    const/4 v6, 0x0

    .line 390
    const/4 v7, 0x1

    .line 391
    goto/16 :goto_5

    .line 392
    .line 393
    :cond_11
    invoke-virtual {v3}, La5;->b()La5;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    move-object v3, v2

    .line 398
    check-cast v3, Lf4;

    .line 399
    .line 400
    if-nez v3, :cond_15

    .line 401
    .line 402
    :cond_12
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    if-eqz v2, :cond_14

    .line 407
    .line 408
    invoke-static {v1}, LJh;->F(Ljava/lang/CharSequence;)I

    .line 409
    .line 410
    .line 411
    move-result v2

    .line 412
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 413
    .line 414
    .line 415
    move-result v2

    .line 416
    if-ne v2, v5, :cond_13

    .line 417
    .line 418
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 419
    .line 420
    .line 421
    move-result v2

    .line 422
    const/4 v4, 0x1

    .line 423
    sub-int/2addr v2, v4

    .line 424
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    const-string v3, "deleteCharAt(...)"

    .line 429
    .line 430
    invoke-static {v3, v2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    :cond_13
    const-string v2, "]"

    .line 434
    .line 435
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    return-object v1

    .line 443
    :cond_14
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 444
    .line 445
    const-string v2, "Char sequence is empty."

    .line 446
    .line 447
    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    throw v1

    .line 451
    :cond_15
    const/4 v6, 0x0

    .line 452
    const/4 v7, 0x1

    .line 453
    goto/16 :goto_4

    .line 454
    .line 455
    :cond_16
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 456
    .line 457
    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    .line 458
    .line 459
    .line 460
    throw v1
.end method

.method public final u(JLf4;)V
    .locals 4

    .line 1
    :goto_0
    iget-wide v0, p3, LYg;->c:J

    .line 2
    .line 3
    cmp-long v0, v0, p1

    .line 4
    .line 5
    if-gez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p3}, La5;->b()La5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lf4;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    move-object p3, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    :goto_1
    invoke-virtual {p3}, LYg;->c()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p3}, La5;->b()La5;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lf4;

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    move-object p3, p1

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    :goto_2
    sget-object p1, LE3;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, LYg;

    .line 42
    .line 43
    iget-wide v0, p2, LYg;->c:J

    .line 44
    .line 45
    iget-wide v2, p3, LYg;->c:J

    .line 46
    .line 47
    cmp-long v0, v0, v2

    .line 48
    .line 49
    if-ltz v0, :cond_4

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_4
    invoke-virtual {p3}, LYg;->i()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_5

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_5
    invoke-virtual {p1, p0, p2, p3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_7

    .line 64
    .line 65
    invoke-virtual {p2}, LYg;->e()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_6

    .line 70
    .line 71
    invoke-virtual {p2}, La5;->d()V

    .line 72
    .line 73
    .line 74
    :cond_6
    :goto_3
    return-void

    .line 75
    :cond_7
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eq v0, p2, :cond_5

    .line 80
    .line 81
    invoke-virtual {p3}, LYg;->e()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p3}, La5;->d()V

    .line 88
    .line 89
    .line 90
    goto :goto_2
.end method

.method public final v(Lr5;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    new-instance v0, LP3;

    .line 2
    .line 3
    invoke-static {p1}, LMk;->w(Lr5;)Lr5;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p1}, LP3;-><init>(ILr5;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, LP3;->p()LU6;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v2, LP3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    instance-of v2, v2, LKe;

    .line 25
    .line 26
    xor-int/2addr v1, v2

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {p1}, LU6;->a()V

    .line 30
    .line 31
    .line 32
    sget-object p1, LIe;->a:LIe;

    .line 33
    .line 34
    sget-object v1, LP3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 35
    .line 36
    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    iget-object p1, p0, LE3;->d:LJ9;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {p1, p2, v1}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0}, LE3;->o()Ljava/lang/Throwable;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-static {p1, p2}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :goto_1
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, LP3;->h(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    invoke-virtual {p0}, LE3;->o()Ljava/lang/Throwable;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    goto :goto_1

    .line 70
    :goto_2
    invoke-virtual {v0}, LP3;->o()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object p2, Li6;->c:Li6;

    .line 75
    .line 76
    if-ne p1, p2, :cond_3

    .line 77
    .line 78
    return-object p1

    .line 79
    :cond_3
    sget-object p1, Lfj;->a:Lfj;

    .line 80
    .line 81
    return-object p1
.end method

.method public final w(Lbk;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, LO3;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lr5;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, LE3;->n()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    new-instance p2, Lq4;

    .line 16
    .line 17
    const-string v0, "Channel was closed"

    .line 18
    .line 19
    invoke-direct {p2, v0}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, LE3;->o()Ljava/lang/Throwable;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    :cond_1
    :goto_0
    invoke-static {p2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p1, p2}, Lr5;->h(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    instance-of p2, p1, LC3;

    .line 36
    .line 37
    if-eqz p2, :cond_4

    .line 38
    .line 39
    check-cast p1, LC3;

    .line 40
    .line 41
    iget-object p2, p1, LC3;->d:LP3;

    .line 42
    .line 43
    invoke-static {p2}, Llc;->e(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-object v0, p1, LC3;->d:LP3;

    .line 48
    .line 49
    sget-object v0, LG3;->l:Li0;

    .line 50
    .line 51
    iput-object v0, p1, LC3;->c:Ljava/lang/Object;

    .line 52
    .line 53
    iget-object p1, p1, LC3;->e:LE3;

    .line 54
    .line 55
    invoke-virtual {p1}, LE3;->n()Ljava/lang/Throwable;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    :goto_1
    invoke-virtual {p2, p1}, LP3;->h(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    goto :goto_1

    .line 72
    :goto_2
    return-void

    .line 73
    :cond_4
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v1, "Unexpected waiter: "

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p2
.end method

.method public final x(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 9

    .line 1
    instance-of v0, p1, LC3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.channels.BufferedChannel.BufferedChannelIterator<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    check-cast p1, LC3;

    .line 12
    .line 13
    iget-object v0, p1, LC3;->d:LP3;

    .line 14
    .line 15
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p1, LC3;->d:LP3;

    .line 19
    .line 20
    iput-object p2, p1, LC3;->c:Ljava/lang/Object;

    .line 21
    .line 22
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    iget-object p1, p1, LC3;->e:LE3;

    .line 25
    .line 26
    iget-object p1, p1, LE3;->d:LJ9;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    new-instance v1, LB3;

    .line 31
    .line 32
    invoke-direct {v1, p1, p2}, LB3;-><init>(LJ9;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {v0, v2, v1}, LG3;->a(LO3;Ljava/lang/Object;LO9;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    instance-of v0, p1, LO3;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const-string v0, "null cannot be cast to non-null type kotlinx.coroutines.CancellableContinuation<E of kotlinx.coroutines.channels.BufferedChannel>"

    .line 45
    .line 46
    invoke-static {v0, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    check-cast p1, LO3;

    .line 50
    .line 51
    iget-object v0, p0, LE3;->d:LJ9;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    new-instance v1, LD3;

    .line 56
    .line 57
    const-string v7, "onCancellationImplDoNotCall(Ljava/lang/Throwable;Ljava/lang/Object;Lkotlin/coroutines/CoroutineContext;)V"

    .line 58
    .line 59
    const/4 v8, 0x0

    .line 60
    const/4 v3, 0x3

    .line 61
    const-class v5, LE3;

    .line 62
    .line 63
    const-string v6, "onCancellationImplDoNotCall"

    .line 64
    .line 65
    move-object v2, v1

    .line 66
    move-object v4, p0

    .line 67
    invoke-direct/range {v2 .. v8}, LX9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    invoke-static {p1, p2, v1}, LG3;->a(LO3;Ljava/lang/Object;LO9;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    :goto_0
    return p1

    .line 75
    :cond_3
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v1, "Unexpected receiver type: "

    .line 80
    .line 81
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    throw p2
.end method

.method public final z(Lf4;IJLC3;)Ljava/lang/Object;
    .locals 8

    .line 1
    invoke-virtual {p1, p2}, Lf4;->k(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    iget-object v2, p1, Lf4;->f:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 7
    .line 8
    const-wide v3, 0xfffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    sget-object v5, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v6

    .line 21
    and-long/2addr v6, v3

    .line 22
    cmp-long v6, p3, v6

    .line 23
    .line 24
    if-ltz v6, :cond_2

    .line 25
    .line 26
    if-nez p5, :cond_0

    .line 27
    .line 28
    sget-object p1, LG3;->n:Li0;

    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_0
    invoke-virtual {p1, v0, p2, p5}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, LE3;->l()V

    .line 38
    .line 39
    .line 40
    sget-object p1, LG3;->m:Li0;

    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_1
    sget-object v6, LG3;->d:Li0;

    .line 44
    .line 45
    if-ne v0, v6, :cond_2

    .line 46
    .line 47
    sget-object v6, LG3;->i:Li0;

    .line 48
    .line 49
    invoke-virtual {p1, v0, p2, v6}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0}, LE3;->l()V

    .line 56
    .line 57
    .line 58
    mul-int/lit8 p3, p2, 0x2

    .line 59
    .line 60
    invoke-virtual {v2, p3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p1, p2, v1}, Lf4;->m(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-object p3

    .line 68
    :cond_2
    invoke-virtual {p1, p2}, Lf4;->k(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_b

    .line 73
    .line 74
    sget-object v6, LG3;->e:Li0;

    .line 75
    .line 76
    if-ne v0, v6, :cond_3

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_3
    sget-object v6, LG3;->d:Li0;

    .line 80
    .line 81
    if-ne v0, v6, :cond_4

    .line 82
    .line 83
    sget-object v6, LG3;->i:Li0;

    .line 84
    .line 85
    invoke-virtual {p1, v0, p2, v6}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0}, LE3;->l()V

    .line 92
    .line 93
    .line 94
    :goto_0
    mul-int/lit8 p3, p2, 0x2

    .line 95
    .line 96
    invoke-virtual {v2, p3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-virtual {p1, p2, v1}, Lf4;->m(ILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto/16 :goto_4

    .line 104
    .line 105
    :cond_4
    sget-object v6, LG3;->j:Li0;

    .line 106
    .line 107
    if-ne v0, v6, :cond_5

    .line 108
    .line 109
    :goto_1
    sget-object p3, LG3;->o:Li0;

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_5
    sget-object v7, LG3;->h:Li0;

    .line 113
    .line 114
    if-ne v0, v7, :cond_6

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_6
    sget-object v7, LG3;->l:Li0;

    .line 118
    .line 119
    if-ne v0, v7, :cond_7

    .line 120
    .line 121
    :goto_2
    invoke-virtual {p0}, LE3;->l()V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_7
    sget-object v7, LG3;->g:Li0;

    .line 126
    .line 127
    if-eq v0, v7, :cond_2

    .line 128
    .line 129
    sget-object v7, LG3;->f:Li0;

    .line 130
    .line 131
    invoke-virtual {p1, v0, p2, v7}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    if-eqz v7, :cond_2

    .line 136
    .line 137
    instance-of p3, v0, Lck;

    .line 138
    .line 139
    if-eqz p3, :cond_8

    .line 140
    .line 141
    check-cast v0, Lck;

    .line 142
    .line 143
    iget-object v0, v0, Lck;->a:Lbk;

    .line 144
    .line 145
    :cond_8
    invoke-static {v0}, LE3;->y(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p4

    .line 149
    if-eqz p4, :cond_9

    .line 150
    .line 151
    sget-object p3, LG3;->i:Li0;

    .line 152
    .line 153
    invoke-virtual {p1, p2, p3}, Lf4;->n(ILjava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, LE3;->l()V

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_9
    invoke-virtual {p1, p2, v6}, Lf4;->n(ILjava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1}, LYg;->h()V

    .line 164
    .line 165
    .line 166
    if-eqz p3, :cond_a

    .line 167
    .line 168
    invoke-virtual {p0}, LE3;->l()V

    .line 169
    .line 170
    .line 171
    :cond_a
    sget-object p1, LG3;->o:Li0;

    .line 172
    .line 173
    move-object p3, p1

    .line 174
    goto :goto_4

    .line 175
    :cond_b
    :goto_3
    invoke-virtual {v5, p0}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 176
    .line 177
    .line 178
    move-result-wide v6

    .line 179
    and-long/2addr v6, v3

    .line 180
    cmp-long v6, p3, v6

    .line 181
    .line 182
    if-gez v6, :cond_c

    .line 183
    .line 184
    sget-object v6, LG3;->h:Li0;

    .line 185
    .line 186
    invoke-virtual {p1, v0, p2, v6}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_2

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_c
    if-nez p5, :cond_d

    .line 194
    .line 195
    sget-object p3, LG3;->n:Li0;

    .line 196
    .line 197
    goto :goto_4

    .line 198
    :cond_d
    invoke-virtual {p1, v0, p2, p5}, Lf4;->j(Ljava/lang/Object;ILjava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_2

    .line 203
    .line 204
    invoke-virtual {p0}, LE3;->l()V

    .line 205
    .line 206
    .line 207
    sget-object p3, LG3;->m:Li0;

    .line 208
    .line 209
    :goto_4
    return-object p3
.end method
