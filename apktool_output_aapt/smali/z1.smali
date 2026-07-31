.class public final Lz1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LMe;
.implements Lg5;
.implements Lhe;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:LM1;


# direct methods
.method public synthetic constructor <init>(LM1;I)V
    .locals 0

    .line 1
    iput p2, p0, Lz1;->c:I

    iput-object p1, p0, Lz1;->d:LM1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(LMd;Z)V
    .locals 9

    .line 1
    iget v0, p0, Lz1;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LMd;->k()LMd;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq v0, p1, :cond_0

    .line 13
    .line 14
    move v3, v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v3, v1

    .line 17
    :goto_0
    if-eqz v3, :cond_1

    .line 18
    .line 19
    move-object p1, v0

    .line 20
    :cond_1
    iget-object v4, p0, Lz1;->d:LM1;

    .line 21
    .line 22
    iget-object v5, v4, LM1;->N:[LL1;

    .line 23
    .line 24
    if-eqz v5, :cond_2

    .line 25
    .line 26
    array-length v6, v5

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    move v6, v1

    .line 29
    :goto_1
    if-ge v1, v6, :cond_4

    .line 30
    .line 31
    aget-object v7, v5, v1

    .line 32
    .line 33
    if-eqz v7, :cond_3

    .line 34
    .line 35
    iget-object v8, v7, LL1;->h:LMd;

    .line 36
    .line 37
    if-ne v8, p1, :cond_3

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_4
    const/4 v7, 0x0

    .line 44
    :goto_2
    if-eqz v7, :cond_6

    .line 45
    .line 46
    if-eqz v3, :cond_5

    .line 47
    .line 48
    iget p1, v7, LL1;->a:I

    .line 49
    .line 50
    invoke-virtual {v4, p1, v7, v0}, LM1;->q(ILL1;LMd;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, v7, v2}, LM1;->t(LL1;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_5
    invoke-virtual {v4, v7, p2}, LM1;->t(LL1;Z)V

    .line 58
    .line 59
    .line 60
    :cond_6
    :goto_3
    return-void

    .line 61
    :pswitch_0
    iget-object p2, p0, Lz1;->d:LM1;

    .line 62
    .line 63
    invoke-virtual {p2, p1}, LM1;->s(LMd;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public g(Landroid/view/View;LLk;)LLk;
    .locals 16

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    invoke-virtual/range {p2 .. p2}, LLk;->d()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    move-object/from16 v6, p0

    .line 12
    .line 13
    iget-object v7, v6, Lz1;->d:LM1;

    .line 14
    .line 15
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual/range {p2 .. p2}, LLk;->d()I

    .line 19
    .line 20
    .line 21
    move-result v8

    .line 22
    iget-object v0, v7, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 23
    .line 24
    const/16 v9, 0x8

    .line 25
    .line 26
    if-eqz v0, :cond_f

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 33
    .line 34
    if-eqz v0, :cond_f

    .line 35
    .line 36
    iget-object v0, v7, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    move-object v10, v0

    .line 43
    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    .line 45
    iget-object v0, v7, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_d

    .line 52
    .line 53
    iget-object v0, v7, LM1;->e0:Landroid/graphics/Rect;

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    new-instance v0, Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, v7, LM1;->e0:Landroid/graphics/Rect;

    .line 63
    .line 64
    new-instance v0, Landroid/graphics/Rect;

    .line 65
    .line 66
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, v7, LM1;->f0:Landroid/graphics/Rect;

    .line 70
    .line 71
    :cond_0
    iget-object v11, v7, LM1;->e0:Landroid/graphics/Rect;

    .line 72
    .line 73
    iget-object v0, v7, LM1;->f0:Landroid/graphics/Rect;

    .line 74
    .line 75
    invoke-virtual/range {p2 .. p2}, LLk;->b()I

    .line 76
    .line 77
    .line 78
    move-result v12

    .line 79
    invoke-virtual/range {p2 .. p2}, LLk;->d()I

    .line 80
    .line 81
    .line 82
    move-result v13

    .line 83
    invoke-virtual/range {p2 .. p2}, LLk;->c()I

    .line 84
    .line 85
    .line 86
    move-result v14

    .line 87
    invoke-virtual/range {p2 .. p2}, LLk;->a()I

    .line 88
    .line 89
    .line 90
    move-result v15

    .line 91
    invoke-virtual {v11, v12, v13, v14, v15}, Landroid/graphics/Rect;->set(IIII)V

    .line 92
    .line 93
    .line 94
    iget-object v12, v7, LM1;->C:Landroid/view/ViewGroup;

    .line 95
    .line 96
    sget-object v13, LZj;->a:Ljava/lang/reflect/Method;

    .line 97
    .line 98
    if-eqz v13, :cond_1

    .line 99
    .line 100
    const/4 v14, 0x2

    .line 101
    :try_start_0
    new-array v14, v14, [Ljava/lang/Object;

    .line 102
    .line 103
    aput-object v11, v14, v4

    .line 104
    .line 105
    aput-object v0, v14, v3

    .line 106
    .line 107
    invoke-virtual {v13, v12, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    const-string v12, "ViewUtils"

    .line 113
    .line 114
    const-string v13, "Could not invoke computeFitSystemWindows"

    .line 115
    .line 116
    invoke-static {v12, v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    .line 118
    .line 119
    :cond_1
    :goto_0
    iget v0, v11, Landroid/graphics/Rect;->top:I

    .line 120
    .line 121
    iget v12, v11, Landroid/graphics/Rect;->left:I

    .line 122
    .line 123
    iget v11, v11, Landroid/graphics/Rect;->right:I

    .line 124
    .line 125
    iget-object v13, v7, LM1;->C:Landroid/view/ViewGroup;

    .line 126
    .line 127
    sget-object v14, LLj;->a:Ljava/util/WeakHashMap;

    .line 128
    .line 129
    invoke-static {v13}, LFj;->a(Landroid/view/View;)LLk;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    if-nez v13, :cond_2

    .line 134
    .line 135
    move v14, v4

    .line 136
    goto :goto_1

    .line 137
    :cond_2
    invoke-virtual {v13}, LLk;->b()I

    .line 138
    .line 139
    .line 140
    move-result v14

    .line 141
    :goto_1
    if-nez v13, :cond_3

    .line 142
    .line 143
    move v13, v4

    .line 144
    goto :goto_2

    .line 145
    :cond_3
    invoke-virtual {v13}, LLk;->c()I

    .line 146
    .line 147
    .line 148
    move-result v13

    .line 149
    :goto_2
    iget v15, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 150
    .line 151
    if-ne v15, v0, :cond_5

    .line 152
    .line 153
    iget v15, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 154
    .line 155
    if-ne v15, v12, :cond_5

    .line 156
    .line 157
    iget v15, v10, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 158
    .line 159
    if-eq v15, v11, :cond_4

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_4
    move v11, v4

    .line 163
    goto :goto_4

    .line 164
    :cond_5
    :goto_3
    iput v0, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 165
    .line 166
    iput v12, v10, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 167
    .line 168
    iput v11, v10, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 169
    .line 170
    move v11, v3

    .line 171
    :goto_4
    iget-object v12, v7, LM1;->m:Landroid/content/Context;

    .line 172
    .line 173
    if-lez v0, :cond_6

    .line 174
    .line 175
    iget-object v0, v7, LM1;->E:Landroid/view/View;

    .line 176
    .line 177
    if-nez v0, :cond_6

    .line 178
    .line 179
    new-instance v0, Landroid/view/View;

    .line 180
    .line 181
    invoke-direct {v0, v12}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 182
    .line 183
    .line 184
    iput-object v0, v7, LM1;->E:Landroid/view/View;

    .line 185
    .line 186
    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 190
    .line 191
    iget v15, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 192
    .line 193
    const/16 v3, 0x33

    .line 194
    .line 195
    const/4 v9, -0x1

    .line 196
    invoke-direct {v0, v9, v15, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 197
    .line 198
    .line 199
    iput v14, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 200
    .line 201
    iput v13, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 202
    .line 203
    iget-object v3, v7, LM1;->C:Landroid/view/ViewGroup;

    .line 204
    .line 205
    iget-object v13, v7, LM1;->E:Landroid/view/View;

    .line 206
    .line 207
    invoke-virtual {v3, v13, v9, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 208
    .line 209
    .line 210
    goto :goto_5

    .line 211
    :cond_6
    iget-object v0, v7, LM1;->E:Landroid/view/View;

    .line 212
    .line 213
    if-eqz v0, :cond_8

    .line 214
    .line 215
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 220
    .line 221
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 222
    .line 223
    iget v9, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 224
    .line 225
    if-ne v3, v9, :cond_7

    .line 226
    .line 227
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 228
    .line 229
    if-ne v3, v14, :cond_7

    .line 230
    .line 231
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 232
    .line 233
    if-eq v3, v13, :cond_8

    .line 234
    .line 235
    :cond_7
    iput v9, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 236
    .line 237
    iput v14, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 238
    .line 239
    iput v13, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 240
    .line 241
    iget-object v3, v7, LM1;->E:Landroid/view/View;

    .line 242
    .line 243
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    .line 245
    .line 246
    :cond_8
    :goto_5
    iget-object v0, v7, LM1;->E:Landroid/view/View;

    .line 247
    .line 248
    if-eqz v0, :cond_9

    .line 249
    .line 250
    const/4 v3, 0x1

    .line 251
    goto :goto_6

    .line 252
    :cond_9
    move v3, v4

    .line 253
    :goto_6
    if-eqz v3, :cond_b

    .line 254
    .line 255
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_b

    .line 260
    .line 261
    iget-object v0, v7, LM1;->E:Landroid/view/View;

    .line 262
    .line 263
    invoke-virtual {v0}, Landroid/view/View;->getWindowSystemUiVisibility()I

    .line 264
    .line 265
    .line 266
    move-result v9

    .line 267
    and-int/lit16 v9, v9, 0x2000

    .line 268
    .line 269
    if-eqz v9, :cond_a

    .line 270
    .line 271
    const v9, 0x7f050006

    .line 272
    .line 273
    .line 274
    :goto_7
    invoke-virtual {v12, v9}, Landroid/content/Context;->getColor(I)I

    .line 275
    .line 276
    .line 277
    move-result v9

    .line 278
    goto :goto_8

    .line 279
    :cond_a
    const v9, 0x7f050005

    .line 280
    .line 281
    .line 282
    goto :goto_7

    .line 283
    :goto_8
    invoke-virtual {v0, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 284
    .line 285
    .line 286
    :cond_b
    iget-boolean v0, v7, LM1;->J:Z

    .line 287
    .line 288
    if-nez v0, :cond_c

    .line 289
    .line 290
    if-eqz v3, :cond_c

    .line 291
    .line 292
    move v8, v4

    .line 293
    :cond_c
    move v0, v3

    .line 294
    move v3, v11

    .line 295
    goto :goto_9

    .line 296
    :cond_d
    iget v0, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 297
    .line 298
    if-eqz v0, :cond_e

    .line 299
    .line 300
    iput v4, v10, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 301
    .line 302
    move v0, v4

    .line 303
    const/4 v3, 0x1

    .line 304
    goto :goto_9

    .line 305
    :cond_e
    move v0, v4

    .line 306
    move v3, v0

    .line 307
    :goto_9
    if-eqz v3, :cond_10

    .line 308
    .line 309
    iget-object v3, v7, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 310
    .line 311
    invoke-virtual {v3, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    .line 313
    .line 314
    goto :goto_a

    .line 315
    :cond_f
    move v0, v4

    .line 316
    :cond_10
    :goto_a
    iget-object v3, v7, LM1;->E:Landroid/view/View;

    .line 317
    .line 318
    if-eqz v3, :cond_12

    .line 319
    .line 320
    if-eqz v0, :cond_11

    .line 321
    .line 322
    goto :goto_b

    .line 323
    :cond_11
    const/16 v4, 0x8

    .line 324
    .line 325
    :goto_b
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 326
    .line 327
    .line 328
    :cond_12
    if-eq v5, v8, :cond_15

    .line 329
    .line 330
    invoke-virtual/range {p2 .. p2}, LLk;->b()I

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    invoke-virtual/range {p2 .. p2}, LLk;->c()I

    .line 335
    .line 336
    .line 337
    move-result v3

    .line 338
    invoke-virtual/range {p2 .. p2}, LLk;->a()I

    .line 339
    .line 340
    .line 341
    move-result v4

    .line 342
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 343
    .line 344
    const/16 v7, 0x1e

    .line 345
    .line 346
    if-lt v5, v7, :cond_13

    .line 347
    .line 348
    new-instance v5, LBk;

    .line 349
    .line 350
    invoke-direct {v5, v2}, LBk;-><init>(LLk;)V

    .line 351
    .line 352
    .line 353
    goto :goto_c

    .line 354
    :cond_13
    const/16 v7, 0x1d

    .line 355
    .line 356
    if-lt v5, v7, :cond_14

    .line 357
    .line 358
    new-instance v5, LAk;

    .line 359
    .line 360
    invoke-direct {v5, v2}, LAk;-><init>(LLk;)V

    .line 361
    .line 362
    .line 363
    goto :goto_c

    .line 364
    :cond_14
    new-instance v5, Lzk;

    .line 365
    .line 366
    invoke-direct {v5, v2}, Lzk;-><init>(LLk;)V

    .line 367
    .line 368
    .line 369
    :goto_c
    invoke-static {v0, v8, v3, v4}, Lgc;->b(IIII)Lgc;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {v5, v0}, LCk;->g(Lgc;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v5}, LCk;->b()LLk;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    goto :goto_d

    .line 381
    :cond_15
    move-object v0, v2

    .line 382
    :goto_d
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 383
    .line 384
    invoke-virtual {v0}, LLk;->f()Landroid/view/WindowInsets;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    if-eqz v2, :cond_16

    .line 389
    .line 390
    invoke-static {v1, v2}, LCj;->b(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 391
    .line 392
    .line 393
    move-result-object v3

    .line 394
    invoke-virtual {v3, v2}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result v2

    .line 398
    if-nez v2, :cond_16

    .line 399
    .line 400
    invoke-static {v1, v3}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    :cond_16
    return-object v0
.end method

.method public u(LMd;)Z
    .locals 2

    .line 1
    iget v0, p0, Lz1;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LMd;->k()LMd;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lz1;->d:LM1;

    .line 13
    .line 14
    iget-boolean v1, v0, LM1;->H:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, v0, LM1;->n:Landroid/view/Window;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-boolean v0, v0, LM1;->S:Z

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const/16 v0, 0x6c

    .line 31
    .line 32
    invoke-interface {v1, v0, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 p1, 0x1

    .line 36
    return p1

    .line 37
    :pswitch_0
    iget-object v0, p0, Lz1;->d:LM1;

    .line 38
    .line 39
    iget-object v0, v0, LM1;->n:Landroid/view/Window;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    const/16 v1, 0x6c

    .line 48
    .line 49
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    const/4 p1, 0x1

    .line 53
    return p1

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
