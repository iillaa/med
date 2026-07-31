.class public final Ld5;
.super LE3;
.source "SourceFile"


# instance fields
.field public final n:LA3;


# direct methods
.method public constructor <init>(ILA3;LJ9;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p3}, LE3;-><init>(ILJ9;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ld5;->n:LA3;

    .line 5
    .line 6
    sget-object p3, LA3;->c:LA3;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-eq p2, p3, :cond_1

    .line 10
    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "Buffered channel capacity must be at least 1, but "

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " was specified"

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p2

    .line 43
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string p2, "This implementation does not support suspension for senders, use "

    .line 46
    .line 47
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    sget-object p2, LUf;->a:LVf;

    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    new-instance p2, Lm4;

    .line 56
    .line 57
    const-class p3, LE3;

    .line 58
    .line 59
    invoke-direct {p2, p3}, Lm4;-><init>(Ljava/lang/Class;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3}, Ljava/lang/Class;->isAnonymousClass()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const/4 v1, 0x0

    .line 67
    if-nez p2, :cond_8

    .line 68
    .line 69
    invoke-virtual {p3}, Ljava/lang/Class;->isLocalClass()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_5

    .line 74
    .line 75
    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p3}, Ljava/lang/Class;->getEnclosingMethod()Ljava/lang/reflect/Method;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/16 v2, 0x24

    .line 84
    .line 85
    if-nez v1, :cond_4

    .line 86
    .line 87
    invoke-virtual {p3}, Ljava/lang/Class;->getEnclosingConstructor()Ljava/lang/reflect/Constructor;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    if-nez p3, :cond_3

    .line 92
    .line 93
    const/4 p3, 0x6

    .line 94
    const/4 v1, 0x0

    .line 95
    invoke-static {p2, v2, v1, p3}, LJh;->J(Ljava/lang/String;CII)I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    const/4 v1, -0x1

    .line 100
    if-ne p3, v1, :cond_2

    .line 101
    .line 102
    :goto_0
    move-object v1, p2

    .line 103
    goto/16 :goto_2

    .line 104
    .line 105
    :cond_2
    add-int/2addr p3, v0

    .line 106
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {p2, p3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    const-string p3, "substring(...)"

    .line 115
    .line 116
    invoke-static {p3, p2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p3}, Ljava/lang/reflect/Constructor;->getName()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    :goto_1
    invoke-static {p2, p3}, LJh;->O(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    goto :goto_2

    .line 144
    :cond_4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    goto :goto_1

    .line 164
    :cond_5
    invoke-virtual {p3}, Ljava/lang/Class;->isArray()Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    sget-object v0, Lm4;->c:Ljava/util/LinkedHashMap;

    .line 169
    .line 170
    if-eqz p2, :cond_7

    .line 171
    .line 172
    invoke-virtual {p3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    .line 177
    .line 178
    .line 179
    move-result p3

    .line 180
    const-string v2, "Array"

    .line 181
    .line 182
    if-eqz p3, :cond_6

    .line 183
    .line 184
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {v0, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    check-cast p2, Ljava/lang/String;

    .line 193
    .line 194
    if-eqz p2, :cond_6

    .line 195
    .line 196
    invoke-virtual {p2, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    :cond_6
    if-nez v1, :cond_8

    .line 201
    .line 202
    move-object v1, v2

    .line 203
    goto :goto_2

    .line 204
    :cond_7
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    invoke-virtual {v0, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    move-object v1, p2

    .line 213
    check-cast v1, Ljava/lang/String;

    .line 214
    .line 215
    if-nez v1, :cond_8

    .line 216
    .line 217
    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    :cond_8
    :goto_2
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    const-string p2, " instead"

    .line 225
    .line 226
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 234
    .line 235
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    throw p2
.end method


# virtual methods
.method public final d(Lr5;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 28

    .line 1
    move-object/from16 v8, p0

    .line 2
    .line 3
    move-object/from16 v9, p2

    .line 4
    .line 5
    sget-object v0, LA3;->e:LA3;

    .line 6
    .line 7
    sget-object v10, Lfj;->a:Lfj;

    .line 8
    .line 9
    const/4 v12, 0x0

    .line 10
    iget-object v1, v8, Ld5;->n:LA3;

    .line 11
    .line 12
    iget-object v14, v8, LE3;->d:LJ9;

    .line 13
    .line 14
    const-string v15, "unexpected"

    .line 15
    .line 16
    sget-object v7, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 17
    .line 18
    sget-object v2, LE3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 19
    .line 20
    const-wide v16, 0xfffffffffffffffL

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    sget-object v11, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 27
    .line 28
    if-ne v1, v0, :cond_13

    .line 29
    .line 30
    invoke-virtual {v11, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-virtual {v8, v0, v1, v12}, LE3;->r(JZ)Z

    .line 35
    .line 36
    .line 37
    move-result v18

    .line 38
    if-eqz v18, :cond_0

    .line 39
    .line 40
    move v0, v12

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    and-long v0, v0, v16

    .line 43
    .line 44
    invoke-virtual {v8, v0, v1}, LE3;->g(J)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    xor-int/2addr v0, v3

    .line 49
    :goto_0
    sget-object v18, LSi;->a:Le4;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    move-object/from16 v24, v10

    .line 54
    .line 55
    move-object/from16 v0, v18

    .line 56
    .line 57
    move v10, v3

    .line 58
    goto/16 :goto_9

    .line 59
    .line 60
    :cond_1
    sget-object v1, LG3;->j:Li0;

    .line 61
    .line 62
    invoke-virtual {v2, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lf4;

    .line 67
    .line 68
    :goto_1
    invoke-virtual {v11, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 69
    .line 70
    .line 71
    move-result-wide v3

    .line 72
    and-long v20, v3, v16

    .line 73
    .line 74
    invoke-virtual {v8, v3, v4, v12}, LE3;->r(JZ)Z

    .line 75
    .line 76
    .line 77
    move-result v22

    .line 78
    sget v4, LG3;->b:I

    .line 79
    .line 80
    int-to-long v2, v4

    .line 81
    div-long v5, v20, v2

    .line 82
    .line 83
    rem-long v2, v20, v2

    .line 84
    .line 85
    long-to-int v3, v2

    .line 86
    iget-wide v12, v0, LYg;->c:J

    .line 87
    .line 88
    cmp-long v2, v12, v5

    .line 89
    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    invoke-static {v8, v5, v6, v0}, LE3;->b(LE3;JLf4;)Lf4;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    if-nez v2, :cond_3

    .line 97
    .line 98
    if-eqz v22, :cond_2

    .line 99
    .line 100
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ld4;

    .line 105
    .line 106
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    move-object/from16 v18, v1

    .line 110
    .line 111
    move-object/from16 v24, v10

    .line 112
    .line 113
    const/4 v10, 0x1

    .line 114
    goto/16 :goto_8

    .line 115
    .line 116
    :cond_2
    :goto_2
    const/4 v12, 0x0

    .line 117
    goto :goto_1

    .line 118
    :cond_3
    move-object v12, v2

    .line 119
    goto :goto_3

    .line 120
    :cond_4
    move-object v12, v0

    .line 121
    :goto_3
    move-object/from16 v0, p0

    .line 122
    .line 123
    move-object v13, v1

    .line 124
    move-object v1, v12

    .line 125
    move v2, v3

    .line 126
    move/from16 v19, v3

    .line 127
    .line 128
    const/4 v6, 0x1

    .line 129
    move-object/from16 v3, p2

    .line 130
    .line 131
    move/from16 v23, v4

    .line 132
    .line 133
    move-object/from16 v24, v10

    .line 134
    .line 135
    const/4 v10, 0x3

    .line 136
    move-wide/from16 v4, v20

    .line 137
    .line 138
    move v10, v6

    .line 139
    move-object v6, v13

    .line 140
    move-object/from16 v25, v7

    .line 141
    .line 142
    move/from16 v7, v22

    .line 143
    .line 144
    invoke-static/range {v0 .. v7}, LE3;->e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_e

    .line 149
    .line 150
    if-eq v0, v10, :cond_d

    .line 151
    .line 152
    const/4 v1, 0x2

    .line 153
    if-eq v0, v1, :cond_9

    .line 154
    .line 155
    const/4 v1, 0x3

    .line 156
    if-eq v0, v1, :cond_8

    .line 157
    .line 158
    const/4 v1, 0x4

    .line 159
    if-eq v0, v1, :cond_6

    .line 160
    .line 161
    const/4 v7, 0x5

    .line 162
    if-eq v0, v7, :cond_5

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_5
    invoke-virtual {v12}, La5;->a()V

    .line 166
    .line 167
    .line 168
    :goto_4
    move-object v0, v12

    .line 169
    move-object v1, v13

    .line 170
    move-object/from16 v10, v24

    .line 171
    .line 172
    move-object/from16 v7, v25

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_6
    move-object/from16 v6, v25

    .line 176
    .line 177
    invoke-virtual {v6, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 178
    .line 179
    .line 180
    move-result-wide v0

    .line 181
    cmp-long v0, v20, v0

    .line 182
    .line 183
    if-gez v0, :cond_7

    .line 184
    .line 185
    invoke-virtual {v12}, La5;->a()V

    .line 186
    .line 187
    .line 188
    :cond_7
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    new-instance v1, Ld4;

    .line 193
    .line 194
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    :goto_5
    move-object/from16 v18, v1

    .line 198
    .line 199
    goto :goto_8

    .line 200
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 201
    .line 202
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

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
    :cond_9
    if-eqz v22, :cond_a

    .line 211
    .line 212
    invoke-virtual {v12}, LYg;->h()V

    .line 213
    .line 214
    .line 215
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    new-instance v1, Ld4;

    .line 220
    .line 221
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 222
    .line 223
    .line 224
    goto :goto_5

    .line 225
    :cond_a
    instance-of v0, v13, Lbk;

    .line 226
    .line 227
    if-eqz v0, :cond_b

    .line 228
    .line 229
    move-object v0, v13

    .line 230
    check-cast v0, Lbk;

    .line 231
    .line 232
    goto :goto_6

    .line 233
    :cond_b
    const/4 v0, 0x0

    .line 234
    :goto_6
    if-eqz v0, :cond_c

    .line 235
    .line 236
    add-int v3, v19, v23

    .line 237
    .line 238
    invoke-interface {v0, v12, v3}, Lbk;->a(LYg;I)V

    .line 239
    .line 240
    .line 241
    :cond_c
    invoke-virtual {v12}, LYg;->h()V

    .line 242
    .line 243
    .line 244
    goto :goto_8

    .line 245
    :cond_d
    :goto_7
    move-object/from16 v18, v24

    .line 246
    .line 247
    goto :goto_8

    .line 248
    :cond_e
    invoke-virtual {v12}, La5;->a()V

    .line 249
    .line 250
    .line 251
    goto :goto_7

    .line 252
    :goto_8
    move-object/from16 v0, v18

    .line 253
    .line 254
    :goto_9
    instance-of v1, v0, Le4;

    .line 255
    .line 256
    xor-int/2addr v1, v10

    .line 257
    if-nez v1, :cond_12

    .line 258
    .line 259
    instance-of v1, v0, Ld4;

    .line 260
    .line 261
    if-eqz v1, :cond_f

    .line 262
    .line 263
    goto :goto_b

    .line 264
    :cond_f
    if-eqz v14, :cond_11

    .line 265
    .line 266
    const/4 v0, 0x0

    .line 267
    invoke-static {v14, v9, v0}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    if-nez v1, :cond_10

    .line 272
    .line 273
    goto :goto_a

    .line 274
    :cond_10
    throw v1

    .line 275
    :cond_11
    :goto_a
    move-object/from16 v0, v24

    .line 276
    .line 277
    :cond_12
    :goto_b
    move-object/from16 v21, v14

    .line 278
    .line 279
    goto/16 :goto_12

    .line 280
    .line 281
    :cond_13
    move-object v6, v7

    .line 282
    move-object/from16 v24, v10

    .line 283
    .line 284
    const/4 v7, 0x5

    .line 285
    move v10, v3

    .line 286
    sget-object v12, LG3;->d:Li0;

    .line 287
    .line 288
    invoke-virtual {v2, v8}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Lf4;

    .line 293
    .line 294
    :goto_c
    invoke-virtual {v11, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 295
    .line 296
    .line 297
    move-result-wide v1

    .line 298
    and-long v19, v1, v16

    .line 299
    .line 300
    const/4 v13, 0x0

    .line 301
    invoke-virtual {v8, v1, v2, v13}, LE3;->r(JZ)Z

    .line 302
    .line 303
    .line 304
    move-result v18

    .line 305
    sget v4, LG3;->b:I

    .line 306
    .line 307
    int-to-long v2, v4

    .line 308
    move-object/from16 v21, v14

    .line 309
    .line 310
    div-long v13, v19, v2

    .line 311
    .line 312
    move-object/from16 v22, v11

    .line 313
    .line 314
    rem-long v10, v19, v2

    .line 315
    .line 316
    long-to-int v10, v10

    .line 317
    iget-wide v7, v0, LYg;->c:J

    .line 318
    .line 319
    cmp-long v1, v7, v13

    .line 320
    .line 321
    move-object/from16 v8, p0

    .line 322
    .line 323
    if-eqz v1, :cond_16

    .line 324
    .line 325
    invoke-static {v8, v13, v14, v0}, LE3;->b(LE3;JLf4;)Lf4;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    if-nez v1, :cond_15

    .line 330
    .line 331
    if-eqz v18, :cond_14

    .line 332
    .line 333
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    new-instance v1, Ld4;

    .line 338
    .line 339
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 340
    .line 341
    .line 342
    :goto_d
    move-object v0, v1

    .line 343
    goto/16 :goto_12

    .line 344
    .line 345
    :cond_14
    move-object/from16 v14, v21

    .line 346
    .line 347
    move-object/from16 v11, v22

    .line 348
    .line 349
    const/4 v7, 0x5

    .line 350
    const/4 v10, 0x1

    .line 351
    goto :goto_c

    .line 352
    :cond_15
    move-object v11, v1

    .line 353
    goto :goto_e

    .line 354
    :cond_16
    move-object v11, v0

    .line 355
    :goto_e
    move-object/from16 v0, p0

    .line 356
    .line 357
    move-object v1, v11

    .line 358
    move-wide v13, v2

    .line 359
    move v2, v10

    .line 360
    move-object/from16 v3, p2

    .line 361
    .line 362
    move/from16 v25, v4

    .line 363
    .line 364
    move-wide/from16 v4, v19

    .line 365
    .line 366
    move-object v7, v6

    .line 367
    move-object v6, v12

    .line 368
    move-object v9, v7

    .line 369
    move-wide/from16 v26, v13

    .line 370
    .line 371
    const/4 v13, 0x5

    .line 372
    move/from16 v7, v18

    .line 373
    .line 374
    invoke-static/range {v0 .. v7}, LE3;->e(LE3;Lf4;ILjava/lang/Object;JLjava/lang/Object;Z)I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-eqz v0, :cond_20

    .line 379
    .line 380
    const/4 v1, 0x1

    .line 381
    if-eq v0, v1, :cond_1f

    .line 382
    .line 383
    const/4 v2, 0x2

    .line 384
    if-eq v0, v2, :cond_1b

    .line 385
    .line 386
    const/4 v3, 0x3

    .line 387
    if-eq v0, v3, :cond_1a

    .line 388
    .line 389
    const/4 v4, 0x4

    .line 390
    if-eq v0, v4, :cond_18

    .line 391
    .line 392
    if-eq v0, v13, :cond_17

    .line 393
    .line 394
    goto :goto_f

    .line 395
    :cond_17
    invoke-virtual {v11}, La5;->a()V

    .line 396
    .line 397
    .line 398
    :goto_f
    move v10, v1

    .line 399
    move-object v6, v9

    .line 400
    move-object v0, v11

    .line 401
    move v7, v13

    .line 402
    move-object/from16 v14, v21

    .line 403
    .line 404
    move-object/from16 v11, v22

    .line 405
    .line 406
    move-object/from16 v9, p2

    .line 407
    .line 408
    goto :goto_c

    .line 409
    :cond_18
    invoke-virtual {v9, v8}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 410
    .line 411
    .line 412
    move-result-wide v0

    .line 413
    cmp-long v0, v19, v0

    .line 414
    .line 415
    if-gez v0, :cond_19

    .line 416
    .line 417
    invoke-virtual {v11}, La5;->a()V

    .line 418
    .line 419
    .line 420
    :cond_19
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    new-instance v1, Ld4;

    .line 425
    .line 426
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 427
    .line 428
    .line 429
    goto :goto_d

    .line 430
    :cond_1a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 431
    .line 432
    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    throw v0

    .line 440
    :cond_1b
    if-eqz v18, :cond_1c

    .line 441
    .line 442
    invoke-virtual {v11}, LYg;->h()V

    .line 443
    .line 444
    .line 445
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    new-instance v1, Ld4;

    .line 450
    .line 451
    invoke-direct {v1, v0}, Ld4;-><init>(Ljava/lang/Throwable;)V

    .line 452
    .line 453
    .line 454
    goto :goto_d

    .line 455
    :cond_1c
    instance-of v0, v12, Lbk;

    .line 456
    .line 457
    if-eqz v0, :cond_1d

    .line 458
    .line 459
    move-object v0, v12

    .line 460
    check-cast v0, Lbk;

    .line 461
    .line 462
    goto :goto_10

    .line 463
    :cond_1d
    const/4 v0, 0x0

    .line 464
    :goto_10
    if-eqz v0, :cond_1e

    .line 465
    .line 466
    add-int v4, v10, v25

    .line 467
    .line 468
    invoke-interface {v0, v11, v4}, Lbk;->a(LYg;I)V

    .line 469
    .line 470
    .line 471
    :cond_1e
    iget-wide v0, v11, LYg;->c:J

    .line 472
    .line 473
    mul-long v0, v0, v26

    .line 474
    .line 475
    int-to-long v2, v10

    .line 476
    add-long/2addr v0, v2

    .line 477
    invoke-virtual {v8, v0, v1}, LE3;->k(J)V

    .line 478
    .line 479
    .line 480
    :cond_1f
    :goto_11
    move-object/from16 v0, v24

    .line 481
    .line 482
    goto :goto_12

    .line 483
    :cond_20
    invoke-virtual {v11}, La5;->a()V

    .line 484
    .line 485
    .line 486
    goto :goto_11

    .line 487
    :goto_12
    instance-of v0, v0, Ld4;

    .line 488
    .line 489
    if-eqz v0, :cond_22

    .line 490
    .line 491
    if-eqz v21, :cond_21

    .line 492
    .line 493
    move-object/from16 v0, p2

    .line 494
    .line 495
    move-object/from16 v2, v21

    .line 496
    .line 497
    const/4 v1, 0x0

    .line 498
    invoke-static {v2, v0, v1}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    if-eqz v0, :cond_21

    .line 503
    .line 504
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    invoke-static {v0, v1}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 509
    .line 510
    .line 511
    throw v0

    .line 512
    :cond_21
    invoke-virtual/range {p0 .. p0}, LE3;->o()Ljava/lang/Throwable;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    throw v0

    .line 517
    :cond_22
    return-object v24
.end method

.method public final s()Z
    .locals 2

    .line 1
    sget-object v0, LA3;->d:LA3;

    .line 2
    .line 3
    iget-object v1, p0, Ld5;->n:LA3;

    .line 4
    .line 5
    if-ne v1, v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    return v0
.end method
