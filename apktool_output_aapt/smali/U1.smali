.class public final LU1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LU1;->b:Ljava/lang/Object;

    iput-object p2, p0, LU1;->c:Ljava/lang/Object;

    iput p3, p0, LU1;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, LU1;->a:I

    iput-object p1, p0, LU1;->b:Ljava/lang/Object;

    return-void
.end method

.method public static b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)LU1;
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "gradient"

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-static {v3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    :goto_0
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    const/4 v6, 0x2

    .line 20
    const/4 v7, 0x1

    .line 21
    if-eq v5, v6, :cond_0

    .line 22
    .line 23
    if-eq v5, v7, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-ne v5, v6, :cond_21

    .line 27
    .line 28
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    if-nez v9, :cond_2

    .line 41
    .line 42
    const-string v2, "selector"

    .line 43
    .line 44
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    invoke-static {v0, v3, v4, v1}, LA4;->b(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, LU1;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-direct {v1, v8, v0, v2}, LU1;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    .line 61
    .line 62
    .line 63
    return-object v1

    .line 64
    :cond_1
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v2, ": unsupported complex color tag "

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw v0

    .line 94
    :cond_2
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_20

    .line 103
    .line 104
    sget-object v2, LLf;->d:[I

    .line 105
    .line 106
    invoke-static {v0, v1, v4, v2}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    const-string v5, "startX"

    .line 111
    .line 112
    invoke-static {v3, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    const/4 v9, 0x0

    .line 117
    if-nez v5, :cond_3

    .line 118
    .line 119
    move v11, v9

    .line 120
    goto :goto_1

    .line 121
    :cond_3
    const/16 v5, 0x8

    .line 122
    .line 123
    invoke-virtual {v2, v5, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    move v11, v5

    .line 128
    :goto_1
    const-string v5, "startY"

    .line 129
    .line 130
    invoke-static {v3, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    if-nez v5, :cond_4

    .line 135
    .line 136
    move v12, v9

    .line 137
    goto :goto_2

    .line 138
    :cond_4
    const/16 v5, 0x9

    .line 139
    .line 140
    invoke-virtual {v2, v5, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    move v12, v5

    .line 145
    :goto_2
    const-string v5, "endX"

    .line 146
    .line 147
    invoke-static {v3, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    if-nez v5, :cond_5

    .line 152
    .line 153
    move v13, v9

    .line 154
    goto :goto_3

    .line 155
    :cond_5
    const/16 v5, 0xa

    .line 156
    .line 157
    invoke-virtual {v2, v5, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    move v13, v5

    .line 162
    :goto_3
    const-string v5, "endY"

    .line 163
    .line 164
    invoke-static {v3, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    if-nez v5, :cond_6

    .line 169
    .line 170
    move v14, v9

    .line 171
    goto :goto_4

    .line 172
    :cond_6
    const/16 v5, 0xb

    .line 173
    .line 174
    invoke-virtual {v2, v5, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    move v14, v5

    .line 179
    :goto_4
    const-string v5, "centerX"

    .line 180
    .line 181
    invoke-static {v3, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    const/4 v10, 0x3

    .line 186
    if-nez v5, :cond_7

    .line 187
    .line 188
    move v5, v9

    .line 189
    goto :goto_5

    .line 190
    :cond_7
    invoke-virtual {v2, v10, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    :goto_5
    const-string v15, "centerY"

    .line 195
    .line 196
    invoke-static {v3, v15}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 197
    .line 198
    .line 199
    move-result v15

    .line 200
    if-nez v15, :cond_8

    .line 201
    .line 202
    move v15, v9

    .line 203
    goto :goto_6

    .line 204
    :cond_8
    const/4 v15, 0x4

    .line 205
    invoke-virtual {v2, v15, v9}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 206
    .line 207
    .line 208
    move-result v15

    .line 209
    :goto_6
    const-string v8, "type"

    .line 210
    .line 211
    invoke-static {v3, v8}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v8

    .line 215
    const/4 v10, 0x0

    .line 216
    if-nez v8, :cond_9

    .line 217
    .line 218
    move v8, v10

    .line 219
    goto :goto_7

    .line 220
    :cond_9
    invoke-virtual {v2, v6, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 221
    .line 222
    .line 223
    move-result v8

    .line 224
    :goto_7
    const-string v6, "startColor"

    .line 225
    .line 226
    invoke-static {v3, v6}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 227
    .line 228
    .line 229
    move-result v6

    .line 230
    if-nez v6, :cond_a

    .line 231
    .line 232
    move v6, v10

    .line 233
    goto :goto_8

    .line 234
    :cond_a
    invoke-virtual {v2, v10, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    :goto_8
    const-string v9, "centerColor"

    .line 239
    .line 240
    invoke-static {v3, v9}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v19

    .line 244
    invoke-static {v3, v9}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v9

    .line 248
    if-nez v9, :cond_b

    .line 249
    .line 250
    move v9, v10

    .line 251
    goto :goto_9

    .line 252
    :cond_b
    const/4 v9, 0x7

    .line 253
    invoke-virtual {v2, v9, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 254
    .line 255
    .line 256
    move-result v9

    .line 257
    :goto_9
    const-string v7, "endColor"

    .line 258
    .line 259
    invoke-static {v3, v7}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    if-nez v7, :cond_c

    .line 264
    .line 265
    move v7, v10

    .line 266
    goto :goto_a

    .line 267
    :cond_c
    const/4 v7, 0x1

    .line 268
    invoke-virtual {v2, v7, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 269
    .line 270
    .line 271
    move-result v21

    .line 272
    move/from16 v7, v21

    .line 273
    .line 274
    :goto_a
    const-string v10, "tileMode"

    .line 275
    .line 276
    invoke-static {v3, v10}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 277
    .line 278
    .line 279
    move-result v10

    .line 280
    if-nez v10, :cond_d

    .line 281
    .line 282
    move/from16 v22, v5

    .line 283
    .line 284
    const/4 v5, 0x0

    .line 285
    goto :goto_b

    .line 286
    :cond_d
    const/4 v10, 0x6

    .line 287
    move/from16 v22, v5

    .line 288
    .line 289
    const/4 v5, 0x0

    .line 290
    invoke-virtual {v2, v10, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 291
    .line 292
    .line 293
    move-result v10

    .line 294
    move v5, v10

    .line 295
    :goto_b
    const-string v10, "gradientRadius"

    .line 296
    .line 297
    invoke-static {v3, v10}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 298
    .line 299
    .line 300
    move-result v10

    .line 301
    if-nez v10, :cond_e

    .line 302
    .line 303
    move/from16 v23, v15

    .line 304
    .line 305
    const/4 v10, 0x0

    .line 306
    goto :goto_c

    .line 307
    :cond_e
    const/4 v10, 0x5

    .line 308
    move/from16 v23, v15

    .line 309
    .line 310
    const/4 v15, 0x0

    .line 311
    invoke-virtual {v2, v10, v15}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 312
    .line 313
    .line 314
    move-result v10

    .line 315
    :goto_c
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 316
    .line 317
    .line 318
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    const/4 v15, 0x1

    .line 323
    add-int/2addr v2, v15

    .line 324
    new-instance v15, Ljava/util/ArrayList;

    .line 325
    .line 326
    move/from16 v24, v10

    .line 327
    .line 328
    const/16 v10, 0x14

    .line 329
    .line 330
    invoke-direct {v15, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 331
    .line 332
    .line 333
    move/from16 v25, v14

    .line 334
    .line 335
    new-instance v14, Ljava/util/ArrayList;

    .line 336
    .line 337
    invoke-direct {v14, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 338
    .line 339
    .line 340
    :goto_d
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 341
    .line 342
    .line 343
    move-result v10

    .line 344
    move/from16 v26, v13

    .line 345
    .line 346
    const/4 v13, 0x1

    .line 347
    if-eq v10, v13, :cond_14

    .line 348
    .line 349
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 350
    .line 351
    .line 352
    move-result v13

    .line 353
    move/from16 v27, v12

    .line 354
    .line 355
    if-ge v13, v2, :cond_f

    .line 356
    .line 357
    const/4 v12, 0x3

    .line 358
    if-eq v10, v12, :cond_15

    .line 359
    .line 360
    :cond_f
    const/4 v12, 0x2

    .line 361
    if-eq v10, v12, :cond_11

    .line 362
    .line 363
    :cond_10
    :goto_e
    move/from16 v13, v26

    .line 364
    .line 365
    move/from16 v12, v27

    .line 366
    .line 367
    goto :goto_d

    .line 368
    :cond_11
    if-gt v13, v2, :cond_10

    .line 369
    .line 370
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v10

    .line 374
    const-string v12, "item"

    .line 375
    .line 376
    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v10

    .line 380
    if-nez v10, :cond_12

    .line 381
    .line 382
    goto :goto_e

    .line 383
    :cond_12
    sget-object v10, LLf;->e:[I

    .line 384
    .line 385
    invoke-static {v0, v1, v4, v10}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 386
    .line 387
    .line 388
    move-result-object v10

    .line 389
    const/4 v12, 0x0

    .line 390
    invoke-virtual {v10, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 391
    .line 392
    .line 393
    move-result v13

    .line 394
    const/4 v12, 0x1

    .line 395
    invoke-virtual {v10, v12}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 396
    .line 397
    .line 398
    move-result v20

    .line 399
    if-eqz v13, :cond_13

    .line 400
    .line 401
    if-eqz v20, :cond_13

    .line 402
    .line 403
    const/4 v13, 0x0

    .line 404
    invoke-virtual {v10, v13, v13}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 405
    .line 406
    .line 407
    move-result v21

    .line 408
    const/4 v13, 0x0

    .line 409
    invoke-virtual {v10, v12, v13}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 410
    .line 411
    .line 412
    move-result v28

    .line 413
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 414
    .line 415
    .line 416
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 417
    .line 418
    .line 419
    move-result-object v10

    .line 420
    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    invoke-static/range {v28 .. v28}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 424
    .line 425
    .line 426
    move-result-object v10

    .line 427
    invoke-virtual {v15, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    goto :goto_e

    .line 431
    :cond_13
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 432
    .line 433
    new-instance v1, Ljava/lang/StringBuilder;

    .line 434
    .line 435
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 436
    .line 437
    .line 438
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v2

    .line 442
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    const-string v2, ": <item> tag requires a \'color\' attribute and a \'offset\' attribute!"

    .line 446
    .line 447
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    throw v0

    .line 458
    :cond_14
    move/from16 v27, v12

    .line 459
    .line 460
    :cond_15
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    if-lez v0, :cond_16

    .line 465
    .line 466
    new-instance v0, LY1;

    .line 467
    .line 468
    invoke-direct {v0, v14, v15}, LY1;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 469
    .line 470
    .line 471
    goto :goto_f

    .line 472
    :cond_16
    const/4 v0, 0x0

    .line 473
    :goto_f
    if-eqz v0, :cond_17

    .line 474
    .line 475
    :goto_10
    const/4 v1, 0x1

    .line 476
    goto :goto_11

    .line 477
    :cond_17
    new-instance v0, LY1;

    .line 478
    .line 479
    if-eqz v19, :cond_18

    .line 480
    .line 481
    invoke-direct {v0, v6, v9, v7}, LY1;-><init>(III)V

    .line 482
    .line 483
    .line 484
    goto :goto_10

    .line 485
    :cond_18
    invoke-direct {v0, v6, v7}, LY1;-><init>(II)V

    .line 486
    .line 487
    .line 488
    goto :goto_10

    .line 489
    :goto_11
    if-eq v8, v1, :cond_1c

    .line 490
    .line 491
    const/4 v2, 0x2

    .line 492
    if-eq v8, v2, :cond_1b

    .line 493
    .line 494
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 495
    .line 496
    if-eq v5, v1, :cond_1a

    .line 497
    .line 498
    if-eq v5, v2, :cond_19

    .line 499
    .line 500
    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 501
    .line 502
    :goto_12
    move-object/from16 v17, v1

    .line 503
    .line 504
    goto :goto_13

    .line 505
    :cond_19
    sget-object v1, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 506
    .line 507
    goto :goto_12

    .line 508
    :cond_1a
    sget-object v1, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 509
    .line 510
    goto :goto_12

    .line 511
    :goto_13
    iget-object v1, v0, LY1;->d:Ljava/lang/Object;

    .line 512
    .line 513
    move-object v15, v1

    .line 514
    check-cast v15, [I

    .line 515
    .line 516
    iget-object v0, v0, LY1;->e:Ljava/lang/Object;

    .line 517
    .line 518
    move-object/from16 v16, v0

    .line 519
    .line 520
    check-cast v16, [F

    .line 521
    .line 522
    const/4 v1, 0x0

    .line 523
    move-object v10, v3

    .line 524
    move/from16 v12, v27

    .line 525
    .line 526
    move/from16 v13, v26

    .line 527
    .line 528
    move/from16 v14, v25

    .line 529
    .line 530
    invoke-direct/range {v10 .. v17}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 531
    .line 532
    .line 533
    goto :goto_16

    .line 534
    :cond_1b
    const/4 v1, 0x0

    .line 535
    new-instance v3, Landroid/graphics/SweepGradient;

    .line 536
    .line 537
    iget-object v2, v0, LY1;->d:Ljava/lang/Object;

    .line 538
    .line 539
    check-cast v2, [I

    .line 540
    .line 541
    iget-object v0, v0, LY1;->e:Ljava/lang/Object;

    .line 542
    .line 543
    check-cast v0, [F

    .line 544
    .line 545
    move/from16 v9, v22

    .line 546
    .line 547
    move/from16 v15, v23

    .line 548
    .line 549
    invoke-direct {v3, v9, v15, v2, v0}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 550
    .line 551
    .line 552
    goto :goto_16

    .line 553
    :cond_1c
    move/from16 v9, v22

    .line 554
    .line 555
    move/from16 v15, v23

    .line 556
    .line 557
    const/4 v1, 0x0

    .line 558
    const/4 v2, 0x0

    .line 559
    cmpg-float v2, v24, v2

    .line 560
    .line 561
    if-lez v2, :cond_1f

    .line 562
    .line 563
    new-instance v3, Landroid/graphics/RadialGradient;

    .line 564
    .line 565
    const/4 v2, 0x1

    .line 566
    if-eq v5, v2, :cond_1e

    .line 567
    .line 568
    const/4 v2, 0x2

    .line 569
    if-eq v5, v2, :cond_1d

    .line 570
    .line 571
    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 572
    .line 573
    :goto_14
    move-object/from16 v21, v2

    .line 574
    .line 575
    goto :goto_15

    .line 576
    :cond_1d
    sget-object v2, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 577
    .line 578
    goto :goto_14

    .line 579
    :cond_1e
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 580
    .line 581
    goto :goto_14

    .line 582
    :goto_15
    iget-object v2, v0, LY1;->d:Ljava/lang/Object;

    .line 583
    .line 584
    move-object/from16 v19, v2

    .line 585
    .line 586
    check-cast v19, [I

    .line 587
    .line 588
    iget-object v0, v0, LY1;->e:Ljava/lang/Object;

    .line 589
    .line 590
    move-object/from16 v20, v0

    .line 591
    .line 592
    check-cast v20, [F

    .line 593
    .line 594
    move v0, v15

    .line 595
    move-object v15, v3

    .line 596
    move/from16 v16, v9

    .line 597
    .line 598
    move/from16 v17, v0

    .line 599
    .line 600
    move/from16 v18, v24

    .line 601
    .line 602
    invoke-direct/range {v15 .. v21}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 603
    .line 604
    .line 605
    :goto_16
    new-instance v0, LU1;

    .line 606
    .line 607
    const/4 v2, 0x0

    .line 608
    invoke-direct {v0, v3, v2, v1}, LU1;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    .line 609
    .line 610
    .line 611
    return-object v0

    .line 612
    :cond_1f
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 613
    .line 614
    const-string v1, "<gradient> tag requires \'gradientRadius\' attribute with radial type"

    .line 615
    .line 616
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    throw v0

    .line 620
    :cond_20
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 621
    .line 622
    new-instance v1, Ljava/lang/StringBuilder;

    .line 623
    .line 624
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 625
    .line 626
    .line 627
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v2

    .line 631
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 632
    .line 633
    .line 634
    const-string v2, ": invalid gradient color tag "

    .line 635
    .line 636
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 637
    .line 638
    .line 639
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 640
    .line 641
    .line 642
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 643
    .line 644
    .line 645
    move-result-object v1

    .line 646
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 647
    .line 648
    .line 649
    throw v0

    .line 650
    :cond_21
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 651
    .line 652
    const-string v1, "No start tag found"

    .line 653
    .line 654
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 655
    .line 656
    .line 657
    throw v0
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, LU1;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/widget/ImageView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, LX6;->a(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v2, p0, LU1;->c:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Lsi;

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v1, v2, v0}, LP1;->d(Landroid/graphics/drawable/Drawable;Lsi;[I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, LU1;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/graphics/Shader;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, LU1;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Landroid/content/res/ColorStateList;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    return v0
.end method

.method public d(Landroid/util/AttributeSet;I)V
    .locals 9

    .line 1
    iget-object v0, p0, LU1;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/widget/ImageView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v3, LNf;->f:[I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v1, p1, v3, p2, v2}, LN2;->o(Landroid/content/Context;Landroid/util/AttributeSet;[III)LN2;

    .line 13
    .line 14
    .line 15
    move-result-object v8

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v7, 0x0

    .line 21
    iget-object v1, v8, LN2;->a:Ljava/lang/Object;

    .line 22
    .line 23
    move-object v5, v1

    .line 24
    check-cast v5, Landroid/content/res/TypedArray;

    .line 25
    .line 26
    move-object v1, v0

    .line 27
    move-object v4, p1

    .line 28
    move v6, p2

    .line 29
    invoke-static/range {v1 .. v7}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    const/4 p2, -0x1

    .line 37
    iget-object v1, v8, LN2;->a:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v1, Landroid/content/res/TypedArray;

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    :try_start_1
    invoke-virtual {v1, v2, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eq v2, p2, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1, v2}, LMk;->q(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    :goto_0
    if-eqz p1, :cond_1

    .line 67
    .line 68
    invoke-static {p1}, LX6;->a(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    const/4 p1, 0x2

    .line 72
    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_2

    .line 77
    .line 78
    invoke-virtual {v8, p1}, LN2;->i(I)Landroid/content/res/ColorStateList;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    const/4 p1, 0x3

    .line 86
    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_3

    .line 91
    .line 92
    invoke-virtual {v1, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    const/4 p2, 0x0

    .line 97
    invoke-static {p1, p2}, LX6;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageTintMode(Landroid/graphics/PorterDuff$Mode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    .line 103
    .line 104
    :cond_3
    invoke-virtual {v8}, LN2;->p()V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :goto_1
    invoke-virtual {v8}, LN2;->p()V

    .line 109
    .line 110
    .line 111
    throw p1
.end method
