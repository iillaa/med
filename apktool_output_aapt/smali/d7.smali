.class public Ld7;
.super Landroid/widget/ListView;
.source "SourceFile"


# instance fields
.field public final c:Landroid/graphics/Rect;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Lb7;

.field public j:Z

.field public final k:Z

.field public l:Z

.field public m:Lod;

.field public n:Lj3;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const v1, 0x7f030079

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ld7;->c:Landroid/graphics/Rect;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Ld7;->d:I

    .line 17
    .line 18
    iput p1, p0, Ld7;->e:I

    .line 19
    .line 20
    iput p1, p0, Ld7;->f:I

    .line 21
    .line 22
    iput p1, p0, Ld7;->g:I

    .line 23
    .line 24
    iput-boolean p2, p0, Ld7;->k:Z

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/AbsListView;->setCacheColorHint(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(II)I
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getListPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getListPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/widget/ListView;->getDividerHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/widget/ListView;->getDivider()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    add-int/2addr v0, v1

    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v1, 0x0

    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v2, v1

    .line 32
    :goto_0
    invoke-interface {v4}, Landroid/widget/Adapter;->getCount()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v5, 0x0

    .line 37
    move v6, v1

    .line 38
    move v7, v6

    .line 39
    move-object v8, v5

    .line 40
    :goto_1
    if-ge v6, v3, :cond_7

    .line 41
    .line 42
    invoke-interface {v4, v6}, Landroid/widget/Adapter;->getItemViewType(I)I

    .line 43
    .line 44
    .line 45
    move-result v9

    .line 46
    if-eq v9, v7, :cond_2

    .line 47
    .line 48
    move-object v8, v5

    .line 49
    move v7, v9

    .line 50
    :cond_2
    invoke-interface {v4, v6, v8, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object v9

    .line 58
    if-nez v9, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 68
    .line 69
    if-lez v9, :cond_4

    .line 70
    .line 71
    const/high16 v10, 0x40000000    # 2.0f

    .line 72
    .line 73
    invoke-static {v9, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 74
    .line 75
    .line 76
    move-result v9

    .line 77
    goto :goto_2

    .line 78
    :cond_4
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    :goto_2
    invoke-virtual {v8, p1, v9}, Landroid/view/View;->measure(II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v8}, Landroid/view/View;->forceLayout()V

    .line 86
    .line 87
    .line 88
    if-lez v6, :cond_5

    .line 89
    .line 90
    add-int/2addr v0, v2

    .line 91
    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    .line 92
    .line 93
    .line 94
    move-result v9

    .line 95
    add-int/2addr v0, v9

    .line 96
    if-lt v0, p2, :cond_6

    .line 97
    .line 98
    return p2

    .line 99
    :cond_6
    add-int/lit8 v6, v6, 0x1

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_7
    return v0
.end method

.method public final b(Landroid/view/MotionEvent;I)Z
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x0

    .line 11
    if-eq v3, v4, :cond_2

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq v3, v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-eq v3, v0, :cond_0

    .line 18
    .line 19
    move v0, v4

    .line 20
    goto/16 :goto_7

    .line 21
    .line 22
    :cond_0
    :goto_0
    move v0, v5

    .line 23
    goto/16 :goto_7

    .line 24
    .line 25
    :cond_1
    move v0, v4

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    move v0, v5

    .line 28
    :goto_1
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    if-gez v6, :cond_3

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_3
    invoke-virtual {v2, v6}, Landroid/view/MotionEvent;->getX(I)F

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    float-to-int v7, v7

    .line 40
    invoke-virtual {v2, v6}, Landroid/view/MotionEvent;->getY(I)F

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    float-to-int v6, v6

    .line 45
    invoke-virtual {v1, v7, v6}, Landroid/widget/AbsListView;->pointToPosition(II)I

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    const/4 v9, -0x1

    .line 50
    if-ne v8, v9, :cond_4

    .line 51
    .line 52
    move v5, v4

    .line 53
    goto/16 :goto_7

    .line 54
    .line 55
    :cond_4
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    sub-int v0, v8, v0

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    int-to-float v7, v7

    .line 66
    int-to-float v6, v6

    .line 67
    iput-boolean v4, v1, Ld7;->l:Z

    .line 68
    .line 69
    invoke-static {v1, v7, v6}, LY6;->a(Landroid/view/View;FF)V

    .line 70
    .line 71
    .line 72
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->isPressed()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    invoke-virtual {v1, v4}, Landroid/view/View;->setPressed(Z)V

    .line 79
    .line 80
    .line 81
    :cond_5
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AbsListView;->layoutChildren()V

    .line 82
    .line 83
    .line 84
    iget v0, v1, Ld7;->h:I

    .line 85
    .line 86
    if-eq v0, v9, :cond_6

    .line 87
    .line 88
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 89
    .line 90
    .line 91
    move-result v11

    .line 92
    sub-int/2addr v0, v11

    .line 93
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    if-eq v0, v10, :cond_6

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->isPressed()Z

    .line 102
    .line 103
    .line 104
    move-result v11

    .line 105
    if-eqz v11, :cond_6

    .line 106
    .line 107
    invoke-virtual {v0, v5}, Landroid/view/View;->setPressed(Z)V

    .line 108
    .line 109
    .line 110
    :cond_6
    iput v8, v1, Ld7;->h:I

    .line 111
    .line 112
    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    int-to-float v0, v0

    .line 117
    sub-float v0, v7, v0

    .line 118
    .line 119
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    .line 120
    .line 121
    .line 122
    move-result v11

    .line 123
    int-to-float v11, v11

    .line 124
    sub-float v11, v6, v11

    .line 125
    .line 126
    invoke-static {v10, v0, v11}, LY6;->a(Landroid/view/View;FF)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v10}, Landroid/view/View;->isPressed()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_7

    .line 134
    .line 135
    invoke-virtual {v10, v4}, Landroid/view/View;->setPressed(Z)V

    .line 136
    .line 137
    .line 138
    :cond_7
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AbsListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 139
    .line 140
    .line 141
    move-result-object v11

    .line 142
    if-eqz v11, :cond_8

    .line 143
    .line 144
    if-eq v8, v9, :cond_8

    .line 145
    .line 146
    move v12, v4

    .line 147
    goto :goto_2

    .line 148
    :cond_8
    move v12, v5

    .line 149
    :goto_2
    if-eqz v12, :cond_9

    .line 150
    .line 151
    invoke-virtual {v11, v5, v5}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 152
    .line 153
    .line 154
    :cond_9
    invoke-virtual {v10}, Landroid/view/View;->getLeft()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    .line 159
    .line 160
    .line 161
    move-result v13

    .line 162
    invoke-virtual {v10}, Landroid/view/View;->getRight()I

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    .line 167
    .line 168
    .line 169
    move-result v15

    .line 170
    iget-object v5, v1, Ld7;->c:Landroid/graphics/Rect;

    .line 171
    .line 172
    invoke-virtual {v5, v0, v13, v14, v15}, Landroid/graphics/Rect;->set(IIII)V

    .line 173
    .line 174
    .line 175
    iget v0, v5, Landroid/graphics/Rect;->left:I

    .line 176
    .line 177
    iget v13, v1, Ld7;->d:I

    .line 178
    .line 179
    sub-int/2addr v0, v13

    .line 180
    iput v0, v5, Landroid/graphics/Rect;->left:I

    .line 181
    .line 182
    iget v0, v5, Landroid/graphics/Rect;->top:I

    .line 183
    .line 184
    iget v13, v1, Ld7;->e:I

    .line 185
    .line 186
    sub-int/2addr v0, v13

    .line 187
    iput v0, v5, Landroid/graphics/Rect;->top:I

    .line 188
    .line 189
    iget v0, v5, Landroid/graphics/Rect;->right:I

    .line 190
    .line 191
    iget v13, v1, Ld7;->f:I

    .line 192
    .line 193
    add-int/2addr v0, v13

    .line 194
    iput v0, v5, Landroid/graphics/Rect;->right:I

    .line 195
    .line 196
    iget v0, v5, Landroid/graphics/Rect;->bottom:I

    .line 197
    .line 198
    iget v13, v1, Ld7;->g:I

    .line 199
    .line 200
    add-int/2addr v0, v13

    .line 201
    iput v0, v5, Landroid/graphics/Rect;->bottom:I

    .line 202
    .line 203
    invoke-static {}, LH3;->b()Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_a

    .line 208
    .line 209
    invoke-static/range {p0 .. p0}, La7;->a(Landroid/widget/AbsListView;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    goto :goto_3

    .line 214
    :cond_a
    sget-object v0, Lc7;->a:Ljava/lang/reflect/Field;

    .line 215
    .line 216
    if-eqz v0, :cond_b

    .line 217
    .line 218
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    goto :goto_3

    .line 223
    :catch_0
    move-exception v0

    .line 224
    move-object v13, v0

    .line 225
    invoke-virtual {v13}, Ljava/lang/Throwable;->printStackTrace()V

    .line 226
    .line 227
    .line 228
    :cond_b
    const/4 v0, 0x0

    .line 229
    :goto_3
    invoke-virtual {v10}, Landroid/view/View;->isEnabled()Z

    .line 230
    .line 231
    .line 232
    move-result v13

    .line 233
    if-eq v13, v0, :cond_e

    .line 234
    .line 235
    xor-int/2addr v0, v4

    .line 236
    invoke-static {}, LH3;->b()Z

    .line 237
    .line 238
    .line 239
    move-result v13

    .line 240
    if-eqz v13, :cond_c

    .line 241
    .line 242
    invoke-static {v1, v0}, La7;->b(Landroid/widget/AbsListView;Z)V

    .line 243
    .line 244
    .line 245
    goto :goto_4

    .line 246
    :cond_c
    sget-object v13, Lc7;->a:Ljava/lang/reflect/Field;

    .line 247
    .line 248
    if-eqz v13, :cond_d

    .line 249
    .line 250
    :try_start_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {v13, v1, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 255
    .line 256
    .line 257
    goto :goto_4

    .line 258
    :catch_1
    move-exception v0

    .line 259
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 260
    .line 261
    .line 262
    :cond_d
    :goto_4
    if-eq v8, v9, :cond_e

    .line 263
    .line 264
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->refreshDrawableState()V

    .line 265
    .line 266
    .line 267
    :cond_e
    if-eqz v12, :cond_10

    .line 268
    .line 269
    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterY()F

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getVisibility()I

    .line 278
    .line 279
    .line 280
    move-result v12

    .line 281
    if-nez v12, :cond_f

    .line 282
    .line 283
    move v12, v4

    .line 284
    :goto_5
    const/4 v13, 0x0

    .line 285
    goto :goto_6

    .line 286
    :cond_f
    const/4 v12, 0x0

    .line 287
    goto :goto_5

    .line 288
    :goto_6
    invoke-virtual {v11, v12, v13}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 289
    .line 290
    .line 291
    invoke-virtual {v11, v0, v5}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 292
    .line 293
    .line 294
    :cond_10
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AbsListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    if-eqz v0, :cond_11

    .line 299
    .line 300
    if-eq v8, v9, :cond_11

    .line 301
    .line 302
    invoke-virtual {v0, v7, v6}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 303
    .line 304
    .line 305
    :cond_11
    iget-object v0, v1, Ld7;->i:Lb7;

    .line 306
    .line 307
    if-eqz v0, :cond_12

    .line 308
    .line 309
    const/4 v5, 0x0

    .line 310
    iput-boolean v5, v0, Lb7;->d:Z

    .line 311
    .line 312
    :cond_12
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->refreshDrawableState()V

    .line 313
    .line 314
    .line 315
    if-ne v3, v4, :cond_13

    .line 316
    .line 317
    invoke-virtual {v1, v8}, Landroid/widget/AdapterView;->getItemIdAtPosition(I)J

    .line 318
    .line 319
    .line 320
    move-result-wide v5

    .line 321
    invoke-virtual {v1, v10, v8, v5, v6}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    .line 322
    .line 323
    .line 324
    :cond_13
    move v0, v4

    .line 325
    const/4 v5, 0x0

    .line 326
    :goto_7
    if-eqz v0, :cond_14

    .line 327
    .line 328
    if-eqz v5, :cond_15

    .line 329
    .line 330
    :cond_14
    const/4 v3, 0x0

    .line 331
    iput-boolean v3, v1, Ld7;->l:Z

    .line 332
    .line 333
    invoke-virtual {v1, v3}, Landroid/view/View;->setPressed(Z)V

    .line 334
    .line 335
    .line 336
    invoke-virtual/range {p0 .. p0}, Ld7;->drawableStateChanged()V

    .line 337
    .line 338
    .line 339
    iget v5, v1, Ld7;->h:I

    .line 340
    .line 341
    invoke-virtual/range {p0 .. p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 342
    .line 343
    .line 344
    move-result v6

    .line 345
    sub-int/2addr v5, v6

    .line 346
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 347
    .line 348
    .line 349
    move-result-object v5

    .line 350
    if-eqz v5, :cond_15

    .line 351
    .line 352
    invoke-virtual {v5, v3}, Landroid/view/View;->setPressed(Z)V

    .line 353
    .line 354
    .line 355
    :cond_15
    if-eqz v0, :cond_17

    .line 356
    .line 357
    iget-object v3, v1, Ld7;->m:Lod;

    .line 358
    .line 359
    if-nez v3, :cond_16

    .line 360
    .line 361
    new-instance v3, Lod;

    .line 362
    .line 363
    invoke-direct {v3, v1}, Lod;-><init>(Landroid/widget/ListView;)V

    .line 364
    .line 365
    .line 366
    iput-object v3, v1, Ld7;->m:Lod;

    .line 367
    .line 368
    :cond_16
    iget-object v3, v1, Ld7;->m:Lod;

    .line 369
    .line 370
    iget-boolean v5, v3, Lod;->r:Z

    .line 371
    .line 372
    iput-boolean v4, v3, Lod;->r:Z

    .line 373
    .line 374
    invoke-virtual {v3, v1, v2}, Lod;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 375
    .line 376
    .line 377
    goto :goto_8

    .line 378
    :cond_17
    iget-object v2, v1, Ld7;->m:Lod;

    .line 379
    .line 380
    if-eqz v2, :cond_19

    .line 381
    .line 382
    iget-boolean v3, v2, Lod;->r:Z

    .line 383
    .line 384
    if-eqz v3, :cond_18

    .line 385
    .line 386
    invoke-virtual {v2}, Lod;->d()V

    .line 387
    .line 388
    .line 389
    :cond_18
    const/4 v3, 0x0

    .line 390
    iput-boolean v3, v2, Lod;->r:Z

    .line 391
    .line 392
    :cond_19
    :goto_8
    return v0
.end method

.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ld7;->c:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final drawableStateChanged()V
    .locals 2

    .line 1
    iget-object v0, p0, Ld7;->n:Lj3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-super {p0}, Landroid/widget/ListView;->drawableStateChanged()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ld7;->i:Lb7;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, v0, Lb7;->d:Z

    .line 15
    .line 16
    :cond_1
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-boolean v1, p0, Ld7;->l:Z

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->isPressed()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public final hasFocus()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld7;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Landroid/widget/ListView;->hasFocus()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 15
    :goto_1
    return v0
.end method

.method public final hasWindowFocus()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld7;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Landroid/widget/ListView;->hasWindowFocus()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 15
    :goto_1
    return v0
.end method

.method public final isFocused()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld7;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0}, Landroid/widget/ListView;->isFocused()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 15
    :goto_1
    return v0
.end method

.method public final isInTouchMode()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld7;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ld7;->j:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-super {p0}, Landroid/widget/ListView;->isInTouchMode()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    :cond_1
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_2
    const/4 v0, 0x0

    .line 18
    :goto_0
    return v0
.end method

.method public final onDetachedFromWindow()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ld7;->n:Lj3;

    .line 3
    .line 4
    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v4, 0x1a

    .line 7
    .line 8
    if-ge v3, v4, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/widget/ListView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    return p1

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/16 v5, 0xa

    .line 20
    .line 21
    if-ne v4, v5, :cond_1

    .line 22
    .line 23
    iget-object v5, p0, Ld7;->n:Lj3;

    .line 24
    .line 25
    if-nez v5, :cond_1

    .line 26
    .line 27
    new-instance v5, Lj3;

    .line 28
    .line 29
    invoke-direct {v5, v0, p0}, Lj3;-><init>(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object v5, p0, Ld7;->n:Lj3;

    .line 33
    .line 34
    invoke-virtual {p0, v5}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/16 v6, 0x9

    .line 42
    .line 43
    const/4 v7, -0x1

    .line 44
    if-eq v4, v6, :cond_3

    .line 45
    .line 46
    const/4 v6, 0x7

    .line 47
    if-ne v4, v6, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p0, v7}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 51
    .line 52
    .line 53
    goto/16 :goto_3

    .line 54
    .line 55
    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    float-to-int v4, v4

    .line 60
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    float-to-int p1, p1

    .line 65
    invoke-virtual {p0, v4, p1}, Landroid/widget/AbsListView;->pointToPosition(II)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eq p1, v7, :cond_6

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eq p1, v4, :cond_6

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    sub-int v4, p1, v4

    .line 82
    .line 83
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v4}, Landroid/view/View;->isEnabled()Z

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-eqz v6, :cond_5

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 94
    .line 95
    .line 96
    const/16 v6, 0x1e

    .line 97
    .line 98
    if-lt v3, v6, :cond_4

    .line 99
    .line 100
    sget-boolean v3, LZ6;->d:Z

    .line 101
    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    :try_start_0
    sget-object v3, LZ6;->a:Ljava/lang/reflect/Method;

    .line 105
    .line 106
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    const/4 v9, 0x5

    .line 119
    new-array v9, v9, [Ljava/lang/Object;

    .line 120
    .line 121
    aput-object v6, v9, v2

    .line 122
    .line 123
    aput-object v4, v9, v1

    .line 124
    .line 125
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 126
    .line 127
    const/4 v6, 0x2

    .line 128
    aput-object v4, v9, v6

    .line 129
    .line 130
    aput-object v8, v9, v0

    .line 131
    .line 132
    const/4 v0, 0x4

    .line 133
    aput-object v7, v9, v0

    .line 134
    .line 135
    invoke-virtual {v3, p0, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    sget-object v0, LZ6;->b:Ljava/lang/reflect/Method;

    .line 139
    .line 140
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    new-array v4, v1, [Ljava/lang/Object;

    .line 145
    .line 146
    aput-object v3, v4, v2

    .line 147
    .line 148
    invoke-virtual {v0, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    sget-object v0, LZ6;->c:Ljava/lang/reflect/Method;

    .line 152
    .line 153
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    new-array v1, v1, [Ljava/lang/Object;

    .line 158
    .line 159
    aput-object p1, v1, v2

    .line 160
    .line 161
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :catch_0
    move-exception p1

    .line 166
    goto :goto_1

    .line 167
    :catch_1
    move-exception p1

    .line 168
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 169
    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_4
    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    sub-int/2addr v0, v1

    .line 181
    invoke-virtual {p0, p1, v0}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 182
    .line 183
    .line 184
    :cond_5
    :goto_2
    invoke-virtual {p0}, Landroid/widget/AbsListView;->getSelector()Landroid/graphics/drawable/Drawable;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    if-eqz p1, :cond_6

    .line 189
    .line 190
    iget-boolean v0, p0, Ld7;->l:Z

    .line 191
    .line 192
    if-eqz v0, :cond_6

    .line 193
    .line 194
    invoke-virtual {p0}, Landroid/view/View;->isPressed()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_6

    .line 199
    .line 200
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 205
    .line 206
    .line 207
    :cond_6
    :goto_3
    return v5
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    float-to-int v0, v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    float-to-int v1, v1

    .line 18
    invoke-virtual {p0, v0, v1}, Landroid/widget/AbsListView;->pointToPosition(II)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ld7;->h:I

    .line 23
    .line 24
    :goto_0
    iget-object v0, p0, Ld7;->n:Lj3;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v1, v0, Lj3;->d:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Ld7;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    iput-object v2, v1, Ld7;->n:Lj3;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    return p1
.end method

.method public setListSelectionHidden(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ld7;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSelector(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    new-instance v1, Lb7;

    .line 5
    .line 6
    invoke-direct {v1}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v2, v1, Lb7;->c:Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput-object p1, v1, Lb7;->c:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, v1, Lb7;->d:Z

    .line 23
    .line 24
    move-object v0, v1

    .line 25
    :cond_1
    iput-object v0, p0, Ld7;->i:Lb7;

    .line 26
    .line 27
    invoke-super {p0, v0}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 38
    .line 39
    .line 40
    :cond_2
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    iput p1, p0, Ld7;->d:I

    .line 43
    .line 44
    iget p1, v0, Landroid/graphics/Rect;->top:I

    .line 45
    .line 46
    iput p1, p0, Ld7;->e:I

    .line 47
    .line 48
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    iput p1, p0, Ld7;->f:I

    .line 51
    .line 52
    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    iput p1, p0, Ld7;->g:I

    .line 55
    .line 56
    return-void
.end method
