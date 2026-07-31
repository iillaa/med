.class public final Lrg;
.super Ls5;
.source "SourceFile"

# interfaces
.implements Lz8;


# instance fields
.field public final f:Lz8;

.field public final g:LY5;

.field public final h:I

.field public i:LY5;

.field public j:Lr5;


# direct methods
.method public constructor <init>(Lz8;LY5;)V
    .locals 2

    .line 1
    sget-object v0, LH4;->e:LH4;

    .line 2
    .line 3
    sget-object v1, LE7;->c:LE7;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Ls5;-><init>(Lr5;LY5;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lrg;->f:Lz8;

    .line 9
    .line 10
    iput-object p2, p0, Lrg;->g:LY5;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, LZ5;

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    invoke-direct {v0, v1}, LZ5;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2, p1, v0}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/lang/Number;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lrg;->h:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0, p2, p1}, Lrg;->m(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    sget-object p2, Li6;->c:Li6;

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    sget-object p1, Lfj;->a:Lfj;

    .line 11
    .line 12
    return-object p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    new-instance v0, LW6;

    .line 15
    .line 16
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-direct {v0, p2, p1}, LW6;-><init>(LY5;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lrg;->i:LY5;

    .line 24
    .line 25
    throw p1
.end method

.method public final e()Lj6;
    .locals 2

    .line 1
    iget-object v0, p0, Lrg;->j:Lr5;

    .line 2
    .line 3
    instance-of v1, v0, Lj6;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lj6;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    return-object v0
.end method

.method public final getContext()LY5;
    .locals 1

    .line 1
    iget-object v0, p0, Lrg;->i:LY5;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, LE7;->c:LE7;

    .line 6
    .line 7
    :cond_0
    return-object v0
.end method

.method public final j()Ljava/lang/StackTraceElement;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, LW6;

    .line 8
    .line 9
    invoke-virtual {p0}, Lrg;->getContext()LY5;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2, v0}, LW6;-><init>(LY5;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lrg;->i:LY5;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lrg;->j:Lr5;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {v0, p1}, Lr5;->h(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    sget-object p1, Li6;->c:Li6;

    .line 26
    .line 27
    return-object p1
.end method

.method public final m(Lr5;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-interface/range {p1 .. p1}, Lr5;->getContext()LY5;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    sget-object v3, Lt5;->g:Lt5;

    .line 10
    .line 11
    invoke-interface {v2, v3}, LY5;->c(LX5;)LW5;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Luc;

    .line 16
    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    invoke-interface {v3}, Luc;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast v3, LBc;

    .line 27
    .line 28
    invoke-virtual {v3}, LBc;->u()Ljava/util/concurrent/CancellationException;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    throw v1

    .line 33
    :cond_1
    :goto_0
    iget-object v3, v0, Lrg;->i:LY5;

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    if-eq v3, v2, :cond_16

    .line 37
    .line 38
    instance-of v5, v3, LW6;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    if-eqz v5, :cond_15

    .line 42
    .line 43
    check-cast v3, LW6;

    .line 44
    .line 45
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v7, "\n            Flow exception transparency is violated:\n                Previous \'emit\' call has thrown exception "

    .line 50
    .line 51
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v3, v3, LW6;->d:Ljava/lang/Throwable;

    .line 55
    .line 56
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v3, ", but then emission attempt of value \'"

    .line 60
    .line 61
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, "\' has been detected.\n                Emissions from \'catch\' blocks are prohibited in order to avoid unspecified behaviour, \'Flow.catch\' operator can be used instead.\n                For a more detailed explanation, please refer to Flow documentation.\n            "

    .line 68
    .line 69
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v3, "<this>"

    .line 77
    .line 78
    invoke-static {v3, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    const-string v5, "\r"

    .line 82
    .line 83
    const-string v7, "\r\n"

    .line 84
    .line 85
    const-string v8, "\n"

    .line 86
    .line 87
    filled-new-array {v7, v8, v5}, [Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    const-string v7, "asList(...)"

    .line 96
    .line 97
    invoke-static {v7, v5}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    new-instance v7, LI6;

    .line 101
    .line 102
    new-instance v9, LIh;

    .line 103
    .line 104
    invoke-direct {v9, v5, v6}, LIh;-><init>(Ljava/util/List;Z)V

    .line 105
    .line 106
    .line 107
    invoke-direct {v7, v1, v6, v6, v9}, LI6;-><init>(Ljava/lang/CharSequence;IILN9;)V

    .line 108
    .line 109
    .line 110
    new-instance v5, Le;

    .line 111
    .line 112
    const/4 v9, 0x2

    .line 113
    invoke-direct {v5, v9, v1}, Le;-><init>(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    new-instance v9, Laa;

    .line 117
    .line 118
    invoke-direct {v9, v7, v5}, Laa;-><init>(LI6;Le;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v9}, Lch;->N(Lbh;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    new-instance v7, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    :cond_2
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    const/4 v11, 0x1

    .line 139
    if-eqz v10, :cond_3

    .line 140
    .line 141
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v10

    .line 145
    move-object v12, v10

    .line 146
    check-cast v12, Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v12}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v12

    .line 152
    xor-int/2addr v11, v12

    .line 153
    if-eqz v11, :cond_2

    .line 154
    .line 155
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_3
    new-instance v9, Ljava/util/ArrayList;

    .line 160
    .line 161
    invoke-static {v7}, Lv4;->G(Ljava/lang/Iterable;)I

    .line 162
    .line 163
    .line 164
    move-result v10

    .line 165
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    if-eqz v10, :cond_9

    .line 177
    .line 178
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v10

    .line 182
    check-cast v10, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 185
    .line 186
    .line 187
    move-result v12

    .line 188
    move v13, v6

    .line 189
    :goto_3
    const/4 v14, -0x1

    .line 190
    if-ge v13, v12, :cond_7

    .line 191
    .line 192
    invoke-virtual {v10, v13}, Ljava/lang/String;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v15

    .line 196
    invoke-static {v15}, Ljava/lang/Character;->isWhitespace(C)Z

    .line 197
    .line 198
    .line 199
    move-result v16

    .line 200
    if-nez v16, :cond_5

    .line 201
    .line 202
    invoke-static {v15}, Ljava/lang/Character;->isSpaceChar(C)Z

    .line 203
    .line 204
    .line 205
    move-result v15

    .line 206
    if-eqz v15, :cond_4

    .line 207
    .line 208
    goto :goto_4

    .line 209
    :cond_4
    move v15, v6

    .line 210
    goto :goto_5

    .line 211
    :cond_5
    :goto_4
    move v15, v11

    .line 212
    :goto_5
    xor-int/2addr v15, v11

    .line 213
    if-eqz v15, :cond_6

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_6
    add-int/lit8 v13, v13, 0x1

    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_7
    move v13, v14

    .line 220
    :goto_6
    if-ne v13, v14, :cond_8

    .line 221
    .line 222
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 223
    .line 224
    .line 225
    move-result v13

    .line 226
    :cond_8
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v10

    .line 230
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_9
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 239
    .line 240
    .line 241
    move-result v9

    .line 242
    if-nez v9, :cond_a

    .line 243
    .line 244
    move-object v9, v4

    .line 245
    goto :goto_8

    .line 246
    :cond_a
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    check-cast v9, Ljava/lang/Comparable;

    .line 251
    .line 252
    :cond_b
    :goto_7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 253
    .line 254
    .line 255
    move-result v10

    .line 256
    if-eqz v10, :cond_c

    .line 257
    .line 258
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v10

    .line 262
    check-cast v10, Ljava/lang/Comparable;

    .line 263
    .line 264
    invoke-interface {v9, v10}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 265
    .line 266
    .line 267
    move-result v11

    .line 268
    if-lez v11, :cond_b

    .line 269
    .line 270
    move-object v9, v10

    .line 271
    goto :goto_7

    .line 272
    :cond_c
    :goto_8
    check-cast v9, Ljava/lang/Integer;

    .line 273
    .line 274
    if-eqz v9, :cond_d

    .line 275
    .line 276
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 277
    .line 278
    .line 279
    move-result v7

    .line 280
    goto :goto_9

    .line 281
    :cond_d
    move v7, v6

    .line 282
    :goto_9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 287
    .line 288
    .line 289
    invoke-static {v5}, Lu4;->E(Ljava/util/List;)I

    .line 290
    .line 291
    .line 292
    move-result v9

    .line 293
    new-instance v10, Ljava/util/ArrayList;

    .line 294
    .line 295
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 296
    .line 297
    .line 298
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 303
    .line 304
    .line 305
    move-result v11

    .line 306
    if-eqz v11, :cond_14

    .line 307
    .line 308
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v11

    .line 312
    add-int/lit8 v12, v6, 0x1

    .line 313
    .line 314
    if-ltz v6, :cond_13

    .line 315
    .line 316
    check-cast v11, Ljava/lang/String;

    .line 317
    .line 318
    if-eqz v6, :cond_e

    .line 319
    .line 320
    if-ne v6, v9, :cond_f

    .line 321
    .line 322
    :cond_e
    invoke-static {v11}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 323
    .line 324
    .line 325
    move-result v6

    .line 326
    if-eqz v6, :cond_f

    .line 327
    .line 328
    move-object v6, v4

    .line 329
    goto :goto_c

    .line 330
    :cond_f
    invoke-static {v3, v11}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 331
    .line 332
    .line 333
    if-ltz v7, :cond_12

    .line 334
    .line 335
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 336
    .line 337
    .line 338
    move-result v6

    .line 339
    if-le v7, v6, :cond_10

    .line 340
    .line 341
    goto :goto_b

    .line 342
    :cond_10
    move v6, v7

    .line 343
    :goto_b
    invoke-virtual {v11, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v6

    .line 347
    const-string v11, "substring(...)"

    .line 348
    .line 349
    invoke-static {v11, v6}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 350
    .line 351
    .line 352
    :goto_c
    if-eqz v6, :cond_11

    .line 353
    .line 354
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    :cond_11
    move v6, v12

    .line 358
    goto :goto_a

    .line 359
    :cond_12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 360
    .line 361
    const-string v2, "Requested character count "

    .line 362
    .line 363
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    const-string v2, " is less than zero."

    .line 370
    .line 371
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 379
    .line 380
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    throw v2

    .line 388
    :cond_13
    new-instance v1, Ljava/lang/ArithmeticException;

    .line 389
    .line 390
    const-string v2, "Index overflow has happened."

    .line 391
    .line 392
    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    throw v1

    .line 396
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    .line 397
    .line 398
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 399
    .line 400
    .line 401
    invoke-static {v10, v3, v8}, Lt4;->J(Ljava/util/List;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    const-string v3, "toString(...)"

    .line 409
    .line 410
    invoke-static {v3, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    throw v2

    .line 421
    :cond_15
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    new-instance v5, Lug;

    .line 426
    .line 427
    invoke-direct {v5, v0}, Lug;-><init>(Lrg;)V

    .line 428
    .line 429
    .line 430
    invoke-interface {v2, v3, v5}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    check-cast v3, Ljava/lang/Number;

    .line 435
    .line 436
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 437
    .line 438
    .line 439
    move-result v3

    .line 440
    iget v5, v0, Lrg;->h:I

    .line 441
    .line 442
    if-ne v3, v5, :cond_17

    .line 443
    .line 444
    iput-object v2, v0, Lrg;->i:LY5;

    .line 445
    .line 446
    :cond_16
    move-object/from16 v2, p1

    .line 447
    .line 448
    goto :goto_d

    .line 449
    :cond_17
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 450
    .line 451
    new-instance v3, Ljava/lang/StringBuilder;

    .line 452
    .line 453
    const-string v4, "Flow invariant is violated:\n\t\tFlow was collected in "

    .line 454
    .line 455
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    iget-object v4, v0, Lrg;->g:LY5;

    .line 459
    .line 460
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    const-string v4, ",\n\t\tbut emission happened in "

    .line 464
    .line 465
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    const-string v2, ".\n\t\tPlease refer to \'flow\' documentation or use \'flowOn\' instead"

    .line 472
    .line 473
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v2

    .line 480
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v2

    .line 484
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    throw v1

    .line 488
    :goto_d
    iput-object v2, v0, Lrg;->j:Lr5;

    .line 489
    .line 490
    sget-object v2, Ltg;->a:LO9;

    .line 491
    .line 492
    iget-object v3, v0, Lrg;->f:Lz8;

    .line 493
    .line 494
    const-string v5, "null cannot be cast to non-null type kotlinx.coroutines.flow.FlowCollector<kotlin.Any?>"

    .line 495
    .line 496
    invoke-static {v5, v3}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 497
    .line 498
    .line 499
    invoke-interface {v2, v3, v1, v0}, LO9;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    sget-object v2, Li6;->c:Li6;

    .line 504
    .line 505
    invoke-static {v1, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    if-nez v2, :cond_18

    .line 510
    .line 511
    iput-object v4, v0, Lrg;->j:Lr5;

    .line 512
    .line 513
    :cond_18
    return-object v1
.end method
