.class public final LQh;
.super Landroid/view/MenuInflater;
.source "SourceFile"


# static fields
.field public static final e:[Ljava/lang/Class;

.field public static final f:[Ljava/lang/Class;


# instance fields
.field public final a:[Ljava/lang/Object;

.field public final b:[Ljava/lang/Object;

.field public final c:Landroid/content/Context;

.field public d:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ljava/lang/Class;

    .line 3
    .line 4
    const-class v1, Landroid/content/Context;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v1, v0, v2

    .line 8
    .line 9
    sput-object v0, LQh;->e:[Ljava/lang/Class;

    .line 10
    .line 11
    sput-object v0, LQh;->f:[Ljava/lang/Class;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LQh;->c:Landroid/content/Context;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    new-array v0, v0, [Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput-object p1, v0, v1

    .line 11
    .line 12
    iput-object v0, p0, LQh;->a:[Ljava/lang/Object;

    .line 13
    .line 14
    iput-object v0, p0, LQh;->b:[Ljava/lang/Object;

    .line 15
    .line 16
    return-void
.end method

.method public static a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p0, Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    instance-of v0, p0, Landroid/content/ContextWrapper;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p0, Landroid/content/ContextWrapper;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, LQh;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/view/Menu;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, LPh;

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    invoke-direct {v2, v0, v3}, LPh;-><init>(LQh;Landroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    :goto_0
    const/4 v4, 0x1

    .line 17
    const-string v5, "menu"

    .line 18
    .line 19
    const/4 v6, 0x2

    .line 20
    if-ne v3, v6, :cond_1

    .line 21
    .line 22
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    if-eqz v7, :cond_0

    .line 31
    .line 32
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    .line 38
    .line 39
    const-string v2, "Expecting menu, got "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw v1

    .line 49
    :cond_1
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ne v3, v4, :cond_18

    .line 54
    .line 55
    :goto_1
    const/4 v7, 0x0

    .line 56
    move v9, v7

    .line 57
    move v10, v9

    .line 58
    const/4 v11, 0x0

    .line 59
    :goto_2
    if-nez v9, :cond_17

    .line 60
    .line 61
    if-eq v3, v4, :cond_16

    .line 62
    .line 63
    const-string v12, "item"

    .line 64
    .line 65
    const-string v13, "group"

    .line 66
    .line 67
    const/4 v14, 0x3

    .line 68
    if-eq v3, v6, :cond_8

    .line 69
    .line 70
    if-eq v3, v14, :cond_3

    .line 71
    .line 72
    :cond_2
    :goto_3
    move-object/from16 v8, p1

    .line 73
    .line 74
    move v6, v4

    .line 75
    goto/16 :goto_4

    .line 76
    .line 77
    :cond_3
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    if-eqz v10, :cond_4

    .line 82
    .line 83
    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v14

    .line 87
    if-eqz v14, :cond_4

    .line 88
    .line 89
    move-object/from16 v8, p1

    .line 90
    .line 91
    move v6, v4

    .line 92
    move v10, v7

    .line 93
    const/4 v4, 0x0

    .line 94
    const/4 v11, 0x0

    .line 95
    goto/16 :goto_10

    .line 96
    .line 97
    :cond_4
    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v13

    .line 101
    if-eqz v13, :cond_5

    .line 102
    .line 103
    iput v7, v2, LPh;->b:I

    .line 104
    .line 105
    iput v7, v2, LPh;->c:I

    .line 106
    .line 107
    iput v7, v2, LPh;->d:I

    .line 108
    .line 109
    iput v7, v2, LPh;->e:I

    .line 110
    .line 111
    iput-boolean v4, v2, LPh;->f:Z

    .line 112
    .line 113
    iput-boolean v4, v2, LPh;->g:Z

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_5
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v12

    .line 120
    if-eqz v12, :cond_7

    .line 121
    .line 122
    iget-boolean v3, v2, LPh;->h:Z

    .line 123
    .line 124
    if-nez v3, :cond_2

    .line 125
    .line 126
    iget-object v3, v2, LPh;->z:LUd;

    .line 127
    .line 128
    if-eqz v3, :cond_6

    .line 129
    .line 130
    iget-object v3, v3, LUd;->a:Landroid/view/ActionProvider;

    .line 131
    .line 132
    invoke-virtual {v3}, Landroid/view/ActionProvider;->hasSubMenu()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_6

    .line 137
    .line 138
    iput-boolean v4, v2, LPh;->h:Z

    .line 139
    .line 140
    iget v3, v2, LPh;->b:I

    .line 141
    .line 142
    iget v12, v2, LPh;->i:I

    .line 143
    .line 144
    iget v13, v2, LPh;->j:I

    .line 145
    .line 146
    iget-object v14, v2, LPh;->k:Ljava/lang/CharSequence;

    .line 147
    .line 148
    iget-object v15, v2, LPh;->a:Landroid/view/Menu;

    .line 149
    .line 150
    invoke-interface {v15, v3, v12, v13, v14}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-interface {v3}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v2, v3}, LPh;->b(Landroid/view/MenuItem;)V

    .line 159
    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_6
    iput-boolean v4, v2, LPh;->h:Z

    .line 163
    .line 164
    iget v3, v2, LPh;->b:I

    .line 165
    .line 166
    iget v12, v2, LPh;->i:I

    .line 167
    .line 168
    iget v13, v2, LPh;->j:I

    .line 169
    .line 170
    iget-object v14, v2, LPh;->k:Ljava/lang/CharSequence;

    .line 171
    .line 172
    iget-object v15, v2, LPh;->a:Landroid/view/Menu;

    .line 173
    .line 174
    invoke-interface {v15, v3, v12, v13, v14}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v2, v3}, LPh;->b(Landroid/view/MenuItem;)V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_7
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    if-eqz v3, :cond_2

    .line 187
    .line 188
    move-object/from16 v8, p1

    .line 189
    .line 190
    move v6, v4

    .line 191
    move v9, v6

    .line 192
    :goto_4
    const/4 v4, 0x0

    .line 193
    goto/16 :goto_10

    .line 194
    .line 195
    :cond_8
    if-eqz v10, :cond_9

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_9
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v13

    .line 206
    const/4 v15, 0x5

    .line 207
    const/4 v8, 0x4

    .line 208
    iget-object v6, v2, LPh;->E:LQh;

    .line 209
    .line 210
    if-eqz v13, :cond_a

    .line 211
    .line 212
    iget-object v3, v6, LQh;->c:Landroid/content/Context;

    .line 213
    .line 214
    sget-object v6, LNf;->p:[I

    .line 215
    .line 216
    invoke-virtual {v3, v1, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    invoke-virtual {v3, v4, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    iput v6, v2, LPh;->b:I

    .line 225
    .line 226
    invoke-virtual {v3, v14, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 227
    .line 228
    .line 229
    move-result v6

    .line 230
    iput v6, v2, LPh;->c:I

    .line 231
    .line 232
    invoke-virtual {v3, v8, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 233
    .line 234
    .line 235
    move-result v6

    .line 236
    iput v6, v2, LPh;->d:I

    .line 237
    .line 238
    invoke-virtual {v3, v15, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    iput v6, v2, LPh;->e:I

    .line 243
    .line 244
    const/4 v6, 0x2

    .line 245
    invoke-virtual {v3, v6, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 246
    .line 247
    .line 248
    move-result v8

    .line 249
    iput-boolean v8, v2, LPh;->f:Z

    .line 250
    .line 251
    invoke-virtual {v3, v7, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    iput-boolean v6, v2, LPh;->g:Z

    .line 256
    .line 257
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 258
    .line 259
    .line 260
    goto/16 :goto_3

    .line 261
    .line 262
    :cond_a
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v12

    .line 266
    if-eqz v12, :cond_14

    .line 267
    .line 268
    iget-object v3, v6, LQh;->c:Landroid/content/Context;

    .line 269
    .line 270
    sget-object v12, LNf;->q:[I

    .line 271
    .line 272
    invoke-virtual {v3, v1, v12}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 273
    .line 274
    .line 275
    move-result-object v12

    .line 276
    const/4 v13, 0x2

    .line 277
    invoke-virtual {v12, v13, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    iput v4, v2, LPh;->i:I

    .line 282
    .line 283
    iget v4, v2, LPh;->c:I

    .line 284
    .line 285
    invoke-virtual {v12, v15, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    iget v15, v2, LPh;->d:I

    .line 290
    .line 291
    const/4 v13, 0x6

    .line 292
    invoke-virtual {v12, v13, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 293
    .line 294
    .line 295
    move-result v13

    .line 296
    const/high16 v15, -0x10000

    .line 297
    .line 298
    and-int/2addr v4, v15

    .line 299
    const v15, 0xffff

    .line 300
    .line 301
    .line 302
    and-int/2addr v13, v15

    .line 303
    or-int/2addr v4, v13

    .line 304
    iput v4, v2, LPh;->j:I

    .line 305
    .line 306
    const/4 v4, 0x7

    .line 307
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    iput-object v4, v2, LPh;->k:Ljava/lang/CharSequence;

    .line 312
    .line 313
    const/16 v4, 0x8

    .line 314
    .line 315
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    iput-object v4, v2, LPh;->l:Ljava/lang/CharSequence;

    .line 320
    .line 321
    invoke-virtual {v12, v7, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    iput v4, v2, LPh;->m:I

    .line 326
    .line 327
    const/16 v4, 0x9

    .line 328
    .line 329
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    if-nez v4, :cond_b

    .line 334
    .line 335
    move v4, v7

    .line 336
    goto :goto_5

    .line 337
    :cond_b
    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    .line 338
    .line 339
    .line 340
    move-result v4

    .line 341
    :goto_5
    iput-char v4, v2, LPh;->n:C

    .line 342
    .line 343
    const/16 v4, 0x10

    .line 344
    .line 345
    const/16 v13, 0x1000

    .line 346
    .line 347
    invoke-virtual {v12, v4, v13}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 348
    .line 349
    .line 350
    move-result v4

    .line 351
    iput v4, v2, LPh;->o:I

    .line 352
    .line 353
    const/16 v4, 0xa

    .line 354
    .line 355
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v4

    .line 359
    if-nez v4, :cond_c

    .line 360
    .line 361
    move v4, v7

    .line 362
    goto :goto_6

    .line 363
    :cond_c
    invoke-virtual {v4, v7}, Ljava/lang/String;->charAt(I)C

    .line 364
    .line 365
    .line 366
    move-result v4

    .line 367
    :goto_6
    iput-char v4, v2, LPh;->p:C

    .line 368
    .line 369
    const/16 v4, 0x14

    .line 370
    .line 371
    invoke-virtual {v12, v4, v13}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 372
    .line 373
    .line 374
    move-result v4

    .line 375
    iput v4, v2, LPh;->q:I

    .line 376
    .line 377
    const/16 v4, 0xb

    .line 378
    .line 379
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 380
    .line 381
    .line 382
    move-result v13

    .line 383
    if-eqz v13, :cond_d

    .line 384
    .line 385
    invoke-virtual {v12, v4, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    :goto_7
    iput v4, v2, LPh;->r:I

    .line 390
    .line 391
    goto :goto_8

    .line 392
    :cond_d
    iget v4, v2, LPh;->e:I

    .line 393
    .line 394
    goto :goto_7

    .line 395
    :goto_8
    invoke-virtual {v12, v14, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 396
    .line 397
    .line 398
    move-result v4

    .line 399
    iput-boolean v4, v2, LPh;->s:Z

    .line 400
    .line 401
    iget-boolean v4, v2, LPh;->f:Z

    .line 402
    .line 403
    invoke-virtual {v12, v8, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 404
    .line 405
    .line 406
    move-result v4

    .line 407
    iput-boolean v4, v2, LPh;->t:Z

    .line 408
    .line 409
    iget-boolean v4, v2, LPh;->g:Z

    .line 410
    .line 411
    const/4 v8, 0x1

    .line 412
    invoke-virtual {v12, v8, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 413
    .line 414
    .line 415
    move-result v4

    .line 416
    iput-boolean v4, v2, LPh;->u:Z

    .line 417
    .line 418
    const/16 v4, 0x15

    .line 419
    .line 420
    const/4 v8, -0x1

    .line 421
    invoke-virtual {v12, v4, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 422
    .line 423
    .line 424
    move-result v4

    .line 425
    iput v4, v2, LPh;->v:I

    .line 426
    .line 427
    const/16 v4, 0xc

    .line 428
    .line 429
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v4

    .line 433
    iput-object v4, v2, LPh;->y:Ljava/lang/String;

    .line 434
    .line 435
    const/16 v4, 0xd

    .line 436
    .line 437
    invoke-virtual {v12, v4, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 438
    .line 439
    .line 440
    move-result v4

    .line 441
    iput v4, v2, LPh;->w:I

    .line 442
    .line 443
    const/16 v4, 0xf

    .line 444
    .line 445
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v4

    .line 449
    iput-object v4, v2, LPh;->x:Ljava/lang/String;

    .line 450
    .line 451
    const/16 v4, 0xe

    .line 452
    .line 453
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v4

    .line 457
    if-eqz v4, :cond_e

    .line 458
    .line 459
    const/4 v13, 0x1

    .line 460
    goto :goto_9

    .line 461
    :cond_e
    move v13, v7

    .line 462
    :goto_9
    if-eqz v13, :cond_f

    .line 463
    .line 464
    iget v14, v2, LPh;->w:I

    .line 465
    .line 466
    if-nez v14, :cond_f

    .line 467
    .line 468
    iget-object v14, v2, LPh;->x:Ljava/lang/String;

    .line 469
    .line 470
    if-nez v14, :cond_f

    .line 471
    .line 472
    sget-object v13, LQh;->f:[Ljava/lang/Class;

    .line 473
    .line 474
    iget-object v6, v6, LQh;->b:[Ljava/lang/Object;

    .line 475
    .line 476
    invoke-virtual {v2, v4, v13, v6}, LPh;->a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    .line 478
    .line 479
    move-result-object v4

    .line 480
    check-cast v4, LUd;

    .line 481
    .line 482
    :goto_a
    iput-object v4, v2, LPh;->z:LUd;

    .line 483
    .line 484
    goto :goto_b

    .line 485
    :cond_f
    if-eqz v13, :cond_10

    .line 486
    .line 487
    const-string v4, "SupportMenuInflater"

    .line 488
    .line 489
    const-string v6, "Ignoring attribute \'actionProviderClass\'. Action view already specified."

    .line 490
    .line 491
    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    .line 493
    .line 494
    :cond_10
    const/4 v4, 0x0

    .line 495
    goto :goto_a

    .line 496
    :goto_b
    const/16 v4, 0x11

    .line 497
    .line 498
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    iput-object v4, v2, LPh;->A:Ljava/lang/CharSequence;

    .line 503
    .line 504
    const/16 v4, 0x16

    .line 505
    .line 506
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    .line 507
    .line 508
    .line 509
    move-result-object v4

    .line 510
    iput-object v4, v2, LPh;->B:Ljava/lang/CharSequence;

    .line 511
    .line 512
    const/16 v4, 0x13

    .line 513
    .line 514
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 515
    .line 516
    .line 517
    move-result v6

    .line 518
    if-eqz v6, :cond_11

    .line 519
    .line 520
    invoke-virtual {v12, v4, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 521
    .line 522
    .line 523
    move-result v4

    .line 524
    iget-object v6, v2, LPh;->D:Landroid/graphics/PorterDuff$Mode;

    .line 525
    .line 526
    invoke-static {v4, v6}, LX6;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 527
    .line 528
    .line 529
    move-result-object v4

    .line 530
    :goto_c
    iput-object v4, v2, LPh;->D:Landroid/graphics/PorterDuff$Mode;

    .line 531
    .line 532
    goto :goto_d

    .line 533
    :cond_11
    const/4 v4, 0x0

    .line 534
    goto :goto_c

    .line 535
    :goto_d
    const/16 v4, 0x12

    .line 536
    .line 537
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 538
    .line 539
    .line 540
    move-result v6

    .line 541
    if-eqz v6, :cond_13

    .line 542
    .line 543
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 544
    .line 545
    .line 546
    move-result v6

    .line 547
    if-eqz v6, :cond_12

    .line 548
    .line 549
    invoke-virtual {v12, v4, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 550
    .line 551
    .line 552
    move-result v6

    .line 553
    if-eqz v6, :cond_12

    .line 554
    .line 555
    invoke-static {v3, v6}, LMk;->p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 556
    .line 557
    .line 558
    move-result-object v3

    .line 559
    if-eqz v3, :cond_12

    .line 560
    .line 561
    goto :goto_e

    .line 562
    :cond_12
    invoke-virtual {v12, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 563
    .line 564
    .line 565
    move-result-object v3

    .line 566
    :goto_e
    iput-object v3, v2, LPh;->C:Landroid/content/res/ColorStateList;

    .line 567
    .line 568
    const/4 v4, 0x0

    .line 569
    goto :goto_f

    .line 570
    :cond_13
    const/4 v4, 0x0

    .line 571
    iput-object v4, v2, LPh;->C:Landroid/content/res/ColorStateList;

    .line 572
    .line 573
    :goto_f
    invoke-virtual {v12}, Landroid/content/res/TypedArray;->recycle()V

    .line 574
    .line 575
    .line 576
    iput-boolean v7, v2, LPh;->h:Z

    .line 577
    .line 578
    move-object/from16 v8, p1

    .line 579
    .line 580
    const/4 v6, 0x1

    .line 581
    goto :goto_10

    .line 582
    :cond_14
    const/4 v4, 0x0

    .line 583
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 584
    .line 585
    .line 586
    move-result v6

    .line 587
    if-eqz v6, :cond_15

    .line 588
    .line 589
    const/4 v6, 0x1

    .line 590
    iput-boolean v6, v2, LPh;->h:Z

    .line 591
    .line 592
    iget v3, v2, LPh;->b:I

    .line 593
    .line 594
    iget v8, v2, LPh;->i:I

    .line 595
    .line 596
    iget v12, v2, LPh;->j:I

    .line 597
    .line 598
    iget-object v13, v2, LPh;->k:Ljava/lang/CharSequence;

    .line 599
    .line 600
    iget-object v14, v2, LPh;->a:Landroid/view/Menu;

    .line 601
    .line 602
    invoke-interface {v14, v3, v8, v12, v13}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 603
    .line 604
    .line 605
    move-result-object v3

    .line 606
    invoke-interface {v3}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    .line 607
    .line 608
    .line 609
    move-result-object v8

    .line 610
    invoke-virtual {v2, v8}, LPh;->b(Landroid/view/MenuItem;)V

    .line 611
    .line 612
    .line 613
    move-object/from16 v8, p1

    .line 614
    .line 615
    invoke-virtual {v0, v8, v1, v3}, LQh;->b(Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/view/Menu;)V

    .line 616
    .line 617
    .line 618
    goto :goto_10

    .line 619
    :cond_15
    move-object/from16 v8, p1

    .line 620
    .line 621
    const/4 v6, 0x1

    .line 622
    move-object v11, v3

    .line 623
    move v10, v6

    .line 624
    :goto_10
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 625
    .line 626
    .line 627
    move-result v3

    .line 628
    move v4, v6

    .line 629
    const/4 v6, 0x2

    .line 630
    goto/16 :goto_2

    .line 631
    .line 632
    :cond_16
    new-instance v1, Ljava/lang/RuntimeException;

    .line 633
    .line 634
    const-string v2, "Unexpected end of document"

    .line 635
    .line 636
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 637
    .line 638
    .line 639
    throw v1

    .line 640
    :cond_17
    return-void

    .line 641
    :cond_18
    move-object/from16 v8, p1

    .line 642
    .line 643
    goto/16 :goto_0
.end method

.method public final inflate(ILandroid/view/Menu;)V
    .locals 3

    .line 1
    const-string v0, "Error inflating menu XML"

    .line 2
    .line 3
    instance-of v1, p2, LMd;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :try_start_0
    iget-object v2, p0, LQh;->c:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getLayout(I)Landroid/content/res/XmlResourceParser;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, v1, p1, p2}, LQh;->b(Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/view/Menu;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_2

    .line 35
    :catch_0
    move-exception p1

    .line 36
    goto :goto_0

    .line 37
    :catch_1
    move-exception p1

    .line 38
    goto :goto_1

    .line 39
    :goto_0
    :try_start_1
    new-instance p2, Landroid/view/InflateException;

    .line 40
    .line 41
    invoke-direct {p2, v0, p1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    throw p2

    .line 45
    :goto_1
    new-instance p2, Landroid/view/InflateException;

    .line 46
    .line 47
    invoke-direct {p2, v0, p1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    :goto_2
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    .line 54
    .line 55
    .line 56
    :cond_1
    throw p1
.end method
