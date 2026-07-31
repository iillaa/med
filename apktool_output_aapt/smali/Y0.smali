.class public final LY0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# static fields
.field public static final synthetic v:I


# instance fields
.field public c:LV0;

.field public d:Landroid/graphics/Rect;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/Drawable;

.field public g:I

.field public h:Z

.field public i:I

.field public j:Z

.field public k:Lj3;

.field public l:J

.field public m:J

.field public n:LZ0;

.field public o:LV0;

.field public p:Z

.field public q:LV0;

.field public r:Lu6;

.field public s:I

.field public t:I

.field public u:Z


# direct methods
.method public constructor <init>(LV0;Landroid/content/res/Resources;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xff

    .line 5
    .line 6
    iput v0, p0, LY0;->g:I

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, LY0;->i:I

    .line 10
    .line 11
    iput v0, p0, LY0;->s:I

    .line 12
    .line 13
    iput v0, p0, LY0;->t:I

    .line 14
    .line 15
    new-instance v0, LV0;

    .line 16
    .line 17
    invoke-direct {v0, p1, p0, p2}, LV0;-><init>(LV0;LY0;Landroid/content/res/Resources;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, LY0;->i(LV0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, LY0;->onStateChange([I)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, LY0;->jumpToCurrentState()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static c(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)LY0;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object/from16 v4, p4

    .line 10
    .line 11
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    const-string v6, "animated-selector"

    .line 16
    .line 17
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    if-eqz v6, :cond_1b

    .line 22
    .line 23
    new-instance v5, LY0;

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-direct {v5, v6, v6}, LY0;-><init>(LV0;Landroid/content/res/Resources;)V

    .line 27
    .line 28
    .line 29
    sget-object v7, LJf;->a:[I

    .line 30
    .line 31
    invoke-static {v1, v4, v3, v7}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    const/4 v8, 0x1

    .line 36
    invoke-virtual {v7, v8, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    invoke-virtual {v5, v9, v8}, LY0;->setVisible(ZZ)Z

    .line 41
    .line 42
    .line 43
    iget-object v9, v5, LY0;->q:LV0;

    .line 44
    .line 45
    iget v10, v9, LV0;->d:I

    .line 46
    .line 47
    invoke-static {v7}, LF4;->b(Landroid/content/res/TypedArray;)I

    .line 48
    .line 49
    .line 50
    move-result v11

    .line 51
    or-int/2addr v10, v11

    .line 52
    iput v10, v9, LV0;->d:I

    .line 53
    .line 54
    iget-boolean v10, v9, LV0;->i:Z

    .line 55
    .line 56
    const/4 v11, 0x2

    .line 57
    invoke-virtual {v7, v11, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 58
    .line 59
    .line 60
    move-result v10

    .line 61
    iput-boolean v10, v9, LV0;->i:Z

    .line 62
    .line 63
    iget-boolean v10, v9, LV0;->l:Z

    .line 64
    .line 65
    const/4 v12, 0x3

    .line 66
    invoke-virtual {v7, v12, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 67
    .line 68
    .line 69
    move-result v10

    .line 70
    iput-boolean v10, v9, LV0;->l:Z

    .line 71
    .line 72
    iget v10, v9, LV0;->y:I

    .line 73
    .line 74
    const/4 v13, 0x4

    .line 75
    invoke-virtual {v7, v13, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 76
    .line 77
    .line 78
    move-result v10

    .line 79
    iput v10, v9, LV0;->y:I

    .line 80
    .line 81
    const/4 v10, 0x5

    .line 82
    iget v14, v9, LV0;->z:I

    .line 83
    .line 84
    invoke-virtual {v7, v10, v14}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    iput v10, v9, LV0;->z:I

    .line 89
    .line 90
    iget-boolean v9, v9, LV0;->w:Z

    .line 91
    .line 92
    const/4 v10, 0x0

    .line 93
    invoke-virtual {v7, v10, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 94
    .line 95
    .line 96
    move-result v9

    .line 97
    invoke-virtual {v5, v9}, LY0;->setDither(Z)V

    .line 98
    .line 99
    .line 100
    iget-object v9, v5, LY0;->c:LV0;

    .line 101
    .line 102
    if-eqz v1, :cond_1

    .line 103
    .line 104
    iput-object v1, v9, LV0;->b:Landroid/content/res/Resources;

    .line 105
    .line 106
    invoke-virtual/range {p1 .. p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    iget v14, v14, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 111
    .line 112
    if-nez v14, :cond_0

    .line 113
    .line 114
    const/16 v14, 0xa0

    .line 115
    .line 116
    :cond_0
    iget v15, v9, LV0;->c:I

    .line 117
    .line 118
    iput v14, v9, LV0;->c:I

    .line 119
    .line 120
    if-eq v15, v14, :cond_2

    .line 121
    .line 122
    iput-boolean v10, v9, LV0;->m:Z

    .line 123
    .line 124
    iput-boolean v10, v9, LV0;->j:Z

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    .line 129
    .line 130
    :cond_2
    :goto_0
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 131
    .line 132
    .line 133
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    add-int/2addr v7, v8

    .line 138
    :goto_1
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 139
    .line 140
    .line 141
    move-result v9

    .line 142
    if-eq v9, v8, :cond_1a

    .line 143
    .line 144
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 145
    .line 146
    .line 147
    move-result v14

    .line 148
    if-ge v14, v7, :cond_3

    .line 149
    .line 150
    if-eq v9, v12, :cond_1a

    .line 151
    .line 152
    :cond_3
    if-eq v9, v11, :cond_4

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_4
    if-le v14, v7, :cond_5

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_5
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v9

    .line 162
    const-string v14, "item"

    .line 163
    .line 164
    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    const/4 v14, -0x1

    .line 169
    if-eqz v9, :cond_f

    .line 170
    .line 171
    sget-object v9, LJf;->b:[I

    .line 172
    .line 173
    invoke-static {v1, v4, v3, v9}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 174
    .line 175
    .line 176
    move-result-object v9

    .line 177
    invoke-virtual {v9, v10, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 178
    .line 179
    .line 180
    move-result v15

    .line 181
    invoke-virtual {v9, v8, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    if-lez v14, :cond_6

    .line 186
    .line 187
    invoke-static {}, Lig;->d()Lig;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    invoke-virtual {v6, v0, v14}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    goto :goto_2

    .line 196
    :cond_6
    const/4 v6, 0x0

    .line 197
    :goto_2
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    .line 198
    .line 199
    .line 200
    invoke-interface/range {p3 .. p3}, Landroid/util/AttributeSet;->getAttributeCount()I

    .line 201
    .line 202
    .line 203
    move-result v9

    .line 204
    new-array v14, v9, [I

    .line 205
    .line 206
    move v8, v10

    .line 207
    move v12, v8

    .line 208
    :goto_3
    if-ge v12, v9, :cond_9

    .line 209
    .line 210
    invoke-interface {v3, v12}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    .line 211
    .line 212
    .line 213
    move-result v11

    .line 214
    if-eqz v11, :cond_8

    .line 215
    .line 216
    const v13, 0x10100d0

    .line 217
    .line 218
    .line 219
    if-eq v11, v13, :cond_8

    .line 220
    .line 221
    const v13, 0x1010199

    .line 222
    .line 223
    .line 224
    if-eq v11, v13, :cond_8

    .line 225
    .line 226
    add-int/lit8 v13, v8, 0x1

    .line 227
    .line 228
    invoke-interface {v3, v12, v10}, Landroid/util/AttributeSet;->getAttributeBooleanValue(IZ)Z

    .line 229
    .line 230
    .line 231
    move-result v16

    .line 232
    if-eqz v16, :cond_7

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_7
    neg-int v11, v11

    .line 236
    :goto_4
    aput v11, v14, v8

    .line 237
    .line 238
    move v8, v13

    .line 239
    :cond_8
    add-int/lit8 v12, v12, 0x1

    .line 240
    .line 241
    const/4 v11, 0x2

    .line 242
    const/4 v13, 0x4

    .line 243
    goto :goto_3

    .line 244
    :cond_9
    invoke-static {v14, v8}, Landroid/util/StateSet;->trimStateSet([II)[I

    .line 245
    .line 246
    .line 247
    move-result-object v8

    .line 248
    const-string v9, ": <item> tag requires a \'drawable\' attribute or child tag defining a drawable"

    .line 249
    .line 250
    if-nez v6, :cond_d

    .line 251
    .line 252
    :goto_5
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 253
    .line 254
    .line 255
    move-result v6

    .line 256
    const/4 v11, 0x4

    .line 257
    if-ne v6, v11, :cond_a

    .line 258
    .line 259
    goto :goto_5

    .line 260
    :cond_a
    const/4 v11, 0x2

    .line 261
    if-ne v6, v11, :cond_c

    .line 262
    .line 263
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v6

    .line 267
    const-string v11, "vector"

    .line 268
    .line 269
    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v6

    .line 273
    if-eqz v6, :cond_b

    .line 274
    .line 275
    new-instance v6, Lsj;

    .line 276
    .line 277
    invoke-direct {v6}, Lsj;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v6, v1, v2, v3, v4}, Lsj;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 281
    .line 282
    .line 283
    goto :goto_6

    .line 284
    :cond_b
    invoke-static/range {p1 .. p4}, LF4;->a(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 285
    .line 286
    .line 287
    move-result-object v6

    .line 288
    goto :goto_6

    .line 289
    :cond_c
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 290
    .line 291
    new-instance v1, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    throw v0

    .line 314
    :cond_d
    :goto_6
    if-eqz v6, :cond_e

    .line 315
    .line 316
    iget-object v9, v5, LY0;->q:LV0;

    .line 317
    .line 318
    invoke-virtual {v9, v6}, LV0;->a(Landroid/graphics/drawable/Drawable;)I

    .line 319
    .line 320
    .line 321
    move-result v6

    .line 322
    iget-object v11, v9, LV0;->H:[[I

    .line 323
    .line 324
    aput-object v8, v11, v6

    .line 325
    .line 326
    iget-object v8, v9, LV0;->J:Lnh;

    .line 327
    .line 328
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 329
    .line 330
    .line 331
    move-result-object v9

    .line 332
    invoke-virtual {v8, v6, v9}, Lnh;->c(ILjava/lang/Object;)V

    .line 333
    .line 334
    .line 335
    :goto_7
    const/4 v6, 0x0

    .line 336
    const/4 v8, 0x1

    .line 337
    :goto_8
    const/4 v11, 0x2

    .line 338
    const/4 v12, 0x3

    .line 339
    const/4 v13, 0x4

    .line 340
    goto/16 :goto_1

    .line 341
    .line 342
    :cond_e
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 343
    .line 344
    new-instance v1, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 347
    .line 348
    .line 349
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    throw v0

    .line 367
    :cond_f
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v6

    .line 371
    const-string v8, "transition"

    .line 372
    .line 373
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result v6

    .line 377
    if-eqz v6, :cond_19

    .line 378
    .line 379
    sget-object v6, LJf;->c:[I

    .line 380
    .line 381
    invoke-static {v1, v4, v3, v6}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 382
    .line 383
    .line 384
    move-result-object v6

    .line 385
    const/4 v8, 0x2

    .line 386
    invoke-virtual {v6, v8, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 387
    .line 388
    .line 389
    move-result v9

    .line 390
    const/4 v8, 0x1

    .line 391
    invoke-virtual {v6, v8, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 392
    .line 393
    .line 394
    move-result v11

    .line 395
    invoke-virtual {v6, v10, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 396
    .line 397
    .line 398
    move-result v12

    .line 399
    if-lez v12, :cond_10

    .line 400
    .line 401
    invoke-static {}, Lig;->d()Lig;

    .line 402
    .line 403
    .line 404
    move-result-object v13

    .line 405
    invoke-virtual {v13, v0, v12}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 406
    .line 407
    .line 408
    move-result-object v12

    .line 409
    :goto_9
    const/4 v13, 0x3

    .line 410
    goto :goto_a

    .line 411
    :cond_10
    const/4 v12, 0x0

    .line 412
    goto :goto_9

    .line 413
    :goto_a
    invoke-virtual {v6, v13, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 414
    .line 415
    .line 416
    move-result v15

    .line 417
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 418
    .line 419
    .line 420
    const-string v6, ": <transition> tag requires a \'drawable\' attribute or child tag defining a drawable"

    .line 421
    .line 422
    if-nez v12, :cond_14

    .line 423
    .line 424
    :goto_b
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 425
    .line 426
    .line 427
    move-result v12

    .line 428
    const/4 v8, 0x4

    .line 429
    if-ne v12, v8, :cond_11

    .line 430
    .line 431
    const/4 v8, 0x1

    .line 432
    goto :goto_b

    .line 433
    :cond_11
    const/4 v8, 0x2

    .line 434
    if-ne v12, v8, :cond_13

    .line 435
    .line 436
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v12

    .line 440
    const-string v8, "animated-vector"

    .line 441
    .line 442
    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    move-result v8

    .line 446
    if-eqz v8, :cond_12

    .line 447
    .line 448
    new-instance v12, Lc1;

    .line 449
    .line 450
    invoke-direct {v12, v0}, Lc1;-><init>(Landroid/content/Context;)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v12, v1, v2, v3, v4}, Lc1;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 454
    .line 455
    .line 456
    goto :goto_c

    .line 457
    :cond_12
    invoke-static/range {p1 .. p4}, LF4;->a(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 458
    .line 459
    .line 460
    move-result-object v12

    .line 461
    goto :goto_c

    .line 462
    :cond_13
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 463
    .line 464
    new-instance v1, Ljava/lang/StringBuilder;

    .line 465
    .line 466
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 467
    .line 468
    .line 469
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v2

    .line 473
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v1

    .line 483
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    throw v0

    .line 487
    :cond_14
    :goto_c
    if-eqz v12, :cond_18

    .line 488
    .line 489
    if-eq v9, v14, :cond_17

    .line 490
    .line 491
    if-eq v11, v14, :cond_17

    .line 492
    .line 493
    iget-object v6, v5, LY0;->q:LV0;

    .line 494
    .line 495
    invoke-virtual {v6, v12}, LV0;->a(Landroid/graphics/drawable/Drawable;)I

    .line 496
    .line 497
    .line 498
    move-result v8

    .line 499
    int-to-long v13, v9

    .line 500
    const/16 v9, 0x20

    .line 501
    .line 502
    shl-long v16, v13, v9

    .line 503
    .line 504
    int-to-long v11, v11

    .line 505
    or-long v9, v16, v11

    .line 506
    .line 507
    if-eqz v15, :cond_15

    .line 508
    .line 509
    const-wide v16, 0x200000000L

    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    goto :goto_d

    .line 515
    :cond_15
    const-wide/16 v16, 0x0

    .line 516
    .line 517
    :goto_d
    iget-object v0, v6, LV0;->I:LFd;

    .line 518
    .line 519
    int-to-long v1, v8

    .line 520
    or-long v18, v1, v16

    .line 521
    .line 522
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 523
    .line 524
    .line 525
    move-result-object v8

    .line 526
    invoke-virtual {v0, v9, v10, v8}, LFd;->a(JLjava/lang/Long;)V

    .line 527
    .line 528
    .line 529
    if-eqz v15, :cond_16

    .line 530
    .line 531
    const/16 v0, 0x20

    .line 532
    .line 533
    shl-long v8, v11, v0

    .line 534
    .line 535
    or-long/2addr v8, v13

    .line 536
    iget-object v0, v6, LV0;->I:LFd;

    .line 537
    .line 538
    const-wide v10, 0x100000000L

    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    or-long/2addr v1, v10

    .line 544
    or-long v1, v1, v16

    .line 545
    .line 546
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    invoke-virtual {v0, v8, v9, v1}, LFd;->a(JLjava/lang/Long;)V

    .line 551
    .line 552
    .line 553
    :cond_16
    move-object/from16 v0, p0

    .line 554
    .line 555
    move-object/from16 v1, p1

    .line 556
    .line 557
    move-object/from16 v2, p2

    .line 558
    .line 559
    const/4 v6, 0x0

    .line 560
    const/4 v8, 0x1

    .line 561
    const/4 v10, 0x0

    .line 562
    goto/16 :goto_8

    .line 563
    .line 564
    :cond_17
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 565
    .line 566
    new-instance v1, Ljava/lang/StringBuilder;

    .line 567
    .line 568
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 569
    .line 570
    .line 571
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object v2

    .line 575
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    const-string v2, ": <transition> tag requires \'fromId\' & \'toId\' attributes"

    .line 579
    .line 580
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 581
    .line 582
    .line 583
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v1

    .line 587
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    throw v0

    .line 591
    :cond_18
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 592
    .line 593
    new-instance v1, Ljava/lang/StringBuilder;

    .line 594
    .line 595
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 596
    .line 597
    .line 598
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object v2

    .line 602
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 603
    .line 604
    .line 605
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 609
    .line 610
    .line 611
    move-result-object v1

    .line 612
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 613
    .line 614
    .line 615
    throw v0

    .line 616
    :cond_19
    move-object/from16 v0, p0

    .line 617
    .line 618
    move-object/from16 v1, p1

    .line 619
    .line 620
    move-object/from16 v2, p2

    .line 621
    .line 622
    goto/16 :goto_7

    .line 623
    .line 624
    :cond_1a
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 625
    .line 626
    .line 627
    move-result-object v0

    .line 628
    invoke-virtual {v5, v0}, LY0;->onStateChange([I)Z

    .line 629
    .line 630
    .line 631
    return-object v5

    .line 632
    :cond_1b
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 633
    .line 634
    new-instance v1, Ljava/lang/StringBuilder;

    .line 635
    .line 636
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 637
    .line 638
    .line 639
    invoke-interface/range {p2 .. p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 644
    .line 645
    .line 646
    const-string v2, ": invalid animated-selector tag "

    .line 647
    .line 648
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    .line 650
    .line 651
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    .line 653
    .line 654
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v1

    .line 658
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 659
    .line 660
    .line 661
    throw v0
.end method


# virtual methods
.method public final a(Z)V
    .locals 13

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LY0;->h:Z

    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    iget-object v3, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    const-wide/16 v4, 0xff

    .line 11
    .line 12
    const-wide/16 v6, 0x0

    .line 13
    .line 14
    const/4 v8, 0x0

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-wide v9, p0, LY0;->l:J

    .line 18
    .line 19
    cmp-long v11, v9, v6

    .line 20
    .line 21
    if-eqz v11, :cond_2

    .line 22
    .line 23
    cmp-long v11, v9, v1

    .line 24
    .line 25
    if-gtz v11, :cond_1

    .line 26
    .line 27
    iget v9, p0, LY0;->g:I

    .line 28
    .line 29
    invoke-virtual {v3, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iput-wide v6, p0, LY0;->l:J

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sub-long/2addr v9, v1

    .line 36
    mul-long/2addr v9, v4

    .line 37
    long-to-int v9, v9

    .line 38
    iget-object v10, p0, LY0;->c:LV0;

    .line 39
    .line 40
    iget v10, v10, LV0;->y:I

    .line 41
    .line 42
    div-int/2addr v9, v10

    .line 43
    rsub-int v9, v9, 0xff

    .line 44
    .line 45
    iget v10, p0, LY0;->g:I

    .line 46
    .line 47
    mul-int/2addr v9, v10

    .line 48
    div-int/lit16 v9, v9, 0xff

    .line 49
    .line 50
    invoke-virtual {v3, v9}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 51
    .line 52
    .line 53
    move v3, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    :goto_0
    move v3, v8

    .line 56
    :goto_1
    iget-object v9, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    if-eqz v9, :cond_3

    .line 59
    .line 60
    iget-wide v10, p0, LY0;->m:J

    .line 61
    .line 62
    cmp-long v12, v10, v6

    .line 63
    .line 64
    if-eqz v12, :cond_5

    .line 65
    .line 66
    cmp-long v12, v10, v1

    .line 67
    .line 68
    if-gtz v12, :cond_4

    .line 69
    .line 70
    invoke-virtual {v9, v8, v8}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 71
    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    iput-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    :cond_3
    iput-wide v6, p0, LY0;->m:J

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_4
    sub-long/2addr v10, v1

    .line 80
    mul-long/2addr v10, v4

    .line 81
    long-to-int v3, v10

    .line 82
    iget-object v4, p0, LY0;->c:LV0;

    .line 83
    .line 84
    iget v4, v4, LV0;->z:I

    .line 85
    .line 86
    div-int/2addr v3, v4

    .line 87
    iget v4, p0, LY0;->g:I

    .line 88
    .line 89
    mul-int/2addr v3, v4

    .line 90
    div-int/lit16 v3, v3, 0xff

    .line 91
    .line 92
    invoke-virtual {v9, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_5
    :goto_2
    move v0, v3

    .line 97
    :goto_3
    if-eqz p1, :cond_6

    .line 98
    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    iget-object p1, p0, LY0;->k:Lj3;

    .line 102
    .line 103
    const-wide/16 v3, 0x10

    .line 104
    .line 105
    add-long/2addr v1, v3

    .line 106
    invoke-virtual {p0, p1, v1, v2}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 107
    .line 108
    .line 109
    :cond_6
    return-void
.end method

.method public final applyTheme(Landroid/content/res/Resources$Theme;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LY0;->b(Landroid/content/res/Resources$Theme;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, LY0;->onStateChange([I)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b(Landroid/content/res/Resources$Theme;)V
    .locals 7

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, LV0;->c()V

    .line 6
    .line 7
    .line 8
    iget v1, v0, LV0;->h:I

    .line 9
    .line 10
    iget-object v2, v0, LV0;->g:[Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v4, v1, :cond_1

    .line 15
    .line 16
    aget-object v5, v2, v4

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->canApplyTheme()Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    aget-object v5, v2, v4

    .line 27
    .line 28
    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->applyTheme(Landroid/content/res/Resources$Theme;)V

    .line 29
    .line 30
    .line 31
    iget v5, v0, LV0;->e:I

    .line 32
    .line 33
    aget-object v6, v2, v4

    .line 34
    .line 35
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    or-int/2addr v5, v6

    .line 40
    iput v5, v0, LV0;->e:I

    .line 41
    .line 42
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/Resources$Theme;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    iput-object p1, v0, LV0;->b:Landroid/content/res/Resources;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 58
    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    const/16 p1, 0xa0

    .line 62
    .line 63
    :cond_2
    iget v1, v0, LV0;->c:I

    .line 64
    .line 65
    iput p1, v0, LV0;->c:I

    .line 66
    .line 67
    if-eq v1, p1, :cond_4

    .line 68
    .line 69
    iput-boolean v3, v0, LV0;->m:Z

    .line 70
    .line 71
    iput-boolean v3, v0, LV0;->j:Z

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_1
    return-void
.end method

.method public final canApplyTheme()Z
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    invoke-virtual {v0}, LV0;->canApplyTheme()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public final d(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    iget-object v0, p0, LY0;->n:LZ0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LZ0;

    .line 6
    .line 7
    invoke-direct {v0}, LZ0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LY0;->n:LZ0;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, LY0;->n:LZ0;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, LZ0;->d:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    :try_start_0
    iget-object v1, p0, LY0;->c:LV0;

    .line 25
    .line 26
    iget v1, v1, LV0;->y:I

    .line 27
    .line 28
    if-gtz v1, :cond_1

    .line 29
    .line 30
    iget-boolean v1, p0, LY0;->h:Z

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget v1, p0, LY0;->g:I

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v1

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    :goto_0
    iget-object v1, p0, LY0;->c:LV0;

    .line 43
    .line 44
    iget-boolean v2, v1, LV0;->C:Z

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v1, v1, LV0;->B:Landroid/graphics/ColorFilter;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-boolean v2, v1, LV0;->F:Z

    .line 55
    .line 56
    if-eqz v2, :cond_3

    .line 57
    .line 58
    iget-object v1, v1, LV0;->D:Landroid/content/res/ColorStateList;

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget-object v1, p0, LY0;->c:LV0;

    .line 64
    .line 65
    iget-boolean v2, v1, LV0;->G:Z

    .line 66
    .line 67
    if-eqz v2, :cond_4

    .line 68
    .line 69
    iget-object v1, v1, LV0;->E:Landroid/graphics/PorterDuff$Mode;

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    :goto_1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-virtual {p1, v1, v2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, LY0;->c:LV0;

    .line 83
    .line 84
    iget-boolean v1, v1, LV0;->w:Z

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, LY0;->c:LV0;

    .line 118
    .line 119
    iget-boolean v1, v1, LV0;->A:Z

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, LY0;->d:Landroid/graphics/Rect;

    .line 125
    .line 126
    if-eqz v1, :cond_5

    .line 127
    .line 128
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 129
    .line 130
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 131
    .line 132
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 133
    .line 134
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 135
    .line 136
    invoke-virtual {p1, v2, v3, v4, v1}, Landroid/graphics/drawable/Drawable;->setHotspotBounds(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .line 138
    .line 139
    :cond_5
    iget-object v1, p0, LY0;->n:LZ0;

    .line 140
    .line 141
    iget-object v2, v1, LZ0;->d:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v2, Landroid/graphics/drawable/Drawable$Callback;

    .line 144
    .line 145
    iput-object v0, v1, LZ0;->d:Ljava/lang/Object;

    .line 146
    .line 147
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :goto_2
    iget-object v2, p0, LY0;->n:LZ0;

    .line 152
    .line 153
    iget-object v3, v2, LZ0;->d:Ljava/lang/Object;

    .line 154
    .line 155
    check-cast v3, Landroid/graphics/drawable/Drawable$Callback;

    .line 156
    .line 157
    iput-object v0, v2, LZ0;->d:Ljava/lang/Object;

    .line 158
    .line 159
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 160
    .line 161
    .line 162
    throw v1
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final e()V
    .locals 6

    .line 1
    iget-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 20
    .line 21
    .line 22
    iget-boolean v2, p0, LY0;->h:Z

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    iget v3, p0, LY0;->g:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-wide v2, p0, LY0;->m:J

    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    cmp-long v2, v2, v4

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iput-wide v4, p0, LY0;->m:J

    .line 42
    .line 43
    move v0, v1

    .line 44
    :cond_2
    iget-wide v2, p0, LY0;->l:J

    .line 45
    .line 46
    cmp-long v2, v2, v4

    .line 47
    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    iput-wide v4, p0, LY0;->l:J

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move v1, v0

    .line 54
    :goto_1
    if-eqz v1, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 57
    .line 58
    .line 59
    :cond_4
    return-void
.end method

.method public final f()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-boolean v0, p0, LY0;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LY0;->g()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LY0;->o:LV0;

    .line 9
    .line 10
    iget-object v1, v0, LV0;->I:LFd;

    .line 11
    .line 12
    invoke-virtual {v1}, LFd;->b()LFd;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, LV0;->I:LFd;

    .line 17
    .line 18
    iget-object v1, v0, LV0;->J:Lnh;

    .line 19
    .line 20
    invoke-virtual {v1}, Lnh;->b()Lnh;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, LV0;->J:Lnh;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, LY0;->p:Z

    .line 28
    .line 29
    :cond_0
    return-object p0
.end method

.method public final g()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-boolean v0, p0, LY0;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    new-instance v0, LV0;

    .line 12
    .line 13
    iget-object v1, p0, LY0;->q:LV0;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, p0, v2}, LV0;-><init>(LV0;LY0;Landroid/content/res/Resources;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, v0, LV0;->I:LFd;

    .line 20
    .line 21
    invoke-virtual {v1}, LFd;->b()LFd;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, LV0;->I:LFd;

    .line 26
    .line 27
    iget-object v1, v0, LV0;->J:Lnh;

    .line 28
    .line 29
    invoke-virtual {v1}, Lnh;->b()Lnh;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, LV0;->J:Lnh;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, LY0;->i(LV0;)V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, LY0;->j:Z

    .line 40
    .line 41
    :cond_0
    return-object p0
.end method

.method public final getAlpha()I
    .locals 1

    .line 1
    iget v0, p0, LY0;->g:I

    .line 2
    .line 3
    return v0
.end method

.method public final getChangingConfigurations()I
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, LY0;->c:LV0;

    .line 6
    .line 7
    invoke-virtual {v1}, LV0;->getChangingConfigurations()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    or-int/2addr v0, v1

    .line 12
    return v0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 7

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->u:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-boolean v0, v0, LV0;->v:Z

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v0}, LV0;->c()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, v0, LV0;->u:Z

    .line 15
    .line 16
    iget v2, v0, LV0;->h:I

    .line 17
    .line 18
    iget-object v3, v0, LV0;->g:[Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    move v5, v4

    .line 22
    :goto_0
    if-ge v5, v2, :cond_2

    .line 23
    .line 24
    aget-object v6, v3, v5

    .line 25
    .line 26
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    if-nez v6, :cond_1

    .line 31
    .line 32
    iput-boolean v4, v0, LV0;->v:Z

    .line 33
    .line 34
    move v0, v4

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iput-boolean v1, v0, LV0;->v:Z

    .line 40
    .line 41
    move v0, v1

    .line 42
    :goto_1
    if-eqz v0, :cond_3

    .line 43
    .line 44
    iget-object v0, p0, LY0;->c:LV0;

    .line 45
    .line 46
    invoke-virtual {p0}, LY0;->getChangingConfigurations()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, v0, LV0;->d:I

    .line 51
    .line 52
    iget-object v0, p0, LY0;->c:LV0;

    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_3
    const/4 v0, 0x0

    .line 56
    return-object v0
.end method

.method public final getCurrent()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object v0
.end method

.method public final getHotspotBounds(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getHotspotBounds(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    :goto_0
    return-void
.end method

.method public final getIntrinsicHeight()I
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v1, v0, LV0;->m:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, LV0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, v0, LV0;->o:I

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, -0x1

    .line 27
    :goto_0
    return v0
.end method

.method public final getIntrinsicWidth()I
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v1, v0, LV0;->m:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, LV0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, v0, LV0;->n:I

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, -0x1

    .line 27
    :goto_0
    return v0
.end method

.method public final getMinimumHeight()I
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v1, v0, LV0;->m:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, LV0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, v0, LV0;->q:I

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, 0x0

    .line 27
    :goto_0
    return v0
.end method

.method public final getMinimumWidth()I
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->l:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-boolean v1, v0, LV0;->m:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, LV0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, v0, LV0;->p:I

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const/4 v0, 0x0

    .line 27
    :goto_0
    return v0
.end method

.method public final getOpacity()I
    .locals 7

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p0, LY0;->c:LV0;

    .line 14
    .line 15
    iget-boolean v2, v0, LV0;->r:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget v0, v0, LV0;->s:I

    .line 20
    .line 21
    move v1, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-virtual {v0}, LV0;->c()V

    .line 24
    .line 25
    .line 26
    iget v2, v0, LV0;->h:I

    .line 27
    .line 28
    iget-object v3, v0, LV0;->g:[Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    if-lez v2, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    aget-object v1, v3, v1

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    :cond_2
    const/4 v4, 0x1

    .line 40
    move v5, v4

    .line 41
    :goto_0
    if-ge v5, v2, :cond_3

    .line 42
    .line 43
    aget-object v6, v3, v5

    .line 44
    .line 45
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    invoke-static {v1, v6}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iput v1, v0, LV0;->s:I

    .line 57
    .line 58
    iput-boolean v4, v0, LV0;->r:Z

    .line 59
    .line 60
    :cond_4
    :goto_1
    return v1
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getOutline(Landroid/graphics/Outline;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final getPadding(Landroid/graphics/Rect;)Z
    .locals 10

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->i:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    iget-object v1, v0, LV0;->k:Landroid/graphics/Rect;

    .line 12
    .line 13
    if-nez v1, :cond_8

    .line 14
    .line 15
    iget-boolean v5, v0, LV0;->j:Z

    .line 16
    .line 17
    if-eqz v5, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    invoke-virtual {v0}, LV0;->c()V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    iget v5, v0, LV0;->h:I

    .line 29
    .line 30
    iget-object v6, v0, LV0;->g:[Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    move v7, v2

    .line 33
    :goto_0
    if-ge v7, v5, :cond_7

    .line 34
    .line 35
    aget-object v8, v6, v7

    .line 36
    .line 37
    invoke-virtual {v8, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 38
    .line 39
    .line 40
    move-result v8

    .line 41
    if-eqz v8, :cond_6

    .line 42
    .line 43
    if-nez v4, :cond_2

    .line 44
    .line 45
    new-instance v4, Landroid/graphics/Rect;

    .line 46
    .line 47
    invoke-direct {v4, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget v8, v1, Landroid/graphics/Rect;->left:I

    .line 51
    .line 52
    iget v9, v4, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    if-le v8, v9, :cond_3

    .line 55
    .line 56
    iput v8, v4, Landroid/graphics/Rect;->left:I

    .line 57
    .line 58
    :cond_3
    iget v8, v1, Landroid/graphics/Rect;->top:I

    .line 59
    .line 60
    iget v9, v4, Landroid/graphics/Rect;->top:I

    .line 61
    .line 62
    if-le v8, v9, :cond_4

    .line 63
    .line 64
    iput v8, v4, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    :cond_4
    iget v8, v1, Landroid/graphics/Rect;->right:I

    .line 67
    .line 68
    iget v9, v4, Landroid/graphics/Rect;->right:I

    .line 69
    .line 70
    if-le v8, v9, :cond_5

    .line 71
    .line 72
    iput v8, v4, Landroid/graphics/Rect;->right:I

    .line 73
    .line 74
    :cond_5
    iget v8, v1, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    iget v9, v4, Landroid/graphics/Rect;->bottom:I

    .line 77
    .line 78
    if-le v8, v9, :cond_6

    .line 79
    .line 80
    iput v8, v4, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_7
    iput-boolean v3, v0, LV0;->j:Z

    .line 86
    .line 87
    iput-object v4, v0, LV0;->k:Landroid/graphics/Rect;

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_8
    :goto_1
    move-object v4, v1

    .line 91
    :goto_2
    if-eqz v4, :cond_9

    .line 92
    .line 93
    invoke-virtual {p1, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 94
    .line 95
    .line 96
    iget v0, v4, Landroid/graphics/Rect;->left:I

    .line 97
    .line 98
    iget v1, v4, Landroid/graphics/Rect;->top:I

    .line 99
    .line 100
    or-int/2addr v0, v1

    .line 101
    iget v1, v4, Landroid/graphics/Rect;->bottom:I

    .line 102
    .line 103
    or-int/2addr v0, v1

    .line 104
    iget v1, v4, Landroid/graphics/Rect;->right:I

    .line 105
    .line 106
    or-int/2addr v0, v1

    .line 107
    if-eqz v0, :cond_b

    .line 108
    .line 109
    move v2, v3

    .line 110
    goto :goto_3

    .line 111
    :cond_9
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 112
    .line 113
    if-eqz v0, :cond_a

    .line 114
    .line 115
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    goto :goto_3

    .line 120
    :cond_a
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    :cond_b
    :goto_3
    iget-object v0, p0, LY0;->c:LV0;

    .line 125
    .line 126
    iget-boolean v0, v0, LV0;->A:Z

    .line 127
    .line 128
    if-eqz v0, :cond_c

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-ne v0, v3, :cond_c

    .line 135
    .line 136
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 137
    .line 138
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 139
    .line 140
    iput v1, p1, Landroid/graphics/Rect;->left:I

    .line 141
    .line 142
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 143
    .line 144
    :cond_c
    return v2
.end method

.method public final h(I)Z
    .locals 9

    .line 1
    iget v0, p0, LY0;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iget-object v0, p0, LY0;->c:LV0;

    .line 12
    .line 13
    iget v0, v0, LV0;->z:I

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    const-wide/16 v5, 0x0

    .line 17
    .line 18
    if-lez v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iput-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    iget-object v0, p0, LY0;->c:LV0;

    .line 34
    .line 35
    iget v0, v0, LV0;->z:I

    .line 36
    .line 37
    int-to-long v0, v0

    .line 38
    add-long/2addr v0, v2

    .line 39
    iput-wide v0, p0, LY0;->m:J

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    iput-object v4, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    iput-wide v5, p0, LY0;->m:J

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {v0, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 52
    .line 53
    .line 54
    :cond_4
    :goto_0
    if-ltz p1, :cond_6

    .line 55
    .line 56
    iget-object v0, p0, LY0;->c:LV0;

    .line 57
    .line 58
    iget v1, v0, LV0;->h:I

    .line 59
    .line 60
    if-ge p1, v1, :cond_6

    .line 61
    .line 62
    invoke-virtual {v0, p1}, LV0;->d(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    iput p1, p0, LY0;->i:I

    .line 69
    .line 70
    if-eqz v0, :cond_7

    .line 71
    .line 72
    iget-object p1, p0, LY0;->c:LV0;

    .line 73
    .line 74
    iget p1, p1, LV0;->y:I

    .line 75
    .line 76
    if-lez p1, :cond_5

    .line 77
    .line 78
    int-to-long v7, p1

    .line 79
    add-long/2addr v2, v7

    .line 80
    iput-wide v2, p0, LY0;->l:J

    .line 81
    .line 82
    :cond_5
    invoke-virtual {p0, v0}, LY0;->d(Landroid/graphics/drawable/Drawable;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_6
    iput-object v4, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    const/4 p1, -0x1

    .line 89
    iput p1, p0, LY0;->i:I

    .line 90
    .line 91
    :cond_7
    :goto_1
    iget-wide v0, p0, LY0;->l:J

    .line 92
    .line 93
    cmp-long p1, v0, v5

    .line 94
    .line 95
    const/4 v0, 0x1

    .line 96
    if-nez p1, :cond_8

    .line 97
    .line 98
    iget-wide v1, p0, LY0;->m:J

    .line 99
    .line 100
    cmp-long p1, v1, v5

    .line 101
    .line 102
    if-eqz p1, :cond_a

    .line 103
    .line 104
    :cond_8
    iget-object p1, p0, LY0;->k:Lj3;

    .line 105
    .line 106
    if-nez p1, :cond_9

    .line 107
    .line 108
    new-instance p1, Lj3;

    .line 109
    .line 110
    const/4 v1, 0x2

    .line 111
    invoke-direct {p1, v1, p0}, Lj3;-><init>(ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, LY0;->k:Lj3;

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_9
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    :goto_2
    invoke-virtual {p0, v0}, LY0;->a(Z)V

    .line 121
    .line 122
    .line 123
    :cond_a
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 124
    .line 125
    .line 126
    return v0
.end method

.method public final i(LV0;)V
    .locals 1

    .line 1
    iput-object p1, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget v0, p0, LY0;->i:I

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, v0}, LV0;->d(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, LY0;->d(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    iput-object p1, p0, LY0;->o:LV0;

    .line 22
    .line 23
    iput-object p1, p0, LY0;->q:LV0;

    .line 24
    .line 25
    return-void
.end method

.method public final invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, v0, LV0;->r:Z

    .line 7
    .line 8
    iput-boolean v1, v0, LV0;->t:Z

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final isAutoMirrored()Z
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v0, v0, LV0;->A:Z

    .line 4
    .line 5
    return v0
.end method

.method public final isStateful()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public final j(ZZ)Z
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v1, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 17
    .line 18
    .line 19
    :cond_1
    return v0
.end method

.method public final jumpToCurrentState()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LY0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LY0;->r:Lu6;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lu6;->A()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, LY0;->r:Lu6;

    .line 13
    .line 14
    iget v0, p0, LY0;->s:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, LY0;->h(I)Z

    .line 17
    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, LY0;->s:I

    .line 21
    .line 22
    iput v0, p0, LY0;->t:I

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-boolean v0, p0, LY0;->u:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, LY0;->f()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LY0;->q:LV0;

    .line 9
    .line 10
    iget-object v1, v0, LV0;->I:LFd;

    .line 11
    .line 12
    invoke-virtual {v1}, LFd;->b()LFd;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, LV0;->I:LFd;

    .line 17
    .line 18
    iget-object v1, v0, LV0;->J:Lnh;

    .line 19
    .line 20
    invoke-virtual {v1}, Lnh;->b()Lnh;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, LV0;->J:Lnh;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, LY0;->u:Z

    .line 28
    .line 29
    :cond_0
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final onLayoutDirectionChanged(I)Z
    .locals 7

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget v1, p0, LY0;->i:I

    .line 4
    .line 5
    iget v2, v0, LV0;->h:I

    .line 6
    .line 7
    iget-object v3, v0, LV0;->g:[Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    move v5, v4

    .line 11
    :goto_0
    if-ge v4, v2, :cond_1

    .line 12
    .line 13
    aget-object v6, v3, v4

    .line 14
    .line 15
    if-eqz v6, :cond_0

    .line 16
    .line 17
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    if-ne v4, v1, :cond_0

    .line 22
    .line 23
    move v5, v6

    .line 24
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iput p1, v0, LV0;->x:I

    .line 28
    .line 29
    return v5
.end method

.method public final onLevelChange(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->f:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    return p1

    .line 10
    :cond_0
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    return p1

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    return p1
.end method

.method public final onStateChange([I)Z
    .locals 14

    .line 1
    iget-object v0, p0, LY0;->q:LV0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LV0;->f([I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ltz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v1, Landroid/util/StateSet;->WILD_CARD:[I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, LV0;->f([I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    :goto_0
    iget v0, p0, LY0;->i:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eq v1, v0, :cond_b

    .line 20
    .line 21
    iget-object v3, p0, LY0;->r:Lu6;

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-eqz v3, :cond_3

    .line 25
    .line 26
    iget v0, p0, LY0;->s:I

    .line 27
    .line 28
    if-ne v1, v0, :cond_1

    .line 29
    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_1
    iget v0, p0, LY0;->t:I

    .line 33
    .line 34
    if-ne v1, v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {v3}, Lu6;->h()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v3}, Lu6;->y()V

    .line 43
    .line 44
    .line 45
    iget v0, p0, LY0;->t:I

    .line 46
    .line 47
    iput v0, p0, LY0;->s:I

    .line 48
    .line 49
    iput v1, p0, LY0;->t:I

    .line 50
    .line 51
    goto/16 :goto_4

    .line 52
    .line 53
    :cond_2
    iget v0, p0, LY0;->s:I

    .line 54
    .line 55
    invoke-virtual {v3}, Lu6;->A()V

    .line 56
    .line 57
    .line 58
    :cond_3
    const/4 v3, 0x0

    .line 59
    iput-object v3, p0, LY0;->r:Lu6;

    .line 60
    .line 61
    const/4 v3, -0x1

    .line 62
    iput v3, p0, LY0;->t:I

    .line 63
    .line 64
    iput v3, p0, LY0;->s:I

    .line 65
    .line 66
    iget-object v3, p0, LY0;->q:LV0;

    .line 67
    .line 68
    invoke-virtual {v3, v0}, LV0;->e(I)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    invoke-virtual {v3, v1}, LV0;->e(I)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_a

    .line 77
    .line 78
    if-nez v5, :cond_4

    .line 79
    .line 80
    goto/16 :goto_3

    .line 81
    .line 82
    :cond_4
    int-to-long v7, v5

    .line 83
    const/16 v5, 0x20

    .line 84
    .line 85
    shl-long/2addr v7, v5

    .line 86
    int-to-long v5, v6

    .line 87
    or-long/2addr v5, v7

    .line 88
    iget-object v7, v3, LV0;->I:LFd;

    .line 89
    .line 90
    invoke-virtual {v7, v5, v6}, LFd;->c(J)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    check-cast v7, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 97
    .line 98
    .line 99
    move-result-wide v7

    .line 100
    long-to-int v7, v7

    .line 101
    if-gez v7, :cond_5

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_5
    iget-object v8, v3, LV0;->I:LFd;

    .line 105
    .line 106
    invoke-virtual {v8, v5, v6}, LFd;->c(J)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    check-cast v8, Ljava/lang/Long;

    .line 111
    .line 112
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 113
    .line 114
    .line 115
    move-result-wide v8

    .line 116
    const-wide v10, 0x200000000L

    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    and-long/2addr v8, v10

    .line 122
    const-wide/16 v10, 0x0

    .line 123
    .line 124
    cmp-long v8, v8, v10

    .line 125
    .line 126
    if-eqz v8, :cond_6

    .line 127
    .line 128
    move v8, v4

    .line 129
    goto :goto_1

    .line 130
    :cond_6
    move v8, v2

    .line 131
    :goto_1
    invoke-virtual {p0, v7}, LY0;->h(I)Z

    .line 132
    .line 133
    .line 134
    iget-object v7, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    instance-of v9, v7, Landroid/graphics/drawable/AnimationDrawable;

    .line 137
    .line 138
    if-eqz v9, :cond_8

    .line 139
    .line 140
    iget-object v3, v3, LV0;->I:LFd;

    .line 141
    .line 142
    invoke-virtual {v3, v5, v6}, LFd;->c(J)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Ljava/lang/Long;

    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 149
    .line 150
    .line 151
    move-result-wide v5

    .line 152
    const-wide v12, 0x100000000L

    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    and-long/2addr v5, v12

    .line 158
    cmp-long v3, v5, v10

    .line 159
    .line 160
    if-eqz v3, :cond_7

    .line 161
    .line 162
    move v2, v4

    .line 163
    :cond_7
    new-instance v3, LW0;

    .line 164
    .line 165
    check-cast v7, Landroid/graphics/drawable/AnimationDrawable;

    .line 166
    .line 167
    invoke-direct {v3, v7, v2, v8}, LW0;-><init>(Landroid/graphics/drawable/AnimationDrawable;ZZ)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_8
    instance-of v3, v7, Lc1;

    .line 172
    .line 173
    if-eqz v3, :cond_9

    .line 174
    .line 175
    new-instance v3, LU0;

    .line 176
    .line 177
    check-cast v7, Lc1;

    .line 178
    .line 179
    const/4 v2, 0x1

    .line 180
    invoke-direct {v3, v7, v2}, LU0;-><init>(Landroid/graphics/drawable/Animatable;I)V

    .line 181
    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_9
    instance-of v3, v7, Landroid/graphics/drawable/Animatable;

    .line 185
    .line 186
    if-eqz v3, :cond_a

    .line 187
    .line 188
    new-instance v3, LU0;

    .line 189
    .line 190
    check-cast v7, Landroid/graphics/drawable/Animatable;

    .line 191
    .line 192
    const/4 v2, 0x0

    .line 193
    invoke-direct {v3, v7, v2}, LU0;-><init>(Landroid/graphics/drawable/Animatable;I)V

    .line 194
    .line 195
    .line 196
    :goto_2
    invoke-virtual {v3}, Lu6;->z()V

    .line 197
    .line 198
    .line 199
    iput-object v3, p0, LY0;->r:Lu6;

    .line 200
    .line 201
    iput v0, p0, LY0;->t:I

    .line 202
    .line 203
    iput v1, p0, LY0;->s:I

    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_a
    :goto_3
    invoke-virtual {p0, v1}, LY0;->h(I)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_b

    .line 211
    .line 212
    :goto_4
    move v2, v4

    .line 213
    :cond_b
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 214
    .line 215
    if-eqz v0, :cond_c

    .line 216
    .line 217
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    or-int/2addr v2, p1

    .line 222
    :cond_c
    return v2
.end method

.method public final scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final setAlpha(I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, LY0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, LY0;->g:I

    .line 6
    .line 7
    if-eq v0, p1, :cond_2

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, LY0;->h:Z

    .line 11
    .line 12
    iput p1, p0, LY0;->g:I

    .line 13
    .line 14
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-wide v1, p0, LY0;->l:J

    .line 19
    .line 20
    const-wide/16 v3, 0x0

    .line 21
    .line 22
    cmp-long v1, v1, v3

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, LY0;->a(Z)V

    .line 32
    .line 33
    .line 34
    :cond_2
    :goto_0
    return-void
.end method

.method public final setAutoMirrored(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->A:Z

    .line 4
    .line 5
    if-eq v1, p1, :cond_0

    .line 6
    .line 7
    iput-boolean p1, v0, LV0;->A:Z

    .line 8
    .line 9
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, LV0;->C:Z

    .line 5
    .line 6
    iget-object v1, v0, LV0;->B:Landroid/graphics/ColorFilter;

    .line 7
    .line 8
    if-eq v1, p1, :cond_0

    .line 9
    .line 10
    iput-object p1, v0, LV0;->B:Landroid/graphics/ColorFilter;

    .line 11
    .line 12
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final setDither(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    iget-boolean v1, v0, LV0;->w:Z

    .line 4
    .line 5
    if-eq v1, p1, :cond_0

    .line 6
    .line 7
    iput-boolean p1, v0, LV0;->w:Z

    .line 8
    .line 9
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final setHotspot(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final setHotspotBounds(IIII)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LY0;->d:Landroid/graphics/Rect;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setHotspotBounds(IIII)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final setTint(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, LY0;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setTintList(Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, LV0;->F:Z

    .line 5
    .line 6
    iget-object v1, v0, LV0;->D:Landroid/content/res/ColorStateList;

    .line 7
    .line 8
    if-eq v1, p1, :cond_0

    .line 9
    .line 10
    iput-object p1, v0, LV0;->D:Landroid/content/res/ColorStateList;

    .line 11
    .line 12
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    invoke-static {v0, p1}, LMk;->H(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    .line 1
    iget-object v0, p0, LY0;->c:LV0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, LV0;->G:Z

    .line 5
    .line 6
    iget-object v1, v0, LV0;->E:Landroid/graphics/PorterDuff$Mode;

    .line 7
    .line 8
    if-eq v1, p1, :cond_0

    .line 9
    .line 10
    iput-object p1, v0, LV0;->E:Landroid/graphics/PorterDuff$Mode;

    .line 11
    .line 12
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    invoke-static {v0, p1}, LMk;->I(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setVisible(ZZ)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, LY0;->j(ZZ)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, LY0;->r:Lu6;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_2

    .line 12
    .line 13
    :cond_0
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lu6;->z()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0}, LY0;->jumpToCurrentState()V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return v0
.end method

.method public final unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, LY0;->e:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
