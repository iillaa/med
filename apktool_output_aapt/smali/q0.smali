.class public final synthetic Lq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lq0;->c:I

    iput-object p2, p0, Lq0;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    iget v4, p0, Lq0;->c:I

    .line 6
    .line 7
    packed-switch v4, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lq0;->d:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "input_method"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 25
    .line 26
    invoke-virtual {v1, v0, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_0
    iget-object v0, p0, Lq0;->d:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ls2;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_1
    iget-object v0, p0, Lq0;->d:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, Lyf;

    .line 41
    .line 42
    const-string v1, "this$0"

    .line 43
    .line 44
    invoke-static {v1, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget v1, v0, Lyf;->d:I

    .line 48
    .line 49
    iget-object v3, v0, Lyf;->h:Landroidx/lifecycle/a;

    .line 50
    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    iput-boolean v2, v0, Lyf;->e:Z

    .line 54
    .line 55
    sget-object v1, LRc;->ON_PAUSE:LRc;

    .line 56
    .line 57
    invoke-virtual {v3, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget v1, v0, Lyf;->c:I

    .line 61
    .line 62
    if-nez v1, :cond_1

    .line 63
    .line 64
    iget-boolean v1, v0, Lyf;->e:Z

    .line 65
    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    sget-object v1, LRc;->ON_STOP:LRc;

    .line 69
    .line 70
    invoke-virtual {v3, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 71
    .line 72
    .line 73
    iput-boolean v2, v0, Lyf;->f:Z

    .line 74
    .line 75
    :cond_1
    return-void

    .line 76
    :pswitch_2
    iget-object v0, p0, Lq0;->d:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->e(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :pswitch_3
    iget-object v1, p0, Lq0;->d:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v1, LP8;

    .line 87
    .line 88
    const-string v4, "fetchFonts result is not OK. ("

    .line 89
    .line 90
    iget-object v5, v1, LP8;->f:Ljava/lang/Object;

    .line 91
    .line 92
    monitor-enter v5

    .line 93
    :try_start_0
    iget-object v6, v1, LP8;->j:Lu6;

    .line 94
    .line 95
    if-nez v6, :cond_2

    .line 96
    .line 97
    monitor-exit v5

    .line 98
    goto/16 :goto_6

    .line 99
    .line 100
    :catchall_0
    move-exception v0

    .line 101
    goto/16 :goto_8

    .line 102
    .line 103
    :cond_2
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    :try_start_1
    invoke-virtual {v1}, LP8;->d()LZ8;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    iget v6, v5, LZ8;->e:I

    .line 109
    .line 110
    if-ne v6, v0, :cond_3

    .line 111
    .line 112
    iget-object v0, v1, LP8;->f:Ljava/lang/Object;

    .line 113
    .line 114
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 115
    :try_start_2
    monitor-exit v0

    .line 116
    goto :goto_0

    .line 117
    :catchall_1
    move-exception v2

    .line 118
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 119
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 120
    :catchall_2
    move-exception v0

    .line 121
    goto/16 :goto_4

    .line 122
    .line 123
    :cond_3
    :goto_0
    if-nez v6, :cond_6

    .line 124
    .line 125
    :try_start_4
    const-string v0, "EmojiCompat.FontRequestEmojiCompatConfig.buildTypeface"

    .line 126
    .line 127
    sget v4, LNi;->a:I

    .line 128
    .line 129
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, v1, LP8;->e:Lt5;

    .line 133
    .line 134
    iget-object v4, v1, LP8;->c:Landroid/content/Context;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    new-array v0, v2, [LZ8;

    .line 140
    .line 141
    aput-object v5, v0, v3

    .line 142
    .line 143
    sget-object v2, LTi;->a:LSi;

    .line 144
    .line 145
    const-string v2, "TypefaceCompat.createFromFontInfo"

    .line 146
    .line 147
    invoke-static {v2}, Lu6;->e(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 148
    .line 149
    .line 150
    :try_start_5
    sget-object v2, LTi;->a:LSi;

    .line 151
    .line 152
    invoke-virtual {v2, v4, v0, v3}, LSi;->g(Landroid/content/Context;[LZ8;I)Landroid/graphics/Typeface;

    .line 153
    .line 154
    .line 155
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    .line 156
    :try_start_6
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 157
    .line 158
    .line 159
    iget-object v2, v1, LP8;->c:Landroid/content/Context;

    .line 160
    .line 161
    iget-object v3, v5, LZ8;->a:Landroid/net/Uri;

    .line 162
    .line 163
    invoke-static {v2, v3}, LMk;->A(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 167
    if-eqz v2, :cond_5

    .line 168
    .line 169
    if-eqz v0, :cond_5

    .line 170
    .line 171
    :try_start_7
    const-string v3, "EmojiCompat.MetadataRepo.create"

    .line 172
    .line 173
    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    new-instance v3, LN6;

    .line 177
    .line 178
    invoke-static {v2}, Llc;->D(Ljava/nio/MappedByteBuffer;)Lpe;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-direct {v3, v0, v2}, LN6;-><init>(Landroid/graphics/Typeface;Lpe;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 183
    .line 184
    .line 185
    :try_start_8
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 186
    .line 187
    .line 188
    :try_start_9
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 189
    .line 190
    .line 191
    iget-object v0, v1, LP8;->f:Ljava/lang/Object;

    .line 192
    .line 193
    monitor-enter v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 194
    :try_start_a
    iget-object v2, v1, LP8;->j:Lu6;

    .line 195
    .line 196
    if-eqz v2, :cond_4

    .line 197
    .line 198
    invoke-virtual {v2, v3}, Lu6;->v(LN6;)V

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :catchall_3
    move-exception v2

    .line 203
    goto :goto_2

    .line 204
    :cond_4
    :goto_1
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 205
    :try_start_b
    invoke-virtual {v1}, LP8;->a()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 206
    .line 207
    .line 208
    goto :goto_6

    .line 209
    :goto_2
    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 210
    :try_start_d
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 211
    :catchall_4
    move-exception v0

    .line 212
    :try_start_e
    sget v2, LNi;->a:I

    .line 213
    .line 214
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 215
    .line 216
    .line 217
    throw v0

    .line 218
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    .line 219
    .line 220
    const-string v2, "Unable to open file."

    .line 221
    .line 222
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw v0

    .line 226
    :catchall_5
    move-exception v0

    .line 227
    goto :goto_3

    .line 228
    :catchall_6
    move-exception v0

    .line 229
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 230
    .line 231
    .line 232
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 233
    :goto_3
    :try_start_f
    sget v2, LNi;->a:I

    .line 234
    .line 235
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 236
    .line 237
    .line 238
    throw v0

    .line 239
    :cond_6
    new-instance v0, Ljava/lang/RuntimeException;

    .line 240
    .line 241
    new-instance v2, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string v3, ")"

    .line 250
    .line 251
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 262
    :goto_4
    iget-object v2, v1, LP8;->f:Ljava/lang/Object;

    .line 263
    .line 264
    monitor-enter v2

    .line 265
    :try_start_10
    iget-object v3, v1, LP8;->j:Lu6;

    .line 266
    .line 267
    if-eqz v3, :cond_7

    .line 268
    .line 269
    invoke-virtual {v3, v0}, Lu6;->u(Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    goto :goto_5

    .line 273
    :catchall_7
    move-exception v0

    .line 274
    goto :goto_7

    .line 275
    :cond_7
    :goto_5
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 276
    invoke-virtual {v1}, LP8;->a()V

    .line 277
    .line 278
    .line 279
    :goto_6
    return-void

    .line 280
    :goto_7
    :try_start_11
    monitor-exit v2
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 281
    throw v0

    .line 282
    :goto_8
    :try_start_12
    monitor-exit v5
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 283
    throw v0

    .line 284
    :pswitch_4
    iget-object v0, p0, Lq0;->d:Ljava/lang/Object;

    .line 285
    .line 286
    check-cast v0, LN0;

    .line 287
    .line 288
    invoke-static {v0}, LN0;->a(LN0;)V

    .line 289
    .line 290
    .line 291
    return-void

    .line 292
    :pswitch_5
    const-string v0, "this$0"

    .line 293
    .line 294
    iget-object v2, p0, Lq0;->d:Ljava/lang/Object;

    .line 295
    .line 296
    check-cast v2, LS4;

    .line 297
    .line 298
    invoke-static {v0, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    iget-object v0, v2, LS4;->d:Ljava/lang/Runnable;

    .line 302
    .line 303
    if-eqz v0, :cond_8

    .line 304
    .line 305
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 306
    .line 307
    .line 308
    iput-object v1, v2, LS4;->d:Ljava/lang/Runnable;

    .line 309
    .line 310
    :cond_8
    return-void

    .line 311
    :pswitch_6
    iget-object v4, p0, Lq0;->d:Ljava/lang/Object;

    .line 312
    .line 313
    check-cast v4, Landroid/app/Activity;

    .line 314
    .line 315
    invoke-virtual {v4}, Landroid/app/Activity;->isFinishing()Z

    .line 316
    .line 317
    .line 318
    move-result v5

    .line 319
    if-nez v5, :cond_12

    .line 320
    .line 321
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 322
    .line 323
    const/16 v6, 0x1c

    .line 324
    .line 325
    if-lt v5, v6, :cond_9

    .line 326
    .line 327
    sget-object v0, Lt0;->a:Ljava/lang/Class;

    .line 328
    .line 329
    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V

    .line 330
    .line 331
    .line 332
    goto/16 :goto_f

    .line 333
    .line 334
    :cond_9
    sget-object v6, Lt0;->a:Ljava/lang/Class;

    .line 335
    .line 336
    const/16 v6, 0x1b

    .line 337
    .line 338
    const/16 v7, 0x1a

    .line 339
    .line 340
    if-eq v5, v7, :cond_b

    .line 341
    .line 342
    if-ne v5, v6, :cond_a

    .line 343
    .line 344
    goto :goto_9

    .line 345
    :cond_a
    move v8, v3

    .line 346
    goto :goto_a

    .line 347
    :cond_b
    :goto_9
    move v8, v2

    .line 348
    :goto_a
    sget-object v9, Lt0;->f:Ljava/lang/reflect/Method;

    .line 349
    .line 350
    if-eqz v8, :cond_c

    .line 351
    .line 352
    if-nez v9, :cond_c

    .line 353
    .line 354
    goto/16 :goto_e

    .line 355
    .line 356
    :cond_c
    sget-object v8, Lt0;->e:Ljava/lang/reflect/Method;

    .line 357
    .line 358
    if-nez v8, :cond_d

    .line 359
    .line 360
    sget-object v8, Lt0;->d:Ljava/lang/reflect/Method;

    .line 361
    .line 362
    if-nez v8, :cond_d

    .line 363
    .line 364
    goto :goto_e

    .line 365
    :cond_d
    :try_start_13
    sget-object v8, Lt0;->c:Ljava/lang/reflect/Field;

    .line 366
    .line 367
    invoke-virtual {v8, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object v8

    .line 371
    if-nez v8, :cond_e

    .line 372
    .line 373
    goto :goto_e

    .line 374
    :cond_e
    sget-object v10, Lt0;->b:Ljava/lang/reflect/Field;

    .line 375
    .line 376
    invoke-virtual {v10, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v10

    .line 380
    if-nez v10, :cond_f

    .line 381
    .line 382
    goto :goto_e

    .line 383
    :cond_f
    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 384
    .line 385
    .line 386
    move-result-object v11

    .line 387
    new-instance v12, Ls0;

    .line 388
    .line 389
    invoke-direct {v12, v4}, Ls0;-><init>(Landroid/app/Activity;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v11, v12}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 393
    .line 394
    .line 395
    sget-object v13, Lt0;->g:Landroid/os/Handler;

    .line 396
    .line 397
    :try_start_14
    new-instance v14, Lg0;

    .line 398
    .line 399
    invoke-direct {v14, v12, v8, v2, v3}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v13, v14}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    .line 403
    .line 404
    .line 405
    if-eq v5, v7, :cond_11

    .line 406
    .line 407
    if-ne v5, v6, :cond_10

    .line 408
    .line 409
    goto :goto_b

    .line 410
    :cond_10
    :try_start_15
    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V

    .line 411
    .line 412
    .line 413
    goto :goto_c

    .line 414
    :catchall_8
    move-exception v1

    .line 415
    goto :goto_d

    .line 416
    :cond_11
    :goto_b
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 417
    .line 418
    .line 419
    move-result-object v5

    .line 420
    const/16 v6, 0x9

    .line 421
    .line 422
    new-array v6, v6, [Ljava/lang/Object;

    .line 423
    .line 424
    aput-object v8, v6, v3

    .line 425
    .line 426
    aput-object v1, v6, v2

    .line 427
    .line 428
    aput-object v1, v6, v0

    .line 429
    .line 430
    const/4 v2, 0x3

    .line 431
    aput-object v5, v6, v2

    .line 432
    .line 433
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 434
    .line 435
    const/4 v5, 0x4

    .line 436
    aput-object v2, v6, v5

    .line 437
    .line 438
    const/4 v5, 0x5

    .line 439
    aput-object v1, v6, v5

    .line 440
    .line 441
    const/4 v5, 0x6

    .line 442
    aput-object v1, v6, v5

    .line 443
    .line 444
    const/4 v1, 0x7

    .line 445
    aput-object v2, v6, v1

    .line 446
    .line 447
    const/16 v1, 0x8

    .line 448
    .line 449
    aput-object v2, v6, v1

    .line 450
    .line 451
    invoke-virtual {v9, v10, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_8

    .line 452
    .line 453
    .line 454
    :goto_c
    :try_start_16
    new-instance v1, Lg0;

    .line 455
    .line 456
    invoke-direct {v1, v11, v12, v0, v3}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v13, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 460
    .line 461
    .line 462
    goto :goto_f

    .line 463
    :goto_d
    new-instance v2, Lg0;

    .line 464
    .line 465
    invoke-direct {v2, v11, v12, v0, v3}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v13, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 469
    .line 470
    .line 471
    throw v1
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    .line 472
    :catchall_9
    :goto_e
    invoke-virtual {v4}, Landroid/app/Activity;->recreate()V

    .line 473
    .line 474
    .line 475
    :cond_12
    :goto_f
    return-void

    .line 476
    nop

    .line 477
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
