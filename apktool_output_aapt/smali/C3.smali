.class public final LC3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbk;


# instance fields
.field public c:Ljava/lang/Object;

.field public d:LP3;

.field public final synthetic e:LE3;


# direct methods
.method public constructor <init>(LE3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC3;->e:LE3;

    .line 5
    .line 6
    sget-object p1, LG3;->p:Li0;

    .line 7
    .line 8
    iput-object p1, p0, LC3;->c:Ljava/lang/Object;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(LYg;I)V
    .locals 1

    .line 1
    iget-object v0, p0, LC3;->d:LP3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, LP3;->a(LYg;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final b(LA8;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v7, p0

    .line 2
    .line 3
    iget-object v0, v7, LC3;->c:Ljava/lang/Object;

    .line 4
    .line 5
    sget-object v1, LG3;->p:Li0;

    .line 6
    .line 7
    const/4 v8, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    sget-object v1, LG3;->l:Li0;

    .line 11
    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_9

    .line 15
    .line 16
    :cond_0
    sget-object v0, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 17
    .line 18
    iget-object v9, v7, LC3;->e:LE3;

    .line 19
    .line 20
    invoke-virtual {v0, v9}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lf4;

    .line 25
    .line 26
    :cond_1
    :goto_0
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    sget-object v1, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 30
    .line 31
    invoke-virtual {v1, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {v9, v1, v2, v8}, LE3;->r(JZ)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    sget-object v0, LG3;->l:Li0;

    .line 42
    .line 43
    iput-object v0, v7, LC3;->c:Ljava/lang/Object;

    .line 44
    .line 45
    invoke-virtual {v9}, LE3;->n()Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    const/4 v8, 0x0

    .line 52
    goto/16 :goto_9

    .line 53
    .line 54
    :cond_2
    sget v1, Lsh;->a:I

    .line 55
    .line 56
    throw v0

    .line 57
    :cond_3
    sget-object v1, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 58
    .line 59
    invoke-virtual {v1, v9}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v10

    .line 63
    sget v1, LG3;->b:I

    .line 64
    .line 65
    int-to-long v1, v1

    .line 66
    div-long v3, v10, v1

    .line 67
    .line 68
    rem-long v1, v10, v1

    .line 69
    .line 70
    long-to-int v12, v1

    .line 71
    iget-wide v1, v0, LYg;->c:J

    .line 72
    .line 73
    cmp-long v1, v1, v3

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v9, v3, v4, v0}, LE3;->m(JLf4;)Lf4;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-nez v1, :cond_4

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    move-object v0, v1

    .line 85
    :cond_5
    const/4 v6, 0x0

    .line 86
    move-object v1, v9

    .line 87
    move-object v2, v0

    .line 88
    move v3, v12

    .line 89
    move-wide v4, v10

    .line 90
    invoke-virtual/range {v1 .. v6}, LE3;->z(Lf4;IJLC3;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget-object v13, LG3;->m:Li0;

    .line 95
    .line 96
    if-eq v1, v13, :cond_15

    .line 97
    .line 98
    sget-object v14, LG3;->o:Li0;

    .line 99
    .line 100
    if-ne v1, v14, :cond_6

    .line 101
    .line 102
    invoke-virtual {v9}, LE3;->p()J

    .line 103
    .line 104
    .line 105
    move-result-wide v1

    .line 106
    cmp-long v1, v10, v1

    .line 107
    .line 108
    if-gez v1, :cond_1

    .line 109
    .line 110
    invoke-virtual {v0}, La5;->a()V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    sget-object v2, LG3;->n:Li0;

    .line 115
    .line 116
    if-ne v1, v2, :cond_14

    .line 117
    .line 118
    iget-object v15, v7, LC3;->e:LE3;

    .line 119
    .line 120
    invoke-static/range {p1 .. p1}, LMk;->w(Lr5;)Lr5;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-static {v1}, Llc;->r(Lr5;)LP3;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    :try_start_0
    iput-object v6, v7, LC3;->d:LP3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 129
    .line 130
    move-object v1, v15

    .line 131
    move-object v2, v0

    .line 132
    move v3, v12

    .line 133
    move-wide v4, v10

    .line 134
    move-object/from16 v16, v6

    .line 135
    .line 136
    move-object/from16 v6, p0

    .line 137
    .line 138
    :try_start_1
    invoke-virtual/range {v1 .. v6}, LE3;->z(Lf4;IJLC3;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    if-ne v1, v13, :cond_7

    .line 143
    .line 144
    invoke-virtual {v7, v0, v12}, LC3;->a(LYg;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 145
    .line 146
    .line 147
    :goto_1
    move-object/from16 v2, v16

    .line 148
    .line 149
    goto/16 :goto_7

    .line 150
    .line 151
    :goto_2
    move-object/from16 v2, v16

    .line 152
    .line 153
    goto/16 :goto_8

    .line 154
    .line 155
    :cond_7
    const/4 v12, 0x0

    .line 156
    iget-object v13, v15, LE3;->d:LJ9;

    .line 157
    .line 158
    if-ne v1, v14, :cond_12

    .line 159
    .line 160
    :try_start_2
    invoke-virtual {v15}, LE3;->p()J

    .line 161
    .line 162
    .line 163
    move-result-wide v1

    .line 164
    cmp-long v1, v10, v1

    .line 165
    .line 166
    if-gez v1, :cond_8

    .line 167
    .line 168
    invoke-virtual {v0}, La5;->a()V

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :catchall_0
    move-exception v0

    .line 173
    goto :goto_2

    .line 174
    :cond_8
    :goto_3
    sget-object v0, LE3;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 175
    .line 176
    invoke-virtual {v0, v15}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lf4;

    .line 181
    .line 182
    :cond_9
    :goto_4
    sget-object v1, LE3;->e:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 183
    .line 184
    invoke-virtual {v1, v15}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 185
    .line 186
    .line 187
    move-result-wide v1

    .line 188
    invoke-virtual {v15, v1, v2, v8}, LE3;->r(JZ)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-eqz v1, :cond_b

    .line 193
    .line 194
    iget-object v0, v7, LC3;->d:LP3;

    .line 195
    .line 196
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    iput-object v12, v7, LC3;->d:LP3;

    .line 200
    .line 201
    sget-object v1, LG3;->l:Li0;

    .line 202
    .line 203
    iput-object v1, v7, LC3;->c:Ljava/lang/Object;

    .line 204
    .line 205
    invoke-virtual {v9}, LE3;->n()Ljava/lang/Throwable;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    if-nez v1, :cond_a

    .line 210
    .line 211
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 212
    .line 213
    :goto_5
    invoke-virtual {v0, v1}, LP3;->h(Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    goto :goto_1

    .line 217
    :cond_a
    invoke-static {v1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    goto :goto_5

    .line 222
    :cond_b
    sget-object v1, LE3;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 223
    .line 224
    invoke-virtual {v1, v15}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 225
    .line 226
    .line 227
    move-result-wide v10

    .line 228
    sget v1, LG3;->b:I

    .line 229
    .line 230
    int-to-long v1, v1

    .line 231
    div-long v3, v10, v1

    .line 232
    .line 233
    rem-long v1, v10, v1

    .line 234
    .line 235
    long-to-int v14, v1

    .line 236
    iget-wide v1, v0, LYg;->c:J

    .line 237
    .line 238
    cmp-long v1, v1, v3

    .line 239
    .line 240
    if-eqz v1, :cond_d

    .line 241
    .line 242
    invoke-virtual {v15, v3, v4, v0}, LE3;->m(JLf4;)Lf4;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    if-nez v1, :cond_c

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_c
    move-object v0, v1

    .line 250
    :cond_d
    move-object v1, v15

    .line 251
    move-object v2, v0

    .line 252
    move v3, v14

    .line 253
    move-wide v4, v10

    .line 254
    move-object/from16 v6, p0

    .line 255
    .line 256
    invoke-virtual/range {v1 .. v6}, LE3;->z(Lf4;IJLC3;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    sget-object v2, LG3;->m:Li0;

    .line 261
    .line 262
    if-ne v1, v2, :cond_e

    .line 263
    .line 264
    invoke-virtual {v7, v0, v14}, LC3;->a(LYg;I)V

    .line 265
    .line 266
    .line 267
    goto :goto_1

    .line 268
    :cond_e
    sget-object v2, LG3;->o:Li0;

    .line 269
    .line 270
    if-ne v1, v2, :cond_f

    .line 271
    .line 272
    invoke-virtual {v15}, LE3;->p()J

    .line 273
    .line 274
    .line 275
    move-result-wide v1

    .line 276
    cmp-long v1, v10, v1

    .line 277
    .line 278
    if-gez v1, :cond_9

    .line 279
    .line 280
    invoke-virtual {v0}, La5;->a()V

    .line 281
    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_f
    sget-object v2, LG3;->n:Li0;

    .line 285
    .line 286
    if-eq v1, v2, :cond_11

    .line 287
    .line 288
    invoke-virtual {v0}, La5;->a()V

    .line 289
    .line 290
    .line 291
    iput-object v1, v7, LC3;->c:Ljava/lang/Object;

    .line 292
    .line 293
    iput-object v12, v7, LC3;->d:LP3;

    .line 294
    .line 295
    if-eqz v13, :cond_10

    .line 296
    .line 297
    new-instance v12, LB3;

    .line 298
    .line 299
    invoke-direct {v12, v13, v1}, LB3;-><init>(LJ9;Ljava/lang/Object;)V

    .line 300
    .line 301
    .line 302
    :cond_10
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 303
    .line 304
    move-object/from16 v2, v16

    .line 305
    .line 306
    :try_start_3
    iget v1, v2, LQ6;->e:I

    .line 307
    .line 308
    :goto_6
    invoke-virtual {v2, v0, v1, v12}, LP3;->t(Ljava/lang/Object;ILO9;)V

    .line 309
    .line 310
    .line 311
    goto :goto_7

    .line 312
    :cond_11
    move-object/from16 v2, v16

    .line 313
    .line 314
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 315
    .line 316
    const-string v1, "unexpected"

    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    throw v0

    .line 326
    :catchall_1
    move-exception v0

    .line 327
    goto :goto_8

    .line 328
    :cond_12
    move-object/from16 v2, v16

    .line 329
    .line 330
    invoke-virtual {v0}, La5;->a()V

    .line 331
    .line 332
    .line 333
    iput-object v1, v7, LC3;->c:Ljava/lang/Object;

    .line 334
    .line 335
    iput-object v12, v7, LC3;->d:LP3;

    .line 336
    .line 337
    if-eqz v13, :cond_13

    .line 338
    .line 339
    new-instance v12, LB3;

    .line 340
    .line 341
    invoke-direct {v12, v13, v1}, LB3;-><init>(LJ9;Ljava/lang/Object;)V

    .line 342
    .line 343
    .line 344
    :cond_13
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 345
    .line 346
    iget v1, v2, LQ6;->e:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 347
    .line 348
    goto :goto_6

    .line 349
    :goto_7
    invoke-virtual {v2}, LP3;->o()Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    return-object v0

    .line 354
    :catchall_2
    move-exception v0

    .line 355
    move-object v2, v6

    .line 356
    :goto_8
    invoke-virtual {v2}, LP3;->s()V

    .line 357
    .line 358
    .line 359
    throw v0

    .line 360
    :cond_14
    invoke-virtual {v0}, La5;->a()V

    .line 361
    .line 362
    .line 363
    iput-object v1, v7, LC3;->c:Ljava/lang/Object;

    .line 364
    .line 365
    :goto_9
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    return-object v0

    .line 370
    :cond_15
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 371
    .line 372
    const-string v1, "unreachable"

    .line 373
    .line 374
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    throw v0
.end method
