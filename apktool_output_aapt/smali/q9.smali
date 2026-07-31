.class public abstract Lq9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:Ljava/util/ArrayList;

.field public C:Ljava/util/ArrayList;

.field public D:Ljava/util/ArrayList;

.field public E:Lu9;

.field public final F:Lj3;

.field public final a:Ljava/util/ArrayList;

.field public b:Z

.field public final c:LN6;

.field public d:Ljava/util/ArrayList;

.field public final e:Lk9;

.field public f:Landroidx/activity/a;

.field public final g:LV2;

.field public final h:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final i:Ljava/util/Map;

.field public final j:Ljava/util/Map;

.field public final k:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final l:Ll9;

.field public final m:Ll9;

.field public final n:Ll9;

.field public final o:Ll9;

.field public final p:Ln9;

.field public q:I

.field public r:Lg9;

.field public s:Lg9;

.field public final t:Lo9;

.field public u:LE0;

.field public v:LE0;

.field public w:LE0;

.field public x:Ljava/util/ArrayDeque;

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, LN6;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, LN6;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lq9;->c:LN6;

    .line 18
    .line 19
    new-instance v0, Lk9;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lk9;-><init>(Lq9;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lq9;->e:Lk9;

    .line 25
    .line 26
    new-instance v0, LV2;

    .line 27
    .line 28
    invoke-direct {v0, p0}, LV2;-><init>(Lq9;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lq9;->g:LV2;

    .line 32
    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lq9;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 39
    .line 40
    new-instance v0, Ljava/util/HashMap;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lq9;->i:Ljava/util/Map;

    .line 50
    .line 51
    new-instance v0, Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lq9;->j:Ljava/util/Map;

    .line 61
    .line 62
    new-instance v0, Ljava/util/HashMap;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 68
    .line 69
    .line 70
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lq9;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 81
    .line 82
    new-instance v0, Ll9;

    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    invoke-direct {v0, p0, v1}, Ll9;-><init>(Lq9;I)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lq9;->l:Ll9;

    .line 89
    .line 90
    new-instance v0, Ll9;

    .line 91
    .line 92
    const/4 v1, 0x1

    .line 93
    invoke-direct {v0, p0, v1}, Ll9;-><init>(Lq9;I)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lq9;->m:Ll9;

    .line 97
    .line 98
    new-instance v0, Ll9;

    .line 99
    .line 100
    const/4 v1, 0x2

    .line 101
    invoke-direct {v0, p0, v1}, Ll9;-><init>(Lq9;I)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Lq9;->n:Ll9;

    .line 105
    .line 106
    new-instance v0, Ll9;

    .line 107
    .line 108
    const/4 v1, 0x3

    .line 109
    invoke-direct {v0, p0, v1}, Ll9;-><init>(Lq9;I)V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lq9;->o:Ll9;

    .line 113
    .line 114
    new-instance v0, Ln9;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Ln9;-><init>(Lq9;)V

    .line 117
    .line 118
    .line 119
    iput-object v0, p0, Lq9;->p:Ln9;

    .line 120
    .line 121
    const/4 v0, -0x1

    .line 122
    iput v0, p0, Lq9;->q:I

    .line 123
    .line 124
    new-instance v0, Lo9;

    .line 125
    .line 126
    invoke-direct {v0, p0}, Lo9;-><init>(Lq9;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lq9;->t:Lo9;

    .line 130
    .line 131
    new-instance v0, Ljava/util/ArrayDeque;

    .line 132
    .line 133
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lq9;->x:Ljava/util/ArrayDeque;

    .line 137
    .line 138
    new-instance v0, Lj3;

    .line 139
    .line 140
    const/4 v1, 0x4

    .line 141
    invoke-direct {v0, v1, p0}, Lj3;-><init>(ILjava/lang/Object;)V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lq9;->F:Lj3;

    .line 145
    .line 146
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lq9;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Lq9;->C:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lq9;->B:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final b()Ljava/util/HashSet;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lq9;->c:LN6;

    .line 7
    .line 8
    invoke-virtual {v1}, LN6;->h()Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    throw v0
.end method

.method public final c(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lq9;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lq9;->c:LN6;

    .line 6
    .line 7
    iget-object v2, v2, LN6;->d:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v3}, Loh;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0, p1, v1}, Lq9;->i(IZ)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lq9;->b()Ljava/util/HashSet;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    iput-boolean v1, p0, Lq9;->b:Z

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lq9;->f(Z)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    :try_start_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lqh;

    .line 61
    .line 62
    invoke-virtual {p1}, Lqh;->a()V

    .line 63
    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    :catchall_0
    move-exception p1

    .line 68
    iput-boolean v1, p0, Lq9;->b:Z

    .line 69
    .line 70
    throw p1
.end method

.method public final d(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "    "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lq9;->c:LN6;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    iget-object v2, v1, LN6;->d:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v3, "Active Fragments:"

    .line 37
    .line 38
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Loh;->c(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-string v3, "null"

    .line 66
    .line 67
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object v1, v1, LN6;->c:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    const/4 v3, 0x0

    .line 80
    if-lez v2, :cond_2

    .line 81
    .line 82
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    const-string v4, "Added Fragments:"

    .line 86
    .line 87
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    if-gtz v2, :cond_1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const-string p1, "  #"

    .line 104
    .line 105
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 109
    .line 110
    .line 111
    const-string p1, ": "

    .line 112
    .line 113
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    throw p1

    .line 118
    :cond_2
    :goto_1
    iget-object v1, p0, Lq9;->d:Ljava/util/ArrayList;

    .line 119
    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-lez v1, :cond_3

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    const-string v2, "Back Stack:"

    .line 132
    .line 133
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    move v2, v3

    .line 137
    :goto_2
    if-ge v2, v1, :cond_3

    .line 138
    .line 139
    iget-object v4, p0, Lq9;->d:Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    check-cast v4, Ll3;

    .line 146
    .line 147
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    const-string v5, "  #"

    .line 151
    .line 152
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(I)V

    .line 156
    .line 157
    .line 158
    const-string v5, ": "

    .line 159
    .line 160
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v4}, Ll3;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    const/4 v5, 0x1

    .line 171
    invoke-virtual {v4, v0, p2, v5}, Ll3;->b(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 172
    .line 173
    .line 174
    add-int/lit8 v2, v2, 0x1

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_3
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v1, "Back Stack Index: "

    .line 183
    .line 184
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-object v1, p0, Lq9;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 204
    .line 205
    monitor-enter v0

    .line 206
    :try_start_0
    iget-object v1, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-lez v1, :cond_4

    .line 213
    .line 214
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    const-string v2, "Pending Actions:"

    .line 218
    .line 219
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :goto_3
    if-ge v3, v1, :cond_4

    .line 223
    .line 224
    iget-object v2, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 225
    .line 226
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    check-cast v2, Ll3;

    .line 231
    .line 232
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    const-string v4, "  #"

    .line 236
    .line 237
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 241
    .line 242
    .line 243
    const-string v4, ": "

    .line 244
    .line 245
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    add-int/lit8 v3, v3, 0x1

    .line 252
    .line 253
    goto :goto_3

    .line 254
    :catchall_0
    move-exception p1

    .line 255
    goto :goto_4

    .line 256
    :cond_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    const-string v0, "FragmentManager misc state:"

    .line 261
    .line 262
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    const-string v0, "  mHost="

    .line 269
    .line 270
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Lq9;->r:Lg9;

    .line 274
    .line 275
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    const-string v0, "  mContainer="

    .line 282
    .line 283
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Lq9;->s:Lg9;

    .line 287
    .line 288
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    const-string p1, "  mCurState="

    .line 295
    .line 296
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget p1, p0, Lq9;->q:I

    .line 300
    .line 301
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(I)V

    .line 302
    .line 303
    .line 304
    const-string p1, " mStateSaved="

    .line 305
    .line 306
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    iget-boolean p1, p0, Lq9;->y:Z

    .line 310
    .line 311
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Z)V

    .line 312
    .line 313
    .line 314
    const-string p1, " mStopped="

    .line 315
    .line 316
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget-boolean p1, p0, Lq9;->z:Z

    .line 320
    .line 321
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Z)V

    .line 322
    .line 323
    .line 324
    const-string p1, " mDestroyed="

    .line 325
    .line 326
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iget-boolean p1, p0, Lq9;->A:Z

    .line 330
    .line 331
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Z)V

    .line 332
    .line 333
    .line 334
    return-void

    .line 335
    :goto_4
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 336
    throw p1
.end method

.method public final e(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lq9;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lq9;->r:Lg9;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean p1, p0, Lq9;->A:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 14
    .line 15
    const-string v0, "FragmentManager has been destroyed"

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p1

    .line 21
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string v0, "FragmentManager has not been attached to a host."

    .line 24
    .line 25
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p1

    .line 29
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Lq9;->r:Lg9;

    .line 34
    .line 35
    iget-object v1, v1, Lg9;->d:Landroid/os/Handler;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-ne v0, v1, :cond_5

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    iget-boolean p1, p0, Lq9;->y:Z

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    iget-boolean p1, p0, Lq9;->z:Z

    .line 50
    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    const-string v0, "Can not perform this action after onSaveInstanceState"

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    :cond_3
    :goto_0
    iget-object p1, p0, Lq9;->B:Ljava/util/ArrayList;

    .line 63
    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    new-instance p1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lq9;->B:Ljava/util/ArrayList;

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lq9;->C:Ljava/util/ArrayList;

    .line 79
    .line 80
    :cond_4
    return-void

    .line 81
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 82
    .line 83
    const-string v0, "Must be called from main thread of fragment host"

    .line 84
    .line 85
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw p1

    .line 89
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 90
    .line 91
    const-string v0, "FragmentManager is already executing transactions"

    .line 92
    .line 93
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p1
.end method

.method public final f(Z)Z
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Lq9;->e(Z)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    move v0, p1

    .line 6
    :goto_0
    iget-object v1, p0, Lq9;->B:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v2, p0, Lq9;->C:Ljava/util/ArrayList;

    .line 9
    .line 10
    iget-object v3, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 11
    .line 12
    monitor-enter v3

    .line 13
    :try_start_0
    iget-object v4, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v5, 0x1

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    move v7, p1

    .line 24
    goto :goto_2

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_4

    .line 27
    :cond_0
    :try_start_1
    iget-object v4, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    move v6, p1

    .line 34
    move v7, v6

    .line 35
    :goto_1
    if-ge v6, v4, :cond_1

    .line 36
    .line 37
    iget-object v7, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    check-cast v7, Ll3;

    .line 44
    .line 45
    invoke-virtual {v7, v1, v2}, Ll3;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 46
    .line 47
    .line 48
    add-int/lit8 v6, v6, 0x1

    .line 49
    .line 50
    move v7, v5

    .line 51
    goto :goto_1

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    goto :goto_3

    .line 54
    :cond_1
    :try_start_2
    iget-object v1, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lq9;->r:Lg9;

    .line 60
    .line 61
    iget-object v1, v1, Lg9;->d:Landroid/os/Handler;

    .line 62
    .line 63
    iget-object v2, p0, Lq9;->F:Lj3;

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 66
    .line 67
    .line 68
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    :goto_2
    if-eqz v7, :cond_2

    .line 70
    .line 71
    iput-boolean v5, p0, Lq9;->b:Z

    .line 72
    .line 73
    :try_start_3
    iget-object v0, p0, Lq9;->B:Ljava/util/ArrayList;

    .line 74
    .line 75
    iget-object v1, p0, Lq9;->C:Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-virtual {p0, v0, v1}, Lq9;->j(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lq9;->a()V

    .line 81
    .line 82
    .line 83
    move v0, v5

    .line 84
    goto :goto_0

    .line 85
    :catchall_2
    move-exception p1

    .line 86
    invoke-virtual {p0}, Lq9;->a()V

    .line 87
    .line 88
    .line 89
    throw p1

    .line 90
    :cond_2
    invoke-virtual {p0}, Lq9;->k()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lq9;->c:LN6;

    .line 94
    .line 95
    iget-object p1, p1, LN6;->d:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast p1, Ljava/util/HashMap;

    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const/4 v1, 0x0

    .line 104
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-interface {p1, v1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 109
    .line 110
    .line 111
    return v0

    .line 112
    :goto_3
    :try_start_4
    iget-object v0, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lq9;->r:Lg9;

    .line 118
    .line 119
    iget-object v0, v0, Lg9;->d:Landroid/os/Handler;

    .line 120
    .line 121
    iget-object v1, p0, Lq9;->F:Lj3;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 124
    .line 125
    .line 126
    throw p1

    .line 127
    :goto_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 128
    throw p1
.end method

.method public final g(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    check-cast v5, Ll3;

    .line 16
    .line 17
    iget-boolean v5, v5, Ll3;->o:Z

    .line 18
    .line 19
    iget-object v6, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 20
    .line 21
    if-nez v6, :cond_0

    .line 22
    .line 23
    new-instance v6, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v6, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v6, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 35
    .line 36
    iget-object v7, v0, Lq9;->c:LN6;

    .line 37
    .line 38
    invoke-virtual {v7}, LN6;->j()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move v7, v3

    .line 46
    const/4 v8, 0x0

    .line 47
    :goto_1
    const/4 v10, 0x1

    .line 48
    if-ge v7, v4, :cond_b

    .line 49
    .line 50
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v11

    .line 54
    check-cast v11, Ll3;

    .line 55
    .line 56
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v12

    .line 60
    check-cast v12, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result v12

    .line 66
    const/4 v13, 0x3

    .line 67
    if-nez v12, :cond_5

    .line 68
    .line 69
    iget-object v12, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 70
    .line 71
    const/4 v14, 0x0

    .line 72
    :goto_2
    iget-object v15, v11, Ll3;->a:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-ge v14, v6, :cond_8

    .line 79
    .line 80
    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    check-cast v6, Lw9;

    .line 85
    .line 86
    iget v9, v6, Lw9;->a:I

    .line 87
    .line 88
    if-eq v9, v10, :cond_2

    .line 89
    .line 90
    const/4 v10, 0x2

    .line 91
    if-eq v9, v10, :cond_4

    .line 92
    .line 93
    if-eq v9, v13, :cond_3

    .line 94
    .line 95
    const/4 v10, 0x6

    .line 96
    if-eq v9, v10, :cond_3

    .line 97
    .line 98
    const/4 v10, 0x7

    .line 99
    if-eq v9, v10, :cond_2

    .line 100
    .line 101
    const/16 v10, 0x8

    .line 102
    .line 103
    if-eq v9, v10, :cond_1

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_1
    new-instance v9, Lw9;

    .line 107
    .line 108
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 109
    .line 110
    .line 111
    const/16 v10, 0x9

    .line 112
    .line 113
    iput v10, v9, Lw9;->a:I

    .line 114
    .line 115
    const/4 v10, 0x1

    .line 116
    iput-boolean v10, v9, Lw9;->b:Z

    .line 117
    .line 118
    sget-object v10, LSc;->g:LSc;

    .line 119
    .line 120
    iput-object v10, v9, Lw9;->g:LSc;

    .line 121
    .line 122
    iput-object v10, v9, Lw9;->h:LSc;

    .line 123
    .line 124
    invoke-virtual {v15, v14, v9}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    const/4 v9, 0x1

    .line 128
    iput-boolean v9, v6, Lw9;->b:Z

    .line 129
    .line 130
    :goto_3
    add-int/lit8 v14, v14, 0x1

    .line 131
    .line 132
    :goto_4
    const/4 v6, 0x1

    .line 133
    goto :goto_6

    .line 134
    :cond_2
    const/4 v6, 0x0

    .line 135
    goto :goto_5

    .line 136
    :cond_3
    const/4 v6, 0x0

    .line 137
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    new-instance v6, Lw9;

    .line 141
    .line 142
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 143
    .line 144
    .line 145
    const/16 v9, 0x9

    .line 146
    .line 147
    iput v9, v6, Lw9;->a:I

    .line 148
    .line 149
    const/4 v9, 0x0

    .line 150
    iput-boolean v9, v6, Lw9;->b:Z

    .line 151
    .line 152
    sget-object v9, LSc;->g:LSc;

    .line 153
    .line 154
    iput-object v9, v6, Lw9;->g:LSc;

    .line 155
    .line 156
    iput-object v9, v6, Lw9;->h:LSc;

    .line 157
    .line 158
    invoke-virtual {v15, v14, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_4
    const/4 v6, 0x0

    .line 163
    throw v6

    .line 164
    :goto_5
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    goto :goto_4

    .line 168
    :goto_6
    add-int/2addr v14, v6

    .line 169
    move v10, v6

    .line 170
    goto :goto_2

    .line 171
    :cond_5
    move v6, v10

    .line 172
    iget-object v9, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 173
    .line 174
    iget-object v10, v11, Ll3;->a:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result v12

    .line 180
    sub-int/2addr v12, v6

    .line 181
    :goto_7
    if-ltz v12, :cond_8

    .line 182
    .line 183
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v14

    .line 187
    check-cast v14, Lw9;

    .line 188
    .line 189
    iget v15, v14, Lw9;->a:I

    .line 190
    .line 191
    if-eq v15, v6, :cond_6

    .line 192
    .line 193
    if-eq v15, v13, :cond_7

    .line 194
    .line 195
    packed-switch v15, :pswitch_data_0

    .line 196
    .line 197
    .line 198
    goto :goto_9

    .line 199
    :pswitch_0
    iget-object v6, v14, Lw9;->g:LSc;

    .line 200
    .line 201
    iput-object v6, v14, Lw9;->h:LSc;

    .line 202
    .line 203
    goto :goto_9

    .line 204
    :cond_6
    :pswitch_1
    const/4 v6, 0x0

    .line 205
    goto :goto_8

    .line 206
    :cond_7
    :pswitch_2
    const/4 v6, 0x0

    .line 207
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    goto :goto_9

    .line 211
    :goto_8
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    :goto_9
    :pswitch_3
    add-int/lit8 v12, v12, -0x1

    .line 215
    .line 216
    const/4 v6, 0x1

    .line 217
    goto :goto_7

    .line 218
    :cond_8
    if-nez v8, :cond_a

    .line 219
    .line 220
    iget-boolean v6, v11, Ll3;->g:Z

    .line 221
    .line 222
    if-eqz v6, :cond_9

    .line 223
    .line 224
    goto :goto_a

    .line 225
    :cond_9
    const/4 v8, 0x0

    .line 226
    goto :goto_b

    .line 227
    :cond_a
    :goto_a
    const/4 v8, 0x1

    .line 228
    :goto_b
    add-int/lit8 v7, v7, 0x1

    .line 229
    .line 230
    goto/16 :goto_1

    .line 231
    .line 232
    :cond_b
    iget-object v6, v0, Lq9;->D:Ljava/util/ArrayList;

    .line 233
    .line 234
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 235
    .line 236
    .line 237
    if-nez v5, :cond_d

    .line 238
    .line 239
    iget v5, v0, Lq9;->q:I

    .line 240
    .line 241
    const/4 v6, 0x1

    .line 242
    if-lt v5, v6, :cond_d

    .line 243
    .line 244
    move v5, v3

    .line 245
    :goto_c
    if-ge v5, v4, :cond_d

    .line 246
    .line 247
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v6

    .line 251
    check-cast v6, Ll3;

    .line 252
    .line 253
    iget-object v6, v6, Ll3;->a:Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 256
    .line 257
    .line 258
    move-result-object v6

    .line 259
    :goto_d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    if-eqz v7, :cond_c

    .line 264
    .line 265
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v7

    .line 269
    check-cast v7, Lw9;

    .line 270
    .line 271
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    .line 273
    .line 274
    goto :goto_d

    .line 275
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 276
    .line 277
    goto :goto_c

    .line 278
    :cond_d
    move v5, v3

    .line 279
    :goto_e
    const/4 v6, -0x1

    .line 280
    if-ge v5, v4, :cond_10

    .line 281
    .line 282
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v7

    .line 286
    check-cast v7, Ll3;

    .line 287
    .line 288
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v8

    .line 292
    check-cast v8, Ljava/lang/Boolean;

    .line 293
    .line 294
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 295
    .line 296
    .line 297
    move-result v8

    .line 298
    const-string v9, "Unknown cmd: "

    .line 299
    .line 300
    if-eqz v8, :cond_f

    .line 301
    .line 302
    invoke-virtual {v7, v6}, Ll3;->a(I)V

    .line 303
    .line 304
    .line 305
    iget-object v6, v7, Ll3;->a:Ljava/util/ArrayList;

    .line 306
    .line 307
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 308
    .line 309
    .line 310
    move-result v8

    .line 311
    const/4 v10, 0x1

    .line 312
    sub-int/2addr v8, v10

    .line 313
    :goto_f
    if-ltz v8, :cond_e

    .line 314
    .line 315
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v10

    .line 319
    check-cast v10, Lw9;

    .line 320
    .line 321
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 322
    .line 323
    .line 324
    iget v11, v10, Lw9;->a:I

    .line 325
    .line 326
    iget-object v12, v7, Ll3;->p:Lq9;

    .line 327
    .line 328
    packed-switch v11, :pswitch_data_1

    .line 329
    .line 330
    .line 331
    :pswitch_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 332
    .line 333
    new-instance v2, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    iget v3, v10, Lw9;->a:I

    .line 339
    .line 340
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    throw v1

    .line 351
    :pswitch_5
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 352
    .line 353
    .line 354
    const/4 v10, 0x0

    .line 355
    throw v10

    .line 356
    :pswitch_6
    const/4 v10, 0x0

    .line 357
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 358
    .line 359
    .line 360
    add-int/lit8 v8, v8, -0x1

    .line 361
    .line 362
    goto :goto_f

    .line 363
    :pswitch_7
    const/4 v10, 0x0

    .line 364
    throw v10

    .line 365
    :pswitch_8
    const/4 v10, 0x0

    .line 366
    throw v10

    .line 367
    :pswitch_9
    const/4 v10, 0x0

    .line 368
    throw v10

    .line 369
    :pswitch_a
    const/4 v10, 0x0

    .line 370
    throw v10

    .line 371
    :pswitch_b
    const/4 v10, 0x0

    .line 372
    throw v10

    .line 373
    :pswitch_c
    const/4 v10, 0x0

    .line 374
    throw v10

    .line 375
    :cond_e
    const/4 v11, 0x0

    .line 376
    goto :goto_11

    .line 377
    :cond_f
    const/4 v6, 0x1

    .line 378
    invoke-virtual {v7, v6}, Ll3;->a(I)V

    .line 379
    .line 380
    .line 381
    iget-object v6, v7, Ll3;->a:Ljava/util/ArrayList;

    .line 382
    .line 383
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 384
    .line 385
    .line 386
    move-result v8

    .line 387
    const/4 v10, 0x0

    .line 388
    :goto_10
    if-ge v10, v8, :cond_e

    .line 389
    .line 390
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v11

    .line 394
    check-cast v11, Lw9;

    .line 395
    .line 396
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    .line 398
    .line 399
    iget v12, v11, Lw9;->a:I

    .line 400
    .line 401
    iget-object v13, v7, Ll3;->p:Lq9;

    .line 402
    .line 403
    packed-switch v12, :pswitch_data_2

    .line 404
    .line 405
    .line 406
    :pswitch_d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 407
    .line 408
    new-instance v2, Ljava/lang/StringBuilder;

    .line 409
    .line 410
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    iget v3, v11, Lw9;->a:I

    .line 414
    .line 415
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    throw v1

    .line 426
    :pswitch_e
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 427
    .line 428
    .line 429
    const/4 v11, 0x0

    .line 430
    throw v11

    .line 431
    :pswitch_f
    const/4 v11, 0x0

    .line 432
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 433
    .line 434
    .line 435
    add-int/lit8 v10, v10, 0x1

    .line 436
    .line 437
    goto :goto_10

    .line 438
    :pswitch_10
    const/4 v11, 0x0

    .line 439
    throw v11

    .line 440
    :pswitch_11
    const/4 v11, 0x0

    .line 441
    throw v11

    .line 442
    :pswitch_12
    const/4 v11, 0x0

    .line 443
    throw v11

    .line 444
    :pswitch_13
    const/4 v11, 0x0

    .line 445
    throw v11

    .line 446
    :pswitch_14
    const/4 v11, 0x0

    .line 447
    throw v11

    .line 448
    :pswitch_15
    const/4 v11, 0x0

    .line 449
    throw v11

    .line 450
    :goto_11
    add-int/lit8 v5, v5, 0x1

    .line 451
    .line 452
    goto/16 :goto_e

    .line 453
    .line 454
    :cond_10
    add-int/lit8 v5, v4, -0x1

    .line 455
    .line 456
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v5

    .line 460
    check-cast v5, Ljava/lang/Boolean;

    .line 461
    .line 462
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 463
    .line 464
    .line 465
    move-result v5

    .line 466
    move v7, v3

    .line 467
    :goto_12
    if-ge v7, v4, :cond_13

    .line 468
    .line 469
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object v8

    .line 473
    check-cast v8, Ll3;

    .line 474
    .line 475
    if-eqz v5, :cond_11

    .line 476
    .line 477
    iget-object v9, v8, Ll3;->a:Ljava/util/ArrayList;

    .line 478
    .line 479
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 480
    .line 481
    .line 482
    move-result v9

    .line 483
    const/4 v10, 0x1

    .line 484
    sub-int/2addr v9, v10

    .line 485
    :goto_13
    if-ltz v9, :cond_12

    .line 486
    .line 487
    iget-object v10, v8, Ll3;->a:Ljava/util/ArrayList;

    .line 488
    .line 489
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object v10

    .line 493
    check-cast v10, Lw9;

    .line 494
    .line 495
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 496
    .line 497
    .line 498
    add-int/lit8 v9, v9, -0x1

    .line 499
    .line 500
    goto :goto_13

    .line 501
    :cond_11
    iget-object v8, v8, Ll3;->a:Ljava/util/ArrayList;

    .line 502
    .line 503
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 504
    .line 505
    .line 506
    move-result-object v8

    .line 507
    :goto_14
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 508
    .line 509
    .line 510
    move-result v9

    .line 511
    if-eqz v9, :cond_12

    .line 512
    .line 513
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v9

    .line 517
    check-cast v9, Lw9;

    .line 518
    .line 519
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 520
    .line 521
    .line 522
    goto :goto_14

    .line 523
    :cond_12
    add-int/lit8 v7, v7, 0x1

    .line 524
    .line 525
    goto :goto_12

    .line 526
    :cond_13
    iget v5, v0, Lq9;->q:I

    .line 527
    .line 528
    const/4 v7, 0x1

    .line 529
    invoke-virtual {v0, v5, v7}, Lq9;->i(IZ)V

    .line 530
    .line 531
    .line 532
    new-instance v5, Ljava/util/HashSet;

    .line 533
    .line 534
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 535
    .line 536
    .line 537
    move v7, v3

    .line 538
    :goto_15
    if-ge v7, v4, :cond_15

    .line 539
    .line 540
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 541
    .line 542
    .line 543
    move-result-object v8

    .line 544
    check-cast v8, Ll3;

    .line 545
    .line 546
    iget-object v8, v8, Ll3;->a:Ljava/util/ArrayList;

    .line 547
    .line 548
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 549
    .line 550
    .line 551
    move-result-object v8

    .line 552
    :goto_16
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 553
    .line 554
    .line 555
    move-result v9

    .line 556
    if-eqz v9, :cond_14

    .line 557
    .line 558
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v9

    .line 562
    check-cast v9, Lw9;

    .line 563
    .line 564
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 565
    .line 566
    .line 567
    goto :goto_16

    .line 568
    :cond_14
    add-int/lit8 v7, v7, 0x1

    .line 569
    .line 570
    goto :goto_15

    .line 571
    :cond_15
    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 572
    .line 573
    .line 574
    move-result-object v5

    .line 575
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 576
    .line 577
    .line 578
    move-result v7

    .line 579
    if-nez v7, :cond_18

    .line 580
    .line 581
    :goto_17
    if-ge v3, v4, :cond_17

    .line 582
    .line 583
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v5

    .line 587
    check-cast v5, Ll3;

    .line 588
    .line 589
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 590
    .line 591
    .line 592
    move-result-object v7

    .line 593
    check-cast v7, Ljava/lang/Boolean;

    .line 594
    .line 595
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 596
    .line 597
    .line 598
    move-result v7

    .line 599
    if-eqz v7, :cond_16

    .line 600
    .line 601
    iget v7, v5, Ll3;->q:I

    .line 602
    .line 603
    if-ltz v7, :cond_16

    .line 604
    .line 605
    iput v6, v5, Ll3;->q:I

    .line 606
    .line 607
    :cond_16
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 608
    .line 609
    .line 610
    add-int/lit8 v3, v3, 0x1

    .line 611
    .line 612
    goto :goto_17

    .line 613
    :cond_17
    return-void

    .line 614
    :cond_18
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v1

    .line 618
    check-cast v1, Lqh;

    .line 619
    .line 620
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 621
    .line 622
    .line 623
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 624
    .line 625
    .line 626
    const/4 v1, 0x0

    .line 627
    throw v1

    .line 628
    nop

    .line 629
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_0
    .end packed-switch

    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_c
        :pswitch_4
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_15
        :pswitch_d
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_e
    .end packed-switch
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lq9;->c:LN6;

    .line 2
    .line 3
    iget-object v1, v0, LN6;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/lit8 v2, v2, -0x1

    .line 12
    .line 13
    :goto_0
    if-ltz v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-static {v3}, Loh;->c(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v2, v2, -0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, v0, LN6;->d:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    return-void
.end method

.method public final i(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lq9;->r:Lg9;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 10
    .line 11
    const-string p2, "No activity"

    .line 12
    .line 13
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p1

    .line 17
    :cond_1
    :goto_0
    if-nez p2, :cond_2

    .line 18
    .line 19
    iget p2, p0, Lq9;->q:I

    .line 20
    .line 21
    if-ne p1, p2, :cond_2

    .line 22
    .line 23
    return-void

    .line 24
    :cond_2
    iput p1, p0, Lq9;->q:I

    .line 25
    .line 26
    iget-object p1, p0, Lq9;->c:LN6;

    .line 27
    .line 28
    iget-object p2, p1, LN6;->c:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p2, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v1, 0x0

    .line 41
    if-nez v0, :cond_5

    .line 42
    .line 43
    iget-object p2, p1, LN6;->d:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p2, Ljava/util/HashMap;

    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    invoke-virtual {p1}, LN6;->h()Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-nez p2, :cond_4

    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Loh;->c(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    throw v1

    .line 92
    :cond_5
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1}, Loh;->c(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    throw v1
.end method

.method public final j(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ne v0, v1, :cond_6

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    move v2, v1

    .line 24
    :goto_0
    if-ge v1, v0, :cond_4

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ll3;

    .line 31
    .line 32
    iget-boolean v3, v3, Ll3;->o:Z

    .line 33
    .line 34
    if-nez v3, :cond_3

    .line 35
    .line 36
    if-eq v2, v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2, v2, v1}, Lq9;->g(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 39
    .line 40
    .line 41
    :cond_1
    add-int/lit8 v2, v1, 0x1

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    :goto_1
    if-ge v2, v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Ll3;

    .line 74
    .line 75
    iget-boolean v3, v3, Ll3;->o:Z

    .line 76
    .line 77
    if-nez v3, :cond_2

    .line 78
    .line 79
    add-int/lit8 v2, v2, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {p0, p1, p2, v1, v2}, Lq9;->g(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 83
    .line 84
    .line 85
    add-int/lit8 v1, v2, -0x1

    .line 86
    .line 87
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_4
    if-eq v2, v0, :cond_5

    .line 91
    .line 92
    invoke-virtual {p0, p1, p2, v2, v0}, Lq9;->g(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 93
    .line 94
    .line 95
    :cond_5
    return-void

    .line 96
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 97
    .line 98
    const-string p2, "Internal error with the back stack records"

    .line 99
    .line 100
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    throw p1
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lq9;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Lq9;->g:LV2;

    .line 14
    .line 15
    iput-boolean v2, v1, LNe;->a:Z

    .line 16
    .line 17
    iget-object v1, v1, LNe;->c:Ly9;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v1}, Ly9;->a()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v1

    .line 27
    goto :goto_2

    .line 28
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    iget-object v0, p0, Lq9;->g:LV2;

    .line 30
    .line 31
    iget-object v1, p0, Lq9;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v1, v3

    .line 42
    :goto_0
    if-lez v1, :cond_3

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    move v2, v3

    .line 46
    :goto_1
    iput-boolean v2, v0, LNe;->a:Z

    .line 47
    .line 48
    iget-object v0, v0, LNe;->c:Ly9;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-interface {v0}, Ly9;->a()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :cond_4
    return-void

    .line 56
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "FragmentManager{"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " in "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lq9;->r:Lg9;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, "{"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lq9;->r:Lg9;

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v1, "}"

    .line 63
    .line 64
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    const-string v1, "null"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :goto_1
    const-string v1, "}}"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    return-object v0
.end method
