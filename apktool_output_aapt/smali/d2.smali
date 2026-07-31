.class public final Ld2;
.super LY1;
.source "SourceFile"


# instance fields
.field public final g:Landroid/widget/SeekBar;

.field public h:Landroid/graphics/drawable/Drawable;

.field public i:Landroid/content/res/ColorStateList;

.field public j:Landroid/graphics/PorterDuff$Mode;

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/widget/SeekBar;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p1}, LY1;-><init>(ILjava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ld2;->i:Landroid/content/res/ColorStateList;

    .line 7
    .line 8
    iput-object v0, p0, Ld2;->j:Landroid/graphics/PorterDuff$Mode;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ld2;->k:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ld2;->l:Z

    .line 14
    .line 15
    iput-object p1, p0, Ld2;->g:Landroid/widget/SeekBar;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final g(Landroid/util/AttributeSet;I)V
    .locals 9

    .line 1
    const v5, 0x7f0300dc

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, v5}, LY1;->g(Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Ld2;->g:Landroid/widget/SeekBar;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v2, LNf;->g:[I

    .line 14
    .line 15
    const/4 v7, 0x0

    .line 16
    invoke-static {v0, p1, v2, v5, v7}, LN2;->o(Landroid/content/Context;Landroid/util/AttributeSet;[III)LN2;

    .line 17
    .line 18
    .line 19
    move-result-object v8

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v6, 0x0

    .line 25
    iget-object v0, v8, LN2;->a:Ljava/lang/Object;

    .line 26
    .line 27
    move-object v4, v0

    .line 28
    check-cast v4, Landroid/content/res/TypedArray;

    .line 29
    .line 30
    move-object v0, p2

    .line 31
    move-object v3, p1

    .line 32
    invoke-static/range {v0 .. v6}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v8, v7}, LN2;->k(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Landroid/widget/AbsSeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 p1, 0x1

    .line 45
    invoke-virtual {v8, p1}, LN2;->j(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iput-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {p2}, Landroid/view/View;->getDrawableState()[I

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 82
    .line 83
    .line 84
    :cond_2
    invoke-virtual {p0}, Ld2;->l()V

    .line 85
    .line 86
    .line 87
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 88
    .line 89
    .line 90
    iget-object p2, v8, LN2;->a:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p2, Landroid/content/res/TypedArray;

    .line 93
    .line 94
    const/4 v0, 0x3

    .line 95
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_4

    .line 100
    .line 101
    const/4 v1, -0x1

    .line 102
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-object v1, p0, Ld2;->j:Landroid/graphics/PorterDuff$Mode;

    .line 107
    .line 108
    invoke-static {v0, v1}, LX6;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Ld2;->j:Landroid/graphics/PorterDuff$Mode;

    .line 113
    .line 114
    iput-boolean p1, p0, Ld2;->l:Z

    .line 115
    .line 116
    :cond_4
    const/4 v0, 0x2

    .line 117
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-eqz p2, :cond_5

    .line 122
    .line 123
    invoke-virtual {v8, v0}, LN2;->i(I)Landroid/content/res/ColorStateList;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iput-object p2, p0, Ld2;->i:Landroid/content/res/ColorStateList;

    .line 128
    .line 129
    iput-boolean p1, p0, Ld2;->k:Z

    .line 130
    .line 131
    :cond_5
    invoke-virtual {v8}, LN2;->p()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ld2;->l()V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v1, p0, Ld2;->k:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Ld2;->l:Z

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    iget-boolean v1, p0, Ld2;->k:Z

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ld2;->i:Landroid/content/res/ColorStateList;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-boolean v0, p0, Ld2;->l:Z

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    iget-object v1, p0, Ld2;->j:Landroid/graphics/PorterDuff$Mode;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    iget-object v1, p0, Ld2;->g:Landroid/widget/SeekBar;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getDrawableState()[I

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public final m(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ld2;->g:Landroid/widget/SeekBar;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-le v1, v2, :cond_3

    .line 13
    .line 14
    iget-object v3, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget-object v4, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-ltz v3, :cond_0

    .line 27
    .line 28
    div-int/lit8 v3, v3, 0x2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v3, v2

    .line 32
    :goto_0
    if-ltz v4, :cond_1

    .line 33
    .line 34
    div-int/lit8 v2, v4, 0x2

    .line 35
    .line 36
    :cond_1
    iget-object v4, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    neg-int v5, v3

    .line 39
    neg-int v6, v2

    .line 40
    invoke-virtual {v4, v5, v6, v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    sub-int/2addr v2, v3

    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v2, v3

    .line 57
    int-to-float v2, v2

    .line 58
    int-to-float v3, v1

    .line 59
    div-float/2addr v2, v3

    .line 60
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    int-to-float v4, v4

    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    div-int/lit8 v0, v0, 0x2

    .line 74
    .line 75
    int-to-float v0, v0

    .line 76
    invoke-virtual {p1, v4, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 77
    .line 78
    .line 79
    const/4 v0, 0x0

    .line 80
    :goto_1
    if-gt v0, v1, :cond_2

    .line 81
    .line 82
    iget-object v4, p0, Ld2;->h:Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 85
    .line 86
    .line 87
    const/4 v4, 0x0

    .line 88
    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method
