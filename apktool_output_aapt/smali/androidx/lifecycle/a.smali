.class public final Landroidx/lifecycle/a;
.super LTc;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:LR7;

.field public c:LSc;

.field public final d:Ljava/lang/ref/WeakReference;

.field public e:I

.field public f:Z

.field public g:Z

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(LYc;)V
    .locals 1

    .line 1
    const-string v0, "provider"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Landroidx/lifecycle/a;->a:Z

    .line 16
    .line 17
    new-instance v0, LR7;

    .line 18
    .line 19
    invoke-direct {v0}, LR7;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 23
    .line 24
    sget-object v0, LSc;->d:LSc;

    .line 25
    .line 26
    iput-object v0, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 34
    .line 35
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Landroidx/lifecycle/a;->d:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public final a(LXc;)V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    const-string v1, "observer"

    .line 4
    .line 5
    invoke-static {v1, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    const-string v1, "addObserver"

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroidx/lifecycle/a;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 14
    .line 15
    sget-object v2, LSc;->c:LSc;

    .line 16
    .line 17
    if-ne v1, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object v2, LSc;->d:LSc;

    .line 21
    .line 22
    :goto_0
    new-instance v1, LZc;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v3, Lad;->a:Ljava/util/HashMap;

    .line 28
    .line 29
    instance-of v3, p1, LWc;

    .line 30
    .line 31
    instance-of v4, p1, LC6;

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x0

    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    new-instance v3, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    .line 41
    .line 42
    move-object v4, p1

    .line 43
    check-cast v4, LC6;

    .line 44
    .line 45
    move-object v8, p1

    .line 46
    check-cast v8, LWc;

    .line 47
    .line 48
    invoke-direct {v3, v4, v8}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(LC6;LWc;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    if-eqz v4, :cond_2

    .line 53
    .line 54
    new-instance v3, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    .line 55
    .line 56
    move-object v4, p1

    .line 57
    check-cast v4, LC6;

    .line 58
    .line 59
    invoke-direct {v3, v4, v6}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(LC6;LWc;)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    if-eqz v3, :cond_3

    .line 64
    .line 65
    move-object v3, p1

    .line 66
    check-cast v3, LWc;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-static {v3}, Lad;->c(Ljava/lang/Class;)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    const/4 v8, 0x2

    .line 78
    if-ne v4, v8, :cond_6

    .line 79
    .line 80
    sget-object v4, Lad;->b:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v3}, Llc;->e(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    check-cast v3, Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eq v4, v5, :cond_5

    .line 96
    .line 97
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    new-array v8, v4, [LY9;

    .line 102
    .line 103
    if-gtz v4, :cond_4

    .line 104
    .line 105
    new-instance v3, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;

    .line 106
    .line 107
    invoke-direct {v3, v8}, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;-><init>([LY9;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 116
    .line 117
    invoke-static {v0, p1}, Lad;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    throw v6

    .line 121
    :cond_5
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 126
    .line 127
    invoke-static {v0, p1}, Lad;->a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    throw v6

    .line 131
    :cond_6
    new-instance v3, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;

    .line 132
    .line 133
    invoke-direct {v3, p1}, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;-><init>(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    :goto_1
    iput-object v3, v1, LZc;->b:LWc;

    .line 137
    .line 138
    iput-object v2, v1, LZc;->a:LSc;

    .line 139
    .line 140
    iget-object v2, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 141
    .line 142
    invoke-virtual {v2, p1}, LR7;->a(Ljava/lang/Object;)Lwg;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    if-eqz v3, :cond_7

    .line 147
    .line 148
    iget-object v6, v3, Lwg;->d:Ljava/lang/Object;

    .line 149
    .line 150
    goto :goto_4

    .line 151
    :cond_7
    iget-object v3, v2, LR7;->g:Ljava/util/HashMap;

    .line 152
    .line 153
    new-instance v4, Lwg;

    .line 154
    .line 155
    invoke-direct {v4, p1, v1}, Lwg;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    iget v8, v2, Lzg;->f:I

    .line 159
    .line 160
    add-int/2addr v8, v5

    .line 161
    iput v8, v2, Lzg;->f:I

    .line 162
    .line 163
    iget-object v8, v2, Lzg;->d:Lwg;

    .line 164
    .line 165
    if-nez v8, :cond_8

    .line 166
    .line 167
    iput-object v4, v2, Lzg;->c:Lwg;

    .line 168
    .line 169
    :goto_2
    iput-object v4, v2, Lzg;->d:Lwg;

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_8
    iput-object v4, v8, Lwg;->e:Lwg;

    .line 173
    .line 174
    iput-object v8, v4, Lwg;->f:Lwg;

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :goto_3
    invoke-virtual {v3, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    :goto_4
    check-cast v6, LZc;

    .line 181
    .line 182
    if-eqz v6, :cond_9

    .line 183
    .line 184
    return-void

    .line 185
    :cond_9
    iget-object v2, p0, Landroidx/lifecycle/a;->d:Ljava/lang/ref/WeakReference;

    .line 186
    .line 187
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, LYc;

    .line 192
    .line 193
    if-nez v2, :cond_a

    .line 194
    .line 195
    return-void

    .line 196
    :cond_a
    iget v3, p0, Landroidx/lifecycle/a;->e:I

    .line 197
    .line 198
    if-nez v3, :cond_b

    .line 199
    .line 200
    iget-boolean v3, p0, Landroidx/lifecycle/a;->f:Z

    .line 201
    .line 202
    if-eqz v3, :cond_c

    .line 203
    .line 204
    :cond_b
    move v7, v5

    .line 205
    :cond_c
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->c(LXc;)LSc;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    iget v4, p0, Landroidx/lifecycle/a;->e:I

    .line 210
    .line 211
    add-int/2addr v4, v5

    .line 212
    iput v4, p0, Landroidx/lifecycle/a;->e:I

    .line 213
    .line 214
    :goto_5
    iget-object v4, v1, LZc;->a:LSc;

    .line 215
    .line 216
    invoke-virtual {v4, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-gez v3, :cond_e

    .line 221
    .line 222
    iget-object v3, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 223
    .line 224
    iget-object v3, v3, LR7;->g:Ljava/util/HashMap;

    .line 225
    .line 226
    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    if-eqz v3, :cond_e

    .line 231
    .line 232
    iget-object v3, v1, LZc;->a:LSc;

    .line 233
    .line 234
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    sget-object v3, LRc;->Companion:LPc;

    .line 238
    .line 239
    iget-object v4, v1, LZc;->a:LSc;

    .line 240
    .line 241
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 242
    .line 243
    .line 244
    invoke-static {v4}, LPc;->b(LSc;)LRc;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    if-eqz v3, :cond_d

    .line 249
    .line 250
    invoke-virtual {v1, v2, v3}, LZc;->a(LYc;LRc;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    sub-int/2addr v3, v5

    .line 258
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->c(LXc;)LSc;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    goto :goto_5

    .line 266
    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 267
    .line 268
    new-instance v0, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    const-string v2, "no event up from "

    .line 271
    .line 272
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget-object v1, v1, LZc;->a:LSc;

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    throw p1

    .line 288
    :cond_e
    if-nez v7, :cond_f

    .line 289
    .line 290
    invoke-virtual {p0}, Landroidx/lifecycle/a;->g()V

    .line 291
    .line 292
    .line 293
    :cond_f
    iget p1, p0, Landroidx/lifecycle/a;->e:I

    .line 294
    .line 295
    add-int/lit8 p1, p1, -0x1

    .line 296
    .line 297
    iput p1, p0, Landroidx/lifecycle/a;->e:I

    .line 298
    .line 299
    return-void
.end method

.method public final b(LXc;)V
    .locals 4

    .line 1
    const-string v0, "observer"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "removeObserver"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, LR7;->a(Ljava/lang/Object;)Lwg;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_3

    .line 20
    :cond_0
    iget v2, v0, Lzg;->f:I

    .line 21
    .line 22
    add-int/lit8 v2, v2, -0x1

    .line 23
    .line 24
    iput v2, v0, Lzg;->f:I

    .line 25
    .line 26
    iget-object v2, v0, Lzg;->e:Ljava/util/WeakHashMap;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/util/WeakHashMap;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lyg;

    .line 53
    .line 54
    invoke-virtual {v3, v1}, Lyg;->a(Lwg;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v2, v1, Lwg;->f:Lwg;

    .line 59
    .line 60
    iget-object v3, v1, Lwg;->e:Lwg;

    .line 61
    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    iput-object v3, v2, Lwg;->e:Lwg;

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    iput-object v3, v0, Lzg;->c:Lwg;

    .line 68
    .line 69
    :goto_1
    iget-object v3, v1, Lwg;->e:Lwg;

    .line 70
    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    iput-object v2, v3, Lwg;->f:Lwg;

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    iput-object v2, v0, Lzg;->d:Lwg;

    .line 77
    .line 78
    :goto_2
    const/4 v2, 0x0

    .line 79
    iput-object v2, v1, Lwg;->e:Lwg;

    .line 80
    .line 81
    iput-object v2, v1, Lwg;->f:Lwg;

    .line 82
    .line 83
    :goto_3
    iget-object v0, v0, LR7;->g:Ljava/util/HashMap;

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final c(LXc;)LSc;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 2
    .line 3
    iget-object v0, v0, LR7;->g:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lwg;

    .line 17
    .line 18
    iget-object p1, p1, Lwg;->f:Lwg;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object p1, v2

    .line 22
    :goto_0
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p1, Lwg;->d:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, LZc;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p1, LZc;->a:LSc;

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move-object p1, v2

    .line 34
    :goto_1
    iget-object v0, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    xor-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/lit8 v1, v1, -0x1

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    move-object v2, v0

    .line 55
    check-cast v2, LSc;

    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 58
    .line 59
    const-string v1, "state1"

    .line 60
    .line 61
    invoke-static {v1, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-gez v1, :cond_3

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    move-object p1, v0

    .line 74
    :goto_2
    if-eqz v2, :cond_4

    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-gez v0, :cond_4

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_4
    move-object v2, p1

    .line 84
    :goto_3
    return-object v2
.end method

.method public final d(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/lifecycle/a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, LW2;->L()LW2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, LW2;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LW2;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string v0, "Method "

    .line 32
    .line 33
    const-string v1, " must be called on the main thread"

    .line 34
    .line 35
    invoke-static {v0, p1, v1}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw v0

    .line 49
    :cond_1
    :goto_0
    return-void
.end method

.method public final e(LRc;)V
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "handleLifecycleEvent"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/lifecycle/a;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, LRc;->a()LSc;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->f(LSc;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f(LSc;)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v1, LSc;->d:LSc;

    .line 7
    .line 8
    sget-object v2, LSc;->c:LSc;

    .line 9
    .line 10
    if-ne v0, v1, :cond_2

    .line 11
    .line 12
    if-eq p1, v2, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v0, "no event down from "

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, " in component "

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Landroidx/lifecycle/a;->d:Ljava/lang/ref/WeakReference;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw v0

    .line 55
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 56
    .line 57
    iget-boolean p1, p0, Landroidx/lifecycle/a;->f:Z

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    iget p1, p0, Landroidx/lifecycle/a;->e:I

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iput-boolean v0, p0, Landroidx/lifecycle/a;->f:Z

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/lifecycle/a;->g()V

    .line 70
    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Landroidx/lifecycle/a;->f:Z

    .line 74
    .line 75
    iget-object p1, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 76
    .line 77
    if-ne p1, v2, :cond_4

    .line 78
    .line 79
    new-instance p1, LR7;

    .line 80
    .line 81
    invoke-direct {p1}, LR7;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 85
    .line 86
    :cond_4
    return-void

    .line 87
    :cond_5
    :goto_1
    iput-boolean v0, p0, Landroidx/lifecycle/a;->g:Z

    .line 88
    .line 89
    return-void
.end method

.method public final g()V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/a;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LYc;

    .line 8
    .line 9
    if-eqz v0, :cond_8

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 12
    .line 13
    iget v2, v1, Lzg;->f:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v1, v1, Lzg;->c:Lwg;

    .line 20
    .line 21
    invoke-static {v1}, Llc;->e(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, v1, Lwg;->d:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, LZc;

    .line 27
    .line 28
    iget-object v1, v1, LZc;->a:LSc;

    .line 29
    .line 30
    iget-object v2, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 31
    .line 32
    iget-object v2, v2, Lzg;->d:Lwg;

    .line 33
    .line 34
    invoke-static {v2}, Llc;->e(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v2, Lwg;->d:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, LZc;

    .line 40
    .line 41
    iget-object v2, v2, LZc;->a:LSc;

    .line 42
    .line 43
    if-ne v1, v2, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 46
    .line 47
    if-ne v1, v2, :cond_2

    .line 48
    .line 49
    :goto_0
    iput-boolean v3, p0, Landroidx/lifecycle/a;->g:Z

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iput-boolean v3, p0, Landroidx/lifecycle/a;->g:Z

    .line 53
    .line 54
    iget-object v1, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 55
    .line 56
    iget-object v2, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 57
    .line 58
    iget-object v2, v2, Lzg;->c:Lwg;

    .line 59
    .line 60
    invoke-static {v2}, Llc;->e(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object v2, v2, Lwg;->d:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, LZc;

    .line 66
    .line 67
    iget-object v2, v2, LZc;->a:LSc;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-gez v1, :cond_5

    .line 74
    .line 75
    iget-object v1, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 76
    .line 77
    new-instance v2, Lvg;

    .line 78
    .line 79
    iget-object v3, v1, Lzg;->d:Lwg;

    .line 80
    .line 81
    iget-object v4, v1, Lzg;->c:Lwg;

    .line 82
    .line 83
    const/4 v5, 0x1

    .line 84
    invoke-direct {v2, v3, v4, v5}, Lvg;-><init>(Lwg;Lwg;I)V

    .line 85
    .line 86
    .line 87
    iget-object v1, v1, Lzg;->e:Ljava/util/WeakHashMap;

    .line 88
    .line 89
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {v1, v2, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    :cond_3
    invoke-virtual {v2}, Lvg;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_5

    .line 99
    .line 100
    iget-boolean v1, p0, Landroidx/lifecycle/a;->g:Z

    .line 101
    .line 102
    if-nez v1, :cond_5

    .line 103
    .line 104
    invoke-virtual {v2}, Lvg;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Ljava/util/Map$Entry;

    .line 109
    .line 110
    const-string v3, "next()"

    .line 111
    .line 112
    invoke-static {v3, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, LXc;

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, LZc;

    .line 126
    .line 127
    :goto_1
    iget-object v4, v1, LZc;->a:LSc;

    .line 128
    .line 129
    iget-object v5, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    if-lez v4, :cond_3

    .line 136
    .line 137
    iget-boolean v4, p0, Landroidx/lifecycle/a;->g:Z

    .line 138
    .line 139
    if-nez v4, :cond_3

    .line 140
    .line 141
    iget-object v4, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 142
    .line 143
    iget-object v4, v4, LR7;->g:Ljava/util/HashMap;

    .line 144
    .line 145
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_3

    .line 150
    .line 151
    sget-object v4, LRc;->Companion:LPc;

    .line 152
    .line 153
    iget-object v5, v1, LZc;->a:LSc;

    .line 154
    .line 155
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    invoke-static {v5}, LPc;->a(LSc;)LRc;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    if-eqz v4, :cond_4

    .line 163
    .line 164
    invoke-virtual {v4}, LRc;->a()LSc;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    iget-object v6, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 169
    .line 170
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v0, v4}, LZc;->a(LYc;LRc;)V

    .line 174
    .line 175
    .line 176
    iget-object v4, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 177
    .line 178
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    add-int/lit8 v5, v5, -0x1

    .line 183
    .line 184
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 189
    .line 190
    new-instance v2, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v3, "no event down from "

    .line 193
    .line 194
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    iget-object v1, v1, LZc;->a:LSc;

    .line 198
    .line 199
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    throw v0

    .line 210
    :cond_5
    iget-object v1, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 211
    .line 212
    iget-object v1, v1, Lzg;->d:Lwg;

    .line 213
    .line 214
    iget-boolean v2, p0, Landroidx/lifecycle/a;->g:Z

    .line 215
    .line 216
    if-nez v2, :cond_0

    .line 217
    .line 218
    if-eqz v1, :cond_0

    .line 219
    .line 220
    iget-object v2, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 221
    .line 222
    iget-object v1, v1, Lwg;->d:Ljava/lang/Object;

    .line 223
    .line 224
    check-cast v1, LZc;

    .line 225
    .line 226
    iget-object v1, v1, LZc;->a:LSc;

    .line 227
    .line 228
    invoke-virtual {v2, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-lez v1, :cond_0

    .line 233
    .line 234
    iget-object v1, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 237
    .line 238
    .line 239
    new-instance v2, Lxg;

    .line 240
    .line 241
    invoke-direct {v2, v1}, Lxg;-><init>(Lzg;)V

    .line 242
    .line 243
    .line 244
    iget-object v1, v1, Lzg;->e:Ljava/util/WeakHashMap;

    .line 245
    .line 246
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 247
    .line 248
    invoke-virtual {v1, v2, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    :cond_6
    invoke-virtual {v2}, Lxg;->hasNext()Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_0

    .line 256
    .line 257
    iget-boolean v1, p0, Landroidx/lifecycle/a;->g:Z

    .line 258
    .line 259
    if-nez v1, :cond_0

    .line 260
    .line 261
    invoke-virtual {v2}, Lxg;->next()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    check-cast v1, Ljava/util/Map$Entry;

    .line 266
    .line 267
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    check-cast v3, LXc;

    .line 272
    .line 273
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    check-cast v1, LZc;

    .line 278
    .line 279
    :goto_2
    iget-object v4, v1, LZc;->a:LSc;

    .line 280
    .line 281
    iget-object v5, p0, Landroidx/lifecycle/a;->c:LSc;

    .line 282
    .line 283
    invoke-virtual {v4, v5}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    if-gez v4, :cond_6

    .line 288
    .line 289
    iget-boolean v4, p0, Landroidx/lifecycle/a;->g:Z

    .line 290
    .line 291
    if-nez v4, :cond_6

    .line 292
    .line 293
    iget-object v4, p0, Landroidx/lifecycle/a;->b:LR7;

    .line 294
    .line 295
    iget-object v4, v4, LR7;->g:Ljava/util/HashMap;

    .line 296
    .line 297
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    if-eqz v4, :cond_6

    .line 302
    .line 303
    iget-object v4, v1, LZc;->a:LSc;

    .line 304
    .line 305
    iget-object v5, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 306
    .line 307
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    sget-object v4, LRc;->Companion:LPc;

    .line 311
    .line 312
    iget-object v5, v1, LZc;->a:LSc;

    .line 313
    .line 314
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 315
    .line 316
    .line 317
    invoke-static {v5}, LPc;->b(LSc;)LRc;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    if-eqz v4, :cond_7

    .line 322
    .line 323
    invoke-virtual {v1, v0, v4}, LZc;->a(LYc;LRc;)V

    .line 324
    .line 325
    .line 326
    iget-object v4, p0, Landroidx/lifecycle/a;->h:Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    add-int/lit8 v5, v5, -0x1

    .line 333
    .line 334
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    goto :goto_2

    .line 338
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 339
    .line 340
    new-instance v2, Ljava/lang/StringBuilder;

    .line 341
    .line 342
    const-string v3, "no event up from "

    .line 343
    .line 344
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    iget-object v1, v1, LZc;->a:LSc;

    .line 348
    .line 349
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    throw v0

    .line 360
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 361
    .line 362
    const-string v1, "LifecycleOwner of this LifecycleRegistry is already garbage collected. It is too late to change lifecycle state."

    .line 363
    .line 364
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    throw v0
.end method
