.class public abstract LDk;
.super LIk;
.source "SourceFile"


# static fields
.field public static h:Z = false

.field public static i:Ljava/lang/reflect/Method;

.field public static j:Ljava/lang/Class;

.field public static k:Ljava/lang/reflect/Field;

.field public static l:Ljava/lang/reflect/Field;


# instance fields
.field public final c:Landroid/view/WindowInsets;

.field public d:[Lgc;

.field public e:Lgc;

.field public f:LLk;

.field public g:Lgc;


# direct methods
.method public constructor <init>(LLk;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LIk;-><init>(LLk;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, LDk;->e:Lgc;

    .line 6
    .line 7
    iput-object p2, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 8
    .line 9
    return-void
.end method

.method private s(IZ)Lgc;
    .locals 3

    .line 1
    sget-object v0, Lgc;->e:Lgc;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :goto_0
    const/16 v2, 0x100

    .line 5
    .line 6
    if-gt v1, v2, :cond_1

    .line 7
    .line 8
    and-int v2, p1, v1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0, v1, p2}, LDk;->t(IZ)Lgc;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v2}, Lgc;->a(Lgc;Lgc;)Lgc;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-object v0
.end method

.method private u()Lgc;
    .locals 1

    .line 1
    iget-object v0, p0, LDk;->f:LLk;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, LLk;->a:LIk;

    .line 6
    .line 7
    invoke-virtual {v0}, LIk;->h()Lgc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    sget-object v0, Lgc;->e:Lgc;

    .line 13
    .line 14
    return-object v0
.end method

.method private v(Landroid/view/View;)Lgc;
    .locals 5

    .line 1
    const-string v0, "WindowInsetsCompat"

    .line 2
    .line 3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v2, 0x1e

    .line 6
    .line 7
    if-ge v1, v2, :cond_5

    .line 8
    .line 9
    sget-boolean v1, LDk;->h:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, LDk;->x()V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v1, LDk;->i:Ljava/lang/reflect/Method;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    sget-object v3, LDk;->j:Ljava/lang/Class;

    .line 22
    .line 23
    if-eqz v3, :cond_4

    .line 24
    .line 25
    sget-object v3, LDk;->k:Ljava/lang/reflect/Field;

    .line 26
    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :try_start_0
    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    const-string p1, "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden"

    .line 37
    .line 38
    new-instance v1, Ljava/lang/NullPointerException;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 44
    .line 45
    .line 46
    return-object v2

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    sget-object v1, LDk;->l:Ljava/lang/reflect/Field;

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v1, LDk;->k:Ljava/lang/reflect/Field;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Landroid/graphics/Rect;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 66
    .line 67
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    iget v4, p1, Landroid/graphics/Rect;->right:I

    .line 70
    .line 71
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 72
    .line 73
    invoke-static {v1, v3, v4, p1}, Lgc;->b(IIII)Lgc;

    .line 74
    .line 75
    .line 76
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :cond_3
    return-object v2

    .line 78
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v3, "Failed to get visible insets. (Reflection error). "

    .line 81
    .line 82
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_1
    return-object v2

    .line 100
    :cond_5
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 101
    .line 102
    const-string v0, "getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead."

    .line 103
    .line 104
    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p1
.end method

.method private static x()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    const-class v1, Landroid/view/View;

    .line 3
    .line 4
    const-string v2, "getViewRootImpl"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sput-object v1, LDk;->i:Ljava/lang/reflect/Method;

    .line 12
    .line 13
    const-string v1, "android.view.View$AttachInfo"

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sput-object v1, LDk;->j:Ljava/lang/Class;

    .line 20
    .line 21
    const-string v2, "mVisibleInsets"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, LDk;->k:Ljava/lang/reflect/Field;

    .line 28
    .line 29
    const-string v1, "android.view.ViewRootImpl"

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "mAttachInfo"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sput-object v1, LDk;->l:Ljava/lang/reflect/Field;

    .line 42
    .line 43
    sget-object v1, LDk;->k:Ljava/lang/reflect/Field;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 46
    .line 47
    .line 48
    sget-object v1, LDk;->l:Ljava/lang/reflect/Field;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "Failed to get visible insets. (Reflection error). "

    .line 58
    .line 59
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v3, "WindowInsetsCompat"

    .line 74
    .line 75
    invoke-static {v3, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    .line 77
    .line 78
    :goto_0
    sput-boolean v0, LDk;->h:Z

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LDk;->v(Landroid/view/View;)Lgc;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lgc;->e:Lgc;

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0, p1}, LDk;->y(Lgc;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, LIk;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    return p1

    .line 9
    :cond_0
    check-cast p1, LDk;

    .line 10
    .line 11
    iget-object v0, p0, LDk;->g:Lgc;

    .line 12
    .line 13
    iget-object p1, p1, LDk;->g:Lgc;

    .line 14
    .line 15
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    return p1
.end method

.method public f(I)Lgc;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, LDk;->s(IZ)Lgc;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    return-object p1
.end method

.method public final j()Lgc;
    .locals 4

    .line 1
    iget-object v0, p0, LDk;->e:Lgc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v1, v2, v3, v0}, Lgc;->b(IIII)Lgc;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, LDk;->e:Lgc;

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, LDk;->e:Lgc;

    .line 30
    .line 31
    return-object v0
.end method

.method public l(IIII)LLk;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 3
    .line 4
    invoke-static {v0, v1}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v2, 0x1e

    .line 11
    .line 12
    if-lt v1, v2, :cond_0

    .line 13
    .line 14
    new-instance v1, LBk;

    .line 15
    .line 16
    invoke-direct {v1, v0}, LBk;-><init>(LLk;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v2, 0x1d

    .line 21
    .line 22
    if-lt v1, v2, :cond_1

    .line 23
    .line 24
    new-instance v1, LAk;

    .line 25
    .line 26
    invoke-direct {v1, v0}, LAk;-><init>(LLk;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v1, Lzk;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Lzk;-><init>(LLk;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0}, LDk;->j()Lgc;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0, p1, p2, p3, p4}, LLk;->e(Lgc;IIII)Lgc;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, LCk;->g(Lgc;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, LIk;->h()Lgc;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0, p1, p2, p3, p4}, LLk;->e(Lgc;IIII)Lgc;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {v1, p1}, LCk;->e(Lgc;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, LCk;->b()LLk;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    return-object p1
.end method

.method public n()Z
    .locals 1

    .line 1
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/WindowInsets;->isRound()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public o(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x100

    .line 4
    .line 5
    if-gt v1, v2, :cond_2

    .line 6
    .line 7
    and-int v2, p1, v1

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0, v1}, LDk;->w(I)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    return p1

    .line 20
    :cond_1
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v0
.end method

.method public p([Lgc;)V
    .locals 0

    .line 1
    iput-object p1, p0, LDk;->d:[Lgc;

    .line 2
    .line 3
    return-void
.end method

.method public q(LLk;)V
    .locals 0

    .line 1
    iput-object p1, p0, LDk;->f:LLk;

    .line 2
    .line 3
    return-void
.end method

.method public t(IZ)Lgc;
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p1, v0, :cond_13

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eq p1, v0, :cond_f

    .line 8
    .line 9
    const/16 p2, 0x8

    .line 10
    .line 11
    sget-object v0, Lgc;->e:Lgc;

    .line 12
    .line 13
    if-eq p1, p2, :cond_a

    .line 14
    .line 15
    const/16 p2, 0x10

    .line 16
    .line 17
    if-eq p1, p2, :cond_9

    .line 18
    .line 19
    const/16 p2, 0x20

    .line 20
    .line 21
    if-eq p1, p2, :cond_8

    .line 22
    .line 23
    const/16 p2, 0x40

    .line 24
    .line 25
    if-eq p1, p2, :cond_7

    .line 26
    .line 27
    const/16 p2, 0x80

    .line 28
    .line 29
    if-eq p1, p2, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    iget-object p1, p0, LDk;->f:LLk;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p1, LLk;->a:LIk;

    .line 37
    .line 38
    invoke-virtual {p1}, LIk;->e()LT6;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, LIk;->e()LT6;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_0
    if-eqz p1, :cond_6

    .line 48
    .line 49
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 50
    .line 51
    const/16 v0, 0x1c

    .line 52
    .line 53
    if-lt p2, v0, :cond_2

    .line 54
    .line 55
    iget-object v2, p1, LT6;->a:Landroid/view/DisplayCutout;

    .line 56
    .line 57
    invoke-static {v2}, LS6;->e(Landroid/view/DisplayCutout;)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v2, v1

    .line 63
    :goto_1
    if-lt p2, v0, :cond_3

    .line 64
    .line 65
    iget-object v3, p1, LT6;->a:Landroid/view/DisplayCutout;

    .line 66
    .line 67
    invoke-static {v3}, LS6;->g(Landroid/view/DisplayCutout;)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    move v3, v1

    .line 73
    :goto_2
    if-lt p2, v0, :cond_4

    .line 74
    .line 75
    iget-object v4, p1, LT6;->a:Landroid/view/DisplayCutout;

    .line 76
    .line 77
    invoke-static {v4}, LS6;->f(Landroid/view/DisplayCutout;)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    move v4, v1

    .line 83
    :goto_3
    if-lt p2, v0, :cond_5

    .line 84
    .line 85
    iget-object p1, p1, LT6;->a:Landroid/view/DisplayCutout;

    .line 86
    .line 87
    invoke-static {p1}, LS6;->d(Landroid/view/DisplayCutout;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    :cond_5
    invoke-static {v2, v3, v4, v1}, Lgc;->b(IIII)Lgc;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    return-object p1

    .line 96
    :cond_6
    return-object v0

    .line 97
    :cond_7
    invoke-virtual {p0}, LIk;->k()Lgc;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    return-object p1

    .line 102
    :cond_8
    invoke-virtual {p0}, LIk;->g()Lgc;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    return-object p1

    .line 107
    :cond_9
    invoke-virtual {p0}, LIk;->i()Lgc;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    return-object p1

    .line 112
    :cond_a
    iget-object p1, p0, LDk;->d:[Lgc;

    .line 113
    .line 114
    if-eqz p1, :cond_b

    .line 115
    .line 116
    const/4 p2, 0x3

    .line 117
    aget-object v2, p1, p2

    .line 118
    .line 119
    :cond_b
    if-eqz v2, :cond_c

    .line 120
    .line 121
    return-object v2

    .line 122
    :cond_c
    invoke-virtual {p0}, LDk;->j()Lgc;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0}, LDk;->u()Lgc;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    iget p1, p1, Lgc;->d:I

    .line 131
    .line 132
    iget v2, p2, Lgc;->d:I

    .line 133
    .line 134
    if-le p1, v2, :cond_d

    .line 135
    .line 136
    invoke-static {v1, v1, v1, p1}, Lgc;->b(IIII)Lgc;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    return-object p1

    .line 141
    :cond_d
    iget-object p1, p0, LDk;->g:Lgc;

    .line 142
    .line 143
    if-eqz p1, :cond_e

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Lgc;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-nez p1, :cond_e

    .line 150
    .line 151
    iget-object p1, p0, LDk;->g:Lgc;

    .line 152
    .line 153
    iget p1, p1, Lgc;->d:I

    .line 154
    .line 155
    iget p2, p2, Lgc;->d:I

    .line 156
    .line 157
    if-le p1, p2, :cond_e

    .line 158
    .line 159
    invoke-static {v1, v1, v1, p1}, Lgc;->b(IIII)Lgc;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    return-object p1

    .line 164
    :cond_e
    return-object v0

    .line 165
    :cond_f
    if-eqz p2, :cond_10

    .line 166
    .line 167
    invoke-direct {p0}, LDk;->u()Lgc;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p0}, LIk;->h()Lgc;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    iget v0, p1, Lgc;->a:I

    .line 176
    .line 177
    iget v2, p2, Lgc;->a:I

    .line 178
    .line 179
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    iget v2, p1, Lgc;->c:I

    .line 184
    .line 185
    iget v3, p2, Lgc;->c:I

    .line 186
    .line 187
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    iget p1, p1, Lgc;->d:I

    .line 192
    .line 193
    iget p2, p2, Lgc;->d:I

    .line 194
    .line 195
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    invoke-static {v0, v1, v2, p1}, Lgc;->b(IIII)Lgc;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    return-object p1

    .line 204
    :cond_10
    invoke-virtual {p0}, LDk;->j()Lgc;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iget-object p2, p0, LDk;->f:LLk;

    .line 209
    .line 210
    if-eqz p2, :cond_11

    .line 211
    .line 212
    iget-object p2, p2, LLk;->a:LIk;

    .line 213
    .line 214
    invoke-virtual {p2}, LIk;->h()Lgc;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    :cond_11
    iget p2, p1, Lgc;->d:I

    .line 219
    .line 220
    if-eqz v2, :cond_12

    .line 221
    .line 222
    iget v0, v2, Lgc;->d:I

    .line 223
    .line 224
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    :cond_12
    iget v0, p1, Lgc;->a:I

    .line 229
    .line 230
    iget p1, p1, Lgc;->c:I

    .line 231
    .line 232
    invoke-static {v0, v1, p1, p2}, Lgc;->b(IIII)Lgc;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    return-object p1

    .line 237
    :cond_13
    if-eqz p2, :cond_14

    .line 238
    .line 239
    invoke-direct {p0}, LDk;->u()Lgc;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iget p1, p1, Lgc;->b:I

    .line 244
    .line 245
    invoke-virtual {p0}, LDk;->j()Lgc;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    iget p2, p2, Lgc;->b:I

    .line 250
    .line 251
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    invoke-static {v1, p1, v1, v1}, Lgc;->b(IIII)Lgc;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    return-object p1

    .line 260
    :cond_14
    invoke-virtual {p0}, LDk;->j()Lgc;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iget p1, p1, Lgc;->b:I

    .line 265
    .line 266
    invoke-static {v1, p1, v1, v1}, Lgc;->b(IIII)Lgc;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    return-object p1
.end method

.method public w(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-eq p1, v2, :cond_1

    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    if-eq p1, v2, :cond_0

    .line 10
    .line 11
    const/16 v2, 0x8

    .line 12
    .line 13
    if-eq p1, v2, :cond_1

    .line 14
    .line 15
    const/16 v2, 0x80

    .line 16
    .line 17
    if-eq p1, v2, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    invoke-virtual {p0, p1, v0}, LDk;->t(IZ)Lgc;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v0, Lgc;->e:Lgc;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lgc;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    xor-int/2addr p1, v1

    .line 32
    return p1
.end method

.method public y(Lgc;)V
    .locals 0

    .line 1
    iput-object p1, p0, LDk;->g:Lgc;

    .line 2
    .line 3
    return-void
.end method
