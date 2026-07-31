.class public final synthetic Ld9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LFg;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Ld9;->a:I

    iput-object p2, p0, Ld9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Landroid/os/Bundle;
    .locals 13

    .line 1
    iget v0, p0, Ld9;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ld9;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LAg;

    .line 9
    .line 10
    invoke-static {v0}, LAg;->a(LAg;)Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0

    .line 15
    :pswitch_0
    iget-object v0, p0, Ld9;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lq9;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    new-instance v1, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lq9;->b()Ljava/util/HashSet;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lqh;

    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v0}, Lq9;->b()Ljava/util/HashSet;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/4 v4, 0x0

    .line 64
    if-nez v3, :cond_a

    .line 65
    .line 66
    const/4 v2, 0x1

    .line 67
    invoke-virtual {v0, v2}, Lq9;->f(Z)Z

    .line 68
    .line 69
    .line 70
    iput-boolean v2, v0, Lq9;->y:Z

    .line 71
    .line 72
    iget-object v2, v0, Lq9;->E:Lu9;

    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    iget-object v2, v0, Lq9;->c:LN6;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    new-instance v3, Ljava/util/ArrayList;

    .line 83
    .line 84
    iget-object v2, v2, LN6;->d:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v2, Ljava/util/HashMap;

    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    if-eqz v5, :cond_1

    .line 108
    .line 109
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v5}, Loh;->c(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_1
    iget-object v2, v0, Lq9;->c:LN6;

    .line 118
    .line 119
    iget-object v2, v2, LN6;->e:Ljava/lang/Object;

    .line 120
    .line 121
    check-cast v2, Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    const/4 v6, 0x2

    .line 128
    if-eqz v5, :cond_2

    .line 129
    .line 130
    const-string v0, "FragmentManager"

    .line 131
    .line 132
    invoke-static {v0, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_8

    .line 137
    .line 138
    const-string v0, "FragmentManager"

    .line 139
    .line 140
    const-string v2, "saveAllState: no fragments!"

    .line 141
    .line 142
    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    goto/16 :goto_6

    .line 146
    .line 147
    :cond_2
    iget-object v5, v0, Lq9;->c:LN6;

    .line 148
    .line 149
    iget-object v7, v5, LN6;->c:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast v7, Ljava/util/ArrayList;

    .line 152
    .line 153
    monitor-enter v7

    .line 154
    :try_start_0
    iget-object v8, v5, LN6;->c:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v8, Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v8

    .line 162
    if-eqz v8, :cond_3

    .line 163
    .line 164
    monitor-exit v7

    .line 165
    move-object v8, v4

    .line 166
    goto :goto_2

    .line 167
    :catchall_0
    move-exception v0

    .line 168
    goto/16 :goto_7

    .line 169
    .line 170
    :cond_3
    new-instance v8, Ljava/util/ArrayList;

    .line 171
    .line 172
    iget-object v9, v5, LN6;->c:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v9, Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 181
    .line 182
    .line 183
    iget-object v5, v5, LN6;->c:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v5, Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    if-nez v9, :cond_9

    .line 196
    .line 197
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    :goto_2
    iget-object v5, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 199
    .line 200
    if-eqz v5, :cond_5

    .line 201
    .line 202
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    if-lez v5, :cond_5

    .line 207
    .line 208
    new-array v7, v5, [Lm3;

    .line 209
    .line 210
    const/4 v9, 0x0

    .line 211
    :goto_3
    if-ge v9, v5, :cond_6

    .line 212
    .line 213
    new-instance v10, Lm3;

    .line 214
    .line 215
    iget-object v11, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v11

    .line 221
    check-cast v11, Ll3;

    .line 222
    .line 223
    invoke-direct {v10, v11}, Lm3;-><init>(Ll3;)V

    .line 224
    .line 225
    .line 226
    aput-object v10, v7, v9

    .line 227
    .line 228
    const-string v10, "FragmentManager"

    .line 229
    .line 230
    invoke-static {v10, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 231
    .line 232
    .line 233
    move-result v10

    .line 234
    if-eqz v10, :cond_4

    .line 235
    .line 236
    const-string v10, "FragmentManager"

    .line 237
    .line 238
    new-instance v11, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string v12, "saveAllState: adding back stack #"

    .line 241
    .line 242
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v12, ": "

    .line 249
    .line 250
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    iget-object v12, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-virtual {v12, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v12

    .line 259
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v11

    .line 266
    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    :cond_4
    add-int/lit8 v9, v9, 0x1

    .line 270
    .line 271
    goto :goto_3

    .line 272
    :cond_5
    move-object v7, v4

    .line 273
    :cond_6
    new-instance v5, Ls9;

    .line 274
    .line 275
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 276
    .line 277
    .line 278
    iput-object v4, v5, Ls9;->e:Ljava/lang/String;

    .line 279
    .line 280
    new-instance v4, Ljava/util/ArrayList;

    .line 281
    .line 282
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object v4, v5, Ls9;->f:Ljava/util/ArrayList;

    .line 286
    .line 287
    new-instance v6, Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 290
    .line 291
    .line 292
    iput-object v6, v5, Ls9;->g:Ljava/util/ArrayList;

    .line 293
    .line 294
    iput-object v3, v5, Ls9;->a:Ljava/util/ArrayList;

    .line 295
    .line 296
    iput-object v8, v5, Ls9;->b:Ljava/util/ArrayList;

    .line 297
    .line 298
    iput-object v7, v5, Ls9;->c:[Lm3;

    .line 299
    .line 300
    iget-object v3, v0, Lq9;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 301
    .line 302
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    iput v3, v5, Ls9;->d:I

    .line 307
    .line 308
    iget-object v3, v0, Lq9;->i:Ljava/util/Map;

    .line 309
    .line 310
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 311
    .line 312
    .line 313
    move-result-object v3

    .line 314
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 315
    .line 316
    .line 317
    iget-object v3, v0, Lq9;->i:Ljava/util/Map;

    .line 318
    .line 319
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 324
    .line 325
    .line 326
    new-instance v3, Ljava/util/ArrayList;

    .line 327
    .line 328
    iget-object v4, v0, Lq9;->x:Ljava/util/ArrayDeque;

    .line 329
    .line 330
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 331
    .line 332
    .line 333
    iput-object v3, v5, Ls9;->h:Ljava/util/ArrayList;

    .line 334
    .line 335
    const-string v3, "state"

    .line 336
    .line 337
    invoke-virtual {v1, v3, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 338
    .line 339
    .line 340
    iget-object v3, v0, Lq9;->j:Ljava/util/Map;

    .line 341
    .line 342
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 343
    .line 344
    .line 345
    move-result-object v3

    .line 346
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 347
    .line 348
    .line 349
    move-result-object v3

    .line 350
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    if-eqz v4, :cond_7

    .line 355
    .line 356
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    check-cast v4, Ljava/lang/String;

    .line 361
    .line 362
    new-instance v5, Ljava/lang/StringBuilder;

    .line 363
    .line 364
    const-string v6, "result_"

    .line 365
    .line 366
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v5

    .line 376
    iget-object v6, v0, Lq9;->j:Ljava/util/Map;

    .line 377
    .line 378
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    check-cast v4, Landroid/os/Bundle;

    .line 383
    .line 384
    invoke-virtual {v1, v5, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 385
    .line 386
    .line 387
    goto :goto_4

    .line 388
    :cond_7
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 397
    .line 398
    .line 399
    move-result v3

    .line 400
    if-eqz v3, :cond_8

    .line 401
    .line 402
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object v3

    .line 406
    check-cast v3, Ljava/lang/String;

    .line 407
    .line 408
    new-instance v4, Ljava/lang/StringBuilder;

    .line 409
    .line 410
    const-string v5, "fragment_"

    .line 411
    .line 412
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v4

    .line 422
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    check-cast v3, Landroid/os/Bundle;

    .line 427
    .line 428
    invoke-virtual {v1, v4, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 429
    .line 430
    .line 431
    goto :goto_5

    .line 432
    :cond_8
    :goto_6
    return-object v1

    .line 433
    :cond_9
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    .line 438
    .line 439
    .line 440
    throw v4

    .line 441
    :goto_7
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 442
    throw v0

    .line 443
    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    check-cast v0, Lqh;

    .line 448
    .line 449
    invoke-virtual {v0}, Lqh;->a()V

    .line 450
    .line 451
    .line 452
    throw v4

    .line 453
    :pswitch_1
    iget-object v0, p0, Ld9;->b:Ljava/lang/Object;

    .line 454
    .line 455
    check-cast v0, LX4;

    .line 456
    .line 457
    check-cast v0, Lh9;

    .line 458
    .line 459
    invoke-static {v0}, LX4;->c(Lh9;)Landroid/os/Bundle;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    return-object v0

    .line 464
    :pswitch_2
    iget-object v0, p0, Ld9;->b:Ljava/lang/Object;

    .line 465
    .line 466
    check-cast v0, Lh9;

    .line 467
    .line 468
    invoke-virtual {v0}, Lh9;->markFragmentsCreated()V

    .line 469
    .line 470
    .line 471
    iget-object v0, v0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 472
    .line 473
    sget-object v1, LRc;->ON_STOP:LRc;

    .line 474
    .line 475
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 476
    .line 477
    .line 478
    new-instance v0, Landroid/os/Bundle;

    .line 479
    .line 480
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 481
    .line 482
    .line 483
    return-object v0

    .line 484
    nop

    .line 485
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
