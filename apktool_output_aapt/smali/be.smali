.class public Lbe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:LMd;

.field public final c:Z

.field public final d:I

.field public final e:I

.field public f:Landroid/view/View;

.field public g:I

.field public h:Z

.field public i:Lhe;

.field public j:LYd;

.field public k:Landroid/widget/PopupWindow$OnDismissListener;

.field public final l:LZd;


# direct methods
.method public constructor <init>(IILMd;Landroid/content/Context;Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x800003

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lbe;->g:I

    .line 8
    .line 9
    new-instance v0, LZd;

    .line 10
    .line 11
    invoke-direct {v0, p0}, LZd;-><init>(Lbe;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lbe;->l:LZd;

    .line 15
    .line 16
    iput-object p4, p0, Lbe;->a:Landroid/content/Context;

    .line 17
    .line 18
    iput-object p3, p0, Lbe;->b:LMd;

    .line 19
    .line 20
    iput-object p5, p0, Lbe;->f:Landroid/view/View;

    .line 21
    .line 22
    iput-boolean p6, p0, Lbe;->c:Z

    .line 23
    .line 24
    iput p1, p0, Lbe;->d:I

    .line 25
    .line 26
    iput p2, p0, Lbe;->e:I

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a()LYd;
    .locals 15

    .line 1
    iget-object v0, p0, Lbe;->j:LYd;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-string v0, "window"

    .line 6
    .line 7
    iget-object v1, p0, Lbe;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/WindowManager;

    .line 14
    .line 15
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v2, Landroid/graphics/Point;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v2}, Lae;->a(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 25
    .line 26
    .line 27
    iget v0, v2, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 30
    .line 31
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const v2, 0x7f060016

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-lt v0, v1, :cond_0

    .line 47
    .line 48
    new-instance v0, LW3;

    .line 49
    .line 50
    iget-object v4, p0, Lbe;->f:Landroid/view/View;

    .line 51
    .line 52
    iget v6, p0, Lbe;->e:I

    .line 53
    .line 54
    iget-boolean v7, p0, Lbe;->c:Z

    .line 55
    .line 56
    iget-object v3, p0, Lbe;->a:Landroid/content/Context;

    .line 57
    .line 58
    iget v5, p0, Lbe;->d:I

    .line 59
    .line 60
    move-object v2, v0

    .line 61
    invoke-direct/range {v2 .. v7}, LW3;-><init>(Landroid/content/Context;Landroid/view/View;IIZ)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    new-instance v0, Lvh;

    .line 66
    .line 67
    iget-object v13, p0, Lbe;->f:Landroid/view/View;

    .line 68
    .line 69
    iget v10, p0, Lbe;->e:I

    .line 70
    .line 71
    iget-boolean v14, p0, Lbe;->c:Z

    .line 72
    .line 73
    iget-object v12, p0, Lbe;->a:Landroid/content/Context;

    .line 74
    .line 75
    iget-object v11, p0, Lbe;->b:LMd;

    .line 76
    .line 77
    iget v9, p0, Lbe;->d:I

    .line 78
    .line 79
    move-object v8, v0

    .line 80
    invoke-direct/range {v8 .. v14}, Lvh;-><init>(IILMd;Landroid/content/Context;Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object v1, p0, Lbe;->b:LMd;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, LYd;->l(LMd;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lbe;->l:LZd;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, LYd;->r(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lbe;->f:Landroid/view/View;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, LYd;->n(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lbe;->i:Lhe;

    .line 99
    .line 100
    invoke-interface {v0, v1}, Lie;->e(Lhe;)V

    .line 101
    .line 102
    .line 103
    iget-boolean v1, p0, Lbe;->h:Z

    .line 104
    .line 105
    invoke-virtual {v0, v1}, LYd;->o(Z)V

    .line 106
    .line 107
    .line 108
    iget v1, p0, Lbe;->g:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, LYd;->p(I)V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lbe;->j:LYd;

    .line 114
    .line 115
    :cond_1
    iget-object v0, p0, Lbe;->j:LYd;

    .line 116
    .line 117
    return-object v0
.end method

.method public final b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lbe;->j:LYd;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lgh;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    return v0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lbe;->j:LYd;

    .line 3
    .line 4
    iget-object v0, p0, Lbe;->k:Landroid/widget/PopupWindow$OnDismissListener;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final d(IIZZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lbe;->a()LYd;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p4}, LYd;->s(Z)V

    .line 6
    .line 7
    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    iget p3, p0, Lbe;->g:I

    .line 11
    .line 12
    iget-object p4, p0, Lbe;->f:Landroid/view/View;

    .line 13
    .line 14
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 15
    .line 16
    invoke-virtual {p4}, Landroid/view/View;->getLayoutDirection()I

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    invoke-static {p3, p4}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    and-int/lit8 p3, p3, 0x7

    .line 25
    .line 26
    const/4 p4, 0x5

    .line 27
    if-ne p3, p4, :cond_0

    .line 28
    .line 29
    iget-object p3, p0, Lbe;->f:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    sub-int/2addr p1, p3

    .line 36
    :cond_0
    invoke-virtual {v0, p1}, LYd;->q(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p2}, LYd;->t(I)V

    .line 40
    .line 41
    .line 42
    iget-object p3, p0, Lbe;->a:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    iget p3, p3, Landroid/util/DisplayMetrics;->density:F

    .line 53
    .line 54
    const/high16 p4, 0x42400000    # 48.0f

    .line 55
    .line 56
    mul-float/2addr p3, p4

    .line 57
    const/high16 p4, 0x40000000    # 2.0f

    .line 58
    .line 59
    div-float/2addr p3, p4

    .line 60
    float-to-int p3, p3

    .line 61
    new-instance p4, Landroid/graphics/Rect;

    .line 62
    .line 63
    sub-int v1, p1, p3

    .line 64
    .line 65
    sub-int v2, p2, p3

    .line 66
    .line 67
    add-int/2addr p1, p3

    .line 68
    add-int/2addr p2, p3

    .line 69
    invoke-direct {p4, v1, v2, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 70
    .line 71
    .line 72
    iput-object p4, v0, LYd;->c:Landroid/graphics/Rect;

    .line 73
    .line 74
    :cond_1
    invoke-interface {v0}, Lgh;->f()V

    .line 75
    .line 76
    .line 77
    return-void
.end method
