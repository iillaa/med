.class public abstract Lu6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LXj;


# static fields
.field public static A:Ljava/lang/reflect/Field;

.field public static B:Z

.field public static C:J

.field public static D:Ljava/lang/reflect/Method;

.field public static final a:[[F

.field public static final b:[[F

.field public static final c:[F

.field public static final d:[[F

.field public static final e:[I

.field public static final f:[Ljava/lang/Object;

.field public static final g:Li0;

.field public static final h:Li0;

.field public static final i:Li0;

.field public static final j:Li0;

.field public static final k:Li0;

.field public static final l:LC7;

.field public static final m:LC7;

.field public static final n:[B

.field public static final o:[B

.field public static final p:[B

.field public static final q:[B

.field public static final r:[B

.field public static final s:[B

.field public static final t:[B

.field public static u:Ljava/lang/reflect/Field;

.field public static v:Z

.field public static w:Ljava/lang/Class;

.field public static x:Z

.field public static y:Ljava/lang/reflect/Field;

.field public static z:Z


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/16 v2, 0x14

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x4

    .line 7
    const/4 v5, 0x3

    .line 8
    new-array v6, v5, [F

    .line 9
    .line 10
    fill-array-data v6, :array_0

    .line 11
    .line 12
    .line 13
    new-array v7, v5, [F

    .line 14
    .line 15
    fill-array-data v7, :array_1

    .line 16
    .line 17
    .line 18
    new-array v8, v5, [F

    .line 19
    .line 20
    fill-array-data v8, :array_2

    .line 21
    .line 22
    .line 23
    new-array v9, v5, [[F

    .line 24
    .line 25
    aput-object v6, v9, v3

    .line 26
    .line 27
    aput-object v7, v9, v1

    .line 28
    .line 29
    aput-object v8, v9, v0

    .line 30
    .line 31
    sput-object v9, Lu6;->a:[[F

    .line 32
    .line 33
    new-array v6, v5, [F

    .line 34
    .line 35
    fill-array-data v6, :array_3

    .line 36
    .line 37
    .line 38
    new-array v7, v5, [F

    .line 39
    .line 40
    fill-array-data v7, :array_4

    .line 41
    .line 42
    .line 43
    new-array v8, v5, [F

    .line 44
    .line 45
    fill-array-data v8, :array_5

    .line 46
    .line 47
    .line 48
    new-array v9, v5, [[F

    .line 49
    .line 50
    aput-object v6, v9, v3

    .line 51
    .line 52
    aput-object v7, v9, v1

    .line 53
    .line 54
    aput-object v8, v9, v0

    .line 55
    .line 56
    sput-object v9, Lu6;->b:[[F

    .line 57
    .line 58
    new-array v6, v5, [F

    .line 59
    .line 60
    fill-array-data v6, :array_6

    .line 61
    .line 62
    .line 63
    sput-object v6, Lu6;->c:[F

    .line 64
    .line 65
    new-array v6, v5, [F

    .line 66
    .line 67
    fill-array-data v6, :array_7

    .line 68
    .line 69
    .line 70
    new-array v7, v5, [F

    .line 71
    .line 72
    fill-array-data v7, :array_8

    .line 73
    .line 74
    .line 75
    new-array v8, v5, [F

    .line 76
    .line 77
    fill-array-data v8, :array_9

    .line 78
    .line 79
    .line 80
    new-array v5, v5, [[F

    .line 81
    .line 82
    aput-object v6, v5, v3

    .line 83
    .line 84
    aput-object v7, v5, v1

    .line 85
    .line 86
    aput-object v8, v5, v0

    .line 87
    .line 88
    sput-object v5, Lu6;->d:[[F

    .line 89
    .line 90
    new-array v0, v3, [I

    .line 91
    .line 92
    sput-object v0, Lu6;->e:[I

    .line 93
    .line 94
    new-array v0, v3, [Ljava/lang/Object;

    .line 95
    .line 96
    sput-object v0, Lu6;->f:[Ljava/lang/Object;

    .line 97
    .line 98
    new-instance v0, Li0;

    .line 99
    .line 100
    const-string v5, "COMPLETING_ALREADY"

    .line 101
    .line 102
    invoke-direct {v0, v2, v5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    sput-object v0, Lu6;->g:Li0;

    .line 106
    .line 107
    new-instance v0, Li0;

    .line 108
    .line 109
    const-string v5, "COMPLETING_WAITING_CHILDREN"

    .line 110
    .line 111
    invoke-direct {v0, v2, v5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    sput-object v0, Lu6;->h:Li0;

    .line 115
    .line 116
    new-instance v0, Li0;

    .line 117
    .line 118
    const-string v5, "COMPLETING_RETRY"

    .line 119
    .line 120
    invoke-direct {v0, v2, v5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    sput-object v0, Lu6;->i:Li0;

    .line 124
    .line 125
    new-instance v0, Li0;

    .line 126
    .line 127
    const-string v5, "TOO_LATE_TO_CANCEL"

    .line 128
    .line 129
    invoke-direct {v0, v2, v5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    sput-object v0, Lu6;->j:Li0;

    .line 133
    .line 134
    new-instance v0, Li0;

    .line 135
    .line 136
    const-string v5, "SEALED"

    .line 137
    .line 138
    invoke-direct {v0, v2, v5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    sput-object v0, Lu6;->k:Li0;

    .line 142
    .line 143
    new-instance v0, LC7;

    .line 144
    .line 145
    invoke-direct {v0, v3}, LC7;-><init>(Z)V

    .line 146
    .line 147
    .line 148
    sput-object v0, Lu6;->l:LC7;

    .line 149
    .line 150
    new-instance v0, LC7;

    .line 151
    .line 152
    invoke-direct {v0, v1}, LC7;-><init>(Z)V

    .line 153
    .line 154
    .line 155
    sput-object v0, Lu6;->m:LC7;

    .line 156
    .line 157
    new-array v0, v4, [B

    .line 158
    .line 159
    fill-array-data v0, :array_a

    .line 160
    .line 161
    .line 162
    sput-object v0, Lu6;->n:[B

    .line 163
    .line 164
    new-array v0, v4, [B

    .line 165
    .line 166
    fill-array-data v0, :array_b

    .line 167
    .line 168
    .line 169
    sput-object v0, Lu6;->o:[B

    .line 170
    .line 171
    new-array v0, v4, [B

    .line 172
    .line 173
    fill-array-data v0, :array_c

    .line 174
    .line 175
    .line 176
    sput-object v0, Lu6;->p:[B

    .line 177
    .line 178
    new-array v0, v4, [B

    .line 179
    .line 180
    fill-array-data v0, :array_d

    .line 181
    .line 182
    .line 183
    sput-object v0, Lu6;->q:[B

    .line 184
    .line 185
    new-array v0, v4, [B

    .line 186
    .line 187
    fill-array-data v0, :array_e

    .line 188
    .line 189
    .line 190
    sput-object v0, Lu6;->r:[B

    .line 191
    .line 192
    new-array v0, v4, [B

    .line 193
    .line 194
    fill-array-data v0, :array_f

    .line 195
    .line 196
    .line 197
    sput-object v0, Lu6;->s:[B

    .line 198
    .line 199
    new-array v0, v4, [B

    .line 200
    .line 201
    fill-array-data v0, :array_10

    .line 202
    .line 203
    .line 204
    sput-object v0, Lu6;->t:[B

    .line 205
    .line 206
    return-void

    .line 207
    :array_0
    .array-data 4
        0x3ecd759f
        0x3f2671bd
        -0x42ad373b    # -0.051461f
    .end array-data

    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    :array_1
    .array-data 4
        -0x417fdcdf
        0x3f9a2a3d
        0x3d3bd167
    .end array-data

    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    :array_2
    .array-data 4
        -0x44f7c02b    # -0.002079f
        0x3d4881e4
        0x3f740022
    .end array-data

    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    :array_3
    .array-data 4
        0x3fee583d
        -0x407e8f35
        0x3e18c46b
    .end array-data

    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    :array_4
    .array-data 4
        0x3ec669e1
        0x3f1f172e
        -0x43ecf866
    .end array-data

    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :array_5
    .array-data 4
        -0x437e39f7
        -0x42f43b81
        0x3f86653c
    .end array-data

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    :array_6
    .array-data 4
        0x42be1810
        0x42c80000    # 100.0f
        0x42d9c419
    .end array-data

    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    :array_7
    .array-data 4
        0x3ed31e17
        0x3eb71a0d
        0x3e38d7b9
    .end array-data

    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    :array_8
    .array-data 4
        0x3e59b3d0    # 0.2126f
        0x3f371759    # 0.7152f
        0x3d93dd98    # 0.0722f
    .end array-data

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    :array_9
    .array-data 4
        0x3c9e47ef
        0x3df40c29
        0x3f7349cc
    .end array-data

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    :array_a
    .array-data 1
        0x30t
        0x31t
        0x35t
        0x0t
    .end array-data

    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    :array_b
    .array-data 1
        0x30t
        0x31t
        0x30t
        0x0t
    .end array-data

    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    :array_c
    .array-data 1
        0x30t
        0x30t
        0x39t
        0x0t
    .end array-data

    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    :array_d
    .array-data 1
        0x30t
        0x30t
        0x35t
        0x0t
    .end array-data

    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    :array_e
    .array-data 1
        0x30t
        0x30t
        0x31t
        0x0t
    .end array-data

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    :array_f
    .array-data 1
        0x30t
        0x30t
        0x31t
        0x0t
    .end array-data

    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    :array_10
    .array-data 1
        0x30t
        0x30t
        0x32t
        0x0t
    .end array-data
.end method

.method public static final B(Lr5;)Ljava/lang/String;
    .locals 3

    .line 1
    instance-of v0, p0, LO6;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LO6;

    .line 6
    .line 7
    invoke-virtual {p0}, LO6;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_2

    .line 12
    :cond_0
    const/16 v0, 0x40

    .line 13
    .line 14
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Lu6;->m(Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v1

    .line 38
    invoke-static {v1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    invoke-static {v1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-static {p0}, Lu6;->m(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    :goto_1
    move-object p0, v1

    .line 80
    check-cast p0, Ljava/lang/String;

    .line 81
    .line 82
    :goto_2
    return-object p0
.end method

.method public static final C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;
    .locals 7

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Llb;

    .line 7
    .line 8
    const-string v1, "\' "

    .line 9
    .line 10
    const-string v2, "\'"

    .line 11
    .line 12
    const-string v3, "path"

    .line 13
    .line 14
    const-string v4, ""

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object p0, Lg8;->a:Lf8;

    .line 20
    .line 21
    check-cast p1, Llb;

    .line 22
    .line 23
    iget-object p0, p1, Llb;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v3, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Lf8;

    .line 29
    .line 30
    const/4 v0, 0x6

    .line 31
    invoke-static {v0}, Lg8;->b(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p0}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    xor-int/2addr v3, v5

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    invoke-static {v2, p0, v1}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    :cond_0
    const-string p0, "Invalid "

    .line 47
    .line 48
    const-string v1, "path."

    .line 49
    .line 50
    invoke-static {p0, v4, v1}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-direct {p1, v0, p0}, Lf8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_6

    .line 58
    .line 59
    :cond_1
    instance-of v0, p1, Lgb;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    sget-object v0, Lg8;->a:Lf8;

    .line 64
    .line 65
    check-cast p1, Lgb;

    .line 66
    .line 67
    iget-object p1, p1, Lgb;->c:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v3, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Lf8;

    .line 73
    .line 74
    const/16 v3, 0x8

    .line 75
    .line 76
    invoke-static {v3}, Lg8;->b(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {p1}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    xor-int/2addr v5, v6

    .line 85
    if-eqz v5, :cond_2

    .line 86
    .line 87
    const-string v4, "at \'"

    .line 88
    .line 89
    invoke-static {v4, p1, v1}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p0, "\' failed because file "

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p0, "does not exist."

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-direct {v0, v3, p0}, Lf8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    move-object p1, v0

    .line 122
    goto/16 :goto_6

    .line 123
    .line 124
    :cond_3
    instance-of v0, p1, Lhb;

    .line 125
    .line 126
    if-eqz v0, :cond_4

    .line 127
    .line 128
    const-string p1, "content:// URIs"

    .line 129
    .line 130
    :goto_0
    invoke-static {p0, p1}, Lg8;->d(Ljava/lang/String;Ljava/lang/String;)Lf8;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    goto/16 :goto_6

    .line 135
    .line 136
    :cond_4
    instance-of v0, p1, Lib;

    .line 137
    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    const-string p1, "directories"

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_5
    instance-of v0, p1, Ljb;

    .line 144
    .line 145
    if-eqz v0, :cond_6

    .line 146
    .line 147
    const-string p1, "files, only directories are supported"

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_6
    instance-of v0, p1, Ldb;

    .line 151
    .line 152
    if-eqz v0, :cond_7

    .line 153
    .line 154
    sget-object p0, Lg8;->a:Lf8;

    .line 155
    .line 156
    check-cast p1, Ldb;

    .line 157
    .line 158
    iget-object p0, p1, Ldb;->c:Ljava/lang/String;

    .line 159
    .line 160
    :goto_1
    invoke-static {p0}, Lg8;->a(Ljava/lang/String;)Lf8;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    goto :goto_6

    .line 165
    :cond_7
    instance-of v0, p1, Leb;

    .line 166
    .line 167
    if-eqz v0, :cond_8

    .line 168
    .line 169
    :goto_2
    sget-object p1, Lg8;->b:Lf8;

    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_8
    instance-of v0, p1, Lfb;

    .line 173
    .line 174
    if-eqz v0, :cond_9

    .line 175
    .line 176
    sget-object p1, Lg8;->c:Lf8;

    .line 177
    .line 178
    goto :goto_6

    .line 179
    :cond_9
    instance-of v0, p1, LZa;

    .line 180
    .line 181
    if-eqz v0, :cond_a

    .line 182
    .line 183
    move v0, v5

    .line 184
    goto :goto_3

    .line 185
    :cond_a
    instance-of v0, p1, LYa;

    .line 186
    .line 187
    :goto_3
    if-eqz v0, :cond_b

    .line 188
    .line 189
    goto :goto_4

    .line 190
    :cond_b
    instance-of v5, p1, Lbb;

    .line 191
    .line 192
    :goto_4
    if-eqz v5, :cond_c

    .line 193
    .line 194
    const-string p1, "the provided source and destinations"

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_c
    instance-of v0, p1, LXa;

    .line 198
    .line 199
    if-eqz v0, :cond_d

    .line 200
    .line 201
    sget-object p0, Lg8;->a:Lf8;

    .line 202
    .line 203
    check-cast p1, LXa;

    .line 204
    .line 205
    iget-object p0, p1, LXa;->c:Ljava/lang/String;

    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_d
    instance-of v0, p1, Lab;

    .line 209
    .line 210
    if-eqz v0, :cond_e

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_e
    sget-object v0, Lg8;->a:Lf8;

    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    if-nez p1, :cond_f

    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_f
    move-object v4, p1

    .line 223
    :goto_5
    invoke-static {p0, v4}, Lg8;->e(Ljava/lang/String;Ljava/lang/String;)Lf8;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    :goto_6
    return-object p1
.end method

.method public static D()F
    .locals 4

    .line 1
    const/high16 v0, 0x42480000    # 50.0f

    .line 2
    .line 3
    float-to-double v0, v0

    .line 4
    const-wide/high16 v2, 0x4030000000000000L    # 16.0

    .line 5
    .line 6
    add-double/2addr v0, v2

    .line 7
    const-wide/high16 v2, 0x405d000000000000L    # 116.0

    .line 8
    .line 9
    div-double/2addr v0, v2

    .line 10
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    double-to-float v0, v0

    .line 17
    const/high16 v1, 0x42c80000    # 100.0f

    .line 18
    .line 19
    mul-float/2addr v0, v1

    .line 20
    return v0
.end method

.method public static final d(Lqi;Lo8;Ljava/lang/Throwable;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LC8;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LC8;

    .line 7
    .line 8
    iget v1, v0, LC8;->h:I

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
    iput v1, v0, LC8;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LC8;

    .line 21
    .line 22
    invoke-direct {v0, p3}, Ls5;-><init>(Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LC8;->g:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LC8;->h:I

    .line 30
    .line 31
    sget-object v3, Lfj;->a:Lfj;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v4, :cond_1

    .line 37
    .line 38
    iget-object p2, v0, LC8;->f:Ljava/lang/Throwable;

    .line 39
    .line 40
    :try_start_0
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 47
    .line 48
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 49
    .line 50
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0

    .line 54
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :try_start_1
    iput-object p2, v0, LC8;->f:Ljava/lang/Throwable;

    .line 58
    .line 59
    iput v4, v0, LC8;->h:I

    .line 60
    .line 61
    invoke-virtual {p1, p0, p2, v0}, Lo8;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    .line 64
    if-ne v3, v1, :cond_3

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    :goto_1
    move-object v1, v3

    .line 68
    :goto_2
    return-object v1

    .line 69
    :goto_3
    if-eqz p2, :cond_4

    .line 70
    .line 71
    if-eq p2, p0, :cond_4

    .line 72
    .line 73
    invoke-static {p0, p2}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    throw p0
.end method

.method public static e(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x7f

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static final f(II[I)I
    .locals 3

    .line 1
    const-string v0, "array"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    add-int/lit8 p0, p0, -0x1

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-gt v0, p0, :cond_2

    .line 10
    .line 11
    add-int v1, v0, p0

    .line 12
    .line 13
    ushr-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    aget v2, p2, v1

    .line 16
    .line 17
    if-ge v2, p1, :cond_0

    .line 18
    .line 19
    add-int/lit8 v0, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-le v2, p1, :cond_1

    .line 23
    .line 24
    add-int/lit8 p0, v1, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return v1

    .line 28
    :cond_2
    not-int p0, v0

    .line 29
    return p0
.end method

.method public static final g([JIJ)I
    .locals 4

    .line 1
    const-string v0, "array"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    add-int/lit8 p1, p1, -0x1

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-gt v0, p1, :cond_2

    .line 10
    .line 11
    add-int v1, v0, p1

    .line 12
    .line 13
    ushr-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    aget-wide v2, p0, v1

    .line 16
    .line 17
    cmp-long v2, v2, p2

    .line 18
    .line 19
    if-gez v2, :cond_0

    .line 20
    .line 21
    add-int/lit8 v0, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-lez v2, :cond_1

    .line 25
    .line 26
    add-int/lit8 p1, v1, -0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v1

    .line 30
    :cond_2
    not-int p0, v0

    .line 31
    return p0
.end method

.method public static i(III)V
    .locals 3

    .line 1
    const-string v0, "fromIndex: "

    .line 2
    .line 3
    if-ltz p0, :cond_1

    .line 4
    .line 5
    if-gt p1, p2, :cond_1

    .line 6
    .line 7
    if-gt p0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p0, " > toIndex: "

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p2

    .line 36
    :cond_1
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, ", toIndex: "

    .line 47
    .line 48
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, ", size: "

    .line 55
    .line 56
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {v1, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw v1
.end method

.method public static j(Landroid/content/Context;Ljava/lang/String;)I
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v3, -0x1

    .line 18
    if-ne v0, v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_0
    invoke-static {p1}, Landroid/app/AppOpsManager;->permissionToOp(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v0, 0x0

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    :goto_0
    move v3, v0

    .line 30
    goto/16 :goto_4

    .line 31
    .line 32
    :cond_1
    if-nez v2, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-eqz v2, :cond_a

    .line 43
    .line 44
    array-length v4, v2

    .line 45
    if-gtz v4, :cond_2

    .line 46
    .line 47
    goto :goto_4

    .line 48
    :cond_2
    aget-object v2, v2, v0

    .line 49
    .line 50
    :cond_3
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const-class v5, Landroid/app/AppOpsManager;

    .line 59
    .line 60
    if-ne v3, v1, :cond_8

    .line 61
    .line 62
    invoke-static {v4, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_8

    .line 67
    .line 68
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 69
    .line 70
    const/16 v4, 0x1d

    .line 71
    .line 72
    if-lt v3, v4, :cond_7

    .line 73
    .line 74
    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Landroid/app/AppOpsManager;

    .line 79
    .line 80
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    const/4 v5, 0x1

    .line 85
    if-nez v3, :cond_4

    .line 86
    .line 87
    move v2, v5

    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-virtual {v3, p1, v4, v2}, Landroid/app/AppOpsManager;->checkOpNoThrow(Ljava/lang/String;ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    :goto_1
    if-eqz v2, :cond_5

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_5
    invoke-static {p0}, LT2;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    if-nez v3, :cond_6

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_6
    invoke-virtual {v3, p1, v1, p0}, Landroid/app/AppOpsManager;->checkOpNoThrow(Ljava/lang/String;ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    :goto_2
    move v2, v5

    .line 108
    goto :goto_3

    .line 109
    :cond_7
    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Landroid/app/AppOpsManager;

    .line 114
    .line 115
    invoke-virtual {p0, p1, v2}, Landroid/app/AppOpsManager;->noteProxyOpNoThrow(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    goto :goto_3

    .line 120
    :cond_8
    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    check-cast p0, Landroid/app/AppOpsManager;

    .line 125
    .line 126
    invoke-virtual {p0, p1, v2}, Landroid/app/AppOpsManager;->noteProxyOpNoThrow(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    :goto_3
    if-nez v2, :cond_9

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_9
    const/4 p0, -0x2

    .line 134
    move v3, p0

    .line 135
    :cond_a
    :goto_4
    return v3
.end method

.method public static final k(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    .locals 5

    .line 1
    new-array p2, p2, [B

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_0

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {p1, p2, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 13
    .line 14
    .line 15
    int-to-long v3, v0

    .line 16
    add-long/2addr v1, v3

    .line 17
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-wide v1
.end method

.method public static l(Ljava/lang/Object;)V
    .locals 4

    .line 1
    sget-boolean v0, Lu6;->x:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "ResourcesFlusher"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    const-string v0, "android.content.res.ThemedResourceCache"

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lu6;->w:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    const-string v3, "Could not find ThemedResourceCache class"

    .line 19
    .line 20
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 21
    .line 22
    .line 23
    :goto_0
    sput-boolean v1, Lu6;->x:Z

    .line 24
    .line 25
    :cond_0
    sget-object v0, Lu6;->w:Ljava/lang/Class;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    sget-boolean v3, Lu6;->z:Z

    .line 31
    .line 32
    if-nez v3, :cond_2

    .line 33
    .line 34
    :try_start_1
    const-string v3, "mUnthemedEntries"

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Lu6;->y:Ljava/lang/reflect/Field;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_1
    move-exception v0

    .line 47
    const-string v3, "Could not retrieve ThemedResourceCache#mUnthemedEntries field"

    .line 48
    .line 49
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    .line 51
    .line 52
    :goto_1
    sput-boolean v1, Lu6;->z:Z

    .line 53
    .line 54
    :cond_2
    sget-object v0, Lu6;->y:Ljava/lang/reflect/Field;

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    :try_start_2
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Landroid/util/LongSparseArray;
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :catch_2
    move-exception p0

    .line 67
    const-string v0, "Could not retrieve value from ThemedResourceCache#mUnthemedEntries"

    .line 68
    .line 69
    invoke-static {v2, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    :goto_2
    if-eqz p0, :cond_4

    .line 74
    .line 75
    invoke-static {p0}, Lmg;->a(Landroid/util/LongSparseArray;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    return-void
.end method

.method public static final m(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static final n(LDc;)Ljava/lang/Class;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    check-cast p0, Ll4;

    .line 7
    .line 8
    invoke-interface {p0}, Ll4;->a()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sparse-switch v1, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :sswitch_0
    const-string v1, "short"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :cond_1
    const-class p0, Ljava/lang/Short;

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :sswitch_1
    const-string v1, "float"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const-class p0, Ljava/lang/Float;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    const-string v1, "boolean"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const-class p0, Ljava/lang/Boolean;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_3
    const-string v1, "void"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_4

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    const-class p0, Ljava/lang/Void;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_4
    const-string v1, "long"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    const-class p0, Ljava/lang/Long;

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_5
    const-string v1, "char"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_6

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    const-class p0, Ljava/lang/Character;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_6
    const-string v1, "byte"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_7

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_7
    const-class p0, Ljava/lang/Byte;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_7
    const-string v1, "int"

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_8

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_8
    const-class p0, Ljava/lang/Integer;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :sswitch_8
    const-string v1, "double"

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_9

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    const-class p0, Ljava/lang/Double;

    .line 140
    .line 141
    :goto_0
    return-object p0

    .line 142
    nop

    .line 143
    :sswitch_data_0
    .sparse-switch
        -0x4f08842f -> :sswitch_8
        0x197ef -> :sswitch_7
        0x2e6108 -> :sswitch_6
        0x2e9356 -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x375194 -> :sswitch_3
        0x3db6c28 -> :sswitch_2
        0x5d0225c -> :sswitch_1
        0x685847c -> :sswitch_0
    .end sparse-switch
.end method

.method public static final o(LY5;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lt5;->e:Lt5;

    .line 2
    .line 3
    invoke-interface {p0, v0}, LY5;->c(LX5;)LW5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LS0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0, p1}, LS0;->d(LY5;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0, p1}, Lr3;->r(LY5;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 24
    .line 25
    const-string v2, "Exception while trying to handle coroutine exception"

    .line 26
    .line 27
    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p1}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    move-object p1, v1

    .line 34
    :goto_0
    invoke-static {p0, p1}, Lr3;->r(LY5;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static final p(Lg3;Ljava/lang/Object;I)I
    .locals 4

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lg3;->e:I

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    return p0

    .line 12
    :cond_0
    :try_start_0
    iget-object v1, p0, Lg3;->c:[I

    .line 13
    .line 14
    iget v2, p0, Lg3;->e:I

    .line 15
    .line 16
    invoke-static {v2, p2, v1}, Lu6;->f(II[I)I

    .line 17
    .line 18
    .line 19
    move-result v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    if-gez v1, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    iget-object v2, p0, Lg3;->d:[Ljava/lang/Object;

    .line 24
    .line 25
    aget-object v2, v2, v1

    .line 26
    .line 27
    invoke-static {p1, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    add-int/lit8 v2, v1, 0x1

    .line 35
    .line 36
    :goto_0
    if-ge v2, v0, :cond_4

    .line 37
    .line 38
    iget-object v3, p0, Lg3;->c:[I

    .line 39
    .line 40
    aget v3, v3, v2

    .line 41
    .line 42
    if-ne v3, p2, :cond_4

    .line 43
    .line 44
    iget-object v3, p0, Lg3;->d:[Ljava/lang/Object;

    .line 45
    .line 46
    aget-object v3, v3, v2

    .line 47
    .line 48
    invoke-static {p1, v3}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    add-int/lit8 v1, v1, -0x1

    .line 59
    .line 60
    :goto_1
    if-ltz v1, :cond_6

    .line 61
    .line 62
    iget-object v0, p0, Lg3;->c:[I

    .line 63
    .line 64
    aget v0, v0, v1

    .line 65
    .line 66
    if-ne v0, p2, :cond_6

    .line 67
    .line 68
    iget-object v0, p0, Lg3;->d:[Ljava/lang/Object;

    .line 69
    .line 70
    aget-object v0, v0, v1

    .line 71
    .line 72
    invoke-static {p1, v0}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    return v1

    .line 79
    :cond_5
    add-int/lit8 v1, v1, -0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_6
    not-int p0, v2

    .line 83
    return p0

    .line 84
    :catch_0
    new-instance p0, Ljava/util/ConcurrentModificationException;

    .line 85
    .line 86
    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    .line 87
    .line 88
    .line 89
    throw p0
.end method

.method public static q(F)I
    .locals 15

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpg-float v0, p0, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/high16 p0, -0x1000000

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 v0, 0x42c60000    # 99.0f

    .line 11
    .line 12
    cmpl-float v0, p0, v0

    .line 13
    .line 14
    if-lez v0, :cond_1

    .line 15
    .line 16
    const/4 p0, -0x1

    .line 17
    return p0

    .line 18
    :cond_1
    const/high16 v0, 0x41800000    # 16.0f

    .line 19
    .line 20
    add-float v1, p0, v0

    .line 21
    .line 22
    const/high16 v2, 0x42e80000    # 116.0f

    .line 23
    .line 24
    div-float/2addr v1, v2

    .line 25
    const/high16 v3, 0x41000000    # 8.0f

    .line 26
    .line 27
    cmpl-float v3, p0, v3

    .line 28
    .line 29
    const v4, 0x4461d2f7

    .line 30
    .line 31
    .line 32
    if-lez v3, :cond_2

    .line 33
    .line 34
    mul-float p0, v1, v1

    .line 35
    .line 36
    mul-float/2addr p0, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    div-float/2addr p0, v4

    .line 39
    :goto_0
    mul-float v3, v1, v1

    .line 40
    .line 41
    mul-float/2addr v3, v1

    .line 42
    const v5, 0x3c111aa7

    .line 43
    .line 44
    .line 45
    cmpl-float v5, v3, v5

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    const/4 v7, 0x1

    .line 49
    if-lez v5, :cond_3

    .line 50
    .line 51
    move v5, v7

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move v5, v6

    .line 54
    :goto_1
    if-eqz v5, :cond_4

    .line 55
    .line 56
    move v8, v3

    .line 57
    goto :goto_2

    .line 58
    :cond_4
    mul-float v8, v1, v2

    .line 59
    .line 60
    sub-float/2addr v8, v0

    .line 61
    div-float/2addr v8, v4

    .line 62
    :goto_2
    if-eqz v5, :cond_5

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_5
    mul-float/2addr v1, v2

    .line 66
    sub-float/2addr v1, v0

    .line 67
    div-float v3, v1, v4

    .line 68
    .line 69
    :goto_3
    sget-object v0, Lu6;->c:[F

    .line 70
    .line 71
    aget v1, v0, v6

    .line 72
    .line 73
    mul-float/2addr v8, v1

    .line 74
    float-to-double v9, v8

    .line 75
    aget v1, v0, v7

    .line 76
    .line 77
    mul-float/2addr p0, v1

    .line 78
    float-to-double v11, p0

    .line 79
    const/4 p0, 0x2

    .line 80
    aget p0, v0, p0

    .line 81
    .line 82
    mul-float/2addr v3, p0

    .line 83
    float-to-double v13, v3

    .line 84
    invoke-static/range {v9 .. v14}, LB4;->a(DDD)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    return p0
.end method

.method public static r()Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v3, 0x1d

    .line 6
    .line 7
    if-lt v2, v3, :cond_0

    .line 8
    .line 9
    invoke-static {}, LMi;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0

    .line 14
    :cond_0
    const-class v2, Landroid/os/Trace;

    .line 15
    .line 16
    :try_start_0
    sget-object v3, Lu6;->D:Ljava/lang/reflect/Method;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    const-string v3, "TRACE_TAG_APP"

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v5

    .line 31
    sput-wide v5, Lu6;->C:J

    .line 32
    .line 33
    const-string v3, "isTagEnabled"

    .line 34
    .line 35
    new-array v5, v0, [Ljava/lang/Class;

    .line 36
    .line 37
    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 38
    .line 39
    aput-object v6, v5, v1

    .line 40
    .line 41
    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    sput-object v2, Lu6;->D:Ljava/lang/reflect/Method;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    sget-object v2, Lu6;->D:Ljava/lang/reflect/Method;

    .line 51
    .line 52
    sget-wide v5, Lu6;->C:J

    .line 53
    .line 54
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-array v0, v0, [Ljava/lang/Object;

    .line 59
    .line 60
    aput-object v3, v0, v1

    .line 61
    .line 62
    invoke-virtual {v2, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    goto :goto_2

    .line 73
    :goto_1
    instance-of v2, v0, Ljava/lang/reflect/InvocationTargetException;

    .line 74
    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    instance-of v1, v0, Ljava/lang/RuntimeException;

    .line 82
    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    check-cast v0, Ljava/lang/RuntimeException;

    .line 86
    .line 87
    throw v0

    .line 88
    :cond_2
    new-instance v1, Ljava/lang/RuntimeException;

    .line 89
    .line 90
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    throw v1

    .line 94
    :cond_3
    const-string v2, "Unable to call isTagEnabled via reflection"

    .line 95
    .line 96
    const-string v3, "Trace"

    .line 97
    .line 98
    invoke-static {v3, v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    .line 100
    .line 101
    :goto_2
    return v1
.end method

.method public static s(I)F
    .locals 6

    .line 1
    int-to-float p0, p0

    .line 2
    const/high16 v0, 0x437f0000    # 255.0f

    .line 3
    .line 4
    div-float/2addr p0, v0

    .line 5
    const v0, 0x3d25aee6    # 0.04045f

    .line 6
    .line 7
    .line 8
    cmpg-float v0, p0, v0

    .line 9
    .line 10
    const/high16 v1, 0x42c80000    # 100.0f

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    const v0, 0x414eb852    # 12.92f

    .line 15
    .line 16
    .line 17
    div-float/2addr p0, v0

    .line 18
    :goto_0
    mul-float/2addr p0, v1

    .line 19
    return p0

    .line 20
    :cond_0
    const v0, 0x3d6147ae    # 0.055f

    .line 21
    .line 22
    .line 23
    add-float/2addr p0, v0

    .line 24
    const v0, 0x3f870a3d    # 1.055f

    .line 25
    .line 26
    .line 27
    div-float/2addr p0, v0

    .line 28
    float-to-double v2, p0

    .line 29
    const-wide v4, 0x4003333340000000L    # 2.4000000953674316

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    double-to-float p0, v2

    .line 39
    goto :goto_0
.end method

.method public static t(Ljava/lang/Object;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "singletonList(...)"

    .line 6
    .line 7
    invoke-static {v0, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static final w(Ljava/io/InputStream;LIb;ILN9;Lr5;)Ljava/lang/Object;
    .locals 11

    .line 1
    instance-of v0, p4, Lqb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p4

    .line 6
    check-cast v0, Lqb;

    .line 7
    .line 8
    iget v1, v0, Lqb;->m:I

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
    iput v1, v0, Lqb;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lqb;

    .line 21
    .line 22
    invoke-direct {v0, p4}, Ls5;-><init>(Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p4, v0, Lqb;->l:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lqb;->m:I

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
    iget p0, v0, Lqb;->k:I

    .line 37
    .line 38
    iget p1, v0, Lqb;->j:I

    .line 39
    .line 40
    iget p2, v0, Lqb;->i:I

    .line 41
    .line 42
    iget-object p3, v0, Lqb;->h:LN9;

    .line 43
    .line 44
    iget-object v2, v0, Lqb;->g:LIb;

    .line 45
    .line 46
    iget-object v4, v0, Lqb;->f:Ljava/io/InputStream;

    .line 47
    .line 48
    invoke-static {p4}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto/16 :goto_6

    .line 52
    .line 53
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p0

    .line 61
    :cond_2
    invoke-static {p4}, Llc;->P(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget p4, p1, LIb;->b:I

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-static {p4, v2}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    if-ge p4, p2, :cond_3

    .line 75
    .line 76
    move p4, p2

    .line 77
    :cond_3
    sget-object v2, LUa;->b:LUa;

    .line 78
    .line 79
    iget-object v4, p1, LIb;->a:LWa;

    .line 80
    .line 81
    invoke-static {v4, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    rem-int/lit8 v2, p4, 0x3

    .line 88
    .line 89
    sub-int/2addr p4, v2

    .line 90
    add-int/lit8 p4, p4, 0x3

    .line 91
    .line 92
    :cond_4
    move v10, p2

    .line 93
    move-object p2, p1

    .line 94
    move p1, p4

    .line 95
    move-object p4, p3

    .line 96
    move p3, v10

    .line 97
    :cond_5
    new-array v2, p1, [B

    .line 98
    .line 99
    const/4 v4, 0x0

    .line 100
    move v5, v4

    .line 101
    :cond_6
    sub-int v6, p1, v5

    .line 102
    .line 103
    invoke-static {v6, p3}, Ljava/lang/Math;->min(II)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    invoke-virtual {p0, v2, v5, v6}, Ljava/io/InputStream;->read([BII)I

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    if-lez v6, :cond_7

    .line 112
    .line 113
    add-int/2addr v5, v6

    .line 114
    :cond_7
    if-lez v6, :cond_8

    .line 115
    .line 116
    if-lt v5, p1, :cond_6

    .line 117
    .line 118
    :cond_8
    if-lez v5, :cond_13

    .line 119
    .line 120
    if-ltz v5, :cond_12

    .line 121
    .line 122
    sget-object v6, LG7;->c:LG7;

    .line 123
    .line 124
    if-nez v5, :cond_9

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_9
    if-lt v5, p1, :cond_b

    .line 128
    .line 129
    if-eqz p1, :cond_e

    .line 130
    .line 131
    if-eq p1, v3, :cond_a

    .line 132
    .line 133
    new-instance v6, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v6, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 136
    .line 137
    .line 138
    move v7, v4

    .line 139
    :goto_1
    if-ge v7, p1, :cond_e

    .line 140
    .line 141
    aget-byte v8, v2, v7

    .line 142
    .line 143
    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    add-int/lit8 v7, v7, 0x1

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_a
    aget-byte v2, v2, v4

    .line 154
    .line 155
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-static {v2}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object v6

    .line 163
    goto :goto_3

    .line 164
    :cond_b
    if-ne v5, v3, :cond_c

    .line 165
    .line 166
    aget-byte v2, v2, v4

    .line 167
    .line 168
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-static {v2}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    goto :goto_3

    .line 177
    :cond_c
    new-instance v6, Ljava/util/ArrayList;

    .line 178
    .line 179
    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 180
    .line 181
    .line 182
    move v7, v4

    .line 183
    move v8, v7

    .line 184
    :goto_2
    if-ge v7, p1, :cond_e

    .line 185
    .line 186
    aget-byte v9, v2, v7

    .line 187
    .line 188
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    add-int/2addr v8, v3

    .line 196
    if-ne v8, v5, :cond_d

    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_d
    add-int/lit8 v7, v7, 0x1

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_e
    :goto_3
    invoke-interface {v6}, Ljava/util/Collection;->size()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    new-array v2, v2, [B

    .line 207
    .line 208
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    if-eqz v7, :cond_f

    .line 217
    .line 218
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    check-cast v7, Ljava/lang/Number;

    .line 223
    .line 224
    invoke-virtual {v7}, Ljava/lang/Number;->byteValue()B

    .line 225
    .line 226
    .line 227
    move-result v7

    .line 228
    add-int/lit8 v8, v4, 0x1

    .line 229
    .line 230
    aput-byte v7, v2, v4

    .line 231
    .line 232
    move v4, v8

    .line 233
    goto :goto_4

    .line 234
    :cond_f
    iget-object v4, p2, LIb;->a:LWa;

    .line 235
    .line 236
    instance-of v6, v4, LVa;

    .line 237
    .line 238
    if-eqz v6, :cond_10

    .line 239
    .line 240
    new-instance v6, Ljava/lang/String;

    .line 241
    .line 242
    check-cast v4, LVa;

    .line 243
    .line 244
    iget-object v4, v4, LVa;->b:Ljava/nio/charset/Charset;

    .line 245
    .line 246
    invoke-direct {v6, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 247
    .line 248
    .line 249
    goto :goto_5

    .line 250
    :cond_10
    const/4 v4, 0x2

    .line 251
    invoke-static {v2, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    :goto_5
    invoke-static {v6}, Llc;->e(Ljava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    iput-object p0, v0, Lqb;->f:Ljava/io/InputStream;

    .line 259
    .line 260
    iput-object p2, v0, Lqb;->g:LIb;

    .line 261
    .line 262
    iput-object p4, v0, Lqb;->h:LN9;

    .line 263
    .line 264
    iput p3, v0, Lqb;->i:I

    .line 265
    .line 266
    iput p1, v0, Lqb;->j:I

    .line 267
    .line 268
    iput v5, v0, Lqb;->k:I

    .line 269
    .line 270
    iput v3, v0, Lqb;->m:I

    .line 271
    .line 272
    invoke-interface {p4, v6, v0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    if-ne v2, v1, :cond_11

    .line 277
    .line 278
    return-object v1

    .line 279
    :cond_11
    move-object v4, p0

    .line 280
    move-object v2, p2

    .line 281
    move p2, p3

    .line 282
    move-object p3, p4

    .line 283
    move p0, v5

    .line 284
    :goto_6
    move v5, p0

    .line 285
    move-object p4, p3

    .line 286
    move-object p0, v4

    .line 287
    move p3, p2

    .line 288
    move-object p2, v2

    .line 289
    goto :goto_7

    .line 290
    :cond_12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 291
    .line 292
    const-string p1, "Requested element count "

    .line 293
    .line 294
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string p1, " is less than zero."

    .line 301
    .line 302
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 310
    .line 311
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    throw p1

    .line 319
    :cond_13
    :goto_7
    if-gtz v5, :cond_5

    .line 320
    .line 321
    sget-object p0, Lfj;->a:Lfj;

    .line 322
    .line 323
    return-object p0
.end method

.method public static final x(Ljava/io/InputStream;LJb;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "options"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, LJb;->a:LWa;

    .line 7
    .line 8
    instance-of v0, p1, LVa;

    .line 9
    .line 10
    const/16 v1, 0x2000

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ljava/io/InputStreamReader;

    .line 15
    .line 16
    check-cast p1, LVa;

    .line 17
    .line 18
    iget-object p1, p1, LVa;->b:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 21
    .line 22
    .line 23
    :try_start_0
    new-instance p0, Ljava/io/StringWriter;

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/io/StringWriter;-><init>()V

    .line 26
    .line 27
    .line 28
    new-array p1, v1, [C

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v0, p1}, Ljava/io/Reader;->read([C)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ltz v1, :cond_0

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {p0, p1, v2, v1}, Ljava/io/Writer;->write([CII)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "toString(...)"

    .line 46
    .line 47
    invoke-static {p1, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    invoke-static {v0, p1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    :catchall_1
    move-exception p1

    .line 58
    invoke-static {v0, p0}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    :cond_1
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-direct {p1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {p0, p1, v1}, Lu6;->k(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "toByteArray(...)"

    .line 83
    .line 84
    invoke-static {p1, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    const/4 p1, 0x2

    .line 88
    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Llc;->e(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    :goto_1
    return-object p0
.end method


# virtual methods
.method public abstract A()V
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public abstract u(Ljava/lang/Throwable;)V
.end method

.method public abstract v(LN6;)V
.end method

.method public y()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract z()V
.end method
