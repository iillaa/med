.class public final Lrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lyk;

.field public final synthetic b:LLk;

.field public final synthetic c:LLk;

.field public final synthetic d:I

.field public final synthetic e:Landroid/view/View;


# direct methods
.method public constructor <init>(Lyk;LLk;LLk;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrk;->a:Lyk;

    .line 5
    .line 6
    iput-object p2, p0, Lrk;->b:LLk;

    .line 7
    .line 8
    iput-object p3, p0, Lrk;->c:LLk;

    .line 9
    .line 10
    iput p4, p0, Lrk;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Lrk;->e:Landroid/view/View;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    iget-object v3, v0, Lrk;->a:Lyk;

    .line 8
    .line 9
    iget-object v4, v3, Lyk;->a:Lxk;

    .line 10
    .line 11
    invoke-virtual {v4, v2}, Lxk;->c(F)V

    .line 12
    .line 13
    .line 14
    iget-object v2, v3, Lyk;->a:Lxk;

    .line 15
    .line 16
    invoke-virtual {v2}, Lxk;->b()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    sget-object v4, Luk;->d:Landroid/view/animation/PathInterpolator;

    .line 21
    .line 22
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v5, 0x1e

    .line 25
    .line 26
    iget-object v6, v0, Lrk;->b:LLk;

    .line 27
    .line 28
    if-lt v4, v5, :cond_0

    .line 29
    .line 30
    new-instance v4, LBk;

    .line 31
    .line 32
    invoke-direct {v4, v6}, LBk;-><init>(LLk;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/16 v5, 0x1d

    .line 37
    .line 38
    if-lt v4, v5, :cond_1

    .line 39
    .line 40
    new-instance v4, LAk;

    .line 41
    .line 42
    invoke-direct {v4, v6}, LAk;-><init>(LLk;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance v4, Lzk;

    .line 47
    .line 48
    invoke-direct {v4, v6}, Lzk;-><init>(LLk;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    const/4 v5, 0x1

    .line 52
    :goto_1
    const/16 v7, 0x100

    .line 53
    .line 54
    if-gt v5, v7, :cond_3

    .line 55
    .line 56
    iget v7, v0, Lrk;->d:I

    .line 57
    .line 58
    and-int/2addr v7, v5

    .line 59
    if-nez v7, :cond_2

    .line 60
    .line 61
    iget-object v7, v6, LLk;->a:LIk;

    .line 62
    .line 63
    invoke-virtual {v7, v5}, LIk;->f(I)Lgc;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v4, v5, v7}, LCk;->c(ILgc;)V

    .line 68
    .line 69
    .line 70
    move/from16 p1, v2

    .line 71
    .line 72
    move-object v8, v3

    .line 73
    :goto_2
    const/4 v1, 0x1

    .line 74
    goto :goto_3

    .line 75
    :cond_2
    iget-object v7, v6, LLk;->a:LIk;

    .line 76
    .line 77
    invoke-virtual {v7, v5}, LIk;->f(I)Lgc;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    iget-object v8, v0, Lrk;->c:LLk;

    .line 82
    .line 83
    iget-object v8, v8, LLk;->a:LIk;

    .line 84
    .line 85
    invoke-virtual {v8, v5}, LIk;->f(I)Lgc;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    iget v9, v7, Lgc;->a:I

    .line 90
    .line 91
    iget v10, v8, Lgc;->a:I

    .line 92
    .line 93
    sub-int/2addr v9, v10

    .line 94
    int-to-float v9, v9

    .line 95
    const/high16 v10, 0x3f800000    # 1.0f

    .line 96
    .line 97
    sub-float/2addr v10, v2

    .line 98
    mul-float/2addr v9, v10

    .line 99
    float-to-double v11, v9

    .line 100
    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    .line 101
    .line 102
    add-double/2addr v11, v13

    .line 103
    double-to-int v9, v11

    .line 104
    iget v11, v7, Lgc;->b:I

    .line 105
    .line 106
    iget v12, v8, Lgc;->b:I

    .line 107
    .line 108
    sub-int/2addr v11, v12

    .line 109
    int-to-float v11, v11

    .line 110
    mul-float/2addr v11, v10

    .line 111
    float-to-double v11, v11

    .line 112
    add-double/2addr v11, v13

    .line 113
    double-to-int v11, v11

    .line 114
    iget v12, v7, Lgc;->c:I

    .line 115
    .line 116
    iget v15, v8, Lgc;->c:I

    .line 117
    .line 118
    sub-int/2addr v12, v15

    .line 119
    int-to-float v12, v12

    .line 120
    mul-float/2addr v12, v10

    .line 121
    move/from16 p1, v2

    .line 122
    .line 123
    float-to-double v1, v12

    .line 124
    add-double/2addr v1, v13

    .line 125
    double-to-int v1, v1

    .line 126
    iget v2, v7, Lgc;->d:I

    .line 127
    .line 128
    iget v8, v8, Lgc;->d:I

    .line 129
    .line 130
    sub-int/2addr v2, v8

    .line 131
    int-to-float v2, v2

    .line 132
    mul-float/2addr v2, v10

    .line 133
    move-object v8, v3

    .line 134
    float-to-double v2, v2

    .line 135
    add-double/2addr v2, v13

    .line 136
    double-to-int v2, v2

    .line 137
    invoke-static {v7, v9, v11, v1, v2}, LLk;->e(Lgc;IIII)Lgc;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v4, v5, v1}, LCk;->c(ILgc;)V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :goto_3
    shl-int/2addr v5, v1

    .line 146
    move/from16 v2, p1

    .line 147
    .line 148
    move-object v3, v8

    .line 149
    goto :goto_1

    .line 150
    :cond_3
    move-object v8, v3

    .line 151
    invoke-virtual {v4}, LCk;->b()LLk;

    .line 152
    .line 153
    .line 154
    invoke-static {v8}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 155
    .line 156
    .line 157
    iget-object v1, v0, Lrk;->e:Landroid/view/View;

    .line 158
    .line 159
    invoke-static {v1}, Luk;->f(Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method
