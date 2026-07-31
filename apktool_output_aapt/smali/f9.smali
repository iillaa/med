.class public final synthetic Lf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWe;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:LX4;


# direct methods
.method public synthetic constructor <init>(Lh9;I)V
    .locals 0

    .line 1
    iput p2, p0, Lf9;->a:I

    iput-object p1, p0, Lf9;->b:LX4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lf9;->a:I

    .line 4
    .line 5
    packed-switch v1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lf9;->b:LX4;

    .line 9
    .line 10
    move-object/from16 v2, p1

    .line 11
    .line 12
    invoke-static {v1, v2}, LX4;->a(LX4;Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    iget-object v1, v0, Lf9;->b:LX4;

    .line 17
    .line 18
    check-cast v1, Lh9;

    .line 19
    .line 20
    iget-object v1, v1, Lh9;->mFragments:Lj9;

    .line 21
    .line 22
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 23
    .line 24
    iget-object v2, v1, Lg9;->e:Lr9;

    .line 25
    .line 26
    iget-object v3, v2, Lq9;->r:Lg9;

    .line 27
    .line 28
    if-nez v3, :cond_1c

    .line 29
    .line 30
    iput-object v1, v2, Lq9;->r:Lg9;

    .line 31
    .line 32
    iput-object v1, v2, Lq9;->s:Lg9;

    .line 33
    .line 34
    iget-object v3, v2, Lq9;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 35
    .line 36
    invoke-virtual {v3, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v3, v1, Lg9;->f:Lh9;

    .line 40
    .line 41
    invoke-virtual {v3}, LX4;->getOnBackPressedDispatcher()Landroidx/activity/a;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iput-object v4, v2, Lq9;->f:Landroidx/activity/a;

    .line 46
    .line 47
    iget-object v5, v2, Lq9;->g:LV2;

    .line 48
    .line 49
    invoke-virtual {v4, v1, v5}, Landroidx/activity/a;->a(LYc;LNe;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, LX4;->getViewModelStore()LSj;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v3, LN2;

    .line 57
    .line 58
    sget-object v4, Lu9;->h:Lt9;

    .line 59
    .line 60
    invoke-direct {v3, v1, v4}, LN2;-><init>(LSj;LRj;)V

    .line 61
    .line 62
    .line 63
    const-class v1, Lu9;

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    if-eqz v4, :cond_1b

    .line 70
    .line 71
    const-string v5, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 72
    .line 73
    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v3, v4, v1}, LN2;->h(Ljava/lang/String;Ljava/lang/Class;)LOj;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lu9;

    .line 82
    .line 83
    iput-object v1, v2, Lq9;->E:Lu9;

    .line 84
    .line 85
    iget-object v3, v2, Lq9;->c:LN6;

    .line 86
    .line 87
    iput-object v1, v3, LN6;->f:Ljava/lang/Object;

    .line 88
    .line 89
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 90
    .line 91
    instance-of v4, v1, LIg;

    .line 92
    .line 93
    if-eqz v4, :cond_14

    .line 94
    .line 95
    iget-object v1, v1, Lg9;->f:Lh9;

    .line 96
    .line 97
    invoke-virtual {v1}, LX4;->getSavedStateRegistry()LGg;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    new-instance v4, Ld9;

    .line 102
    .line 103
    const/4 v5, 0x2

    .line 104
    invoke-direct {v4, v5, v2}, Ld9;-><init>(ILjava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    const-string v5, "android:support:fragments"

    .line 108
    .line 109
    invoke-virtual {v1, v5, v4}, LGg;->c(Ljava/lang/String;LFg;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v5}, LGg;->a(Ljava/lang/String;)Landroid/os/Bundle;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    if-eqz v1, :cond_14

    .line 117
    .line 118
    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-eqz v5, :cond_1

    .line 131
    .line 132
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    check-cast v5, Ljava/lang/String;

    .line 137
    .line 138
    const-string v6, "result_"

    .line 139
    .line 140
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    if-eqz v6, :cond_0

    .line 145
    .line 146
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    if-eqz v6, :cond_0

    .line 151
    .line 152
    iget-object v7, v2, Lq9;->r:Lg9;

    .line 153
    .line 154
    iget-object v7, v7, Lg9;->c:Landroid/content/Context;

    .line 155
    .line 156
    invoke-virtual {v7}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    invoke-virtual {v6, v7}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 161
    .line 162
    .line 163
    const/4 v7, 0x7

    .line 164
    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    iget-object v7, v2, Lq9;->j:Ljava/util/Map;

    .line 169
    .line 170
    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_1
    new-instance v4, Ljava/util/HashMap;

    .line 175
    .line 176
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    if-eqz v6, :cond_3

    .line 192
    .line 193
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    check-cast v6, Ljava/lang/String;

    .line 198
    .line 199
    const-string v7, "fragment_"

    .line 200
    .line 201
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 202
    .line 203
    .line 204
    move-result v7

    .line 205
    if-eqz v7, :cond_2

    .line 206
    .line 207
    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    if-eqz v7, :cond_2

    .line 212
    .line 213
    iget-object v8, v2, Lq9;->r:Lg9;

    .line 214
    .line 215
    iget-object v8, v8, Lg9;->c:Landroid/content/Context;

    .line 216
    .line 217
    invoke-virtual {v8}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    invoke-virtual {v7, v8}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 222
    .line 223
    .line 224
    const/16 v8, 0x9

    .line 225
    .line 226
    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    goto :goto_1

    .line 234
    :cond_3
    iget-object v5, v3, LN6;->e:Ljava/lang/Object;

    .line 235
    .line 236
    check-cast v5, Ljava/util/HashMap;

    .line 237
    .line 238
    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 242
    .line 243
    .line 244
    const-string v4, "state"

    .line 245
    .line 246
    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    check-cast v1, Ls9;

    .line 251
    .line 252
    if-nez v1, :cond_4

    .line 253
    .line 254
    goto/16 :goto_b

    .line 255
    .line 256
    :cond_4
    iget-object v6, v3, LN6;->d:Ljava/lang/Object;

    .line 257
    .line 258
    check-cast v6, Ljava/util/HashMap;

    .line 259
    .line 260
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 261
    .line 262
    .line 263
    iget-object v7, v1, Ls9;->a:Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 266
    .line 267
    .line 268
    move-result-object v7

    .line 269
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 270
    .line 271
    .line 272
    move-result v8

    .line 273
    const/4 v9, 0x0

    .line 274
    if-eqz v8, :cond_6

    .line 275
    .line 276
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v8

    .line 280
    check-cast v8, Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v5, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v8

    .line 286
    check-cast v8, Landroid/os/Bundle;

    .line 287
    .line 288
    if-nez v8, :cond_5

    .line 289
    .line 290
    goto :goto_2

    .line 291
    :cond_5
    invoke-virtual {v8, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    check-cast v1, Lv9;

    .line 296
    .line 297
    iget-object v3, v2, Lq9;->E:Lu9;

    .line 298
    .line 299
    iget-object v1, v1, Lv9;->b:Ljava/lang/String;

    .line 300
    .line 301
    iget-object v3, v3, Lu9;->d:Ljava/util/HashMap;

    .line 302
    .line 303
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 311
    .line 312
    iget-object v1, v1, Lg9;->c:Landroid/content/Context;

    .line 313
    .line 314
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 315
    .line 316
    .line 317
    invoke-virtual {v8, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    check-cast v1, Lv9;

    .line 322
    .line 323
    iget-object v1, v1, Lv9;->a:Ljava/lang/String;

    .line 324
    .line 325
    iget-object v2, v2, Lq9;->t:Lo9;

    .line 326
    .line 327
    invoke-virtual {v2, v1}, Lo9;->a(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    throw v9

    .line 331
    :cond_6
    iget-object v4, v2, Lq9;->E:Lu9;

    .line 332
    .line 333
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 334
    .line 335
    .line 336
    new-instance v5, Ljava/util/ArrayList;

    .line 337
    .line 338
    iget-object v4, v4, Lu9;->d:Ljava/util/HashMap;

    .line 339
    .line 340
    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    if-nez v5, :cond_13

    .line 356
    .line 357
    iget-object v4, v1, Ls9;->b:Ljava/util/ArrayList;

    .line 358
    .line 359
    iget-object v5, v3, LN6;->c:Ljava/lang/Object;

    .line 360
    .line 361
    check-cast v5, Ljava/util/ArrayList;

    .line 362
    .line 363
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 364
    .line 365
    .line 366
    if-eqz v4, :cond_8

    .line 367
    .line 368
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 373
    .line 374
    .line 375
    move-result v5

    .line 376
    if-nez v5, :cond_7

    .line 377
    .line 378
    goto :goto_3

    .line 379
    :cond_7
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    check-cast v1, Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-static {v2}, Loh;->c(Ljava/lang/Object;)V

    .line 390
    .line 391
    .line 392
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 393
    .line 394
    const-string v3, "No instantiated fragment for ("

    .line 395
    .line 396
    const-string v4, ")"

    .line 397
    .line 398
    invoke-static {v3, v1, v4}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    throw v2

    .line 406
    :cond_8
    :goto_3
    iget-object v4, v1, Ls9;->c:[Lm3;

    .line 407
    .line 408
    if-eqz v4, :cond_10

    .line 409
    .line 410
    new-instance v4, Ljava/util/ArrayList;

    .line 411
    .line 412
    iget-object v6, v1, Ls9;->c:[Lm3;

    .line 413
    .line 414
    array-length v6, v6

    .line 415
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 416
    .line 417
    .line 418
    iput-object v4, v2, Lq9;->d:Ljava/util/ArrayList;

    .line 419
    .line 420
    const/4 v4, 0x0

    .line 421
    :goto_4
    iget-object v6, v1, Ls9;->c:[Lm3;

    .line 422
    .line 423
    array-length v7, v6

    .line 424
    if-ge v4, v7, :cond_f

    .line 425
    .line 426
    aget-object v6, v6, v4

    .line 427
    .line 428
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 429
    .line 430
    .line 431
    new-instance v7, Ll3;

    .line 432
    .line 433
    invoke-direct {v7, v2}, Ll3;-><init>(Lr9;)V

    .line 434
    .line 435
    .line 436
    const/4 v8, 0x0

    .line 437
    const/4 v9, 0x0

    .line 438
    :goto_5
    iget-object v10, v6, Lm3;->a:[I

    .line 439
    .line 440
    array-length v11, v10

    .line 441
    const/4 v12, 0x2

    .line 442
    const/4 v13, 0x1

    .line 443
    const-string v14, "FragmentManager"

    .line 444
    .line 445
    if-ge v8, v11, :cond_b

    .line 446
    .line 447
    new-instance v11, Lw9;

    .line 448
    .line 449
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 450
    .line 451
    .line 452
    add-int/lit8 v15, v8, 0x1

    .line 453
    .line 454
    aget v5, v10, v8

    .line 455
    .line 456
    iput v5, v11, Lw9;->a:I

    .line 457
    .line 458
    invoke-static {v14, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 459
    .line 460
    .line 461
    move-result v5

    .line 462
    if-eqz v5, :cond_9

    .line 463
    .line 464
    new-instance v5, Ljava/lang/StringBuilder;

    .line 465
    .line 466
    const-string v12, "Instantiate "

    .line 467
    .line 468
    invoke-direct {v5, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    const-string v12, " op #"

    .line 475
    .line 476
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    const-string v12, " base fragment #"

    .line 483
    .line 484
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    aget v12, v10, v15

    .line 488
    .line 489
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v5

    .line 496
    invoke-static {v14, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    .line 498
    .line 499
    :cond_9
    invoke-static {}, LSc;->values()[LSc;

    .line 500
    .line 501
    .line 502
    move-result-object v5

    .line 503
    iget-object v12, v6, Lm3;->c:[I

    .line 504
    .line 505
    aget v12, v12, v9

    .line 506
    .line 507
    aget-object v5, v5, v12

    .line 508
    .line 509
    iput-object v5, v11, Lw9;->g:LSc;

    .line 510
    .line 511
    invoke-static {}, LSc;->values()[LSc;

    .line 512
    .line 513
    .line 514
    move-result-object v5

    .line 515
    iget-object v12, v6, Lm3;->d:[I

    .line 516
    .line 517
    aget v12, v12, v9

    .line 518
    .line 519
    aget-object v5, v5, v12

    .line 520
    .line 521
    iput-object v5, v11, Lw9;->h:LSc;

    .line 522
    .line 523
    add-int/lit8 v5, v8, 0x2

    .line 524
    .line 525
    aget v12, v10, v15

    .line 526
    .line 527
    if-eqz v12, :cond_a

    .line 528
    .line 529
    goto :goto_6

    .line 530
    :cond_a
    const/4 v13, 0x0

    .line 531
    :goto_6
    iput-boolean v13, v11, Lw9;->b:Z

    .line 532
    .line 533
    add-int/lit8 v12, v8, 0x3

    .line 534
    .line 535
    aget v5, v10, v5

    .line 536
    .line 537
    iput v5, v11, Lw9;->c:I

    .line 538
    .line 539
    add-int/lit8 v13, v8, 0x4

    .line 540
    .line 541
    aget v12, v10, v12

    .line 542
    .line 543
    iput v12, v11, Lw9;->d:I

    .line 544
    .line 545
    add-int/lit8 v14, v8, 0x5

    .line 546
    .line 547
    aget v13, v10, v13

    .line 548
    .line 549
    iput v13, v11, Lw9;->e:I

    .line 550
    .line 551
    add-int/lit8 v8, v8, 0x6

    .line 552
    .line 553
    aget v10, v10, v14

    .line 554
    .line 555
    iput v10, v11, Lw9;->f:I

    .line 556
    .line 557
    iput v5, v7, Ll3;->b:I

    .line 558
    .line 559
    iput v12, v7, Ll3;->c:I

    .line 560
    .line 561
    iput v13, v7, Ll3;->d:I

    .line 562
    .line 563
    iput v10, v7, Ll3;->e:I

    .line 564
    .line 565
    iget-object v5, v7, Ll3;->a:Ljava/util/ArrayList;

    .line 566
    .line 567
    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 568
    .line 569
    .line 570
    iget v5, v7, Ll3;->b:I

    .line 571
    .line 572
    iput v5, v11, Lw9;->c:I

    .line 573
    .line 574
    iget v5, v7, Ll3;->c:I

    .line 575
    .line 576
    iput v5, v11, Lw9;->d:I

    .line 577
    .line 578
    iget v5, v7, Ll3;->d:I

    .line 579
    .line 580
    iput v5, v11, Lw9;->e:I

    .line 581
    .line 582
    iget v5, v7, Ll3;->e:I

    .line 583
    .line 584
    iput v5, v11, Lw9;->f:I

    .line 585
    .line 586
    add-int/lit8 v9, v9, 0x1

    .line 587
    .line 588
    goto/16 :goto_5

    .line 589
    .line 590
    :cond_b
    iget v5, v6, Lm3;->e:I

    .line 591
    .line 592
    iput v5, v7, Ll3;->f:I

    .line 593
    .line 594
    iget-object v5, v6, Lm3;->f:Ljava/lang/String;

    .line 595
    .line 596
    iput-object v5, v7, Ll3;->h:Ljava/lang/String;

    .line 597
    .line 598
    iput-boolean v13, v7, Ll3;->g:Z

    .line 599
    .line 600
    iget v5, v6, Lm3;->h:I

    .line 601
    .line 602
    iput v5, v7, Ll3;->i:I

    .line 603
    .line 604
    iget-object v5, v6, Lm3;->i:Ljava/lang/CharSequence;

    .line 605
    .line 606
    iput-object v5, v7, Ll3;->j:Ljava/lang/CharSequence;

    .line 607
    .line 608
    iget v5, v6, Lm3;->j:I

    .line 609
    .line 610
    iput v5, v7, Ll3;->k:I

    .line 611
    .line 612
    iget-object v5, v6, Lm3;->k:Ljava/lang/CharSequence;

    .line 613
    .line 614
    iput-object v5, v7, Ll3;->l:Ljava/lang/CharSequence;

    .line 615
    .line 616
    iget-object v5, v6, Lm3;->l:Ljava/util/ArrayList;

    .line 617
    .line 618
    iput-object v5, v7, Ll3;->m:Ljava/util/ArrayList;

    .line 619
    .line 620
    iget-object v5, v6, Lm3;->m:Ljava/util/ArrayList;

    .line 621
    .line 622
    iput-object v5, v7, Ll3;->n:Ljava/util/ArrayList;

    .line 623
    .line 624
    iget-boolean v5, v6, Lm3;->n:Z

    .line 625
    .line 626
    iput-boolean v5, v7, Ll3;->o:Z

    .line 627
    .line 628
    iget v5, v6, Lm3;->g:I

    .line 629
    .line 630
    iput v5, v7, Ll3;->q:I

    .line 631
    .line 632
    const/4 v5, 0x0

    .line 633
    :goto_7
    iget-object v8, v6, Lm3;->b:Ljava/util/ArrayList;

    .line 634
    .line 635
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 636
    .line 637
    .line 638
    move-result v9

    .line 639
    if-ge v5, v9, :cond_d

    .line 640
    .line 641
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 642
    .line 643
    .line 644
    move-result-object v8

    .line 645
    check-cast v8, Ljava/lang/String;

    .line 646
    .line 647
    if-eqz v8, :cond_c

    .line 648
    .line 649
    iget-object v9, v7, Ll3;->a:Ljava/util/ArrayList;

    .line 650
    .line 651
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v9

    .line 655
    check-cast v9, Lw9;

    .line 656
    .line 657
    iget-object v10, v3, LN6;->d:Ljava/lang/Object;

    .line 658
    .line 659
    check-cast v10, Ljava/util/HashMap;

    .line 660
    .line 661
    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v8

    .line 665
    invoke-static {v8}, Loh;->c(Ljava/lang/Object;)V

    .line 666
    .line 667
    .line 668
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 669
    .line 670
    .line 671
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 672
    .line 673
    goto :goto_7

    .line 674
    :cond_d
    invoke-virtual {v7, v13}, Ll3;->a(I)V

    .line 675
    .line 676
    .line 677
    invoke-static {v14, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 678
    .line 679
    .line 680
    move-result v5

    .line 681
    if-eqz v5, :cond_e

    .line 682
    .line 683
    new-instance v5, Ljava/lang/StringBuilder;

    .line 684
    .line 685
    const-string v6, "restoreAllState: back stack #"

    .line 686
    .line 687
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 688
    .line 689
    .line 690
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    const-string v6, " (index "

    .line 694
    .line 695
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    iget v6, v7, Ll3;->q:I

    .line 699
    .line 700
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 701
    .line 702
    .line 703
    const-string v6, "): "

    .line 704
    .line 705
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 709
    .line 710
    .line 711
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 712
    .line 713
    .line 714
    move-result-object v5

    .line 715
    invoke-static {v14, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 716
    .line 717
    .line 718
    new-instance v5, LEd;

    .line 719
    .line 720
    invoke-direct {v5}, LEd;-><init>()V

    .line 721
    .line 722
    .line 723
    new-instance v6, Ljava/io/PrintWriter;

    .line 724
    .line 725
    invoke-direct {v6, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 726
    .line 727
    .line 728
    const-string v5, "  "

    .line 729
    .line 730
    const/4 v8, 0x0

    .line 731
    invoke-virtual {v7, v5, v6, v8}, Ll3;->b(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 732
    .line 733
    .line 734
    invoke-virtual {v6}, Ljava/io/PrintWriter;->close()V

    .line 735
    .line 736
    .line 737
    goto :goto_8

    .line 738
    :cond_e
    const/4 v8, 0x0

    .line 739
    :goto_8
    iget-object v5, v2, Lq9;->d:Ljava/util/ArrayList;

    .line 740
    .line 741
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 742
    .line 743
    .line 744
    add-int/lit8 v4, v4, 0x1

    .line 745
    .line 746
    goto/16 :goto_4

    .line 747
    .line 748
    :cond_f
    const/4 v8, 0x0

    .line 749
    goto :goto_9

    .line 750
    :cond_10
    const/4 v8, 0x0

    .line 751
    iput-object v9, v2, Lq9;->d:Ljava/util/ArrayList;

    .line 752
    .line 753
    :goto_9
    iget-object v4, v2, Lq9;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 754
    .line 755
    iget v5, v1, Ls9;->d:I

    .line 756
    .line 757
    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 758
    .line 759
    .line 760
    iget-object v4, v1, Ls9;->e:Ljava/lang/String;

    .line 761
    .line 762
    if-eqz v4, :cond_11

    .line 763
    .line 764
    iget-object v3, v3, LN6;->d:Ljava/lang/Object;

    .line 765
    .line 766
    check-cast v3, Ljava/util/HashMap;

    .line 767
    .line 768
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    move-result-object v3

    .line 772
    invoke-static {v3}, Loh;->c(Ljava/lang/Object;)V

    .line 773
    .line 774
    .line 775
    :cond_11
    iget-object v3, v1, Ls9;->f:Ljava/util/ArrayList;

    .line 776
    .line 777
    if-eqz v3, :cond_12

    .line 778
    .line 779
    move v5, v8

    .line 780
    :goto_a
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 781
    .line 782
    .line 783
    move-result v4

    .line 784
    if-ge v5, v4, :cond_12

    .line 785
    .line 786
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 787
    .line 788
    .line 789
    move-result-object v4

    .line 790
    check-cast v4, Ljava/lang/String;

    .line 791
    .line 792
    iget-object v6, v1, Ls9;->g:Ljava/util/ArrayList;

    .line 793
    .line 794
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 795
    .line 796
    .line 797
    move-result-object v6

    .line 798
    check-cast v6, Ln3;

    .line 799
    .line 800
    iget-object v7, v2, Lq9;->i:Ljava/util/Map;

    .line 801
    .line 802
    invoke-interface {v7, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    add-int/lit8 v5, v5, 0x1

    .line 806
    .line 807
    goto :goto_a

    .line 808
    :cond_12
    new-instance v3, Ljava/util/ArrayDeque;

    .line 809
    .line 810
    iget-object v1, v1, Ls9;->h:Ljava/util/ArrayList;

    .line 811
    .line 812
    invoke-direct {v3, v1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 813
    .line 814
    .line 815
    iput-object v3, v2, Lq9;->x:Ljava/util/ArrayDeque;

    .line 816
    .line 817
    goto :goto_b

    .line 818
    :cond_13
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 819
    .line 820
    .line 821
    move-result-object v1

    .line 822
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 823
    .line 824
    .line 825
    throw v9

    .line 826
    :cond_14
    :goto_b
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 827
    .line 828
    instance-of v3, v1, LG0;

    .line 829
    .line 830
    if-eqz v3, :cond_15

    .line 831
    .line 832
    iget-object v1, v1, Lg9;->f:Lh9;

    .line 833
    .line 834
    invoke-virtual {v1}, LX4;->getActivityResultRegistry()LF0;

    .line 835
    .line 836
    .line 837
    move-result-object v1

    .line 838
    new-instance v3, Ly0;

    .line 839
    .line 840
    const/4 v4, 0x1

    .line 841
    invoke-direct {v3, v4}, Ly0;-><init>(I)V

    .line 842
    .line 843
    .line 844
    new-instance v4, Lm9;

    .line 845
    .line 846
    const/4 v5, 0x1

    .line 847
    invoke-direct {v4, v2, v5}, Lm9;-><init>(Lr9;I)V

    .line 848
    .line 849
    .line 850
    const-string v5, "FragmentManager:StartActivityForResult"

    .line 851
    .line 852
    invoke-virtual {v1, v5, v3, v4}, LF0;->c(Ljava/lang/String;Lx0;Lw0;)LE0;

    .line 853
    .line 854
    .line 855
    move-result-object v3

    .line 856
    iput-object v3, v2, Lq9;->u:LE0;

    .line 857
    .line 858
    new-instance v3, Ly0;

    .line 859
    .line 860
    const/4 v4, 0x2

    .line 861
    invoke-direct {v3, v4}, Ly0;-><init>(I)V

    .line 862
    .line 863
    .line 864
    new-instance v4, Lm9;

    .line 865
    .line 866
    const/4 v5, 0x2

    .line 867
    invoke-direct {v4, v2, v5}, Lm9;-><init>(Lr9;I)V

    .line 868
    .line 869
    .line 870
    const-string v5, "FragmentManager:StartIntentSenderForResult"

    .line 871
    .line 872
    invoke-virtual {v1, v5, v3, v4}, LF0;->c(Ljava/lang/String;Lx0;Lw0;)LE0;

    .line 873
    .line 874
    .line 875
    move-result-object v3

    .line 876
    iput-object v3, v2, Lq9;->v:LE0;

    .line 877
    .line 878
    new-instance v3, Ly0;

    .line 879
    .line 880
    const/4 v4, 0x0

    .line 881
    invoke-direct {v3, v4}, Ly0;-><init>(I)V

    .line 882
    .line 883
    .line 884
    new-instance v4, Lm9;

    .line 885
    .line 886
    const/4 v5, 0x0

    .line 887
    invoke-direct {v4, v2, v5}, Lm9;-><init>(Lr9;I)V

    .line 888
    .line 889
    .line 890
    const-string v5, "FragmentManager:RequestPermissions"

    .line 891
    .line 892
    invoke-virtual {v1, v5, v3, v4}, LF0;->c(Ljava/lang/String;Lx0;Lw0;)LE0;

    .line 893
    .line 894
    .line 895
    move-result-object v1

    .line 896
    iput-object v1, v2, Lq9;->w:LE0;

    .line 897
    .line 898
    :cond_15
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 899
    .line 900
    instance-of v3, v1, LVe;

    .line 901
    .line 902
    if-eqz v3, :cond_16

    .line 903
    .line 904
    iget-object v3, v2, Lq9;->l:Ll9;

    .line 905
    .line 906
    invoke-virtual {v1, v3}, Lg9;->b(Lf5;)V

    .line 907
    .line 908
    .line 909
    :cond_16
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 910
    .line 911
    instance-of v3, v1, Lcf;

    .line 912
    .line 913
    if-eqz v3, :cond_17

    .line 914
    .line 915
    iget-object v3, v2, Lq9;->m:Ll9;

    .line 916
    .line 917
    invoke-virtual {v1, v3}, Lg9;->e(Lf5;)V

    .line 918
    .line 919
    .line 920
    :cond_17
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 921
    .line 922
    instance-of v3, v1, LZe;

    .line 923
    .line 924
    if-eqz v3, :cond_18

    .line 925
    .line 926
    iget-object v3, v2, Lq9;->n:Ll9;

    .line 927
    .line 928
    invoke-virtual {v1, v3}, Lg9;->c(Lf5;)V

    .line 929
    .line 930
    .line 931
    :cond_18
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 932
    .line 933
    instance-of v3, v1, Laf;

    .line 934
    .line 935
    if-eqz v3, :cond_19

    .line 936
    .line 937
    iget-object v3, v2, Lq9;->o:Ll9;

    .line 938
    .line 939
    invoke-virtual {v1, v3}, Lg9;->d(Lf5;)V

    .line 940
    .line 941
    .line 942
    :cond_19
    iget-object v1, v2, Lq9;->r:Lg9;

    .line 943
    .line 944
    instance-of v3, v1, LOd;

    .line 945
    .line 946
    if-eqz v3, :cond_1a

    .line 947
    .line 948
    iget-object v2, v2, Lq9;->p:Ln9;

    .line 949
    .line 950
    invoke-virtual {v1, v2}, Lg9;->a(Lje;)V

    .line 951
    .line 952
    .line 953
    :cond_1a
    return-void

    .line 954
    :cond_1b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 955
    .line 956
    const-string v2, "Local and anonymous classes can not be ViewModels"

    .line 957
    .line 958
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 959
    .line 960
    .line 961
    throw v1

    .line 962
    :cond_1c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 963
    .line 964
    const-string v2, "Already attached"

    .line 965
    .line 966
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 967
    .line 968
    .line 969
    throw v1

    .line 970
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
