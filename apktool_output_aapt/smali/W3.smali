.class public final LW3;
.super LYd;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public A:Landroid/view/ViewTreeObserver;

.field public B:Landroid/widget/PopupWindow$OnDismissListener;

.field public C:Z

.field public final d:Landroid/content/Context;

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Z

.field public final i:Landroid/os/Handler;

.field public final j:Ljava/util/ArrayList;

.field public final k:Ljava/util/ArrayList;

.field public final l:Lf2;

.field public final m:LT3;

.field public final n:Li0;

.field public o:I

.field public p:I

.field public q:Landroid/view/View;

.field public r:Landroid/view/View;

.field public s:I

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public x:Z

.field public y:Z

.field public z:Lhe;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IIZ)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v2, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v2, p0, LW3;->j:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v2, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, LW3;->k:Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance v2, Lf2;

    .line 21
    .line 22
    invoke-direct {v2, v1, p0}, Lf2;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object v2, p0, LW3;->l:Lf2;

    .line 26
    .line 27
    new-instance v2, LT3;

    .line 28
    .line 29
    invoke-direct {v2, p0, v0}, LT3;-><init>(LYd;I)V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, LW3;->m:LT3;

    .line 33
    .line 34
    new-instance v2, Li0;

    .line 35
    .line 36
    const/4 v3, 0x3

    .line 37
    invoke-direct {v2, v3, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, LW3;->n:Li0;

    .line 41
    .line 42
    iput v0, p0, LW3;->o:I

    .line 43
    .line 44
    iput v0, p0, LW3;->p:I

    .line 45
    .line 46
    iput-object p1, p0, LW3;->d:Landroid/content/Context;

    .line 47
    .line 48
    iput-object p2, p0, LW3;->q:Landroid/view/View;

    .line 49
    .line 50
    iput p3, p0, LW3;->f:I

    .line 51
    .line 52
    iput p4, p0, LW3;->g:I

    .line 53
    .line 54
    iput-boolean p5, p0, LW3;->h:Z

    .line 55
    .line 56
    iput-boolean v0, p0, LW3;->x:Z

    .line 57
    .line 58
    sget-object p3, LLj;->a:Ljava/util/WeakHashMap;

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/view/View;->getLayoutDirection()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    const/4 p3, 0x1

    .line 65
    if-ne p2, p3, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move v0, p3

    .line 69
    :goto_0
    iput v0, p0, LW3;->s:I

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 80
    .line 81
    div-int/2addr p2, v1

    .line 82
    const p3, 0x7f060017

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput p1, p0, LW3;->e:I

    .line 94
    .line 95
    new-instance p1, Landroid/os/Handler;

    .line 96
    .line 97
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, LW3;->i:Landroid/os/Handler;

    .line 101
    .line 102
    return-void
.end method


# virtual methods
.method public final a(LMd;Z)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, LW3;->k:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    const/4 v3, 0x0

    .line 9
    move v4, v3

    .line 10
    :goto_0
    if-ge v4, v2, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    check-cast v5, LV3;

    .line 17
    .line 18
    iget-object v5, v5, LV3;->b:LMd;

    .line 19
    .line 20
    if-ne p1, v5, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    add-int/2addr v4, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v4, -0x1

    .line 26
    :goto_1
    if-gez v4, :cond_2

    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    add-int/lit8 v2, v4, 0x1

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-ge v2, v5, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, LV3;

    .line 42
    .line 43
    iget-object v2, v2, LV3;->b:LMd;

    .line 44
    .line 45
    invoke-virtual {v2, v3}, LMd;->c(Z)V

    .line 46
    .line 47
    .line 48
    :cond_3
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, LV3;

    .line 53
    .line 54
    iget-object v4, v2, LV3;->b:LMd;

    .line 55
    .line 56
    invoke-virtual {v4, p0}, LMd;->r(Lie;)V

    .line 57
    .line 58
    .line 59
    iget-boolean v4, p0, LW3;->C:Z

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    iget-object v2, v2, LV3;->a:Lge;

    .line 63
    .line 64
    if-eqz v4, :cond_4

    .line 65
    .line 66
    iget-object v4, v2, Lnd;->A:LX1;

    .line 67
    .line 68
    invoke-static {v4, v5}, Lce;->b(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 69
    .line 70
    .line 71
    iget-object v4, v2, Lnd;->A:LX1;

    .line 72
    .line 73
    invoke-virtual {v4, v3}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 74
    .line 75
    .line 76
    :cond_4
    invoke-virtual {v2}, Lnd;->dismiss()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-lez v2, :cond_5

    .line 84
    .line 85
    add-int/lit8 v4, v2, -0x1

    .line 86
    .line 87
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, LV3;

    .line 92
    .line 93
    iget v4, v4, LV3;->c:I

    .line 94
    .line 95
    :goto_2
    iput v4, p0, LW3;->s:I

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_5
    iget-object v4, p0, LW3;->q:Landroid/view/View;

    .line 99
    .line 100
    sget-object v6, LLj;->a:Ljava/util/WeakHashMap;

    .line 101
    .line 102
    invoke-virtual {v4}, Landroid/view/View;->getLayoutDirection()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-ne v4, v0, :cond_6

    .line 107
    .line 108
    move v4, v3

    .line 109
    goto :goto_2

    .line 110
    :cond_6
    move v4, v0

    .line 111
    goto :goto_2

    .line 112
    :goto_3
    if-nez v2, :cond_a

    .line 113
    .line 114
    invoke-virtual {p0}, LW3;->dismiss()V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, LW3;->z:Lhe;

    .line 118
    .line 119
    if-eqz p2, :cond_7

    .line 120
    .line 121
    invoke-interface {p2, p1, v0}, Lhe;->a(LMd;Z)V

    .line 122
    .line 123
    .line 124
    :cond_7
    iget-object p1, p0, LW3;->A:Landroid/view/ViewTreeObserver;

    .line 125
    .line 126
    if-eqz p1, :cond_9

    .line 127
    .line 128
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_8

    .line 133
    .line 134
    iget-object p1, p0, LW3;->A:Landroid/view/ViewTreeObserver;

    .line 135
    .line 136
    iget-object p2, p0, LW3;->l:Lf2;

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 139
    .line 140
    .line 141
    :cond_8
    iput-object v5, p0, LW3;->A:Landroid/view/ViewTreeObserver;

    .line 142
    .line 143
    :cond_9
    iget-object p1, p0, LW3;->r:Landroid/view/View;

    .line 144
    .line 145
    iget-object p2, p0, LW3;->m:LT3;

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, LW3;->B:Landroid/widget/PopupWindow$OnDismissListener;

    .line 151
    .line 152
    invoke-interface {p1}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_a
    if-eqz p2, :cond_b

    .line 157
    .line 158
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, LV3;

    .line 163
    .line 164
    iget-object p1, p1, LV3;->b:LMd;

    .line 165
    .line 166
    invoke-virtual {p1, v3}, LMd;->c(Z)V

    .line 167
    .line 168
    .line 169
    :cond_b
    :goto_4
    return-void
.end method

.method public final b()Z
    .locals 3

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, LV3;

    .line 15
    .line 16
    iget-object v0, v0, LV3;->a:Lge;

    .line 17
    .line 18
    iget-object v0, v0, Lnd;->A:LX1;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    :cond_0
    return v2
.end method

.method public final c()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final dismiss()V
    .locals 4

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-lez v1, :cond_1

    .line 8
    .line 9
    new-array v2, v1, [LV3;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, [LV3;

    .line 16
    .line 17
    add-int/lit8 v1, v1, -0x1

    .line 18
    .line 19
    :goto_0
    if-ltz v1, :cond_1

    .line 20
    .line 21
    aget-object v2, v0, v1

    .line 22
    .line 23
    iget-object v3, v2, LV3;->a:Lge;

    .line 24
    .line 25
    iget-object v3, v3, Lnd;->A:LX1;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    iget-object v2, v2, LV3;->a:Lge;

    .line 34
    .line 35
    invoke-virtual {v2}, Lnd;->dismiss()V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public final e(Lhe;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3;->z:Lhe;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    invoke-virtual {p0}, LW3;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, LW3;->j:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, LMd;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, LW3;->v(LMd;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, LW3;->q:Landroid/view/View;

    .line 34
    .line 35
    iput-object v0, p0, LW3;->r:Landroid/view/View;

    .line 36
    .line 37
    if-eqz v0, :cond_4

    .line 38
    .line 39
    iget-object v1, p0, LW3;->A:Landroid/view/ViewTreeObserver;

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    const/4 v1, 0x0

    .line 46
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, LW3;->A:Landroid/view/ViewTreeObserver;

    .line 51
    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, LW3;->l:Lf2;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v0, p0, LW3;->r:Landroid/view/View;

    .line 60
    .line 61
    iget-object v1, p0, LW3;->m:LT3;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 64
    .line 65
    .line 66
    :cond_4
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, LV3;

    .line 18
    .line 19
    iget-object v1, v1, LV3;->a:Lge;

    .line 20
    .line 21
    iget-object v1, v1, Lnd;->e:Ld7;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v2, v1, Landroid/widget/HeaderViewListAdapter;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    check-cast v1, Landroid/widget/HeaderViewListAdapter;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    :cond_0
    check-cast v1, LJd;

    .line 38
    .line 39
    invoke-virtual {v1}, LJd;->notifyDataSetChanged()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public final j()Ld7;
    .locals 2

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, LV3;

    .line 22
    .line 23
    iget-object v0, v0, LV3;->a:Lge;

    .line 24
    .line 25
    iget-object v0, v0, Lnd;->e:Ld7;

    .line 26
    .line 27
    :goto_0
    return-object v0
.end method

.method public final k(LKh;)Z
    .locals 4

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, LV3;

    .line 19
    .line 20
    iget-object v3, v1, LV3;->b:LMd;

    .line 21
    .line 22
    if-ne p1, v3, :cond_0

    .line 23
    .line 24
    iget-object p1, v1, LV3;->a:Lge;

    .line 25
    .line 26
    iget-object p1, p1, Lnd;->e:Ld7;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_1
    invoke-virtual {p1}, LMd;->hasVisibleItems()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0, p1}, LW3;->l(LMd;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, LW3;->z:Lhe;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-interface {v0, p1}, Lhe;->u(LMd;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    return v2

    .line 49
    :cond_3
    const/4 p1, 0x0

    .line 50
    return p1
.end method

.method public final l(LMd;)V
    .locals 1

    .line 1
    iget-object v0, p0, LW3;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, LMd;->b(Lie;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LW3;->b()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, LW3;->v(LMd;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, LW3;->j:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :goto_0
    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, LW3;->q:Landroid/view/View;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, LW3;->q:Landroid/view/View;

    .line 6
    .line 7
    iget v0, p0, LW3;->o:I

    .line 8
    .line 9
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {v0, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, LW3;->p:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LW3;->x:Z

    .line 2
    .line 3
    return-void
.end method

.method public final onDismiss()V
    .locals 6

    .line 1
    iget-object v0, p0, LW3;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, LV3;

    .line 16
    .line 17
    iget-object v5, v4, LV3;->a:Lge;

    .line 18
    .line 19
    iget-object v5, v5, Lnd;->A:LX1;

    .line 20
    .line 21
    invoke-virtual {v5}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-nez v5, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v4, 0x0

    .line 32
    :goto_1
    if-eqz v4, :cond_2

    .line 33
    .line 34
    iget-object v0, v4, LV3;->b:LMd;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, LMd;->c(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p1, p3, :cond_0

    .line 7
    .line 8
    const/16 p1, 0x52

    .line 9
    .line 10
    if-ne p2, p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, LW3;->dismiss()V

    .line 13
    .line 14
    .line 15
    return p3

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    return p1
.end method

.method public final p(I)V
    .locals 2

    .line 1
    iget v0, p0, LW3;->o:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, LW3;->o:I

    .line 6
    .line 7
    iget-object v0, p0, LW3;->q:Landroid/view/View;

    .line 8
    .line 9
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, LW3;->p:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final q(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LW3;->t:Z

    .line 3
    .line 4
    iput p1, p0, LW3;->v:I

    .line 5
    .line 6
    return-void
.end method

.method public final r(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3;->B:Landroid/widget/PopupWindow$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public final s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LW3;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public final t(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LW3;->u:Z

    .line 3
    .line 4
    iput p1, p0, LW3;->w:I

    .line 5
    .line 6
    return-void
.end method

.method public final v(LMd;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v3, v0, LW3;->d:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v5, LJd;

    .line 12
    .line 13
    iget-boolean v6, v0, LW3;->h:Z

    .line 14
    .line 15
    const v7, 0x7f0b000b

    .line 16
    .line 17
    .line 18
    invoke-direct {v5, v1, v4, v6, v7}, LJd;-><init>(LMd;Landroid/view/LayoutInflater;ZI)V

    .line 19
    .line 20
    .line 21
    invoke-virtual/range {p0 .. p0}, LW3;->b()Z

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    const/4 v7, 0x1

    .line 26
    if-nez v6, :cond_0

    .line 27
    .line 28
    iget-boolean v6, v0, LW3;->x:Z

    .line 29
    .line 30
    if-eqz v6, :cond_0

    .line 31
    .line 32
    iput-boolean v7, v5, LJd;->e:Z

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual/range {p0 .. p0}, LW3;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    invoke-static/range {p1 .. p1}, LYd;->u(LMd;)Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    iput-boolean v6, v5, LJd;->e:Z

    .line 46
    .line 47
    :cond_1
    :goto_0
    iget v6, v0, LW3;->e:I

    .line 48
    .line 49
    invoke-static {v5, v3, v6}, LYd;->m(Landroid/widget/ListAdapter;Landroid/content/Context;I)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    new-instance v8, Lge;

    .line 54
    .line 55
    iget v9, v0, LW3;->f:I

    .line 56
    .line 57
    iget v10, v0, LW3;->g:I

    .line 58
    .line 59
    const/4 v11, 0x0

    .line 60
    invoke-direct {v8, v3, v11, v9, v10}, Lnd;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 61
    .line 62
    .line 63
    iget-object v3, v8, Lnd;->A:LX1;

    .line 64
    .line 65
    iget-object v9, v0, LW3;->n:Li0;

    .line 66
    .line 67
    iput-object v9, v8, Lge;->E:LSd;

    .line 68
    .line 69
    iput-object v0, v8, Lnd;->r:Landroid/widget/AdapterView$OnItemClickListener;

    .line 70
    .line 71
    invoke-virtual {v3, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v9, v0, LW3;->q:Landroid/view/View;

    .line 75
    .line 76
    iput-object v9, v8, Lnd;->q:Landroid/view/View;

    .line 77
    .line 78
    iget v9, v0, LW3;->p:I

    .line 79
    .line 80
    iput v9, v8, Lnd;->n:I

    .line 81
    .line 82
    iput-boolean v7, v8, Lnd;->z:Z

    .line 83
    .line 84
    invoke-virtual {v3, v7}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 85
    .line 86
    .line 87
    const/4 v9, 0x2

    .line 88
    invoke-virtual {v3, v9}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v8, v5}, Lnd;->n(Landroid/widget/ListAdapter;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v8, v6}, Lnd;->p(I)V

    .line 95
    .line 96
    .line 97
    iget v5, v0, LW3;->p:I

    .line 98
    .line 99
    iput v5, v8, Lnd;->n:I

    .line 100
    .line 101
    iget-object v5, v0, LW3;->k:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 104
    .line 105
    .line 106
    move-result v10

    .line 107
    if-lez v10, :cond_b

    .line 108
    .line 109
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    sub-int/2addr v10, v7

    .line 114
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    check-cast v10, LV3;

    .line 119
    .line 120
    iget-object v12, v10, LV3;->b:LMd;

    .line 121
    .line 122
    iget-object v13, v12, LMd;->f:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    const/4 v14, 0x0

    .line 129
    :goto_1
    if-ge v14, v13, :cond_3

    .line 130
    .line 131
    invoke-virtual {v12, v14}, LMd;->getItem(I)Landroid/view/MenuItem;

    .line 132
    .line 133
    .line 134
    move-result-object v15

    .line 135
    invoke-interface {v15}, Landroid/view/MenuItem;->hasSubMenu()Z

    .line 136
    .line 137
    .line 138
    move-result v16

    .line 139
    if-eqz v16, :cond_2

    .line 140
    .line 141
    invoke-interface {v15}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    if-ne v1, v9, :cond_2

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_2
    add-int/2addr v14, v7

    .line 149
    const/4 v9, 0x2

    .line 150
    goto :goto_1

    .line 151
    :cond_3
    move-object v15, v11

    .line 152
    :goto_2
    if-nez v15, :cond_4

    .line 153
    .line 154
    move-object v2, v11

    .line 155
    goto :goto_7

    .line 156
    :cond_4
    iget-object v9, v10, LV3;->a:Lge;

    .line 157
    .line 158
    iget-object v9, v9, Lnd;->e:Ld7;

    .line 159
    .line 160
    invoke-virtual {v9}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 161
    .line 162
    .line 163
    move-result-object v12

    .line 164
    instance-of v13, v12, Landroid/widget/HeaderViewListAdapter;

    .line 165
    .line 166
    if-eqz v13, :cond_5

    .line 167
    .line 168
    check-cast v12, Landroid/widget/HeaderViewListAdapter;

    .line 169
    .line 170
    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getHeadersCount()I

    .line 171
    .line 172
    .line 173
    move-result v13

    .line 174
    invoke-virtual {v12}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    .line 175
    .line 176
    .line 177
    move-result-object v12

    .line 178
    check-cast v12, LJd;

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_5
    check-cast v12, LJd;

    .line 182
    .line 183
    const/4 v13, 0x0

    .line 184
    :goto_3
    invoke-virtual {v12}, LJd;->getCount()I

    .line 185
    .line 186
    .line 187
    move-result v14

    .line 188
    const/4 v11, 0x0

    .line 189
    :goto_4
    if-ge v11, v14, :cond_7

    .line 190
    .line 191
    invoke-virtual {v12, v11}, LJd;->b(I)LTd;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    if-ne v15, v2, :cond_6

    .line 196
    .line 197
    const/4 v2, -0x1

    .line 198
    goto :goto_5

    .line 199
    :cond_6
    add-int/2addr v11, v7

    .line 200
    goto :goto_4

    .line 201
    :cond_7
    const/4 v2, -0x1

    .line 202
    const/4 v11, -0x1

    .line 203
    :goto_5
    if-ne v11, v2, :cond_9

    .line 204
    .line 205
    :cond_8
    :goto_6
    const/4 v2, 0x0

    .line 206
    goto :goto_7

    .line 207
    :cond_9
    add-int/2addr v11, v13

    .line 208
    invoke-virtual {v9}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    sub-int/2addr v11, v2

    .line 213
    if-ltz v11, :cond_8

    .line 214
    .line 215
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-lt v11, v2, :cond_a

    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_a
    invoke-virtual {v9, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    goto :goto_7

    .line 227
    :cond_b
    const/4 v2, 0x0

    .line 228
    const/4 v10, 0x0

    .line 229
    :goto_7
    if-eqz v2, :cond_17

    .line 230
    .line 231
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 232
    .line 233
    const/16 v11, 0x1c

    .line 234
    .line 235
    if-gt v9, v11, :cond_d

    .line 236
    .line 237
    sget-object v9, Lge;->F:Ljava/lang/reflect/Method;

    .line 238
    .line 239
    if-eqz v9, :cond_c

    .line 240
    .line 241
    :try_start_0
    new-array v11, v7, [Ljava/lang/Object;

    .line 242
    .line 243
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 244
    .line 245
    const/4 v13, 0x0

    .line 246
    aput-object v12, v11, v13

    .line 247
    .line 248
    invoke-virtual {v9, v3, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    .line 250
    .line 251
    :cond_c
    :goto_8
    const/4 v9, 0x0

    .line 252
    goto :goto_9

    .line 253
    :catch_0
    const-string v9, "MenuPopupWindow"

    .line 254
    .line 255
    const-string v11, "Could not invoke setTouchModal() on PopupWindow. Oh well."

    .line 256
    .line 257
    invoke-static {v9, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    goto :goto_8

    .line 261
    :cond_d
    const/4 v9, 0x0

    .line 262
    invoke-static {v3, v9}, Lde;->a(Landroid/widget/PopupWindow;Z)V

    .line 263
    .line 264
    .line 265
    goto :goto_8

    .line 266
    :goto_9
    invoke-static {v3, v9}, Lce;->a(Landroid/widget/PopupWindow;Landroid/transition/Transition;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    sub-int/2addr v3, v7

    .line 274
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    check-cast v3, LV3;

    .line 279
    .line 280
    iget-object v3, v3, LV3;->a:Lge;

    .line 281
    .line 282
    iget-object v3, v3, Lnd;->e:Ld7;

    .line 283
    .line 284
    const/4 v9, 0x2

    .line 285
    new-array v11, v9, [I

    .line 286
    .line 287
    invoke-virtual {v3, v11}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 288
    .line 289
    .line 290
    new-instance v9, Landroid/graphics/Rect;

    .line 291
    .line 292
    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 293
    .line 294
    .line 295
    iget-object v12, v0, LW3;->r:Landroid/view/View;

    .line 296
    .line 297
    invoke-virtual {v12, v9}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 298
    .line 299
    .line 300
    iget v12, v0, LW3;->s:I

    .line 301
    .line 302
    const/16 v17, 0x0

    .line 303
    .line 304
    if-ne v12, v7, :cond_f

    .line 305
    .line 306
    aget v11, v11, v17

    .line 307
    .line 308
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 309
    .line 310
    .line 311
    move-result v3

    .line 312
    add-int/2addr v3, v11

    .line 313
    add-int/2addr v3, v6

    .line 314
    iget v9, v9, Landroid/graphics/Rect;->right:I

    .line 315
    .line 316
    if-le v3, v9, :cond_e

    .line 317
    .line 318
    move/from16 v3, v17

    .line 319
    .line 320
    goto :goto_b

    .line 321
    :cond_e
    :goto_a
    move v3, v7

    .line 322
    goto :goto_b

    .line 323
    :cond_f
    aget v3, v11, v17

    .line 324
    .line 325
    sub-int/2addr v3, v6

    .line 326
    if-gez v3, :cond_10

    .line 327
    .line 328
    goto :goto_a

    .line 329
    :cond_10
    const/4 v3, 0x0

    .line 330
    :goto_b
    if-ne v3, v7, :cond_11

    .line 331
    .line 332
    move v13, v7

    .line 333
    goto :goto_c

    .line 334
    :cond_11
    const/4 v13, 0x0

    .line 335
    :goto_c
    iput v3, v0, LW3;->s:I

    .line 336
    .line 337
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 338
    .line 339
    const/16 v9, 0x1a

    .line 340
    .line 341
    const/4 v11, 0x5

    .line 342
    if-lt v3, v9, :cond_12

    .line 343
    .line 344
    iput-object v2, v8, Lnd;->q:Landroid/view/View;

    .line 345
    .line 346
    const/4 v3, 0x0

    .line 347
    const/4 v12, 0x0

    .line 348
    goto :goto_e

    .line 349
    :cond_12
    const/4 v3, 0x2

    .line 350
    new-array v9, v3, [I

    .line 351
    .line 352
    iget-object v12, v0, LW3;->q:Landroid/view/View;

    .line 353
    .line 354
    invoke-virtual {v12, v9}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 355
    .line 356
    .line 357
    new-array v3, v3, [I

    .line 358
    .line 359
    invoke-virtual {v2, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 360
    .line 361
    .line 362
    iget v12, v0, LW3;->p:I

    .line 363
    .line 364
    and-int/lit8 v12, v12, 0x7

    .line 365
    .line 366
    if-ne v12, v11, :cond_13

    .line 367
    .line 368
    const/4 v12, 0x0

    .line 369
    aget v14, v9, v12

    .line 370
    .line 371
    iget-object v15, v0, LW3;->q:Landroid/view/View;

    .line 372
    .line 373
    invoke-virtual {v15}, Landroid/view/View;->getWidth()I

    .line 374
    .line 375
    .line 376
    move-result v15

    .line 377
    add-int/2addr v15, v14

    .line 378
    aput v15, v9, v12

    .line 379
    .line 380
    aget v14, v3, v12

    .line 381
    .line 382
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 383
    .line 384
    .line 385
    move-result v15

    .line 386
    add-int/2addr v15, v14

    .line 387
    aput v15, v3, v12

    .line 388
    .line 389
    goto :goto_d

    .line 390
    :cond_13
    const/4 v12, 0x0

    .line 391
    :goto_d
    aget v14, v3, v12

    .line 392
    .line 393
    aget v15, v9, v12

    .line 394
    .line 395
    sub-int v12, v14, v15

    .line 396
    .line 397
    aget v3, v3, v7

    .line 398
    .line 399
    aget v9, v9, v7

    .line 400
    .line 401
    sub-int/2addr v3, v9

    .line 402
    :goto_e
    iget v9, v0, LW3;->p:I

    .line 403
    .line 404
    and-int/2addr v9, v11

    .line 405
    if-ne v9, v11, :cond_15

    .line 406
    .line 407
    if-eqz v13, :cond_14

    .line 408
    .line 409
    add-int/2addr v12, v6

    .line 410
    goto :goto_f

    .line 411
    :cond_14
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 412
    .line 413
    .line 414
    move-result v2

    .line 415
    sub-int/2addr v12, v2

    .line 416
    goto :goto_f

    .line 417
    :cond_15
    if-eqz v13, :cond_16

    .line 418
    .line 419
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 420
    .line 421
    .line 422
    move-result v2

    .line 423
    add-int/2addr v12, v2

    .line 424
    goto :goto_f

    .line 425
    :cond_16
    sub-int/2addr v12, v6

    .line 426
    :goto_f
    iput v12, v8, Lnd;->h:I

    .line 427
    .line 428
    iput-boolean v7, v8, Lnd;->m:Z

    .line 429
    .line 430
    iput-boolean v7, v8, Lnd;->l:Z

    .line 431
    .line 432
    invoke-virtual {v8, v3}, Lnd;->m(I)V

    .line 433
    .line 434
    .line 435
    goto :goto_11

    .line 436
    :cond_17
    iget-boolean v2, v0, LW3;->t:Z

    .line 437
    .line 438
    if-eqz v2, :cond_18

    .line 439
    .line 440
    iget v2, v0, LW3;->v:I

    .line 441
    .line 442
    iput v2, v8, Lnd;->h:I

    .line 443
    .line 444
    :cond_18
    iget-boolean v2, v0, LW3;->u:Z

    .line 445
    .line 446
    if-eqz v2, :cond_19

    .line 447
    .line 448
    iget v2, v0, LW3;->w:I

    .line 449
    .line 450
    invoke-virtual {v8, v2}, Lnd;->m(I)V

    .line 451
    .line 452
    .line 453
    :cond_19
    iget-object v2, v0, LYd;->c:Landroid/graphics/Rect;

    .line 454
    .line 455
    if-eqz v2, :cond_1a

    .line 456
    .line 457
    new-instance v9, Landroid/graphics/Rect;

    .line 458
    .line 459
    invoke-direct {v9, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 460
    .line 461
    .line 462
    goto :goto_10

    .line 463
    :cond_1a
    const/4 v9, 0x0

    .line 464
    :goto_10
    iput-object v9, v8, Lnd;->y:Landroid/graphics/Rect;

    .line 465
    .line 466
    :goto_11
    new-instance v2, LV3;

    .line 467
    .line 468
    iget v3, v0, LW3;->s:I

    .line 469
    .line 470
    invoke-direct {v2, v8, v1, v3}, LV3;-><init>(Lge;LMd;I)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    invoke-virtual {v8}, Lnd;->f()V

    .line 477
    .line 478
    .line 479
    iget-object v2, v8, Lnd;->e:Ld7;

    .line 480
    .line 481
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 482
    .line 483
    .line 484
    if-nez v10, :cond_1b

    .line 485
    .line 486
    iget-boolean v3, v0, LW3;->y:Z

    .line 487
    .line 488
    if-eqz v3, :cond_1b

    .line 489
    .line 490
    iget-object v3, v1, LMd;->m:Ljava/lang/CharSequence;

    .line 491
    .line 492
    if-eqz v3, :cond_1b

    .line 493
    .line 494
    const v3, 0x7f0b0012

    .line 495
    .line 496
    .line 497
    const/4 v5, 0x0

    .line 498
    invoke-virtual {v4, v3, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v3

    .line 502
    check-cast v3, Landroid/widget/FrameLayout;

    .line 503
    .line 504
    const v4, 0x1020016

    .line 505
    .line 506
    .line 507
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object v4

    .line 511
    check-cast v4, Landroid/widget/TextView;

    .line 512
    .line 513
    invoke-virtual {v3, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 514
    .line 515
    .line 516
    iget-object v1, v1, LMd;->m:Ljava/lang/CharSequence;

    .line 517
    .line 518
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 519
    .line 520
    .line 521
    const/4 v1, 0x0

    .line 522
    invoke-virtual {v2, v3, v1, v5}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 523
    .line 524
    .line 525
    invoke-virtual {v8}, Lnd;->f()V

    .line 526
    .line 527
    .line 528
    :cond_1b
    return-void
.end method
