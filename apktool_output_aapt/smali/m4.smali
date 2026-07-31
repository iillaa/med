.class public final Lm4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LDc;
.implements Ll4;


# static fields
.field public static final b:Ljava/util/Map;

.field public static final c:Ljava/util/LinkedHashMap;


# instance fields
.field public final a:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/16 v2, 0x17

    .line 4
    .line 5
    new-array v2, v2, [Ljava/lang/Class;

    .line 6
    .line 7
    const-class v3, Ly9;

    .line 8
    .line 9
    aput-object v3, v2, v1

    .line 10
    .line 11
    const-class v3, LJ9;

    .line 12
    .line 13
    aput-object v3, v2, v0

    .line 14
    .line 15
    const-class v3, LN9;

    .line 16
    .line 17
    const/4 v4, 0x2

    .line 18
    aput-object v3, v2, v4

    .line 19
    .line 20
    const-class v3, LO9;

    .line 21
    .line 22
    const/4 v4, 0x3

    .line 23
    aput-object v3, v2, v4

    .line 24
    .line 25
    const-class v3, LP9;

    .line 26
    .line 27
    const/4 v4, 0x4

    .line 28
    aput-object v3, v2, v4

    .line 29
    .line 30
    const-class v3, LQ9;

    .line 31
    .line 32
    const/4 v4, 0x5

    .line 33
    aput-object v3, v2, v4

    .line 34
    .line 35
    const-class v3, LR9;

    .line 36
    .line 37
    const/4 v4, 0x6

    .line 38
    aput-object v3, v2, v4

    .line 39
    .line 40
    const-class v3, LS9;

    .line 41
    .line 42
    const/4 v4, 0x7

    .line 43
    aput-object v3, v2, v4

    .line 44
    .line 45
    const-class v3, LT9;

    .line 46
    .line 47
    const/16 v4, 0x8

    .line 48
    .line 49
    aput-object v3, v2, v4

    .line 50
    .line 51
    const-class v3, LU9;

    .line 52
    .line 53
    const/16 v4, 0x9

    .line 54
    .line 55
    aput-object v3, v2, v4

    .line 56
    .line 57
    const-class v3, Lz9;

    .line 58
    .line 59
    const/16 v4, 0xa

    .line 60
    .line 61
    aput-object v3, v2, v4

    .line 62
    .line 63
    const-class v3, LA9;

    .line 64
    .line 65
    const/16 v4, 0xb

    .line 66
    .line 67
    aput-object v3, v2, v4

    .line 68
    .line 69
    const-class v3, LB9;

    .line 70
    .line 71
    const/16 v4, 0xc

    .line 72
    .line 73
    aput-object v3, v2, v4

    .line 74
    .line 75
    const-class v3, LC9;

    .line 76
    .line 77
    const/16 v4, 0xd

    .line 78
    .line 79
    aput-object v3, v2, v4

    .line 80
    .line 81
    const-class v3, LD9;

    .line 82
    .line 83
    const/16 v4, 0xe

    .line 84
    .line 85
    aput-object v3, v2, v4

    .line 86
    .line 87
    const-class v3, LE9;

    .line 88
    .line 89
    const/16 v4, 0xf

    .line 90
    .line 91
    aput-object v3, v2, v4

    .line 92
    .line 93
    const-class v3, LF9;

    .line 94
    .line 95
    const/16 v4, 0x10

    .line 96
    .line 97
    aput-object v3, v2, v4

    .line 98
    .line 99
    const-class v3, LG9;

    .line 100
    .line 101
    const/16 v4, 0x11

    .line 102
    .line 103
    aput-object v3, v2, v4

    .line 104
    .line 105
    const-class v3, LH9;

    .line 106
    .line 107
    const/16 v4, 0x12

    .line 108
    .line 109
    aput-object v3, v2, v4

    .line 110
    .line 111
    const-class v3, LI9;

    .line 112
    .line 113
    const/16 v4, 0x13

    .line 114
    .line 115
    aput-object v3, v2, v4

    .line 116
    .line 117
    const-class v3, LK9;

    .line 118
    .line 119
    const/16 v4, 0x14

    .line 120
    .line 121
    aput-object v3, v2, v4

    .line 122
    .line 123
    const-class v3, LL9;

    .line 124
    .line 125
    const/16 v4, 0x15

    .line 126
    .line 127
    aput-object v3, v2, v4

    .line 128
    .line 129
    const-class v3, LM9;

    .line 130
    .line 131
    const/16 v4, 0x16

    .line 132
    .line 133
    aput-object v3, v2, v4

    .line 134
    .line 135
    invoke-static {v2}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-static {v2}, Lv4;->G(Ljava/lang/Iterable;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 146
    .line 147
    .line 148
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    if-eqz v4, :cond_1

    .line 157
    .line 158
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    add-int/lit8 v5, v1, 0x1

    .line 163
    .line 164
    if-ltz v1, :cond_0

    .line 165
    .line 166
    check-cast v4, Ljava/lang/Class;

    .line 167
    .line 168
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    new-instance v6, Lgf;

    .line 173
    .line 174
    invoke-direct {v6, v4, v1}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move v1, v5

    .line 181
    goto :goto_0

    .line 182
    :cond_0
    new-instance v0, Ljava/lang/ArithmeticException;

    .line 183
    .line 184
    const-string v1, "Index overflow has happened."

    .line 185
    .line 186
    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    throw v0

    .line 190
    :cond_1
    invoke-static {v3}, LId;->F(Ljava/util/ArrayList;)Ljava/util/Map;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    sput-object v0, Lm4;->b:Ljava/util/Map;

    .line 195
    .line 196
    new-instance v0, Ljava/util/HashMap;

    .line 197
    .line 198
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 199
    .line 200
    .line 201
    const-string v1, "boolean"

    .line 202
    .line 203
    const-string v2, "kotlin.Boolean"

    .line 204
    .line 205
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    const-string v1, "char"

    .line 209
    .line 210
    const-string v3, "kotlin.Char"

    .line 211
    .line 212
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    const-string v1, "byte"

    .line 216
    .line 217
    const-string v4, "kotlin.Byte"

    .line 218
    .line 219
    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    const-string v1, "short"

    .line 223
    .line 224
    const-string v5, "kotlin.Short"

    .line 225
    .line 226
    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    const-string v1, "int"

    .line 230
    .line 231
    const-string v6, "kotlin.Int"

    .line 232
    .line 233
    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    const-string v1, "float"

    .line 237
    .line 238
    const-string v7, "kotlin.Float"

    .line 239
    .line 240
    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    const-string v1, "long"

    .line 244
    .line 245
    const-string v8, "kotlin.Long"

    .line 246
    .line 247
    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    const-string v1, "double"

    .line 251
    .line 252
    const-string v9, "kotlin.Double"

    .line 253
    .line 254
    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    new-instance v1, Ljava/util/HashMap;

    .line 258
    .line 259
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 260
    .line 261
    .line 262
    const-string v10, "java.lang.Boolean"

    .line 263
    .line 264
    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    const-string v2, "java.lang.Character"

    .line 268
    .line 269
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    const-string v2, "java.lang.Byte"

    .line 273
    .line 274
    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    const-string v2, "java.lang.Short"

    .line 278
    .line 279
    invoke-virtual {v1, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    const-string v2, "java.lang.Integer"

    .line 283
    .line 284
    invoke-virtual {v1, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    const-string v2, "java.lang.Float"

    .line 288
    .line 289
    invoke-virtual {v1, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    const-string v2, "java.lang.Long"

    .line 293
    .line 294
    invoke-virtual {v1, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    const-string v2, "java.lang.Double"

    .line 298
    .line 299
    invoke-virtual {v1, v2, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    new-instance v2, Ljava/util/HashMap;

    .line 303
    .line 304
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 305
    .line 306
    .line 307
    const-string v3, "java.lang.Object"

    .line 308
    .line 309
    const-string v4, "kotlin.Any"

    .line 310
    .line 311
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    const-string v3, "java.lang.String"

    .line 315
    .line 316
    const-string v4, "kotlin.String"

    .line 317
    .line 318
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    const-string v3, "java.lang.CharSequence"

    .line 322
    .line 323
    const-string v4, "kotlin.CharSequence"

    .line 324
    .line 325
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    const-string v3, "java.lang.Throwable"

    .line 329
    .line 330
    const-string v4, "kotlin.Throwable"

    .line 331
    .line 332
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    const-string v3, "java.lang.Cloneable"

    .line 336
    .line 337
    const-string v4, "kotlin.Cloneable"

    .line 338
    .line 339
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    const-string v3, "java.lang.Number"

    .line 343
    .line 344
    const-string v4, "kotlin.Number"

    .line 345
    .line 346
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    const-string v3, "java.lang.Comparable"

    .line 350
    .line 351
    const-string v4, "kotlin.Comparable"

    .line 352
    .line 353
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    const-string v3, "java.lang.Enum"

    .line 357
    .line 358
    const-string v4, "kotlin.Enum"

    .line 359
    .line 360
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    const-string v3, "java.lang.annotation.Annotation"

    .line 364
    .line 365
    const-string v4, "kotlin.Annotation"

    .line 366
    .line 367
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    const-string v3, "java.lang.Iterable"

    .line 371
    .line 372
    const-string v4, "kotlin.collections.Iterable"

    .line 373
    .line 374
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    const-string v3, "java.util.Iterator"

    .line 378
    .line 379
    const-string v4, "kotlin.collections.Iterator"

    .line 380
    .line 381
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    const-string v3, "java.util.Collection"

    .line 385
    .line 386
    const-string v4, "kotlin.collections.Collection"

    .line 387
    .line 388
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    const-string v3, "java.util.List"

    .line 392
    .line 393
    const-string v4, "kotlin.collections.List"

    .line 394
    .line 395
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    const-string v3, "java.util.Set"

    .line 399
    .line 400
    const-string v4, "kotlin.collections.Set"

    .line 401
    .line 402
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    const-string v3, "java.util.ListIterator"

    .line 406
    .line 407
    const-string v4, "kotlin.collections.ListIterator"

    .line 408
    .line 409
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    const-string v3, "java.util.Map"

    .line 413
    .line 414
    const-string v4, "kotlin.collections.Map"

    .line 415
    .line 416
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    const-string v3, "java.util.Map$Entry"

    .line 420
    .line 421
    const-string v4, "kotlin.collections.Map.Entry"

    .line 422
    .line 423
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    const-string v3, "kotlin.jvm.internal.StringCompanionObject"

    .line 427
    .line 428
    const-string v4, "kotlin.String.Companion"

    .line 429
    .line 430
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    const-string v3, "kotlin.jvm.internal.EnumCompanionObject"

    .line 434
    .line 435
    const-string v4, "kotlin.Enum.Companion"

    .line 436
    .line 437
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 444
    .line 445
    .line 446
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    const-string v1, "<get-values>(...)"

    .line 451
    .line 452
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 453
    .line 454
    .line 455
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    if-eqz v1, :cond_2

    .line 464
    .line 465
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    check-cast v1, Ljava/lang/String;

    .line 470
    .line 471
    new-instance v3, Ljava/lang/StringBuilder;

    .line 472
    .line 473
    const-string v4, "kotlin.jvm.internal."

    .line 474
    .line 475
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    invoke-static {v1}, Llc;->e(Ljava/lang/Object;)V

    .line 479
    .line 480
    .line 481
    invoke-static {v1, v1}, LJh;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v4

    .line 485
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    const-string v4, "CompanionObject"

    .line 489
    .line 490
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    .line 492
    .line 493
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object v3

    .line 497
    const-string v4, ".Companion"

    .line 498
    .line 499
    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    .line 505
    .line 506
    goto :goto_1

    .line 507
    :cond_2
    sget-object v0, Lm4;->b:Ljava/util/Map;

    .line 508
    .line 509
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 518
    .line 519
    .line 520
    move-result v1

    .line 521
    if-eqz v1, :cond_3

    .line 522
    .line 523
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    check-cast v1, Ljava/util/Map$Entry;

    .line 528
    .line 529
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 530
    .line 531
    .line 532
    move-result-object v3

    .line 533
    check-cast v3, Ljava/lang/Class;

    .line 534
    .line 535
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    check-cast v1, Ljava/lang/Number;

    .line 540
    .line 541
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 542
    .line 543
    .line 544
    move-result v1

    .line 545
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v3

    .line 549
    new-instance v4, Ljava/lang/StringBuilder;

    .line 550
    .line 551
    const-string v5, "kotlin.Function"

    .line 552
    .line 553
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    goto :goto_2

    .line 567
    :cond_3
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 568
    .line 569
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    .line 570
    .line 571
    .line 572
    move-result v1

    .line 573
    invoke-static {v1}, LId;->E(I)I

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 585
    .line 586
    .line 587
    move-result-object v1

    .line 588
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 589
    .line 590
    .line 591
    move-result v2

    .line 592
    if-eqz v2, :cond_4

    .line 593
    .line 594
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 595
    .line 596
    .line 597
    move-result-object v2

    .line 598
    check-cast v2, Ljava/util/Map$Entry;

    .line 599
    .line 600
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v3

    .line 604
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v2

    .line 608
    check-cast v2, Ljava/lang/String;

    .line 609
    .line 610
    invoke-static {v2, v2}, LJh;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v2

    .line 614
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    goto :goto_3

    .line 618
    :cond_4
    sput-object v0, Lm4;->c:Ljava/util/LinkedHashMap;

    .line 619
    .line 620
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1

    .line 1
    const-string v0, "jClass"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lm4;->a:Ljava/lang/Class;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Class;
    .locals 1

    .line 1
    iget-object v0, p0, Lm4;->a:Ljava/lang/Class;

    .line 2
    .line 3
    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lm4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lu6;->n(LDc;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast p1, LDc;

    .line 10
    .line 11
    invoke-static {p1}, Lu6;->n(LDc;)Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    return p1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    invoke-static {p0}, Lu6;->n(LDc;)Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lm4;->a:Ljava/lang/Class;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " (Kotlin reflection is not available)"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method
