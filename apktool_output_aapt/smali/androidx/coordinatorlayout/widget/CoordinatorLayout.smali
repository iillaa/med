.class public Landroidx/coordinatorlayout/widget/CoordinatorLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements LEe;
.implements LFe;


# static fields
.field public static final s:Ljava/lang/String;

.field public static final t:[Ljava/lang/Class;

.field public static final u:Ljava/lang/ThreadLocal;

.field public static final v:LA5;

.field public static final w:Lsf;


# instance fields
.field public final c:Ljava/util/ArrayList;

.field public final d:LN6;

.field public final e:Ljava/util/ArrayList;

.field public final f:[I

.field public g:Z

.field public h:Z

.field public final i:[I

.field public j:Landroid/view/View;

.field public k:Ly5;

.field public l:Z

.field public m:LLk;

.field public n:Z

.field public o:Landroid/graphics/drawable/Drawable;

.field public p:Landroid/view/ViewGroup$OnHierarchyChangeListener;

.field public q:Li0;

.field public final r:LGe;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, LA5;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:LA5;

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    new-array v0, v0, [Ljava/lang/Class;

    .line 26
    .line 27
    const-class v1, Landroid/content/Context;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    aput-object v1, v0, v2

    .line 31
    .line 32
    const-class v1, Landroid/util/AttributeSet;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    aput-object v1, v0, v2

    .line 36
    .line 37
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:[Ljava/lang/Class;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Ljava/lang/ThreadLocal;

    .line 45
    .line 46
    new-instance v0, Lsf;

    .line 47
    .line 48
    invoke-direct {v0}, Lsf;-><init>()V

    .line 49
    .line 50
    .line 51
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Lsf;

    .line 52
    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const v7, 0x7f030064

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v7}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 7
    .line 8
    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    new-instance v2, LN6;

    .line 17
    .line 18
    invoke-direct {v2, v1}, LN6;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d:LN6;

    .line 22
    .line 23
    new-instance v2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e:Ljava/util/ArrayList;

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    new-array v2, v2, [I

    .line 32
    .line 33
    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f:[I

    .line 34
    .line 35
    new-instance v2, LGe;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:LGe;

    .line 41
    .line 42
    sget-object v4, LKf;->a:[I

    .line 43
    .line 44
    invoke-virtual {p1, p2, v4, v7, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 45
    .line 46
    .line 47
    move-result-object v9

    .line 48
    const/4 v8, 0x0

    .line 49
    move-object v2, p0

    .line 50
    move-object v3, p1

    .line 51
    move-object v5, p2

    .line 52
    move-object v6, v9

    .line 53
    invoke-static/range {v2 .. v8}, LLj;->g(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v9, v1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getIntArray(I)[I

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iput-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:[I

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 77
    .line 78
    array-length p2, p2

    .line 79
    :goto_0
    if-ge v1, p2, :cond_0

    .line 80
    .line 81
    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:[I

    .line 82
    .line 83
    aget v3, v2, v1

    .line 84
    .line 85
    int-to-float v3, v3

    .line 86
    mul-float/2addr v3, p1

    .line 87
    float-to-int v3, v3

    .line 88
    aput v3, v2, v1

    .line 89
    .line 90
    add-int/2addr v1, v0

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    invoke-virtual {v9, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t()V

    .line 102
    .line 103
    .line 104
    new-instance p1, Lw5;

    .line 105
    .line 106
    invoke-direct {p1, p0}, Lw5;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    .line 107
    .line 108
    .line 109
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 110
    .line 111
    .line 112
    sget-object p1, LLj;->a:Ljava/util/WeakHashMap;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getImportantForAccessibility()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_1

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 121
    .line 122
    .line 123
    :cond_1
    return-void
.end method

.method public static g()Landroid/graphics/Rect;
    .locals 1

    .line 1
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Lsf;

    invoke-virtual {v0}, Lsf;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    :cond_0
    return-object v0
.end method

.method public static k(ILandroid/graphics/Rect;Landroid/graphics/Rect;Lx5;II)V
    .locals 6

    .line 1
    iget v0, p3, Lx5;->b:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x11

    .line 6
    .line 7
    :cond_0
    invoke-static {v0, p0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget p3, p3, Lx5;->c:I

    .line 12
    .line 13
    and-int/lit8 v1, p3, 0x7

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const v1, 0x800003

    .line 18
    .line 19
    .line 20
    or-int/2addr p3, v1

    .line 21
    :cond_1
    and-int/lit8 v1, p3, 0x70

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    or-int/lit8 p3, p3, 0x30

    .line 26
    .line 27
    :cond_2
    invoke-static {p3, p0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    and-int/lit8 p3, v0, 0x7

    .line 32
    .line 33
    and-int/lit8 v0, v0, 0x70

    .line 34
    .line 35
    and-int/lit8 v1, p0, 0x7

    .line 36
    .line 37
    and-int/lit8 p0, p0, 0x70

    .line 38
    .line 39
    const/4 v2, 0x5

    .line 40
    const/4 v3, 0x1

    .line 41
    if-eq v1, v3, :cond_4

    .line 42
    .line 43
    if-eq v1, v2, :cond_3

    .line 44
    .line 45
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_4
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    div-int/lit8 v4, v4, 0x2

    .line 58
    .line 59
    add-int/2addr v1, v4

    .line 60
    :goto_0
    const/16 v4, 0x50

    .line 61
    .line 62
    const/16 v5, 0x10

    .line 63
    .line 64
    if-eq p0, v5, :cond_6

    .line 65
    .line 66
    if-eq p0, v4, :cond_5

    .line 67
    .line 68
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_5
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_6
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    div-int/lit8 p1, p1, 0x2

    .line 81
    .line 82
    add-int/2addr p0, p1

    .line 83
    :goto_1
    if-eq p3, v3, :cond_7

    .line 84
    .line 85
    if-eq p3, v2, :cond_8

    .line 86
    .line 87
    sub-int/2addr v1, p4

    .line 88
    goto :goto_2

    .line 89
    :cond_7
    div-int/lit8 p1, p4, 0x2

    .line 90
    .line 91
    sub-int/2addr v1, p1

    .line 92
    :cond_8
    :goto_2
    if-eq v0, v5, :cond_9

    .line 93
    .line 94
    if-eq v0, v4, :cond_a

    .line 95
    .line 96
    sub-int/2addr p0, p5

    .line 97
    goto :goto_3

    .line 98
    :cond_9
    div-int/lit8 p1, p5, 0x2

    .line 99
    .line 100
    sub-int/2addr p0, p1

    .line 101
    :cond_a
    :goto_3
    add-int/2addr p4, v1

    .line 102
    add-int/2addr p5, p0

    .line 103
    invoke-virtual {p2, v1, p0, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static m(Landroid/view/View;)Lx5;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lx5;

    .line 6
    .line 7
    iget-boolean v1, v0, Lx5;->a:Z

    .line 8
    .line 9
    if-nez v1, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v1, 0x0

    .line 16
    move-object v2, v1

    .line 17
    :goto_0
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-class v2, Lv5;

    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lv5;

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    if-eqz v2, :cond_1

    .line 35
    .line 36
    :try_start_0
    invoke-interface {v2}, Lv5;->value()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Loh;->c(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catch_0
    move-exception p0

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "Default behavior class "

    .line 56
    .line 57
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v2}, Lv5;->value()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, " could not be instantiated. Did you forget a default constructor?"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v2, "CoordinatorLayout"

    .line 81
    .line 82
    invoke-static {v2, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    .line 84
    .line 85
    :cond_1
    :goto_1
    const/4 p0, 0x1

    .line 86
    iput-boolean p0, v0, Lx5;->a:Z

    .line 87
    .line 88
    :cond_2
    return-object v0
.end method

.method public static r(Landroid/view/View;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lx5;

    .line 6
    .line 7
    iget v1, v0, Lx5;->h:I

    .line 8
    .line 9
    if-eq v1, p1, :cond_0

    .line 10
    .line 11
    sub-int v1, p1, v1

    .line 12
    .line 13
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 16
    .line 17
    .line 18
    iput p1, v0, Lx5;->h:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static s(Landroid/view/View;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lx5;

    .line 6
    .line 7
    iget v1, v0, Lx5;->i:I

    .line 8
    .line 9
    if-eq v1, p1, :cond_0

    .line 10
    .line 11
    sub-int v1, p1, v1

    .line 12
    .line 13
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 16
    .line 17
    .line 18
    iput p1, v0, Lx5;->i:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/View;II)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:LGe;

    .line 3
    .line 4
    if-ne p4, p1, :cond_0

    .line 5
    .line 6
    iput p3, v0, LGe;->b:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iput p3, v0, LGe;->a:I

    .line 10
    .line 11
    :goto_0
    iput-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 p2, 0x0

    .line 18
    :goto_1
    if-ge p2, p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    check-cast p3, Lx5;

    .line 29
    .line 30
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    add-int/lit8 p2, p2, 0x1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    return-void
.end method

.method public final b(Landroid/view/View;I)V
    .locals 5

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:LGe;

    .line 4
    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    iput p1, v1, LGe;->b:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput p1, v1, LGe;->a:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    move v2, p1

    .line 17
    :goto_1
    if-ge v2, v1, :cond_4

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lx5;

    .line 28
    .line 29
    invoke-virtual {v3, p2}, Lx5;->a(I)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    if-eqz p2, :cond_3

    .line 37
    .line 38
    if-eq p2, v0, :cond_2

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    iput-boolean p1, v3, Lx5;->m:Z

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    iput-boolean p1, v3, Lx5;->l:Z

    .line 45
    .line 46
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_4
    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j:Landroid/view/View;

    .line 51
    .line 52
    return-void
.end method

.method public final c(Landroid/view/View;IIIII[I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    move-result p5

    const/16 p6, 0x8

    if-ne p5, p6, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    check-cast p4, Lx5;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    aget p1, p7, p2

    aput p1, p7, p2

    const/4 p1, 0x1

    aget p2, p7, p1

    aput p2, p7, p1

    return-void
.end method

.method public final checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1

    instance-of v0, p1, Lx5;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final d(Landroid/view/View;IIIII)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f:[I

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(Landroid/view/View;IIIII[I)V

    return-void
.end method

.method public final drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 1

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lx5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method public final drawableStateChanged()V
    .locals 3

    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1
    return-void
.end method

.method public final e(III[I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    move p3, p2

    .line 7
    :goto_0
    if-ge p3, p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    if-ne v1, v2, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lx5;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    aput p2, p4, p2

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    aput p2, p4, p1

    .line 38
    .line 39
    return-void
.end method

.method public final f(Landroid/view/View;Landroid/view/View;II)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    move p3, p2

    .line 7
    :goto_0
    if-ge p3, p1, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    if-ne v1, v2, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lx5;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    if-eqz p4, :cond_2

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    if-eq p4, v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iput-boolean p2, v0, Lx5;->m:Z

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    iput-boolean p2, v0, Lx5;->l:Z

    .line 41
    .line 42
    :goto_1
    add-int/lit8 p3, p3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return p2
.end method

.method public final generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    new-instance v0, Lx5;

    .line 2
    .line 3
    invoke-direct {v0}, Lx5;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .line 1
    new-instance v0, Lx5;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lx5;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 2
    instance-of v0, p1, Lx5;

    if-eqz v0, :cond_0

    new-instance v0, Lx5;

    check-cast p1, Lx5;

    invoke-direct {v0, p1}, Lx5;-><init>(Lx5;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    new-instance v0, Lx5;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Lx5;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    goto :goto_0

    :cond_1
    new-instance v0, Lx5;

    invoke-direct {v0, p1}, Lx5;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-object v0
.end method

.method public final getDependencySortedChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p()V

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getLastWindowInsets()LLk;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 2
    .line 3
    return-object v0
.end method

.method public getNestedScrollAxes()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:LGe;

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

.method public getStatusBarBackground()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSuggestedMinimumHeight()I
    .locals 3

    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    add-int/2addr v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getSuggestedMinimumWidth()I
    .locals 3

    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    add-int/2addr v2, v1

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public final h(Lx5;Landroid/graphics/Rect;II)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 14
    .line 15
    add-int/2addr v2, v3

    .line 16
    iget v3, p2, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    sub-int/2addr v0, v4

    .line 23
    sub-int/2addr v0, p3

    .line 24
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 25
    .line 26
    sub-int/2addr v0, v4

    .line 27
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 40
    .line 41
    add-int/2addr v2, v3

    .line 42
    iget v3, p2, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v1, v4

    .line 49
    sub-int/2addr v1, p4

    .line 50
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 51
    .line 52
    sub-int/2addr v1, p1

    .line 53
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    add-int/2addr p3, v0

    .line 62
    add-int/2addr p4, p1

    .line 63
    invoke-virtual {p2, v0, p1, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final i(Landroid/view/View;Landroid/graphics/Rect;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x8

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    if-eqz p3, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-virtual {p2, p3, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 39
    .line 40
    .line 41
    :goto_0
    return-void

    .line 42
    :cond_2
    :goto_1
    invoke-virtual {p2}, Landroid/graphics/Rect;->setEmpty()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final j(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    sget-object v0, LNj;->a:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 13
    .line 14
    .line 15
    sget-object v0, LNj;->a:Ljava/lang/ThreadLocal;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/graphics/Matrix;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Matrix;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-static {p0, p1, v1}, LNj;->a(Landroid/view/ViewParent;Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, LNj;->b:Ljava/lang/ThreadLocal;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/graphics/RectF;

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 62
    .line 63
    .line 64
    iget p1, v0, Landroid/graphics/RectF;->left:F

    .line 65
    .line 66
    const/high16 v1, 0x3f000000    # 0.5f

    .line 67
    .line 68
    add-float/2addr p1, v1

    .line 69
    float-to-int p1, p1

    .line 70
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    add-float/2addr v2, v1

    .line 73
    float-to-int v2, v2

    .line 74
    iget v3, v0, Landroid/graphics/RectF;->right:F

    .line 75
    .line 76
    add-float/2addr v3, v1

    .line 77
    float-to-int v3, v3

    .line 78
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 79
    .line 80
    add-float/2addr v0, v1

    .line 81
    float-to-int v0, v0

    .line 82
    invoke-virtual {p2, p1, v2, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final l(I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    const-string v1, "CoordinatorLayout"

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:[I

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No keylines defined for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " - attempted index lookup "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    if-ltz p1, :cond_2

    array-length v3, v2

    if-lt p1, v3, :cond_1

    goto :goto_1

    :cond_1
    aget p1, v2, p1

    return p1

    :cond_2
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Keyline index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range for "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public final n(I)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    sget-object v7, LLj;->a:Ljava/util/WeakHashMap;

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutDirection()I

    .line 8
    .line 9
    .line 10
    move-result v7

    .line 11
    iget-object v14, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v15

    .line 17
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 18
    .line 19
    .line 20
    move-result-object v13

    .line 21
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 22
    .line 23
    .line 24
    move-result-object v12

    .line 25
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object v11

    .line 29
    const/4 v9, 0x0

    .line 30
    :goto_0
    sget-object v8, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Lsf;

    .line 31
    .line 32
    if-ge v9, v15, :cond_18

    .line 33
    .line 34
    invoke-virtual {v14, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v16

    .line 38
    move-object/from16 v2, v16

    .line 39
    .line 40
    check-cast v2, Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v16

    .line 46
    move-object/from16 v3, v16

    .line 47
    .line 48
    check-cast v3, Lx5;

    .line 49
    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    const/16 v5, 0x8

    .line 57
    .line 58
    if-ne v4, v5, :cond_0

    .line 59
    .line 60
    move v5, v1

    .line 61
    move v6, v7

    .line 62
    move/from16 v21, v9

    .line 63
    .line 64
    move-object v8, v11

    .line 65
    move-object v4, v12

    .line 66
    move-object v7, v13

    .line 67
    move v13, v15

    .line 68
    const/4 v1, 0x1

    .line 69
    const/16 v9, 0x30

    .line 70
    .line 71
    const/4 v10, 0x0

    .line 72
    const/16 v11, 0x50

    .line 73
    .line 74
    const/4 v12, 0x3

    .line 75
    move-object v15, v14

    .line 76
    const/4 v14, 0x5

    .line 77
    goto/16 :goto_12

    .line 78
    .line 79
    :cond_0
    const/4 v4, 0x0

    .line 80
    :goto_1
    if-ge v4, v9, :cond_5

    .line 81
    .line 82
    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    check-cast v5, Landroid/view/View;

    .line 87
    .line 88
    iget-object v6, v3, Lx5;->k:Landroid/view/View;

    .line 89
    .line 90
    if-ne v6, v5, :cond_4

    .line 91
    .line 92
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    check-cast v5, Lx5;

    .line 97
    .line 98
    iget-object v6, v5, Lx5;->j:Landroid/view/View;

    .line 99
    .line 100
    if-eqz v6, :cond_4

    .line 101
    .line 102
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 107
    .line 108
    .line 109
    move-result-object v10

    .line 110
    move-object/from16 v18, v14

    .line 111
    .line 112
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 113
    .line 114
    .line 115
    move-result-object v14

    .line 116
    move-object/from16 v19, v8

    .line 117
    .line 118
    iget-object v8, v5, Lx5;->j:Landroid/view/View;

    .line 119
    .line 120
    invoke-virtual {v0, v8, v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 121
    .line 122
    .line 123
    const/4 v8, 0x0

    .line 124
    invoke-virtual {v0, v2, v10, v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i(Landroid/view/View;Landroid/graphics/Rect;Z)V

    .line 125
    .line 126
    .line 127
    move/from16 v17, v15

    .line 128
    .line 129
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 130
    .line 131
    .line 132
    move-result v15

    .line 133
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    move-object/from16 v20, v3

    .line 138
    .line 139
    move-object/from16 v3, v19

    .line 140
    .line 141
    move/from16 v19, v8

    .line 142
    .line 143
    move v8, v7

    .line 144
    move/from16 v21, v9

    .line 145
    .line 146
    move-object v9, v6

    .line 147
    move/from16 v19, v7

    .line 148
    .line 149
    move-object v7, v10

    .line 150
    move-object v10, v14

    .line 151
    move-object/from16 v22, v11

    .line 152
    .line 153
    move-object v11, v5

    .line 154
    move-object/from16 v23, v12

    .line 155
    .line 156
    move v12, v15

    .line 157
    move-object/from16 v24, v13

    .line 158
    .line 159
    move v13, v1

    .line 160
    invoke-static/range {v8 .. v13}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k(ILandroid/graphics/Rect;Landroid/graphics/Rect;Lx5;II)V

    .line 161
    .line 162
    .line 163
    iget v8, v14, Landroid/graphics/Rect;->left:I

    .line 164
    .line 165
    iget v9, v7, Landroid/graphics/Rect;->left:I

    .line 166
    .line 167
    if-ne v8, v9, :cond_1

    .line 168
    .line 169
    iget v8, v14, Landroid/graphics/Rect;->top:I

    .line 170
    .line 171
    iget v9, v7, Landroid/graphics/Rect;->top:I

    .line 172
    .line 173
    :cond_1
    invoke-virtual {v0, v5, v14, v15, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h(Lx5;Landroid/graphics/Rect;II)V

    .line 174
    .line 175
    .line 176
    iget v1, v14, Landroid/graphics/Rect;->left:I

    .line 177
    .line 178
    iget v5, v7, Landroid/graphics/Rect;->left:I

    .line 179
    .line 180
    sub-int/2addr v1, v5

    .line 181
    iget v5, v14, Landroid/graphics/Rect;->top:I

    .line 182
    .line 183
    iget v8, v7, Landroid/graphics/Rect;->top:I

    .line 184
    .line 185
    sub-int/2addr v5, v8

    .line 186
    if-eqz v1, :cond_2

    .line 187
    .line 188
    sget-object v8, LLj;->a:Ljava/util/WeakHashMap;

    .line 189
    .line 190
    invoke-virtual {v2, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 191
    .line 192
    .line 193
    :cond_2
    if-eqz v5, :cond_3

    .line 194
    .line 195
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 196
    .line 197
    invoke-virtual {v2, v5}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 198
    .line 199
    .line 200
    :cond_3
    invoke-virtual {v6}, Landroid/graphics/Rect;->setEmpty()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3, v6}, Lsf;->c(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    invoke-virtual {v7}, Landroid/graphics/Rect;->setEmpty()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v3, v7}, Lsf;->c(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    invoke-virtual {v14}, Landroid/graphics/Rect;->setEmpty()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3, v14}, Lsf;->c(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    :goto_2
    const/4 v1, 0x1

    .line 219
    goto :goto_3

    .line 220
    :cond_4
    move-object/from16 v20, v3

    .line 221
    .line 222
    move/from16 v19, v7

    .line 223
    .line 224
    move-object v3, v8

    .line 225
    move/from16 v21, v9

    .line 226
    .line 227
    move-object/from16 v22, v11

    .line 228
    .line 229
    move-object/from16 v23, v12

    .line 230
    .line 231
    move-object/from16 v24, v13

    .line 232
    .line 233
    move-object/from16 v18, v14

    .line 234
    .line 235
    move/from16 v17, v15

    .line 236
    .line 237
    goto :goto_2

    .line 238
    :goto_3
    add-int/2addr v4, v1

    .line 239
    move/from16 v1, p1

    .line 240
    .line 241
    move-object v8, v3

    .line 242
    move/from16 v15, v17

    .line 243
    .line 244
    move-object/from16 v14, v18

    .line 245
    .line 246
    move/from16 v7, v19

    .line 247
    .line 248
    move-object/from16 v3, v20

    .line 249
    .line 250
    move/from16 v9, v21

    .line 251
    .line 252
    move-object/from16 v11, v22

    .line 253
    .line 254
    move-object/from16 v12, v23

    .line 255
    .line 256
    move-object/from16 v13, v24

    .line 257
    .line 258
    goto/16 :goto_1

    .line 259
    .line 260
    :cond_5
    move-object/from16 v20, v3

    .line 261
    .line 262
    move/from16 v19, v7

    .line 263
    .line 264
    move-object v3, v8

    .line 265
    move/from16 v21, v9

    .line 266
    .line 267
    move-object/from16 v22, v11

    .line 268
    .line 269
    move-object v4, v12

    .line 270
    move-object/from16 v24, v13

    .line 271
    .line 272
    move-object/from16 v18, v14

    .line 273
    .line 274
    move/from16 v17, v15

    .line 275
    .line 276
    const/4 v1, 0x1

    .line 277
    invoke-virtual {v0, v2, v4, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i(Landroid/view/View;Landroid/graphics/Rect;Z)V

    .line 278
    .line 279
    .line 280
    move-object/from16 v1, v20

    .line 281
    .line 282
    iget v5, v1, Lx5;->f:I

    .line 283
    .line 284
    if-eqz v5, :cond_a

    .line 285
    .line 286
    invoke-virtual {v4}, Landroid/graphics/Rect;->isEmpty()Z

    .line 287
    .line 288
    .line 289
    move-result v5

    .line 290
    if-nez v5, :cond_a

    .line 291
    .line 292
    iget v5, v1, Lx5;->f:I

    .line 293
    .line 294
    move/from16 v6, v19

    .line 295
    .line 296
    invoke-static {v5, v6}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 297
    .line 298
    .line 299
    move-result v5

    .line 300
    and-int/lit8 v7, v5, 0x70

    .line 301
    .line 302
    const/16 v8, 0x30

    .line 303
    .line 304
    if-eq v7, v8, :cond_7

    .line 305
    .line 306
    const/16 v8, 0x50

    .line 307
    .line 308
    if-eq v7, v8, :cond_6

    .line 309
    .line 310
    move-object/from16 v7, v24

    .line 311
    .line 312
    goto :goto_4

    .line 313
    :cond_6
    move-object/from16 v7, v24

    .line 314
    .line 315
    iget v8, v7, Landroid/graphics/Rect;->bottom:I

    .line 316
    .line 317
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 318
    .line 319
    .line 320
    move-result v9

    .line 321
    iget v10, v4, Landroid/graphics/Rect;->top:I

    .line 322
    .line 323
    sub-int/2addr v9, v10

    .line 324
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 325
    .line 326
    .line 327
    move-result v8

    .line 328
    iput v8, v7, Landroid/graphics/Rect;->bottom:I

    .line 329
    .line 330
    goto :goto_4

    .line 331
    :cond_7
    move-object/from16 v7, v24

    .line 332
    .line 333
    iget v8, v7, Landroid/graphics/Rect;->top:I

    .line 334
    .line 335
    iget v9, v4, Landroid/graphics/Rect;->bottom:I

    .line 336
    .line 337
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 338
    .line 339
    .line 340
    move-result v8

    .line 341
    iput v8, v7, Landroid/graphics/Rect;->top:I

    .line 342
    .line 343
    :goto_4
    and-int/lit8 v5, v5, 0x7

    .line 344
    .line 345
    const/4 v8, 0x3

    .line 346
    if-eq v5, v8, :cond_9

    .line 347
    .line 348
    const/4 v8, 0x5

    .line 349
    if-eq v5, v8, :cond_8

    .line 350
    .line 351
    goto :goto_5

    .line 352
    :cond_8
    iget v5, v7, Landroid/graphics/Rect;->right:I

    .line 353
    .line 354
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 355
    .line 356
    .line 357
    move-result v8

    .line 358
    iget v9, v4, Landroid/graphics/Rect;->left:I

    .line 359
    .line 360
    sub-int/2addr v8, v9

    .line 361
    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    .line 362
    .line 363
    .line 364
    move-result v5

    .line 365
    iput v5, v7, Landroid/graphics/Rect;->right:I

    .line 366
    .line 367
    goto :goto_5

    .line 368
    :cond_9
    iget v5, v7, Landroid/graphics/Rect;->left:I

    .line 369
    .line 370
    iget v8, v4, Landroid/graphics/Rect;->right:I

    .line 371
    .line 372
    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    .line 373
    .line 374
    .line 375
    move-result v5

    .line 376
    iput v5, v7, Landroid/graphics/Rect;->left:I

    .line 377
    .line 378
    goto :goto_5

    .line 379
    :cond_a
    move/from16 v6, v19

    .line 380
    .line 381
    move-object/from16 v7, v24

    .line 382
    .line 383
    :goto_5
    iget v1, v1, Lx5;->g:I

    .line 384
    .line 385
    if-eqz v1, :cond_14

    .line 386
    .line 387
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    if-nez v1, :cond_14

    .line 392
    .line 393
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 394
    .line 395
    invoke-virtual {v2}, Landroid/view/View;->isLaidOut()Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-nez v1, :cond_b

    .line 400
    .line 401
    goto/16 :goto_d

    .line 402
    .line 403
    :cond_b
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    if-lez v1, :cond_14

    .line 408
    .line 409
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 410
    .line 411
    .line 412
    move-result v1

    .line 413
    if-gtz v1, :cond_c

    .line 414
    .line 415
    goto/16 :goto_d

    .line 416
    .line 417
    :cond_c
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    check-cast v1, Lx5;

    .line 422
    .line 423
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 424
    .line 425
    .line 426
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 427
    .line 428
    .line 429
    move-result-object v5

    .line 430
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 431
    .line 432
    .line 433
    move-result-object v8

    .line 434
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 435
    .line 436
    .line 437
    move-result v9

    .line 438
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 439
    .line 440
    .line 441
    move-result v10

    .line 442
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 443
    .line 444
    .line 445
    move-result v11

    .line 446
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 447
    .line 448
    .line 449
    move-result v12

    .line 450
    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v5, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 454
    .line 455
    .line 456
    invoke-virtual {v8}, Landroid/graphics/Rect;->setEmpty()V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v3, v8}, Lsf;->c(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    invoke-virtual {v5}, Landroid/graphics/Rect;->isEmpty()Z

    .line 463
    .line 464
    .line 465
    move-result v8

    .line 466
    if-eqz v8, :cond_d

    .line 467
    .line 468
    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    .line 469
    .line 470
    .line 471
    invoke-virtual {v3, v5}, Lsf;->c(Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    goto/16 :goto_d

    .line 475
    .line 476
    :cond_d
    iget v8, v1, Lx5;->g:I

    .line 477
    .line 478
    invoke-static {v8, v6}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 479
    .line 480
    .line 481
    move-result v8

    .line 482
    const/16 v9, 0x30

    .line 483
    .line 484
    and-int/lit8 v10, v8, 0x30

    .line 485
    .line 486
    if-ne v10, v9, :cond_e

    .line 487
    .line 488
    iget v10, v5, Landroid/graphics/Rect;->top:I

    .line 489
    .line 490
    iget v11, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 491
    .line 492
    sub-int/2addr v10, v11

    .line 493
    iget v11, v1, Lx5;->i:I

    .line 494
    .line 495
    sub-int/2addr v10, v11

    .line 496
    iget v11, v7, Landroid/graphics/Rect;->top:I

    .line 497
    .line 498
    if-ge v10, v11, :cond_e

    .line 499
    .line 500
    sub-int/2addr v11, v10

    .line 501
    invoke-static {v2, v11}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s(Landroid/view/View;I)V

    .line 502
    .line 503
    .line 504
    const/4 v10, 0x1

    .line 505
    :goto_6
    const/16 v11, 0x50

    .line 506
    .line 507
    goto :goto_7

    .line 508
    :cond_e
    const/4 v10, 0x0

    .line 509
    goto :goto_6

    .line 510
    :goto_7
    and-int/lit8 v12, v8, 0x50

    .line 511
    .line 512
    if-ne v12, v11, :cond_f

    .line 513
    .line 514
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 515
    .line 516
    .line 517
    move-result v12

    .line 518
    iget v13, v5, Landroid/graphics/Rect;->bottom:I

    .line 519
    .line 520
    sub-int/2addr v12, v13

    .line 521
    iget v13, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 522
    .line 523
    sub-int/2addr v12, v13

    .line 524
    iget v13, v1, Lx5;->i:I

    .line 525
    .line 526
    add-int/2addr v12, v13

    .line 527
    iget v13, v7, Landroid/graphics/Rect;->bottom:I

    .line 528
    .line 529
    if-ge v12, v13, :cond_f

    .line 530
    .line 531
    sub-int/2addr v12, v13

    .line 532
    invoke-static {v2, v12}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s(Landroid/view/View;I)V

    .line 533
    .line 534
    .line 535
    const/4 v10, 0x1

    .line 536
    :cond_f
    if-nez v10, :cond_10

    .line 537
    .line 538
    const/4 v10, 0x0

    .line 539
    invoke-static {v2, v10}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s(Landroid/view/View;I)V

    .line 540
    .line 541
    .line 542
    :goto_8
    const/4 v12, 0x3

    .line 543
    goto :goto_9

    .line 544
    :cond_10
    const/4 v10, 0x0

    .line 545
    goto :goto_8

    .line 546
    :goto_9
    and-int/lit8 v13, v8, 0x3

    .line 547
    .line 548
    if-ne v13, v12, :cond_11

    .line 549
    .line 550
    iget v13, v5, Landroid/graphics/Rect;->left:I

    .line 551
    .line 552
    iget v14, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 553
    .line 554
    sub-int/2addr v13, v14

    .line 555
    iget v14, v1, Lx5;->h:I

    .line 556
    .line 557
    sub-int/2addr v13, v14

    .line 558
    iget v14, v7, Landroid/graphics/Rect;->left:I

    .line 559
    .line 560
    if-ge v13, v14, :cond_11

    .line 561
    .line 562
    sub-int/2addr v14, v13

    .line 563
    invoke-static {v2, v14}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(Landroid/view/View;I)V

    .line 564
    .line 565
    .line 566
    const/4 v13, 0x1

    .line 567
    :goto_a
    const/4 v14, 0x5

    .line 568
    goto :goto_b

    .line 569
    :cond_11
    move v13, v10

    .line 570
    goto :goto_a

    .line 571
    :goto_b
    and-int/2addr v8, v14

    .line 572
    if-ne v8, v14, :cond_12

    .line 573
    .line 574
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 575
    .line 576
    .line 577
    move-result v8

    .line 578
    iget v15, v5, Landroid/graphics/Rect;->right:I

    .line 579
    .line 580
    sub-int/2addr v8, v15

    .line 581
    iget v15, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 582
    .line 583
    sub-int/2addr v8, v15

    .line 584
    iget v1, v1, Lx5;->h:I

    .line 585
    .line 586
    add-int/2addr v8, v1

    .line 587
    iget v1, v7, Landroid/graphics/Rect;->right:I

    .line 588
    .line 589
    if-ge v8, v1, :cond_12

    .line 590
    .line 591
    sub-int/2addr v8, v1

    .line 592
    invoke-static {v2, v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(Landroid/view/View;I)V

    .line 593
    .line 594
    .line 595
    const/4 v1, 0x1

    .line 596
    goto :goto_c

    .line 597
    :cond_12
    move v1, v13

    .line 598
    :goto_c
    if-nez v1, :cond_13

    .line 599
    .line 600
    invoke-static {v2, v10}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(Landroid/view/View;I)V

    .line 601
    .line 602
    .line 603
    :cond_13
    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    .line 604
    .line 605
    .line 606
    invoke-virtual {v3, v5}, Lsf;->c(Ljava/lang/Object;)Z

    .line 607
    .line 608
    .line 609
    goto :goto_e

    .line 610
    :cond_14
    :goto_d
    const/16 v9, 0x30

    .line 611
    .line 612
    const/4 v10, 0x0

    .line 613
    const/16 v11, 0x50

    .line 614
    .line 615
    const/4 v12, 0x3

    .line 616
    const/4 v14, 0x5

    .line 617
    :goto_e
    const/4 v1, 0x2

    .line 618
    move/from16 v5, p1

    .line 619
    .line 620
    if-eq v5, v1, :cond_16

    .line 621
    .line 622
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    check-cast v1, Lx5;

    .line 627
    .line 628
    iget-object v1, v1, Lx5;->n:Landroid/graphics/Rect;

    .line 629
    .line 630
    move-object/from16 v8, v22

    .line 631
    .line 632
    invoke-virtual {v8, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 633
    .line 634
    .line 635
    invoke-virtual {v8, v4}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    if-eqz v1, :cond_15

    .line 640
    .line 641
    move/from16 v13, v17

    .line 642
    .line 643
    move-object/from16 v15, v18

    .line 644
    .line 645
    const/4 v1, 0x1

    .line 646
    goto :goto_12

    .line 647
    :cond_15
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 648
    .line 649
    .line 650
    move-result-object v1

    .line 651
    check-cast v1, Lx5;

    .line 652
    .line 653
    iget-object v1, v1, Lx5;->n:Landroid/graphics/Rect;

    .line 654
    .line 655
    invoke-virtual {v1, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 656
    .line 657
    .line 658
    :goto_f
    const/4 v1, 0x1

    .line 659
    goto :goto_10

    .line 660
    :cond_16
    move-object/from16 v8, v22

    .line 661
    .line 662
    goto :goto_f

    .line 663
    :goto_10
    add-int/lit8 v2, v21, 0x1

    .line 664
    .line 665
    move/from16 v13, v17

    .line 666
    .line 667
    :goto_11
    move-object/from16 v15, v18

    .line 668
    .line 669
    if-ge v2, v13, :cond_17

    .line 670
    .line 671
    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    check-cast v3, Landroid/view/View;

    .line 676
    .line 677
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 678
    .line 679
    .line 680
    move-result-object v3

    .line 681
    check-cast v3, Lx5;

    .line 682
    .line 683
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 684
    .line 685
    .line 686
    add-int/2addr v2, v1

    .line 687
    move-object/from16 v18, v15

    .line 688
    .line 689
    goto :goto_11

    .line 690
    :cond_17
    :goto_12
    add-int/lit8 v2, v21, 0x1

    .line 691
    .line 692
    move v9, v2

    .line 693
    move-object v12, v4

    .line 694
    move v1, v5

    .line 695
    move-object v11, v8

    .line 696
    move-object v14, v15

    .line 697
    move v15, v13

    .line 698
    move-object v13, v7

    .line 699
    move v7, v6

    .line 700
    goto/16 :goto_0

    .line 701
    .line 702
    :cond_18
    move-object v3, v8

    .line 703
    move-object v8, v11

    .line 704
    move-object v4, v12

    .line 705
    move-object v7, v13

    .line 706
    invoke-virtual {v7}, Landroid/graphics/Rect;->setEmpty()V

    .line 707
    .line 708
    .line 709
    invoke-virtual {v3, v7}, Lsf;->c(Ljava/lang/Object;)Z

    .line 710
    .line 711
    .line 712
    invoke-virtual {v4}, Landroid/graphics/Rect;->setEmpty()V

    .line 713
    .line 714
    .line 715
    invoke-virtual {v3, v4}, Lsf;->c(Ljava/lang/Object;)Z

    .line 716
    .line 717
    .line 718
    invoke-virtual {v8}, Landroid/graphics/Rect;->setEmpty()V

    .line 719
    .line 720
    .line 721
    invoke-virtual {v3, v8}, Lsf;->c(Ljava/lang/Object;)Z

    .line 722
    .line 723
    .line 724
    return-void
.end method

.method public final o(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isChildrenDrawingOrderEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/lit8 v2, v1, -0x1

    .line 18
    .line 19
    :goto_0
    if-ltz v2, :cond_1

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->getChildDrawingOrder(II)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    move v3, v2

    .line 29
    :goto_1
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v2, v2, -0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:LA5;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v1, 0x0

    .line 51
    :goto_2
    if-ge v1, v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Landroid/view/View;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lx5;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ly5;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ly5;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-static {p0}, LCj;->c(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Z

    .line 48
    .line 49
    return-void
.end method

.method public final onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j:Landroid/view/View;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iput-boolean v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Z

    .line 33
    .line 34
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->n:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, LLk;->d()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-lez v0, :cond_1

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v2, v1, v1, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o(Landroid/view/MotionEvent;)V

    const/4 p1, 0x1

    if-eq v0, p1, :cond_1

    const/4 p1, 0x3

    if-ne v0, p1, :cond_2

    :cond_1
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public final onLayout(ZIIII)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 5
    .line 6
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutDirection()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget-object v9, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v10

    .line 16
    const/4 v12, 0x0

    .line 17
    :goto_0
    if-ge v12, v10, :cond_e

    .line 18
    .line 19
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    move-object v13, v3

    .line 24
    check-cast v13, Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/16 v4, 0x8

    .line 31
    .line 32
    if-ne v3, v4, :cond_0

    .line 33
    .line 34
    move-object/from16 p4, v9

    .line 35
    .line 36
    goto/16 :goto_5

    .line 37
    .line 38
    :cond_0
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lx5;

    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lx5;

    .line 52
    .line 53
    iget-object v4, v3, Lx5;->j:Landroid/view/View;

    .line 54
    .line 55
    if-nez v4, :cond_2

    .line 56
    .line 57
    iget v5, v3, Lx5;->e:I

    .line 58
    .line 59
    const/4 v6, -0x1

    .line 60
    if-ne v5, v6, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 64
    .line 65
    const-string v2, "An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete."

    .line 66
    .line 67
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw v0

    .line 71
    :cond_2
    :goto_1
    sget-object v14, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Lsf;

    .line 72
    .line 73
    if-eqz v4, :cond_3

    .line 74
    .line 75
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 76
    .line 77
    .line 78
    move-result-object v15

    .line 79
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    :try_start_0
    invoke-virtual {v1, v4, v15}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    move-object v7, v3

    .line 91
    check-cast v7, Lx5;

    .line 92
    .line 93
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    .line 98
    .line 99
    .line 100
    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 101
    move v3, v2

    .line 102
    move-object v4, v15

    .line 103
    move/from16 p1, v5

    .line 104
    .line 105
    move-object v5, v8

    .line 106
    move/from16 p2, v6

    .line 107
    .line 108
    move-object v6, v7

    .line 109
    move-object v11, v7

    .line 110
    move/from16 v7, p2

    .line 111
    .line 112
    move-object/from16 p4, v9

    .line 113
    .line 114
    move-object v9, v8

    .line 115
    move/from16 v8, p1

    .line 116
    .line 117
    :try_start_1
    invoke-static/range {v3 .. v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k(ILandroid/graphics/Rect;Landroid/graphics/Rect;Lx5;II)V

    .line 118
    .line 119
    .line 120
    move/from16 v4, p1

    .line 121
    .line 122
    move/from16 v3, p2

    .line 123
    .line 124
    invoke-virtual {v1, v11, v9, v3, v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h(Lx5;Landroid/graphics/Rect;II)V

    .line 125
    .line 126
    .line 127
    iget v3, v9, Landroid/graphics/Rect;->left:I

    .line 128
    .line 129
    iget v4, v9, Landroid/graphics/Rect;->top:I

    .line 130
    .line 131
    iget v5, v9, Landroid/graphics/Rect;->right:I

    .line 132
    .line 133
    iget v6, v9, Landroid/graphics/Rect;->bottom:I

    .line 134
    .line 135
    invoke-virtual {v13, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 136
    .line 137
    .line 138
    invoke-virtual {v15}, Landroid/graphics/Rect;->setEmpty()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v14, v15}, Lsf;->c(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    invoke-virtual {v9}, Landroid/graphics/Rect;->setEmpty()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v14, v9}, Lsf;->c(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    goto/16 :goto_5

    .line 151
    .line 152
    :catchall_0
    move-exception v0

    .line 153
    goto :goto_2

    .line 154
    :catchall_1
    move-exception v0

    .line 155
    move-object v9, v8

    .line 156
    :goto_2
    invoke-virtual {v15}, Landroid/graphics/Rect;->setEmpty()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v14, v15}, Lsf;->c(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    invoke-virtual {v9}, Landroid/graphics/Rect;->setEmpty()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v14, v9}, Lsf;->c(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    throw v0

    .line 169
    :cond_3
    move-object/from16 p4, v9

    .line 170
    .line 171
    iget v3, v3, Lx5;->d:I

    .line 172
    .line 173
    if-ltz v3, :cond_a

    .line 174
    .line 175
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Lx5;

    .line 180
    .line 181
    iget v5, v4, Lx5;->b:I

    .line 182
    .line 183
    if-nez v5, :cond_4

    .line 184
    .line 185
    const v5, 0x800035

    .line 186
    .line 187
    .line 188
    :cond_4
    invoke-static {v5, v2}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    and-int/lit8 v6, v5, 0x7

    .line 193
    .line 194
    and-int/lit8 v5, v5, 0x70

    .line 195
    .line 196
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 197
    .line 198
    .line 199
    move-result v7

    .line 200
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    .line 205
    .line 206
    .line 207
    move-result v9

    .line 208
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    .line 209
    .line 210
    .line 211
    move-result v11

    .line 212
    if-ne v2, v0, :cond_5

    .line 213
    .line 214
    sub-int v3, v7, v3

    .line 215
    .line 216
    :cond_5
    invoke-virtual {v1, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l(I)I

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    sub-int/2addr v3, v9

    .line 221
    if-eq v6, v0, :cond_7

    .line 222
    .line 223
    const/4 v14, 0x5

    .line 224
    if-eq v6, v14, :cond_6

    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_6
    add-int/2addr v3, v9

    .line 228
    goto :goto_3

    .line 229
    :cond_7
    div-int/lit8 v6, v9, 0x2

    .line 230
    .line 231
    add-int/2addr v3, v6

    .line 232
    :goto_3
    const/16 v6, 0x10

    .line 233
    .line 234
    if-eq v5, v6, :cond_9

    .line 235
    .line 236
    const/16 v6, 0x50

    .line 237
    .line 238
    if-eq v5, v6, :cond_8

    .line 239
    .line 240
    const/4 v5, 0x0

    .line 241
    goto :goto_4

    .line 242
    :cond_8
    move v5, v11

    .line 243
    goto :goto_4

    .line 244
    :cond_9
    div-int/lit8 v5, v11, 0x2

    .line 245
    .line 246
    :goto_4
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    .line 247
    .line 248
    .line 249
    move-result v6

    .line 250
    iget v14, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 251
    .line 252
    add-int/2addr v6, v14

    .line 253
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    .line 254
    .line 255
    .line 256
    move-result v14

    .line 257
    sub-int/2addr v7, v14

    .line 258
    sub-int/2addr v7, v9

    .line 259
    iget v14, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 260
    .line 261
    sub-int/2addr v7, v14

    .line 262
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    .line 271
    .line 272
    .line 273
    move-result v6

    .line 274
    iget v7, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 275
    .line 276
    add-int/2addr v6, v7

    .line 277
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    .line 278
    .line 279
    .line 280
    move-result v7

    .line 281
    sub-int/2addr v8, v7

    .line 282
    sub-int/2addr v8, v11

    .line 283
    iget v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 284
    .line 285
    sub-int/2addr v8, v4

    .line 286
    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    .line 287
    .line 288
    .line 289
    move-result v4

    .line 290
    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    .line 291
    .line 292
    .line 293
    move-result v4

    .line 294
    add-int/2addr v9, v3

    .line 295
    add-int/2addr v11, v4

    .line 296
    invoke-virtual {v13, v3, v4, v9, v11}, Landroid/view/View;->layout(IIII)V

    .line 297
    .line 298
    .line 299
    goto/16 :goto_5

    .line 300
    .line 301
    :cond_a
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    check-cast v3, Lx5;

    .line 306
    .line 307
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 308
    .line 309
    .line 310
    move-result-object v9

    .line 311
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    iget v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 316
    .line 317
    add-int/2addr v4, v5

    .line 318
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    .line 319
    .line 320
    .line 321
    move-result v5

    .line 322
    iget v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 323
    .line 324
    add-int/2addr v5, v6

    .line 325
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    .line 326
    .line 327
    .line 328
    move-result v6

    .line 329
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    .line 330
    .line 331
    .line 332
    move-result v7

    .line 333
    sub-int/2addr v6, v7

    .line 334
    iget v7, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 335
    .line 336
    sub-int/2addr v6, v7

    .line 337
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    .line 338
    .line 339
    .line 340
    move-result v7

    .line 341
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    .line 342
    .line 343
    .line 344
    move-result v8

    .line 345
    sub-int/2addr v7, v8

    .line 346
    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 347
    .line 348
    sub-int/2addr v7, v8

    .line 349
    invoke-virtual {v9, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 350
    .line 351
    .line 352
    iget-object v4, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 353
    .line 354
    if-eqz v4, :cond_b

    .line 355
    .line 356
    sget-object v4, LLj;->a:Ljava/util/WeakHashMap;

    .line 357
    .line 358
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 359
    .line 360
    .line 361
    move-result v4

    .line 362
    if-eqz v4, :cond_b

    .line 363
    .line 364
    invoke-virtual {v13}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 365
    .line 366
    .line 367
    move-result v4

    .line 368
    if-nez v4, :cond_b

    .line 369
    .line 370
    iget v4, v9, Landroid/graphics/Rect;->left:I

    .line 371
    .line 372
    iget-object v5, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 373
    .line 374
    invoke-virtual {v5}, LLk;->b()I

    .line 375
    .line 376
    .line 377
    move-result v5

    .line 378
    add-int/2addr v5, v4

    .line 379
    iput v5, v9, Landroid/graphics/Rect;->left:I

    .line 380
    .line 381
    iget v4, v9, Landroid/graphics/Rect;->top:I

    .line 382
    .line 383
    iget-object v5, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 384
    .line 385
    invoke-virtual {v5}, LLk;->d()I

    .line 386
    .line 387
    .line 388
    move-result v5

    .line 389
    add-int/2addr v5, v4

    .line 390
    iput v5, v9, Landroid/graphics/Rect;->top:I

    .line 391
    .line 392
    iget v4, v9, Landroid/graphics/Rect;->right:I

    .line 393
    .line 394
    iget-object v5, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 395
    .line 396
    invoke-virtual {v5}, LLk;->c()I

    .line 397
    .line 398
    .line 399
    move-result v5

    .line 400
    sub-int/2addr v4, v5

    .line 401
    iput v4, v9, Landroid/graphics/Rect;->right:I

    .line 402
    .line 403
    iget v4, v9, Landroid/graphics/Rect;->bottom:I

    .line 404
    .line 405
    iget-object v5, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 406
    .line 407
    invoke-virtual {v5}, LLk;->a()I

    .line 408
    .line 409
    .line 410
    move-result v5

    .line 411
    sub-int/2addr v4, v5

    .line 412
    iput v4, v9, Landroid/graphics/Rect;->bottom:I

    .line 413
    .line 414
    :cond_b
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()Landroid/graphics/Rect;

    .line 415
    .line 416
    .line 417
    move-result-object v11

    .line 418
    iget v3, v3, Lx5;->b:I

    .line 419
    .line 420
    and-int/lit8 v4, v3, 0x7

    .line 421
    .line 422
    if-nez v4, :cond_c

    .line 423
    .line 424
    const v4, 0x800003

    .line 425
    .line 426
    .line 427
    or-int/2addr v3, v4

    .line 428
    :cond_c
    and-int/lit8 v4, v3, 0x70

    .line 429
    .line 430
    if-nez v4, :cond_d

    .line 431
    .line 432
    or-int/lit8 v3, v3, 0x30

    .line 433
    .line 434
    :cond_d
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    .line 435
    .line 436
    .line 437
    move-result v4

    .line 438
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    .line 439
    .line 440
    .line 441
    move-result v5

    .line 442
    move-object v6, v9

    .line 443
    move-object v7, v11

    .line 444
    move v8, v2

    .line 445
    invoke-static/range {v3 .. v8}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 446
    .line 447
    .line 448
    iget v3, v11, Landroid/graphics/Rect;->left:I

    .line 449
    .line 450
    iget v4, v11, Landroid/graphics/Rect;->top:I

    .line 451
    .line 452
    iget v5, v11, Landroid/graphics/Rect;->right:I

    .line 453
    .line 454
    iget v6, v11, Landroid/graphics/Rect;->bottom:I

    .line 455
    .line 456
    invoke-virtual {v13, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v9}, Landroid/graphics/Rect;->setEmpty()V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v14, v9}, Lsf;->c(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    invoke-virtual {v11}, Landroid/graphics/Rect;->setEmpty()V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v14, v11}, Lsf;->c(Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    :goto_5
    add-int/2addr v12, v0

    .line 472
    move-object/from16 v9, p4

    .line 473
    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :cond_e
    return-void
.end method

.method public final onMeasure(II)V
    .locals 30

    .line 1
    move-object/from16 v6, p0

    .line 2
    .line 3
    const/4 v7, 0x1

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v8, 0x0

    .line 12
    move v1, v8

    .line 13
    :goto_0
    if-ge v1, v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d:LN6;

    .line 20
    .line 21
    iget-object v3, v3, LN6;->e:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v3, Lhh;

    .line 24
    .line 25
    iget v4, v3, Lhh;->e:I

    .line 26
    .line 27
    move v5, v8

    .line 28
    :goto_1
    if-ge v5, v4, :cond_1

    .line 29
    .line 30
    invoke-virtual {v3, v5}, Lhh;->h(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    check-cast v9, Ljava/util/ArrayList;

    .line 35
    .line 36
    if-eqz v9, :cond_0

    .line 37
    .line 38
    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    if-eqz v9, :cond_0

    .line 43
    .line 44
    move v0, v7

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    add-int/2addr v5, v7

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    add-int/2addr v1, v7

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v0, v8

    .line 51
    :goto_2
    iget-boolean v1, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Z

    .line 52
    .line 53
    if-eq v0, v1, :cond_7

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    iget-boolean v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Z

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    iget-object v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 62
    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    new-instance v0, Ly5;

    .line 66
    .line 67
    invoke-direct {v0, v6}, Ly5;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    .line 68
    .line 69
    .line 70
    iput-object v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 71
    .line 72
    :cond_3
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iput-boolean v7, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Z

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_5
    iget-boolean v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Z

    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    iget-object v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ly5;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 99
    .line 100
    .line 101
    :cond_6
    iput-boolean v8, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Z

    .line 102
    .line 103
    :cond_7
    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    .line 112
    .line 113
    .line 114
    move-result v10

    .line 115
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 120
    .line 121
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getLayoutDirection()I

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    if-ne v11, v7, :cond_8

    .line 126
    .line 127
    move v12, v7

    .line 128
    goto :goto_4

    .line 129
    :cond_8
    move v12, v8

    .line 130
    :goto_4
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 131
    .line 132
    .line 133
    move-result v13

    .line 134
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 135
    .line 136
    .line 137
    move-result v14

    .line 138
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 139
    .line 140
    .line 141
    move-result v15

    .line 142
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 143
    .line 144
    .line 145
    move-result v16

    .line 146
    add-int v17, v9, v10

    .line 147
    .line 148
    add-int v18, v0, v1

    .line 149
    .line 150
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getSuggestedMinimumWidth()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getSuggestedMinimumHeight()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iget-object v2, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 159
    .line 160
    if-eqz v2, :cond_9

    .line 161
    .line 162
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_9

    .line 167
    .line 168
    move/from16 v19, v7

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_9
    move/from16 v19, v8

    .line 172
    .line 173
    :goto_5
    iget-object v5, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    move v3, v0

    .line 180
    move v2, v1

    .line 181
    move v0, v8

    .line 182
    move v1, v0

    .line 183
    :goto_6
    if-ge v1, v4, :cond_14

    .line 184
    .line 185
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v20

    .line 189
    check-cast v20, Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getVisibility()I

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    const/16 v8, 0x8

    .line 196
    .line 197
    if-ne v7, v8, :cond_a

    .line 198
    .line 199
    move/from16 v22, v1

    .line 200
    .line 201
    move v8, v4

    .line 202
    move-object/from16 v23, v5

    .line 203
    .line 204
    const/4 v4, 0x1

    .line 205
    const/16 v21, 0x0

    .line 206
    .line 207
    goto/16 :goto_c

    .line 208
    .line 209
    :cond_a
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    check-cast v7, Lx5;

    .line 214
    .line 215
    iget v8, v7, Lx5;->d:I

    .line 216
    .line 217
    if-ltz v8, :cond_12

    .line 218
    .line 219
    if-eqz v13, :cond_12

    .line 220
    .line 221
    invoke-virtual {v6, v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l(I)I

    .line 222
    .line 223
    .line 224
    move-result v8

    .line 225
    move/from16 v22, v0

    .line 226
    .line 227
    iget v0, v7, Lx5;->b:I

    .line 228
    .line 229
    if-nez v0, :cond_b

    .line 230
    .line 231
    const v0, 0x800035

    .line 232
    .line 233
    .line 234
    :cond_b
    invoke-static {v0, v11}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    and-int/lit8 v0, v0, 0x7

    .line 239
    .line 240
    move/from16 v23, v1

    .line 241
    .line 242
    const/4 v1, 0x3

    .line 243
    if-ne v0, v1, :cond_c

    .line 244
    .line 245
    if-eqz v12, :cond_d

    .line 246
    .line 247
    :cond_c
    const/4 v1, 0x5

    .line 248
    if-ne v0, v1, :cond_e

    .line 249
    .line 250
    if-eqz v12, :cond_e

    .line 251
    .line 252
    :cond_d
    sub-int v0, v14, v10

    .line 253
    .line 254
    sub-int/2addr v0, v8

    .line 255
    const/4 v1, 0x0

    .line 256
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    :goto_7
    move v8, v0

    .line 261
    goto :goto_a

    .line 262
    :cond_e
    if-ne v0, v1, :cond_f

    .line 263
    .line 264
    if-eqz v12, :cond_10

    .line 265
    .line 266
    :cond_f
    const/4 v1, 0x3

    .line 267
    if-ne v0, v1, :cond_11

    .line 268
    .line 269
    if-eqz v12, :cond_11

    .line 270
    .line 271
    :cond_10
    sub-int/2addr v8, v9

    .line 272
    const/4 v1, 0x0

    .line 273
    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    goto :goto_7

    .line 278
    :cond_11
    :goto_8
    const/4 v1, 0x0

    .line 279
    goto :goto_9

    .line 280
    :cond_12
    move/from16 v22, v0

    .line 281
    .line 282
    move/from16 v23, v1

    .line 283
    .line 284
    goto :goto_8

    .line 285
    :goto_9
    move v8, v1

    .line 286
    :goto_a
    if-eqz v19, :cond_13

    .line 287
    .line 288
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_13

    .line 293
    .line 294
    iget-object v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 295
    .line 296
    invoke-virtual {v0}, LLk;->b()I

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    iget-object v1, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 301
    .line 302
    invoke-virtual {v1}, LLk;->c()I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    add-int/2addr v1, v0

    .line 307
    iget-object v0, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 308
    .line 309
    invoke-virtual {v0}, LLk;->d()I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    move/from16 v24, v2

    .line 314
    .line 315
    iget-object v2, v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 316
    .line 317
    invoke-virtual {v2}, LLk;->a()I

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    add-int/2addr v2, v0

    .line 322
    sub-int v0, v14, v1

    .line 323
    .line 324
    invoke-static {v0, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    sub-int v1, v16, v2

    .line 329
    .line 330
    invoke-static {v1, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    move v2, v0

    .line 335
    move/from16 v25, v1

    .line 336
    .line 337
    goto :goto_b

    .line 338
    :cond_13
    move/from16 v24, v2

    .line 339
    .line 340
    move/from16 v2, p1

    .line 341
    .line 342
    move/from16 v25, p2

    .line 343
    .line 344
    :goto_b
    const/16 v26, 0x0

    .line 345
    .line 346
    move/from16 v1, v22

    .line 347
    .line 348
    move-object/from16 v0, p0

    .line 349
    .line 350
    move/from16 v27, v1

    .line 351
    .line 352
    move/from16 v22, v23

    .line 353
    .line 354
    const/16 v21, 0x0

    .line 355
    .line 356
    move-object/from16 v1, v20

    .line 357
    .line 358
    move/from16 v28, v24

    .line 359
    .line 360
    move/from16 v29, v3

    .line 361
    .line 362
    move v3, v8

    .line 363
    move v8, v4

    .line 364
    move/from16 v4, v25

    .line 365
    .line 366
    move-object/from16 v23, v5

    .line 367
    .line 368
    move/from16 v5, v26

    .line 369
    .line 370
    invoke-virtual/range {v0 .. v5}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 371
    .line 372
    .line 373
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredWidth()I

    .line 374
    .line 375
    .line 376
    move-result v0

    .line 377
    add-int v0, v0, v17

    .line 378
    .line 379
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 380
    .line 381
    add-int/2addr v0, v1

    .line 382
    iget v1, v7, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 383
    .line 384
    add-int/2addr v0, v1

    .line 385
    move/from16 v1, v29

    .line 386
    .line 387
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 388
    .line 389
    .line 390
    move-result v0

    .line 391
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredHeight()I

    .line 392
    .line 393
    .line 394
    move-result v1

    .line 395
    add-int v1, v1, v18

    .line 396
    .line 397
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 398
    .line 399
    add-int/2addr v1, v2

    .line 400
    iget v2, v7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 401
    .line 402
    add-int/2addr v1, v2

    .line 403
    move/from16 v2, v28

    .line 404
    .line 405
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredState()I

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    move/from16 v3, v27

    .line 414
    .line 415
    invoke-static {v3, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    move v3, v0

    .line 420
    move v0, v2

    .line 421
    const/4 v4, 0x1

    .line 422
    move v2, v1

    .line 423
    :goto_c
    add-int/lit8 v1, v22, 0x1

    .line 424
    .line 425
    move v7, v4

    .line 426
    move v4, v8

    .line 427
    move/from16 v8, v21

    .line 428
    .line 429
    move-object/from16 v5, v23

    .line 430
    .line 431
    goto/16 :goto_6

    .line 432
    .line 433
    :cond_14
    move v1, v3

    .line 434
    move v3, v0

    .line 435
    const/high16 v0, -0x1000000

    .line 436
    .line 437
    and-int/2addr v0, v3

    .line 438
    move/from16 v4, p1

    .line 439
    .line 440
    invoke-static {v1, v4, v0}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    shl-int/lit8 v1, v3, 0x10

    .line 445
    .line 446
    move/from16 v3, p2

    .line 447
    .line 448
    invoke-static {v2, v3, v1}, Landroid/view/View;->resolveSizeAndState(III)I

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    invoke-virtual {v6, v0, v1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 453
    .line 454
    .line 455
    return-void
.end method

.method public final onNestedFling(Landroid/view/View;FFZ)Z
    .locals 2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    check-cast p4, Lx5;

    invoke-virtual {p4, p2}, Lx5;->a(I)Z

    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public final onNestedPreFling(Landroid/view/View;FF)Z
    .locals 3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lx5;

    invoke-virtual {v0, p2}, Lx5;->a(I)Z

    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public final onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p3, p1, p4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(III[I)V

    return-void
.end method

.method public final onNestedScroll(Landroid/view/View;IIII)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;IIIII)V

    return-void
.end method

.method public final onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lz5;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p1, Lz5;

    .line 10
    .line 11
    iget-object p1, p1, Ld;->a:Landroid/os/Parcelable;

    .line 12
    .line 13
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, 0x0

    .line 21
    :goto_0
    if-ge v0, p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m(Landroid/view/View;)Lx5;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public final onSaveInstanceState()Landroid/os/Parcelable;
    .locals 5

    .line 1
    new-instance v0, Lz5;

    .line 2
    .line 3
    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ld;-><init>(Landroid/os/Parcelable;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_0
    if-ge v3, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Lx5;

    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iput-object v1, v0, Lz5;->c:Landroid/util/SparseArray;

    .line 42
    .line 43
    return-object v0
.end method

.method public final onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;Landroid/view/View;II)Z

    return v0
.end method

.method public final onStopNestedScroll(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o(Landroid/view/MotionEvent;)V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    :cond_1
    return p1
.end method

.method public final p()V
    .locals 15

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d:LN6;

    .line 7
    .line 8
    iget-object v2, v1, LN6;->e:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Lhh;

    .line 11
    .line 12
    iget v3, v2, Lhh;->e:I

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    move v5, v4

    .line 16
    :goto_0
    iget-object v6, v1, LN6;->d:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v6, LM0;

    .line 19
    .line 20
    if-ge v5, v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {v2, v5}, Lhh;->h(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    check-cast v7, Ljava/util/ArrayList;

    .line 27
    .line 28
    if-eqz v7, :cond_0

    .line 29
    .line 30
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6, v7}, LM0;->c(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {v2}, Lhh;->clear()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    move v3, v4

    .line 47
    :goto_1
    iget-object v5, v1, LN6;->e:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v5, Lhh;

    .line 50
    .line 51
    if-ge v3, v2, :cond_1a

    .line 52
    .line 53
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    invoke-static {v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m(Landroid/view/View;)Lx5;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    iget v9, v8, Lx5;->e:I

    .line 62
    .line 63
    const/4 v10, 0x0

    .line 64
    const/4 v11, -0x1

    .line 65
    if-ne v9, v11, :cond_2

    .line 66
    .line 67
    iput-object v10, v8, Lx5;->k:Landroid/view/View;

    .line 68
    .line 69
    iput-object v10, v8, Lx5;->j:Landroid/view/View;

    .line 70
    .line 71
    goto/16 :goto_7

    .line 72
    .line 73
    :cond_2
    iget-object v11, v8, Lx5;->j:Landroid/view/View;

    .line 74
    .line 75
    if-eqz v11, :cond_8

    .line 76
    .line 77
    invoke-virtual {v11}, Landroid/view/View;->getId()I

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-eq v11, v9, :cond_3

    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_3
    iget-object v11, v8, Lx5;->j:Landroid/view/View;

    .line 85
    .line 86
    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    :goto_2
    if-eq v12, p0, :cond_7

    .line 91
    .line 92
    if-eqz v12, :cond_6

    .line 93
    .line 94
    if-ne v12, v7, :cond_4

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_4
    instance-of v13, v12, Landroid/view/View;

    .line 98
    .line 99
    if-eqz v13, :cond_5

    .line 100
    .line 101
    move-object v11, v12

    .line 102
    check-cast v11, Landroid/view/View;

    .line 103
    .line 104
    :cond_5
    invoke-interface {v12}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 105
    .line 106
    .line 107
    move-result-object v12

    .line 108
    goto :goto_2

    .line 109
    :cond_6
    :goto_3
    iput-object v10, v8, Lx5;->k:Landroid/view/View;

    .line 110
    .line 111
    iput-object v10, v8, Lx5;->j:Landroid/view/View;

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_7
    iput-object v11, v8, Lx5;->k:Landroid/view/View;

    .line 115
    .line 116
    goto :goto_7

    .line 117
    :cond_8
    :goto_4
    invoke-virtual {p0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    iput-object v11, v8, Lx5;->j:Landroid/view/View;

    .line 122
    .line 123
    if-eqz v11, :cond_f

    .line 124
    .line 125
    if-ne v11, p0, :cond_a

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 128
    .line 129
    .line 130
    move-result v9

    .line 131
    if-eqz v9, :cond_9

    .line 132
    .line 133
    :goto_5
    iput-object v10, v8, Lx5;->k:Landroid/view/View;

    .line 134
    .line 135
    iput-object v10, v8, Lx5;->j:Landroid/view/View;

    .line 136
    .line 137
    goto :goto_7

    .line 138
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 139
    .line 140
    const-string v1, "View can not be anchored to the the parent CoordinatorLayout"

    .line 141
    .line 142
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw v0

    .line 146
    :cond_a
    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    :goto_6
    if-eq v9, p0, :cond_e

    .line 151
    .line 152
    if-eqz v9, :cond_e

    .line 153
    .line 154
    if-ne v9, v7, :cond_c

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 157
    .line 158
    .line 159
    move-result v9

    .line 160
    if-eqz v9, :cond_b

    .line 161
    .line 162
    goto :goto_5

    .line 163
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 164
    .line 165
    const-string v1, "Anchor must not be a descendant of the anchored view"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw v0

    .line 171
    :cond_c
    instance-of v12, v9, Landroid/view/View;

    .line 172
    .line 173
    if-eqz v12, :cond_d

    .line 174
    .line 175
    move-object v11, v9

    .line 176
    check-cast v11, Landroid/view/View;

    .line 177
    .line 178
    :cond_d
    invoke-interface {v9}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    goto :goto_6

    .line 183
    :cond_e
    iput-object v11, v8, Lx5;->k:Landroid/view/View;

    .line 184
    .line 185
    goto :goto_7

    .line 186
    :cond_f
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 187
    .line 188
    .line 189
    move-result v11

    .line 190
    if-eqz v11, :cond_19

    .line 191
    .line 192
    goto :goto_5

    .line 193
    :goto_7
    invoke-virtual {v5, v7}, Lhh;->containsKey(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v9

    .line 197
    if-nez v9, :cond_10

    .line 198
    .line 199
    invoke-virtual {v5, v7, v10}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    :cond_10
    move v9, v4

    .line 203
    :goto_8
    if-ge v9, v2, :cond_18

    .line 204
    .line 205
    if-ne v9, v3, :cond_11

    .line 206
    .line 207
    goto :goto_9

    .line 208
    :cond_11
    invoke-virtual {p0, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v11

    .line 212
    iget-object v12, v8, Lx5;->k:Landroid/view/View;

    .line 213
    .line 214
    if-eq v11, v12, :cond_12

    .line 215
    .line 216
    sget-object v12, LLj;->a:Ljava/util/WeakHashMap;

    .line 217
    .line 218
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 219
    .line 220
    .line 221
    move-result v12

    .line 222
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 223
    .line 224
    .line 225
    move-result-object v13

    .line 226
    check-cast v13, Lx5;

    .line 227
    .line 228
    iget v13, v13, Lx5;->f:I

    .line 229
    .line 230
    invoke-static {v13, v12}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 231
    .line 232
    .line 233
    move-result v13

    .line 234
    if-eqz v13, :cond_16

    .line 235
    .line 236
    iget v14, v8, Lx5;->g:I

    .line 237
    .line 238
    invoke-static {v14, v12}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    .line 239
    .line 240
    .line 241
    move-result v12

    .line 242
    and-int/2addr v12, v13

    .line 243
    if-ne v12, v13, :cond_16

    .line 244
    .line 245
    :cond_12
    invoke-virtual {v5, v11}, Lhh;->containsKey(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v12

    .line 249
    if-nez v12, :cond_13

    .line 250
    .line 251
    invoke-virtual {v5, v11}, Lhh;->containsKey(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v12

    .line 255
    if-nez v12, :cond_13

    .line 256
    .line 257
    invoke-virtual {v5, v11, v10}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    :cond_13
    invoke-virtual {v5, v11}, Lhh;->containsKey(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v12

    .line 264
    if-eqz v12, :cond_17

    .line 265
    .line 266
    invoke-virtual {v5, v7}, Lhh;->containsKey(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v12

    .line 270
    if-eqz v12, :cond_17

    .line 271
    .line 272
    invoke-virtual {v5, v11}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v12

    .line 276
    check-cast v12, Ljava/util/ArrayList;

    .line 277
    .line 278
    if-nez v12, :cond_15

    .line 279
    .line 280
    invoke-virtual {v6}, LM0;->a()Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v12

    .line 284
    check-cast v12, Ljava/util/ArrayList;

    .line 285
    .line 286
    if-nez v12, :cond_14

    .line 287
    .line 288
    new-instance v12, Ljava/util/ArrayList;

    .line 289
    .line 290
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .line 292
    .line 293
    :cond_14
    invoke-virtual {v5, v11, v12}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    :cond_15
    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    :cond_16
    :goto_9
    add-int/lit8 v9, v9, 0x1

    .line 300
    .line 301
    goto :goto_8

    .line 302
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 303
    .line 304
    const-string v1, "All nodes must be present in the graph before being added as an edge"

    .line 305
    .line 306
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    throw v0

    .line 310
    :cond_18
    add-int/lit8 v3, v3, 0x1

    .line 311
    .line 312
    goto/16 :goto_1

    .line 313
    .line 314
    :cond_19
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 315
    .line 316
    new-instance v1, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    const-string v2, "Could not find CoordinatorLayout descendant view with id "

    .line 319
    .line 320
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    const-string v2, " to anchor view "

    .line 335
    .line 336
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    throw v0

    .line 350
    :cond_1a
    iget-object v2, v1, LN6;->c:Ljava/lang/Object;

    .line 351
    .line 352
    check-cast v2, Ljava/util/ArrayList;

    .line 353
    .line 354
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 355
    .line 356
    .line 357
    iget-object v3, v1, LN6;->f:Ljava/lang/Object;

    .line 358
    .line 359
    check-cast v3, Ljava/util/HashSet;

    .line 360
    .line 361
    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    .line 362
    .line 363
    .line 364
    iget v6, v5, Lhh;->e:I

    .line 365
    .line 366
    :goto_a
    if-ge v4, v6, :cond_1b

    .line 367
    .line 368
    invoke-virtual {v5, v4}, Lhh;->e(I)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v7

    .line 372
    invoke-virtual {v1, v7, v2, v3}, LN6;->c(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 373
    .line 374
    .line 375
    add-int/lit8 v4, v4, 0x1

    .line 376
    .line 377
    goto :goto_a

    .line 378
    :cond_1b
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 379
    .line 380
    .line 381
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 382
    .line 383
    .line 384
    return-void
.end method

.method public final q()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lx5;

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iput-boolean v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g:Z

    .line 26
    .line 27
    return-void
.end method

.method public final requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lx5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    move-result p1

    return p1
.end method

.method public final requestDisallowInterceptTouchEvent(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-boolean p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g:Z

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    if-ge v0, p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lx5;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q()V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g:Z

    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public setFitsSystemWindows(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setFitsSystemWindows(Z)V

    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t()V

    return-void
.end method

.method public setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .locals 0

    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eq v0, p1, :cond_5

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_1
    iput-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v1, 0x0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    move v0, v1

    .line 59
    :goto_0
    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    sget-object p1, LLj;->a:Ljava/util/WeakHashMap;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 70
    .line 71
    .line 72
    :cond_5
    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .locals 1

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStatusBarBackgroundResource(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setVisibility(I)V
    .locals 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_1

    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_1
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:Li0;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Li0;

    .line 14
    .line 15
    const/4 v1, 0x6

    .line 16
    invoke-direct {v0, v1, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:Li0;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:Li0;

    .line 22
    .line 23
    invoke-static {p0, v0}, LEj;->i(Landroid/view/View;LMe;)V

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x500

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    invoke-static {p0, v0}, LEj;->i(Landroid/view/View;LMe;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    return-void
.end method

.method public final verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

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
