.class public final LL0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:LN0;

.field public final c:Landroid/view/Window;

.field public d:Ljava/lang/CharSequence;

.field public e:Landroidx/appcompat/app/AlertController$RecycleListView;

.field public f:Landroid/widget/Button;

.field public g:Landroid/widget/Button;

.field public h:Landroid/widget/Button;

.field public i:Landroidx/core/widget/NestedScrollView;

.field public j:I

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:Landroid/widget/ImageView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/view/View;

.field public p:Landroid/widget/ListAdapter;

.field public q:I

.field public final r:I

.field public final s:I

.field public final t:I

.field public final u:I

.field public final v:Z

.field public final w:LJ0;

.field public final x:LV;


# direct methods
.method public constructor <init>(Landroid/content/Context;LN0;Landroid/view/Window;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LL0;->j:I

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, LL0;->q:I

    .line 9
    .line 10
    new-instance v1, LV;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-direct {v1, v2, p0}, LV;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, LL0;->x:LV;

    .line 17
    .line 18
    iput-object p1, p0, LL0;->a:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p2, p0, LL0;->b:LN0;

    .line 21
    .line 22
    iput-object p3, p0, LL0;->c:Landroid/view/Window;

    .line 23
    .line 24
    new-instance p3, LJ0;

    .line 25
    .line 26
    invoke-direct {p3}, Landroid/os/Handler;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p3, LJ0;->a:Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    iput-object p3, p0, LL0;->w:LJ0;

    .line 37
    .line 38
    sget-object p3, LNf;->e:[I

    .line 39
    .line 40
    const v1, 0x7f030026

    .line 41
    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {p1, v2, p3, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    iput p3, p0, LL0;->r:I

    .line 53
    .line 54
    const/4 p3, 0x2

    .line 55
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 56
    .line 57
    .line 58
    const/4 p3, 0x4

    .line 59
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    iput p3, p0, LL0;->s:I

    .line 64
    .line 65
    const/4 p3, 0x5

    .line 66
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 67
    .line 68
    .line 69
    const/4 p3, 0x7

    .line 70
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    iput p3, p0, LL0;->t:I

    .line 75
    .line 76
    const/4 p3, 0x3

    .line 77
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    iput p3, p0, LL0;->u:I

    .line 82
    .line 83
    const/4 p3, 0x6

    .line 84
    const/4 v1, 0x1

    .line 85
    invoke-virtual {p1, p3, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    iput-boolean p3, p0, LL0;->v:Z

    .line 90
    .line 91
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2}, LN0;->b()Lx1;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1, v1}, Lx1;->g(I)Z

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 2

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    instance-of p0, p1, Landroid/view/ViewStub;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewStub;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :cond_0
    check-cast p1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_1
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    instance-of p1, p0, Landroid/view/ViewStub;

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    check-cast p0, Landroid/view/ViewStub;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    :cond_3
    check-cast p0, Landroid/view/ViewGroup;

    .line 42
    .line 43
    return-object p0
.end method
