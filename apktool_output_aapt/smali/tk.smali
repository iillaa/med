.class public final Ltk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field public final a:LHc;

.field public b:LLk;


# direct methods
.method public constructor <init>(Landroid/view/View;LHc;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ltk;->a:LHc;

    .line 5
    .line 6
    sget-object p2, LLj;->a:Ljava/util/WeakHashMap;

    .line 7
    .line 8
    invoke-static {p1}, LFj;->a(Landroid/view/View;)LLk;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v0, 0x1e

    .line 17
    .line 18
    if-lt p2, v0, :cond_0

    .line 19
    .line 20
    new-instance p2, LBk;

    .line 21
    .line 22
    invoke-direct {p2, p1}, LBk;-><init>(LLk;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/16 v0, 0x1d

    .line 27
    .line 28
    if-lt p2, v0, :cond_1

    .line 29
    .line 30
    new-instance p2, LAk;

    .line 31
    .line 32
    invoke-direct {p2, p1}, LAk;-><init>(LLk;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    new-instance p2, Lzk;

    .line 37
    .line 38
    invoke-direct {p2, p1}, Lzk;-><init>(LLk;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {p2}, LCk;->b()LLk;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const/4 p1, 0x0

    .line 47
    :goto_1
    iput-object p1, p0, Ltk;->b:LLk;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p1

    .line 4
    .line 5
    move-object/from16 v8, p2

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isLaidOut()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    invoke-static/range {p1 .. p2}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Ltk;->b:LLk;

    .line 21
    .line 22
    invoke-static/range {p1 .. p2}, Luk;->h(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    return-object v1

    .line 27
    :cond_0
    invoke-static/range {p1 .. p2}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    iget-object v3, v0, Ltk;->b:LLk;

    .line 32
    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    sget-object v3, LLj;->a:Ljava/util/WeakHashMap;

    .line 36
    .line 37
    invoke-static/range {p1 .. p1}, LFj;->a(Landroid/view/View;)LLk;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iput-object v3, v0, Ltk;->b:LLk;

    .line 42
    .line 43
    :cond_1
    iget-object v3, v0, Ltk;->b:LLk;

    .line 44
    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    iput-object v9, v0, Ltk;->b:LLk;

    .line 48
    .line 49
    invoke-static/range {p1 .. p2}, Luk;->h(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    return-object v1

    .line 54
    :cond_2
    invoke-static/range {p1 .. p1}, Luk;->i(Landroid/view/View;)LHc;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    iget-object v3, v3, LHc;->a:Landroid/view/WindowInsets;

    .line 61
    .line 62
    invoke-static {v3, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_3

    .line 67
    .line 68
    invoke-static/range {p1 .. p2}, Luk;->h(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    return-object v1

    .line 73
    :cond_3
    iget-object v3, v0, Ltk;->b:LLk;

    .line 74
    .line 75
    move v6, v2

    .line 76
    const/4 v5, 0x0

    .line 77
    :goto_0
    iget-object v10, v9, LLk;->a:LIk;

    .line 78
    .line 79
    const/16 v11, 0x100

    .line 80
    .line 81
    if-gt v6, v11, :cond_5

    .line 82
    .line 83
    invoke-virtual {v10, v6}, LIk;->f(I)Lgc;

    .line 84
    .line 85
    .line 86
    move-result-object v10

    .line 87
    iget-object v11, v3, LLk;->a:LIk;

    .line 88
    .line 89
    invoke-virtual {v11, v6}, LIk;->f(I)Lgc;

    .line 90
    .line 91
    .line 92
    move-result-object v11

    .line 93
    invoke-virtual {v10, v11}, Lgc;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v10

    .line 97
    if-nez v10, :cond_4

    .line 98
    .line 99
    or-int/2addr v5, v6

    .line 100
    :cond_4
    shl-int/2addr v6, v2

    .line 101
    goto :goto_0

    .line 102
    :cond_5
    if-nez v5, :cond_6

    .line 103
    .line 104
    invoke-static/range {p1 .. p2}, Luk;->h(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    return-object v1

    .line 109
    :cond_6
    iget-object v6, v0, Ltk;->b:LLk;

    .line 110
    .line 111
    and-int/lit8 v2, v5, 0x8

    .line 112
    .line 113
    if-eqz v2, :cond_8

    .line 114
    .line 115
    invoke-virtual {v10, v1}, LIk;->f(I)Lgc;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iget v2, v2, Lgc;->d:I

    .line 120
    .line 121
    iget-object v3, v6, LLk;->a:LIk;

    .line 122
    .line 123
    invoke-virtual {v3, v1}, LIk;->f(I)Lgc;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget v1, v1, Lgc;->d:I

    .line 128
    .line 129
    if-le v2, v1, :cond_7

    .line 130
    .line 131
    sget-object v1, Luk;->d:Landroid/view/animation/PathInterpolator;

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_7
    sget-object v1, Luk;->e:LQ7;

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_8
    sget-object v1, Luk;->f:Landroid/view/animation/DecelerateInterpolator;

    .line 138
    .line 139
    :goto_1
    new-instance v11, Lyk;

    .line 140
    .line 141
    const-wide/16 v2, 0xa0

    .line 142
    .line 143
    invoke-direct {v11, v5, v1, v2, v3}, Lyk;-><init>(ILandroid/view/animation/Interpolator;J)V

    .line 144
    .line 145
    .line 146
    iget-object v1, v11, Lyk;->a:Lxk;

    .line 147
    .line 148
    const/4 v2, 0x0

    .line 149
    invoke-virtual {v1, v2}, Lxk;->c(F)V

    .line 150
    .line 151
    .line 152
    const/4 v1, 0x2

    .line 153
    new-array v1, v1, [F

    .line 154
    .line 155
    fill-array-data v1, :array_0

    .line 156
    .line 157
    .line 158
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iget-object v2, v11, Lyk;->a:Lxk;

    .line 163
    .line 164
    invoke-virtual {v2}, Lxk;->a()J

    .line 165
    .line 166
    .line 167
    move-result-wide v2

    .line 168
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    invoke-virtual {v10, v5}, LIk;->f(I)Lgc;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v2, v6, LLk;->a:LIk;

    .line 177
    .line 178
    invoke-virtual {v2, v5}, LIk;->f(I)Lgc;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iget v3, v1, Lgc;->a:I

    .line 183
    .line 184
    iget v10, v2, Lgc;->a:I

    .line 185
    .line 186
    invoke-static {v3, v10}, Ljava/lang/Math;->min(II)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    iget v10, v1, Lgc;->b:I

    .line 191
    .line 192
    iget v13, v2, Lgc;->b:I

    .line 193
    .line 194
    invoke-static {v10, v13}, Ljava/lang/Math;->min(II)I

    .line 195
    .line 196
    .line 197
    move-result v14

    .line 198
    iget v15, v1, Lgc;->c:I

    .line 199
    .line 200
    iget v4, v2, Lgc;->c:I

    .line 201
    .line 202
    invoke-static {v15, v4}, Ljava/lang/Math;->min(II)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    move-object/from16 v16, v12

    .line 207
    .line 208
    iget v12, v1, Lgc;->d:I

    .line 209
    .line 210
    move/from16 v17, v5

    .line 211
    .line 212
    iget v5, v2, Lgc;->d:I

    .line 213
    .line 214
    move-object/from16 v18, v6

    .line 215
    .line 216
    invoke-static {v12, v5}, Ljava/lang/Math;->min(II)I

    .line 217
    .line 218
    .line 219
    move-result v6

    .line 220
    invoke-static {v3, v14, v0, v6}, Lgc;->b(IIII)Lgc;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iget v1, v1, Lgc;->a:I

    .line 225
    .line 226
    iget v2, v2, Lgc;->a:I

    .line 227
    .line 228
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    invoke-static {v10, v13}, Ljava/lang/Math;->max(II)I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    invoke-static {v15, v4}, Ljava/lang/Math;->max(II)I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    .line 241
    .line 242
    .line 243
    move-result v4

    .line 244
    invoke-static {v1, v2, v3, v4}, Lgc;->b(IIII)Lgc;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    new-instance v10, LY1;

    .line 249
    .line 250
    const/16 v2, 0xa

    .line 251
    .line 252
    invoke-direct {v10, v0, v2, v1}, LY1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    const/4 v0, 0x0

    .line 256
    invoke-static {v7, v8, v0}, Luk;->e(Landroid/view/View;Landroid/view/WindowInsets;Z)V

    .line 257
    .line 258
    .line 259
    new-instance v0, Lrk;

    .line 260
    .line 261
    move-object v1, v0

    .line 262
    move-object v2, v11

    .line 263
    move-object v3, v9

    .line 264
    move-object/from16 v4, v18

    .line 265
    .line 266
    move/from16 v5, v17

    .line 267
    .line 268
    move-object/from16 v6, p1

    .line 269
    .line 270
    invoke-direct/range {v1 .. v6}, Lrk;-><init>(Lyk;LLk;LLk;ILandroid/view/View;)V

    .line 271
    .line 272
    .line 273
    move-object/from16 v1, v16

    .line 274
    .line 275
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 276
    .line 277
    .line 278
    new-instance v0, Lsk;

    .line 279
    .line 280
    invoke-direct {v0, v11, v7}, Lsk;-><init>(Lyk;Landroid/view/View;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 284
    .line 285
    .line 286
    new-instance v0, Ldg;

    .line 287
    .line 288
    invoke-direct {v0, v7, v11, v10, v1}, Ldg;-><init>(Landroid/view/View;Lyk;LY1;Landroid/animation/ValueAnimator;)V

    .line 289
    .line 290
    .line 291
    if-eqz v7, :cond_9

    .line 292
    .line 293
    new-instance v1, Ldf;

    .line 294
    .line 295
    invoke-direct {v1, v7, v0}, Ldf;-><init>(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v7, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 306
    .line 307
    .line 308
    move-object/from16 v0, p0

    .line 309
    .line 310
    iput-object v9, v0, Ltk;->b:LLk;

    .line 311
    .line 312
    invoke-static/range {p1 .. p2}, Luk;->h(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    return-object v1

    .line 317
    :cond_9
    move-object/from16 v0, p0

    .line 318
    .line 319
    new-instance v1, Ljava/lang/NullPointerException;

    .line 320
    .line 321
    const-string v2, "view == null"

    .line 322
    .line 323
    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    throw v1

    .line 327
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
