.class public abstract LA4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LA4;->a:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_0

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-eq v1, v3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    if-ne v1, v2, :cond_1

    .line 17
    .line 18
    invoke-static {p0, p1, v0, p2}, LA4;->b(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 24
    .line 25
    const-string p1, "No start tag found"

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public static b(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .locals 33

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "selector"

    .line 12
    .line 13
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_25

    .line 18
    .line 19
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v4, 0x1

    .line 24
    add-int/2addr v3, v4

    .line 25
    const/16 v5, 0x14

    .line 26
    .line 27
    new-array v6, v5, [[I

    .line 28
    .line 29
    new-array v5, v5, [I

    .line 30
    .line 31
    const/4 v7, 0x0

    .line 32
    move v8, v7

    .line 33
    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    if-eq v9, v4, :cond_24

    .line 38
    .line 39
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 40
    .line 41
    .line 42
    move-result v10

    .line 43
    const/4 v11, 0x3

    .line 44
    if-ge v10, v3, :cond_0

    .line 45
    .line 46
    if-eq v9, v11, :cond_24

    .line 47
    .line 48
    :cond_0
    const/4 v12, 0x2

    .line 49
    if-ne v9, v12, :cond_1

    .line 50
    .line 51
    if-gt v10, v3, :cond_1

    .line 52
    .line 53
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v9

    .line 57
    const-string v10, "item"

    .line 58
    .line 59
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    if-nez v9, :cond_2

    .line 64
    .line 65
    :cond_1
    move/from16 v28, v3

    .line 66
    .line 67
    move/from16 v16, v4

    .line 68
    .line 69
    goto/16 :goto_1d

    .line 70
    .line 71
    :cond_2
    sget-object v9, LLf;->a:[I

    .line 72
    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    invoke-virtual {v0, v1, v9}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    invoke-virtual {v2, v1, v9, v7, v7}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    :goto_1
    const/4 v10, -0x1

    .line 85
    invoke-virtual {v9, v7, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    const v14, -0xff01

    .line 90
    .line 91
    .line 92
    const/16 v15, 0x1f

    .line 93
    .line 94
    if-eq v13, v10, :cond_6

    .line 95
    .line 96
    sget-object v10, LA4;->a:Ljava/lang/ThreadLocal;

    .line 97
    .line 98
    invoke-virtual {v10}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v16

    .line 102
    check-cast v16, Landroid/util/TypedValue;

    .line 103
    .line 104
    if-nez v16, :cond_4

    .line 105
    .line 106
    new-instance v12, Landroid/util/TypedValue;

    .line 107
    .line 108
    invoke-direct {v12}, Landroid/util/TypedValue;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v10, v12}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    move-object/from16 v12, v16

    .line 116
    .line 117
    :goto_2
    invoke-virtual {v0, v13, v12, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 118
    .line 119
    .line 120
    iget v10, v12, Landroid/util/TypedValue;->type:I

    .line 121
    .line 122
    const/16 v12, 0x1c

    .line 123
    .line 124
    if-lt v10, v12, :cond_5

    .line 125
    .line 126
    if-gt v10, v15, :cond_5

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_5
    :try_start_0
    invoke-virtual {v0, v13}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    invoke-static {v0, v10, v2}, LA4;->a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 134
    .line 135
    .line 136
    move-result-object v10

    .line 137
    invoke-virtual {v10}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 138
    .line 139
    .line 140
    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    goto :goto_4

    .line 142
    :catch_0
    :cond_6
    :goto_3
    invoke-virtual {v9, v7, v14}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 143
    .line 144
    .line 145
    move-result v10

    .line 146
    :goto_4
    invoke-virtual {v9, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 147
    .line 148
    .line 149
    move-result v12

    .line 150
    const/high16 v13, 0x3f800000    # 1.0f

    .line 151
    .line 152
    if-eqz v12, :cond_7

    .line 153
    .line 154
    invoke-virtual {v9, v4, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 155
    .line 156
    .line 157
    move-result v11

    .line 158
    goto :goto_5

    .line 159
    :cond_7
    invoke-virtual {v9, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 160
    .line 161
    .line 162
    move-result v12

    .line 163
    if-eqz v12, :cond_8

    .line 164
    .line 165
    invoke-virtual {v9, v11, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 166
    .line 167
    .line 168
    move-result v11

    .line 169
    goto :goto_5

    .line 170
    :cond_8
    move v11, v13

    .line 171
    :goto_5
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 172
    .line 173
    const/4 v14, 0x4

    .line 174
    const/high16 v4, -0x40800000    # -1.0f

    .line 175
    .line 176
    if-lt v12, v15, :cond_9

    .line 177
    .line 178
    const/4 v12, 0x2

    .line 179
    invoke-virtual {v9, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 180
    .line 181
    .line 182
    move-result v15

    .line 183
    if-eqz v15, :cond_9

    .line 184
    .line 185
    invoke-virtual {v9, v12, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    goto :goto_6

    .line 190
    :cond_9
    invoke-virtual {v9, v14, v4}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    :goto_6
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    .line 195
    .line 196
    .line 197
    invoke-interface/range {p2 .. p2}, Landroid/util/AttributeSet;->getAttributeCount()I

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    new-array v12, v9, [I

    .line 202
    .line 203
    move v14, v7

    .line 204
    move v15, v14

    .line 205
    :goto_7
    if-ge v15, v9, :cond_c

    .line 206
    .line 207
    invoke-interface {v1, v15}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    .line 208
    .line 209
    .line 210
    move-result v13

    .line 211
    const v7, 0x10101a5

    .line 212
    .line 213
    .line 214
    if-eq v13, v7, :cond_b

    .line 215
    .line 216
    const v7, 0x101031f

    .line 217
    .line 218
    .line 219
    if-eq v13, v7, :cond_b

    .line 220
    .line 221
    const v7, 0x7f030029

    .line 222
    .line 223
    .line 224
    if-eq v13, v7, :cond_b

    .line 225
    .line 226
    const v7, 0x7f03009f

    .line 227
    .line 228
    .line 229
    if-eq v13, v7, :cond_b

    .line 230
    .line 231
    add-int/lit8 v7, v14, 0x1

    .line 232
    .line 233
    const/4 v0, 0x0

    .line 234
    invoke-interface {v1, v15, v0}, Landroid/util/AttributeSet;->getAttributeBooleanValue(IZ)Z

    .line 235
    .line 236
    .line 237
    move-result v19

    .line 238
    if-eqz v19, :cond_a

    .line 239
    .line 240
    goto :goto_8

    .line 241
    :cond_a
    neg-int v13, v13

    .line 242
    :goto_8
    aput v13, v12, v14

    .line 243
    .line 244
    move v14, v7

    .line 245
    :cond_b
    add-int/lit8 v15, v15, 0x1

    .line 246
    .line 247
    move-object/from16 v0, p0

    .line 248
    .line 249
    const/4 v7, 0x0

    .line 250
    const/high16 v13, 0x3f800000    # 1.0f

    .line 251
    .line 252
    goto :goto_7

    .line 253
    :cond_c
    invoke-static {v12, v14}, Landroid/util/StateSet;->trimStateSet([II)[I

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    const/4 v7, 0x0

    .line 258
    cmpl-float v9, v4, v7

    .line 259
    .line 260
    const/high16 v12, 0x42c80000    # 100.0f

    .line 261
    .line 262
    if-ltz v9, :cond_d

    .line 263
    .line 264
    cmpg-float v9, v4, v12

    .line 265
    .line 266
    if-gtz v9, :cond_d

    .line 267
    .line 268
    const/4 v9, 0x1

    .line 269
    :goto_9
    const/high16 v13, 0x3f800000    # 1.0f

    .line 270
    .line 271
    goto :goto_a

    .line 272
    :cond_d
    const/4 v9, 0x0

    .line 273
    goto :goto_9

    .line 274
    :goto_a
    cmpl-float v14, v11, v13

    .line 275
    .line 276
    if-nez v14, :cond_e

    .line 277
    .line 278
    if-nez v9, :cond_e

    .line 279
    .line 280
    move-object v7, v0

    .line 281
    move/from16 v28, v3

    .line 282
    .line 283
    const/16 v16, 0x1

    .line 284
    .line 285
    goto/16 :goto_1a

    .line 286
    .line 287
    :cond_e
    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    .line 288
    .line 289
    .line 290
    move-result v13

    .line 291
    int-to-float v13, v13

    .line 292
    mul-float/2addr v13, v11

    .line 293
    const/high16 v11, 0x3f000000    # 0.5f

    .line 294
    .line 295
    add-float/2addr v13, v11

    .line 296
    float-to-int v11, v13

    .line 297
    if-gez v11, :cond_f

    .line 298
    .line 299
    const/4 v13, 0x0

    .line 300
    goto :goto_b

    .line 301
    :cond_f
    const/16 v13, 0xff

    .line 302
    .line 303
    if-le v11, v13, :cond_10

    .line 304
    .line 305
    goto :goto_b

    .line 306
    :cond_10
    move v13, v11

    .line 307
    :goto_b
    if-eqz v9, :cond_1f

    .line 308
    .line 309
    invoke-static {v10}, LM3;->a(I)LM3;

    .line 310
    .line 311
    .line 312
    move-result-object v9

    .line 313
    sget-object v10, Lak;->k:Lak;

    .line 314
    .line 315
    iget v11, v9, LM3;->b:F

    .line 316
    .line 317
    float-to-double v14, v11

    .line 318
    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    .line 319
    .line 320
    cmpg-double v14, v14, v19

    .line 321
    .line 322
    if-ltz v14, :cond_11

    .line 323
    .line 324
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 325
    .line 326
    .line 327
    move-result v14

    .line 328
    int-to-double v14, v14

    .line 329
    const-wide/16 v19, 0x0

    .line 330
    .line 331
    cmpg-double v14, v14, v19

    .line 332
    .line 333
    if-lez v14, :cond_11

    .line 334
    .line 335
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 336
    .line 337
    .line 338
    move-result v14

    .line 339
    int-to-double v14, v14

    .line 340
    const-wide/high16 v19, 0x4059000000000000L    # 100.0

    .line 341
    .line 342
    cmpl-double v14, v14, v19

    .line 343
    .line 344
    if-ltz v14, :cond_12

    .line 345
    .line 346
    :cond_11
    move-object v7, v0

    .line 347
    move/from16 v28, v3

    .line 348
    .line 349
    const/16 v16, 0x1

    .line 350
    .line 351
    goto/16 :goto_18

    .line 352
    .line 353
    :cond_12
    iget v9, v9, LM3;->a:F

    .line 354
    .line 355
    cmpg-float v14, v9, v7

    .line 356
    .line 357
    if-gez v14, :cond_13

    .line 358
    .line 359
    move v9, v7

    .line 360
    goto :goto_c

    .line 361
    :cond_13
    const/high16 v14, 0x43b40000    # 360.0f

    .line 362
    .line 363
    invoke-static {v14, v9}, Ljava/lang/Math;->min(FF)F

    .line 364
    .line 365
    .line 366
    move-result v9

    .line 367
    :goto_c
    move/from16 v20, v7

    .line 368
    .line 369
    move v15, v11

    .line 370
    const/4 v14, 0x0

    .line 371
    const/16 v19, 0x1

    .line 372
    .line 373
    :goto_d
    sub-float v21, v20, v11

    .line 374
    .line 375
    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->abs(F)F

    .line 376
    .line 377
    .line 378
    move-result v21

    .line 379
    const v22, 0x3ecccccd    # 0.4f

    .line 380
    .line 381
    .line 382
    cmpl-float v21, v21, v22

    .line 383
    .line 384
    if-ltz v21, :cond_1d

    .line 385
    .line 386
    const/high16 v21, 0x447a0000    # 1000.0f

    .line 387
    .line 388
    move/from16 v23, v7

    .line 389
    .line 390
    move/from16 v24, v12

    .line 391
    .line 392
    move/from16 v22, v21

    .line 393
    .line 394
    const/16 v25, 0x0

    .line 395
    .line 396
    :goto_e
    sub-float v26, v23, v24

    .line 397
    .line 398
    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    .line 399
    .line 400
    .line 401
    move-result v26

    .line 402
    const v27, 0x3c23d70a    # 0.01f

    .line 403
    .line 404
    .line 405
    cmpl-float v26, v26, v27

    .line 406
    .line 407
    const/high16 v27, 0x40000000    # 2.0f

    .line 408
    .line 409
    if-lez v26, :cond_19

    .line 410
    .line 411
    sub-float v26, v24, v23

    .line 412
    .line 413
    div-float v26, v26, v27

    .line 414
    .line 415
    add-float v7, v26, v23

    .line 416
    .line 417
    invoke-static {v7, v15, v9}, LM3;->b(FFF)LM3;

    .line 418
    .line 419
    .line 420
    move-result-object v12

    .line 421
    sget-object v1, Lak;->k:Lak;

    .line 422
    .line 423
    invoke-virtual {v12, v1}, LM3;->c(Lak;)I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    .line 428
    .line 429
    .line 430
    move-result v12

    .line 431
    invoke-static {v12}, Lu6;->s(I)F

    .line 432
    .line 433
    .line 434
    move-result v12

    .line 435
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    .line 436
    .line 437
    .line 438
    move-result v28

    .line 439
    invoke-static/range {v28 .. v28}, Lu6;->s(I)F

    .line 440
    .line 441
    .line 442
    move-result v28

    .line 443
    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    .line 444
    .line 445
    .line 446
    move-result v29

    .line 447
    invoke-static/range {v29 .. v29}, Lu6;->s(I)F

    .line 448
    .line 449
    .line 450
    move-result v29

    .line 451
    sget-object v30, Lu6;->d:[[F

    .line 452
    .line 453
    const/16 v16, 0x1

    .line 454
    .line 455
    aget-object v30, v30, v16

    .line 456
    .line 457
    const/16 v18, 0x0

    .line 458
    .line 459
    aget v31, v30, v18

    .line 460
    .line 461
    mul-float v12, v12, v31

    .line 462
    .line 463
    aget v31, v30, v16

    .line 464
    .line 465
    mul-float v28, v28, v31

    .line 466
    .line 467
    add-float v28, v28, v12

    .line 468
    .line 469
    const/4 v12, 0x2

    .line 470
    aget v17, v30, v12

    .line 471
    .line 472
    mul-float v29, v29, v17

    .line 473
    .line 474
    add-float v29, v29, v28

    .line 475
    .line 476
    const/high16 v17, 0x42c80000    # 100.0f

    .line 477
    .line 478
    div-float v12, v29, v17

    .line 479
    .line 480
    const v28, 0x3c111aa7

    .line 481
    .line 482
    .line 483
    cmpg-float v28, v12, v28

    .line 484
    .line 485
    if-gtz v28, :cond_14

    .line 486
    .line 487
    const v28, 0x4461d2f7

    .line 488
    .line 489
    .line 490
    mul-float v12, v12, v28

    .line 491
    .line 492
    move/from16 v28, v3

    .line 493
    .line 494
    goto :goto_f

    .line 495
    :cond_14
    move/from16 v28, v3

    .line 496
    .line 497
    float-to-double v2, v12

    .line 498
    invoke-static {v2, v3}, Ljava/lang/Math;->cbrt(D)D

    .line 499
    .line 500
    .line 501
    move-result-wide v2

    .line 502
    double-to-float v2, v2

    .line 503
    const/high16 v3, 0x42e80000    # 116.0f

    .line 504
    .line 505
    mul-float/2addr v2, v3

    .line 506
    const/high16 v3, 0x41800000    # 16.0f

    .line 507
    .line 508
    sub-float v12, v2, v3

    .line 509
    .line 510
    :goto_f
    sub-float v2, v4, v12

    .line 511
    .line 512
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 513
    .line 514
    .line 515
    move-result v2

    .line 516
    const v3, 0x3e4ccccd    # 0.2f

    .line 517
    .line 518
    .line 519
    cmpg-float v3, v2, v3

    .line 520
    .line 521
    if-gez v3, :cond_16

    .line 522
    .line 523
    invoke-static {v1}, LM3;->a(I)LM3;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    iget v3, v1, LM3;->c:F

    .line 528
    .line 529
    move/from16 v29, v2

    .line 530
    .line 531
    iget v2, v1, LM3;->b:F

    .line 532
    .line 533
    invoke-static {v3, v2, v9}, LM3;->b(FFF)LM3;

    .line 534
    .line 535
    .line 536
    move-result-object v2

    .line 537
    iget v3, v1, LM3;->d:F

    .line 538
    .line 539
    move/from16 v30, v7

    .line 540
    .line 541
    iget v7, v2, LM3;->d:F

    .line 542
    .line 543
    sub-float/2addr v3, v7

    .line 544
    iget v7, v1, LM3;->e:F

    .line 545
    .line 546
    move/from16 v31, v9

    .line 547
    .line 548
    iget v9, v2, LM3;->e:F

    .line 549
    .line 550
    sub-float/2addr v7, v9

    .line 551
    iget v9, v1, LM3;->f:F

    .line 552
    .line 553
    iget v2, v2, LM3;->f:F

    .line 554
    .line 555
    sub-float/2addr v9, v2

    .line 556
    mul-float/2addr v3, v3

    .line 557
    mul-float/2addr v7, v7

    .line 558
    add-float/2addr v7, v3

    .line 559
    mul-float/2addr v9, v9

    .line 560
    add-float/2addr v9, v7

    .line 561
    float-to-double v2, v9

    .line 562
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 563
    .line 564
    .line 565
    move-result-wide v2

    .line 566
    move-object v7, v0

    .line 567
    move-object v9, v1

    .line 568
    const-wide v0, 0x3fe428f5c28f5c29L    # 0.63

    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 574
    .line 575
    .line 576
    move-result-wide v0

    .line 577
    const-wide v2, 0x3ff68f5c28f5c28fL    # 1.41

    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    mul-double/2addr v0, v2

    .line 583
    double-to-float v0, v0

    .line 584
    const/high16 v1, 0x3f800000    # 1.0f

    .line 585
    .line 586
    cmpg-float v2, v0, v1

    .line 587
    .line 588
    if-gtz v2, :cond_15

    .line 589
    .line 590
    move/from16 v22, v0

    .line 591
    .line 592
    move-object/from16 v25, v9

    .line 593
    .line 594
    move/from16 v21, v29

    .line 595
    .line 596
    :cond_15
    :goto_10
    const/4 v0, 0x0

    .line 597
    goto :goto_11

    .line 598
    :cond_16
    move/from16 v30, v7

    .line 599
    .line 600
    move/from16 v31, v9

    .line 601
    .line 602
    const/high16 v1, 0x3f800000    # 1.0f

    .line 603
    .line 604
    move-object v7, v0

    .line 605
    goto :goto_10

    .line 606
    :goto_11
    cmpl-float v2, v21, v0

    .line 607
    .line 608
    if-nez v2, :cond_17

    .line 609
    .line 610
    cmpl-float v2, v22, v0

    .line 611
    .line 612
    if-nez v2, :cond_17

    .line 613
    .line 614
    :goto_12
    move-object/from16 v2, v25

    .line 615
    .line 616
    goto :goto_14

    .line 617
    :cond_17
    cmpg-float v2, v12, v4

    .line 618
    .line 619
    if-gez v2, :cond_18

    .line 620
    .line 621
    move/from16 v23, v30

    .line 622
    .line 623
    goto :goto_13

    .line 624
    :cond_18
    move/from16 v24, v30

    .line 625
    .line 626
    :goto_13
    move-object/from16 v1, p2

    .line 627
    .line 628
    move-object/from16 v2, p3

    .line 629
    .line 630
    move/from16 v12, v17

    .line 631
    .line 632
    move/from16 v3, v28

    .line 633
    .line 634
    move/from16 v9, v31

    .line 635
    .line 636
    move-object/from16 v32, v7

    .line 637
    .line 638
    move v7, v0

    .line 639
    move-object/from16 v0, v32

    .line 640
    .line 641
    goto/16 :goto_e

    .line 642
    .line 643
    :cond_19
    move/from16 v28, v3

    .line 644
    .line 645
    move/from16 v31, v9

    .line 646
    .line 647
    move/from16 v17, v12

    .line 648
    .line 649
    const/high16 v1, 0x3f800000    # 1.0f

    .line 650
    .line 651
    const/16 v16, 0x1

    .line 652
    .line 653
    move/from16 v32, v7

    .line 654
    .line 655
    move-object v7, v0

    .line 656
    move/from16 v0, v32

    .line 657
    .line 658
    goto :goto_12

    .line 659
    :goto_14
    if-eqz v19, :cond_1b

    .line 660
    .line 661
    if-eqz v2, :cond_1a

    .line 662
    .line 663
    invoke-virtual {v2, v10}, LM3;->c(Lak;)I

    .line 664
    .line 665
    .line 666
    move-result v0

    .line 667
    :goto_15
    move v10, v0

    .line 668
    goto :goto_19

    .line 669
    :cond_1a
    sub-float v2, v11, v20

    .line 670
    .line 671
    div-float v2, v2, v27

    .line 672
    .line 673
    add-float v15, v2, v20

    .line 674
    .line 675
    move-object/from16 v1, p2

    .line 676
    .line 677
    move-object/from16 v2, p3

    .line 678
    .line 679
    move/from16 v12, v17

    .line 680
    .line 681
    move/from16 v3, v28

    .line 682
    .line 683
    move/from16 v9, v31

    .line 684
    .line 685
    const/16 v19, 0x0

    .line 686
    .line 687
    :goto_16
    move-object/from16 v32, v7

    .line 688
    .line 689
    move v7, v0

    .line 690
    move-object/from16 v0, v32

    .line 691
    .line 692
    goto/16 :goto_d

    .line 693
    .line 694
    :cond_1b
    if-nez v2, :cond_1c

    .line 695
    .line 696
    move v11, v15

    .line 697
    goto :goto_17

    .line 698
    :cond_1c
    move-object v14, v2

    .line 699
    move/from16 v20, v15

    .line 700
    .line 701
    :goto_17
    sub-float v2, v11, v20

    .line 702
    .line 703
    div-float v2, v2, v27

    .line 704
    .line 705
    add-float v15, v2, v20

    .line 706
    .line 707
    move-object/from16 v1, p2

    .line 708
    .line 709
    move-object/from16 v2, p3

    .line 710
    .line 711
    move/from16 v12, v17

    .line 712
    .line 713
    move/from16 v3, v28

    .line 714
    .line 715
    move/from16 v9, v31

    .line 716
    .line 717
    goto :goto_16

    .line 718
    :cond_1d
    move-object v7, v0

    .line 719
    move/from16 v28, v3

    .line 720
    .line 721
    const/16 v16, 0x1

    .line 722
    .line 723
    if-nez v14, :cond_1e

    .line 724
    .line 725
    :goto_18
    invoke-static {v4}, Lu6;->q(F)I

    .line 726
    .line 727
    .line 728
    move-result v0

    .line 729
    goto :goto_15

    .line 730
    :cond_1e
    invoke-virtual {v14, v10}, LM3;->c(Lak;)I

    .line 731
    .line 732
    .line 733
    move-result v0

    .line 734
    goto :goto_15

    .line 735
    :cond_1f
    move-object v7, v0

    .line 736
    move/from16 v28, v3

    .line 737
    .line 738
    const/16 v16, 0x1

    .line 739
    .line 740
    :goto_19
    const v0, 0xffffff

    .line 741
    .line 742
    .line 743
    and-int/2addr v0, v10

    .line 744
    shl-int/lit8 v1, v13, 0x18

    .line 745
    .line 746
    or-int v10, v0, v1

    .line 747
    .line 748
    :goto_1a
    add-int/lit8 v0, v8, 0x1

    .line 749
    .line 750
    array-length v1, v5

    .line 751
    const/16 v2, 0x8

    .line 752
    .line 753
    if-le v0, v1, :cond_21

    .line 754
    .line 755
    const/4 v1, 0x4

    .line 756
    if-gt v8, v1, :cond_20

    .line 757
    .line 758
    move v1, v2

    .line 759
    goto :goto_1b

    .line 760
    :cond_20
    mul-int/lit8 v1, v8, 0x2

    .line 761
    .line 762
    :goto_1b
    new-array v1, v1, [I

    .line 763
    .line 764
    const/4 v3, 0x0

    .line 765
    invoke-static {v5, v3, v1, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 766
    .line 767
    .line 768
    move-object v5, v1

    .line 769
    :cond_21
    aput v10, v5, v8

    .line 770
    .line 771
    array-length v1, v6

    .line 772
    if-le v0, v1, :cond_23

    .line 773
    .line 774
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 775
    .line 776
    .line 777
    move-result-object v1

    .line 778
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 779
    .line 780
    .line 781
    move-result-object v1

    .line 782
    const/4 v3, 0x4

    .line 783
    if-gt v8, v3, :cond_22

    .line 784
    .line 785
    goto :goto_1c

    .line 786
    :cond_22
    mul-int/lit8 v2, v8, 0x2

    .line 787
    .line 788
    :goto_1c
    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 789
    .line 790
    .line 791
    move-result-object v1

    .line 792
    check-cast v1, [Ljava/lang/Object;

    .line 793
    .line 794
    const/4 v2, 0x0

    .line 795
    invoke-static {v6, v2, v1, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 796
    .line 797
    .line 798
    move-object v6, v1

    .line 799
    :cond_23
    aput-object v7, v6, v8

    .line 800
    .line 801
    check-cast v6, [[I

    .line 802
    .line 803
    move-object/from16 v1, p2

    .line 804
    .line 805
    move-object/from16 v2, p3

    .line 806
    .line 807
    move v8, v0

    .line 808
    move/from16 v4, v16

    .line 809
    .line 810
    move/from16 v3, v28

    .line 811
    .line 812
    const/4 v7, 0x0

    .line 813
    move-object/from16 v0, p0

    .line 814
    .line 815
    goto/16 :goto_0

    .line 816
    .line 817
    :goto_1d
    move-object/from16 v0, p0

    .line 818
    .line 819
    move-object/from16 v1, p2

    .line 820
    .line 821
    move-object/from16 v2, p3

    .line 822
    .line 823
    move/from16 v4, v16

    .line 824
    .line 825
    move/from16 v3, v28

    .line 826
    .line 827
    const/4 v7, 0x0

    .line 828
    goto/16 :goto_0

    .line 829
    .line 830
    :cond_24
    new-array v0, v8, [I

    .line 831
    .line 832
    new-array v1, v8, [[I

    .line 833
    .line 834
    const/4 v2, 0x0

    .line 835
    invoke-static {v5, v2, v0, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 836
    .line 837
    .line 838
    invoke-static {v6, v2, v1, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 839
    .line 840
    .line 841
    new-instance v2, Landroid/content/res/ColorStateList;

    .line 842
    .line 843
    invoke-direct {v2, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 844
    .line 845
    .line 846
    return-object v2

    .line 847
    :cond_25
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 848
    .line 849
    new-instance v1, Ljava/lang/StringBuilder;

    .line 850
    .line 851
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 852
    .line 853
    .line 854
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 855
    .line 856
    .line 857
    move-result-object v2

    .line 858
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 859
    .line 860
    .line 861
    const-string v2, ": invalid color state list tag "

    .line 862
    .line 863
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 864
    .line 865
    .line 866
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 867
    .line 868
    .line 869
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 870
    .line 871
    .line 872
    move-result-object v1

    .line 873
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    throw v0
.end method
