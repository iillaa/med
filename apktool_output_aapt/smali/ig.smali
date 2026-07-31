.class public final Lig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Landroid/graphics/PorterDuff$Mode;

.field public static i:Lig;

.field public static final j:Lgg;


# instance fields
.field public a:Ljava/util/WeakHashMap;

.field public b:Lhh;

.field public c:Lnh;

.field public final d:Ljava/util/WeakHashMap;

.field public e:Landroid/util/TypedValue;

.field public f:Z

.field public g:LO1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lig;->h:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    new-instance v0, Lgg;

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-direct {v0, v1}, LGd;-><init>(I)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lig;->j:Lgg;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lig;->d:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    return-void
.end method

.method public static declared-synchronized d()Lig;
    .locals 2

    .line 1
    const-class v0, Lig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lig;->i:Lig;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lig;

    .line 9
    .line 10
    invoke-direct {v1}, Lig;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lig;->i:Lig;

    .line 14
    .line 15
    invoke-static {v1}, Lig;->j(Lig;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    sget-object v1, Lig;->i:Lig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-object v1

    .line 25
    :goto_1
    monitor-exit v0

    .line 26
    throw v1
.end method

.method public static declared-synchronized h(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .locals 4

    .line 1
    const-class v0, Lig;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lig;->j:Lgg;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const/16 v2, 0x1f

    .line 10
    .line 11
    add-int v3, v2, p0

    .line 12
    .line 13
    mul-int/2addr v3, v2

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, v3

    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, LGd;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/graphics/PorterDuffColorFilter;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/2addr p0, v3

    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0, v2}, LGd;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Landroid/graphics/PorterDuffColorFilter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    monitor-exit v0

    .line 55
    return-object v2

    .line 56
    :goto_1
    monitor-exit v0

    .line 57
    throw p0
.end method

.method public static j(Lig;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Lhg;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-direct {v0, v1}, Lhg;-><init>(I)V

    .line 11
    .line 12
    .line 13
    const-string v1, "vector"

    .line 14
    .line 15
    invoke-virtual {p0, v1, v0}, Lig;->a(Ljava/lang/String;Lhg;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lhg;

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-direct {v0, v1}, Lhg;-><init>(I)V

    .line 22
    .line 23
    .line 24
    const-string v1, "animated-vector"

    .line 25
    .line 26
    invoke-virtual {p0, v1, v0}, Lig;->a(Ljava/lang/String;Lhg;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Lhg;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-direct {v0, v1}, Lhg;-><init>(I)V

    .line 33
    .line 34
    .line 35
    const-string v1, "animated-selector"

    .line 36
    .line 37
    invoke-virtual {p0, v1, v0}, Lig;->a(Ljava/lang/String;Lhg;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lhg;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1}, Lhg;-><init>(I)V

    .line 44
    .line 45
    .line 46
    const-string v1, "drawable"

    .line 47
    .line 48
    invoke-virtual {p0, v1, v0}, Lig;->a(Ljava/lang/String;Lhg;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lhg;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lig;->b:Lhh;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lhh;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1}, Lhh;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lig;->b:Lhh;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lig;->b:Lhh;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final declared-synchronized b(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 3
    .line 4
    .line 5
    move-result-object p4

    .line 6
    if-eqz p4, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lig;->d:Ljava/util/WeakHashMap;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, LFd;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, LFd;

    .line 19
    .line 20
    invoke-direct {v0}, LFd;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lig;->d:Ljava/util/WeakHashMap;

    .line 24
    .line 25
    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p2, p3, p1}, LFd;->d(JLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :cond_1
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit p0

    .line 44
    throw p1
.end method

.method public final c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lig;->e:Landroid/util/TypedValue;

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    new-instance v1, Landroid/util/TypedValue;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lig;->e:Landroid/util/TypedValue;

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Lig;->e:Landroid/util/TypedValue;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, p2, v1, v0}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 20
    .line 21
    .line 22
    iget v2, v1, Landroid/util/TypedValue;->assetCookie:I

    .line 23
    .line 24
    int-to-long v2, v2

    .line 25
    const/16 v4, 0x20

    .line 26
    .line 27
    shl-long/2addr v2, v4

    .line 28
    iget v4, v1, Landroid/util/TypedValue;->data:I

    .line 29
    .line 30
    int-to-long v4, v4

    .line 31
    or-long/2addr v2, v4

    .line 32
    invoke-virtual {p0, p1, v2, v3}, Lig;->e(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    return-object v4

    .line 39
    :cond_1
    iget-object v4, p0, Lig;->g:LO1;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    const v4, 0x7f070011

    .line 46
    .line 47
    .line 48
    if-ne p2, v4, :cond_3

    .line 49
    .line 50
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    .line 51
    .line 52
    const p2, 0x7f070010

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1, p2}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const v4, 0x7f070012

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1, v4}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const/4 v6, 0x2

    .line 67
    new-array v6, v6, [Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    aput-object p2, v6, v7

    .line 71
    .line 72
    aput-object v4, v6, v0

    .line 73
    .line 74
    invoke-direct {v5, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    const v0, 0x7f070034

    .line 79
    .line 80
    .line 81
    if-ne p2, v0, :cond_4

    .line 82
    .line 83
    const p2, 0x7f06003b

    .line 84
    .line 85
    .line 86
    :goto_0
    invoke-static {p0, p1, p2}, LO1;->c(Lig;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    goto :goto_1

    .line 91
    :cond_4
    const v0, 0x7f070033

    .line 92
    .line 93
    .line 94
    if-ne p2, v0, :cond_5

    .line 95
    .line 96
    const p2, 0x7f06003c

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    const v0, 0x7f070035

    .line 101
    .line 102
    .line 103
    if-ne p2, v0, :cond_6

    .line 104
    .line 105
    const p2, 0x7f06003d

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_6
    :goto_1
    if-eqz v5, :cond_7

    .line 110
    .line 111
    iget p2, v1, Landroid/util/TypedValue;->changingConfigurations:I

    .line 112
    .line 113
    invoke-virtual {v5, p2}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1, v2, v3, v5}, Lig;->b(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    :cond_7
    return-object v5
.end method

.method public final declared-synchronized e(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lig;->d:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, LFd;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-object v1

    .line 15
    :cond_0
    :try_start_1
    iget-object v2, v0, LFd;->b:[J

    .line 16
    .line 17
    iget v3, v0, LFd;->d:I

    .line 18
    .line 19
    invoke-static {v2, v3, p2, p3}, Lu6;->g([JIJ)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ltz v2, :cond_1

    .line 24
    .line 25
    iget-object v3, v0, LFd;->c:[Ljava/lang/Object;

    .line 26
    .line 27
    aget-object v2, v3, v2

    .line 28
    .line 29
    sget-object v3, Llc;->d:Ljava/lang/Object;

    .line 30
    .line 31
    if-ne v2, v3, :cond_2

    .line 32
    .line 33
    :cond_1
    move-object v2, v1

    .line 34
    :cond_2
    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    if-eqz v2, :cond_4

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 43
    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    monitor-exit p0

    .line 55
    return-object p1

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    :try_start_2
    iget-object p1, v0, LFd;->b:[J

    .line 59
    .line 60
    iget v2, v0, LFd;->d:I

    .line 61
    .line 62
    invoke-static {p1, v2, p2, p3}, Lu6;->g([JIJ)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-ltz p1, :cond_4

    .line 67
    .line 68
    iget-object p2, v0, LFd;->c:[Ljava/lang/Object;

    .line 69
    .line 70
    aget-object p3, p2, p1

    .line 71
    .line 72
    sget-object v2, Llc;->d:Ljava/lang/Object;

    .line 73
    .line 74
    if-eq p3, v2, :cond_4

    .line 75
    .line 76
    aput-object v2, p2, p1

    .line 77
    .line 78
    const/4 p1, 0x1

    .line 79
    iput-boolean p1, v0, LFd;->a:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    .line 81
    :cond_4
    monitor-exit p0

    .line 82
    return-object v1

    .line 83
    :goto_0
    monitor-exit p0

    .line 84
    throw p1
.end method

.method public final declared-synchronized f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lig;->g(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    monitor-exit p0

    .line 8
    return-object p1

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0

    .line 11
    throw p1
.end method

.method public final declared-synchronized g(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;
    .locals 11

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lig;->f:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-boolean v1, p0, Lig;->f:Z

    .line 9
    .line 10
    const v0, 0x7f07004f

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1a

    .line 18
    .line 19
    instance-of v2, v0, Lsj;

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "android.graphics.drawable.VectorDrawable"

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1a

    .line 38
    .line 39
    :cond_1
    :goto_0
    iget-object v0, p0, Lig;->b:Lhh;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v0, :cond_4

    .line 43
    .line 44
    invoke-virtual {v0}, Lhh;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    iget-object v0, p0, Lig;->c:Lnh;

    .line 51
    .line 52
    const-string v3, "appcompat_skip_skip"

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    iget-object v4, v0, Lnh;->a:[I

    .line 57
    .line 58
    iget v5, v0, Lnh;->c:I

    .line 59
    .line 60
    invoke-static {v5, p2, v4}, Lu6;->f(II[I)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-ltz v4, :cond_2

    .line 65
    .line 66
    iget-object v0, v0, Lnh;->b:[Ljava/lang/Object;

    .line 67
    .line 68
    aget-object v0, v0, v4

    .line 69
    .line 70
    sget-object v4, LMk;->g:Ljava/lang/Object;

    .line 71
    .line 72
    if-ne v0, v4, :cond_3

    .line 73
    .line 74
    :cond_2
    move-object v0, v2

    .line 75
    :cond_3
    check-cast v0, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_4

    .line 82
    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    iget-object v4, p0, Lig;->b:Lhh;

    .line 86
    .line 87
    invoke-virtual {v4, v0}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    if-nez v0, :cond_6

    .line 92
    .line 93
    :cond_4
    move-object v7, v2

    .line 94
    goto/16 :goto_5

    .line 95
    .line 96
    :cond_5
    new-instance v0, Lnh;

    .line 97
    .line 98
    invoke-direct {v0}, Lnh;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lig;->c:Lnh;

    .line 102
    .line 103
    :cond_6
    iget-object v0, p0, Lig;->e:Landroid/util/TypedValue;

    .line 104
    .line 105
    if-nez v0, :cond_7

    .line 106
    .line 107
    new-instance v0, Landroid/util/TypedValue;

    .line 108
    .line 109
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lig;->e:Landroid/util/TypedValue;

    .line 113
    .line 114
    :cond_7
    iget-object v0, p0, Lig;->e:Landroid/util/TypedValue;

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v4, p2, v0, v1}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 121
    .line 122
    .line 123
    iget v5, v0, Landroid/util/TypedValue;->assetCookie:I

    .line 124
    .line 125
    int-to-long v5, v5

    .line 126
    const/16 v7, 0x20

    .line 127
    .line 128
    shl-long/2addr v5, v7

    .line 129
    iget v7, v0, Landroid/util/TypedValue;->data:I

    .line 130
    .line 131
    int-to-long v7, v7

    .line 132
    or-long/2addr v5, v7

    .line 133
    invoke-virtual {p0, p1, v5, v6}, Lig;->e(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    if-eqz v7, :cond_8

    .line 138
    .line 139
    goto :goto_5

    .line 140
    :cond_8
    iget-object v8, v0, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    .line 141
    .line 142
    if-eqz v8, :cond_c

    .line 143
    .line 144
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    const-string v9, ".xml"

    .line 149
    .line 150
    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    if-eqz v8, :cond_c

    .line 155
    .line 156
    :try_start_1
    invoke-virtual {v4, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-static {v4}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 161
    .line 162
    .line 163
    move-result-object v8

    .line 164
    :goto_1
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    const/4 v10, 0x2

    .line 169
    if-eq v9, v10, :cond_9

    .line 170
    .line 171
    if-eq v9, v1, :cond_9

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_9
    if-ne v9, v10, :cond_b

    .line 175
    .line 176
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iget-object v9, p0, Lig;->c:Lnh;

    .line 181
    .line 182
    invoke-virtual {v9, p2, v1}, Lnh;->a(ILjava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    iget-object v9, p0, Lig;->b:Lhh;

    .line 186
    .line 187
    invoke-virtual {v9, v1}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Lhg;

    .line 192
    .line 193
    if-eqz v1, :cond_a

    .line 194
    .line 195
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 196
    .line 197
    .line 198
    move-result-object v9

    .line 199
    invoke-virtual {v1, p1, v4, v8, v9}, Lhg;->a(Landroid/content/Context;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 200
    .line 201
    .line 202
    move-result-object v7

    .line 203
    goto :goto_2

    .line 204
    :catch_0
    move-exception v0

    .line 205
    goto :goto_3

    .line 206
    :cond_a
    :goto_2
    if-eqz v7, :cond_c

    .line 207
    .line 208
    iget v0, v0, Landroid/util/TypedValue;->changingConfigurations:I

    .line 209
    .line 210
    invoke-virtual {v7, v0}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, p1, v5, v6, v7}, Lig;->b(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)V

    .line 214
    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_b
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 218
    .line 219
    const-string v1, "No start tag found"

    .line 220
    .line 221
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 225
    :goto_3
    :try_start_2
    const-string v1, "ResourceManagerInternal"

    .line 226
    .line 227
    const-string v4, "Exception while inflating drawable"

    .line 228
    .line 229
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 230
    .line 231
    .line 232
    :cond_c
    :goto_4
    if-nez v7, :cond_d

    .line 233
    .line 234
    iget-object v0, p0, Lig;->c:Lnh;

    .line 235
    .line 236
    invoke-virtual {v0, p2, v3}, Lnh;->a(ILjava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    :cond_d
    :goto_5
    if-nez v7, :cond_e

    .line 240
    .line 241
    invoke-virtual {p0, p1, p2}, Lig;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    goto :goto_6

    .line 246
    :catchall_0
    move-exception p1

    .line 247
    goto/16 :goto_b

    .line 248
    .line 249
    :cond_e
    :goto_6
    if-nez v7, :cond_f

    .line 250
    .line 251
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    :cond_f
    if-eqz v7, :cond_18

    .line 256
    .line 257
    invoke-virtual {p0, p1, p2}, Lig;->i(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    if-eqz v0, :cond_13

    .line 262
    .line 263
    sget-object p1, LX6;->a:[I

    .line 264
    .line 265
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 270
    .line 271
    .line 272
    iget-object p3, p0, Lig;->g:LO1;

    .line 273
    .line 274
    if-nez p3, :cond_10

    .line 275
    .line 276
    goto :goto_7

    .line 277
    :cond_10
    const p3, 0x7f070042

    .line 278
    .line 279
    .line 280
    if-ne p2, p3, :cond_11

    .line 281
    .line 282
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 283
    .line 284
    :cond_11
    :goto_7
    if-eqz v2, :cond_12

    .line 285
    .line 286
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 287
    .line 288
    .line 289
    :cond_12
    move-object v2, p1

    .line 290
    goto/16 :goto_a

    .line 291
    .line 292
    :cond_13
    iget-object v0, p0, Lig;->g:LO1;

    .line 293
    .line 294
    if-eqz v0, :cond_16

    .line 295
    .line 296
    const v0, 0x7f07003d

    .line 297
    .line 298
    .line 299
    const v1, 0x102000d

    .line 300
    .line 301
    .line 302
    const v3, 0x102000f

    .line 303
    .line 304
    .line 305
    const/high16 v4, 0x1020000

    .line 306
    .line 307
    const v5, 0x7f030054

    .line 308
    .line 309
    .line 310
    const v6, 0x7f030056

    .line 311
    .line 312
    .line 313
    if-ne p2, v0, :cond_14

    .line 314
    .line 315
    move-object p2, v7

    .line 316
    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    .line 317
    .line 318
    invoke-virtual {p2, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 319
    .line 320
    .line 321
    move-result-object p3

    .line 322
    invoke-static {p1, v6}, Lki;->c(Landroid/content/Context;I)I

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    sget-object v2, LP1;->b:Landroid/graphics/PorterDuff$Mode;

    .line 327
    .line 328
    invoke-static {p3, v0}, LO1;->e(Landroid/graphics/drawable/Drawable;I)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p2, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 332
    .line 333
    .line 334
    move-result-object p3

    .line 335
    invoke-static {p1, v6}, Lki;->c(Landroid/content/Context;I)I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    invoke-static {p3, v0}, LO1;->e(Landroid/graphics/drawable/Drawable;I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p2, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 343
    .line 344
    .line 345
    move-result-object p2

    .line 346
    invoke-static {p1, v5}, Lki;->c(Landroid/content/Context;I)I

    .line 347
    .line 348
    .line 349
    move-result p1

    .line 350
    :goto_8
    invoke-static {p2, p1}, LO1;->e(Landroid/graphics/drawable/Drawable;I)V

    .line 351
    .line 352
    .line 353
    goto :goto_9

    .line 354
    :cond_14
    const v0, 0x7f070034

    .line 355
    .line 356
    .line 357
    if-eq p2, v0, :cond_15

    .line 358
    .line 359
    const v0, 0x7f070033

    .line 360
    .line 361
    .line 362
    if-eq p2, v0, :cond_15

    .line 363
    .line 364
    const v0, 0x7f070035

    .line 365
    .line 366
    .line 367
    if-ne p2, v0, :cond_16

    .line 368
    .line 369
    :cond_15
    move-object p2, v7

    .line 370
    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    .line 371
    .line 372
    invoke-virtual {p2, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 373
    .line 374
    .line 375
    move-result-object p3

    .line 376
    invoke-static {p1, v6}, Lki;->b(Landroid/content/Context;I)I

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    sget-object v2, LP1;->b:Landroid/graphics/PorterDuff$Mode;

    .line 381
    .line 382
    invoke-static {p3, v0}, LO1;->e(Landroid/graphics/drawable/Drawable;I)V

    .line 383
    .line 384
    .line 385
    invoke-virtual {p2, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 386
    .line 387
    .line 388
    move-result-object p3

    .line 389
    invoke-static {p1, v5}, Lki;->c(Landroid/content/Context;I)I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    invoke-static {p3, v0}, LO1;->e(Landroid/graphics/drawable/Drawable;I)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {p2, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 397
    .line 398
    .line 399
    move-result-object p2

    .line 400
    invoke-static {p1, v5}, Lki;->c(Landroid/content/Context;I)I

    .line 401
    .line 402
    .line 403
    move-result p1

    .line 404
    goto :goto_8

    .line 405
    :cond_16
    invoke-virtual {p0, p1, p2, v7}, Lig;->m(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    if-nez p1, :cond_17

    .line 410
    .line 411
    if-eqz p3, :cond_17

    .line 412
    .line 413
    goto :goto_a

    .line 414
    :cond_17
    :goto_9
    move-object v2, v7

    .line 415
    :goto_a
    move-object v7, v2

    .line 416
    :cond_18
    if-eqz v7, :cond_19

    .line 417
    .line 418
    invoke-static {v7}, LX6;->a(Landroid/graphics/drawable/Drawable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 419
    .line 420
    .line 421
    :cond_19
    monitor-exit p0

    .line 422
    return-object v7

    .line 423
    :cond_1a
    const/4 p1, 0x0

    .line 424
    :try_start_3
    iput-boolean p1, p0, Lig;->f:Z

    .line 425
    .line 426
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 427
    .line 428
    const-string p2, "This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat."

    .line 429
    .line 430
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 434
    :goto_b
    monitor-exit p0

    .line 435
    throw p1
.end method

.method public final declared-synchronized i(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lig;->a:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lnh;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v2, v0, Lnh;->a:[I

    .line 16
    .line 17
    iget v3, v0, Lnh;->c:I

    .line 18
    .line 19
    invoke-static {v3, p2, v2}, Lu6;->f(II[I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lnh;->b:[Ljava/lang/Object;

    .line 26
    .line 27
    aget-object v0, v0, v2

    .line 28
    .line 29
    sget-object v2, LMk;->g:Ljava/lang/Object;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :cond_1
    check-cast v0, Landroid/content/res/ColorStateList;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object v0, v1

    .line 38
    :goto_0
    if-nez v0, :cond_7

    .line 39
    .line 40
    iget-object v0, p0, Lig;->g:LO1;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {v0, p1, p2}, LO1;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :goto_1
    if-eqz v1, :cond_6

    .line 50
    .line 51
    iget-object v0, p0, Lig;->a:Ljava/util/WeakHashMap;

    .line 52
    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    new-instance v0, Ljava/util/WeakHashMap;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lig;->a:Ljava/util/WeakHashMap;

    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Lig;->a:Ljava/util/WeakHashMap;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lnh;

    .line 69
    .line 70
    if-nez v0, :cond_5

    .line 71
    .line 72
    new-instance v0, Lnh;

    .line 73
    .line 74
    invoke-direct {v0}, Lnh;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lig;->a:Ljava/util/WeakHashMap;

    .line 78
    .line 79
    invoke-virtual {v2, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    :cond_5
    invoke-virtual {v0, p2, v1}, Lnh;->a(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .line 84
    .line 85
    :cond_6
    move-object v0, v1

    .line 86
    goto :goto_2

    .line 87
    :catchall_0
    move-exception p1

    .line 88
    goto :goto_3

    .line 89
    :cond_7
    :goto_2
    monitor-exit p0

    .line 90
    return-object v0

    .line 91
    :goto_3
    monitor-exit p0

    .line 92
    throw p1
.end method

.method public final declared-synchronized k(Landroid/content/Context;)V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lig;->d:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, LFd;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget v0, p1, LFd;->d:I

    .line 13
    .line 14
    iget-object v1, p1, LFd;->c:[Ljava/lang/Object;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    if-ge v3, v0, :cond_0

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    aput-object v4, v1, v3

    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iput v2, p1, LFd;->d:I

    .line 27
    .line 28
    iput-boolean v2, p1, LFd;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    :cond_1
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    monitor-exit p0

    .line 34
    throw p1
.end method

.method public final declared-synchronized l(LO1;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lig;->g:LO1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    monitor-exit p0

    .line 8
    throw p1
.end method

.method public final m(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lig;->g:LO1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    sget-object v2, LP1;->b:Landroid/graphics/PorterDuff$Mode;

    .line 7
    .line 8
    iget-object v3, v0, LO1;->a:[I

    .line 9
    .line 10
    invoke-static {v3, p2}, LO1;->a([II)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x1

    .line 15
    const/4 v5, -0x1

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    const p2, 0x7f030056

    .line 19
    .line 20
    .line 21
    :goto_0
    move v3, v4

    .line 22
    :goto_1
    move v0, v5

    .line 23
    goto :goto_3

    .line 24
    :cond_0
    iget-object v3, v0, LO1;->c:[I

    .line 25
    .line 26
    invoke-static {v3, p2}, LO1;->a([II)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    const p2, 0x7f030054

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, v0, LO1;->d:[I

    .line 37
    .line 38
    invoke-static {v0, p2}, LO1;->a([II)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const v3, 0x1010031

    .line 43
    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 48
    .line 49
    :goto_2
    move p2, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const v0, 0x7f070026

    .line 52
    .line 53
    .line 54
    if-ne p2, v0, :cond_3

    .line 55
    .line 56
    const p2, 0x42233333    # 40.8f

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    const v0, 0x1010030

    .line 64
    .line 65
    .line 66
    move v3, v4

    .line 67
    move v6, v0

    .line 68
    move v0, p2

    .line 69
    move p2, v6

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    const v0, 0x7f070014

    .line 72
    .line 73
    .line 74
    if-ne p2, v0, :cond_4

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_4
    move p2, v1

    .line 78
    move v3, p2

    .line 79
    goto :goto_1

    .line 80
    :goto_3
    if-eqz v3, :cond_6

    .line 81
    .line 82
    sget-object v1, LX6;->a:[I

    .line 83
    .line 84
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-static {p1, p2}, Lki;->c(Landroid/content/Context;I)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    const-class p2, LP1;

    .line 93
    .line 94
    monitor-enter p2

    .line 95
    :try_start_0
    invoke-static {p1, v2}, Lig;->h(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 96
    .line 97
    .line 98
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    monitor-exit p2

    .line 100
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 101
    .line 102
    .line 103
    if-eq v0, v5, :cond_5

    .line 104
    .line 105
    invoke-virtual {p3, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 106
    .line 107
    .line 108
    :cond_5
    move v1, v4

    .line 109
    goto :goto_4

    .line 110
    :catchall_0
    move-exception p1

    .line 111
    monitor-exit p2

    .line 112
    throw p1

    .line 113
    :cond_6
    :goto_4
    return v1
.end method
