.class public Landroidx/core/widget/NestedScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements LFe;


# static fields
.field public static final D:F

.field public static final E:Lze;

.field public static final F:[I


# instance fields
.field public final A:LDe;

.field public B:F

.field public final C:LM6;

.field public final c:F

.field public d:J

.field public final e:Landroid/graphics/Rect;

.field public final f:Landroid/widget/OverScroller;

.field public final g:Landroid/widget/EdgeEffect;

.field public final h:Landroid/widget/EdgeEffect;

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Landroid/view/View;

.field public m:Z

.field public n:Landroid/view/VelocityTracker;

.field public o:Z

.field public p:Z

.field public final q:I

.field public final r:I

.field public final s:I

.field public t:I

.field public final u:[I

.field public final v:[I

.field public w:I

.field public x:I

.field public y:LCe;

.field public final z:LGe;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-wide v0, 0x3fe8f5c28f5c28f6L    # 0.78

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide v2, 0x3feccccccccccccdL    # 0.9

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    div-double/2addr v0, v2

    .line 20
    double-to-float v0, v0

    .line 21
    sput v0, Landroidx/core/widget/NestedScrollView;->D:F

    .line 22
    .line 23
    new-instance v0, Lze;

    .line 24
    .line 25
    invoke-direct {v0}, Lx;-><init>()V

    .line 26
    .line 27
    .line 28
    sput-object v0, Landroidx/core/widget/NestedScrollView;->E:Lze;

    .line 29
    .line 30
    const v0, 0x101017a

    .line 31
    .line 32
    .line 33
    filled-new-array {v0}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Landroidx/core/widget/NestedScrollView;->F:[I

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    const v0, 0x7f0300c1

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Landroidx/core/widget/NestedScrollView;->j:Z

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    iput-boolean v2, p0, Landroidx/core/widget/NestedScrollView;->k:Z

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/View;

    .line 22
    .line 23
    iput-boolean v2, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 24
    .line 25
    iput-boolean v1, p0, Landroidx/core/widget/NestedScrollView;->p:Z

    .line 26
    .line 27
    const/4 v3, -0x1

    .line 28
    iput v3, p0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    new-array v4, v3, [I

    .line 32
    .line 33
    iput-object v4, p0, Landroidx/core/widget/NestedScrollView;->u:[I

    .line 34
    .line 35
    new-array v3, v3, [I

    .line 36
    .line 37
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->v:[I

    .line 38
    .line 39
    new-instance v3, Li0;

    .line 40
    .line 41
    const/16 v4, 0xe

    .line 42
    .line 43
    invoke-direct {v3, v4, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance v4, LM6;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-direct {v4, v5, v3}, LM6;-><init>(Landroid/content/Context;Li0;)V

    .line 53
    .line 54
    .line 55
    iput-object v4, p0, Landroidx/core/widget/NestedScrollView;->C:LM6;

    .line 56
    .line 57
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 58
    .line 59
    const/16 v4, 0x1f

    .line 60
    .line 61
    if-lt v3, v4, :cond_0

    .line 62
    .line 63
    invoke-static {p1, p2}, Lf7;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/EdgeEffect;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    goto :goto_0

    .line 68
    :cond_0
    new-instance v5, Landroid/widget/EdgeEffect;

    .line 69
    .line 70
    invoke-direct {v5, p1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iput-object v5, p0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 74
    .line 75
    if-lt v3, v4, :cond_1

    .line 76
    .line 77
    invoke-static {p1, p2}, Lf7;->a(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/EdgeEffect;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    new-instance v3, Landroid/widget/EdgeEffect;

    .line 83
    .line 84
    invoke-direct {v3, p1}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    :goto_1
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 98
    .line 99
    const/high16 v4, 0x43200000    # 160.0f

    .line 100
    .line 101
    mul-float/2addr v3, v4

    .line 102
    const v4, 0x43c10b3d

    .line 103
    .line 104
    .line 105
    mul-float/2addr v3, v4

    .line 106
    const v4, 0x3f570a3d    # 0.84f

    .line 107
    .line 108
    .line 109
    mul-float/2addr v3, v4

    .line 110
    iput v3, p0, Landroidx/core/widget/NestedScrollView;->c:F

    .line 111
    .line 112
    new-instance v3, Landroid/widget/OverScroller;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-direct {v3, v4}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    .line 119
    .line 120
    .line 121
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 124
    .line 125
    .line 126
    const/high16 v3, 0x40000

    .line 127
    .line 128
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v2}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-static {v3}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    iput v4, p0, Landroidx/core/widget/NestedScrollView;->q:I

    .line 147
    .line 148
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    iput v4, p0, Landroidx/core/widget/NestedScrollView;->r:I

    .line 153
    .line 154
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    iput v3, p0, Landroidx/core/widget/NestedScrollView;->s:I

    .line 159
    .line 160
    sget-object v3, Landroidx/core/widget/NestedScrollView;->F:[I

    .line 161
    .line 162
    invoke-virtual {p1, p2, v3, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    invoke-virtual {p0, p2}, Landroidx/core/widget/NestedScrollView;->setFillViewport(Z)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 174
    .line 175
    .line 176
    new-instance p1, LGe;

    .line 177
    .line 178
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 179
    .line 180
    .line 181
    iput-object p1, p0, Landroidx/core/widget/NestedScrollView;->z:LGe;

    .line 182
    .line 183
    new-instance p1, LDe;

    .line 184
    .line 185
    invoke-direct {p1, p0}, LDe;-><init>(Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    iput-object p1, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 189
    .line 190
    invoke-virtual {p0, v1}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    .line 191
    .line 192
    .line 193
    sget-object p1, Landroidx/core/widget/NestedScrollView;->E:Lze;

    .line 194
    .line 195
    invoke-static {p0, p1}, LLj;->h(Landroid/view/View;Lx;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public static m(Landroid/view/View;Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    check-cast p0, Landroid/view/View;

    invoke-static {p0, p1}, Landroidx/core/widget/NestedScrollView;->m(Landroid/view/View;Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/View;II)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iget-object p2, p0, Landroidx/core/widget/NestedScrollView;->z:LGe;

    .line 3
    .line 4
    if-ne p4, p1, :cond_0

    .line 5
    .line 6
    iput p3, p2, LGe;->b:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iput p3, p2, LGe;->a:I

    .line 10
    .line 11
    :goto_0
    const/4 p1, 0x2

    .line 12
    invoke-virtual {p0, p1, p4}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final addView(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "ScrollView can host only one direct child"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final addView(Landroid/view/View;I)V
    .locals 1

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "ScrollView can host only one direct child"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "ScrollView can host only one direct child"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "ScrollView can host only one direct child"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final b(Landroid/view/View;I)V
    .locals 2

    .line 1
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->z:LGe;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    iput v1, p1, LGe;->b:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput v1, p1, LGe;->a:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, p2}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final c(Landroid/view/View;IIIII[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p5, p6, p7}, Landroidx/core/widget/NestedScrollView;->o(II[I)V

    return-void
.end method

.method public final computeHorizontalScrollExtent()I
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeHorizontalScrollExtent()I

    move-result v0

    return v0
.end method

.method public final computeHorizontalScrollOffset()I
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeHorizontalScrollOffset()I

    move-result v0

    return v0
.end method

.method public final computeHorizontalScrollRange()I
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeHorizontalScrollRange()I

    move-result v0

    return v0
.end method

.method public final computeScroll()V
    .locals 14

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v1, p0, Landroidx/core/widget/NestedScrollView;->x:I

    .line 22
    .line 23
    sub-int v1, v0, v1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 30
    .line 31
    iget-object v4, p0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 32
    .line 33
    const/high16 v5, 0x3f000000    # 0.5f

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    const/high16 v7, 0x40800000    # 4.0f

    .line 37
    .line 38
    if-lez v1, :cond_2

    .line 39
    .line 40
    invoke-static {v4}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    cmpl-float v8, v8, v6

    .line 45
    .line 46
    if-eqz v8, :cond_2

    .line 47
    .line 48
    neg-int v6, v1

    .line 49
    int-to-float v6, v6

    .line 50
    mul-float/2addr v6, v7

    .line 51
    int-to-float v8, v2

    .line 52
    div-float/2addr v6, v8

    .line 53
    neg-int v2, v2

    .line 54
    int-to-float v2, v2

    .line 55
    div-float/2addr v2, v7

    .line 56
    invoke-static {v4, v6, v5}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    mul-float/2addr v5, v2

    .line 61
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eq v2, v1, :cond_1

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/widget/EdgeEffect;->finish()V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    sub-int/2addr v1, v2

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    if-gez v1, :cond_3

    .line 73
    .line 74
    invoke-static {v3}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    cmpl-float v6, v8, v6

    .line 79
    .line 80
    if-eqz v6, :cond_3

    .line 81
    .line 82
    int-to-float v6, v1

    .line 83
    mul-float/2addr v6, v7

    .line 84
    int-to-float v2, v2

    .line 85
    div-float/2addr v6, v2

    .line 86
    div-float/2addr v2, v7

    .line 87
    invoke-static {v3, v6, v5}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    mul-float/2addr v5, v2

    .line 92
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eq v2, v1, :cond_1

    .line 97
    .line 98
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->finish()V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    :goto_1
    iput v0, p0, Landroidx/core/widget/NestedScrollView;->x:I

    .line 103
    .line 104
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->v:[I

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    const/4 v11, 0x0

    .line 108
    aput v11, v0, v2

    .line 109
    .line 110
    const/4 v8, 0x1

    .line 111
    const/4 v6, 0x0

    .line 112
    const/4 v10, 0x0

    .line 113
    move-object v5, p0

    .line 114
    move v7, v1

    .line 115
    move-object v9, v0

    .line 116
    invoke-virtual/range {v5 .. v10}, Landroidx/core/widget/NestedScrollView;->i(III[I[I)Z

    .line 117
    .line 118
    .line 119
    aget v5, v0, v2

    .line 120
    .line 121
    sub-int/2addr v1, v5

    .line 122
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 123
    .line 124
    .line 125
    move-result v13

    .line 126
    invoke-static {}, LH3;->c()Z

    .line 127
    .line 128
    .line 129
    move-result v5

    .line 130
    if-eqz v5, :cond_4

    .line 131
    .line 132
    iget-object v5, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 133
    .line 134
    invoke-virtual {v5}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    invoke-static {p0, v5}, LAe;->a(Landroid/view/View;F)V

    .line 143
    .line 144
    .line 145
    :cond_4
    if-eqz v1, :cond_5

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-virtual {p0, v1, v6, v5, v13}, Landroidx/core/widget/NestedScrollView;->q(IIII)Z

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    sub-int v7, v6, v5

    .line 163
    .line 164
    sub-int/2addr v1, v7

    .line 165
    aput v11, v0, v2

    .line 166
    .line 167
    const/4 v6, 0x0

    .line 168
    const/4 v8, 0x0

    .line 169
    iget-object v5, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 170
    .line 171
    iget-object v10, p0, Landroidx/core/widget/NestedScrollView;->u:[I

    .line 172
    .line 173
    const/4 v11, 0x1

    .line 174
    move v9, v1

    .line 175
    move-object v12, v0

    .line 176
    invoke-virtual/range {v5 .. v12}, LDe;->d(IIII[II[I)Z

    .line 177
    .line 178
    .line 179
    aget v0, v0, v2

    .line 180
    .line 181
    sub-int/2addr v1, v0

    .line 182
    :cond_5
    if-eqz v1, :cond_9

    .line 183
    .line 184
    invoke-virtual {p0}, Landroid/view/View;->getOverScrollMode()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_6

    .line 189
    .line 190
    if-ne v0, v2, :cond_8

    .line 191
    .line 192
    if-lez v13, :cond_8

    .line 193
    .line 194
    :cond_6
    if-gez v1, :cond_7

    .line 195
    .line 196
    invoke-virtual {v4}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_8

    .line 201
    .line 202
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    float-to-int v0, v0

    .line 209
    invoke-virtual {v4, v0}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_7
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_8

    .line 218
    .line 219
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 220
    .line 221
    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    float-to-int v0, v0

    .line 226
    invoke-virtual {v3, v0}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 227
    .line 228
    .line 229
    :cond_8
    :goto_2
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 230
    .line 231
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 235
    .line 236
    .line 237
    :cond_9
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 238
    .line 239
    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_a

    .line 244
    .line 245
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 246
    .line 247
    .line 248
    goto :goto_3

    .line 249
    :cond_a
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 250
    .line 251
    .line 252
    :goto_3
    return-void
.end method

.method public final computeVerticalScrollExtent()I
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeVerticalScrollExtent()I

    move-result v0

    return v0
.end method

.method public final computeVerticalScrollOffset()I
    .locals 2

    const/4 v0, 0x0

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeVerticalScrollOffset()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public final computeVerticalScrollRange()I
    .locals 4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v2

    iget v3, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v3

    sub-int v1, v2, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-gez v3, :cond_1

    sub-int/2addr v2, v3

    goto :goto_0

    :cond_1
    if-le v3, v0, :cond_2

    sub-int/2addr v3, v0

    add-int/2addr v2, v3

    :cond_2
    :goto_0
    return v2
.end method

.method public final d(Landroid/view/View;IIIII)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    invoke-virtual {p0, p5, p6, p1}, Landroidx/core/widget/NestedScrollView;->o(II[I)V

    return-void
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->j(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final dispatchNestedFling(FFZ)Z
    .locals 1

    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    invoke-virtual {v0, p1, p2, p3}, LDe;->a(FFZ)Z

    move-result p1

    return p1
.end method

.method public final dispatchNestedPreFling(FF)Z
    .locals 1

    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    invoke-virtual {v0, p1, p2}, LDe;->b(FF)Z

    move-result p1

    return p1
.end method

.method public final dispatchNestedPreScroll(II[I[I)Z
    .locals 6

    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Landroidx/core/widget/NestedScrollView;->i(III[I[I)Z

    move-result p1

    return p1
.end method

.method public final dispatchNestedScroll(IIII[I)Z
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 4
    .line 5
    move v1, p1

    .line 6
    move v2, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    move-object v5, p5

    .line 10
    invoke-virtual/range {v0 .. v7}, LDe;->d(IIII[II[I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    return p1
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez v2, :cond_3

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-eqz v7, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    add-int/2addr v8, v7

    .line 48
    sub-int/2addr v4, v8

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v7, v3

    .line 55
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    if-eqz v8, :cond_1

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    add-int/2addr v9, v8

    .line 70
    sub-int/2addr v5, v9

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    add-int/2addr v6, v8

    .line 76
    :cond_1
    int-to-float v7, v7

    .line 77
    int-to-float v6, v6

    .line 78
    invoke-virtual {p1, v7, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v4, v5}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 91
    .line 92
    .line 93
    :cond_2
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 94
    .line 95
    .line 96
    :cond_3
    iget-object v1, p0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_7

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr v0, v5

    .line 125
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_4

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    add-int/2addr v6, v3

    .line 140
    sub-int/2addr v4, v6

    .line 141
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    :cond_4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-eqz v6, :cond_5

    .line 150
    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    add-int/2addr v7, v6

    .line 160
    sub-int/2addr v5, v7

    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    sub-int/2addr v0, v6

    .line 166
    :cond_5
    sub-int/2addr v3, v4

    .line 167
    int-to-float v3, v3

    .line 168
    int-to-float v0, v0

    .line 169
    invoke-virtual {p1, v3, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 170
    .line 171
    .line 172
    int-to-float v0, v4

    .line 173
    const/4 v3, 0x0

    .line 174
    const/high16 v6, 0x43340000    # 180.0f

    .line 175
    .line 176
    invoke-virtual {p1, v6, v0, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v4, v5}, Landroid/widget/EdgeEffect;->setSize(II)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_6

    .line 187
    .line 188
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 189
    .line 190
    .line 191
    :cond_6
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 192
    .line 193
    .line 194
    :cond_7
    return-void
.end method

.method public final e(III[I)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Landroidx/core/widget/NestedScrollView;->i(III[I[I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f(Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    .line 1
    and-int/lit8 p1, p3, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final g(I)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p0, v0, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getMaxScrollAmount()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-virtual {p0, v1, v2, v5}, Landroidx/core/widget/NestedScrollView;->n(Landroid/view/View;II)Z

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-eqz v5, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->h(Landroid/graphics/Rect;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-virtual {p0, v2, v4, v3, v3}, Landroidx/core/widget/NestedScrollView;->t(IIIZ)I

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p1}, Landroid/view/View;->requestFocus(I)Z

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_1
    const/16 v1, 0x21

    .line 54
    .line 55
    const/16 v5, 0x82

    .line 56
    .line 57
    if-ne p1, v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-ge v1, v2, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    if-ne p1, v5, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-lez v1, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    iget v6, v6, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 93
    .line 94
    add-int/2addr v1, v6

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    add-int/2addr v7, v6

    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    sub-int/2addr v7, v6

    .line 109
    sub-int/2addr v1, v7

    .line 110
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    :cond_3
    :goto_0
    if-nez v2, :cond_4

    .line 115
    .line 116
    return v4

    .line 117
    :cond_4
    if-ne p1, v5, :cond_5

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    neg-int v2, v2

    .line 121
    :goto_1
    invoke-virtual {p0, v2, v4, v3, v3}, Landroidx/core/widget/NestedScrollView;->t(IIIZ)I

    .line 122
    .line 123
    .line 124
    :goto_2
    if-eqz v0, :cond_6

    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_6

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-virtual {p0, v0, v4, p1}, Landroidx/core/widget/NestedScrollView;->n(Landroid/view/View;II)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    xor-int/2addr p1, v3

    .line 141
    if-eqz p1, :cond_6

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDescendantFocusability()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    const/high16 v0, 0x20000

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 156
    .line 157
    .line 158
    :cond_6
    return v3
.end method

.method public getBottomFadingEdgeStrength()F
    .locals 5

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/view/View;->getVerticalFadingEdgeLength()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    sub-int/2addr v0, v1

    sub-int/2addr v0, v3

    if-ge v0, v2, :cond_1

    int-to-float v0, v0

    int-to-float v1, v2

    div-float/2addr v0, v1

    return v0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getMaxScrollAmount()I
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getNestedScrollAxes()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->z:LGe;

    .line 2
    .line 3
    iget v1, v0, LGe;->a:I

    .line 4
    .line 5
    iget v0, v0, LGe;->b:I

    .line 6
    .line 7
    or-int/2addr v0, v1

    .line 8
    return v0
.end method

.method public getScrollRange()I
    .locals 4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int/2addr v0, v3

    iget v2, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    :cond_0
    return v1
.end method

.method public getTopFadingEdgeStrength()F
    .locals 2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getVerticalFadingEdgeLength()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    if-ge v1, v0, :cond_1

    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    return v1

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getVerticalScrollFactorCompat()F
    .locals 5

    iget v0, p0, Landroidx/core/widget/NestedScrollView;->B:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x101004d

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Landroidx/core/widget/NestedScrollView;->B:F

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expected theme to define listPreferredItemHeight."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iget v0, p0, Landroidx/core/widget/NestedScrollView;->B:F

    return v0
.end method

.method public final h(Landroid/graphics/Rect;)I
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v2

    add-int v3, v2, v0

    invoke-virtual {p0}, Landroid/view/View;->getVerticalFadingEdgeLength()I

    move-result v4

    iget v5, p1, Landroid/graphics/Rect;->top:I

    if-lez v5, :cond_1

    add-int/2addr v2, v4

    :cond_1
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    iget v7, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int/2addr v8, v9

    iget v9, v6, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v8, v9

    if-ge v7, v8, :cond_2

    sub-int v4, v3, v4

    goto :goto_0

    :cond_2
    move v4, v3

    :goto_0
    iget v7, p1, Landroid/graphics/Rect;->bottom:I

    if-le v7, v4, :cond_4

    iget v8, p1, Landroid/graphics/Rect;->top:I

    if-le v8, v2, :cond_4

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-le v1, v0, :cond_3

    iget p1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p1, v2

    goto :goto_1

    :cond_3
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p1, v4

    :goto_1
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v0

    iget v1, v6, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    sub-int/2addr v0, v3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_3

    :cond_4
    iget v3, p1, Landroid/graphics/Rect;->top:I

    if-ge v3, v2, :cond_6

    if-ge v7, v4, :cond_6

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    if-le v3, v0, :cond_5

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, p1

    sub-int/2addr v1, v4

    goto :goto_2

    :cond_5
    iget p1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, p1

    sub-int/2addr v1, v2

    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result p1

    neg-int p1, p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    :cond_6
    :goto_3
    return v1
.end method

.method public final hasNestedScrollingParent()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, LDe;->e(I)Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :cond_0
    return v1
.end method

.method public final i(III[I[I)Z
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    iget-boolean v1, v0, LDe;->d:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_a

    .line 7
    .line 8
    invoke-virtual {v0, p3}, LDe;->e(I)Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    const/4 v3, 0x1

    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    if-eqz p5, :cond_a

    .line 23
    .line 24
    aput v2, p5, v2

    .line 25
    .line 26
    aput v2, p5, v3

    .line 27
    .line 28
    goto :goto_3

    .line 29
    :cond_2
    :goto_0
    iget-object v4, v0, LDe;->c:Landroid/view/View;

    .line 30
    .line 31
    if-eqz p5, :cond_3

    .line 32
    .line 33
    invoke-virtual {v4, p5}, Landroid/view/View;->getLocationInWindow([I)V

    .line 34
    .line 35
    .line 36
    aget v5, p5, v2

    .line 37
    .line 38
    aget v6, p5, v3

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_3
    move v5, v2

    .line 42
    move v6, v5

    .line 43
    :goto_1
    if-nez p4, :cond_5

    .line 44
    .line 45
    iget-object p4, v0, LDe;->e:[I

    .line 46
    .line 47
    if-nez p4, :cond_4

    .line 48
    .line 49
    const/4 p4, 0x2

    .line 50
    new-array p4, p4, [I

    .line 51
    .line 52
    iput-object p4, v0, LDe;->e:[I

    .line 53
    .line 54
    :cond_4
    iget-object p4, v0, LDe;->e:[I

    .line 55
    .line 56
    :cond_5
    aput v2, p4, v2

    .line 57
    .line 58
    aput v2, p4, v3

    .line 59
    .line 60
    instance-of v0, v1, LEe;

    .line 61
    .line 62
    if-eqz v0, :cond_6

    .line 63
    .line 64
    check-cast v1, LEe;

    .line 65
    .line 66
    invoke-interface {v1, p1, p2, p3, p4}, LEe;->e(III[I)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_6
    if-nez p3, :cond_7

    .line 71
    .line 72
    :try_start_0
    invoke-interface {v1, v4, p1, p2, p4}, Landroid/view/ViewParent;->onNestedPreScroll(Landroid/view/View;II[I)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :catch_0
    move-exception p1

    .line 77
    new-instance p2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string p3, "ViewParent "

    .line 80
    .line 81
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p3, " does not implement interface method onNestedPreScroll"

    .line 88
    .line 89
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const-string p3, "ViewParentCompat"

    .line 97
    .line 98
    invoke-static {p3, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    .line 100
    .line 101
    :cond_7
    :goto_2
    if-eqz p5, :cond_8

    .line 102
    .line 103
    invoke-virtual {v4, p5}, Landroid/view/View;->getLocationInWindow([I)V

    .line 104
    .line 105
    .line 106
    aget p1, p5, v2

    .line 107
    .line 108
    sub-int/2addr p1, v5

    .line 109
    aput p1, p5, v2

    .line 110
    .line 111
    aget p1, p5, v3

    .line 112
    .line 113
    sub-int/2addr p1, v6

    .line 114
    aput p1, p5, v3

    .line 115
    .line 116
    :cond_8
    aget p1, p4, v2

    .line 117
    .line 118
    if-nez p1, :cond_9

    .line 119
    .line 120
    aget p1, p4, v3

    .line 121
    .line 122
    if-eqz p1, :cond_a

    .line 123
    .line 124
    :cond_9
    move v2, v3

    .line 125
    :cond_a
    :goto_3
    return v2
.end method

.method public final isNestedScrollingEnabled()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    iget-boolean v0, v0, LDe;->d:Z

    .line 4
    .line 5
    return v0
.end method

.method public final j(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/16 v2, 0x82

    .line 12
    .line 13
    if-lez v0, :cond_a

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 30
    .line 31
    add-int/2addr v0, v4

    .line 32
    iget v3, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 33
    .line 34
    add-int/2addr v0, v3

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    sub-int/2addr v3, v4

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v3, v4

    .line 49
    if-le v0, v3, :cond_a

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_9

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/16 v3, 0x13

    .line 62
    .line 63
    const/16 v4, 0x21

    .line 64
    .line 65
    if-eq v0, v3, :cond_7

    .line 66
    .line 67
    const/16 v3, 0x14

    .line 68
    .line 69
    if-eq v0, v3, :cond_5

    .line 70
    .line 71
    const/16 v3, 0x3e

    .line 72
    .line 73
    if-eq v0, v3, :cond_4

    .line 74
    .line 75
    const/16 p1, 0x5c

    .line 76
    .line 77
    if-eq v0, p1, :cond_3

    .line 78
    .line 79
    const/16 p1, 0x5d

    .line 80
    .line 81
    if-eq v0, p1, :cond_2

    .line 82
    .line 83
    const/16 p1, 0x7a

    .line 84
    .line 85
    if-eq v0, p1, :cond_1

    .line 86
    .line 87
    const/16 p1, 0x7b

    .line 88
    .line 89
    if-eq v0, p1, :cond_0

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_0
    :goto_0
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->r(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_1
    invoke-virtual {p0, v4}, Landroidx/core/widget/NestedScrollView;->r(I)V

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_2
    :goto_1
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->l(I)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    goto :goto_3

    .line 105
    :cond_3
    :goto_2
    invoke-virtual {p0, v4}, Landroidx/core/widget/NestedScrollView;->l(I)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_3

    .line 110
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isShiftPressed()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_0

    .line 115
    .line 116
    move v2, v4

    .line 117
    goto :goto_0

    .line 118
    :cond_5
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_6
    invoke-virtual {p0, v2}, Landroidx/core/widget/NestedScrollView;->g(I)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_3

    .line 130
    :cond_7
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isAltPressed()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_8

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_8
    invoke-virtual {p0, v4}, Landroidx/core/widget/NestedScrollView;->g(I)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    :cond_9
    :goto_3
    return v1

    .line 142
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_c

    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    const/4 v0, 0x4

    .line 153
    if-eq p1, v0, :cond_c

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    if-ne p1, p0, :cond_b

    .line 160
    .line 161
    const/4 p1, 0x0

    .line 162
    :cond_b
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v0, p0, p1, v2}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_c

    .line 171
    .line 172
    if-eq p1, p0, :cond_c

    .line 173
    .line 174
    invoke-virtual {p1, v2}, Landroid/view/View;->requestFocus(I)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_c

    .line 179
    .line 180
    const/4 v1, 0x1

    .line 181
    :cond_c
    return v1
.end method

.method public final k(I)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/high16 v8, -0x80000000

    .line 18
    .line 19
    const v9, 0x7fffffff

    .line 20
    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v10, 0x0

    .line 26
    const/4 v11, 0x0

    .line 27
    move v5, p1

    .line 28
    invoke-virtual/range {v1 .. v11}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x2

    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, p1, v0}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Landroidx/core/widget/NestedScrollView;->x:I

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 43
    .line 44
    .line 45
    invoke-static {}, LH3;->c()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/widget/OverScroller;->getCurrVelocity()F

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-static {p0, p1}, LAe;->a(Landroid/view/View;F)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final l(I)Z
    .locals 5

    .line 1
    const/16 v0, 0x82

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    iget-object v4, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    iput v1, v4, Landroid/graphics/Rect;->top:I

    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    sub-int/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    add-int/2addr v1, v0

    iput v1, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v3

    iput v1, v4, Landroid/graphics/Rect;->top:I

    :cond_1
    iget v0, v4, Landroid/graphics/Rect;->top:I

    iget v1, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, p1, v0, v1}, Landroidx/core/widget/NestedScrollView;->s(III)Z

    move-result p1

    return p1
.end method

.method public final measureChild(Landroid/view/View;II)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    add-int/2addr v1, v0

    iget p3, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {p2, v1, p3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p2

    const/4 p3, 0x0

    invoke-static {p3, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final measureChildWithMargins(Landroid/view/View;IIII)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    check-cast p4, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    add-int/2addr v0, p5

    iget p5, p4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v0, p5

    iget p5, p4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v0, p5

    add-int/2addr v0, p3

    iget p3, p4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-static {p2, v0, p3}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p2

    iget p3, p4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget p4, p4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p3, p4

    const/4 p4, 0x0

    invoke-static {p3, p4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method public final n(Landroid/view/View;II)Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    if-lt p1, v1, :cond_0

    iget p1, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result p2

    add-int/2addr p2, p3

    if-gt p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final o(II[I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1}, Landroid/view/View;->scrollBy(II)V

    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    move-result v1

    sub-int/2addr v1, v0

    if-eqz p3, :cond_0

    const/4 v0, 0x1

    aget v2, p3, v0

    add-int/2addr v2, v1

    aput v2, p3, v0

    :cond_0
    sub-int/2addr p1, v1

    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    invoke-virtual {v0, v1, p1, p2, p3}, LDe;->c(III[I)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->k:Z

    return-void
.end method

.method public final onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    const/16 v5, 0x8

    .line 11
    .line 12
    if-ne v4, v5, :cond_31

    .line 13
    .line 14
    iget-boolean v4, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 15
    .line 16
    if-nez v4, :cond_31

    .line 17
    .line 18
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v5, 0x2

    .line 23
    and-int/2addr v4, v5

    .line 24
    if-ne v4, v5, :cond_0

    .line 25
    .line 26
    move v4, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v4, 0x0

    .line 29
    :goto_0
    const/4 v7, 0x0

    .line 30
    const/high16 v8, 0x400000

    .line 31
    .line 32
    const/16 v9, 0x1a

    .line 33
    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    const/16 v4, 0x9

    .line 37
    .line 38
    invoke-virtual {v1, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 39
    .line 40
    .line 41
    move-result v10

    .line 42
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    .line 43
    .line 44
    .line 45
    move-result v11

    .line 46
    float-to-int v11, v11

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    and-int/2addr v4, v8

    .line 53
    if-ne v4, v8, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1, v9}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    div-int/lit8 v11, v4, 0x2

    .line 64
    .line 65
    move v4, v9

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    move v10, v7

    .line 68
    const/4 v4, 0x0

    .line 69
    const/4 v11, 0x0

    .line 70
    :goto_1
    cmpl-float v12, v10, v7

    .line 71
    .line 72
    if-eqz v12, :cond_31

    .line 73
    .line 74
    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getVerticalScrollFactorCompat()F

    .line 75
    .line 76
    .line 77
    move-result v12

    .line 78
    mul-float/2addr v12, v10

    .line 79
    float-to-int v10, v12

    .line 80
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    const/16 v13, 0x2002

    .line 85
    .line 86
    and-int/2addr v12, v13

    .line 87
    if-ne v12, v13, :cond_3

    .line 88
    .line 89
    move v12, v3

    .line 90
    goto :goto_2

    .line 91
    :cond_3
    const/4 v12, 0x0

    .line 92
    :goto_2
    neg-int v10, v10

    .line 93
    invoke-virtual {v0, v10, v11, v3, v12}, Landroidx/core/widget/NestedScrollView;->t(IIIZ)I

    .line 94
    .line 95
    .line 96
    if-eqz v4, :cond_30

    .line 97
    .line 98
    iget-object v10, v0, Landroidx/core/widget/NestedScrollView;->C:LM6;

    .line 99
    .line 100
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    .line 108
    .line 109
    .line 110
    move-result v12

    .line 111
    iget v13, v10, LM6;->h:I

    .line 112
    .line 113
    const/16 v15, 0x22

    .line 114
    .line 115
    iget-object v5, v10, LM6;->j:[I

    .line 116
    .line 117
    if-ne v13, v11, :cond_5

    .line 118
    .line 119
    iget v13, v10, LM6;->i:I

    .line 120
    .line 121
    if-ne v13, v12, :cond_5

    .line 122
    .line 123
    iget v13, v10, LM6;->g:I

    .line 124
    .line 125
    if-eq v13, v4, :cond_4

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_4
    const/4 v2, 0x0

    .line 129
    const/4 v6, 0x0

    .line 130
    goto/16 :goto_d

    .line 131
    .line 132
    :cond_5
    :goto_3
    iget-object v13, v10, LM6;->c:LS3;

    .line 133
    .line 134
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    iget-object v13, v10, LM6;->a:Landroid/content/Context;

    .line 138
    .line 139
    invoke-static {v13}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 148
    .line 149
    .line 150
    move-result v14

    .line 151
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 152
    .line 153
    const-string v6, "android"

    .line 154
    .line 155
    const-string v9, "dimen"

    .line 156
    .line 157
    const/4 v8, -0x1

    .line 158
    if-lt v3, v15, :cond_7

    .line 159
    .line 160
    sget v21, LMj;->a:I

    .line 161
    .line 162
    invoke-static {v2, v7, v4, v14}, LI;->f(Landroid/view/ViewConfiguration;III)I

    .line 163
    .line 164
    .line 165
    move-result v7

    .line 166
    :cond_6
    :goto_4
    const/4 v14, 0x0

    .line 167
    goto :goto_7

    .line 168
    :cond_7
    sget v21, LMj;->a:I

    .line 169
    .line 170
    invoke-static {v7}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    if-eqz v7, :cond_a

    .line 175
    .line 176
    invoke-virtual {v7, v4, v14}, Landroid/view/InputDevice;->getMotionRange(II)Landroid/view/InputDevice$MotionRange;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    if-eqz v7, :cond_a

    .line 181
    .line 182
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    const/high16 v15, 0x400000

    .line 187
    .line 188
    if-ne v14, v15, :cond_8

    .line 189
    .line 190
    const/16 v14, 0x1a

    .line 191
    .line 192
    if-ne v4, v14, :cond_8

    .line 193
    .line 194
    const-string v14, "config_viewMinRotaryEncoderFlingVelocity"

    .line 195
    .line 196
    invoke-virtual {v7, v14, v9, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v14

    .line 200
    goto :goto_5

    .line 201
    :cond_8
    move v14, v8

    .line 202
    :goto_5
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    if-eq v14, v8, :cond_9

    .line 206
    .line 207
    if-eqz v14, :cond_a

    .line 208
    .line 209
    invoke-virtual {v7, v14}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    if-gez v7, :cond_6

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_9
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 217
    .line 218
    .line 219
    move-result v7

    .line 220
    goto :goto_4

    .line 221
    :cond_a
    :goto_6
    const v7, 0x7fffffff

    .line 222
    .line 223
    .line 224
    goto :goto_4

    .line 225
    :goto_7
    aput v7, v5, v14

    .line 226
    .line 227
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    .line 228
    .line 229
    .line 230
    move-result v7

    .line 231
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 232
    .line 233
    .line 234
    move-result v14

    .line 235
    const/16 v15, 0x22

    .line 236
    .line 237
    if-lt v3, v15, :cond_b

    .line 238
    .line 239
    invoke-static {v2, v7, v4, v14}, LI;->e(Landroid/view/ViewConfiguration;III)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    :goto_8
    const/4 v3, 0x1

    .line 244
    goto :goto_c

    .line 245
    :cond_b
    invoke-static {v7}, Landroid/view/InputDevice;->getDevice(I)Landroid/view/InputDevice;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    if-eqz v3, :cond_c

    .line 250
    .line 251
    invoke-virtual {v3, v4, v14}, Landroid/view/InputDevice;->getMotionRange(II)Landroid/view/InputDevice$MotionRange;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    if-eqz v3, :cond_c

    .line 256
    .line 257
    const/4 v3, 0x1

    .line 258
    goto :goto_9

    .line 259
    :cond_c
    const/4 v3, 0x0

    .line 260
    :goto_9
    const/high16 v7, -0x80000000

    .line 261
    .line 262
    if-nez v3, :cond_e

    .line 263
    .line 264
    :cond_d
    :goto_a
    move v2, v7

    .line 265
    goto :goto_8

    .line 266
    :cond_e
    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    const/high16 v13, 0x400000

    .line 271
    .line 272
    if-ne v14, v13, :cond_f

    .line 273
    .line 274
    const/16 v13, 0x1a

    .line 275
    .line 276
    if-ne v4, v13, :cond_f

    .line 277
    .line 278
    const-string v13, "config_viewMaxRotaryEncoderFlingVelocity"

    .line 279
    .line 280
    invoke-virtual {v3, v13, v9, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    .line 282
    .line 283
    move-result v6

    .line 284
    goto :goto_b

    .line 285
    :cond_f
    move v6, v8

    .line 286
    :goto_b
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    if-eq v6, v8, :cond_11

    .line 290
    .line 291
    if-eqz v6, :cond_d

    .line 292
    .line 293
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 294
    .line 295
    .line 296
    move-result v2

    .line 297
    if-gez v2, :cond_10

    .line 298
    .line 299
    goto :goto_a

    .line 300
    :cond_10
    move v7, v2

    .line 301
    goto :goto_a

    .line 302
    :cond_11
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    goto :goto_8

    .line 307
    :goto_c
    aput v2, v5, v3

    .line 308
    .line 309
    iput v11, v10, LM6;->h:I

    .line 310
    .line 311
    iput v12, v10, LM6;->i:I

    .line 312
    .line 313
    iput v4, v10, LM6;->g:I

    .line 314
    .line 315
    const/4 v2, 0x0

    .line 316
    const/4 v6, 0x1

    .line 317
    :goto_d
    aget v3, v5, v2

    .line 318
    .line 319
    const v2, 0x7fffffff

    .line 320
    .line 321
    .line 322
    if-ne v3, v2, :cond_12

    .line 323
    .line 324
    iget-object v1, v10, LM6;->e:Landroid/view/VelocityTracker;

    .line 325
    .line 326
    if-eqz v1, :cond_2f

    .line 327
    .line 328
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    .line 329
    .line 330
    .line 331
    const/4 v1, 0x0

    .line 332
    iput-object v1, v10, LM6;->e:Landroid/view/VelocityTracker;

    .line 333
    .line 334
    goto/16 :goto_19

    .line 335
    .line 336
    :cond_12
    iget-object v2, v10, LM6;->e:Landroid/view/VelocityTracker;

    .line 337
    .line 338
    if-nez v2, :cond_13

    .line 339
    .line 340
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    iput-object v2, v10, LM6;->e:Landroid/view/VelocityTracker;

    .line 345
    .line 346
    :cond_13
    iget-object v2, v10, LM6;->e:Landroid/view/VelocityTracker;

    .line 347
    .line 348
    iget-object v3, v10, LM6;->d:LS3;

    .line 349
    .line 350
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 351
    .line 352
    .line 353
    sget-object v3, Luj;->a:Ljava/util/Map;

    .line 354
    .line 355
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 356
    .line 357
    .line 358
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 359
    .line 360
    const/16 v7, 0x22

    .line 361
    .line 362
    if-lt v3, v7, :cond_14

    .line 363
    .line 364
    goto :goto_e

    .line 365
    :cond_14
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    const/high16 v7, 0x400000

    .line 370
    .line 371
    if-ne v3, v7, :cond_18

    .line 372
    .line 373
    sget-object v3, Luj;->a:Ljava/util/Map;

    .line 374
    .line 375
    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    move-result v7

    .line 379
    if-nez v7, :cond_15

    .line 380
    .line 381
    new-instance v7, Lvj;

    .line 382
    .line 383
    invoke-direct {v7}, Lvj;-><init>()V

    .line 384
    .line 385
    .line 386
    invoke-interface {v3, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    :cond_15
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    check-cast v3, Lvj;

    .line 394
    .line 395
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 396
    .line 397
    .line 398
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 399
    .line 400
    .line 401
    move-result-wide v7

    .line 402
    iget v9, v3, Lvj;->d:I

    .line 403
    .line 404
    iget-object v11, v3, Lvj;->b:[J

    .line 405
    .line 406
    if-eqz v9, :cond_16

    .line 407
    .line 408
    iget v9, v3, Lvj;->e:I

    .line 409
    .line 410
    aget-wide v12, v11, v9

    .line 411
    .line 412
    sub-long v12, v7, v12

    .line 413
    .line 414
    const-wide/16 v14, 0x28

    .line 415
    .line 416
    cmp-long v9, v12, v14

    .line 417
    .line 418
    if-lez v9, :cond_16

    .line 419
    .line 420
    const/4 v9, 0x0

    .line 421
    iput v9, v3, Lvj;->d:I

    .line 422
    .line 423
    const/4 v9, 0x0

    .line 424
    iput v9, v3, Lvj;->c:F

    .line 425
    .line 426
    :cond_16
    iget v9, v3, Lvj;->e:I

    .line 427
    .line 428
    const/4 v12, 0x1

    .line 429
    add-int/2addr v9, v12

    .line 430
    const/16 v13, 0x14

    .line 431
    .line 432
    rem-int/2addr v9, v13

    .line 433
    iput v9, v3, Lvj;->e:I

    .line 434
    .line 435
    iget v14, v3, Lvj;->d:I

    .line 436
    .line 437
    if-eq v14, v13, :cond_17

    .line 438
    .line 439
    add-int/2addr v14, v12

    .line 440
    iput v14, v3, Lvj;->d:I

    .line 441
    .line 442
    :cond_17
    const/16 v12, 0x1a

    .line 443
    .line 444
    invoke-virtual {v1, v12}, Landroid/view/MotionEvent;->getAxisValue(I)F

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    iget-object v12, v3, Lvj;->a:[F

    .line 449
    .line 450
    aput v1, v12, v9

    .line 451
    .line 452
    iget v1, v3, Lvj;->e:I

    .line 453
    .line 454
    aput-wide v7, v11, v1

    .line 455
    .line 456
    :cond_18
    :goto_e
    const/16 v1, 0x3e8

    .line 457
    .line 458
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 459
    .line 460
    .line 461
    invoke-virtual {v2, v1, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 462
    .line 463
    .line 464
    sget-object v7, Luj;->a:Ljava/util/Map;

    .line 465
    .line 466
    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v7

    .line 470
    check-cast v7, Lvj;

    .line 471
    .line 472
    if-eqz v7, :cond_24

    .line 473
    .line 474
    iget v8, v7, Lvj;->d:I

    .line 475
    .line 476
    const/4 v9, 0x2

    .line 477
    if-ge v8, v9, :cond_19

    .line 478
    .line 479
    :goto_f
    move-object/from16 v16, v2

    .line 480
    .line 481
    move v2, v1

    .line 482
    const/4 v1, 0x0

    .line 483
    goto/16 :goto_13

    .line 484
    .line 485
    :cond_19
    iget v9, v7, Lvj;->e:I

    .line 486
    .line 487
    const/16 v11, 0x14

    .line 488
    .line 489
    add-int/lit8 v12, v9, 0x14

    .line 490
    .line 491
    const/4 v13, 0x1

    .line 492
    sub-int/2addr v8, v13

    .line 493
    sub-int/2addr v12, v8

    .line 494
    rem-int/2addr v12, v11

    .line 495
    iget-object v8, v7, Lvj;->b:[J

    .line 496
    .line 497
    aget-wide v13, v8, v9

    .line 498
    .line 499
    :goto_10
    aget-wide v22, v8, v12

    .line 500
    .line 501
    sub-long v24, v13, v22

    .line 502
    .line 503
    const-wide/16 v26, 0x64

    .line 504
    .line 505
    cmp-long v9, v24, v26

    .line 506
    .line 507
    if-lez v9, :cond_1a

    .line 508
    .line 509
    iget v9, v7, Lvj;->d:I

    .line 510
    .line 511
    const/4 v11, 0x1

    .line 512
    sub-int/2addr v9, v11

    .line 513
    iput v9, v7, Lvj;->d:I

    .line 514
    .line 515
    add-int/2addr v12, v11

    .line 516
    const/16 v9, 0x14

    .line 517
    .line 518
    rem-int/2addr v12, v9

    .line 519
    goto :goto_10

    .line 520
    :cond_1a
    const/16 v9, 0x14

    .line 521
    .line 522
    const/4 v11, 0x1

    .line 523
    iget v13, v7, Lvj;->d:I

    .line 524
    .line 525
    const/4 v14, 0x2

    .line 526
    if-ge v13, v14, :cond_1b

    .line 527
    .line 528
    goto :goto_f

    .line 529
    :cond_1b
    iget-object v15, v7, Lvj;->a:[F

    .line 530
    .line 531
    if-ne v13, v14, :cond_1d

    .line 532
    .line 533
    add-int/2addr v12, v11

    .line 534
    rem-int/2addr v12, v9

    .line 535
    aget-wide v13, v8, v12

    .line 536
    .line 537
    cmp-long v8, v22, v13

    .line 538
    .line 539
    if-nez v8, :cond_1c

    .line 540
    .line 541
    goto :goto_f

    .line 542
    :cond_1c
    aget v8, v15, v12

    .line 543
    .line 544
    sub-long v13, v13, v22

    .line 545
    .line 546
    long-to-float v9, v13

    .line 547
    div-float/2addr v8, v9

    .line 548
    move-object/from16 v16, v2

    .line 549
    .line 550
    move v2, v1

    .line 551
    move v1, v8

    .line 552
    goto/16 :goto_13

    .line 553
    .line 554
    :cond_1d
    const/4 v9, 0x0

    .line 555
    const/4 v11, 0x0

    .line 556
    const/4 v13, 0x0

    .line 557
    :goto_11
    iget v14, v7, Lvj;->d:I

    .line 558
    .line 559
    const/16 v16, 0x1

    .line 560
    .line 561
    add-int/lit8 v14, v14, -0x1

    .line 562
    .line 563
    const/high16 v18, 0x40000000    # 2.0f

    .line 564
    .line 565
    const/high16 v20, 0x3f800000    # 1.0f

    .line 566
    .line 567
    const/high16 v22, -0x40800000    # -1.0f

    .line 568
    .line 569
    if-ge v11, v14, :cond_21

    .line 570
    .line 571
    add-int v14, v11, v12

    .line 572
    .line 573
    const/16 v17, 0x14

    .line 574
    .line 575
    rem-int/lit8 v19, v14, 0x14

    .line 576
    .line 577
    aget-wide v23, v8, v19

    .line 578
    .line 579
    add-int/lit8 v14, v14, 0x1

    .line 580
    .line 581
    rem-int/lit8 v14, v14, 0x14

    .line 582
    .line 583
    aget-wide v25, v8, v14

    .line 584
    .line 585
    cmp-long v19, v25, v23

    .line 586
    .line 587
    if-nez v19, :cond_1e

    .line 588
    .line 589
    move/from16 v28, v16

    .line 590
    .line 591
    move-object/from16 v16, v2

    .line 592
    .line 593
    move/from16 v2, v28

    .line 594
    .line 595
    goto :goto_12

    .line 596
    :cond_1e
    add-int/lit8 v13, v13, 0x1

    .line 597
    .line 598
    const/16 v16, 0x0

    .line 599
    .line 600
    cmpg-float v25, v9, v16

    .line 601
    .line 602
    if-gez v25, :cond_1f

    .line 603
    .line 604
    move/from16 v20, v22

    .line 605
    .line 606
    :cond_1f
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 607
    .line 608
    .line 609
    move-result v16

    .line 610
    mul-float v3, v16, v18

    .line 611
    .line 612
    move-object/from16 v16, v2

    .line 613
    .line 614
    float-to-double v1, v3

    .line 615
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 616
    .line 617
    .line 618
    move-result-wide v1

    .line 619
    double-to-float v1, v1

    .line 620
    mul-float v20, v20, v1

    .line 621
    .line 622
    aget v1, v15, v14

    .line 623
    .line 624
    aget-wide v2, v8, v14

    .line 625
    .line 626
    sub-long v2, v2, v23

    .line 627
    .line 628
    long-to-float v2, v2

    .line 629
    div-float/2addr v1, v2

    .line 630
    sub-float v2, v1, v20

    .line 631
    .line 632
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 633
    .line 634
    .line 635
    move-result v1

    .line 636
    mul-float/2addr v1, v2

    .line 637
    add-float/2addr v1, v9

    .line 638
    const/4 v2, 0x1

    .line 639
    if-ne v13, v2, :cond_20

    .line 640
    .line 641
    const/high16 v3, 0x3f000000    # 0.5f

    .line 642
    .line 643
    mul-float/2addr v1, v3

    .line 644
    :cond_20
    move v9, v1

    .line 645
    :goto_12
    add-int/2addr v11, v2

    .line 646
    move-object/from16 v2, v16

    .line 647
    .line 648
    const/16 v1, 0x3e8

    .line 649
    .line 650
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 651
    .line 652
    .line 653
    goto :goto_11

    .line 654
    :cond_21
    move-object/from16 v16, v2

    .line 655
    .line 656
    const/4 v1, 0x0

    .line 657
    cmpg-float v2, v9, v1

    .line 658
    .line 659
    if-gez v2, :cond_22

    .line 660
    .line 661
    move/from16 v20, v22

    .line 662
    .line 663
    :cond_22
    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    .line 664
    .line 665
    .line 666
    move-result v1

    .line 667
    mul-float v1, v1, v18

    .line 668
    .line 669
    float-to-double v1, v1

    .line 670
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 671
    .line 672
    .line 673
    move-result-wide v1

    .line 674
    double-to-float v1, v1

    .line 675
    mul-float v1, v1, v20

    .line 676
    .line 677
    const/16 v2, 0x3e8

    .line 678
    .line 679
    :goto_13
    int-to-float v2, v2

    .line 680
    mul-float/2addr v1, v2

    .line 681
    iput v1, v7, Lvj;->c:F

    .line 682
    .line 683
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 684
    .line 685
    .line 686
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 687
    .line 688
    .line 689
    move-result v3

    .line 690
    neg-float v3, v3

    .line 691
    cmpg-float v1, v1, v3

    .line 692
    .line 693
    if-gez v1, :cond_23

    .line 694
    .line 695
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 696
    .line 697
    .line 698
    move-result v1

    .line 699
    neg-float v1, v1

    .line 700
    :goto_14
    iput v1, v7, Lvj;->c:F

    .line 701
    .line 702
    goto :goto_15

    .line 703
    :cond_23
    iget v1, v7, Lvj;->c:F

    .line 704
    .line 705
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 706
    .line 707
    .line 708
    move-result v3

    .line 709
    cmpl-float v1, v1, v3

    .line 710
    .line 711
    if-lez v1, :cond_25

    .line 712
    .line 713
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    goto :goto_14

    .line 718
    :cond_24
    move-object/from16 v16, v2

    .line 719
    .line 720
    :cond_25
    :goto_15
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 721
    .line 722
    const/16 v2, 0x22

    .line 723
    .line 724
    if-lt v1, v2, :cond_26

    .line 725
    .line 726
    move-object/from16 v1, v16

    .line 727
    .line 728
    invoke-static {v1, v4}, LI;->b(Landroid/view/VelocityTracker;I)F

    .line 729
    .line 730
    .line 731
    move-result v1

    .line 732
    goto :goto_17

    .line 733
    :cond_26
    move-object/from16 v1, v16

    .line 734
    .line 735
    if-nez v4, :cond_27

    .line 736
    .line 737
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 738
    .line 739
    .line 740
    move-result v1

    .line 741
    goto :goto_17

    .line 742
    :cond_27
    const/4 v2, 0x1

    .line 743
    if-ne v4, v2, :cond_28

    .line 744
    .line 745
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 746
    .line 747
    .line 748
    move-result v1

    .line 749
    goto :goto_17

    .line 750
    :cond_28
    sget-object v2, Luj;->a:Ljava/util/Map;

    .line 751
    .line 752
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    move-result-object v1

    .line 756
    check-cast v1, Lvj;

    .line 757
    .line 758
    if-eqz v1, :cond_2a

    .line 759
    .line 760
    const/16 v2, 0x1a

    .line 761
    .line 762
    if-eq v4, v2, :cond_29

    .line 763
    .line 764
    goto :goto_16

    .line 765
    :cond_29
    iget v1, v1, Lvj;->c:F

    .line 766
    .line 767
    goto :goto_17

    .line 768
    :cond_2a
    :goto_16
    const/4 v1, 0x0

    .line 769
    :goto_17
    iget-object v2, v10, LM6;->b:Li0;

    .line 770
    .line 771
    iget-object v3, v2, Li0;->d:Ljava/lang/Object;

    .line 772
    .line 773
    check-cast v3, Landroidx/core/widget/NestedScrollView;

    .line 774
    .line 775
    invoke-virtual {v3}, Landroidx/core/widget/NestedScrollView;->getVerticalScrollFactorCompat()F

    .line 776
    .line 777
    .line 778
    move-result v3

    .line 779
    neg-float v3, v3

    .line 780
    mul-float/2addr v1, v3

    .line 781
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    .line 782
    .line 783
    .line 784
    move-result v3

    .line 785
    iget-object v2, v2, Li0;->d:Ljava/lang/Object;

    .line 786
    .line 787
    check-cast v2, Landroidx/core/widget/NestedScrollView;

    .line 788
    .line 789
    if-nez v6, :cond_2b

    .line 790
    .line 791
    iget v4, v10, LM6;->f:F

    .line 792
    .line 793
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    .line 794
    .line 795
    .line 796
    move-result v4

    .line 797
    cmpl-float v4, v3, v4

    .line 798
    .line 799
    if-eqz v4, :cond_2c

    .line 800
    .line 801
    const/4 v4, 0x0

    .line 802
    cmpl-float v3, v3, v4

    .line 803
    .line 804
    if-eqz v3, :cond_2c

    .line 805
    .line 806
    :cond_2b
    iget-object v3, v2, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 807
    .line 808
    invoke-virtual {v3}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 809
    .line 810
    .line 811
    :cond_2c
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 812
    .line 813
    .line 814
    move-result v3

    .line 815
    const/4 v4, 0x0

    .line 816
    aget v4, v5, v4

    .line 817
    .line 818
    int-to-float v4, v4

    .line 819
    cmpg-float v3, v3, v4

    .line 820
    .line 821
    if-gez v3, :cond_2d

    .line 822
    .line 823
    goto :goto_19

    .line 824
    :cond_2d
    const/4 v3, 0x1

    .line 825
    aget v4, v5, v3

    .line 826
    .line 827
    neg-int v3, v4

    .line 828
    int-to-float v3, v3

    .line 829
    int-to-float v4, v4

    .line 830
    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    .line 831
    .line 832
    .line 833
    move-result v1

    .line 834
    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    .line 835
    .line 836
    .line 837
    move-result v1

    .line 838
    const/4 v3, 0x0

    .line 839
    cmpl-float v4, v1, v3

    .line 840
    .line 841
    if-nez v4, :cond_2e

    .line 842
    .line 843
    move v7, v3

    .line 844
    goto :goto_18

    .line 845
    :cond_2e
    iget-object v3, v2, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 846
    .line 847
    invoke-virtual {v3}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 848
    .line 849
    .line 850
    float-to-int v3, v1

    .line 851
    invoke-virtual {v2, v3}, Landroidx/core/widget/NestedScrollView;->k(I)V

    .line 852
    .line 853
    .line 854
    move v7, v1

    .line 855
    :goto_18
    iput v7, v10, LM6;->f:F

    .line 856
    .line 857
    :cond_2f
    :goto_19
    const/4 v1, 0x1

    .line 858
    goto :goto_1a

    .line 859
    :cond_30
    move v1, v3

    .line 860
    :goto_1a
    return v1

    .line 861
    :cond_31
    const/4 v1, 0x0

    .line 862
    return v1
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x2

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    iget-boolean v3, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    and-int/lit16 v0, v0, 0xff

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    if-eqz v0, :cond_9

    .line 19
    .line 20
    const/4 v5, -0x1

    .line 21
    if-eq v0, v1, :cond_6

    .line 22
    .line 23
    if-eq v0, v2, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    if-eq v0, v1, :cond_6

    .line 27
    .line 28
    const/4 v1, 0x6

    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->p(Landroid/view/MotionEvent;)V

    .line 34
    .line 35
    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_2
    iget v0, p0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 39
    .line 40
    if-ne v0, v5, :cond_3

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-ne v3, v5, :cond_4

    .line 49
    .line 50
    new-instance p1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "Invalid pointerId="

    .line 53
    .line 54
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, " in onInterceptTouchEvent"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v0, "NestedScrollView"

    .line 70
    .line 71
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    goto/16 :goto_3

    .line 75
    .line 76
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    float-to-int v0, v0

    .line 81
    iget v3, p0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 82
    .line 83
    sub-int v3, v0, v3

    .line 84
    .line 85
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    iget v5, p0, Landroidx/core/widget/NestedScrollView;->q:I

    .line 90
    .line 91
    if-le v3, v5, :cond_10

    .line 92
    .line 93
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getNestedScrollAxes()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    and-int/2addr v2, v3

    .line 98
    if-nez v2, :cond_10

    .line 99
    .line 100
    iput-boolean v1, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 101
    .line 102
    iput v0, p0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 103
    .line 104
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 105
    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 113
    .line 114
    :cond_5
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 117
    .line 118
    .line 119
    iput v4, p0, Landroidx/core/widget/NestedScrollView;->w:I

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    if-eqz p1, :cond_10

    .line 126
    .line 127
    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_3

    .line 131
    .line 132
    :cond_6
    iput-boolean v4, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 133
    .line 134
    iput v5, p0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 135
    .line 136
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 137
    .line 138
    if-eqz p1, :cond_7

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 141
    .line 142
    .line 143
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 144
    .line 145
    :cond_7
    iget-object v5, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 156
    .line 157
    .line 158
    move-result v11

    .line 159
    const/4 v8, 0x0

    .line 160
    const/4 v9, 0x0

    .line 161
    const/4 v10, 0x0

    .line 162
    invoke-virtual/range {v5 .. v11}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_8

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 169
    .line 170
    .line 171
    :cond_8
    invoke-virtual {p0, v4}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 172
    .line 173
    .line 174
    goto/16 :goto_3

    .line 175
    .line 176
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    float-to-int v0, v0

    .line 181
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    float-to-int v5, v5

    .line 186
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 187
    .line 188
    .line 189
    move-result v6

    .line 190
    if-lez v6, :cond_d

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 193
    .line 194
    .line 195
    move-result v6

    .line 196
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v7

    .line 200
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    sub-int/2addr v8, v6

    .line 205
    if-lt v0, v8, :cond_d

    .line 206
    .line 207
    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    .line 208
    .line 209
    .line 210
    move-result v8

    .line 211
    sub-int/2addr v8, v6

    .line 212
    if-ge v0, v8, :cond_d

    .line 213
    .line 214
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    if-lt v5, v6, :cond_d

    .line 219
    .line 220
    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    if-ge v5, v6, :cond_d

    .line 225
    .line 226
    iput v0, p0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 227
    .line 228
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    iput v0, p0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 233
    .line 234
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 235
    .line 236
    if-nez v0, :cond_a

    .line 237
    .line 238
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_a
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 246
    .line 247
    .line 248
    :goto_0
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 249
    .line 250
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 254
    .line 255
    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->x(Landroid/view/MotionEvent;)Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    if-nez p1, :cond_c

    .line 263
    .line 264
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 265
    .line 266
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-nez p1, :cond_b

    .line 271
    .line 272
    goto :goto_1

    .line 273
    :cond_b
    move v1, v4

    .line 274
    :cond_c
    :goto_1
    iput-boolean v1, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 275
    .line 276
    invoke-virtual {p0, v2, v4}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 277
    .line 278
    .line 279
    goto :goto_3

    .line 280
    :cond_d
    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->x(Landroid/view/MotionEvent;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-nez p1, :cond_f

    .line 285
    .line 286
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/widget/OverScroller;->isFinished()Z

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    if-nez p1, :cond_e

    .line 293
    .line 294
    goto :goto_2

    .line 295
    :cond_e
    move v1, v4

    .line 296
    :cond_f
    :goto_2
    iput-boolean v1, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 297
    .line 298
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 299
    .line 300
    if-eqz p1, :cond_10

    .line 301
    .line 302
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 303
    .line 304
    .line 305
    iput-object v3, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 306
    .line 307
    :cond_10
    :goto_3
    iget-boolean p1, p0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 308
    .line 309
    return p1
.end method

.method public final onLayout(ZIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Landroidx/core/widget/NestedScrollView;->j:Z

    .line 6
    .line 7
    iget-object p2, p0, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/View;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-static {p2, p0}, Landroidx/core/widget/NestedScrollView;->m(Landroid/view/View;Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget-object p2, p0, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/View;

    .line 18
    .line 19
    iget-object p4, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-virtual {p2, p4}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2, p4}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p4}, Landroidx/core/widget/NestedScrollView;->h(Landroid/graphics/Rect;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->scrollBy(II)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p2, 0x0

    .line 37
    iput-object p2, p0, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/View;

    .line 38
    .line 39
    iget-boolean p4, p0, Landroidx/core/widget/NestedScrollView;->k:Z

    .line 40
    .line 41
    if-nez p4, :cond_6

    .line 42
    .line 43
    iget-object p4, p0, Landroidx/core/widget/NestedScrollView;->y:LCe;

    .line 44
    .line 45
    if-eqz p4, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->y:LCe;

    .line 52
    .line 53
    iget v0, v0, LCe;->a:I

    .line 54
    .line 55
    invoke-virtual {p0, p4, v0}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    .line 56
    .line 57
    .line 58
    iput-object p2, p0, Landroidx/core/widget/NestedScrollView;->y:LCe;

    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-lez p2, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    check-cast p4, Landroid/widget/FrameLayout$LayoutParams;

    .line 75
    .line 76
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    iget v0, p4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 81
    .line 82
    add-int/2addr p2, v0

    .line 83
    iget p4, p4, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 84
    .line 85
    add-int/2addr p2, p4

    .line 86
    goto :goto_0

    .line 87
    :cond_2
    move p2, p1

    .line 88
    :goto_0
    sub-int/2addr p5, p3

    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    sub-int/2addr p5, p3

    .line 94
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    sub-int/2addr p5, p3

    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    if-ge p5, p2, :cond_5

    .line 104
    .line 105
    if-gez p3, :cond_3

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    add-int p1, p5, p3

    .line 109
    .line 110
    if-le p1, p2, :cond_4

    .line 111
    .line 112
    sub-int p1, p2, p5

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    move p1, p3

    .line 116
    :cond_5
    :goto_1
    if-eq p1, p3, :cond_6

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    invoke-virtual {p0, p2, p1}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    .line 123
    .line 124
    .line 125
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    invoke-virtual {p0, p1, p2}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    .line 134
    .line 135
    .line 136
    const/4 p1, 0x1

    .line 137
    iput-boolean p1, p0, Landroidx/core/widget/NestedScrollView;->k:Z

    .line 138
    .line 139
    return-void
.end method

.method public final onMeasure(II)V
    .locals 4

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    iget-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->o:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    if-nez p2, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-lez p2, :cond_2

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    sub-int/2addr v2, v3

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    add-int/2addr v3, v1

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    add-int/2addr v3, v1

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    add-int/2addr v3, v1

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    invoke-static {p1, v3, v0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {v2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p2, p1, v0}, Landroid/view/View;->measure(II)V

    :cond_2
    return-void
.end method

.method public final onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    if-nez p4, :cond_0

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p3, p2}, Landroidx/core/widget/NestedScrollView;->dispatchNestedFling(FFZ)Z

    float-to-int p1, p3

    invoke-virtual {p0, p1}, Landroidx/core/widget/NestedScrollView;->k(I)V

    return p2

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    invoke-virtual {p1, p2, p3}, LDe;->b(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    return p1
.end method

.method public final onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v3, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p2

    .line 5
    move v2, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Landroidx/core/widget/NestedScrollView;->i(III[I[I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onNestedScroll(Landroid/view/View;IIII)V
    .locals 0

    const/4 p1, 0x0

    const/4 p2, 0x0

    invoke-virtual {p0, p5, p1, p2}, Landroidx/core/widget/NestedScrollView;->o(II[I)V

    return-void
.end method

.method public final onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/core/widget/NestedScrollView;->a(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public final onOverScrolled(IIZZ)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->scrollTo(II)V

    return-void
.end method

.method public final onRequestFocusInDescendants(ILandroid/graphics/Rect;)Z
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/16 p1, 0x82

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-ne p1, v1, :cond_1

    .line 9
    .line 10
    const/16 p1, 0x21

    .line 11
    .line 12
    :cond_1
    :goto_0
    invoke-static {}, Landroid/view/FocusFinder;->getInstance()Landroid/view/FocusFinder;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez p2, :cond_2

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, p0, v2, p1}, Landroid/view/FocusFinder;->findNextFocus(Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    invoke-virtual {v0, p0, p2, p1}, Landroid/view/FocusFinder;->findNextFocusFromRect(Landroid/view/ViewGroup;Landroid/graphics/Rect;I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_1
    const/4 v2, 0x0

    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    return v2

    .line 32
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {p0, v0, v2, v3}, Landroidx/core/widget/NestedScrollView;->n(Landroid/view/View;II)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    xor-int/2addr v1, v3

    .line 41
    if-eqz v1, :cond_4

    .line 42
    .line 43
    return v2

    .line 44
    :cond_4
    invoke-virtual {v0, p1, p2}, Landroid/view/View;->requestFocus(ILandroid/graphics/Rect;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    return p1
.end method

.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    instance-of v0, p1, LCe;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    :cond_0
    check-cast p1, LCe;

    invoke-virtual {p1}, Landroid/view/AbsSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iput-object p1, p0, Landroidx/core/widget/NestedScrollView;->y:LCe;

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LCe;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, v1, LCe;->a:I

    .line 15
    .line 16
    return-object v1
.end method

.method public final onScrollChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onScrollChanged(IIII)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    if-ne p0, p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p0, p1, p2, p4}, Landroidx/core/widget/NestedScrollView;->n(Landroid/view/View;II)Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-eqz p3, :cond_2

    .line 19
    .line 20
    iget-object p3, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p3}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p3}, Landroidx/core/widget/NestedScrollView;->h(Landroid/graphics/Rect;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    iget-boolean p3, p0, Landroidx/core/widget/NestedScrollView;->p:Z

    .line 35
    .line 36
    if-eqz p3, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p2, p1, p2}, Landroidx/core/widget/NestedScrollView;->v(IIZ)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->scrollBy(II)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public final onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/core/widget/NestedScrollView;->f(Landroid/view/View;Landroid/view/View;II)Z

    move-result p1

    return p1
.end method

.method public final onStopNestedScroll(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/core/widget/NestedScrollView;->b(Landroid/view/View;I)V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iput-object v2, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    iput v3, v0, Landroidx/core/widget/NestedScrollView;->w:I

    .line 23
    .line 24
    :cond_1
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget v5, v0, Landroidx/core/widget/NestedScrollView;->w:I

    .line 29
    .line 30
    int-to-float v5, v5

    .line 31
    const/4 v6, 0x0

    .line 32
    invoke-virtual {v4, v6, v5}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 33
    .line 34
    .line 35
    const/4 v5, 0x1

    .line 36
    const/4 v7, 0x2

    .line 37
    if-eqz v2, :cond_19

    .line 38
    .line 39
    iget-object v8, v0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 40
    .line 41
    iget-object v9, v0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 42
    .line 43
    const/4 v10, 0x0

    .line 44
    const/4 v11, -0x1

    .line 45
    if-eq v2, v5, :cond_11

    .line 46
    .line 47
    if-eq v2, v7, :cond_7

    .line 48
    .line 49
    const/4 v6, 0x3

    .line 50
    if-eq v2, v6, :cond_4

    .line 51
    .line 52
    const/4 v3, 0x5

    .line 53
    if-eq v2, v3, :cond_3

    .line 54
    .line 55
    const/4 v3, 0x6

    .line 56
    if-eq v2, v3, :cond_2

    .line 57
    .line 58
    goto/16 :goto_3

    .line 59
    .line 60
    :cond_2
    invoke-virtual/range {p0 .. p1}, Landroidx/core/widget/NestedScrollView;->p(Landroid/view/MotionEvent;)V

    .line 61
    .line 62
    .line 63
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    float-to-int v1, v1

    .line 74
    iput v1, v0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 75
    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    float-to-int v3, v3

    .line 87
    iput v3, v0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iput v1, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 94
    .line 95
    goto/16 :goto_3

    .line 96
    .line 97
    :cond_4
    iget-boolean v1, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 98
    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-lez v1, :cond_5

    .line 106
    .line 107
    iget-object v12, v0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 108
    .line 109
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollX()I

    .line 110
    .line 111
    .line 112
    move-result v13

    .line 113
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    .line 114
    .line 115
    .line 116
    move-result v14

    .line 117
    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 118
    .line 119
    .line 120
    move-result v18

    .line 121
    const/4 v15, 0x0

    .line 122
    const/16 v16, 0x0

    .line 123
    .line 124
    const/16 v17, 0x0

    .line 125
    .line 126
    invoke-virtual/range {v12 .. v18}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_5

    .line 131
    .line 132
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 133
    .line 134
    .line 135
    :cond_5
    iput v11, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 136
    .line 137
    iput-boolean v3, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 138
    .line 139
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 140
    .line 141
    if-eqz v1, :cond_6

    .line 142
    .line 143
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    .line 144
    .line 145
    .line 146
    iput-object v10, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 147
    .line 148
    :cond_6
    invoke-virtual {v0, v3}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 154
    .line 155
    .line 156
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 157
    .line 158
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_3

    .line 162
    .line 163
    :cond_7
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-ne v2, v11, :cond_8

    .line 170
    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v2, "Invalid pointerId="

    .line 174
    .line 175
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v2, " in onTouchEvent"

    .line 184
    .line 185
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const-string v2, "NestedScrollView"

    .line 193
    .line 194
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    goto/16 :goto_3

    .line 198
    .line 199
    :cond_8
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    .line 200
    .line 201
    .line 202
    move-result v7

    .line 203
    float-to-int v7, v7

    .line 204
    iget v10, v0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 205
    .line 206
    sub-int/2addr v10, v7

    .line 207
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 208
    .line 209
    .line 210
    move-result v11

    .line 211
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 212
    .line 213
    .line 214
    move-result v12

    .line 215
    int-to-float v12, v12

    .line 216
    div-float/2addr v11, v12

    .line 217
    int-to-float v12, v10

    .line 218
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 219
    .line 220
    .line 221
    move-result v13

    .line 222
    int-to-float v13, v13

    .line 223
    div-float/2addr v12, v13

    .line 224
    invoke-static {v9}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 225
    .line 226
    .line 227
    move-result v13

    .line 228
    cmpl-float v13, v13, v6

    .line 229
    .line 230
    if-eqz v13, :cond_a

    .line 231
    .line 232
    neg-float v8, v12

    .line 233
    invoke-static {v9, v8, v11}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 234
    .line 235
    .line 236
    move-result v8

    .line 237
    neg-float v8, v8

    .line 238
    invoke-static {v9}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 239
    .line 240
    .line 241
    move-result v11

    .line 242
    cmpl-float v6, v11, v6

    .line 243
    .line 244
    if-nez v6, :cond_9

    .line 245
    .line 246
    invoke-virtual {v9}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 247
    .line 248
    .line 249
    :cond_9
    move v6, v8

    .line 250
    goto :goto_0

    .line 251
    :cond_a
    invoke-static {v8}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 252
    .line 253
    .line 254
    move-result v9

    .line 255
    cmpl-float v9, v9, v6

    .line 256
    .line 257
    if-eqz v9, :cond_c

    .line 258
    .line 259
    const/high16 v9, 0x3f800000    # 1.0f

    .line 260
    .line 261
    sub-float/2addr v9, v11

    .line 262
    invoke-static {v8, v12, v9}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 263
    .line 264
    .line 265
    move-result v9

    .line 266
    invoke-static {v8}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 267
    .line 268
    .line 269
    move-result v11

    .line 270
    cmpl-float v6, v11, v6

    .line 271
    .line 272
    if-nez v6, :cond_b

    .line 273
    .line 274
    invoke-virtual {v8}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 275
    .line 276
    .line 277
    :cond_b
    move v6, v9

    .line 278
    :cond_c
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 279
    .line 280
    .line 281
    move-result v8

    .line 282
    int-to-float v8, v8

    .line 283
    mul-float/2addr v6, v8

    .line 284
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 285
    .line 286
    .line 287
    move-result v6

    .line 288
    if-eqz v6, :cond_d

    .line 289
    .line 290
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->invalidate()V

    .line 291
    .line 292
    .line 293
    :cond_d
    sub-int/2addr v10, v6

    .line 294
    iget-boolean v6, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 295
    .line 296
    if-nez v6, :cond_10

    .line 297
    .line 298
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 299
    .line 300
    .line 301
    move-result v6

    .line 302
    iget v8, v0, Landroidx/core/widget/NestedScrollView;->q:I

    .line 303
    .line 304
    if-le v6, v8, :cond_10

    .line 305
    .line 306
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 307
    .line 308
    .line 309
    move-result-object v6

    .line 310
    if-eqz v6, :cond_e

    .line 311
    .line 312
    invoke-interface {v6, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 313
    .line 314
    .line 315
    :cond_e
    iput-boolean v5, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 316
    .line 317
    iget v6, v0, Landroidx/core/widget/NestedScrollView;->q:I

    .line 318
    .line 319
    if-lez v10, :cond_f

    .line 320
    .line 321
    sub-int/2addr v10, v6

    .line 322
    goto :goto_1

    .line 323
    :cond_f
    add-int/2addr v10, v6

    .line 324
    :cond_10
    :goto_1
    iget-boolean v6, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 325
    .line 326
    if-eqz v6, :cond_1d

    .line 327
    .line 328
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    float-to-int v1, v1

    .line 333
    invoke-virtual {v0, v10, v1, v3, v3}, Landroidx/core/widget/NestedScrollView;->t(IIIZ)I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    sub-int/2addr v7, v1

    .line 338
    iput v7, v0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 339
    .line 340
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->w:I

    .line 341
    .line 342
    add-int/2addr v2, v1

    .line 343
    iput v2, v0, Landroidx/core/widget/NestedScrollView;->w:I

    .line 344
    .line 345
    goto/16 :goto_3

    .line 346
    .line 347
    :cond_11
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 348
    .line 349
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->s:I

    .line 350
    .line 351
    int-to-float v2, v2

    .line 352
    const/16 v7, 0x3e8

    .line 353
    .line 354
    invoke-virtual {v1, v7, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 355
    .line 356
    .line 357
    iget v2, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 358
    .line 359
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    float-to-int v1, v1

    .line 364
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    iget v7, v0, Landroidx/core/widget/NestedScrollView;->r:I

    .line 369
    .line 370
    if-lt v2, v7, :cond_16

    .line 371
    .line 372
    invoke-static {v9}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 373
    .line 374
    .line 375
    move-result v2

    .line 376
    cmpl-float v2, v2, v6

    .line 377
    .line 378
    if-eqz v2, :cond_14

    .line 379
    .line 380
    invoke-virtual {v0, v9, v1}, Landroidx/core/widget/NestedScrollView;->u(Landroid/widget/EdgeEffect;I)Z

    .line 381
    .line 382
    .line 383
    move-result v2

    .line 384
    if-eqz v2, :cond_12

    .line 385
    .line 386
    invoke-virtual {v9, v1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 387
    .line 388
    .line 389
    goto :goto_2

    .line 390
    :cond_12
    neg-int v1, v1

    .line 391
    :cond_13
    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->k(I)V

    .line 392
    .line 393
    .line 394
    goto :goto_2

    .line 395
    :cond_14
    invoke-static {v8}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    cmpl-float v2, v2, v6

    .line 400
    .line 401
    if-eqz v2, :cond_15

    .line 402
    .line 403
    neg-int v1, v1

    .line 404
    invoke-virtual {v0, v8, v1}, Landroidx/core/widget/NestedScrollView;->u(Landroid/widget/EdgeEffect;I)Z

    .line 405
    .line 406
    .line 407
    move-result v2

    .line 408
    if-eqz v2, :cond_13

    .line 409
    .line 410
    invoke-virtual {v8, v1}, Landroid/widget/EdgeEffect;->onAbsorb(I)V

    .line 411
    .line 412
    .line 413
    goto :goto_2

    .line 414
    :cond_15
    neg-int v1, v1

    .line 415
    int-to-float v2, v1

    .line 416
    iget-object v7, v0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 417
    .line 418
    invoke-virtual {v7, v6, v2}, LDe;->b(FF)Z

    .line 419
    .line 420
    .line 421
    move-result v7

    .line 422
    if-nez v7, :cond_17

    .line 423
    .line 424
    invoke-virtual {v0, v6, v2, v5}, Landroidx/core/widget/NestedScrollView;->dispatchNestedFling(FFZ)Z

    .line 425
    .line 426
    .line 427
    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->k(I)V

    .line 428
    .line 429
    .line 430
    goto :goto_2

    .line 431
    :cond_16
    iget-object v12, v0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 432
    .line 433
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollX()I

    .line 434
    .line 435
    .line 436
    move-result v13

    .line 437
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    .line 438
    .line 439
    .line 440
    move-result v14

    .line 441
    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 442
    .line 443
    .line 444
    move-result v18

    .line 445
    const/4 v15, 0x0

    .line 446
    const/16 v16, 0x0

    .line 447
    .line 448
    const/16 v17, 0x0

    .line 449
    .line 450
    invoke-virtual/range {v12 .. v18}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    if-eqz v1, :cond_17

    .line 455
    .line 456
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 457
    .line 458
    .line 459
    :cond_17
    :goto_2
    iput v11, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 460
    .line 461
    iput-boolean v3, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 462
    .line 463
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 464
    .line 465
    if-eqz v1, :cond_18

    .line 466
    .line 467
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    .line 468
    .line 469
    .line 470
    iput-object v10, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 471
    .line 472
    :cond_18
    invoke-virtual {v0, v3}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 473
    .line 474
    .line 475
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 476
    .line 477
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 478
    .line 479
    .line 480
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 481
    .line 482
    invoke-virtual {v1}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 483
    .line 484
    .line 485
    goto :goto_3

    .line 486
    :cond_19
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 487
    .line 488
    .line 489
    move-result v2

    .line 490
    if-nez v2, :cond_1a

    .line 491
    .line 492
    return v3

    .line 493
    :cond_1a
    iget-boolean v2, v0, Landroidx/core/widget/NestedScrollView;->m:Z

    .line 494
    .line 495
    if-eqz v2, :cond_1b

    .line 496
    .line 497
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 498
    .line 499
    .line 500
    move-result-object v2

    .line 501
    if-eqz v2, :cond_1b

    .line 502
    .line 503
    invoke-interface {v2, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 504
    .line 505
    .line 506
    :cond_1b
    iget-object v2, v0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 507
    .line 508
    invoke-virtual {v2}, Landroid/widget/OverScroller;->isFinished()Z

    .line 509
    .line 510
    .line 511
    move-result v2

    .line 512
    if-nez v2, :cond_1c

    .line 513
    .line 514
    iget-object v2, v0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 515
    .line 516
    invoke-virtual {v2}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 517
    .line 518
    .line 519
    invoke-virtual {v0, v5}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 520
    .line 521
    .line 522
    :cond_1c
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    .line 523
    .line 524
    .line 525
    move-result v2

    .line 526
    float-to-int v2, v2

    .line 527
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 528
    .line 529
    .line 530
    move-result v1

    .line 531
    iput v2, v0, Landroidx/core/widget/NestedScrollView;->i:I

    .line 532
    .line 533
    iput v1, v0, Landroidx/core/widget/NestedScrollView;->t:I

    .line 534
    .line 535
    invoke-virtual {v0, v7, v3}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 536
    .line 537
    .line 538
    :cond_1d
    :goto_3
    iget-object v1, v0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 539
    .line 540
    if-eqz v1, :cond_1e

    .line 541
    .line 542
    invoke-virtual {v1, v4}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 543
    .line 544
    .line 545
    :cond_1e
    invoke-virtual {v4}, Landroid/view/MotionEvent;->recycle()V

    .line 546
    .line 547
    .line 548
    return v5
.end method

.method public final p(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget v2, p0, Landroidx/core/widget/NestedScrollView;->t:I

    if-ne v1, v2, :cond_1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Landroidx/core/widget/NestedScrollView;->i:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Landroidx/core/widget/NestedScrollView;->t:I

    iget-object p1, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    :cond_1
    return-void
.end method

.method public final q(IIII)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getOverScrollMode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-super {p0}, Landroid/widget/FrameLayout;->computeHorizontalScrollRange()I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/widget/FrameLayout;->computeHorizontalScrollExtent()I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->computeVerticalScrollRange()I

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Landroid/widget/FrameLayout;->computeVerticalScrollExtent()I

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    add-int/2addr p3, p1

    .line 19
    const/4 p1, 0x0

    .line 20
    if-lez p2, :cond_0

    .line 21
    .line 22
    :goto_0
    move p2, p1

    .line 23
    move v0, v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    if-gez p2, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move v0, p1

    .line 29
    :goto_1
    if-le p3, p4, :cond_2

    .line 30
    .line 31
    :goto_2
    move p3, v1

    .line 32
    goto :goto_3

    .line 33
    :cond_2
    if-gez p3, :cond_3

    .line 34
    .line 35
    move p4, p1

    .line 36
    goto :goto_2

    .line 37
    :cond_3
    move p4, p3

    .line 38
    move p3, p1

    .line 39
    :goto_3
    if-eqz p3, :cond_5

    .line 40
    .line 41
    iget-object v2, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 42
    .line 43
    invoke-virtual {v2, v1}, LDe;->e(I)Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-eqz v2, :cond_4

    .line 48
    .line 49
    goto :goto_4

    .line 50
    :cond_4
    iget-object v2, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    const/4 v5, 0x0

    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v7, 0x0

    .line 59
    move v3, p2

    .line 60
    move v4, p4

    .line 61
    invoke-virtual/range {v2 .. v8}, Landroid/widget/OverScroller;->springBack(IIIIII)Z

    .line 62
    .line 63
    .line 64
    :cond_5
    :goto_4
    invoke-super {p0, p2, p4}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 65
    .line 66
    .line 67
    if-nez v0, :cond_7

    .line 68
    .line 69
    if-eqz p3, :cond_6

    .line 70
    .line 71
    goto :goto_5

    .line 72
    :cond_6
    move v1, p1

    .line 73
    :cond_7
    :goto_5
    return v1
.end method

.method public final r(I)V
    .locals 5

    .line 1
    const/16 v0, 0x82

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    iget-object v4, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr v0, v3

    .line 23
    iput v0, v4, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    sub-int/2addr v0, v2

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 47
    .line 48
    add-int/2addr v0, v1

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v1, v0

    .line 54
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    add-int/2addr v0, v3

    .line 57
    if-le v0, v1, :cond_2

    .line 58
    .line 59
    sub-int/2addr v1, v3

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    sub-int/2addr v0, v3

    .line 66
    iput v0, v4, Landroid/graphics/Rect;->top:I

    .line 67
    .line 68
    if-gez v0, :cond_2

    .line 69
    .line 70
    :goto_1
    iput v1, v4, Landroid/graphics/Rect;->top:I

    .line 71
    .line 72
    :cond_2
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 73
    .line 74
    add-int/2addr v3, v0

    .line 75
    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    invoke-virtual {p0, p1, v0, v3}, Landroidx/core/widget/NestedScrollView;->s(III)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->e:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/core/widget/NestedScrollView;->h(Landroid/graphics/Rect;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->scrollBy(II)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iput-object p2, p0, Landroidx/core/widget/NestedScrollView;->l:Landroid/view/View;

    .line 25
    .line 26
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sub-int/2addr v1, p1

    .line 19
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Rect;->offset(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroidx/core/widget/NestedScrollView;->h(Landroid/graphics/Rect;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 p2, 0x0

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v0, p2

    .line 32
    :goto_0
    if-eqz v0, :cond_2

    .line 33
    .line 34
    if-eqz p3, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->scrollBy(II)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-virtual {p0, p2, p1, p2}, Landroidx/core/widget/NestedScrollView;->v(IIZ)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_1
    return v0
.end method

.method public final requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final requestLayout()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->j:Z

    invoke-super {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public final s(III)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    add-int/2addr v4, v5

    .line 18
    const/16 v6, 0x21

    .line 19
    .line 20
    if-ne v1, v6, :cond_0

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v6, 0x0

    .line 25
    :goto_0
    const/4 v9, 0x2

    .line 26
    invoke-virtual {v0, v9}, Landroid/view/View;->getFocusables(I)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v9

    .line 30
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    const/4 v11, 0x0

    .line 35
    const/4 v12, 0x0

    .line 36
    const/4 v13, 0x0

    .line 37
    :goto_1
    if-ge v12, v10, :cond_9

    .line 38
    .line 39
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v14

    .line 43
    check-cast v14, Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    .line 46
    .line 47
    .line 48
    move-result v15

    .line 49
    invoke-virtual {v14}, Landroid/view/View;->getBottom()I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-ge v2, v7, :cond_8

    .line 54
    .line 55
    if-ge v15, v3, :cond_8

    .line 56
    .line 57
    if-ge v2, v15, :cond_1

    .line 58
    .line 59
    if-ge v7, v3, :cond_1

    .line 60
    .line 61
    const/16 v16, 0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    const/16 v16, 0x0

    .line 65
    .line 66
    :goto_2
    if-nez v11, :cond_2

    .line 67
    .line 68
    move-object v11, v14

    .line 69
    move/from16 v13, v16

    .line 70
    .line 71
    goto :goto_5

    .line 72
    :cond_2
    if-eqz v6, :cond_3

    .line 73
    .line 74
    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    if-lt v15, v8, :cond_4

    .line 79
    .line 80
    :cond_3
    if-nez v6, :cond_5

    .line 81
    .line 82
    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-le v7, v8, :cond_5

    .line 87
    .line 88
    :cond_4
    const/4 v7, 0x1

    .line 89
    goto :goto_3

    .line 90
    :cond_5
    const/4 v7, 0x0

    .line 91
    :goto_3
    if-eqz v13, :cond_6

    .line 92
    .line 93
    if-eqz v16, :cond_8

    .line 94
    .line 95
    if-eqz v7, :cond_8

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_6
    if-eqz v16, :cond_7

    .line 99
    .line 100
    move-object v11, v14

    .line 101
    const/4 v13, 0x1

    .line 102
    goto :goto_5

    .line 103
    :cond_7
    if-eqz v7, :cond_8

    .line 104
    .line 105
    :goto_4
    move-object v11, v14

    .line 106
    :cond_8
    :goto_5
    add-int/lit8 v12, v12, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_9
    if-nez v11, :cond_a

    .line 110
    .line 111
    move-object v11, v0

    .line 112
    :cond_a
    if-lt v2, v5, :cond_b

    .line 113
    .line 114
    if-gt v3, v4, :cond_b

    .line 115
    .line 116
    const/4 v7, 0x0

    .line 117
    goto :goto_8

    .line 118
    :cond_b
    if-eqz v6, :cond_c

    .line 119
    .line 120
    sub-int/2addr v2, v5

    .line 121
    :goto_6
    const/4 v3, 0x0

    .line 122
    const/4 v4, 0x1

    .line 123
    goto :goto_7

    .line 124
    :cond_c
    sub-int v2, v3, v4

    .line 125
    .line 126
    goto :goto_6

    .line 127
    :goto_7
    invoke-virtual {v0, v2, v3, v4, v4}, Landroidx/core/widget/NestedScrollView;->t(IIIZ)I

    .line 128
    .line 129
    .line 130
    move v7, v4

    .line 131
    :goto_8
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    if-eq v11, v2, :cond_d

    .line 136
    .line 137
    invoke-virtual {v11, v1}, Landroid/view/View;->requestFocus(I)Z

    .line 138
    .line 139
    .line 140
    :cond_d
    return v7
.end method

.method public final scrollTo(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_7

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    sub-int/2addr v3, v4

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    sub-int/2addr v3, v4

    .line 32
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    iget v5, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 37
    .line 38
    add-int/2addr v4, v5

    .line 39
    iget v5, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 40
    .line 41
    add-int/2addr v4, v5

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    sub-int/2addr v5, v6

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    sub-int/2addr v5, v6

    .line 56
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget v6, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 61
    .line 62
    add-int/2addr v1, v6

    .line 63
    iget v2, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 64
    .line 65
    add-int/2addr v1, v2

    .line 66
    if-ge v3, v4, :cond_1

    .line 67
    .line 68
    if-gez p1, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    add-int v2, v3, p1

    .line 72
    .line 73
    if-le v2, v4, :cond_2

    .line 74
    .line 75
    sub-int p1, v4, v3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    :goto_0
    move p1, v0

    .line 79
    :cond_2
    :goto_1
    if-ge v5, v1, :cond_4

    .line 80
    .line 81
    if-gez p2, :cond_3

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_3
    add-int v0, v5, p2

    .line 85
    .line 86
    if-le v0, v1, :cond_5

    .line 87
    .line 88
    sub-int p2, v1, v5

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_4
    :goto_2
    move p2, v0

    .line 92
    :cond_5
    :goto_3
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-ne p1, v0, :cond_6

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eq p2, v0, :cond_7

    .line 103
    .line 104
    :cond_6
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->scrollTo(II)V

    .line 105
    .line 106
    .line 107
    :cond_7
    return-void
.end method

.method public setFillViewport(Z)V
    .locals 1

    iget-boolean v0, p0, Landroidx/core/widget/NestedScrollView;->o:Z

    if-eq p1, v0, :cond_0

    iput-boolean p1, p0, Landroidx/core/widget/NestedScrollView;->o:Z

    invoke-virtual {p0}, Landroidx/core/widget/NestedScrollView;->requestLayout()V

    :cond_0
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    iget-boolean v1, v0, LDe;->d:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 8
    .line 9
    iget-object v1, v0, LDe;->c:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v1}, LEj;->j(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-boolean p1, v0, LDe;->d:Z

    .line 15
    .line 16
    return-void
.end method

.method public setOnScrollChangeListener(LBe;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSmoothScrollingEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Landroidx/core/widget/NestedScrollView;->p:Z

    return-void
.end method

.method public final shouldDelayChildPressedState()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final startNestedScroll(I)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    move-result p1

    return p1
.end method

.method public final stopNestedScroll()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/core/widget/NestedScrollView;->y(I)V

    return-void
.end method

.method public final t(IIIZ)I
    .locals 19

    .line 1
    move-object/from16 v6, p0

    .line 2
    .line 3
    move/from16 v7, p2

    .line 4
    .line 5
    move/from16 v15, p3

    .line 6
    .line 7
    const/4 v14, 0x1

    .line 8
    if-ne v15, v14, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-virtual {v6, v0, v15}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v5, v6, Landroidx/core/widget/NestedScrollView;->u:[I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iget-object v4, v6, Landroidx/core/widget/NestedScrollView;->v:[I

    .line 18
    .line 19
    move-object/from16 v0, p0

    .line 20
    .line 21
    move/from16 v2, p1

    .line 22
    .line 23
    move/from16 v3, p3

    .line 24
    .line 25
    invoke-virtual/range {v0 .. v5}, Landroidx/core/widget/NestedScrollView;->i(III[I[I)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, v6, Landroidx/core/widget/NestedScrollView;->v:[I

    .line 30
    .line 31
    iget-object v3, v6, Landroidx/core/widget/NestedScrollView;->u:[I

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    aget v0, v2, v14

    .line 36
    .line 37
    sub-int v0, p1, v0

    .line 38
    .line 39
    aget v4, v3, v14

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move/from16 v0, p1

    .line 43
    .line 44
    move v4, v1

    .line 45
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 50
    .line 51
    .line 52
    move-result v13

    .line 53
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getOverScrollMode()I

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-eqz v8, :cond_2

    .line 58
    .line 59
    if-ne v8, v14, :cond_3

    .line 60
    .line 61
    invoke-virtual/range {p0 .. p0}, Landroidx/core/widget/NestedScrollView;->getScrollRange()I

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    if-lez v8, :cond_3

    .line 66
    .line 67
    :cond_2
    if-nez p4, :cond_3

    .line 68
    .line 69
    move/from16 v16, v14

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    move/from16 v16, v1

    .line 73
    .line 74
    :goto_1
    invoke-virtual {v6, v0, v1, v5, v13}, Landroidx/core/widget/NestedScrollView;->q(IIII)Z

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    if-eqz v8, :cond_5

    .line 79
    .line 80
    iget-object v8, v6, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 81
    .line 82
    invoke-virtual {v8, v15}, LDe;->e(I)Landroid/view/ViewParent;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    if-eqz v8, :cond_4

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move/from16 v17, v14

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_5
    :goto_2
    move/from16 v17, v1

    .line 93
    .line 94
    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getScrollY()I

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    sub-int v10, v8, v5

    .line 99
    .line 100
    sub-int v12, v0, v10

    .line 101
    .line 102
    aput v1, v2, v14

    .line 103
    .line 104
    const/4 v9, 0x0

    .line 105
    const/4 v11, 0x0

    .line 106
    iget-object v8, v6, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 107
    .line 108
    iget-object v1, v6, Landroidx/core/widget/NestedScrollView;->u:[I

    .line 109
    .line 110
    move/from16 v18, v13

    .line 111
    .line 112
    move-object v13, v1

    .line 113
    move v1, v14

    .line 114
    move/from16 v14, p3

    .line 115
    .line 116
    move-object v15, v2

    .line 117
    invoke-virtual/range {v8 .. v15}, LDe;->d(IIII[II[I)Z

    .line 118
    .line 119
    .line 120
    aget v3, v3, v1

    .line 121
    .line 122
    add-int/2addr v4, v3

    .line 123
    aget v2, v2, v1

    .line 124
    .line 125
    sub-int/2addr v0, v2

    .line 126
    add-int/2addr v5, v0

    .line 127
    iget-object v2, v6, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    .line 128
    .line 129
    iget-object v3, v6, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    .line 130
    .line 131
    if-gez v5, :cond_6

    .line 132
    .line 133
    if-eqz v16, :cond_7

    .line 134
    .line 135
    neg-int v0, v0

    .line 136
    int-to-float v0, v0

    .line 137
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    int-to-float v5, v5

    .line 142
    div-float/2addr v0, v5

    .line 143
    int-to-float v5, v7

    .line 144
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    int-to-float v7, v7

    .line 149
    div-float/2addr v5, v7

    .line 150
    invoke-static {v3, v0, v5}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_7

    .line 158
    .line 159
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 160
    .line 161
    .line 162
    goto :goto_4

    .line 163
    :cond_6
    move/from16 v8, v18

    .line 164
    .line 165
    if-le v5, v8, :cond_7

    .line 166
    .line 167
    if-eqz v16, :cond_7

    .line 168
    .line 169
    int-to-float v0, v0

    .line 170
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    int-to-float v5, v5

    .line 175
    div-float/2addr v0, v5

    .line 176
    int-to-float v5, v7

    .line 177
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    int-to-float v7, v7

    .line 182
    div-float/2addr v5, v7

    .line 183
    const/high16 v7, 0x3f800000    # 1.0f

    .line 184
    .line 185
    sub-float/2addr v7, v5

    .line 186
    invoke-static {v2, v0, v7}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_7

    .line 194
    .line 195
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 196
    .line 197
    .line 198
    :cond_7
    :goto_4
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_8

    .line 203
    .line 204
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->isFinished()Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_9

    .line 209
    .line 210
    :cond_8
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 211
    .line 212
    .line 213
    const/16 v17, 0x0

    .line 214
    .line 215
    :cond_9
    move/from16 v0, p3

    .line 216
    .line 217
    if-eqz v17, :cond_a

    .line 218
    .line 219
    if-nez v0, :cond_a

    .line 220
    .line 221
    iget-object v5, v6, Landroidx/core/widget/NestedScrollView;->n:Landroid/view/VelocityTracker;

    .line 222
    .line 223
    if-eqz v5, :cond_a

    .line 224
    .line 225
    invoke-virtual {v5}, Landroid/view/VelocityTracker;->clear()V

    .line 226
    .line 227
    .line 228
    :cond_a
    if-ne v0, v1, :cond_b

    .line 229
    .line 230
    invoke-virtual {v6, v0}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v2}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 237
    .line 238
    .line 239
    :cond_b
    return v4
.end method

.method public final u(Landroid/widget/EdgeEffect;I)Z
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-static {p1}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    mul-float/2addr p1, v1

    .line 15
    neg-int p2, p2

    .line 16
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    int-to-float p2, p2

    .line 21
    const v1, 0x3eb33333    # 0.35f

    .line 22
    .line 23
    .line 24
    mul-float/2addr p2, v1

    .line 25
    iget v1, p0, Landroidx/core/widget/NestedScrollView;->c:F

    .line 26
    .line 27
    const v2, 0x3c75c28f    # 0.015f

    .line 28
    .line 29
    .line 30
    mul-float/2addr v1, v2

    .line 31
    div-float/2addr p2, v1

    .line 32
    float-to-double v2, p2

    .line 33
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    sget p2, Landroidx/core/widget/NestedScrollView;->D:F

    .line 38
    .line 39
    float-to-double v4, p2

    .line 40
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 41
    .line 42
    sub-double v6, v4, v6

    .line 43
    .line 44
    float-to-double v8, v1

    .line 45
    div-double/2addr v4, v6

    .line 46
    mul-double/2addr v4, v2

    .line 47
    invoke-static {v4, v5}, Ljava/lang/Math;->exp(D)D

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    mul-double/2addr v1, v8

    .line 52
    double-to-float p2, v1

    .line 53
    cmpg-float p1, p2, p1

    .line 54
    .line 55
    if-gez p1, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const/4 v0, 0x0

    .line 59
    :goto_0
    return v0
.end method

.method public final v(IIZ)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-wide v2, p0, Landroidx/core/widget/NestedScrollView;->d:J

    .line 13
    .line 14
    sub-long/2addr v0, v2

    .line 15
    const-wide/16 v2, 0xfa

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-lez v0, :cond_2

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 38
    .line 39
    add-int/2addr v0, v3

    .line 40
    iget v2, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 41
    .line 42
    add-int/2addr v0, v2

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    sub-int/2addr v2, v3

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v2, v3

    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    sub-int/2addr v0, v2

    .line 62
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/2addr p2, v5

    .line 67
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    sub-int v7, p1, v5

    .line 76
    .line 77
    iget-object v3, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    const/4 v6, 0x0

    .line 84
    const/16 v8, 0xfa

    .line 85
    .line 86
    invoke-virtual/range {v3 .. v8}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 87
    .line 88
    .line 89
    if-eqz p3, :cond_1

    .line 90
    .line 91
    const/4 p1, 0x2

    .line 92
    invoke-virtual {p0, p1, v1}, Landroidx/core/widget/NestedScrollView;->w(II)Z

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-virtual {p0, v1}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 97
    .line 98
    .line 99
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Landroidx/core/widget/NestedScrollView;->x:I

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    iget-object p3, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 110
    .line 111
    invoke-virtual {p3}, Landroid/widget/OverScroller;->isFinished()Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-nez p3, :cond_3

    .line 116
    .line 117
    iget-object p3, p0, Landroidx/core/widget/NestedScrollView;->f:Landroid/widget/OverScroller;

    .line 118
    .line 119
    invoke-virtual {p3}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0, v1}, Landroidx/core/widget/NestedScrollView;->y(I)V

    .line 123
    .line 124
    .line 125
    :cond_3
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->scrollBy(II)V

    .line 126
    .line 127
    .line 128
    :goto_1
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 129
    .line 130
    .line 131
    move-result-wide p1

    .line 132
    iput-wide p1, p0, Landroidx/core/widget/NestedScrollView;->d:J

    .line 133
    .line 134
    return-void
.end method

.method public final w(II)Z
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, LDe;->e(I)Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    move v1, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    if-eqz v1, :cond_2

    .line 15
    .line 16
    :cond_1
    :goto_1
    move v2, v3

    .line 17
    goto/16 :goto_5

    .line 18
    .line 19
    :cond_2
    iget-boolean v1, v0, LDe;->d:Z

    .line 20
    .line 21
    if-eqz v1, :cond_a

    .line 22
    .line 23
    iget-object v1, v0, LDe;->c:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    move-object v5, v1

    .line 30
    :goto_2
    if-eqz v4, :cond_a

    .line 31
    .line 32
    instance-of v6, v4, LEe;

    .line 33
    .line 34
    const-string v7, "ViewParentCompat"

    .line 35
    .line 36
    const-string v8, "ViewParent "

    .line 37
    .line 38
    if-eqz v6, :cond_3

    .line 39
    .line 40
    move-object v9, v4

    .line 41
    check-cast v9, LEe;

    .line 42
    .line 43
    invoke-interface {v9, v5, v1, p1, p2}, LEe;->f(Landroid/view/View;Landroid/view/View;II)Z

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    goto :goto_3

    .line 48
    :cond_3
    if-nez p2, :cond_4

    .line 49
    .line 50
    :try_start_0
    invoke-interface {v4, v5, v1, p1}, Landroid/view/ViewParent;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    .line 51
    .line 52
    .line 53
    move-result v9
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    goto :goto_3

    .line 55
    :catch_0
    move-exception v9

    .line 56
    new-instance v10, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v10, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v11, " does not implement interface method onStartNestedScroll"

    .line 65
    .line 66
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    invoke-static {v7, v10, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    .line 75
    .line 76
    :cond_4
    move v9, v2

    .line 77
    :goto_3
    if-eqz v9, :cond_8

    .line 78
    .line 79
    if-eqz p2, :cond_6

    .line 80
    .line 81
    if-eq p2, v3, :cond_5

    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_5
    iput-object v4, v0, LDe;->b:Landroid/view/ViewParent;

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_6
    iput-object v4, v0, LDe;->a:Landroid/view/ViewParent;

    .line 88
    .line 89
    :goto_4
    if-eqz v6, :cond_7

    .line 90
    .line 91
    check-cast v4, LEe;

    .line 92
    .line 93
    invoke-interface {v4, v5, v1, p1, p2}, LEe;->a(Landroid/view/View;Landroid/view/View;II)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_7
    if-nez p2, :cond_1

    .line 98
    .line 99
    :try_start_1
    invoke-interface {v4, v5, v1, p1}, Landroid/view/ViewParent;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    :try_end_1
    .catch Ljava/lang/AbstractMethodError; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :catch_1
    move-exception p1

    .line 104
    new-instance p2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v0, " does not implement interface method onNestedScrollAccepted"

    .line 113
    .line 114
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-static {v7, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_8
    instance-of v6, v4, Landroid/view/View;

    .line 126
    .line 127
    if-eqz v6, :cond_9

    .line 128
    .line 129
    move-object v5, v4

    .line 130
    check-cast v5, Landroid/view/View;

    .line 131
    .line 132
    :cond_9
    invoke-interface {v4}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    goto :goto_2

    .line 137
    :cond_a
    :goto_5
    return v2
.end method

.method public final x(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->g:Landroid/widget/EdgeEffect;

    invoke-static {v0}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v1, v4

    invoke-static {v0, v2, v1}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    move v0, v3

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroidx/core/widget/NestedScrollView;->h:Landroid/widget/EdgeEffect;

    invoke-static {v1}, Lr3;->p(Landroid/widget/EdgeEffect;)F

    move-result v4

    cmpl-float v4, v4, v2

    if-eqz v4, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    invoke-static {v1, v2, v0}, Lr3;->t(Landroid/widget/EdgeEffect;FF)F

    goto :goto_1

    :cond_1
    move v3, v0

    :goto_1
    return v3
.end method

.method public final y(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/core/widget/NestedScrollView;->A:LDe;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LDe;->e(I)Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_4

    .line 8
    .line 9
    instance-of v2, v1, LEe;

    .line 10
    .line 11
    iget-object v3, v0, LDe;->c:Landroid/view/View;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    check-cast v1, LEe;

    .line 16
    .line 17
    invoke-interface {v1, v3, p1}, LEe;->b(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    if-nez p1, :cond_1

    .line 22
    .line 23
    :try_start_0
    invoke-interface {v1, v3}, Landroid/view/ViewParent;->onStopNestedScroll(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v2

    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v4, "ViewParent "

    .line 31
    .line 32
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, " does not implement interface method onStopNestedScroll"

    .line 39
    .line 40
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v3, "ViewParentCompat"

    .line 48
    .line 49
    invoke-static {v3, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    if-eq p1, v2, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    iput-object v1, v0, LDe;->b:Landroid/view/ViewParent;

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    iput-object v1, v0, LDe;->a:Landroid/view/ViewParent;

    .line 63
    .line 64
    :cond_4
    :goto_1
    return-void
.end method
