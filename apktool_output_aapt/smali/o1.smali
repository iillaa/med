.class public final Lo1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:LP1;

.field public c:I

.field public d:Lsi;

.field public e:Lsi;

.field public f:Lsi;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lo1;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Lo1;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {}, LP1;->a()LP1;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lo1;->b:LP1;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    iget-object v0, p0, Lo1;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_6

    .line 8
    .line 9
    iget-object v2, p0, Lo1;->d:Lsi;

    .line 10
    .line 11
    if-eqz v2, :cond_4

    .line 12
    .line 13
    iget-object v2, p0, Lo1;->f:Lsi;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Lsi;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lo1;->f:Lsi;

    .line 23
    .line 24
    :cond_0
    iget-object v2, p0, Lo1;->f:Lsi;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    iput-object v3, v2, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    iput-boolean v4, v2, Lsi;->d:Z

    .line 31
    .line 32
    iput-object v3, v2, Lsi;->b:Landroid/graphics/PorterDuff$Mode;

    .line 33
    .line 34
    iput-boolean v4, v2, Lsi;->c:Z

    .line 35
    .line 36
    sget-object v3, LLj;->a:Ljava/util/WeakHashMap;

    .line 37
    .line 38
    invoke-static {v0}, LEj;->c(Landroid/view/View;)Landroid/content/res/ColorStateList;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/4 v4, 0x1

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    iput-boolean v4, v2, Lsi;->d:Z

    .line 46
    .line 47
    iput-object v3, v2, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 48
    .line 49
    :cond_1
    invoke-static {v0}, LEj;->d(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    iput-boolean v4, v2, Lsi;->c:Z

    .line 56
    .line 57
    iput-object v3, v2, Lsi;->b:Landroid/graphics/PorterDuff$Mode;

    .line 58
    .line 59
    :cond_2
    iget-boolean v3, v2, Lsi;->d:Z

    .line 60
    .line 61
    if-nez v3, :cond_3

    .line 62
    .line 63
    iget-boolean v3, v2, Lsi;->c:Z

    .line 64
    .line 65
    if-eqz v3, :cond_4

    .line 66
    .line 67
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v1, v2, v0}, LP1;->d(Landroid/graphics/drawable/Drawable;Lsi;[I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    iget-object v2, p0, Lo1;->e:Lsi;

    .line 76
    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v1, v2, v0}, LP1;->d(Landroid/graphics/drawable/Drawable;Lsi;[I)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    iget-object v2, p0, Lo1;->d:Lsi;

    .line 88
    .line 89
    if-eqz v2, :cond_6

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v1, v2, v0}, LP1;->d(Landroid/graphics/drawable/Drawable;Lsi;[I)V

    .line 96
    .line 97
    .line 98
    :cond_6
    :goto_0
    return-void
.end method

.method public final b()Landroid/content/res/ColorStateList;
    .locals 1

    .line 1
    iget-object v0, p0, Lo1;->e:Lsi;

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

.method public final c()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    .line 1
    iget-object v0, p0, Lo1;->e:Lsi;

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

.method public final d(Landroid/util/AttributeSet;I)V
    .locals 11

    .line 1
    iget-object v0, p0, Lo1;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v4, LNf;->z:[I

    .line 8
    .line 9
    const/4 v9, 0x0

    .line 10
    invoke-static {v1, p1, v4, p2, v9}, LN2;->o(Landroid/content/Context;Landroid/util/AttributeSet;[III)LN2;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, v1, LN2;->a:Ljava/lang/Object;

    .line 15
    .line 16
    move-object v10, v2

    .line 17
    check-cast v10, Landroid/content/res/TypedArray;

    .line 18
    .line 19
    iget-object v2, p0, Lo1;->a:Landroid/view/View;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const/4 v8, 0x0

    .line 26
    iget-object v5, v1, LN2;->a:Ljava/lang/Object;

    .line 27
    .line 28
    move-object v6, v5

    .line 29
    check-cast v6, Landroid/content/res/TypedArray;

    .line 30
    .line 31
    move-object v5, p1

    .line 32
    move v7, p2

    .line 33
    invoke-static/range {v2 .. v8}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-virtual {v10, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 p2, -0x1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v10, v9, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lo1;->c:I

    .line 48
    .line 49
    iget-object p1, p0, Lo1;->b:LP1;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v3, p0, Lo1;->c:I

    .line 56
    .line 57
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :try_start_1
    iget-object v4, p1, LP1;->a:Lig;

    .line 59
    .line 60
    invoke-virtual {v4, v2, v3}, Lig;->i(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 61
    .line 62
    .line 63
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    :try_start_2
    monitor-exit p1

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    invoke-virtual {p0, v2}, Lo1;->g(Landroid/content/res/ColorStateList;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception p1

    .line 72
    goto :goto_1

    .line 73
    :catchall_1
    move-exception p2

    .line 74
    monitor-exit p1

    .line 75
    throw p2

    .line 76
    :cond_0
    :goto_0
    const/4 p1, 0x1

    .line 77
    invoke-virtual {v10, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_1

    .line 82
    .line 83
    invoke-virtual {v1, p1}, LN2;->i(I)Landroid/content/res/ColorStateList;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {v0, p1}, LEj;->f(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    const/4 p1, 0x2

    .line 91
    invoke-virtual {v10, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    invoke-virtual {v10, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const/4 p2, 0x0

    .line 102
    invoke-static {p1, p2}, LX6;->b(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {v0, p1}, LEj;->g(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    .line 108
    .line 109
    :cond_2
    invoke-virtual {v1}, LN2;->p()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :goto_1
    invoke-virtual {v1}, LN2;->p()V

    .line 114
    .line 115
    .line 116
    throw p1
.end method

.method public final e()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lo1;->c:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lo1;->g(Landroid/content/res/ColorStateList;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lo1;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f(I)V
    .locals 3

    .line 1
    iput p1, p0, Lo1;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Lo1;->b:LP1;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lo1;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v2, v0, LP1;->a:Lig;

    .line 15
    .line 16
    invoke-virtual {v2, v1, p1}, Lig;->i(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit v0

    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    monitor-exit v0

    .line 24
    throw p1

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Lo1;->g(Landroid/content/res/ColorStateList;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lo1;->a()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lo1;->d:Lsi;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lsi;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lo1;->d:Lsi;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lo1;->d:Lsi;

    .line 15
    .line 16
    iput-object p1, v0, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, v0, Lsi;->d:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lo1;->d:Lsi;

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p0}, Lo1;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final h(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lo1;->e:Lsi;

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
    iput-object v0, p0, Lo1;->e:Lsi;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lo1;->e:Lsi;

    .line 13
    .line 14
    iput-object p1, v0, Lsi;->a:Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Lsi;->d:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Lo1;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final i(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lo1;->e:Lsi;

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
    iput-object v0, p0, Lo1;->e:Lsi;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lo1;->e:Lsi;

    .line 13
    .line 14
    iput-object p1, v0, Lsi;->b:Landroid/graphics/PorterDuff$Mode;

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, v0, Lsi;->c:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Lo1;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
