.class public final Lz2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/widget/TextView;

.field public b:Lsi;

.field public c:Lsi;

.field public d:Lsi;

.field public e:Lsi;

.field public f:Lsi;

.field public g:Lsi;

.field public h:Lsi;

.field public final i:LJ2;

.field public j:I

.field public k:I

.field public l:Landroid/graphics/Typeface;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lz2;->j:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lz2;->k:I

    .line 9
    .line 10
    iput-object p1, p0, Lz2;->a:Landroid/widget/TextView;

    .line 11
    .line 12
    new-instance v0, LJ2;

    .line 13
    .line 14
    invoke-direct {v0, p1}, LJ2;-><init>(Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lz2;->i:LJ2;

    .line 18
    .line 19
    return-void
.end method

.method public static c(Landroid/content/Context;LP1;I)Lsi;
    .locals 1

    .line 1
    monitor-enter p1

    .line 2
    :try_start_0
    iget-object v0, p1, LP1;->a:Lig;

    .line 3
    .line 4
    invoke-virtual {v0, p0, p2}, Lig;->i(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 5
    .line 6
    .line 7
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p1, Lsi;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    iput-boolean p2, p1, Lsi;->d:Z

    .line 18
    .line 19
    iput-object p0, p1, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    monitor-exit p1

    .line 26
    throw p0
.end method

.method public static h(Landroid/widget/TextView;Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)V
    .locals 11

    .line 1
    const/16 v0, 0x800

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v4, 0x1e

    .line 8
    .line 9
    if-ge v3, v4, :cond_c

    .line 10
    .line 11
    if-eqz p1, :cond_c

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-lt v3, v4, :cond_0

    .line 18
    .line 19
    invoke-static {p2, p0}, LG;->c(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_5

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    if-lt v3, v4, :cond_1

    .line 28
    .line 29
    invoke-static {p2, p0}, LG;->c(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_5

    .line 33
    .line 34
    :cond_1
    iget p1, p2, Landroid/view/inputmethod/EditorInfo;->initialSelStart:I

    .line 35
    .line 36
    iget v3, p2, Landroid/view/inputmethod/EditorInfo;->initialSelEnd:I

    .line 37
    .line 38
    if-le p1, v3, :cond_2

    .line 39
    .line 40
    move v4, v3

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    move v4, p1

    .line 43
    :goto_0
    if-le p1, v3, :cond_3

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_3
    move p1, v3

    .line 47
    :goto_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const/4 v5, 0x0

    .line 52
    if-ltz v4, :cond_b

    .line 53
    .line 54
    if-le p1, v3, :cond_4

    .line 55
    .line 56
    goto/16 :goto_4

    .line 57
    .line 58
    :cond_4
    iget v6, p2, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 59
    .line 60
    and-int/lit16 v6, v6, 0xfff

    .line 61
    .line 62
    const/16 v7, 0x81

    .line 63
    .line 64
    if-eq v6, v7, :cond_b

    .line 65
    .line 66
    const/16 v7, 0xe1

    .line 67
    .line 68
    if-eq v6, v7, :cond_b

    .line 69
    .line 70
    const/16 v7, 0x12

    .line 71
    .line 72
    if-ne v6, v7, :cond_5

    .line 73
    .line 74
    goto/16 :goto_4

    .line 75
    .line 76
    :cond_5
    if-gt v3, v0, :cond_6

    .line 77
    .line 78
    invoke-static {p2, p0, v4, p1}, LSi;->F(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 79
    .line 80
    .line 81
    goto :goto_5

    .line 82
    :cond_6
    sub-int v3, p1, v4

    .line 83
    .line 84
    const/16 v5, 0x400

    .line 85
    .line 86
    if-le v3, v5, :cond_7

    .line 87
    .line 88
    move v5, v1

    .line 89
    goto :goto_2

    .line 90
    :cond_7
    move v5, v3

    .line 91
    :goto_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 92
    .line 93
    .line 94
    move-result v6

    .line 95
    sub-int/2addr v6, p1

    .line 96
    sub-int/2addr v0, v5

    .line 97
    const-wide v7, 0x3fe999999999999aL    # 0.8

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    int-to-double v9, v0

    .line 103
    mul-double/2addr v9, v7

    .line 104
    double-to-int v7, v9

    .line 105
    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    sub-int v7, v0, v7

    .line 110
    .line 111
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    sub-int/2addr v0, v6

    .line 116
    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    sub-int/2addr v4, v0

    .line 121
    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    invoke-static {v7}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    if-eqz v7, :cond_8

    .line 130
    .line 131
    add-int/2addr v4, v2

    .line 132
    sub-int/2addr v0, v2

    .line 133
    :cond_8
    add-int v7, p1, v6

    .line 134
    .line 135
    sub-int/2addr v7, v2

    .line 136
    invoke-interface {p0, v7}, Ljava/lang/CharSequence;->charAt(I)C

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    invoke-static {v7}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    if-eqz v7, :cond_9

    .line 145
    .line 146
    sub-int/2addr v6, v2

    .line 147
    :cond_9
    add-int v7, v0, v5

    .line 148
    .line 149
    add-int v8, v7, v6

    .line 150
    .line 151
    if-eq v5, v3, :cond_a

    .line 152
    .line 153
    add-int v3, v4, v0

    .line 154
    .line 155
    invoke-interface {p0, v4, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    add-int/2addr v6, p1

    .line 160
    invoke-interface {p0, p1, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const/4 p1, 0x2

    .line 165
    new-array p1, p1, [Ljava/lang/CharSequence;

    .line 166
    .line 167
    aput-object v3, p1, v1

    .line 168
    .line 169
    aput-object p0, p1, v2

    .line 170
    .line 171
    invoke-static {p1}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    goto :goto_3

    .line 176
    :cond_a
    add-int/2addr v8, v4

    .line 177
    invoke-interface {p0, v4, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    :goto_3
    invoke-static {p2, p0, v0, v7}, LSi;->F(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 182
    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_b
    :goto_4
    invoke-static {p2, v5, v1, v1}, LSi;->F(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;II)V

    .line 186
    .line 187
    .line 188
    :cond_c
    :goto_5
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;Lsi;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lz2;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, p2, v0}, LP1;->d(Landroid/graphics/drawable/Drawable;Lsi;[I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final b()V
    .locals 6

    .line 1
    iget-object v0, p0, Lz2;->b:Lsi;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lz2;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lz2;->c:Lsi;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lz2;->d:Lsi;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lz2;->e:Lsi;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    aget-object v4, v0, v2

    .line 26
    .line 27
    iget-object v5, p0, Lz2;->b:Lsi;

    .line 28
    .line 29
    invoke-virtual {p0, v4, v5}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 30
    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    aget-object v4, v0, v4

    .line 34
    .line 35
    iget-object v5, p0, Lz2;->c:Lsi;

    .line 36
    .line 37
    invoke-virtual {p0, v4, v5}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 38
    .line 39
    .line 40
    aget-object v4, v0, v1

    .line 41
    .line 42
    iget-object v5, p0, Lz2;->d:Lsi;

    .line 43
    .line 44
    invoke-virtual {p0, v4, v5}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    aget-object v0, v0, v4

    .line 49
    .line 50
    iget-object v4, p0, Lz2;->e:Lsi;

    .line 51
    .line 52
    invoke-virtual {p0, v0, v4}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lz2;->f:Lsi;

    .line 56
    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lz2;->g:Lsi;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    :cond_2
    invoke-static {v3}, Lu2;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    aget-object v2, v0, v2

    .line 68
    .line 69
    iget-object v3, p0, Lz2;->f:Lsi;

    .line 70
    .line 71
    invoke-virtual {p0, v2, v3}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 72
    .line 73
    .line 74
    aget-object v0, v0, v1

    .line 75
    .line 76
    iget-object v1, p0, Lz2;->g:Lsi;

    .line 77
    .line 78
    invoke-virtual {p0, v0, v1}, Lz2;->a(Landroid/graphics/drawable/Drawable;Lsi;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method public final d()Landroid/content/res/ColorStateList;
    .locals 1

    .line 1
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    return-object v0
.end method

.method public final e()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    .line 1
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lsi;->b:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    return-object v0
.end method

.method public final f(Landroid/util/AttributeSet;I)V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v8, p1

    .line 4
    .line 5
    move/from16 v9, p2

    .line 6
    .line 7
    iget-object v10, v0, Lz2;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v11

    .line 13
    invoke-static {}, LP1;->a()LP1;

    .line 14
    .line 15
    .line 16
    move-result-object v12

    .line 17
    sget-object v3, LNf;->h:[I

    .line 18
    .line 19
    const/4 v13, 0x0

    .line 20
    invoke-static {v11, v8, v3, v9, v13}, LN2;->o(Landroid/content/Context;Landroid/util/AttributeSet;[III)LN2;

    .line 21
    .line 22
    .line 23
    move-result-object v14

    .line 24
    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v7, 0x0

    .line 29
    iget-object v1, v14, LN2;->a:Ljava/lang/Object;

    .line 30
    .line 31
    move-object v5, v1

    .line 32
    check-cast v5, Landroid/content/res/TypedArray;

    .line 33
    .line 34
    move-object v1, v10

    .line 35
    move-object/from16 v4, p1

    .line 36
    .line 37
    move/from16 v6, p2

    .line 38
    .line 39
    invoke-static/range {v1 .. v7}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 40
    .line 41
    .line 42
    iget-object v1, v14, LN2;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Landroid/content/res/TypedArray;

    .line 45
    .line 46
    const/4 v15, -0x1

    .line 47
    invoke-virtual {v1, v13, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const/4 v7, 0x3

    .line 52
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    invoke-virtual {v1, v7, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v11, v12, v3}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iput-object v3, v0, Lz2;->b:Lsi;

    .line 67
    .line 68
    :cond_0
    const/4 v6, 0x1

    .line 69
    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    invoke-virtual {v1, v6, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-static {v11, v12, v3}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iput-object v3, v0, Lz2;->c:Lsi;

    .line 84
    .line 85
    :cond_1
    const/4 v5, 0x4

    .line 86
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_2

    .line 91
    .line 92
    invoke-virtual {v1, v5, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-static {v11, v12, v3}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    iput-object v3, v0, Lz2;->d:Lsi;

    .line 101
    .line 102
    :cond_2
    const/4 v4, 0x2

    .line 103
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_3

    .line 108
    .line 109
    invoke-virtual {v1, v4, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-static {v11, v12, v3}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    iput-object v3, v0, Lz2;->e:Lsi;

    .line 118
    .line 119
    :cond_3
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 120
    .line 121
    const/4 v7, 0x5

    .line 122
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 123
    .line 124
    .line 125
    move-result v16

    .line 126
    if-eqz v16, :cond_4

    .line 127
    .line 128
    invoke-virtual {v1, v7, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    invoke-static {v11, v12, v4}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    iput-object v4, v0, Lz2;->f:Lsi;

    .line 137
    .line 138
    :cond_4
    const/4 v4, 0x6

    .line 139
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 140
    .line 141
    .line 142
    move-result v17

    .line 143
    if-eqz v17, :cond_5

    .line 144
    .line 145
    invoke-virtual {v1, v4, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    invoke-static {v11, v12, v1}, Lz2;->c(Landroid/content/Context;LP1;I)Lsi;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Lz2;->g:Lsi;

    .line 154
    .line 155
    :cond_5
    invoke-virtual {v14}, LN2;->p()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v10}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    instance-of v1, v1, Landroid/text/method/PasswordTransformationMethod;

    .line 163
    .line 164
    sget-object v14, LNf;->w:[I

    .line 165
    .line 166
    const/16 v4, 0x1a

    .line 167
    .line 168
    const/16 v5, 0xe

    .line 169
    .line 170
    const/16 v7, 0xf

    .line 171
    .line 172
    if-eq v2, v15, :cond_9

    .line 173
    .line 174
    new-instance v6, LN2;

    .line 175
    .line 176
    invoke-virtual {v11, v2, v14}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-direct {v6, v11, v2}, LN2;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 181
    .line 182
    .line 183
    if-nez v1, :cond_6

    .line 184
    .line 185
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 186
    .line 187
    .line 188
    move-result v21

    .line 189
    if-eqz v21, :cond_6

    .line 190
    .line 191
    invoke-virtual {v2, v5, v13}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 192
    .line 193
    .line 194
    move-result v21

    .line 195
    const/16 v22, 0x1

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_6
    move/from16 v21, v13

    .line 199
    .line 200
    move/from16 v22, v21

    .line 201
    .line 202
    :goto_0
    invoke-virtual {v0, v11, v6}, Lz2;->n(Landroid/content/Context;LN2;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 206
    .line 207
    .line 208
    move-result v23

    .line 209
    if-eqz v23, :cond_7

    .line 210
    .line 211
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v23

    .line 215
    goto :goto_1

    .line 216
    :cond_7
    const/16 v23, 0x0

    .line 217
    .line 218
    :goto_1
    if-lt v3, v4, :cond_8

    .line 219
    .line 220
    const/16 v15, 0xd

    .line 221
    .line 222
    invoke-virtual {v2, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 223
    .line 224
    .line 225
    move-result v20

    .line 226
    if-eqz v20, :cond_8

    .line 227
    .line 228
    invoke-virtual {v2, v15}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    goto :goto_2

    .line 233
    :cond_8
    const/4 v2, 0x0

    .line 234
    :goto_2
    invoke-virtual {v6}, LN2;->p()V

    .line 235
    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_9
    move/from16 v21, v13

    .line 239
    .line 240
    move/from16 v22, v21

    .line 241
    .line 242
    const/4 v2, 0x0

    .line 243
    const/16 v23, 0x0

    .line 244
    .line 245
    :goto_3
    new-instance v6, LN2;

    .line 246
    .line 247
    invoke-virtual {v11, v8, v14, v9, v13}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 248
    .line 249
    .line 250
    move-result-object v14

    .line 251
    invoke-direct {v6, v11, v14}, LN2;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 252
    .line 253
    .line 254
    if-nez v1, :cond_a

    .line 255
    .line 256
    invoke-virtual {v14, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 257
    .line 258
    .line 259
    move-result v15

    .line 260
    if-eqz v15, :cond_a

    .line 261
    .line 262
    invoke-virtual {v14, v5, v13}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 263
    .line 264
    .line 265
    move-result v21

    .line 266
    move/from16 v5, v21

    .line 267
    .line 268
    const/16 v22, 0x1

    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_a
    move/from16 v5, v21

    .line 272
    .line 273
    :goto_4
    invoke-virtual {v14, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 274
    .line 275
    .line 276
    move-result v15

    .line 277
    if-eqz v15, :cond_b

    .line 278
    .line 279
    invoke-virtual {v14, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v23

    .line 283
    :cond_b
    move-object/from16 v15, v23

    .line 284
    .line 285
    if-lt v3, v4, :cond_c

    .line 286
    .line 287
    const/16 v4, 0xd

    .line 288
    .line 289
    invoke-virtual {v14, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 290
    .line 291
    .line 292
    move-result v20

    .line 293
    if-eqz v20, :cond_d

    .line 294
    .line 295
    invoke-virtual {v14, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    goto :goto_5

    .line 300
    :cond_c
    const/16 v4, 0xd

    .line 301
    .line 302
    :cond_d
    :goto_5
    const/16 v4, 0x1c

    .line 303
    .line 304
    if-lt v3, v4, :cond_e

    .line 305
    .line 306
    invoke-virtual {v14, v13}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    if-eqz v4, :cond_e

    .line 311
    .line 312
    const/4 v4, -0x1

    .line 313
    invoke-virtual {v14, v13, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 314
    .line 315
    .line 316
    move-result v14

    .line 317
    if-nez v14, :cond_e

    .line 318
    .line 319
    const/4 v4, 0x0

    .line 320
    invoke-virtual {v10, v13, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 321
    .line 322
    .line 323
    :cond_e
    invoke-virtual {v0, v11, v6}, Lz2;->n(Landroid/content/Context;LN2;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v6}, LN2;->p()V

    .line 327
    .line 328
    .line 329
    if-nez v1, :cond_f

    .line 330
    .line 331
    if-eqz v22, :cond_f

    .line 332
    .line 333
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 334
    .line 335
    .line 336
    :cond_f
    iget-object v1, v0, Lz2;->l:Landroid/graphics/Typeface;

    .line 337
    .line 338
    if-eqz v1, :cond_11

    .line 339
    .line 340
    iget v4, v0, Lz2;->k:I

    .line 341
    .line 342
    const/4 v5, -0x1

    .line 343
    if-ne v4, v5, :cond_10

    .line 344
    .line 345
    iget v4, v0, Lz2;->j:I

    .line 346
    .line 347
    invoke-virtual {v10, v1, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 348
    .line 349
    .line 350
    goto :goto_6

    .line 351
    :cond_10
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 352
    .line 353
    .line 354
    :cond_11
    :goto_6
    if-eqz v2, :cond_12

    .line 355
    .line 356
    invoke-static {v10, v2}, Lx2;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 357
    .line 358
    .line 359
    :cond_12
    const/16 v14, 0x18

    .line 360
    .line 361
    if-eqz v15, :cond_14

    .line 362
    .line 363
    if-lt v3, v14, :cond_13

    .line 364
    .line 365
    invoke-static {v15}, Lw2;->a(Ljava/lang/String;)Landroid/os/LocaleList;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    invoke-static {v10, v1}, Lw2;->b(Landroid/widget/TextView;Landroid/os/LocaleList;)V

    .line 370
    .line 371
    .line 372
    goto :goto_7

    .line 373
    :cond_13
    const-string v1, ","

    .line 374
    .line 375
    invoke-virtual {v15, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    aget-object v1, v1, v13

    .line 380
    .line 381
    invoke-static {v1}, Lv2;->a(Ljava/lang/String;)Ljava/util/Locale;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    invoke-static {v10, v1}, Lu2;->c(Landroid/widget/TextView;Ljava/util/Locale;)V

    .line 386
    .line 387
    .line 388
    :cond_14
    :goto_7
    sget-object v15, LNf;->i:[I

    .line 389
    .line 390
    iget-object v6, v0, Lz2;->i:LJ2;

    .line 391
    .line 392
    iget-object v5, v6, LJ2;->j:Landroid/content/Context;

    .line 393
    .line 394
    invoke-virtual {v5, v8, v15, v9, v13}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    iget-object v1, v6, LJ2;->i:Landroid/widget/TextView;

    .line 399
    .line 400
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 401
    .line 402
    .line 403
    move-result-object v2

    .line 404
    const/16 v21, 0x0

    .line 405
    .line 406
    move-object v3, v15

    .line 407
    move-object/from16 v18, v4

    .line 408
    .line 409
    const/4 v14, 0x2

    .line 410
    const/16 v16, 0xd

    .line 411
    .line 412
    move-object/from16 v4, p1

    .line 413
    .line 414
    move-object/from16 v19, v5

    .line 415
    .line 416
    const/4 v14, 0x4

    .line 417
    move-object/from16 v5, v18

    .line 418
    .line 419
    move-object v14, v6

    .line 420
    move/from16 v6, p2

    .line 421
    .line 422
    const/4 v9, 0x5

    .line 423
    move/from16 v7, v21

    .line 424
    .line 425
    invoke-static/range {v1 .. v7}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 426
    .line 427
    .line 428
    move-object/from16 v1, v18

    .line 429
    .line 430
    invoke-virtual {v1, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    if-eqz v2, :cond_15

    .line 435
    .line 436
    invoke-virtual {v1, v9, v13}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 437
    .line 438
    .line 439
    move-result v2

    .line 440
    iput v2, v14, LJ2;->a:I

    .line 441
    .line 442
    :cond_15
    const/4 v2, 0x4

    .line 443
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 444
    .line 445
    .line 446
    move-result v3

    .line 447
    const/high16 v4, -0x40800000    # -1.0f

    .line 448
    .line 449
    if-eqz v3, :cond_16

    .line 450
    .line 451
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 452
    .line 453
    .line 454
    move-result v2

    .line 455
    :goto_8
    const/4 v3, 0x2

    .line 456
    goto :goto_9

    .line 457
    :cond_16
    move v2, v4

    .line 458
    goto :goto_8

    .line 459
    :goto_9
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 460
    .line 461
    .line 462
    move-result v5

    .line 463
    if-eqz v5, :cond_17

    .line 464
    .line 465
    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 466
    .line 467
    .line 468
    move-result v5

    .line 469
    :goto_a
    const/4 v3, 0x1

    .line 470
    goto :goto_b

    .line 471
    :cond_17
    move v5, v4

    .line 472
    goto :goto_a

    .line 473
    :goto_b
    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 474
    .line 475
    .line 476
    move-result v6

    .line 477
    if-eqz v6, :cond_18

    .line 478
    .line 479
    invoke-virtual {v1, v3, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 480
    .line 481
    .line 482
    move-result v6

    .line 483
    :goto_c
    const/4 v7, 0x3

    .line 484
    goto :goto_d

    .line 485
    :cond_18
    move v6, v4

    .line 486
    goto :goto_c

    .line 487
    :goto_d
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 488
    .line 489
    .line 490
    move-result v9

    .line 491
    if-eqz v9, :cond_1b

    .line 492
    .line 493
    invoke-virtual {v1, v7, v13}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 494
    .line 495
    .line 496
    move-result v9

    .line 497
    if-lez v9, :cond_1b

    .line 498
    .line 499
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    .line 500
    .line 501
    .line 502
    move-result-object v7

    .line 503
    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    .line 504
    .line 505
    .line 506
    move-result-object v7

    .line 507
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->length()I

    .line 508
    .line 509
    .line 510
    move-result v9

    .line 511
    new-array v13, v9, [I

    .line 512
    .line 513
    if-lez v9, :cond_1a

    .line 514
    .line 515
    const/4 v4, 0x0

    .line 516
    :goto_e
    if-ge v4, v9, :cond_19

    .line 517
    .line 518
    const/4 v3, -0x1

    .line 519
    invoke-virtual {v7, v4, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 520
    .line 521
    .line 522
    move-result v17

    .line 523
    aput v17, v13, v4

    .line 524
    .line 525
    add-int/lit8 v4, v4, 0x1

    .line 526
    .line 527
    const/4 v3, 0x1

    .line 528
    goto :goto_e

    .line 529
    :cond_19
    invoke-static {v13}, LJ2;->b([I)[I

    .line 530
    .line 531
    .line 532
    move-result-object v3

    .line 533
    iput-object v3, v14, LJ2;->f:[I

    .line 534
    .line 535
    invoke-virtual {v14}, LJ2;->i()Z

    .line 536
    .line 537
    .line 538
    :cond_1a
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 539
    .line 540
    .line 541
    :cond_1b
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v14}, LJ2;->j()Z

    .line 545
    .line 546
    .line 547
    move-result v1

    .line 548
    const/high16 v3, 0x3f800000    # 1.0f

    .line 549
    .line 550
    if-eqz v1, :cond_20

    .line 551
    .line 552
    iget v1, v14, LJ2;->a:I

    .line 553
    .line 554
    const/4 v4, 0x1

    .line 555
    if-ne v1, v4, :cond_21

    .line 556
    .line 557
    iget-boolean v1, v14, LJ2;->g:Z

    .line 558
    .line 559
    if-nez v1, :cond_1f

    .line 560
    .line 561
    invoke-virtual/range {v19 .. v19}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 566
    .line 567
    .line 568
    move-result-object v1

    .line 569
    const/high16 v4, -0x40800000    # -1.0f

    .line 570
    .line 571
    cmpl-float v7, v5, v4

    .line 572
    .line 573
    if-nez v7, :cond_1c

    .line 574
    .line 575
    const/high16 v5, 0x41400000    # 12.0f

    .line 576
    .line 577
    const/4 v7, 0x2

    .line 578
    invoke-static {v7, v5, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 579
    .line 580
    .line 581
    move-result v5

    .line 582
    goto :goto_f

    .line 583
    :cond_1c
    const/4 v7, 0x2

    .line 584
    :goto_f
    cmpl-float v9, v6, v4

    .line 585
    .line 586
    if-nez v9, :cond_1d

    .line 587
    .line 588
    const/high16 v6, 0x42e00000    # 112.0f

    .line 589
    .line 590
    invoke-static {v7, v6, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 591
    .line 592
    .line 593
    move-result v6

    .line 594
    :cond_1d
    cmpl-float v1, v2, v4

    .line 595
    .line 596
    if-nez v1, :cond_1e

    .line 597
    .line 598
    move v2, v3

    .line 599
    :cond_1e
    invoke-virtual {v14, v5, v6, v2}, LJ2;->k(FFF)V

    .line 600
    .line 601
    .line 602
    :cond_1f
    invoke-virtual {v14}, LJ2;->h()Z

    .line 603
    .line 604
    .line 605
    goto :goto_10

    .line 606
    :cond_20
    const/4 v1, 0x0

    .line 607
    iput v1, v14, LJ2;->a:I

    .line 608
    .line 609
    :cond_21
    :goto_10
    sget-boolean v1, LZj;->b:Z

    .line 610
    .line 611
    if-eqz v1, :cond_23

    .line 612
    .line 613
    iget v1, v14, LJ2;->a:I

    .line 614
    .line 615
    if-eqz v1, :cond_23

    .line 616
    .line 617
    iget-object v1, v14, LJ2;->f:[I

    .line 618
    .line 619
    array-length v2, v1

    .line 620
    if-lez v2, :cond_23

    .line 621
    .line 622
    invoke-static {v10}, Lx2;->a(Landroid/widget/TextView;)I

    .line 623
    .line 624
    .line 625
    move-result v2

    .line 626
    int-to-float v2, v2

    .line 627
    const/high16 v4, -0x40800000    # -1.0f

    .line 628
    .line 629
    cmpl-float v2, v2, v4

    .line 630
    .line 631
    if-eqz v2, :cond_22

    .line 632
    .line 633
    iget v1, v14, LJ2;->d:F

    .line 634
    .line 635
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    iget v2, v14, LJ2;->e:F

    .line 640
    .line 641
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 642
    .line 643
    .line 644
    move-result v2

    .line 645
    iget v4, v14, LJ2;->c:F

    .line 646
    .line 647
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 648
    .line 649
    .line 650
    move-result v4

    .line 651
    const/4 v5, 0x0

    .line 652
    invoke-static {v10, v1, v2, v4, v5}, Lx2;->b(Landroid/widget/TextView;IIII)V

    .line 653
    .line 654
    .line 655
    goto :goto_11

    .line 656
    :cond_22
    const/4 v5, 0x0

    .line 657
    invoke-static {v10, v1, v5}, Lx2;->c(Landroid/widget/TextView;[II)V

    .line 658
    .line 659
    .line 660
    :cond_23
    :goto_11
    invoke-virtual {v11, v8, v15}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 661
    .line 662
    .line 663
    move-result-object v1

    .line 664
    const/16 v2, 0x8

    .line 665
    .line 666
    const/4 v4, -0x1

    .line 667
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 668
    .line 669
    .line 670
    move-result v2

    .line 671
    if-eq v2, v4, :cond_24

    .line 672
    .line 673
    invoke-virtual {v12, v11, v2}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 674
    .line 675
    .line 676
    move-result-object v7

    .line 677
    const/16 v2, 0xd

    .line 678
    .line 679
    goto :goto_12

    .line 680
    :cond_24
    const/16 v2, 0xd

    .line 681
    .line 682
    const/4 v7, 0x0

    .line 683
    :goto_12
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 684
    .line 685
    .line 686
    move-result v2

    .line 687
    if-eq v2, v4, :cond_25

    .line 688
    .line 689
    invoke-virtual {v12, v11, v2}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 690
    .line 691
    .line 692
    move-result-object v2

    .line 693
    goto :goto_13

    .line 694
    :cond_25
    const/4 v2, 0x0

    .line 695
    :goto_13
    const/16 v5, 0x9

    .line 696
    .line 697
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 698
    .line 699
    .line 700
    move-result v5

    .line 701
    if-eq v5, v4, :cond_26

    .line 702
    .line 703
    invoke-virtual {v12, v11, v5}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 704
    .line 705
    .line 706
    move-result-object v5

    .line 707
    :goto_14
    const/4 v6, 0x6

    .line 708
    goto :goto_15

    .line 709
    :cond_26
    const/4 v5, 0x0

    .line 710
    goto :goto_14

    .line 711
    :goto_15
    invoke-virtual {v1, v6, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 712
    .line 713
    .line 714
    move-result v6

    .line 715
    if-eq v6, v4, :cond_27

    .line 716
    .line 717
    invoke-virtual {v12, v11, v6}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 718
    .line 719
    .line 720
    move-result-object v6

    .line 721
    goto :goto_16

    .line 722
    :cond_27
    const/4 v6, 0x0

    .line 723
    :goto_16
    const/16 v8, 0xa

    .line 724
    .line 725
    invoke-virtual {v1, v8, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 726
    .line 727
    .line 728
    move-result v8

    .line 729
    if-eq v8, v4, :cond_28

    .line 730
    .line 731
    invoke-virtual {v12, v11, v8}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 732
    .line 733
    .line 734
    move-result-object v8

    .line 735
    goto :goto_17

    .line 736
    :cond_28
    const/4 v8, 0x0

    .line 737
    :goto_17
    const/4 v9, 0x7

    .line 738
    invoke-virtual {v1, v9, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 739
    .line 740
    .line 741
    move-result v9

    .line 742
    if-eq v9, v4, :cond_29

    .line 743
    .line 744
    invoke-virtual {v12, v11, v9}, LP1;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 745
    .line 746
    .line 747
    move-result-object v4

    .line 748
    goto :goto_18

    .line 749
    :cond_29
    const/4 v4, 0x0

    .line 750
    :goto_18
    if-nez v8, :cond_34

    .line 751
    .line 752
    if-eqz v4, :cond_2a

    .line 753
    .line 754
    goto :goto_21

    .line 755
    :cond_2a
    if-nez v7, :cond_2b

    .line 756
    .line 757
    if-nez v2, :cond_2b

    .line 758
    .line 759
    if-nez v5, :cond_2b

    .line 760
    .line 761
    if-eqz v6, :cond_39

    .line 762
    .line 763
    :cond_2b
    invoke-static {v10}, Lu2;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 764
    .line 765
    .line 766
    move-result-object v4

    .line 767
    const/4 v8, 0x0

    .line 768
    aget-object v9, v4, v8

    .line 769
    .line 770
    if-nez v9, :cond_31

    .line 771
    .line 772
    const/4 v12, 0x2

    .line 773
    aget-object v13, v4, v12

    .line 774
    .line 775
    if-eqz v13, :cond_2c

    .line 776
    .line 777
    goto :goto_1d

    .line 778
    :cond_2c
    invoke-virtual {v10}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 779
    .line 780
    .line 781
    move-result-object v4

    .line 782
    if-eqz v7, :cond_2d

    .line 783
    .line 784
    goto :goto_19

    .line 785
    :cond_2d
    aget-object v7, v4, v8

    .line 786
    .line 787
    :goto_19
    if-eqz v2, :cond_2e

    .line 788
    .line 789
    goto :goto_1a

    .line 790
    :cond_2e
    const/4 v2, 0x1

    .line 791
    aget-object v2, v4, v2

    .line 792
    .line 793
    :goto_1a
    if-eqz v5, :cond_2f

    .line 794
    .line 795
    goto :goto_1b

    .line 796
    :cond_2f
    const/4 v5, 0x2

    .line 797
    aget-object v5, v4, v5

    .line 798
    .line 799
    :goto_1b
    if-eqz v6, :cond_30

    .line 800
    .line 801
    goto :goto_1c

    .line 802
    :cond_30
    const/4 v6, 0x3

    .line 803
    aget-object v6, v4, v6

    .line 804
    .line 805
    :goto_1c
    invoke-virtual {v10, v7, v2, v5, v6}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 806
    .line 807
    .line 808
    goto :goto_26

    .line 809
    :cond_31
    :goto_1d
    if-eqz v2, :cond_32

    .line 810
    .line 811
    :goto_1e
    const/4 v5, 0x2

    .line 812
    goto :goto_1f

    .line 813
    :cond_32
    const/4 v2, 0x1

    .line 814
    aget-object v2, v4, v2

    .line 815
    .line 816
    goto :goto_1e

    .line 817
    :goto_1f
    aget-object v5, v4, v5

    .line 818
    .line 819
    if-eqz v6, :cond_33

    .line 820
    .line 821
    goto :goto_20

    .line 822
    :cond_33
    const/4 v6, 0x3

    .line 823
    aget-object v6, v4, v6

    .line 824
    .line 825
    :goto_20
    invoke-static {v10, v9, v2, v5, v6}, Lu2;->b(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 826
    .line 827
    .line 828
    goto :goto_26

    .line 829
    :cond_34
    :goto_21
    invoke-static {v10}, Lu2;->a(Landroid/widget/TextView;)[Landroid/graphics/drawable/Drawable;

    .line 830
    .line 831
    .line 832
    move-result-object v5

    .line 833
    if-eqz v8, :cond_35

    .line 834
    .line 835
    goto :goto_22

    .line 836
    :cond_35
    const/4 v7, 0x0

    .line 837
    aget-object v8, v5, v7

    .line 838
    .line 839
    :goto_22
    if-eqz v2, :cond_36

    .line 840
    .line 841
    goto :goto_23

    .line 842
    :cond_36
    const/4 v2, 0x1

    .line 843
    aget-object v2, v5, v2

    .line 844
    .line 845
    :goto_23
    if-eqz v4, :cond_37

    .line 846
    .line 847
    goto :goto_24

    .line 848
    :cond_37
    const/4 v4, 0x2

    .line 849
    aget-object v4, v5, v4

    .line 850
    .line 851
    :goto_24
    if-eqz v6, :cond_38

    .line 852
    .line 853
    goto :goto_25

    .line 854
    :cond_38
    const/4 v6, 0x3

    .line 855
    aget-object v6, v5, v6

    .line 856
    .line 857
    :goto_25
    invoke-static {v10, v8, v2, v4, v6}, Lu2;->b(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 858
    .line 859
    .line 860
    :cond_39
    :goto_26
    const/16 v2, 0xb

    .line 861
    .line 862
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 863
    .line 864
    .line 865
    move-result v4

    .line 866
    if-eqz v4, :cond_3c

    .line 867
    .line 868
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 869
    .line 870
    .line 871
    move-result v4

    .line 872
    if-eqz v4, :cond_3a

    .line 873
    .line 874
    const/4 v4, 0x0

    .line 875
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 876
    .line 877
    .line 878
    move-result v4

    .line 879
    if-eqz v4, :cond_3a

    .line 880
    .line 881
    invoke-static {v11, v4}, LMk;->p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 882
    .line 883
    .line 884
    move-result-object v4

    .line 885
    if-eqz v4, :cond_3a

    .line 886
    .line 887
    goto :goto_27

    .line 888
    :cond_3a
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 889
    .line 890
    .line 891
    move-result-object v4

    .line 892
    :goto_27
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 893
    .line 894
    const/16 v5, 0x18

    .line 895
    .line 896
    if-lt v2, v5, :cond_3b

    .line 897
    .line 898
    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setCompoundDrawableTintList(Landroid/content/res/ColorStateList;)V

    .line 899
    .line 900
    .line 901
    goto :goto_28

    .line 902
    :cond_3b
    instance-of v2, v10, Lui;

    .line 903
    .line 904
    if-eqz v2, :cond_3c

    .line 905
    .line 906
    move-object v2, v10

    .line 907
    check-cast v2, Lui;

    .line 908
    .line 909
    invoke-interface {v2, v4}, Lui;->setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V

    .line 910
    .line 911
    .line 912
    :cond_3c
    :goto_28
    const/16 v2, 0xc

    .line 913
    .line 914
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 915
    .line 916
    .line 917
    move-result v4

    .line 918
    if-eqz v4, :cond_3e

    .line 919
    .line 920
    const/4 v4, -0x1

    .line 921
    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 922
    .line 923
    .line 924
    move-result v2

    .line 925
    const/4 v4, 0x0

    .line 926
    invoke-static {v2, v4}, LX6;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 927
    .line 928
    .line 929
    move-result-object v2

    .line 930
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 931
    .line 932
    const/16 v5, 0x18

    .line 933
    .line 934
    if-lt v4, v5, :cond_3d

    .line 935
    .line 936
    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setCompoundDrawableTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 937
    .line 938
    .line 939
    goto :goto_29

    .line 940
    :cond_3d
    instance-of v4, v10, Lui;

    .line 941
    .line 942
    if-eqz v4, :cond_3e

    .line 943
    .line 944
    move-object v4, v10

    .line 945
    check-cast v4, Lui;

    .line 946
    .line 947
    invoke-interface {v4, v2}, Lui;->setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 948
    .line 949
    .line 950
    :cond_3e
    :goto_29
    const/4 v2, -0x1

    .line 951
    const/16 v4, 0xf

    .line 952
    .line 953
    invoke-virtual {v1, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 954
    .line 955
    .line 956
    move-result v4

    .line 957
    const/16 v5, 0x12

    .line 958
    .line 959
    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 960
    .line 961
    .line 962
    move-result v5

    .line 963
    const/16 v6, 0x13

    .line 964
    .line 965
    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 966
    .line 967
    .line 968
    move-result v6

    .line 969
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 970
    .line 971
    .line 972
    if-eq v4, v2, :cond_3f

    .line 973
    .line 974
    invoke-static {v10, v4}, LMk;->E(Landroid/widget/TextView;I)V

    .line 975
    .line 976
    .line 977
    :cond_3f
    if-eq v5, v2, :cond_40

    .line 978
    .line 979
    invoke-static {v10, v5}, LMk;->F(Landroid/widget/TextView;I)V

    .line 980
    .line 981
    .line 982
    :cond_40
    if-eq v6, v2, :cond_42

    .line 983
    .line 984
    if-ltz v6, :cond_41

    .line 985
    .line 986
    invoke-virtual {v10}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 987
    .line 988
    .line 989
    move-result-object v1

    .line 990
    const/4 v2, 0x0

    .line 991
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 992
    .line 993
    .line 994
    move-result v1

    .line 995
    if-eq v6, v1, :cond_42

    .line 996
    .line 997
    sub-int/2addr v6, v1

    .line 998
    int-to-float v1, v6

    .line 999
    invoke-virtual {v10, v1, v3}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 1000
    .line 1001
    .line 1002
    goto :goto_2a

    .line 1003
    :cond_41
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 1004
    .line 1005
    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 1006
    .line 1007
    .line 1008
    throw v1

    .line 1009
    :cond_42
    :goto_2a
    return-void
.end method

.method public final g(Landroid/content/Context;I)V
    .locals 5

    .line 1
    sget-object v0, LNf;->w:[I

    .line 2
    .line 3
    new-instance v1, LN2;

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {v1, p1, p2}, LN2;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0xe

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iget-object v3, p0, Lz2;->a:Landroid/widget/TextView;

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2, v0, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    const/4 v2, -0x1

    .line 39
    invoke-virtual {p2, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v3, v4, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0, p1, v1}, Lz2;->n(Landroid/content/Context;LN2;)V

    .line 50
    .line 51
    .line 52
    const/16 p1, 0x1a

    .line 53
    .line 54
    if-lt v0, p1, :cond_2

    .line 55
    .line 56
    const/16 p1, 0xd

    .line 57
    .line 58
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-static {v3, p1}, Lx2;->d(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-virtual {v1}, LN2;->p()V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    iget p2, p0, Lz2;->j:I

    .line 81
    .line 82
    invoke-virtual {v3, p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public final i(IIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz2;->i:LJ2;

    .line 2
    .line 3
    invoke-virtual {v0}, LJ2;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, v0, LJ2;->j:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    int-to-float p1, p1

    .line 20
    invoke-static {p4, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    int-to-float p2, p2

    .line 25
    invoke-static {p4, p2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    int-to-float p3, p3

    .line 30
    invoke-static {p4, p3, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    invoke-virtual {v0, p1, p2, p3}, LJ2;->k(FFF)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, LJ2;->h()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, LJ2;->a()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final j([II)V
    .locals 6

    .line 1
    iget-object v0, p0, Lz2;->i:LJ2;

    .line 2
    .line 3
    invoke-virtual {v0}, LJ2;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_4

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-lez v1, :cond_3

    .line 12
    .line 13
    new-array v3, v1, [I

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v4, v0, LJ2;->j:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    :goto_0
    if-ge v2, v1, :cond_1

    .line 33
    .line 34
    aget v5, p1, v2

    .line 35
    .line 36
    int-to-float v5, v5

    .line 37
    invoke-static {p2, v5, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    aput v5, v3, v2

    .line 46
    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    :goto_1
    invoke-static {v3}, LJ2;->b([I)[I

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, v0, LJ2;->f:[I

    .line 55
    .line 56
    invoke-virtual {v0}, LJ2;->i()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 64
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v1, "None of the preset sizes is valid: "

    .line 68
    .line 69
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p2

    .line 87
    :cond_3
    iput-boolean v2, v0, LJ2;->g:Z

    .line 88
    .line 89
    :goto_2
    invoke-virtual {v0}, LJ2;->h()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    invoke-virtual {v0}, LJ2;->a()V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-void
.end method

.method public final k(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lz2;->i:LJ2;

    .line 2
    .line 3
    invoke-virtual {v0}, LJ2;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne p1, v1, :cond_0

    .line 13
    .line 14
    iget-object p1, v0, LJ2;->j:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v1, 0x2

    .line 25
    const/high16 v2, 0x41400000    # 12.0f

    .line 26
    .line 27
    invoke-static {v1, v2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/high16 v3, 0x42e00000    # 112.0f

    .line 32
    .line 33
    invoke-static {v1, v3, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/high16 v1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    invoke-virtual {v0, v2, p1, v1}, LJ2;->k(FFF)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, LJ2;->h()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, LJ2;->a()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 53
    .line 54
    const-string v1, "Unknown auto-size text type: "

    .line 55
    .line 56
    invoke-static {v1, p1}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :cond_1
    const/4 p1, 0x0

    .line 65
    iput p1, v0, LJ2;->a:I

    .line 66
    .line 67
    const/high16 v1, -0x40800000    # -1.0f

    .line 68
    .line 69
    iput v1, v0, LJ2;->d:F

    .line 70
    .line 71
    iput v1, v0, LJ2;->e:F

    .line 72
    .line 73
    iput v1, v0, LJ2;->c:F

    .line 74
    .line 75
    new-array v1, p1, [I

    .line 76
    .line 77
    iput-object v1, v0, LJ2;->f:[I

    .line 78
    .line 79
    iput-boolean p1, v0, LJ2;->b:Z

    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void
.end method

.method public final l(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lsi;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lz2;->h:Lsi;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 13
    .line 14
    iput-object p1, v0, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Lsi;->d:Z

    .line 22
    .line 23
    iput-object v0, p0, Lz2;->b:Lsi;

    .line 24
    .line 25
    iput-object v0, p0, Lz2;->c:Lsi;

    .line 26
    .line 27
    iput-object v0, p0, Lz2;->d:Lsi;

    .line 28
    .line 29
    iput-object v0, p0, Lz2;->e:Lsi;

    .line 30
    .line 31
    iput-object v0, p0, Lz2;->f:Lsi;

    .line 32
    .line 33
    iput-object v0, p0, Lz2;->g:Lsi;

    .line 34
    .line 35
    return-void
.end method

.method public final m(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lsi;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lz2;->h:Lsi;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lz2;->h:Lsi;

    .line 13
    .line 14
    iput-object p1, v0, Lsi;->b:Landroid/graphics/PorterDuff$Mode;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    :goto_0
    iput-boolean p1, v0, Lsi;->c:Z

    .line 22
    .line 23
    iput-object v0, p0, Lz2;->b:Lsi;

    .line 24
    .line 25
    iput-object v0, p0, Lz2;->c:Lsi;

    .line 26
    .line 27
    iput-object v0, p0, Lz2;->d:Lsi;

    .line 28
    .line 29
    iput-object v0, p0, Lz2;->e:Lsi;

    .line 30
    .line 31
    iput-object v0, p0, Lz2;->f:Lsi;

    .line 32
    .line 33
    iput-object v0, p0, Lz2;->g:Lsi;

    .line 34
    .line 35
    return-void
.end method

.method public final n(Landroid/content/Context;LN2;)V
    .locals 11

    .line 1
    iget v0, p0, Lz2;->j:I

    .line 2
    .line 3
    iget-object v1, p2, LN2;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Landroid/content/res/TypedArray;

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lz2;->j:I

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v3, 0x1c

    .line 17
    .line 18
    const/4 v4, -0x1

    .line 19
    if-lt v0, v3, :cond_0

    .line 20
    .line 21
    const/16 v5, 0xb

    .line 22
    .line 23
    invoke-virtual {v1, v5, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    iput v5, p0, Lz2;->k:I

    .line 28
    .line 29
    if-eq v5, v4, :cond_0

    .line 30
    .line 31
    iget v5, p0, Lz2;->j:I

    .line 32
    .line 33
    and-int/2addr v5, v2

    .line 34
    iput v5, p0, Lz2;->j:I

    .line 35
    .line 36
    :cond_0
    const/16 v5, 0xa

    .line 37
    .line 38
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/16 v7, 0xc

    .line 43
    .line 44
    const/4 v8, 0x0

    .line 45
    const/4 v9, 0x1

    .line 46
    if-nez v6, :cond_6

    .line 47
    .line 48
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-eqz v6, :cond_1

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_1
    invoke-virtual {v1, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_5

    .line 60
    .line 61
    iput-boolean v8, p0, Lz2;->m:Z

    .line 62
    .line 63
    invoke-virtual {v1, v9, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eq p1, v9, :cond_4

    .line 68
    .line 69
    if-eq p1, v2, :cond_3

    .line 70
    .line 71
    const/4 p2, 0x3

    .line 72
    if-eq p1, p2, :cond_2

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 76
    .line 77
    :goto_0
    iput-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    :goto_1
    return-void

    .line 87
    :cond_6
    :goto_2
    const/4 v6, 0x0

    .line 88
    iput-object v6, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 89
    .line 90
    invoke-virtual {v1, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_7

    .line 95
    .line 96
    move v5, v7

    .line 97
    :cond_7
    iget v6, p0, Lz2;->k:I

    .line 98
    .line 99
    iget v7, p0, Lz2;->j:I

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_c

    .line 106
    .line 107
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 108
    .line 109
    iget-object v10, p0, Lz2;->a:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-direct {p1, v10}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    new-instance v10, Ls2;

    .line 115
    .line 116
    invoke-direct {v10, p0, v6, v7, p1}, Ls2;-><init>(Lz2;IILjava/lang/ref/WeakReference;)V

    .line 117
    .line 118
    .line 119
    :try_start_0
    iget p1, p0, Lz2;->j:I

    .line 120
    .line 121
    invoke-virtual {p2, v5, p1, v10}, LN2;->l(IILs2;)Landroid/graphics/Typeface;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    if-eqz p1, :cond_a

    .line 126
    .line 127
    if-lt v0, v3, :cond_9

    .line 128
    .line 129
    iget p2, p0, Lz2;->k:I

    .line 130
    .line 131
    if-eq p2, v4, :cond_9

    .line 132
    .line 133
    invoke-static {p1, v8}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget p2, p0, Lz2;->k:I

    .line 138
    .line 139
    iget v0, p0, Lz2;->j:I

    .line 140
    .line 141
    and-int/2addr v0, v2

    .line 142
    if-eqz v0, :cond_8

    .line 143
    .line 144
    move v0, v9

    .line 145
    goto :goto_3

    .line 146
    :cond_8
    move v0, v8

    .line 147
    :goto_3
    invoke-static {p1, p2, v0}, Ly2;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    :cond_9
    iput-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 152
    .line 153
    :cond_a
    iget-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 154
    .line 155
    if-nez p1, :cond_b

    .line 156
    .line 157
    move p1, v9

    .line 158
    goto :goto_4

    .line 159
    :cond_b
    move p1, v8

    .line 160
    :goto_4
    iput-boolean p1, p0, Lz2;->m:Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    :catch_0
    :cond_c
    iget-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 163
    .line 164
    if-nez p1, :cond_f

    .line 165
    .line 166
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_f

    .line 171
    .line 172
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 173
    .line 174
    if-lt p2, v3, :cond_e

    .line 175
    .line 176
    iget p2, p0, Lz2;->k:I

    .line 177
    .line 178
    if-eq p2, v4, :cond_e

    .line 179
    .line 180
    invoke-static {p1, v8}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iget p2, p0, Lz2;->k:I

    .line 185
    .line 186
    iget v0, p0, Lz2;->j:I

    .line 187
    .line 188
    and-int/2addr v0, v2

    .line 189
    if-eqz v0, :cond_d

    .line 190
    .line 191
    move v8, v9

    .line 192
    :cond_d
    invoke-static {p1, p2, v8}, Ly2;->a(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    :goto_5
    iput-object p1, p0, Lz2;->l:Landroid/graphics/Typeface;

    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_e
    iget p2, p0, Lz2;->j:I

    .line 200
    .line 201
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    goto :goto_5

    .line 206
    :cond_f
    :goto_6
    return-void
.end method
