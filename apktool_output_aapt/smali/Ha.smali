.class public final LHa;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LN6;

.field public final b:Lt5;

.field public final c:Lt5;

.field public final d:Li0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    new-instance v0, LN6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LN6;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lt5;

    .line 7
    .line 8
    const/16 v2, 0x11

    .line 9
    .line 10
    invoke-direct {v1, v2}, Lt5;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Lt5;

    .line 14
    .line 15
    const/16 v3, 0xf

    .line 16
    .line 17
    invoke-direct {v2, v3}, Lt5;-><init>(I)V

    .line 18
    .line 19
    .line 20
    new-instance v3, Li0;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v4, "getContentResolver(...)"

    .line 27
    .line 28
    invoke-static {v4, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const/16 v4, 0xa

    .line 32
    .line 33
    invoke-direct {v3, v4, p1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, LHa;->a:LN6;

    .line 40
    .line 41
    iput-object v1, p0, LHa;->b:Lt5;

    .line 42
    .line 43
    iput-object v2, p0, LHa;->c:Lt5;

    .line 44
    .line 45
    iput-object v3, p0, LHa;->d:Li0;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public final a(Llc;Llc;Lr5;)Ljava/lang/Object;
    .locals 10

    .line 1
    instance-of v0, p3, Lxa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lxa;

    .line 7
    .line 8
    iget v1, v0, Lxa;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lxa;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lxa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lxa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lxa;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lxa;->j:I

    .line 30
    .line 31
    const/4 v3, 0x5

    .line 32
    const/4 v4, 0x4

    .line 33
    const/4 v5, 0x3

    .line 34
    const/4 v6, 0x2

    .line 35
    const/4 v7, 0x1

    .line 36
    if-eqz v2, :cond_5

    .line 37
    .line 38
    if-eq v2, v7, :cond_4

    .line 39
    .line 40
    if-eq v2, v6, :cond_3

    .line 41
    .line 42
    if-eq v2, v5, :cond_2

    .line 43
    .line 44
    if-eq v2, v4, :cond_2

    .line 45
    .line 46
    if-ne v2, v3, :cond_1

    .line 47
    .line 48
    iget-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p1, LOb;

    .line 51
    .line 52
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    check-cast p3, Lpg;

    .line 56
    .line 57
    :goto_1
    iget-object p2, p3, Lpg;->c:Ljava/lang/Object;

    .line 58
    .line 59
    goto/16 :goto_8

    .line 60
    .line 61
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 62
    .line 63
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 64
    .line 65
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw p1

    .line 69
    :cond_2
    iget-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p1, LOb;

    .line 72
    .line 73
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    check-cast p3, Lpg;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    iget-object p1, v0, Lxa;->g:Llc;

    .line 80
    .line 81
    check-cast p1, LOb;

    .line 82
    .line 83
    iget-object p2, v0, Lxa;->f:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p2, LHa;

    .line 86
    .line 87
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    check-cast p3, Lpg;

    .line 91
    .line 92
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 93
    .line 94
    goto/16 :goto_5

    .line 95
    .line 96
    :cond_4
    iget-object p2, v0, Lxa;->g:Llc;

    .line 97
    .line 98
    iget-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast p1, LHa;

    .line 101
    .line 102
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    check-cast p3, Lpg;

    .line 106
    .line 107
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    instance-of p3, p1, LOb;

    .line 114
    .line 115
    if-eqz p3, :cond_6

    .line 116
    .line 117
    check-cast p1, LOb;

    .line 118
    .line 119
    move-object p3, p2

    .line 120
    move-object p2, p0

    .line 121
    goto :goto_3

    .line 122
    :cond_6
    instance-of p3, p1, LPb;

    .line 123
    .line 124
    if-eqz p3, :cond_12

    .line 125
    .line 126
    check-cast p1, LPb;

    .line 127
    .line 128
    iput-object p0, v0, Lxa;->f:Ljava/lang/Object;

    .line 129
    .line 130
    iput-object p2, v0, Lxa;->g:Llc;

    .line 131
    .line 132
    iput v7, v0, Lxa;->j:I

    .line 133
    .line 134
    iget-object p3, p0, LHa;->a:LN6;

    .line 135
    .line 136
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    if-ne p3, v1, :cond_7

    .line 141
    .line 142
    return-object v1

    .line 143
    :cond_7
    move-object p1, p0

    .line 144
    :goto_2
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    if-nez v2, :cond_f

    .line 149
    .line 150
    check-cast p3, LOb;

    .line 151
    .line 152
    move-object v9, p2

    .line 153
    move-object p2, p1

    .line 154
    move-object p1, p3

    .line 155
    move-object p3, v9

    .line 156
    :goto_3
    iget-object v2, p2, LHa;->a:LN6;

    .line 157
    .line 158
    instance-of v8, p3, LOb;

    .line 159
    .line 160
    if-eqz v8, :cond_8

    .line 161
    .line 162
    :goto_4
    check-cast p3, LOb;

    .line 163
    .line 164
    move-object v9, p2

    .line 165
    move-object p2, p1

    .line 166
    move-object p1, p3

    .line 167
    move-object p3, v9

    .line 168
    goto :goto_6

    .line 169
    :cond_8
    instance-of v8, p3, LPb;

    .line 170
    .line 171
    if-eqz v8, :cond_10

    .line 172
    .line 173
    check-cast p3, LPb;

    .line 174
    .line 175
    iput-object p2, v0, Lxa;->f:Ljava/lang/Object;

    .line 176
    .line 177
    iput-object p1, v0, Lxa;->g:Llc;

    .line 178
    .line 179
    iput v6, v0, Lxa;->j:I

    .line 180
    .line 181
    invoke-virtual {v2, p3, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    if-ne p3, v1, :cond_9

    .line 186
    .line 187
    return-object v1

    .line 188
    :cond_9
    :goto_5
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    if-nez v2, :cond_f

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :goto_6
    instance-of v2, p2, LNb;

    .line 196
    .line 197
    const/4 v6, 0x0

    .line 198
    if-eqz v2, :cond_a

    .line 199
    .line 200
    instance-of v8, p1, LMb;

    .line 201
    .line 202
    if-eqz v8, :cond_a

    .line 203
    .line 204
    new-instance p2, LYa;

    .line 205
    .line 206
    const-string p3, "Copy is not allowed from local file to content:// file"

    .line 207
    .line 208
    invoke-direct {p2, p3, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 209
    .line 210
    .line 211
    :goto_7
    invoke-static {p2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    goto :goto_8

    .line 216
    :cond_a
    instance-of v8, p2, LMb;

    .line 217
    .line 218
    if-eqz v8, :cond_b

    .line 219
    .line 220
    instance-of v8, p1, LMb;

    .line 221
    .line 222
    if-eqz v8, :cond_b

    .line 223
    .line 224
    new-instance p2, Lbb;

    .line 225
    .line 226
    const-string p3, "Copy is not allowed from content:// to content://"

    .line 227
    .line 228
    invoke-direct {p2, p3, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    goto :goto_7

    .line 232
    :cond_b
    const-string v8, "null cannot be cast to non-null type io.ionic.libs.ionfilesystemlib.model.IONFILEUri.Resolved.Local"

    .line 233
    .line 234
    if-eqz v2, :cond_d

    .line 235
    .line 236
    check-cast p2, LNb;

    .line 237
    .line 238
    iget-object v2, p2, LNb;->m:Ljava/lang/String;

    .line 239
    .line 240
    invoke-static {v8, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 241
    .line 242
    .line 243
    move-object v3, p1

    .line 244
    check-cast v3, LNb;

    .line 245
    .line 246
    sget-object v8, Lsd;->d:Lsd;

    .line 247
    .line 248
    iget-object p2, p2, LNb;->o:Lsd;

    .line 249
    .line 250
    iget-object v3, v3, LNb;->m:Ljava/lang/String;

    .line 251
    .line 252
    if-ne p2, v8, :cond_c

    .line 253
    .line 254
    iget-object p2, p3, LHa;->c:Lt5;

    .line 255
    .line 256
    iput-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 257
    .line 258
    iput-object v6, v0, Lxa;->g:Llc;

    .line 259
    .line 260
    iput v5, v0, Lxa;->j:I

    .line 261
    .line 262
    invoke-virtual {p2, v2, v3, v0}, Lt5;->c(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object p2

    .line 266
    if-ne p2, v1, :cond_e

    .line 267
    .line 268
    return-object v1

    .line 269
    :cond_c
    iget-object p2, p3, LHa;->b:Lt5;

    .line 270
    .line 271
    iput-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 272
    .line 273
    iput-object v6, v0, Lxa;->g:Llc;

    .line 274
    .line 275
    iput v4, v0, Lxa;->j:I

    .line 276
    .line 277
    invoke-virtual {p2, v2, v3, v0}, Lt5;->d(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object p2

    .line 281
    if-ne p2, v1, :cond_e

    .line 282
    .line 283
    return-object v1

    .line 284
    :cond_d
    invoke-virtual {p2}, LOb;->R()Landroid/net/Uri;

    .line 285
    .line 286
    .line 287
    move-result-object p2

    .line 288
    invoke-static {v8, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 289
    .line 290
    .line 291
    move-object v2, p1

    .line 292
    check-cast v2, LNb;

    .line 293
    .line 294
    iget-object p3, p3, LHa;->d:Li0;

    .line 295
    .line 296
    iput-object p1, v0, Lxa;->f:Ljava/lang/Object;

    .line 297
    .line 298
    iput-object v6, v0, Lxa;->g:Llc;

    .line 299
    .line 300
    iput v3, v0, Lxa;->j:I

    .line 301
    .line 302
    iget-object v2, v2, LNb;->m:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {p3, p2, v2, v0}, Li0;->z(Landroid/net/Uri;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object p2

    .line 308
    if-ne p2, v1, :cond_e

    .line 309
    .line 310
    return-object v1

    .line 311
    :cond_e
    :goto_8
    instance-of p3, p2, Log;

    .line 312
    .line 313
    xor-int/2addr p3, v7

    .line 314
    if-eqz p3, :cond_11

    .line 315
    .line 316
    check-cast p2, Lfj;

    .line 317
    .line 318
    invoke-virtual {p1}, LOb;->R()Landroid/net/Uri;

    .line 319
    .line 320
    .line 321
    move-result-object p2

    .line 322
    goto :goto_9

    .line 323
    :cond_f
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    goto :goto_9

    .line 328
    :cond_10
    new-instance p1, LJ4;

    .line 329
    .line 330
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 331
    .line 332
    .line 333
    throw p1

    .line 334
    :cond_11
    :goto_9
    return-object p2

    .line 335
    :cond_12
    new-instance p1, LJ4;

    .line 336
    .line 337
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 338
    .line 339
    .line 340
    throw p1
.end method

.method public final b(Llc;LIa;Lr5;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p3, Lya;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lya;

    .line 7
    .line 8
    iget v1, v0, Lya;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lya;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lya;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lya;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lya;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lya;->j:I

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    if-eq v2, v4, :cond_2

    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    iget-object p1, v0, Lya;->f:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p1, LNb;

    .line 42
    .line 43
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    check-cast p3, Lpg;

    .line 47
    .line 48
    iget-object p2, p3, Lpg;->c:Ljava/lang/Object;

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p1

    .line 59
    :cond_2
    iget-object p2, v0, Lya;->g:LIa;

    .line 60
    .line 61
    iget-object p1, v0, Lya;->f:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, LHa;

    .line 64
    .line 65
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    check-cast p3, Lpg;

    .line 69
    .line 70
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    instance-of p3, p1, LOb;

    .line 77
    .line 78
    if-eqz p3, :cond_4

    .line 79
    .line 80
    check-cast p1, LOb;

    .line 81
    .line 82
    move-object p3, p2

    .line 83
    move-object p2, p0

    .line 84
    goto :goto_2

    .line 85
    :cond_4
    instance-of p3, p1, LPb;

    .line 86
    .line 87
    if-eqz p3, :cond_b

    .line 88
    .line 89
    check-cast p1, LPb;

    .line 90
    .line 91
    iput-object p0, v0, Lya;->f:Ljava/lang/Object;

    .line 92
    .line 93
    iput-object p2, v0, Lya;->g:LIa;

    .line 94
    .line 95
    iput v4, v0, Lya;->j:I

    .line 96
    .line 97
    iget-object p3, p0, LHa;->a:LN6;

    .line 98
    .line 99
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    if-ne p3, v1, :cond_5

    .line 104
    .line 105
    return-object v1

    .line 106
    :cond_5
    move-object p1, p0

    .line 107
    :goto_1
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-nez v2, :cond_9

    .line 112
    .line 113
    check-cast p3, LOb;

    .line 114
    .line 115
    move-object v6, p2

    .line 116
    move-object p2, p1

    .line 117
    move-object p1, p3

    .line 118
    move-object p3, v6

    .line 119
    :goto_2
    instance-of v2, p1, LNb;

    .line 120
    .line 121
    if-eqz v2, :cond_8

    .line 122
    .line 123
    check-cast p1, LNb;

    .line 124
    .line 125
    iget-object v2, p1, LNb;->o:Lsd;

    .line 126
    .line 127
    sget-object v5, Lsd;->c:Lsd;

    .line 128
    .line 129
    if-eq v2, v5, :cond_7

    .line 130
    .line 131
    iget-object p2, p2, LHa;->c:Lt5;

    .line 132
    .line 133
    iput-object p1, v0, Lya;->f:Ljava/lang/Object;

    .line 134
    .line 135
    const/4 v2, 0x0

    .line 136
    iput-object v2, v0, Lya;->g:LIa;

    .line 137
    .line 138
    iput v3, v0, Lya;->j:I

    .line 139
    .line 140
    iget-object v2, p1, LNb;->m:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p2, v2, p3, v0}, Lt5;->e(Ljava/lang/String;LIa;Lr5;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    if-ne p2, v1, :cond_6

    .line 147
    .line 148
    return-object v1

    .line 149
    :cond_6
    :goto_3
    instance-of p3, p2, Log;

    .line 150
    .line 151
    xor-int/2addr p3, v4

    .line 152
    if-eqz p3, :cond_a

    .line 153
    .line 154
    check-cast p2, Lfj;

    .line 155
    .line 156
    iget-object p2, p1, LNb;->n:Landroid/net/Uri;

    .line 157
    .line 158
    goto :goto_5

    .line 159
    :cond_7
    new-instance p1, Ljb;

    .line 160
    .line 161
    invoke-direct {p1}, Ljb;-><init>()V

    .line 162
    .line 163
    .line 164
    :goto_4
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    goto :goto_5

    .line 169
    :cond_8
    new-instance p1, Lhb;

    .line 170
    .line 171
    invoke-direct {p1}, Lhb;-><init>()V

    .line 172
    .line 173
    .line 174
    goto :goto_4

    .line 175
    :cond_9
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    :cond_a
    :goto_5
    return-object p2

    .line 180
    :cond_b
    new-instance p1, LJ4;

    .line 181
    .line 182
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 183
    .line 184
    .line 185
    throw p1
.end method

.method public final c(Llc;LJa;Lr5;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p3, Lza;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lza;

    .line 7
    .line 8
    iget v1, v0, Lza;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lza;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lza;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lza;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lza;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lza;->j:I

    .line 30
    .line 31
    const/4 v3, 0x4

    .line 32
    const/4 v4, 0x3

    .line 33
    const/4 v5, 0x2

    .line 34
    const/4 v6, 0x1

    .line 35
    if-eqz v2, :cond_4

    .line 36
    .line 37
    if-eq v2, v6, :cond_3

    .line 38
    .line 39
    if-eq v2, v5, :cond_2

    .line 40
    .line 41
    if-eq v2, v4, :cond_2

    .line 42
    .line 43
    if-ne v2, v3, :cond_1

    .line 44
    .line 45
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    check-cast p3, Lpg;

    .line 49
    .line 50
    :goto_1
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 51
    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    check-cast p3, Lpg;

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    iget-object p2, v0, Lza;->g:LJa;

    .line 69
    .line 70
    iget-object p1, v0, Lza;->f:LHa;

    .line 71
    .line 72
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    check-cast p3, Lpg;

    .line 76
    .line 77
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    instance-of p3, p1, LOb;

    .line 84
    .line 85
    if-eqz p3, :cond_5

    .line 86
    .line 87
    check-cast p1, LOb;

    .line 88
    .line 89
    move-object p3, p2

    .line 90
    move-object p2, p0

    .line 91
    goto :goto_3

    .line 92
    :cond_5
    instance-of p3, p1, LPb;

    .line 93
    .line 94
    if-eqz p3, :cond_b

    .line 95
    .line 96
    check-cast p1, LPb;

    .line 97
    .line 98
    iput-object p0, v0, Lza;->f:LHa;

    .line 99
    .line 100
    iput-object p2, v0, Lza;->g:LJa;

    .line 101
    .line 102
    iput v6, v0, Lza;->j:I

    .line 103
    .line 104
    iget-object p3, p0, LHa;->a:LN6;

    .line 105
    .line 106
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    if-ne p3, v1, :cond_6

    .line 111
    .line 112
    return-object v1

    .line 113
    :cond_6
    move-object p1, p0

    .line 114
    :goto_2
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    if-nez v2, :cond_9

    .line 119
    .line 120
    check-cast p3, LOb;

    .line 121
    .line 122
    move-object v7, p2

    .line 123
    move-object p2, p1

    .line 124
    move-object p1, p3

    .line 125
    move-object p3, v7

    .line 126
    :goto_3
    instance-of v2, p1, LNb;

    .line 127
    .line 128
    const/4 v6, 0x0

    .line 129
    if-eqz v2, :cond_8

    .line 130
    .line 131
    check-cast p1, LNb;

    .line 132
    .line 133
    iget-object v2, p1, LNb;->m:Ljava/lang/String;

    .line 134
    .line 135
    sget-object v3, Lsd;->d:Lsd;

    .line 136
    .line 137
    iget-object p1, p1, LNb;->o:Lsd;

    .line 138
    .line 139
    if-ne p1, v3, :cond_7

    .line 140
    .line 141
    iget-object p1, p2, LHa;->c:Lt5;

    .line 142
    .line 143
    iput-object v6, v0, Lza;->f:LHa;

    .line 144
    .line 145
    iput-object v6, v0, Lza;->g:LJa;

    .line 146
    .line 147
    iput v5, v0, Lza;->j:I

    .line 148
    .line 149
    invoke-virtual {p1, v2, p3, v0}, Lt5;->h(Ljava/lang/String;LJa;Lr5;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    if-ne p1, v1, :cond_a

    .line 154
    .line 155
    return-object v1

    .line 156
    :cond_7
    iget-object p1, p2, LHa;->b:Lt5;

    .line 157
    .line 158
    iput-object v6, v0, Lza;->f:LHa;

    .line 159
    .line 160
    iput-object v6, v0, Lza;->g:LJa;

    .line 161
    .line 162
    iput v4, v0, Lza;->j:I

    .line 163
    .line 164
    invoke-virtual {p1, v2, v0}, Lt5;->k(Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    if-ne p1, v1, :cond_a

    .line 169
    .line 170
    return-object v1

    .line 171
    :cond_8
    iget-object p2, p2, LHa;->d:Li0;

    .line 172
    .line 173
    invoke-virtual {p1}, LOb;->R()Landroid/net/Uri;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object v6, v0, Lza;->f:LHa;

    .line 178
    .line 179
    iput-object v6, v0, Lza;->g:LJa;

    .line 180
    .line 181
    iput v3, v0, Lza;->j:I

    .line 182
    .line 183
    invoke-virtual {p2, p1, v0}, Li0;->A(Landroid/net/Uri;Lr5;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    if-ne p1, v1, :cond_a

    .line 188
    .line 189
    return-object v1

    .line 190
    :cond_9
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    :cond_a
    :goto_4
    return-object p1

    .line 195
    :cond_b
    new-instance p1, LJ4;

    .line 196
    .line 197
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 198
    .line 199
    .line 200
    throw p1
.end method

.method public final d(LPb;Lr5;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p2, LAa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LAa;

    .line 7
    .line 8
    iget v1, v0, LAa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LAa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LAa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LAa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LAa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LAa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    check-cast p2, Lpg;

    .line 40
    .line 41
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 45
    .line 46
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 47
    .line 48
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p1

    .line 52
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iput v3, v0, LAa;->h:I

    .line 56
    .line 57
    iget-object p2, p0, LHa;->a:LN6;

    .line 58
    .line 59
    invoke-virtual {p2, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-ne p1, v1, :cond_3

    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_3
    :goto_1
    return-object p1
.end method

.method public final e(Llc;Lr5;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p2, LBa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LBa;

    .line 7
    .line 8
    iget v1, v0, LBa;->i:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LBa;->i:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LBa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LBa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LBa;->g:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LBa;->i:I

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    const/4 v4, 0x2

    .line 33
    const/4 v5, 0x1

    .line 34
    if-eqz v2, :cond_4

    .line 35
    .line 36
    if-eq v2, v5, :cond_3

    .line 37
    .line 38
    if-eq v2, v4, :cond_2

    .line 39
    .line 40
    if-ne v2, v3, :cond_1

    .line 41
    .line 42
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    check-cast p2, Lpg;

    .line 46
    .line 47
    :goto_1
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 48
    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p1

    .line 59
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    check-cast p2, Lpg;

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    iget-object p1, v0, LBa;->f:LHa;

    .line 66
    .line 67
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p2, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_4
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    instance-of p2, p1, LOb;

    .line 79
    .line 80
    if-eqz p2, :cond_5

    .line 81
    .line 82
    check-cast p1, LOb;

    .line 83
    .line 84
    move-object p2, p0

    .line 85
    goto :goto_3

    .line 86
    :cond_5
    instance-of p2, p1, LPb;

    .line 87
    .line 88
    if-eqz p2, :cond_a

    .line 89
    .line 90
    check-cast p1, LPb;

    .line 91
    .line 92
    iput-object p0, v0, LBa;->f:LHa;

    .line 93
    .line 94
    iput v5, v0, LBa;->i:I

    .line 95
    .line 96
    iget-object p2, p0, LHa;->a:LN6;

    .line 97
    .line 98
    invoke-virtual {p2, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    if-ne p2, v1, :cond_6

    .line 103
    .line 104
    return-object v1

    .line 105
    :cond_6
    move-object p1, p0

    .line 106
    :goto_2
    invoke-static {p2}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    if-nez v2, :cond_8

    .line 111
    .line 112
    check-cast p2, LOb;

    .line 113
    .line 114
    move-object v6, p2

    .line 115
    move-object p2, p1

    .line 116
    move-object p1, v6

    .line 117
    :goto_3
    instance-of v2, p1, LNb;

    .line 118
    .line 119
    const/4 v5, 0x0

    .line 120
    if-eqz v2, :cond_7

    .line 121
    .line 122
    iget-object p2, p2, LHa;->b:Lt5;

    .line 123
    .line 124
    check-cast p1, LNb;

    .line 125
    .line 126
    iget-object p1, p1, LNb;->m:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v5, v0, LBa;->f:LHa;

    .line 129
    .line 130
    iput v4, v0, LBa;->i:I

    .line 131
    .line 132
    invoke-virtual {p2, p1, v0}, Lt5;->m(Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-ne p1, v1, :cond_9

    .line 137
    .line 138
    return-object v1

    .line 139
    :cond_7
    iget-object p2, p2, LHa;->d:Li0;

    .line 140
    .line 141
    invoke-virtual {p1}, LOb;->R()Landroid/net/Uri;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object v5, v0, LBa;->f:LHa;

    .line 146
    .line 147
    iput v3, v0, LBa;->i:I

    .line 148
    .line 149
    invoke-virtual {p2, p1, v0}, Li0;->D(Landroid/net/Uri;Lr5;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    if-ne p1, v1, :cond_9

    .line 154
    .line 155
    return-object v1

    .line 156
    :cond_8
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    :cond_9
    :goto_4
    return-object p1

    .line 161
    :cond_a
    new-instance p1, LJ4;

    .line 162
    .line 163
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 164
    .line 165
    .line 166
    throw p1
.end method

.method public final f(Llc;Lr5;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p2, LCa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LCa;

    .line 7
    .line 8
    iget v1, v0, LCa;->i:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LCa;->i:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LCa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LCa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LCa;->g:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LCa;->i:I

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    if-eq v2, v4, :cond_2

    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    check-cast p2, Lpg;

    .line 43
    .line 44
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 45
    .line 46
    goto/16 :goto_4

    .line 47
    .line 48
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 49
    .line 50
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 51
    .line 52
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p1

    .line 56
    :cond_2
    iget-object p1, v0, LCa;->f:LHa;

    .line 57
    .line 58
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    check-cast p2, Lpg;

    .line 62
    .line 63
    iget-object p2, p2, Lpg;->c:Ljava/lang/Object;

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    instance-of p2, p1, LOb;

    .line 70
    .line 71
    if-eqz p2, :cond_4

    .line 72
    .line 73
    check-cast p1, LOb;

    .line 74
    .line 75
    move-object p2, p0

    .line 76
    goto :goto_2

    .line 77
    :cond_4
    instance-of p2, p1, LPb;

    .line 78
    .line 79
    if-eqz p2, :cond_a

    .line 80
    .line 81
    check-cast p1, LPb;

    .line 82
    .line 83
    iput-object p0, v0, LCa;->f:LHa;

    .line 84
    .line 85
    iput v4, v0, LCa;->i:I

    .line 86
    .line 87
    iget-object p2, p0, LHa;->a:LN6;

    .line 88
    .line 89
    invoke-virtual {p2, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    if-ne p2, v1, :cond_5

    .line 94
    .line 95
    return-object v1

    .line 96
    :cond_5
    move-object p1, p0

    .line 97
    :goto_1
    invoke-static {p2}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    if-nez v2, :cond_8

    .line 102
    .line 103
    check-cast p2, LOb;

    .line 104
    .line 105
    move-object v5, p2

    .line 106
    move-object p2, p1

    .line 107
    move-object p1, v5

    .line 108
    :goto_2
    instance-of v2, p1, LNb;

    .line 109
    .line 110
    if-eqz v2, :cond_7

    .line 111
    .line 112
    check-cast p1, LNb;

    .line 113
    .line 114
    iget-object v2, p1, LNb;->o:Lsd;

    .line 115
    .line 116
    sget-object v4, Lsd;->c:Lsd;

    .line 117
    .line 118
    if-eq v2, v4, :cond_6

    .line 119
    .line 120
    iget-object p2, p2, LHa;->c:Lt5;

    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    iput-object v2, v0, LCa;->f:LHa;

    .line 124
    .line 125
    iput v3, v0, LCa;->i:I

    .line 126
    .line 127
    iget-object p1, p1, LNb;->m:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p2, p1, v0}, Lt5;->s(Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    if-ne p1, v1, :cond_9

    .line 134
    .line 135
    return-object v1

    .line 136
    :cond_6
    new-instance p1, Ljb;

    .line 137
    .line 138
    invoke-direct {p1}, Ljb;-><init>()V

    .line 139
    .line 140
    .line 141
    :goto_3
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    goto :goto_4

    .line 146
    :cond_7
    new-instance p1, Lhb;

    .line 147
    .line 148
    invoke-direct {p1}, Lhb;-><init>()V

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    :cond_9
    :goto_4
    return-object p1

    .line 157
    :cond_a
    new-instance p1, LJ4;

    .line 158
    .line 159
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 160
    .line 161
    .line 162
    throw p1
.end method

.method public final g(Llc;Llc;Lr5;)Ljava/lang/Object;
    .locals 10

    .line 1
    instance-of v0, p3, LDa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LDa;

    .line 7
    .line 8
    iget v1, v0, LDa;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LDa;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LDa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LDa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LDa;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LDa;->j:I

    .line 30
    .line 31
    const/4 v3, 0x4

    .line 32
    const/4 v4, 0x3

    .line 33
    const/4 v5, 0x2

    .line 34
    const/4 v6, 0x1

    .line 35
    if-eqz v2, :cond_5

    .line 36
    .line 37
    if-eq v2, v6, :cond_4

    .line 38
    .line 39
    if-eq v2, v5, :cond_3

    .line 40
    .line 41
    if-eq v2, v4, :cond_2

    .line 42
    .line 43
    if-ne v2, v3, :cond_1

    .line 44
    .line 45
    iget-object p1, v0, LDa;->f:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, LNb;

    .line 48
    .line 49
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    check-cast p3, Lpg;

    .line 53
    .line 54
    :goto_1
    iget-object p2, p3, Lpg;->c:Ljava/lang/Object;

    .line 55
    .line 56
    goto/16 :goto_8

    .line 57
    .line 58
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 59
    .line 60
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 61
    .line 62
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :cond_2
    iget-object p1, v0, LDa;->f:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p1, LNb;

    .line 69
    .line 70
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    check-cast p3, Lpg;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_3
    iget-object p1, v0, LDa;->g:Llc;

    .line 77
    .line 78
    check-cast p1, LNb;

    .line 79
    .line 80
    iget-object p2, v0, LDa;->f:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast p2, LHa;

    .line 83
    .line 84
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    check-cast p3, Lpg;

    .line 88
    .line 89
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 90
    .line 91
    goto :goto_5

    .line 92
    :cond_4
    iget-object p2, v0, LDa;->g:Llc;

    .line 93
    .line 94
    iget-object p1, v0, LDa;->f:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast p1, LHa;

    .line 97
    .line 98
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    check-cast p3, Lpg;

    .line 102
    .line 103
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_5
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    instance-of p3, p1, LOb;

    .line 110
    .line 111
    if-eqz p3, :cond_6

    .line 112
    .line 113
    check-cast p1, LOb;

    .line 114
    .line 115
    move-object p3, p2

    .line 116
    move-object p2, p0

    .line 117
    goto :goto_3

    .line 118
    :cond_6
    instance-of p3, p1, LPb;

    .line 119
    .line 120
    if-eqz p3, :cond_12

    .line 121
    .line 122
    check-cast p1, LPb;

    .line 123
    .line 124
    iput-object p0, v0, LDa;->f:Ljava/lang/Object;

    .line 125
    .line 126
    iput-object p2, v0, LDa;->g:Llc;

    .line 127
    .line 128
    iput v6, v0, LDa;->j:I

    .line 129
    .line 130
    iget-object p3, p0, LHa;->a:LN6;

    .line 131
    .line 132
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    if-ne p3, v1, :cond_7

    .line 137
    .line 138
    return-object v1

    .line 139
    :cond_7
    move-object p1, p0

    .line 140
    :goto_2
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    if-nez v2, :cond_e

    .line 145
    .line 146
    check-cast p3, LOb;

    .line 147
    .line 148
    move-object v9, p2

    .line 149
    move-object p2, p1

    .line 150
    move-object p1, p3

    .line 151
    move-object p3, v9

    .line 152
    :goto_3
    instance-of v2, p1, LNb;

    .line 153
    .line 154
    if-eqz v2, :cond_10

    .line 155
    .line 156
    check-cast p1, LNb;

    .line 157
    .line 158
    iget-object v2, p2, LHa;->a:LN6;

    .line 159
    .line 160
    instance-of v7, p3, LOb;

    .line 161
    .line 162
    if-eqz v7, :cond_8

    .line 163
    .line 164
    :goto_4
    check-cast p3, LOb;

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :cond_8
    instance-of v7, p3, LPb;

    .line 168
    .line 169
    if-eqz v7, :cond_f

    .line 170
    .line 171
    check-cast p3, LPb;

    .line 172
    .line 173
    iput-object p2, v0, LDa;->f:Ljava/lang/Object;

    .line 174
    .line 175
    iput-object p1, v0, LDa;->g:Llc;

    .line 176
    .line 177
    iput v5, v0, LDa;->j:I

    .line 178
    .line 179
    invoke-virtual {v2, p3, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p3

    .line 183
    if-ne p3, v1, :cond_9

    .line 184
    .line 185
    return-object v1

    .line 186
    :cond_9
    :goto_5
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    if-nez v2, :cond_e

    .line 191
    .line 192
    goto :goto_4

    .line 193
    :goto_6
    instance-of v2, p3, LNb;

    .line 194
    .line 195
    if-eqz v2, :cond_d

    .line 196
    .line 197
    check-cast p3, LNb;

    .line 198
    .line 199
    iget-object v2, p1, LNb;->m:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v5, p3, LNb;->m:Ljava/lang/String;

    .line 202
    .line 203
    sget-object v7, Lsd;->d:Lsd;

    .line 204
    .line 205
    iget-object p1, p1, LNb;->o:Lsd;

    .line 206
    .line 207
    const/4 v8, 0x0

    .line 208
    if-ne p1, v7, :cond_b

    .line 209
    .line 210
    iget-object p1, p2, LHa;->c:Lt5;

    .line 211
    .line 212
    iput-object p3, v0, LDa;->f:Ljava/lang/Object;

    .line 213
    .line 214
    iput-object v8, v0, LDa;->g:Llc;

    .line 215
    .line 216
    iput v4, v0, LDa;->j:I

    .line 217
    .line 218
    invoke-virtual {p1, v2, v5, v0}, Lt5;->t(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    if-ne p1, v1, :cond_a

    .line 223
    .line 224
    return-object v1

    .line 225
    :cond_a
    move-object p2, p1

    .line 226
    goto :goto_7

    .line 227
    :cond_b
    iget-object p1, p2, LHa;->b:Lt5;

    .line 228
    .line 229
    iput-object p3, v0, LDa;->f:Ljava/lang/Object;

    .line 230
    .line 231
    iput-object v8, v0, LDa;->g:Llc;

    .line 232
    .line 233
    iput v3, v0, LDa;->j:I

    .line 234
    .line 235
    invoke-virtual {p1, v2, v5, v0}, Lt5;->y(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    if-ne p2, v1, :cond_c

    .line 240
    .line 241
    return-object v1

    .line 242
    :cond_c
    :goto_7
    move-object p1, p3

    .line 243
    :goto_8
    instance-of p3, p2, Log;

    .line 244
    .line 245
    xor-int/2addr p3, v6

    .line 246
    if-eqz p3, :cond_11

    .line 247
    .line 248
    check-cast p2, Lfj;

    .line 249
    .line 250
    iget-object p2, p1, LNb;->n:Landroid/net/Uri;

    .line 251
    .line 252
    goto :goto_a

    .line 253
    :cond_d
    new-instance p1, Lhb;

    .line 254
    .line 255
    invoke-direct {p1}, Lhb;-><init>()V

    .line 256
    .line 257
    .line 258
    :goto_9
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 259
    .line 260
    .line 261
    move-result-object p2

    .line 262
    goto :goto_a

    .line 263
    :cond_e
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    goto :goto_a

    .line 268
    :cond_f
    new-instance p1, LJ4;

    .line 269
    .line 270
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 271
    .line 272
    .line 273
    throw p1

    .line 274
    :cond_10
    new-instance p1, Lhb;

    .line 275
    .line 276
    invoke-direct {p1}, Lhb;-><init>()V

    .line 277
    .line 278
    .line 279
    goto :goto_9

    .line 280
    :cond_11
    :goto_a
    return-object p2

    .line 281
    :cond_12
    new-instance p1, LJ4;

    .line 282
    .line 283
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 284
    .line 285
    .line 286
    throw p1
.end method

.method public final h(Llc;LJb;Lr5;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p3, LEa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LEa;

    .line 7
    .line 8
    iget v1, v0, LEa;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LEa;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LEa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LEa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LEa;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LEa;->j:I

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    const/4 v4, 0x2

    .line 33
    const/4 v5, 0x1

    .line 34
    if-eqz v2, :cond_4

    .line 35
    .line 36
    if-eq v2, v5, :cond_3

    .line 37
    .line 38
    if-eq v2, v4, :cond_2

    .line 39
    .line 40
    if-ne v2, v3, :cond_1

    .line 41
    .line 42
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    check-cast p3, Lpg;

    .line 46
    .line 47
    :goto_1
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 48
    .line 49
    goto/16 :goto_5

    .line 50
    .line 51
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p1

    .line 59
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    check-cast p3, Lpg;

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_3
    iget-object p2, v0, LEa;->g:LJb;

    .line 66
    .line 67
    iget-object p1, v0, LEa;->f:LHa;

    .line 68
    .line 69
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    check-cast p3, Lpg;

    .line 73
    .line 74
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_4
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    instance-of p3, p1, LOb;

    .line 81
    .line 82
    if-eqz p3, :cond_5

    .line 83
    .line 84
    check-cast p1, LOb;

    .line 85
    .line 86
    move-object p3, p2

    .line 87
    move-object p2, p0

    .line 88
    goto :goto_3

    .line 89
    :cond_5
    instance-of p3, p1, LPb;

    .line 90
    .line 91
    if-eqz p3, :cond_c

    .line 92
    .line 93
    check-cast p1, LPb;

    .line 94
    .line 95
    iput-object p0, v0, LEa;->f:LHa;

    .line 96
    .line 97
    iput-object p2, v0, LEa;->g:LJb;

    .line 98
    .line 99
    iput v5, v0, LEa;->j:I

    .line 100
    .line 101
    iget-object p3, p0, LHa;->a:LN6;

    .line 102
    .line 103
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    if-ne p3, v1, :cond_6

    .line 108
    .line 109
    return-object v1

    .line 110
    :cond_6
    move-object p1, p0

    .line 111
    :goto_2
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    if-nez v2, :cond_a

    .line 116
    .line 117
    check-cast p3, LOb;

    .line 118
    .line 119
    move-object v7, p2

    .line 120
    move-object p2, p1

    .line 121
    move-object p1, p3

    .line 122
    move-object p3, v7

    .line 123
    :goto_3
    instance-of v2, p1, LNb;

    .line 124
    .line 125
    if-eqz v2, :cond_8

    .line 126
    .line 127
    move-object v5, p1

    .line 128
    check-cast v5, LNb;

    .line 129
    .line 130
    iget-object v5, v5, LNb;->o:Lsd;

    .line 131
    .line 132
    sget-object v6, Lsd;->d:Lsd;

    .line 133
    .line 134
    if-eq v5, v6, :cond_7

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_7
    new-instance p1, Lib;

    .line 138
    .line 139
    invoke-direct {p1}, Lib;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    goto :goto_5

    .line 147
    :cond_8
    :goto_4
    const/4 v5, 0x0

    .line 148
    if-eqz v2, :cond_9

    .line 149
    .line 150
    iget-object p2, p2, LHa;->b:Lt5;

    .line 151
    .line 152
    check-cast p1, LNb;

    .line 153
    .line 154
    iget-object p1, p1, LNb;->m:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v5, v0, LEa;->f:LHa;

    .line 157
    .line 158
    iput-object v5, v0, LEa;->g:LJb;

    .line 159
    .line 160
    iput v4, v0, LEa;->j:I

    .line 161
    .line 162
    invoke-virtual {p2, p1, p3, v0}, Lt5;->x(Ljava/lang/String;LJb;Lr5;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    if-ne p1, v1, :cond_b

    .line 167
    .line 168
    return-object v1

    .line 169
    :cond_9
    iget-object p2, p2, LHa;->d:Li0;

    .line 170
    .line 171
    invoke-virtual {p1}, LOb;->R()Landroid/net/Uri;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iput-object v5, v0, LEa;->f:LHa;

    .line 176
    .line 177
    iput-object v5, v0, LEa;->g:LJb;

    .line 178
    .line 179
    iput v3, v0, LEa;->j:I

    .line 180
    .line 181
    invoke-virtual {p2, p1, p3, v0}, Li0;->G(Landroid/net/Uri;LJb;Lr5;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    if-ne p1, v1, :cond_b

    .line 186
    .line 187
    return-object v1

    .line 188
    :cond_a
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    :cond_b
    :goto_5
    return-object p1

    .line 193
    :cond_c
    new-instance p1, LJ4;

    .line 194
    .line 195
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 196
    .line 197
    .line 198
    throw p1
.end method

.method public final i(Llc;LLb;Lr5;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p3, LGa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LGa;

    .line 7
    .line 8
    iget v1, v0, LGa;->j:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LGa;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LGa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LGa;-><init>(LHa;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LGa;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LGa;->j:I

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    if-eq v2, v4, :cond_2

    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    iget-object p1, v0, LGa;->f:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p1, LNb;

    .line 42
    .line 43
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    check-cast p3, Lpg;

    .line 47
    .line 48
    iget-object p2, p3, Lpg;->c:Ljava/lang/Object;

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p1

    .line 59
    :cond_2
    iget-object p2, v0, LGa;->g:LLb;

    .line 60
    .line 61
    iget-object p1, v0, LGa;->f:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, LHa;

    .line 64
    .line 65
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    check-cast p3, Lpg;

    .line 69
    .line 70
    iget-object p3, p3, Lpg;->c:Ljava/lang/Object;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    instance-of p3, p1, LOb;

    .line 77
    .line 78
    if-eqz p3, :cond_4

    .line 79
    .line 80
    check-cast p1, LOb;

    .line 81
    .line 82
    move-object p3, p2

    .line 83
    move-object p2, p0

    .line 84
    goto :goto_2

    .line 85
    :cond_4
    instance-of p3, p1, LPb;

    .line 86
    .line 87
    if-eqz p3, :cond_b

    .line 88
    .line 89
    check-cast p1, LPb;

    .line 90
    .line 91
    iput-object p0, v0, LGa;->f:Ljava/lang/Object;

    .line 92
    .line 93
    iput-object p2, v0, LGa;->g:LLb;

    .line 94
    .line 95
    iput v4, v0, LGa;->j:I

    .line 96
    .line 97
    iget-object p3, p0, LHa;->a:LN6;

    .line 98
    .line 99
    invoke-virtual {p3, p1, v0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    if-ne p3, v1, :cond_5

    .line 104
    .line 105
    return-object v1

    .line 106
    :cond_5
    move-object p1, p0

    .line 107
    :goto_1
    invoke-static {p3}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    if-nez v2, :cond_9

    .line 112
    .line 113
    check-cast p3, LOb;

    .line 114
    .line 115
    move-object v6, p2

    .line 116
    move-object p2, p1

    .line 117
    move-object p1, p3

    .line 118
    move-object p3, v6

    .line 119
    :goto_2
    instance-of v2, p1, LNb;

    .line 120
    .line 121
    if-eqz v2, :cond_8

    .line 122
    .line 123
    check-cast p1, LNb;

    .line 124
    .line 125
    iget-object v2, p1, LNb;->o:Lsd;

    .line 126
    .line 127
    sget-object v5, Lsd;->d:Lsd;

    .line 128
    .line 129
    if-eq v2, v5, :cond_7

    .line 130
    .line 131
    iget-object p2, p2, LHa;->b:Lt5;

    .line 132
    .line 133
    iput-object p1, v0, LGa;->f:Ljava/lang/Object;

    .line 134
    .line 135
    const/4 v2, 0x0

    .line 136
    iput-object v2, v0, LGa;->g:LLb;

    .line 137
    .line 138
    iput v3, v0, LGa;->j:I

    .line 139
    .line 140
    iget-object v2, p1, LNb;->m:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p2, v2, p3, v0}, Lt5;->z(Ljava/lang/String;LLb;Lr5;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    if-ne p2, v1, :cond_6

    .line 147
    .line 148
    return-object v1

    .line 149
    :cond_6
    :goto_3
    instance-of p3, p2, Log;

    .line 150
    .line 151
    xor-int/2addr p3, v4

    .line 152
    if-eqz p3, :cond_a

    .line 153
    .line 154
    check-cast p2, Lfj;

    .line 155
    .line 156
    iget-object p2, p1, LNb;->n:Landroid/net/Uri;

    .line 157
    .line 158
    goto :goto_5

    .line 159
    :cond_7
    new-instance p1, Lib;

    .line 160
    .line 161
    invoke-direct {p1}, Lib;-><init>()V

    .line 162
    .line 163
    .line 164
    :goto_4
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    goto :goto_5

    .line 169
    :cond_8
    new-instance p1, Lhb;

    .line 170
    .line 171
    invoke-direct {p1}, Lhb;-><init>()V

    .line 172
    .line 173
    .line 174
    goto :goto_4

    .line 175
    :cond_9
    invoke-static {v2}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    :cond_a
    :goto_5
    return-object p2

    .line 180
    :cond_b
    new-instance p1, LJ4;

    .line 181
    .line 182
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 183
    .line 184
    .line 185
    throw p1
.end method
