.class public final Ll3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/CharSequence;

.field public k:I

.field public l:Ljava/lang/CharSequence;

.field public m:Ljava/util/ArrayList;

.field public n:Ljava/util/ArrayList;

.field public o:Z

.field public final p:Lq9;

.field public q:I


# direct methods
.method public constructor <init>(Lr9;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lq9;->t:Lo9;

    .line 2
    .line 3
    iget-object v0, p1, Lq9;->r:Lg9;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lg9;->c:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll3;->a:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll3;->o:Z

    .line 24
    .line 25
    const/4 v0, -0x1

    .line 26
    iput v0, p0, Ll3;->q:I

    .line 27
    .line 28
    iput-object p1, p0, Ll3;->p:Lq9;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll3;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    const-string v1, "FragmentManager"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "Bump nesting in "

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, " by "

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {v1, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p1, p0, Ll3;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x0

    .line 47
    :goto_0
    if-ge v1, v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Lw9;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/io/PrintWriter;Z)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p3, :cond_8

    .line 3
    .line 4
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string v1, "mName="

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll3;->h:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v1, " mIndex="

    .line 18
    .line 19
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget v1, p0, Ll3;->q:I

    .line 23
    .line 24
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 25
    .line 26
    .line 27
    const-string v1, " mCommitted="

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 33
    .line 34
    .line 35
    iget v1, p0, Ll3;->f:I

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string v1, "mTransition=#"

    .line 43
    .line 44
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget v1, p0, Ll3;->f:I

    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget v1, p0, Ll3;->b:I

    .line 57
    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    iget v1, p0, Ll3;->c:I

    .line 61
    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    :cond_1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string v1, "mEnterAnim=#"

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget v1, p0, Ll3;->b:I

    .line 73
    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string v1, " mExitAnim=#"

    .line 82
    .line 83
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget v1, p0, Ll3;->c:I

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    iget v1, p0, Ll3;->d:I

    .line 96
    .line 97
    if-nez v1, :cond_3

    .line 98
    .line 99
    iget v1, p0, Ll3;->e:I

    .line 100
    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    :cond_3
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const-string v1, "mPopEnterAnim=#"

    .line 107
    .line 108
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget v1, p0, Ll3;->d:I

    .line 112
    .line 113
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-string v1, " mPopExitAnim=#"

    .line 121
    .line 122
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget v1, p0, Ll3;->e:I

    .line 126
    .line 127
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_4
    iget v1, p0, Ll3;->i:I

    .line 135
    .line 136
    if-nez v1, :cond_5

    .line 137
    .line 138
    iget-object v1, p0, Ll3;->j:Ljava/lang/CharSequence;

    .line 139
    .line 140
    if-eqz v1, :cond_6

    .line 141
    .line 142
    :cond_5
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    const-string v1, "mBreadCrumbTitleRes=#"

    .line 146
    .line 147
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget v1, p0, Ll3;->i:I

    .line 151
    .line 152
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string v1, " mBreadCrumbTitleText="

    .line 160
    .line 161
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ll3;->j:Ljava/lang/CharSequence;

    .line 165
    .line 166
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    :cond_6
    iget v1, p0, Ll3;->k:I

    .line 170
    .line 171
    if-nez v1, :cond_7

    .line 172
    .line 173
    iget-object v1, p0, Ll3;->l:Ljava/lang/CharSequence;

    .line 174
    .line 175
    if-eqz v1, :cond_8

    .line 176
    .line 177
    :cond_7
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const-string v1, "mBreadCrumbShortTitleRes=#"

    .line 181
    .line 182
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget v1, p0, Ll3;->k:I

    .line 186
    .line 187
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const-string v1, " mBreadCrumbShortTitleText="

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object v1, p0, Ll3;->l:Ljava/lang/CharSequence;

    .line 200
    .line 201
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    :cond_8
    iget-object v1, p0, Ll3;->a:Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    if-nez v2, :cond_d

    .line 211
    .line 212
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    const-string v2, "Operations:"

    .line 216
    .line 217
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    :goto_0
    if-ge v0, v2, :cond_d

    .line 225
    .line 226
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    check-cast v3, Lw9;

    .line 231
    .line 232
    iget v4, v3, Lw9;->a:I

    .line 233
    .line 234
    packed-switch v4, :pswitch_data_0

    .line 235
    .line 236
    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v5, "cmd="

    .line 240
    .line 241
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget v5, v3, Lw9;->a:I

    .line 245
    .line 246
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    goto :goto_1

    .line 254
    :pswitch_0
    const-string v4, "OP_SET_MAX_LIFECYCLE"

    .line 255
    .line 256
    goto :goto_1

    .line 257
    :pswitch_1
    const-string v4, "UNSET_PRIMARY_NAV"

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :pswitch_2
    const-string v4, "SET_PRIMARY_NAV"

    .line 261
    .line 262
    goto :goto_1

    .line 263
    :pswitch_3
    const-string v4, "ATTACH"

    .line 264
    .line 265
    goto :goto_1

    .line 266
    :pswitch_4
    const-string v4, "DETACH"

    .line 267
    .line 268
    goto :goto_1

    .line 269
    :pswitch_5
    const-string v4, "SHOW"

    .line 270
    .line 271
    goto :goto_1

    .line 272
    :pswitch_6
    const-string v4, "HIDE"

    .line 273
    .line 274
    goto :goto_1

    .line 275
    :pswitch_7
    const-string v4, "REMOVE"

    .line 276
    .line 277
    goto :goto_1

    .line 278
    :pswitch_8
    const-string v4, "REPLACE"

    .line 279
    .line 280
    goto :goto_1

    .line 281
    :pswitch_9
    const-string v4, "ADD"

    .line 282
    .line 283
    goto :goto_1

    .line 284
    :pswitch_a
    const-string v4, "NULL"

    .line 285
    .line 286
    :goto_1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    const-string v5, "  Op #"

    .line 290
    .line 291
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 295
    .line 296
    .line 297
    const-string v5, ": "

    .line 298
    .line 299
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    const-string v4, " "

    .line 306
    .line 307
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    const/4 v4, 0x0

    .line 311
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 312
    .line 313
    .line 314
    if-eqz p3, :cond_c

    .line 315
    .line 316
    iget v4, v3, Lw9;->c:I

    .line 317
    .line 318
    if-nez v4, :cond_9

    .line 319
    .line 320
    iget v4, v3, Lw9;->d:I

    .line 321
    .line 322
    if-eqz v4, :cond_a

    .line 323
    .line 324
    :cond_9
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    const-string v4, "enterAnim=#"

    .line 328
    .line 329
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget v4, v3, Lw9;->c:I

    .line 333
    .line 334
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v4

    .line 338
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    const-string v4, " exitAnim=#"

    .line 342
    .line 343
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget v4, v3, Lw9;->d:I

    .line 347
    .line 348
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v4

    .line 352
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    :cond_a
    iget v4, v3, Lw9;->e:I

    .line 356
    .line 357
    if-nez v4, :cond_b

    .line 358
    .line 359
    iget v4, v3, Lw9;->f:I

    .line 360
    .line 361
    if-eqz v4, :cond_c

    .line 362
    .line 363
    :cond_b
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    const-string v4, "popEnterAnim=#"

    .line 367
    .line 368
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    iget v4, v3, Lw9;->e:I

    .line 372
    .line 373
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    const-string v4, " popExitAnim=#"

    .line 381
    .line 382
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    iget v3, v3, Lw9;->f:I

    .line 386
    .line 387
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    :cond_c
    add-int/lit8 v0, v0, 0x1

    .line 395
    .line 396
    goto/16 :goto_0

    .line 397
    .line 398
    :cond_d
    return-void

    .line 399
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v1, "FragmentManager"

    .line 3
    .line 4
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "Run: "

    .line 13
    .line 14
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-boolean p1, p0, Ll3;->g:Z

    .line 36
    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll3;->p:Lq9;

    .line 40
    .line 41
    iget-object p2, p1, Lq9;->d:Ljava/util/ArrayList;

    .line 42
    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    new-instance p2, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p2, p1, Lq9;->d:Ljava/util/ArrayList;

    .line 51
    .line 52
    :cond_1
    iget-object p1, p1, Lq9;->d:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "BackStackEntry{"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ll3;->q:I

    .line 25
    .line 26
    if-ltz v1, :cond_0

    .line 27
    .line 28
    const-string v1, " #"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v1, p0, Ll3;->q:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v1, p0, Ll3;->h:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    const-string v1, " "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll3;->h:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    :cond_1
    const-string v1, "}"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    return-object v0
.end method
