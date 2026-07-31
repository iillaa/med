.class public LM0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, LM0;->a:I

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, LM0;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-lez p1, :cond_0

    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, LM0;->b:Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The max pool size must be > 0"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x0

    invoke-static {p1, v0}, LN0;->g(Landroid/content/Context;I)I

    move-result v0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, LI0;

    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-static {p1, v0}, LN0;->g(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, p1, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v2}, LI0;-><init>(Landroid/view/ContextThemeWrapper;)V

    iput-object v1, p0, LM0;->b:Ljava/lang/Object;

    iput v0, p0, LM0;->a:I

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, LM0;->a:I

    iput-object p1, p0, LM0;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, LM0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    iget-object v2, p0, LM0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, [Ljava/lang/Object;

    .line 11
    .line 12
    aget-object v3, v2, v0

    .line 13
    .line 14
    const-string v4, "null cannot be cast to non-null type T of androidx.core.util.Pools.SimplePool"

    .line 15
    .line 16
    invoke-static {v4, v3}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    aput-object v1, v2, v0

    .line 20
    .line 21
    iget v0, p0, LM0;->a:I

    .line 22
    .line 23
    add-int/lit8 v0, v0, -0x1

    .line 24
    .line 25
    iput v0, p0, LM0;->a:I

    .line 26
    .line 27
    return-object v3

    .line 28
    :cond_0
    return-object v1
.end method

.method public b()LN0;
    .locals 10

    .line 1
    new-instance v0, LN0;

    .line 2
    .line 3
    iget-object v1, p0, LM0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, LI0;

    .line 6
    .line 7
    iget-object v2, v1, LI0;->a:Landroid/content/Context;

    .line 8
    .line 9
    iget v3, p0, LM0;->a:I

    .line 10
    .line 11
    check-cast v2, Landroid/view/ContextThemeWrapper;

    .line 12
    .line 13
    invoke-direct {v0, v2, v3}, LN0;-><init>(Landroid/view/ContextThemeWrapper;I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, v1, LI0;->e:Landroid/view/View;

    .line 17
    .line 18
    iget-object v3, v0, LN0;->h:LL0;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iput-object v2, v3, LL0;->o:Landroid/view/View;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v2, v1, LI0;->d:Ljava/lang/CharSequence;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iput-object v2, v3, LL0;->d:Ljava/lang/CharSequence;

    .line 30
    .line 31
    iget-object v4, v3, LL0;->m:Landroid/widget/TextView;

    .line 32
    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v2, v1, LI0;->c:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    iput-object v2, v3, LL0;->k:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    iput v4, v3, LL0;->j:I

    .line 46
    .line 47
    iget-object v5, v3, LL0;->l:Landroid/widget/ImageView;

    .line 48
    .line 49
    if-eqz v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object v4, v3, LL0;->l:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    iget-object v2, v1, LI0;->g:Landroid/widget/ListAdapter;

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    const/4 v5, 0x0

    .line 63
    if-eqz v2, :cond_7

    .line 64
    .line 65
    iget v2, v3, LL0;->s:I

    .line 66
    .line 67
    iget-object v6, v1, LI0;->b:Landroid/view/LayoutInflater;

    .line 68
    .line 69
    invoke-virtual {v6, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 74
    .line 75
    iget-boolean v6, v1, LI0;->i:Z

    .line 76
    .line 77
    if-eqz v6, :cond_3

    .line 78
    .line 79
    iget v6, v3, LL0;->t:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    iget v6, v3, LL0;->u:I

    .line 83
    .line 84
    :goto_1
    iget-object v7, v1, LI0;->g:Landroid/widget/ListAdapter;

    .line 85
    .line 86
    if-eqz v7, :cond_4

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    new-instance v7, LK0;

    .line 90
    .line 91
    iget-object v8, v1, LI0;->a:Landroid/content/Context;

    .line 92
    .line 93
    const v9, 0x1020014

    .line 94
    .line 95
    .line 96
    invoke-direct {v7, v8, v6, v9, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :goto_2
    iput-object v7, v3, LL0;->p:Landroid/widget/ListAdapter;

    .line 100
    .line 101
    iget v6, v1, LI0;->j:I

    .line 102
    .line 103
    iput v6, v3, LL0;->q:I

    .line 104
    .line 105
    iget-object v6, v1, LI0;->h:Landroid/content/DialogInterface$OnClickListener;

    .line 106
    .line 107
    if-eqz v6, :cond_5

    .line 108
    .line 109
    new-instance v6, LH0;

    .line 110
    .line 111
    invoke-direct {v6, v1, v3}, LH0;-><init>(LI0;LL0;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, v6}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    iget-boolean v6, v1, LI0;->i:Z

    .line 118
    .line 119
    if-eqz v6, :cond_6

    .line 120
    .line 121
    invoke-virtual {v2, v4}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    .line 122
    .line 123
    .line 124
    :cond_6
    iput-object v2, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 125
    .line 126
    :cond_7
    invoke-virtual {v0, v4}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v4}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, v1, LI0;->f:Landroid/content/DialogInterface$OnKeyListener;

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 143
    .line 144
    .line 145
    :cond_8
    return-object v0
.end method

.method public c(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    iget v0, p0, LM0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/4 v3, 0x1

    .line 6
    iget-object v4, p0, LM0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v4, [Ljava/lang/Object;

    .line 9
    .line 10
    if-ge v2, v0, :cond_1

    .line 11
    .line 12
    aget-object v5, v4, v2

    .line 13
    .line 14
    if-ne v5, p1, :cond_0

    .line 15
    .line 16
    move v0, v3

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v0, v1

    .line 22
    :goto_1
    xor-int/2addr v0, v3

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget v0, p0, LM0;->a:I

    .line 26
    .line 27
    array-length v2, v4

    .line 28
    if-ge v0, v2, :cond_2

    .line 29
    .line 30
    aput-object p1, v4, v0

    .line 31
    .line 32
    add-int/2addr v0, v3

    .line 33
    iput v0, p0, LM0;->a:I

    .line 34
    .line 35
    return v3

    .line 36
    :cond_2
    return v1

    .line 37
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    const-string v0, "Already in the pool!"

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw p1
.end method
