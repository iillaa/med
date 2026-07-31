.class public abstract LG3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lf4;

.field public static final b:I

.field public static final c:I

.field public static final d:Li0;

.field public static final e:Li0;

.field public static final f:Li0;

.field public static final g:Li0;

.field public static final h:Li0;

.field public static final i:Li0;

.field public static final j:Li0;

.field public static final k:Li0;

.field public static final l:Li0;

.field public static final m:Li0;

.field public static final n:Li0;

.field public static final o:Li0;

.field public static final p:Li0;

.field public static final q:Li0;

.field public static final r:Li0;

.field public static final s:Li0;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v6, Lf4;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, v6

    .line 9
    invoke-direct/range {v0 .. v5}, Lf4;-><init>(JLf4;LE3;I)V

    .line 10
    .line 11
    .line 12
    sput-object v6, LG3;->a:Lf4;

    .line 13
    .line 14
    const-string v0, "kotlinx.coroutines.bufferedChannel.segmentSize"

    .line 15
    .line 16
    const/16 v1, 0x20

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const/16 v3, 0xc

    .line 20
    .line 21
    invoke-static {v0, v1, v2, v2, v3}, Llc;->O(Ljava/lang/String;IIII)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sput v0, LG3;->b:I

    .line 26
    .line 27
    const-string v0, "kotlinx.coroutines.bufferedChannel.expandBufferCompletionWaitIterations"

    .line 28
    .line 29
    const/16 v1, 0x2710

    .line 30
    .line 31
    invoke-static {v0, v1, v2, v2, v3}, Llc;->O(Ljava/lang/String;IIII)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    sput v0, LG3;->c:I

    .line 36
    .line 37
    new-instance v0, Li0;

    .line 38
    .line 39
    const-string v1, "BUFFERED"

    .line 40
    .line 41
    const/16 v2, 0x14

    .line 42
    .line 43
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    sput-object v0, LG3;->d:Li0;

    .line 47
    .line 48
    new-instance v0, Li0;

    .line 49
    .line 50
    const-string v1, "SHOULD_BUFFER"

    .line 51
    .line 52
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, LG3;->e:Li0;

    .line 56
    .line 57
    new-instance v0, Li0;

    .line 58
    .line 59
    const-string v1, "S_RESUMING_BY_RCV"

    .line 60
    .line 61
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    sput-object v0, LG3;->f:Li0;

    .line 65
    .line 66
    new-instance v0, Li0;

    .line 67
    .line 68
    const-string v1, "RESUMING_BY_EB"

    .line 69
    .line 70
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    sput-object v0, LG3;->g:Li0;

    .line 74
    .line 75
    new-instance v0, Li0;

    .line 76
    .line 77
    const-string v1, "POISONED"

    .line 78
    .line 79
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    sput-object v0, LG3;->h:Li0;

    .line 83
    .line 84
    new-instance v0, Li0;

    .line 85
    .line 86
    const-string v1, "DONE_RCV"

    .line 87
    .line 88
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    sput-object v0, LG3;->i:Li0;

    .line 92
    .line 93
    new-instance v0, Li0;

    .line 94
    .line 95
    const-string v1, "INTERRUPTED_SEND"

    .line 96
    .line 97
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    sput-object v0, LG3;->j:Li0;

    .line 101
    .line 102
    new-instance v0, Li0;

    .line 103
    .line 104
    const-string v1, "INTERRUPTED_RCV"

    .line 105
    .line 106
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    sput-object v0, LG3;->k:Li0;

    .line 110
    .line 111
    new-instance v0, Li0;

    .line 112
    .line 113
    const-string v1, "CHANNEL_CLOSED"

    .line 114
    .line 115
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    sput-object v0, LG3;->l:Li0;

    .line 119
    .line 120
    new-instance v0, Li0;

    .line 121
    .line 122
    const-string v1, "SUSPEND"

    .line 123
    .line 124
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    sput-object v0, LG3;->m:Li0;

    .line 128
    .line 129
    new-instance v0, Li0;

    .line 130
    .line 131
    const-string v1, "SUSPEND_NO_WAITER"

    .line 132
    .line 133
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    sput-object v0, LG3;->n:Li0;

    .line 137
    .line 138
    new-instance v0, Li0;

    .line 139
    .line 140
    const-string v1, "FAILED"

    .line 141
    .line 142
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    sput-object v0, LG3;->o:Li0;

    .line 146
    .line 147
    new-instance v0, Li0;

    .line 148
    .line 149
    const-string v1, "NO_RECEIVE_RESULT"

    .line 150
    .line 151
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    sput-object v0, LG3;->p:Li0;

    .line 155
    .line 156
    new-instance v0, Li0;

    .line 157
    .line 158
    const-string v1, "CLOSE_HANDLER_CLOSED"

    .line 159
    .line 160
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    sput-object v0, LG3;->q:Li0;

    .line 164
    .line 165
    new-instance v0, Li0;

    .line 166
    .line 167
    const-string v1, "CLOSE_HANDLER_INVOKED"

    .line 168
    .line 169
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    sput-object v0, LG3;->r:Li0;

    .line 173
    .line 174
    new-instance v0, Li0;

    .line 175
    .line 176
    const-string v1, "NO_CLOSE_CAUSE"

    .line 177
    .line 178
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    sput-object v0, LG3;->s:Li0;

    .line 182
    .line 183
    return-void
.end method

.method public static final a(LO3;Ljava/lang/Object;LO9;)Z
    .locals 5

    .line 1
    check-cast p0, LP3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :goto_0
    sget-object v0, LP3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v2, v1, LKe;

    .line 13
    .line 14
    sget-object v3, Llc;->a:Li0;

    .line 15
    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    iget v2, p0, LQ6;->e:I

    .line 19
    .line 20
    invoke-static {p1, v2, p2}, LP3;->u(Ljava/lang/Object;ILO9;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    :cond_0
    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, LP3;->q()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, LP3;->m()V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eq v4, v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    instance-of p1, v1, LG4;

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    :cond_3
    :goto_1
    if-eqz v3, :cond_4

    .line 51
    .line 52
    iget p1, p0, LQ6;->e:I

    .line 53
    .line 54
    invoke-virtual {p0, p1}, LP3;->n(I)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    goto :goto_2

    .line 59
    :cond_4
    const/4 p0, 0x0

    .line 60
    :goto_2
    return p0
.end method
