.class public final LM1;
.super Lx1;
.source "SourceFile"

# interfaces
.implements LKd;
.implements Landroid/view/LayoutInflater$Factory2;


# static fields
.field public static final j0:Lhh;

.field public static final k0:[I

.field public static final l0:Z

.field public static final m0:Z


# instance fields
.field public A:LVj;

.field public B:Z

.field public C:Landroid/view/ViewGroup;

.field public D:Landroid/widget/TextView;

.field public E:Landroid/view/View;

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:[LL1;

.field public O:LL1;

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:Landroid/content/res/Configuration;

.field public final U:I

.field public V:I

.field public W:I

.field public X:Z

.field public Y:LH1;

.field public Z:LH1;

.field public a0:Z

.field public b0:I

.field public final c0:Ly1;

.field public d0:Z

.field public e0:Landroid/graphics/Rect;

.field public f0:Landroid/graphics/Rect;

.field public g0:LM2;

.field public h0:Landroid/window/OnBackInvokedDispatcher;

.field public i0:Landroid/window/OnBackInvokedCallback;

.field public final l:Ljava/lang/Object;

.field public final m:Landroid/content/Context;

.field public n:Landroid/view/Window;

.field public o:LG1;

.field public final p:Lq1;

.field public q:LT;

.field public r:LQh;

.field public s:Ljava/lang/CharSequence;

.field public t:Lv6;

.field public u:Lz1;

.field public v:Lz1;

.field public w:Lo0;

.field public x:Landroidx/appcompat/widget/ActionBarContextView;

.field public y:Landroid/widget/PopupWindow;

.field public z:Ly1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lhh;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lhh;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LM1;->j0:Lhh;

    .line 8
    .line 9
    const v0, 0x1010054

    .line 10
    .line 11
    .line 12
    filled-new-array {v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, LM1;->k0:[I

    .line 17
    .line 18
    const-string v0, "robolectric"

    .line 19
    .line 20
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x1

    .line 27
    xor-int/2addr v0, v1

    .line 28
    sput-boolean v0, LM1;->l0:Z

    .line 29
    .line 30
    sput-boolean v1, LM1;->m0:Z

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/Window;Lq1;Ljava/lang/Object;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, LM1;->A:LVj;

    .line 6
    .line 7
    const/16 v1, -0x64

    .line 8
    .line 9
    iput v1, p0, LM1;->U:I

    .line 10
    .line 11
    new-instance v2, Ly1;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v2, p0, v3}, Ly1;-><init>(LM1;I)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, LM1;->c0:Ly1;

    .line 18
    .line 19
    iput-object p1, p0, LM1;->m:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p3, p0, LM1;->p:Lq1;

    .line 22
    .line 23
    iput-object p4, p0, LM1;->l:Ljava/lang/Object;

    .line 24
    .line 25
    instance-of p3, p4, Landroid/app/Dialog;

    .line 26
    .line 27
    if-eqz p3, :cond_2

    .line 28
    .line 29
    :goto_0
    if-eqz p1, :cond_1

    .line 30
    .line 31
    instance-of p3, p1, Lm1;

    .line 32
    .line 33
    if-eqz p3, :cond_0

    .line 34
    .line 35
    move-object v0, p1

    .line 36
    check-cast v0, Lm1;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    instance-of p3, p1, Landroid/content/ContextWrapper;

    .line 40
    .line 41
    if-eqz p3, :cond_1

    .line 42
    .line 43
    check-cast p1, Landroid/content/ContextWrapper;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Lm1;->getDelegate()Lx1;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, LM1;

    .line 57
    .line 58
    iget p1, p1, LM1;->U:I

    .line 59
    .line 60
    iput p1, p0, LM1;->U:I

    .line 61
    .line 62
    :cond_2
    iget p1, p0, LM1;->U:I

    .line 63
    .line 64
    if-ne p1, v1, :cond_3

    .line 65
    .line 66
    sget-object p1, LM1;->j0:Lhh;

    .line 67
    .line 68
    iget-object p3, p0, LM1;->l:Ljava/lang/Object;

    .line 69
    .line 70
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {p1, p3}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    check-cast p3, Ljava/lang/Integer;

    .line 83
    .line 84
    if-eqz p3, :cond_3

    .line 85
    .line 86
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result p3

    .line 90
    iput p3, p0, LM1;->U:I

    .line 91
    .line 92
    iget-object p3, p0, LM1;->l:Ljava/lang/Object;

    .line 93
    .line 94
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-virtual {p1, p3}, Lhh;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    :cond_3
    if-eqz p2, :cond_4

    .line 106
    .line 107
    invoke-virtual {p0, p2}, LM1;->o(Landroid/view/Window;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    invoke-static {}, LP1;->c()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static A(Landroid/content/res/Configuration;)Lvd;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, LD1;->b(Landroid/content/res/Configuration;)Lvd;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 13
    .line 14
    invoke-static {p0}, LC1;->a(Ljava/util/Locale;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lvd;->b(Ljava/lang/String;)Lvd;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static p(Landroid/content/Context;)Lvd;
    .locals 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    sget-object v1, Lx1;->e:Lvd;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, LM1;->A(Landroid/content/res/Configuration;)Lvd;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/16 v2, 0x18

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    iget-object v1, v1, Lvd;->a:Lxd;

    .line 34
    .line 35
    if-lt v0, v2, :cond_6

    .line 36
    .line 37
    invoke-interface {v1}, Lxd;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    sget-object v0, Lvd;->b:Lvd;

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-interface {v1}, Lxd;->size()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v4, p0, Lvd;->a:Lxd;

    .line 56
    .line 57
    invoke-interface {v4}, Lxd;->size()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    add-int/2addr v4, v2

    .line 62
    if-ge v3, v4, :cond_5

    .line 63
    .line 64
    invoke-interface {v1}, Lxd;->size()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-ge v3, v2, :cond_3

    .line 69
    .line 70
    invoke-interface {v1, v3}, Lxd;->get(I)Ljava/util/Locale;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    invoke-interface {v1}, Lxd;->size()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    sub-int v2, v3, v2

    .line 80
    .line 81
    iget-object v4, p0, Lvd;->a:Lxd;

    .line 82
    .line 83
    invoke-interface {v4, v2}, Lxd;->get(I)Ljava/util/Locale;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    :goto_1
    if-eqz v2, :cond_4

    .line 88
    .line 89
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    new-array v1, v1, [Ljava/util/Locale;

    .line 100
    .line 101
    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, [Ljava/util/Locale;

    .line 106
    .line 107
    invoke-static {v0}, Lvd;->a([Ljava/util/Locale;)Lvd;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    goto :goto_2

    .line 112
    :cond_6
    invoke-interface {v1}, Lxd;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    sget-object v0, Lvd;->b:Lvd;

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_7
    invoke-interface {v1, v3}, Lxd;->get(I)Ljava/util/Locale;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Lvd;->b(Ljava/lang/String;)Lvd;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    :goto_2
    iget-object v1, v0, Lvd;->a:Lxd;

    .line 134
    .line 135
    invoke-interface {v1}, Lxd;->isEmpty()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_8

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_8
    move-object p0, v0

    .line 143
    :goto_3
    return-object p0
.end method

.method public static u(Landroid/content/Context;ILvd;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    move p0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    .line 25
    .line 26
    and-int/lit8 p0, p0, 0x30

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/16 p0, 0x20

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/16 p0, 0x10

    .line 33
    .line 34
    :goto_0
    new-instance p1, Landroid/content/res/Configuration;

    .line 35
    .line 36
    invoke-direct {p1}, Landroid/content/res/Configuration;-><init>()V

    .line 37
    .line 38
    .line 39
    const/4 p4, 0x0

    .line 40
    iput p4, p1, Landroid/content/res/Configuration;->fontScale:F

    .line 41
    .line 42
    if-eqz p3, :cond_3

    .line 43
    .line 44
    invoke-virtual {p1, p3}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget p3, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 48
    .line 49
    and-int/lit8 p3, p3, -0x31

    .line 50
    .line 51
    or-int/2addr p0, p3

    .line 52
    iput p0, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 53
    .line 54
    if-eqz p2, :cond_5

    .line 55
    .line 56
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 57
    .line 58
    const/16 p3, 0x18

    .line 59
    .line 60
    if-lt p0, p3, :cond_4

    .line 61
    .line 62
    invoke-static {p1, p2}, LD1;->d(Landroid/content/res/Configuration;Lvd;)V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    iget-object p0, p2, Lvd;->a:Lxd;

    .line 67
    .line 68
    invoke-interface {p0, v1}, Lxd;->get(I)Ljava/util/Locale;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {p1, p2}, LB1;->b(Landroid/content/res/Configuration;Ljava/util/Locale;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p0, v1}, Lxd;->get(I)Ljava/util/Locale;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p1, p0}, LB1;->a(Landroid/content/res/Configuration;Ljava/util/Locale;)V

    .line 80
    .line 81
    .line 82
    :cond_5
    :goto_1
    return-object p1
.end method


# virtual methods
.method public final B(I)LL1;
    .locals 4

    .line 1
    iget-object v0, p0, LM1;->N:[LL1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    if-gt v2, p1, :cond_2

    .line 8
    .line 9
    :cond_0
    add-int/lit8 v2, p1, 0x1

    .line 10
    .line 11
    new-array v2, v2, [LL1;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    array-length v3, v0

    .line 16
    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iput-object v2, p0, LM1;->N:[LL1;

    .line 20
    .line 21
    move-object v0, v2

    .line 22
    :cond_2
    aget-object v2, v0, p1

    .line 23
    .line 24
    if-nez v2, :cond_3

    .line 25
    .line 26
    new-instance v2, LL1;

    .line 27
    .line 28
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput p1, v2, LL1;->a:I

    .line 32
    .line 33
    iput-boolean v1, v2, LL1;->n:Z

    .line 34
    .line 35
    aput-object v2, v0, p1

    .line 36
    .line 37
    :cond_3
    return-object v2
.end method

.method public final C()V
    .locals 3

    .line 1
    invoke-virtual {p0}, LM1;->x()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, LM1;->H:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, LM1;->q:LT;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v0, p0, LM1;->l:Ljava/lang/Object;

    .line 14
    .line 15
    instance-of v1, v0, Landroid/app/Activity;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    new-instance v1, Lqk;

    .line 20
    .line 21
    check-cast v0, Landroid/app/Activity;

    .line 22
    .line 23
    iget-boolean v2, p0, LM1;->I:Z

    .line 24
    .line 25
    invoke-direct {v1, v0, v2}, Lqk;-><init>(Landroid/app/Activity;Z)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iput-object v1, p0, LM1;->q:LT;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    instance-of v1, v0, Landroid/app/Dialog;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    new-instance v1, Lqk;

    .line 36
    .line 37
    check-cast v0, Landroid/app/Dialog;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Lqk;-><init>(Landroid/app/Dialog;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    :goto_1
    iget-object v0, p0, LM1;->q:LT;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-boolean v1, p0, LM1;->d0:Z

    .line 48
    .line 49
    invoke-virtual {v0, v1}, LT;->l(Z)V

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_2
    return-void
.end method

.method public final D(I)V
    .locals 2

    .line 1
    iget v0, p0, LM1;->b0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    shl-int p1, v1, p1

    .line 5
    .line 6
    or-int/2addr p1, v0

    .line 7
    iput p1, p0, LM1;->b0:I

    .line 8
    .line 9
    iget-boolean p1, p0, LM1;->a0:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, LM1;->n:Landroid/view/Window;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 20
    .line 21
    iget-object v0, p0, LM1;->c0:Ly1;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iput-boolean v1, p0, LM1;->a0:Z

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final E(Landroid/content/Context;I)I
    .locals 2

    .line 1
    const/16 v0, -0x64

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq p2, v0, :cond_5

    .line 5
    .line 6
    if-eq p2, v1, :cond_4

    .line 7
    .line 8
    if-eqz p2, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p2, v0, :cond_4

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p2, v0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-ne p2, v0, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, LM1;->Z:LH1;

    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    new-instance p2, LH1;

    .line 24
    .line 25
    invoke-direct {p2, p0, p1}, LH1;-><init>(LM1;Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, LM1;->Z:LH1;

    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, LM1;->Z:LH1;

    .line 31
    .line 32
    invoke-virtual {p1}, LH1;->e()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    return p1

    .line 37
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    const-string p2, "Unknown value set for night mode. Please use one of the MODE_NIGHT values from AppCompatDelegate."

    .line 40
    .line 41
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p1

    .line 45
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const-string v0, "uimode"

    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, Landroid/app/UiModeManager;

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/app/UiModeManager;->getNightMode()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_3

    .line 62
    .line 63
    return v1

    .line 64
    :cond_3
    invoke-virtual {p0, p1}, LM1;->z(Landroid/content/Context;)LJ1;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, LJ1;->e()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    return p1

    .line 73
    :cond_4
    return p2

    .line 74
    :cond_5
    return v1
.end method

.method public final F()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, LM1;->P:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, LM1;->P:Z

    .line 5
    .line 6
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iget-boolean v3, v2, LL1;->m:Z

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2, v4}, LM1;->t(LL1;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return v4

    .line 21
    :cond_1
    iget-object v0, p0, LM1;->w:Lo0;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lo0;->a()V

    .line 26
    .line 27
    .line 28
    return v4

    .line 29
    :cond_2
    invoke-virtual {p0}, LM1;->C()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, LM1;->q:LT;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {v0}, LT;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    return v4

    .line 43
    :cond_3
    return v1
.end method

.method public final G(LL1;Landroid/view/KeyEvent;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-boolean v2, v1, LL1;->m:Z

    .line 6
    .line 7
    if-nez v2, :cond_1b

    .line 8
    .line 9
    iget-boolean v2, v0, LM1;->S:Z

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_a

    .line 14
    .line 15
    :cond_0
    iget v2, v1, LL1;->a:I

    .line 16
    .line 17
    iget-object v3, v0, LM1;->m:Landroid/content/Context;

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iget v4, v4, Landroid/content/res/Configuration;->screenLayout:I

    .line 30
    .line 31
    and-int/lit8 v4, v4, 0xf

    .line 32
    .line 33
    const/4 v5, 0x4

    .line 34
    if-ne v4, v5, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v4, v0, LM1;->n:Landroid/view/Window;

    .line 38
    .line 39
    invoke-virtual {v4}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const/4 v5, 0x1

    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    iget-object v6, v1, LL1;->h:LMd;

    .line 47
    .line 48
    invoke-interface {v4, v2, v6}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-nez v4, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0, v1, v5}, LM1;->t(LL1;Z)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    const-string v4, "window"

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Landroid/view/WindowManager;

    .line 65
    .line 66
    if-nez v4, :cond_3

    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    invoke-virtual/range {p0 .. p2}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-nez v6, :cond_4

    .line 74
    .line 75
    return-void

    .line 76
    :cond_4
    iget-object v6, v1, LL1;->e:LK1;

    .line 77
    .line 78
    const/4 v7, 0x0

    .line 79
    const/4 v8, -0x2

    .line 80
    if-eqz v6, :cond_6

    .line 81
    .line 82
    iget-boolean v9, v1, LL1;->n:Z

    .line 83
    .line 84
    if-eqz v9, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    iget-object v3, v1, LL1;->g:Landroid/view/View;

    .line 88
    .line 89
    if-eqz v3, :cond_18

    .line 90
    .line 91
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    if-eqz v3, :cond_18

    .line 96
    .line 97
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 98
    .line 99
    const/4 v6, -0x1

    .line 100
    if-ne v3, v6, :cond_18

    .line 101
    .line 102
    move v10, v6

    .line 103
    goto/16 :goto_8

    .line 104
    .line 105
    :cond_6
    :goto_0
    if-nez v6, :cond_b

    .line 106
    .line 107
    invoke-virtual/range {p0 .. p0}, LM1;->C()V

    .line 108
    .line 109
    .line 110
    iget-object v6, v0, LM1;->q:LT;

    .line 111
    .line 112
    if-eqz v6, :cond_7

    .line 113
    .line 114
    invoke-virtual {v6}, LT;->e()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    goto :goto_1

    .line 119
    :cond_7
    const/4 v6, 0x0

    .line 120
    :goto_1
    if-nez v6, :cond_8

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_8
    move-object v3, v6

    .line 124
    :goto_2
    new-instance v6, Landroid/util/TypedValue;

    .line 125
    .line 126
    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v9

    .line 133
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 138
    .line 139
    .line 140
    move-result-object v10

    .line 141
    invoke-virtual {v9, v10}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 142
    .line 143
    .line 144
    const v10, 0x7f030002

    .line 145
    .line 146
    .line 147
    invoke-virtual {v9, v10, v6, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 148
    .line 149
    .line 150
    iget v10, v6, Landroid/util/TypedValue;->resourceId:I

    .line 151
    .line 152
    if-eqz v10, :cond_9

    .line 153
    .line 154
    invoke-virtual {v9, v10, v5}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 155
    .line 156
    .line 157
    :cond_9
    const v10, 0x7f0300c9

    .line 158
    .line 159
    .line 160
    invoke-virtual {v9, v10, v6, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 161
    .line 162
    .line 163
    iget v6, v6, Landroid/util/TypedValue;->resourceId:I

    .line 164
    .line 165
    if-eqz v6, :cond_a

    .line 166
    .line 167
    :goto_3
    invoke-virtual {v9, v6, v5}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_a
    const v6, 0x7f0e00ff

    .line 172
    .line 173
    .line 174
    goto :goto_3

    .line 175
    :goto_4
    new-instance v6, Lq5;

    .line 176
    .line 177
    invoke-direct {v6, v3, v7}, Lq5;-><init>(Landroid/content/Context;I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6}, Lq5;->getTheme()Landroid/content/res/Resources$Theme;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v3, v9}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 185
    .line 186
    .line 187
    iput-object v6, v1, LL1;->j:Lq5;

    .line 188
    .line 189
    sget-object v3, LNf;->j:[I

    .line 190
    .line 191
    invoke-virtual {v6, v3}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    const/16 v6, 0x56

    .line 196
    .line 197
    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 198
    .line 199
    .line 200
    move-result v6

    .line 201
    iput v6, v1, LL1;->b:I

    .line 202
    .line 203
    invoke-virtual {v3, v5, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 204
    .line 205
    .line 206
    move-result v6

    .line 207
    iput v6, v1, LL1;->d:I

    .line 208
    .line 209
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 210
    .line 211
    .line 212
    new-instance v3, LK1;

    .line 213
    .line 214
    iget-object v6, v1, LL1;->j:Lq5;

    .line 215
    .line 216
    invoke-direct {v3, v0, v6}, LK1;-><init>(LM1;Lq5;)V

    .line 217
    .line 218
    .line 219
    iput-object v3, v1, LL1;->e:LK1;

    .line 220
    .line 221
    const/16 v3, 0x51

    .line 222
    .line 223
    iput v3, v1, LL1;->c:I

    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_b
    iget-boolean v3, v1, LL1;->n:Z

    .line 227
    .line 228
    if-eqz v3, :cond_c

    .line 229
    .line 230
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    if-lez v3, :cond_c

    .line 235
    .line 236
    iget-object v3, v1, LL1;->e:LK1;

    .line 237
    .line 238
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 239
    .line 240
    .line 241
    :cond_c
    :goto_5
    iget-object v3, v1, LL1;->g:Landroid/view/View;

    .line 242
    .line 243
    if-eqz v3, :cond_d

    .line 244
    .line 245
    iput-object v3, v1, LL1;->f:Landroid/view/View;

    .line 246
    .line 247
    goto :goto_6

    .line 248
    :cond_d
    iget-object v3, v1, LL1;->h:LMd;

    .line 249
    .line 250
    if-nez v3, :cond_e

    .line 251
    .line 252
    goto/16 :goto_9

    .line 253
    .line 254
    :cond_e
    iget-object v3, v0, LM1;->v:Lz1;

    .line 255
    .line 256
    if-nez v3, :cond_f

    .line 257
    .line 258
    new-instance v3, Lz1;

    .line 259
    .line 260
    const/4 v6, 0x3

    .line 261
    invoke-direct {v3, v0, v6}, Lz1;-><init>(LM1;I)V

    .line 262
    .line 263
    .line 264
    iput-object v3, v0, LM1;->v:Lz1;

    .line 265
    .line 266
    :cond_f
    iget-object v3, v0, LM1;->v:Lz1;

    .line 267
    .line 268
    iget-object v6, v1, LL1;->i:Lgd;

    .line 269
    .line 270
    if-nez v6, :cond_10

    .line 271
    .line 272
    new-instance v6, Lgd;

    .line 273
    .line 274
    iget-object v9, v1, LL1;->j:Lq5;

    .line 275
    .line 276
    invoke-direct {v6, v9}, Lgd;-><init>(Landroid/content/Context;)V

    .line 277
    .line 278
    .line 279
    iput-object v6, v1, LL1;->i:Lgd;

    .line 280
    .line 281
    iput-object v3, v6, Lgd;->g:Lhe;

    .line 282
    .line 283
    iget-object v3, v1, LL1;->h:LMd;

    .line 284
    .line 285
    iget-object v9, v3, LMd;->a:Landroid/content/Context;

    .line 286
    .line 287
    invoke-virtual {v3, v6, v9}, LMd;->b(Lie;Landroid/content/Context;)V

    .line 288
    .line 289
    .line 290
    :cond_10
    iget-object v3, v1, LL1;->i:Lgd;

    .line 291
    .line 292
    iget-object v6, v1, LL1;->e:LK1;

    .line 293
    .line 294
    iget-object v9, v3, Lgd;->f:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 295
    .line 296
    if-nez v9, :cond_12

    .line 297
    .line 298
    iget-object v9, v3, Lgd;->d:Landroid/view/LayoutInflater;

    .line 299
    .line 300
    const v10, 0x7f0b000d

    .line 301
    .line 302
    .line 303
    invoke-virtual {v9, v10, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 304
    .line 305
    .line 306
    move-result-object v6

    .line 307
    check-cast v6, Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 308
    .line 309
    iput-object v6, v3, Lgd;->f:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 310
    .line 311
    iget-object v6, v3, Lgd;->h:Lfd;

    .line 312
    .line 313
    if-nez v6, :cond_11

    .line 314
    .line 315
    new-instance v6, Lfd;

    .line 316
    .line 317
    invoke-direct {v6, v3}, Lfd;-><init>(Lgd;)V

    .line 318
    .line 319
    .line 320
    iput-object v6, v3, Lgd;->h:Lfd;

    .line 321
    .line 322
    :cond_11
    iget-object v6, v3, Lgd;->f:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 323
    .line 324
    iget-object v9, v3, Lgd;->h:Lfd;

    .line 325
    .line 326
    invoke-virtual {v6, v9}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 327
    .line 328
    .line 329
    iget-object v6, v3, Lgd;->f:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 330
    .line 331
    invoke-virtual {v6, v3}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 332
    .line 333
    .line 334
    :cond_12
    iget-object v3, v3, Lgd;->f:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 335
    .line 336
    iput-object v3, v1, LL1;->f:Landroid/view/View;

    .line 337
    .line 338
    if-eqz v3, :cond_1a

    .line 339
    .line 340
    :goto_6
    iget-object v3, v1, LL1;->f:Landroid/view/View;

    .line 341
    .line 342
    if-nez v3, :cond_13

    .line 343
    .line 344
    goto/16 :goto_9

    .line 345
    .line 346
    :cond_13
    iget-object v3, v1, LL1;->g:Landroid/view/View;

    .line 347
    .line 348
    if-eqz v3, :cond_14

    .line 349
    .line 350
    goto :goto_7

    .line 351
    :cond_14
    iget-object v3, v1, LL1;->i:Lgd;

    .line 352
    .line 353
    iget-object v6, v3, Lgd;->h:Lfd;

    .line 354
    .line 355
    if-nez v6, :cond_15

    .line 356
    .line 357
    new-instance v6, Lfd;

    .line 358
    .line 359
    invoke-direct {v6, v3}, Lfd;-><init>(Lgd;)V

    .line 360
    .line 361
    .line 362
    iput-object v6, v3, Lgd;->h:Lfd;

    .line 363
    .line 364
    :cond_15
    iget-object v3, v3, Lgd;->h:Lfd;

    .line 365
    .line 366
    invoke-virtual {v3}, Lfd;->getCount()I

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    if-lez v3, :cond_1a

    .line 371
    .line 372
    :goto_7
    iget-object v3, v1, LL1;->f:Landroid/view/View;

    .line 373
    .line 374
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    if-nez v3, :cond_16

    .line 379
    .line 380
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .line 381
    .line 382
    invoke-direct {v3, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 383
    .line 384
    .line 385
    :cond_16
    iget v6, v1, LL1;->b:I

    .line 386
    .line 387
    iget-object v9, v1, LL1;->e:LK1;

    .line 388
    .line 389
    invoke-virtual {v9, v6}, LK1;->setBackgroundResource(I)V

    .line 390
    .line 391
    .line 392
    iget-object v6, v1, LL1;->f:Landroid/view/View;

    .line 393
    .line 394
    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 395
    .line 396
    .line 397
    move-result-object v6

    .line 398
    instance-of v9, v6, Landroid/view/ViewGroup;

    .line 399
    .line 400
    if-eqz v9, :cond_17

    .line 401
    .line 402
    check-cast v6, Landroid/view/ViewGroup;

    .line 403
    .line 404
    iget-object v9, v1, LL1;->f:Landroid/view/View;

    .line 405
    .line 406
    invoke-virtual {v6, v9}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 407
    .line 408
    .line 409
    :cond_17
    iget-object v6, v1, LL1;->e:LK1;

    .line 410
    .line 411
    iget-object v9, v1, LL1;->f:Landroid/view/View;

    .line 412
    .line 413
    invoke-virtual {v6, v9, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 414
    .line 415
    .line 416
    iget-object v3, v1, LL1;->f:Landroid/view/View;

    .line 417
    .line 418
    invoke-virtual {v3}, Landroid/view/View;->hasFocus()Z

    .line 419
    .line 420
    .line 421
    move-result v3

    .line 422
    if-nez v3, :cond_18

    .line 423
    .line 424
    iget-object v3, v1, LL1;->f:Landroid/view/View;

    .line 425
    .line 426
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 427
    .line 428
    .line 429
    :cond_18
    move v10, v8

    .line 430
    :goto_8
    iput-boolean v7, v1, LL1;->l:Z

    .line 431
    .line 432
    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    .line 433
    .line 434
    const/4 v13, 0x0

    .line 435
    const/16 v14, 0x3ea

    .line 436
    .line 437
    const/4 v11, -0x2

    .line 438
    const/4 v12, 0x0

    .line 439
    const/high16 v15, 0x820000

    .line 440
    .line 441
    const/16 v16, -0x3

    .line 442
    .line 443
    move-object v9, v3

    .line 444
    invoke-direct/range {v9 .. v16}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    .line 445
    .line 446
    .line 447
    iget v6, v1, LL1;->c:I

    .line 448
    .line 449
    iput v6, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 450
    .line 451
    iget v6, v1, LL1;->d:I

    .line 452
    .line 453
    iput v6, v3, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 454
    .line 455
    iget-object v6, v1, LL1;->e:LK1;

    .line 456
    .line 457
    invoke-interface {v4, v6, v3}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 458
    .line 459
    .line 460
    iput-boolean v5, v1, LL1;->m:Z

    .line 461
    .line 462
    if-nez v2, :cond_19

    .line 463
    .line 464
    invoke-virtual/range {p0 .. p0}, LM1;->K()V

    .line 465
    .line 466
    .line 467
    :cond_19
    return-void

    .line 468
    :cond_1a
    :goto_9
    iput-boolean v5, v1, LL1;->n:Z

    .line 469
    .line 470
    :cond_1b
    :goto_a
    return-void
.end method

.method public final H(LL1;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isSystem()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p1, LL1;->k:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1, p3}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    :cond_1
    iget-object p1, p1, LL1;->h:LMd;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p1, p2, p3, v0}, LMd;->performShortcut(ILandroid/view/KeyEvent;I)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    :cond_2
    return v1
.end method

.method public final I(LL1;Landroid/view/KeyEvent;)Z
    .locals 12

    .line 1
    iget-boolean v0, p0, LM1;->S:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p1, LL1;->k:Z

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return v2

    .line 13
    :cond_1
    iget-object v0, p0, LM1;->O:LL1;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-eq v0, p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, LM1;->t(LL1;Z)V

    .line 20
    .line 21
    .line 22
    :cond_2
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v3, p1, LL1;->a:I

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-interface {v0, v3}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iput-object v4, p1, LL1;->g:Landroid/view/View;

    .line 37
    .line 38
    :cond_3
    const/16 v4, 0x6c

    .line 39
    .line 40
    if-eqz v3, :cond_5

    .line 41
    .line 42
    if-ne v3, v4, :cond_4

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    move v5, v1

    .line 46
    goto :goto_1

    .line 47
    :cond_5
    :goto_0
    move v5, v2

    .line 48
    :goto_1
    if-eqz v5, :cond_6

    .line 49
    .line 50
    iget-object v6, p0, LM1;->t:Lv6;

    .line 51
    .line 52
    if-eqz v6, :cond_6

    .line 53
    .line 54
    check-cast v6, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 55
    .line 56
    invoke-virtual {v6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 57
    .line 58
    .line 59
    iget-object v6, v6, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 60
    .line 61
    check-cast v6, LHi;

    .line 62
    .line 63
    iput-boolean v2, v6, LHi;->l:Z

    .line 64
    .line 65
    :cond_6
    iget-object v6, p1, LL1;->g:Landroid/view/View;

    .line 66
    .line 67
    if-nez v6, :cond_1e

    .line 68
    .line 69
    if-eqz v5, :cond_7

    .line 70
    .line 71
    iget-object v6, p0, LM1;->q:LT;

    .line 72
    .line 73
    instance-of v6, v6, LEi;

    .line 74
    .line 75
    if-nez v6, :cond_1e

    .line 76
    .line 77
    :cond_7
    iget-object v6, p1, LL1;->h:LMd;

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    if-eqz v6, :cond_8

    .line 81
    .line 82
    iget-boolean v8, p1, LL1;->o:Z

    .line 83
    .line 84
    if-eqz v8, :cond_18

    .line 85
    .line 86
    :cond_8
    if-nez v6, :cond_11

    .line 87
    .line 88
    iget-object v6, p0, LM1;->m:Landroid/content/Context;

    .line 89
    .line 90
    if-eqz v3, :cond_9

    .line 91
    .line 92
    if-ne v3, v4, :cond_d

    .line 93
    .line 94
    :cond_9
    iget-object v4, p0, LM1;->t:Lv6;

    .line 95
    .line 96
    if-eqz v4, :cond_d

    .line 97
    .line 98
    new-instance v4, Landroid/util/TypedValue;

    .line 99
    .line 100
    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v6}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    const v9, 0x7f030009

    .line 108
    .line 109
    .line 110
    invoke-virtual {v8, v9, v4, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 111
    .line 112
    .line 113
    iget v9, v4, Landroid/util/TypedValue;->resourceId:I

    .line 114
    .line 115
    const v10, 0x7f03000a

    .line 116
    .line 117
    .line 118
    if-eqz v9, :cond_a

    .line 119
    .line 120
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    invoke-virtual {v9, v8}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 129
    .line 130
    .line 131
    iget v11, v4, Landroid/util/TypedValue;->resourceId:I

    .line 132
    .line 133
    invoke-virtual {v9, v11, v2}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v9, v10, v4, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_a
    invoke-virtual {v8, v10, v4, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 141
    .line 142
    .line 143
    move-object v9, v7

    .line 144
    :goto_2
    iget v10, v4, Landroid/util/TypedValue;->resourceId:I

    .line 145
    .line 146
    if-eqz v10, :cond_c

    .line 147
    .line 148
    if-nez v9, :cond_b

    .line 149
    .line 150
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 151
    .line 152
    .line 153
    move-result-object v9

    .line 154
    invoke-virtual {v9}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 155
    .line 156
    .line 157
    move-result-object v9

    .line 158
    invoke-virtual {v9, v8}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 159
    .line 160
    .line 161
    :cond_b
    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    .line 162
    .line 163
    invoke-virtual {v9, v4, v2}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 164
    .line 165
    .line 166
    :cond_c
    if-eqz v9, :cond_d

    .line 167
    .line 168
    new-instance v4, Lq5;

    .line 169
    .line 170
    invoke-direct {v4, v6, v1}, Lq5;-><init>(Landroid/content/Context;I)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4}, Lq5;->getTheme()Landroid/content/res/Resources$Theme;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-virtual {v6, v9}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 178
    .line 179
    .line 180
    move-object v6, v4

    .line 181
    :cond_d
    new-instance v4, LMd;

    .line 182
    .line 183
    invoke-direct {v4, v6}, LMd;-><init>(Landroid/content/Context;)V

    .line 184
    .line 185
    .line 186
    iput-object p0, v4, LMd;->e:LKd;

    .line 187
    .line 188
    iget-object v6, p1, LL1;->h:LMd;

    .line 189
    .line 190
    if-ne v4, v6, :cond_e

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_e
    if-eqz v6, :cond_f

    .line 194
    .line 195
    iget-object v8, p1, LL1;->i:Lgd;

    .line 196
    .line 197
    invoke-virtual {v6, v8}, LMd;->r(Lie;)V

    .line 198
    .line 199
    .line 200
    :cond_f
    iput-object v4, p1, LL1;->h:LMd;

    .line 201
    .line 202
    iget-object v6, p1, LL1;->i:Lgd;

    .line 203
    .line 204
    if-eqz v6, :cond_10

    .line 205
    .line 206
    iget-object v8, v4, LMd;->a:Landroid/content/Context;

    .line 207
    .line 208
    invoke-virtual {v4, v6, v8}, LMd;->b(Lie;Landroid/content/Context;)V

    .line 209
    .line 210
    .line 211
    :cond_10
    :goto_3
    iget-object v4, p1, LL1;->h:LMd;

    .line 212
    .line 213
    if-nez v4, :cond_11

    .line 214
    .line 215
    return v1

    .line 216
    :cond_11
    if-eqz v5, :cond_13

    .line 217
    .line 218
    iget-object v4, p0, LM1;->t:Lv6;

    .line 219
    .line 220
    if-eqz v4, :cond_13

    .line 221
    .line 222
    iget-object v6, p0, LM1;->u:Lz1;

    .line 223
    .line 224
    if-nez v6, :cond_12

    .line 225
    .line 226
    new-instance v6, Lz1;

    .line 227
    .line 228
    const/4 v8, 0x2

    .line 229
    invoke-direct {v6, p0, v8}, Lz1;-><init>(LM1;I)V

    .line 230
    .line 231
    .line 232
    iput-object v6, p0, LM1;->u:Lz1;

    .line 233
    .line 234
    :cond_12
    iget-object v6, p1, LL1;->h:LMd;

    .line 235
    .line 236
    iget-object v8, p0, LM1;->u:Lz1;

    .line 237
    .line 238
    check-cast v4, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 239
    .line 240
    invoke-virtual {v4, v6, v8}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Landroid/view/Menu;Lhe;)V

    .line 241
    .line 242
    .line 243
    :cond_13
    iget-object v4, p1, LL1;->h:LMd;

    .line 244
    .line 245
    invoke-virtual {v4}, LMd;->w()V

    .line 246
    .line 247
    .line 248
    iget-object v4, p1, LL1;->h:LMd;

    .line 249
    .line 250
    invoke-interface {v0, v3, v4}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-nez v3, :cond_17

    .line 255
    .line 256
    iget-object p2, p1, LL1;->h:LMd;

    .line 257
    .line 258
    if-nez p2, :cond_14

    .line 259
    .line 260
    goto :goto_4

    .line 261
    :cond_14
    if-eqz p2, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, LL1;->i:Lgd;

    .line 264
    .line 265
    invoke-virtual {p2, v0}, LMd;->r(Lie;)V

    .line 266
    .line 267
    .line 268
    :cond_15
    iput-object v7, p1, LL1;->h:LMd;

    .line 269
    .line 270
    :goto_4
    if-eqz v5, :cond_16

    .line 271
    .line 272
    iget-object p1, p0, LM1;->t:Lv6;

    .line 273
    .line 274
    if-eqz p1, :cond_16

    .line 275
    .line 276
    iget-object p2, p0, LM1;->u:Lz1;

    .line 277
    .line 278
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 279
    .line 280
    invoke-virtual {p1, v7, p2}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Landroid/view/Menu;Lhe;)V

    .line 281
    .line 282
    .line 283
    :cond_16
    return v1

    .line 284
    :cond_17
    iput-boolean v1, p1, LL1;->o:Z

    .line 285
    .line 286
    :cond_18
    iget-object v3, p1, LL1;->h:LMd;

    .line 287
    .line 288
    invoke-virtual {v3}, LMd;->w()V

    .line 289
    .line 290
    .line 291
    iget-object v3, p1, LL1;->p:Landroid/os/Bundle;

    .line 292
    .line 293
    if-eqz v3, :cond_19

    .line 294
    .line 295
    iget-object v4, p1, LL1;->h:LMd;

    .line 296
    .line 297
    invoke-virtual {v4, v3}, LMd;->s(Landroid/os/Bundle;)V

    .line 298
    .line 299
    .line 300
    iput-object v7, p1, LL1;->p:Landroid/os/Bundle;

    .line 301
    .line 302
    :cond_19
    iget-object v3, p1, LL1;->g:Landroid/view/View;

    .line 303
    .line 304
    iget-object v4, p1, LL1;->h:LMd;

    .line 305
    .line 306
    invoke-interface {v0, v1, v3, v4}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-nez v0, :cond_1b

    .line 311
    .line 312
    if-eqz v5, :cond_1a

    .line 313
    .line 314
    iget-object p2, p0, LM1;->t:Lv6;

    .line 315
    .line 316
    if-eqz p2, :cond_1a

    .line 317
    .line 318
    iget-object v0, p0, LM1;->u:Lz1;

    .line 319
    .line 320
    check-cast p2, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 321
    .line 322
    invoke-virtual {p2, v7, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->l(Landroid/view/Menu;Lhe;)V

    .line 323
    .line 324
    .line 325
    :cond_1a
    iget-object p1, p1, LL1;->h:LMd;

    .line 326
    .line 327
    invoke-virtual {p1}, LMd;->v()V

    .line 328
    .line 329
    .line 330
    return v1

    .line 331
    :cond_1b
    if-eqz p2, :cond_1c

    .line 332
    .line 333
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    .line 334
    .line 335
    .line 336
    move-result p2

    .line 337
    goto :goto_5

    .line 338
    :cond_1c
    const/4 p2, -0x1

    .line 339
    :goto_5
    invoke-static {p2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    .line 340
    .line 341
    .line 342
    move-result-object p2

    .line 343
    invoke-virtual {p2}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    .line 344
    .line 345
    .line 346
    move-result p2

    .line 347
    if-eq p2, v2, :cond_1d

    .line 348
    .line 349
    move p2, v2

    .line 350
    goto :goto_6

    .line 351
    :cond_1d
    move p2, v1

    .line 352
    :goto_6
    iget-object v0, p1, LL1;->h:LMd;

    .line 353
    .line 354
    invoke-virtual {v0, p2}, LMd;->setQwertyMode(Z)V

    .line 355
    .line 356
    .line 357
    iget-object p2, p1, LL1;->h:LMd;

    .line 358
    .line 359
    invoke-virtual {p2}, LMd;->v()V

    .line 360
    .line 361
    .line 362
    :cond_1e
    iput-boolean v2, p1, LL1;->k:Z

    .line 363
    .line 364
    iput-boolean v1, p1, LL1;->l:Z

    .line 365
    .line 366
    iput-object p1, p0, LM1;->O:LL1;

    .line 367
    .line 368
    return v2
.end method

.method public final J()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LM1;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/util/AndroidRuntimeException;

    .line 7
    .line 8
    const-string v1, "Window feature must be requested before adding content"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw v0
.end method

.method public final K()V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-lt v0, v1, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, LL1;->m:Z

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :goto_0
    move v1, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v0, p0, LM1;->w:Lo0;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, LM1;->i0:Landroid/window/OnBackInvokedCallback;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 36
    .line 37
    invoke-static {v0, p0}, LF1;->b(Ljava/lang/Object;LM1;)Landroid/window/OnBackInvokedCallback;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, LM1;->i0:Landroid/window/OnBackInvokedCallback;

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-object v0, p0, LM1;->i0:Landroid/window/OnBackInvokedCallback;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-object v1, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 51
    .line 52
    invoke-static {v1, v0}, LF1;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    :goto_2
    return-void
.end method

.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, LM1;->m:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/LayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0}, Landroid/view/LayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    instance-of v0, v0, LM1;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "AppCompatDelegate"

    .line 26
    .line 27
    const-string v1, "The Activity\'s LayoutInflater already has a Factory installed so we can not install AppCompat\'s"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object v0, p0, LM1;->q:LT;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, LM1;->C()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LM1;->q:LT;

    .line 9
    .line 10
    invoke-virtual {v0}, LT;->f()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, LM1;->D(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LM1;->Q:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v1, v0}, LM1;->m(ZZ)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, LM1;->y()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LM1;->l:Ljava/lang/Object;

    .line 12
    .line 13
    instance-of v2, v1, Landroid/app/Activity;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    :try_start_0
    check-cast v1, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v1, v2}, LSi;->v(Landroid/content/Context;Landroid/content/ComponentName;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v1

    .line 29
    :try_start_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v2
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    .line 35
    :catch_1
    const/4 v1, 0x0

    .line 36
    :goto_0
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, LM1;->q:LT;

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    iput-boolean v0, p0, LM1;->d0:Z

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v1, v0}, LT;->l(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_1
    sget-object v1, Lx1;->j:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter v1

    .line 51
    :try_start_3
    invoke-static {p0}, Lx1;->f(Lx1;)V

    .line 52
    .line 53
    .line 54
    sget-object v2, Lx1;->i:Lg3;

    .line 55
    .line 56
    new-instance v3, Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, v3}, Lg3;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    monitor-exit v1

    .line 65
    goto :goto_2

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 68
    throw v0

    .line 69
    :cond_2
    :goto_2
    new-instance v1, Landroid/content/res/Configuration;

    .line 70
    .line 71
    iget-object v2, p0, LM1;->m:Landroid/content/Context;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, LM1;->T:Landroid/content/res/Configuration;

    .line 85
    .line 86
    iput-boolean v0, p0, LM1;->R:Z

    .line 87
    .line 88
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, LM1;->l:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, v0, Landroid/app/Activity;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lx1;->j:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {p0}, Lx1;->f(Lx1;)V

    .line 11
    .line 12
    .line 13
    monitor-exit v0

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw v1

    .line 18
    :cond_0
    :goto_0
    iget-boolean v0, p0, LM1;->a0:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, LM1;->c0:Ly1;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, LM1;->S:Z

    .line 35
    .line 36
    iget v0, p0, LM1;->U:I

    .line 37
    .line 38
    const/16 v1, -0x64

    .line 39
    .line 40
    if-eq v0, v1, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, LM1;->l:Ljava/lang/Object;

    .line 43
    .line 44
    instance-of v1, v0, Landroid/app/Activity;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    check-cast v0, Landroid/app/Activity;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    sget-object v0, LM1;->j0:Lhh;

    .line 57
    .line 58
    iget-object v1, p0, LM1;->l:Ljava/lang/Object;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget v2, p0, LM1;->U:I

    .line 69
    .line 70
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    sget-object v0, LM1;->j0:Lhh;

    .line 79
    .line 80
    iget-object v1, p0, LM1;->l:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lhh;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object v0, p0, LM1;->q:LT;

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-virtual {v0}, LT;->h()V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object v0, p0, LM1;->Y:LH1;

    .line 101
    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    invoke-virtual {v0}, LJ1;->c()V

    .line 105
    .line 106
    .line 107
    :cond_4
    iget-object v0, p0, LM1;->Z:LH1;

    .line 108
    .line 109
    if-eqz v0, :cond_5

    .line 110
    .line 111
    invoke-virtual {v0}, LJ1;->c()V

    .line 112
    .line 113
    .line 114
    :cond_5
    return-void
.end method

.method public final g(I)Z
    .locals 5

    .line 1
    const/16 v0, 0x6d

    .line 2
    .line 3
    const/16 v1, 0x6c

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    const-string v3, "AppCompatDelegate"

    .line 8
    .line 9
    if-ne p1, v2, :cond_0

    .line 10
    .line 11
    const-string p1, "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature."

    .line 12
    .line 13
    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move p1, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v2, 0x9

    .line 19
    .line 20
    if-ne p1, v2, :cond_1

    .line 21
    .line 22
    const-string p1, "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY id when requesting this feature."

    .line 23
    .line 24
    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move p1, v0

    .line 28
    :cond_1
    :goto_0
    iget-boolean v2, p0, LM1;->L:Z

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    if-ne p1, v1, :cond_2

    .line 34
    .line 35
    return v3

    .line 36
    :cond_2
    iget-boolean v2, p0, LM1;->H:Z

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    if-ne p1, v4, :cond_3

    .line 42
    .line 43
    iput-boolean v3, p0, LM1;->H:Z

    .line 44
    .line 45
    :cond_3
    if-eq p1, v4, :cond_9

    .line 46
    .line 47
    const/4 v2, 0x2

    .line 48
    if-eq p1, v2, :cond_8

    .line 49
    .line 50
    const/4 v2, 0x5

    .line 51
    if-eq p1, v2, :cond_7

    .line 52
    .line 53
    const/16 v2, 0xa

    .line 54
    .line 55
    if-eq p1, v2, :cond_6

    .line 56
    .line 57
    if-eq p1, v1, :cond_5

    .line 58
    .line 59
    if-eq p1, v0, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Landroid/view/Window;->requestFeature(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    return p1

    .line 68
    :cond_4
    invoke-virtual {p0}, LM1;->J()V

    .line 69
    .line 70
    .line 71
    iput-boolean v4, p0, LM1;->I:Z

    .line 72
    .line 73
    return v4

    .line 74
    :cond_5
    invoke-virtual {p0}, LM1;->J()V

    .line 75
    .line 76
    .line 77
    iput-boolean v4, p0, LM1;->H:Z

    .line 78
    .line 79
    return v4

    .line 80
    :cond_6
    invoke-virtual {p0}, LM1;->J()V

    .line 81
    .line 82
    .line 83
    iput-boolean v4, p0, LM1;->J:Z

    .line 84
    .line 85
    return v4

    .line 86
    :cond_7
    invoke-virtual {p0}, LM1;->J()V

    .line 87
    .line 88
    .line 89
    iput-boolean v4, p0, LM1;->G:Z

    .line 90
    .line 91
    return v4

    .line 92
    :cond_8
    invoke-virtual {p0}, LM1;->J()V

    .line 93
    .line 94
    .line 95
    iput-boolean v4, p0, LM1;->F:Z

    .line 96
    .line 97
    return v4

    .line 98
    :cond_9
    invoke-virtual {p0}, LM1;->J()V

    .line 99
    .line 100
    .line 101
    iput-boolean v4, p0, LM1;->L:Z

    .line 102
    .line 103
    return v4
.end method

.method public final h(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, LM1;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, LM1;->m:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, LM1;->o:LG1;

    .line 28
    .line 29
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, LG1;->a(Landroid/view/Window$Callback;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, LM1;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, LM1;->o:LG1;

    .line 22
    .line 23
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, LG1;->a(Landroid/view/Window$Callback;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final j(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, LM1;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 5
    .line 6
    const v1, 0x1020002

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, LM1;->o:LG1;

    .line 22
    .line 23
    iget-object p2, p0, LM1;->n:Landroid/view/Window;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1, p2}, LG1;->a(Landroid/view/Window$Callback;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final k(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iput-object p1, p0, LM1;->s:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iget-object v0, p0, LM1;->t:Lv6;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Lv6;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, LM1;->q:LT;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0, p1}, LT;->n(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v0, p0, LM1;->D:Landroid/widget/TextView;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    :goto_0
    return-void
.end method

.method public final l(Ln0;)Lo0;
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_13

    .line 3
    .line 4
    iget-object v1, p0, LM1;->w:Lo0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lo0;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance v1, LY1;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, LY1;-><init>(LM1;Ln0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, LM1;->C()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, LM1;->q:LT;

    .line 20
    .line 21
    iget-object v2, p0, LM1;->p:Lq1;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1, v1}, LT;->o(LY1;)Lo0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, LM1;->w:Lo0;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-interface {v2, p1}, Lq1;->onSupportActionModeStarted(Lo0;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object p1, p0, LM1;->w:Lo0;

    .line 39
    .line 40
    if-nez p1, :cond_12

    .line 41
    .line 42
    iget-object p1, p0, LM1;->A:LVj;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1}, LVj;->b()V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, LM1;->w:Lo0;

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Lo0;->a()V

    .line 54
    .line 55
    .line 56
    :cond_3
    const/4 p1, 0x0

    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    iget-boolean v3, p0, LM1;->S:Z

    .line 60
    .line 61
    if-nez v3, :cond_4

    .line 62
    .line 63
    :try_start_0
    invoke-interface {v2, v1}, Lq1;->onWindowStartingSupportActionMode(Ln0;)Lo0;

    .line 64
    .line 65
    .line 66
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    goto :goto_0

    .line 68
    :catch_0
    :cond_4
    move-object v3, p1

    .line 69
    :goto_0
    if-eqz v3, :cond_5

    .line 70
    .line 71
    iput-object v3, p0, LM1;->w:Lo0;

    .line 72
    .line 73
    goto/16 :goto_6

    .line 74
    .line 75
    :cond_5
    iget-object v3, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 76
    .line 77
    const/4 v4, 0x0

    .line 78
    if-nez v3, :cond_a

    .line 79
    .line 80
    iget-boolean v3, p0, LM1;->K:Z

    .line 81
    .line 82
    iget-object v5, p0, LM1;->m:Landroid/content/Context;

    .line 83
    .line 84
    if-eqz v3, :cond_7

    .line 85
    .line 86
    new-instance v3, Landroid/util/TypedValue;

    .line 87
    .line 88
    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    const v7, 0x7f030009

    .line 96
    .line 97
    .line 98
    invoke-virtual {v6, v7, v3, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 99
    .line 100
    .line 101
    iget v7, v3, Landroid/util/TypedValue;->resourceId:I

    .line 102
    .line 103
    if-eqz v7, :cond_6

    .line 104
    .line 105
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-virtual {v7}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    invoke-virtual {v7, v6}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 114
    .line 115
    .line 116
    iget v6, v3, Landroid/util/TypedValue;->resourceId:I

    .line 117
    .line 118
    invoke-virtual {v7, v6, v0}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 119
    .line 120
    .line 121
    new-instance v6, Lq5;

    .line 122
    .line 123
    invoke-direct {v6, v5, v4}, Lq5;-><init>(Landroid/content/Context;I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v6}, Lq5;->getTheme()Landroid/content/res/Resources$Theme;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v5, v7}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 131
    .line 132
    .line 133
    move-object v5, v6

    .line 134
    :cond_6
    new-instance v6, Landroidx/appcompat/widget/ActionBarContextView;

    .line 135
    .line 136
    invoke-direct {v6, v5, p1}, Landroidx/appcompat/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 137
    .line 138
    .line 139
    iput-object v6, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 140
    .line 141
    new-instance v6, Landroid/widget/PopupWindow;

    .line 142
    .line 143
    const v7, 0x7f030018

    .line 144
    .line 145
    .line 146
    invoke-direct {v6, v5, p1, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 147
    .line 148
    .line 149
    iput-object v6, p0, LM1;->y:Landroid/widget/PopupWindow;

    .line 150
    .line 151
    const/4 v7, 0x2

    .line 152
    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    .line 153
    .line 154
    .line 155
    iget-object v6, p0, LM1;->y:Landroid/widget/PopupWindow;

    .line 156
    .line 157
    iget-object v7, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 158
    .line 159
    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    iget-object v6, p0, LM1;->y:Landroid/widget/PopupWindow;

    .line 163
    .line 164
    const/4 v7, -0x1

    .line 165
    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    const v7, 0x7f030003

    .line 173
    .line 174
    .line 175
    invoke-virtual {v6, v7, v3, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 176
    .line 177
    .line 178
    iget v3, v3, Landroid/util/TypedValue;->data:I

    .line 179
    .line 180
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-static {v3, v5}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    iget-object v5, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 193
    .line 194
    invoke-virtual {v5, v3}, Landroidx/appcompat/widget/ActionBarContextView;->setContentHeight(I)V

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, LM1;->y:Landroid/widget/PopupWindow;

    .line 198
    .line 199
    const/4 v5, -0x2

    .line 200
    invoke-virtual {v3, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 201
    .line 202
    .line 203
    new-instance v3, Ly1;

    .line 204
    .line 205
    invoke-direct {v3, p0, v0}, Ly1;-><init>(LM1;I)V

    .line 206
    .line 207
    .line 208
    iput-object v3, p0, LM1;->z:Ly1;

    .line 209
    .line 210
    goto :goto_3

    .line 211
    :cond_7
    iget-object v3, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 212
    .line 213
    const v6, 0x7f080035

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    check-cast v3, Landroidx/appcompat/widget/ViewStubCompat;

    .line 221
    .line 222
    if-eqz v3, :cond_a

    .line 223
    .line 224
    invoke-virtual {p0}, LM1;->C()V

    .line 225
    .line 226
    .line 227
    iget-object v6, p0, LM1;->q:LT;

    .line 228
    .line 229
    if-eqz v6, :cond_8

    .line 230
    .line 231
    invoke-virtual {v6}, LT;->e()Landroid/content/Context;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    goto :goto_1

    .line 236
    :cond_8
    move-object v6, p1

    .line 237
    :goto_1
    if-nez v6, :cond_9

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :cond_9
    move-object v5, v6

    .line 241
    :goto_2
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    invoke-virtual {v3, v5}, Landroidx/appcompat/widget/ViewStubCompat;->setLayoutInflater(Landroid/view/LayoutInflater;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v3}, Landroidx/appcompat/widget/ViewStubCompat;->a()Landroid/view/View;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    check-cast v3, Landroidx/appcompat/widget/ActionBarContextView;

    .line 253
    .line 254
    iput-object v3, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 255
    .line 256
    :cond_a
    :goto_3
    iget-object v3, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 257
    .line 258
    if-eqz v3, :cond_10

    .line 259
    .line 260
    iget-object v3, p0, LM1;->A:LVj;

    .line 261
    .line 262
    if-eqz v3, :cond_b

    .line 263
    .line 264
    invoke-virtual {v3}, LVj;->b()V

    .line 265
    .line 266
    .line 267
    :cond_b
    iget-object v3, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 268
    .line 269
    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarContextView;->e()V

    .line 270
    .line 271
    .line 272
    new-instance v3, Lth;

    .line 273
    .line 274
    iget-object v5, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 275
    .line 276
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 277
    .line 278
    .line 279
    move-result-object v5

    .line 280
    iget-object v6, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 281
    .line 282
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object v5, v3, Lth;->e:Landroid/content/Context;

    .line 286
    .line 287
    iput-object v6, v3, Lth;->f:Landroidx/appcompat/widget/ActionBarContextView;

    .line 288
    .line 289
    iput-object v1, v3, Lth;->g:Ln0;

    .line 290
    .line 291
    new-instance v5, LMd;

    .line 292
    .line 293
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    invoke-direct {v5, v6}, LMd;-><init>(Landroid/content/Context;)V

    .line 298
    .line 299
    .line 300
    iput v0, v5, LMd;->l:I

    .line 301
    .line 302
    iput-object v5, v3, Lth;->j:LMd;

    .line 303
    .line 304
    iput-object v3, v5, LMd;->e:LKd;

    .line 305
    .line 306
    iget-object v1, v1, LY1;->d:Ljava/lang/Object;

    .line 307
    .line 308
    check-cast v1, Ln0;

    .line 309
    .line 310
    invoke-interface {v1, v3, v5}, Ln0;->b(Lo0;LMd;)Z

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    if-eqz v1, :cond_f

    .line 315
    .line 316
    invoke-virtual {v3}, Lth;->g()V

    .line 317
    .line 318
    .line 319
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 320
    .line 321
    invoke-virtual {p1, v3}, Landroidx/appcompat/widget/ActionBarContextView;->c(Lo0;)V

    .line 322
    .line 323
    .line 324
    iput-object v3, p0, LM1;->w:Lo0;

    .line 325
    .line 326
    iget-boolean p1, p0, LM1;->B:Z

    .line 327
    .line 328
    if-eqz p1, :cond_c

    .line 329
    .line 330
    iget-object p1, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 331
    .line 332
    if-eqz p1, :cond_c

    .line 333
    .line 334
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 335
    .line 336
    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    if-eqz p1, :cond_c

    .line 341
    .line 342
    move p1, v0

    .line 343
    goto :goto_4

    .line 344
    :cond_c
    move p1, v4

    .line 345
    :goto_4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 346
    .line 347
    if-eqz p1, :cond_d

    .line 348
    .line 349
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 350
    .line 351
    const/4 v3, 0x0

    .line 352
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 356
    .line 357
    invoke-static {p1}, LLj;->a(Landroid/view/View;)LVj;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    invoke-virtual {p1, v1}, LVj;->a(F)V

    .line 362
    .line 363
    .line 364
    iput-object p1, p0, LM1;->A:LVj;

    .line 365
    .line 366
    new-instance v1, LA1;

    .line 367
    .line 368
    invoke-direct {v1, v0, p0}, LA1;-><init>(ILjava/lang/Object;)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {p1, v1}, LVj;->d(LXj;)V

    .line 372
    .line 373
    .line 374
    goto :goto_5

    .line 375
    :cond_d
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 376
    .line 377
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 378
    .line 379
    .line 380
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 381
    .line 382
    invoke-virtual {p1, v4}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    .line 383
    .line 384
    .line 385
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 386
    .line 387
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 388
    .line 389
    .line 390
    move-result-object p1

    .line 391
    instance-of p1, p1, Landroid/view/View;

    .line 392
    .line 393
    if-eqz p1, :cond_e

    .line 394
    .line 395
    iget-object p1, p0, LM1;->x:Landroidx/appcompat/widget/ActionBarContextView;

    .line 396
    .line 397
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    check-cast p1, Landroid/view/View;

    .line 402
    .line 403
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 404
    .line 405
    invoke-static {p1}, LCj;->c(Landroid/view/View;)V

    .line 406
    .line 407
    .line 408
    :cond_e
    :goto_5
    iget-object p1, p0, LM1;->y:Landroid/widget/PopupWindow;

    .line 409
    .line 410
    if-eqz p1, :cond_10

    .line 411
    .line 412
    iget-object p1, p0, LM1;->n:Landroid/view/Window;

    .line 413
    .line 414
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    iget-object v0, p0, LM1;->z:Ly1;

    .line 419
    .line 420
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 421
    .line 422
    .line 423
    goto :goto_6

    .line 424
    :cond_f
    iput-object p1, p0, LM1;->w:Lo0;

    .line 425
    .line 426
    :cond_10
    :goto_6
    iget-object p1, p0, LM1;->w:Lo0;

    .line 427
    .line 428
    if-eqz p1, :cond_11

    .line 429
    .line 430
    if-eqz v2, :cond_11

    .line 431
    .line 432
    invoke-interface {v2, p1}, Lq1;->onSupportActionModeStarted(Lo0;)V

    .line 433
    .line 434
    .line 435
    :cond_11
    invoke-virtual {p0}, LM1;->K()V

    .line 436
    .line 437
    .line 438
    iget-object p1, p0, LM1;->w:Lo0;

    .line 439
    .line 440
    iput-object p1, p0, LM1;->w:Lo0;

    .line 441
    .line 442
    :cond_12
    invoke-virtual {p0}, LM1;->K()V

    .line 443
    .line 444
    .line 445
    iget-object p1, p0, LM1;->w:Lo0;

    .line 446
    .line 447
    return-object p1

    .line 448
    :cond_13
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 449
    .line 450
    const-string v0, "ActionMode callback can not be null."

    .line 451
    .line 452
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    throw p1
.end method

.method public final m(ZZ)Z
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-boolean v0, v1, LM1;->S:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    iget v0, v1, LM1;->U:I

    .line 10
    .line 11
    const/16 v3, -0x64

    .line 12
    .line 13
    if-eq v0, v3, :cond_1

    .line 14
    .line 15
    :goto_0
    move v3, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    sget v0, Lx1;->d:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :goto_1
    iget-object v4, v1, LM1;->m:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v1, v4, v3}, LM1;->E(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 27
    .line 28
    const/16 v6, 0x21

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    if-ge v0, v6, :cond_2

    .line 32
    .line 33
    invoke-static {v4}, LM1;->p(Landroid/content/Context;)Lvd;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move-object v6, v7

    .line 39
    :goto_2
    if-nez p2, :cond_3

    .line 40
    .line 41
    if-eqz v6, :cond_3

    .line 42
    .line 43
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v6}, LM1;->A(Landroid/content/res/Configuration;)Lvd;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    :cond_3
    invoke-static {v4, v5, v6, v7, v2}, LM1;->u(Landroid/content/Context;ILvd;Landroid/content/res/Configuration;Z)Landroid/content/res/Configuration;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    iget-boolean v9, v1, LM1;->X:Z

    .line 60
    .line 61
    const/16 v10, 0x18

    .line 62
    .line 63
    const/4 v11, 0x1

    .line 64
    iget-object v12, v1, LM1;->l:Ljava/lang/Object;

    .line 65
    .line 66
    if-nez v9, :cond_7

    .line 67
    .line 68
    instance-of v9, v12, Landroid/app/Activity;

    .line 69
    .line 70
    if-eqz v9, :cond_7

    .line 71
    .line 72
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    if-nez v9, :cond_4

    .line 77
    .line 78
    move v0, v2

    .line 79
    goto :goto_5

    .line 80
    :cond_4
    const/16 v13, 0x1d

    .line 81
    .line 82
    if-lt v0, v13, :cond_5

    .line 83
    .line 84
    const/high16 v0, 0x100c0000

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_5
    if-lt v0, v10, :cond_6

    .line 88
    .line 89
    const/high16 v0, 0xc0000

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_6
    move v0, v2

    .line 93
    :goto_3
    :try_start_0
    new-instance v13, Landroid/content/ComponentName;

    .line 94
    .line 95
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    move-result-object v14

    .line 99
    invoke-direct {v13, v4, v14}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v9, v13, v0}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    if-eqz v0, :cond_7

    .line 107
    .line 108
    iget v0, v0, Landroid/content/pm/ActivityInfo;->configChanges:I

    .line 109
    .line 110
    iput v0, v1, LM1;->W:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :catch_0
    move-exception v0

    .line 114
    const-string v9, "AppCompatDelegate"

    .line 115
    .line 116
    const-string v13, "Exception while getting ActivityInfo"

    .line 117
    .line 118
    invoke-static {v9, v13, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 119
    .line 120
    .line 121
    iput v2, v1, LM1;->W:I

    .line 122
    .line 123
    :cond_7
    :goto_4
    iput-boolean v11, v1, LM1;->X:Z

    .line 124
    .line 125
    iget v0, v1, LM1;->W:I

    .line 126
    .line 127
    :goto_5
    iget-object v9, v1, LM1;->T:Landroid/content/res/Configuration;

    .line 128
    .line 129
    if-nez v9, :cond_8

    .line 130
    .line 131
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 136
    .line 137
    .line 138
    move-result-object v9

    .line 139
    :cond_8
    iget v13, v9, Landroid/content/res/Configuration;->uiMode:I

    .line 140
    .line 141
    and-int/lit8 v13, v13, 0x30

    .line 142
    .line 143
    iget v14, v8, Landroid/content/res/Configuration;->uiMode:I

    .line 144
    .line 145
    and-int/lit8 v14, v14, 0x30

    .line 146
    .line 147
    invoke-static {v9}, LM1;->A(Landroid/content/res/Configuration;)Lvd;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    if-nez v6, :cond_9

    .line 152
    .line 153
    move-object v8, v7

    .line 154
    goto :goto_6

    .line 155
    :cond_9
    invoke-static {v8}, LM1;->A(Landroid/content/res/Configuration;)Lvd;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    :goto_6
    if-eq v13, v14, :cond_a

    .line 160
    .line 161
    const/16 v13, 0x200

    .line 162
    .line 163
    goto :goto_7

    .line 164
    :cond_a
    move v13, v2

    .line 165
    :goto_7
    if-eqz v8, :cond_b

    .line 166
    .line 167
    invoke-virtual {v9, v8}, Lvd;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v9

    .line 171
    if-nez v9, :cond_b

    .line 172
    .line 173
    or-int/lit16 v13, v13, 0x2004

    .line 174
    .line 175
    :cond_b
    not-int v9, v0

    .line 176
    and-int/2addr v9, v13

    .line 177
    const/16 v15, 0x1c

    .line 178
    .line 179
    if-eqz v9, :cond_e

    .line 180
    .line 181
    if-eqz p1, :cond_e

    .line 182
    .line 183
    iget-boolean v9, v1, LM1;->Q:Z

    .line 184
    .line 185
    if-eqz v9, :cond_e

    .line 186
    .line 187
    sget-boolean v9, LM1;->l0:Z

    .line 188
    .line 189
    if-nez v9, :cond_c

    .line 190
    .line 191
    iget-boolean v9, v1, LM1;->R:Z

    .line 192
    .line 193
    if-eqz v9, :cond_e

    .line 194
    .line 195
    :cond_c
    instance-of v9, v12, Landroid/app/Activity;

    .line 196
    .line 197
    if-eqz v9, :cond_e

    .line 198
    .line 199
    move-object v9, v12

    .line 200
    check-cast v9, Landroid/app/Activity;

    .line 201
    .line 202
    invoke-virtual {v9}, Landroid/app/Activity;->isChild()Z

    .line 203
    .line 204
    .line 205
    move-result v16

    .line 206
    if-nez v16, :cond_e

    .line 207
    .line 208
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 209
    .line 210
    if-lt v11, v15, :cond_d

    .line 211
    .line 212
    invoke-virtual {v9}, Landroid/app/Activity;->recreate()V

    .line 213
    .line 214
    .line 215
    goto :goto_8

    .line 216
    :cond_d
    new-instance v11, Landroid/os/Handler;

    .line 217
    .line 218
    invoke-virtual {v9}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 219
    .line 220
    .line 221
    move-result-object v15

    .line 222
    invoke-direct {v11, v15}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 223
    .line 224
    .line 225
    new-instance v15, Lq0;

    .line 226
    .line 227
    const/4 v7, 0x0

    .line 228
    invoke-direct {v15, v7, v9}, Lq0;-><init>(ILjava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v11, v15}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 232
    .line 233
    .line 234
    :goto_8
    const/4 v7, 0x1

    .line 235
    goto :goto_9

    .line 236
    :cond_e
    move v7, v2

    .line 237
    :goto_9
    if-nez v7, :cond_20

    .line 238
    .line 239
    if-eqz v13, :cond_20

    .line 240
    .line 241
    and-int/2addr v0, v13

    .line 242
    if-ne v0, v13, :cond_f

    .line 243
    .line 244
    const/4 v7, 0x1

    .line 245
    goto :goto_a

    .line 246
    :cond_f
    move v7, v2

    .line 247
    :goto_a
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 248
    .line 249
    .line 250
    move-result-object v9

    .line 251
    new-instance v11, Landroid/content/res/Configuration;

    .line 252
    .line 253
    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-direct {v11, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    .line 265
    .line 266
    and-int/lit8 v0, v0, -0x31

    .line 267
    .line 268
    or-int/2addr v0, v14

    .line 269
    iput v0, v11, Landroid/content/res/Configuration;->uiMode:I

    .line 270
    .line 271
    if-eqz v8, :cond_11

    .line 272
    .line 273
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 274
    .line 275
    if-lt v0, v10, :cond_10

    .line 276
    .line 277
    invoke-static {v11, v8}, LD1;->d(Landroid/content/res/Configuration;Lvd;)V

    .line 278
    .line 279
    .line 280
    goto :goto_b

    .line 281
    :cond_10
    iget-object v0, v8, Lvd;->a:Lxd;

    .line 282
    .line 283
    invoke-interface {v0, v2}, Lxd;->get(I)Ljava/util/Locale;

    .line 284
    .line 285
    .line 286
    move-result-object v14

    .line 287
    invoke-static {v11, v14}, LB1;->b(Landroid/content/res/Configuration;Ljava/util/Locale;)V

    .line 288
    .line 289
    .line 290
    invoke-interface {v0, v2}, Lxd;->get(I)Ljava/util/Locale;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-static {v11, v0}, LB1;->a(Landroid/content/res/Configuration;Ljava/util/Locale;)V

    .line 295
    .line 296
    .line 297
    :cond_11
    :goto_b
    const/4 v14, 0x0

    .line 298
    invoke-virtual {v9, v11, v14}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 299
    .line 300
    .line 301
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 302
    .line 303
    const/16 v15, 0x1a

    .line 304
    .line 305
    if-ge v0, v15, :cond_1c

    .line 306
    .line 307
    const/16 v15, 0x1c

    .line 308
    .line 309
    if-lt v0, v15, :cond_12

    .line 310
    .line 311
    goto/16 :goto_15

    .line 312
    .line 313
    :cond_12
    const-string v15, "mDrawableCache"

    .line 314
    .line 315
    const-class v14, Landroid/content/res/Resources;

    .line 316
    .line 317
    const-string v2, "ResourcesFlusher"

    .line 318
    .line 319
    if-lt v0, v10, :cond_18

    .line 320
    .line 321
    sget-boolean v0, Lu6;->B:Z

    .line 322
    .line 323
    if-nez v0, :cond_13

    .line 324
    .line 325
    :try_start_1
    const-string v0, "mResourcesImpl"

    .line 326
    .line 327
    invoke-virtual {v14, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    sput-object v0, Lu6;->A:Ljava/lang/reflect/Field;

    .line 332
    .line 333
    const/4 v14, 0x1

    .line 334
    invoke-virtual {v0, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    .line 335
    .line 336
    .line 337
    :goto_c
    const/4 v14, 0x1

    .line 338
    goto :goto_d

    .line 339
    :catch_1
    move-exception v0

    .line 340
    const-string v14, "Could not retrieve Resources#mResourcesImpl field"

    .line 341
    .line 342
    invoke-static {v2, v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 343
    .line 344
    .line 345
    goto :goto_c

    .line 346
    :goto_d
    sput-boolean v14, Lu6;->B:Z

    .line 347
    .line 348
    :cond_13
    sget-object v0, Lu6;->A:Ljava/lang/reflect/Field;

    .line 349
    .line 350
    if-nez v0, :cond_14

    .line 351
    .line 352
    goto/16 :goto_15

    .line 353
    .line 354
    :cond_14
    :try_start_2
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    .line 358
    move-object v9, v0

    .line 359
    goto :goto_e

    .line 360
    :catch_2
    move-exception v0

    .line 361
    move-object v9, v0

    .line 362
    const-string v0, "Could not retrieve value from Resources#mResourcesImpl"

    .line 363
    .line 364
    invoke-static {v2, v0, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 365
    .line 366
    .line 367
    const/4 v9, 0x0

    .line 368
    :goto_e
    if-nez v9, :cond_15

    .line 369
    .line 370
    goto/16 :goto_15

    .line 371
    .line 372
    :cond_15
    sget-boolean v0, Lu6;->v:Z

    .line 373
    .line 374
    if-nez v0, :cond_16

    .line 375
    .line 376
    :try_start_3
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v0, v15}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    sput-object v0, Lu6;->u:Ljava/lang/reflect/Field;

    .line 385
    .line 386
    const/4 v14, 0x1

    .line 387
    invoke-virtual {v0, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_3

    .line 388
    .line 389
    .line 390
    :goto_f
    const/4 v14, 0x1

    .line 391
    goto :goto_10

    .line 392
    :catch_3
    move-exception v0

    .line 393
    const-string v14, "Could not retrieve ResourcesImpl#mDrawableCache field"

    .line 394
    .line 395
    invoke-static {v2, v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 396
    .line 397
    .line 398
    goto :goto_f

    .line 399
    :goto_10
    sput-boolean v14, Lu6;->v:Z

    .line 400
    .line 401
    :cond_16
    sget-object v0, Lu6;->u:Ljava/lang/reflect/Field;

    .line 402
    .line 403
    if-eqz v0, :cond_17

    .line 404
    .line 405
    :try_start_4
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v0
    :try_end_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_4} :catch_4

    .line 409
    goto :goto_11

    .line 410
    :catch_4
    move-exception v0

    .line 411
    move-object v9, v0

    .line 412
    const-string v0, "Could not retrieve value from ResourcesImpl#mDrawableCache"

    .line 413
    .line 414
    invoke-static {v2, v0, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 415
    .line 416
    .line 417
    :cond_17
    const/4 v0, 0x0

    .line 418
    :goto_11
    if-eqz v0, :cond_1c

    .line 419
    .line 420
    invoke-static {v0}, Lu6;->l(Ljava/lang/Object;)V

    .line 421
    .line 422
    .line 423
    goto :goto_15

    .line 424
    :cond_18
    sget-boolean v0, Lu6;->v:Z

    .line 425
    .line 426
    if-nez v0, :cond_19

    .line 427
    .line 428
    :try_start_5
    invoke-virtual {v14, v15}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    sput-object v0, Lu6;->u:Ljava/lang/reflect/Field;

    .line 433
    .line 434
    const/4 v14, 0x1

    .line 435
    invoke-virtual {v0, v14}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_5
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_5} :catch_5

    .line 436
    .line 437
    .line 438
    :goto_12
    const/4 v14, 0x1

    .line 439
    goto :goto_13

    .line 440
    :catch_5
    move-exception v0

    .line 441
    const-string v14, "Could not retrieve Resources#mDrawableCache field"

    .line 442
    .line 443
    invoke-static {v2, v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 444
    .line 445
    .line 446
    goto :goto_12

    .line 447
    :goto_13
    sput-boolean v14, Lu6;->v:Z

    .line 448
    .line 449
    :cond_19
    sget-object v0, Lu6;->u:Ljava/lang/reflect/Field;

    .line 450
    .line 451
    if-eqz v0, :cond_1a

    .line 452
    .line 453
    :try_start_6
    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    move-result-object v0
    :try_end_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_6 .. :try_end_6} :catch_6

    .line 457
    goto :goto_14

    .line 458
    :catch_6
    move-exception v0

    .line 459
    move-object v9, v0

    .line 460
    const-string v0, "Could not retrieve value from Resources#mDrawableCache"

    .line 461
    .line 462
    invoke-static {v2, v0, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 463
    .line 464
    .line 465
    :cond_1a
    const/4 v0, 0x0

    .line 466
    :goto_14
    if-nez v0, :cond_1b

    .line 467
    .line 468
    goto :goto_15

    .line 469
    :cond_1b
    invoke-static {v0}, Lu6;->l(Ljava/lang/Object;)V

    .line 470
    .line 471
    .line 472
    :cond_1c
    :goto_15
    iget v0, v1, LM1;->V:I

    .line 473
    .line 474
    if-eqz v0, :cond_1d

    .line 475
    .line 476
    invoke-virtual {v4, v0}, Landroid/content/Context;->setTheme(I)V

    .line 477
    .line 478
    .line 479
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    iget v2, v1, LM1;->V:I

    .line 484
    .line 485
    const/4 v9, 0x1

    .line 486
    invoke-virtual {v0, v2, v9}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 487
    .line 488
    .line 489
    goto :goto_16

    .line 490
    :cond_1d
    const/4 v9, 0x1

    .line 491
    :goto_16
    if-eqz v7, :cond_1f

    .line 492
    .line 493
    instance-of v0, v12, Landroid/app/Activity;

    .line 494
    .line 495
    if-eqz v0, :cond_1f

    .line 496
    .line 497
    move-object v0, v12

    .line 498
    check-cast v0, Landroid/app/Activity;

    .line 499
    .line 500
    instance-of v2, v0, LYc;

    .line 501
    .line 502
    if-eqz v2, :cond_1e

    .line 503
    .line 504
    move-object v2, v0

    .line 505
    check-cast v2, LYc;

    .line 506
    .line 507
    invoke-interface {v2}, LYc;->getLifecycle()LTc;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    check-cast v2, Landroidx/lifecycle/a;

    .line 512
    .line 513
    iget-object v2, v2, Landroidx/lifecycle/a;->c:LSc;

    .line 514
    .line 515
    sget-object v7, LSc;->e:LSc;

    .line 516
    .line 517
    invoke-virtual {v2, v7}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 518
    .line 519
    .line 520
    move-result v2

    .line 521
    if-ltz v2, :cond_1f

    .line 522
    .line 523
    :goto_17
    invoke-virtual {v0, v11}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 524
    .line 525
    .line 526
    goto :goto_18

    .line 527
    :cond_1e
    iget-boolean v2, v1, LM1;->R:Z

    .line 528
    .line 529
    if-eqz v2, :cond_1f

    .line 530
    .line 531
    iget-boolean v2, v1, LM1;->S:Z

    .line 532
    .line 533
    if-nez v2, :cond_1f

    .line 534
    .line 535
    goto :goto_17

    .line 536
    :cond_1f
    :goto_18
    move v11, v9

    .line 537
    goto :goto_19

    .line 538
    :cond_20
    move v11, v7

    .line 539
    :goto_19
    if-eqz v11, :cond_22

    .line 540
    .line 541
    instance-of v0, v12, Lm1;

    .line 542
    .line 543
    if-eqz v0, :cond_22

    .line 544
    .line 545
    and-int/lit16 v0, v13, 0x200

    .line 546
    .line 547
    if-eqz v0, :cond_21

    .line 548
    .line 549
    move-object v0, v12

    .line 550
    check-cast v0, Lm1;

    .line 551
    .line 552
    invoke-virtual {v0, v5}, Lm1;->onNightModeChanged(I)V

    .line 553
    .line 554
    .line 555
    :cond_21
    and-int/lit8 v0, v13, 0x4

    .line 556
    .line 557
    if-eqz v0, :cond_22

    .line 558
    .line 559
    check-cast v12, Lm1;

    .line 560
    .line 561
    invoke-virtual {v12, v6}, Lm1;->onLocalesChanged(Lvd;)V

    .line 562
    .line 563
    .line 564
    :cond_22
    if-eqz v11, :cond_24

    .line 565
    .line 566
    if-eqz v8, :cond_24

    .line 567
    .line 568
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    invoke-static {v0}, LM1;->A(Landroid/content/res/Configuration;)Lvd;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 581
    .line 582
    if-lt v2, v10, :cond_23

    .line 583
    .line 584
    invoke-static {v0}, LD1;->c(Lvd;)V

    .line 585
    .line 586
    .line 587
    goto :goto_1a

    .line 588
    :cond_23
    iget-object v0, v0, Lvd;->a:Lxd;

    .line 589
    .line 590
    const/4 v2, 0x0

    .line 591
    invoke-interface {v0, v2}, Lxd;->get(I)Ljava/util/Locale;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 596
    .line 597
    .line 598
    :cond_24
    :goto_1a
    if-nez v3, :cond_25

    .line 599
    .line 600
    invoke-virtual {v1, v4}, LM1;->z(Landroid/content/Context;)LJ1;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    invoke-virtual {v0}, LJ1;->h()V

    .line 605
    .line 606
    .line 607
    goto :goto_1b

    .line 608
    :cond_25
    iget-object v0, v1, LM1;->Y:LH1;

    .line 609
    .line 610
    if-eqz v0, :cond_26

    .line 611
    .line 612
    invoke-virtual {v0}, LJ1;->c()V

    .line 613
    .line 614
    .line 615
    :cond_26
    :goto_1b
    const/4 v0, 0x3

    .line 616
    if-ne v3, v0, :cond_28

    .line 617
    .line 618
    iget-object v0, v1, LM1;->Z:LH1;

    .line 619
    .line 620
    if-nez v0, :cond_27

    .line 621
    .line 622
    new-instance v0, LH1;

    .line 623
    .line 624
    invoke-direct {v0, v1, v4}, LH1;-><init>(LM1;Landroid/content/Context;)V

    .line 625
    .line 626
    .line 627
    iput-object v0, v1, LM1;->Z:LH1;

    .line 628
    .line 629
    :cond_27
    iget-object v0, v1, LM1;->Z:LH1;

    .line 630
    .line 631
    invoke-virtual {v0}, LJ1;->h()V

    .line 632
    .line 633
    .line 634
    goto :goto_1c

    .line 635
    :cond_28
    iget-object v0, v1, LM1;->Z:LH1;

    .line 636
    .line 637
    if-eqz v0, :cond_29

    .line 638
    .line 639
    invoke-virtual {v0}, LJ1;->c()V

    .line 640
    .line 641
    .line 642
    :cond_29
    :goto_1c
    return v11
.end method

.method public final n(LMd;)V
    .locals 5

    .line 1
    iget-object p1, p0, LM1;->t:Lv6;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 13
    .line 14
    check-cast p1, LHi;

    .line 15
    .line 16
    iget-object p1, p1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_4

    .line 23
    .line 24
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 25
    .line 26
    if-eqz p1, :cond_4

    .line 27
    .line 28
    iget-boolean p1, p1, Landroidx/appcompat/widget/ActionMenuView;->u:Z

    .line 29
    .line 30
    if-eqz p1, :cond_4

    .line 31
    .line 32
    iget-object p1, p0, LM1;->m:Landroid/content/Context;

    .line 33
    .line 34
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, LM1;->t:Lv6;

    .line 45
    .line 46
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 49
    .line 50
    .line 51
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 52
    .line 53
    check-cast p1, LHi;

    .line 54
    .line 55
    iget-object p1, p1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 56
    .line 57
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuView;->v:Lj0;

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    iget-object v2, p1, Lj0;->w:Lg0;

    .line 66
    .line 67
    if-nez v2, :cond_0

    .line 68
    .line 69
    invoke-virtual {p1}, Lj0;->j()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    :cond_0
    iget-object p1, p0, LM1;->n:Landroid/view/Window;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v2, p0, LM1;->t:Lv6;

    .line 82
    .line 83
    check-cast v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 86
    .line 87
    .line 88
    iget-object v2, v2, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 89
    .line 90
    check-cast v2, LHi;

    .line 91
    .line 92
    iget-object v2, v2, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 93
    .line 94
    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->p()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    const/16 v3, 0x6c

    .line 99
    .line 100
    if-eqz v2, :cond_2

    .line 101
    .line 102
    iget-object v0, p0, LM1;->t:Lv6;

    .line 103
    .line 104
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 105
    .line 106
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 107
    .line 108
    .line 109
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 110
    .line 111
    check-cast v0, LHi;

    .line 112
    .line 113
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 114
    .line 115
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 116
    .line 117
    if-eqz v0, :cond_1

    .line 118
    .line 119
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->v:Lj0;

    .line 120
    .line 121
    if-eqz v0, :cond_1

    .line 122
    .line 123
    invoke-virtual {v0}, Lj0;->f()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    :cond_1
    iget-boolean v0, p0, LM1;->S:Z

    .line 128
    .line 129
    if-nez v0, :cond_5

    .line 130
    .line 131
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v0, v0, LL1;->h:LMd;

    .line 136
    .line 137
    invoke-interface {p1, v3, v0}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    if-eqz p1, :cond_5

    .line 142
    .line 143
    iget-boolean v2, p0, LM1;->S:Z

    .line 144
    .line 145
    if-nez v2, :cond_5

    .line 146
    .line 147
    iget-boolean v2, p0, LM1;->a0:Z

    .line 148
    .line 149
    if-eqz v2, :cond_3

    .line 150
    .line 151
    iget v2, p0, LM1;->b0:I

    .line 152
    .line 153
    and-int/2addr v0, v2

    .line 154
    if-eqz v0, :cond_3

    .line 155
    .line 156
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v2, p0, LM1;->c0:Ly1;

    .line 163
    .line 164
    invoke-virtual {v0, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2}, Ly1;->run()V

    .line 168
    .line 169
    .line 170
    :cond_3
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object v2, v0, LL1;->h:LMd;

    .line 175
    .line 176
    if-eqz v2, :cond_5

    .line 177
    .line 178
    iget-boolean v4, v0, LL1;->o:Z

    .line 179
    .line 180
    if-nez v4, :cond_5

    .line 181
    .line 182
    iget-object v4, v0, LL1;->g:Landroid/view/View;

    .line 183
    .line 184
    invoke-interface {p1, v1, v4, v2}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_5

    .line 189
    .line 190
    iget-object v0, v0, LL1;->h:LMd;

    .line 191
    .line 192
    invoke-interface {p1, v3, v0}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, LM1;->t:Lv6;

    .line 196
    .line 197
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 198
    .line 199
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 200
    .line 201
    .line 202
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 203
    .line 204
    check-cast p1, LHi;

    .line 205
    .line 206
    iget-object p1, p1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 207
    .line 208
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->v()Z

    .line 209
    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_4
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-boolean v0, p1, LL1;->n:Z

    .line 217
    .line 218
    invoke-virtual {p0, p1, v1}, LM1;->t(LL1;Z)V

    .line 219
    .line 220
    .line 221
    const/4 v0, 0x0

    .line 222
    invoke-virtual {p0, p1, v0}, LM1;->G(LL1;Landroid/view/KeyEvent;)V

    .line 223
    .line 224
    .line 225
    :cond_5
    :goto_0
    return-void
.end method

.method public final o(Landroid/view/Window;)V
    .locals 7

    .line 1
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 2
    .line 3
    const-string v1, "AppCompat has already installed itself into the Window"

    .line 4
    .line 5
    if-nez v0, :cond_6

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v2, v0, LG1;

    .line 12
    .line 13
    if-nez v2, :cond_5

    .line 14
    .line 15
    new-instance v1, LG1;

    .line 16
    .line 17
    invoke-direct {v1, p0, v0}, LG1;-><init>(LM1;Landroid/view/Window$Callback;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, LM1;->o:LG1;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, LM1;->k0:[I

    .line 26
    .line 27
    iget-object v1, p0, LM1;->m:Landroid/content/Context;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-static {}, LP1;->a()LP1;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    monitor-enter v4

    .line 52
    :try_start_0
    iget-object v5, v4, LP1;->a:Lig;

    .line 53
    .line 54
    const/4 v6, 0x1

    .line 55
    invoke-virtual {v5, v1, v3, v6}, Lig;->g(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    monitor-exit v4

    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p1

    .line 62
    monitor-exit v4

    .line 63
    throw p1

    .line 64
    :cond_0
    move-object v1, v2

    .line 65
    :goto_0
    if-eqz v1, :cond_1

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, LM1;->n:Landroid/view/Window;

    .line 74
    .line 75
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 76
    .line 77
    const/16 v0, 0x21

    .line 78
    .line 79
    if-lt p1, v0, :cond_4

    .line 80
    .line 81
    iget-object p1, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 82
    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, LM1;->i0:Landroid/window/OnBackInvokedCallback;

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    invoke-static {p1, v0}, LF1;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    iput-object v2, p0, LM1;->i0:Landroid/window/OnBackInvokedCallback;

    .line 95
    .line 96
    :cond_2
    iget-object p1, p0, LM1;->l:Ljava/lang/Object;

    .line 97
    .line 98
    instance-of v0, p1, Landroid/app/Activity;

    .line 99
    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    check-cast p1, Landroid/app/Activity;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-static {p1}, LF1;->a(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    iput-object v2, p0, LM1;->h0:Landroid/window/OnBackInvokedDispatcher;

    .line 118
    .line 119
    :goto_1
    invoke-virtual {p0}, LM1;->K()V

    .line 120
    .line 121
    .line 122
    :cond_4
    return-void

    .line 123
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 124
    .line 125
    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw p1

    .line 129
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 130
    .line 131
    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw p1
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    const/4 v5, 0x3

    const/4 v6, -0x1

    const/4 v7, 0x4

    const/4 v8, 0x1

    .line 1
    iget-object v0, v1, LM1;->g0:LM2;

    const/4 v9, 0x0

    if-nez v0, :cond_1

    sget-object v0, LNf;->j:[I

    iget-object v10, v1, LM1;->m:Landroid/content/Context;

    invoke-virtual {v10, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/16 v11, 0x74

    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_0

    new-instance v0, LM2;

    invoke-direct {v0}, LM2;-><init>()V

    :goto_0
    iput-object v0, v1, LM1;->g0:LM2;

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-virtual {v10}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LM2;

    iput-object v0, v1, LM1;->g0:LM2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v12, "Failed to instantiate custom view inflater "

    invoke-direct {v10, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ". Falling back to default."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "AppCompatDelegate"

    invoke-static {v11, v10, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, LM2;

    invoke-direct {v0}, LM2;-><init>()V

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v0, v1, LM1;->g0:LM2;

    sget v10, Ltj;->a:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    sget-object v10, LNf;->y:[I

    const/4 v15, 0x0

    invoke-virtual {v3, v4, v10, v15, v15}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v10

    invoke-virtual {v10, v7, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    if-eqz v11, :cond_2

    const-string v12, "AppCompatViewInflater"

    const-string v13, "app:theme is now deprecated. Please move to using android:theme instead."

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v11, :cond_4

    instance-of v10, v3, Lq5;

    if-eqz v10, :cond_3

    move-object v10, v3

    check-cast v10, Lq5;

    .line 3
    iget v10, v10, Lq5;->a:I

    if-eq v10, v11, :cond_4

    .line 4
    :cond_3
    new-instance v10, Lq5;

    invoke-direct {v10, v3, v11}, Lq5;-><init>(Landroid/content/Context;I)V

    goto :goto_2

    :cond_4
    move-object v10, v3

    .line 5
    :goto_2
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_0

    :goto_3
    move v7, v6

    goto/16 :goto_4

    :sswitch_0
    const-string v7, "Button"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    goto :goto_3

    :cond_5
    const/16 v7, 0xd

    goto/16 :goto_4

    :sswitch_1
    const-string v7, "EditText"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    goto :goto_3

    :cond_6
    const/16 v7, 0xc

    goto/16 :goto_4

    :sswitch_2
    const-string v7, "CheckBox"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    goto :goto_3

    :cond_7
    const/16 v7, 0xb

    goto/16 :goto_4

    :sswitch_3
    const-string v7, "AutoCompleteTextView"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    goto :goto_3

    :cond_8
    const/16 v7, 0xa

    goto/16 :goto_4

    :sswitch_4
    const-string v7, "ImageView"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    goto :goto_3

    :cond_9
    const/16 v7, 0x9

    goto/16 :goto_4

    :sswitch_5
    const-string v7, "ToggleButton"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a

    goto :goto_3

    :cond_a
    const/16 v7, 0x8

    goto/16 :goto_4

    :sswitch_6
    const-string v7, "RadioButton"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    goto :goto_3

    :cond_b
    const/4 v7, 0x7

    goto :goto_4

    :sswitch_7
    const-string v7, "Spinner"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_c

    goto :goto_3

    :cond_c
    const/4 v7, 0x6

    goto :goto_4

    :sswitch_8
    const-string v7, "SeekBar"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    goto :goto_3

    :cond_d
    const/4 v7, 0x5

    goto :goto_4

    :sswitch_9
    const-string v11, "ImageButton"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_12

    goto :goto_3

    :sswitch_a
    const-string v7, "TextView"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_e

    goto/16 :goto_3

    :cond_e
    move v7, v5

    goto :goto_4

    :sswitch_b
    const-string v7, "MultiAutoCompleteTextView"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_f

    goto/16 :goto_3

    :cond_f
    const/4 v7, 0x2

    goto :goto_4

    :sswitch_c
    const-string v7, "CheckedTextView"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_10

    goto/16 :goto_3

    :cond_10
    move v7, v8

    goto :goto_4

    :sswitch_d
    const-string v7, "RatingBar"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_11

    goto/16 :goto_3

    :cond_11
    const/4 v7, 0x0

    :cond_12
    :goto_4
    packed-switch v7, :pswitch_data_0

    move-object v7, v9

    goto :goto_5

    .line 6
    :pswitch_0
    new-instance v7, Lp1;

    invoke-direct {v7, v10, v4}, Lp1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 7
    :pswitch_1
    new-instance v7, LR1;

    invoke-direct {v7, v10, v4}, LR1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 8
    :pswitch_2
    new-instance v7, Lr1;

    invoke-direct {v7, v10, v4}, Lr1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 9
    :pswitch_3
    new-instance v7, Ln1;

    .line 10
    invoke-direct {v7, v10, v4}, Ln1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 11
    :pswitch_4
    new-instance v7, LV1;

    .line 12
    invoke-direct {v7, v10, v4, v15}, LV1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    goto :goto_5

    .line 13
    :pswitch_5
    new-instance v7, LK2;

    invoke-direct {v7, v10, v4}, LK2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 14
    :pswitch_6
    new-instance v7, LZ1;

    invoke-direct {v7, v10, v4}, LZ1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 15
    :pswitch_7
    new-instance v7, Lq2;

    invoke-direct {v7, v10, v4}, Lq2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 16
    :pswitch_8
    new-instance v7, Lc2;

    invoke-direct {v7, v10, v4}, Lc2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 17
    :pswitch_9
    new-instance v7, LT1;

    const v11, 0x7f030099

    .line 18
    invoke-direct {v7, v10, v4, v11}, LT1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    goto :goto_5

    .line 19
    :pswitch_a
    new-instance v7, LC2;

    invoke-direct {v7, v10, v4}, LC2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 20
    :pswitch_b
    new-instance v7, LW1;

    invoke-direct {v7, v10, v4}, LW1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 21
    :pswitch_c
    new-instance v7, Ls1;

    invoke-direct {v7, v10, v4}, Ls1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_5

    .line 22
    :pswitch_d
    new-instance v7, La2;

    invoke-direct {v7, v10, v4}, La2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    :goto_5
    if-nez v7, :cond_17

    if-eq v3, v10, :cond_17

    .line 23
    iget-object v3, v0, LM2;->a:[Ljava/lang/Object;

    const-string v7, "view"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    const-string v2, "class"

    invoke-interface {v4, v9, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_13
    :try_start_1
    aput-object v10, v3, v15

    aput-object v4, v3, v8

    const/16 v7, 0x2e

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ne v6, v7, :cond_16

    move v6, v15

    :goto_6
    sget-object v7, LM2;->g:[Ljava/lang/String;

    if-ge v6, v5, :cond_15

    aget-object v7, v7, v6

    invoke-virtual {v0, v10, v2, v7}, LM2;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v7, :cond_14

    aput-object v9, v3, v15

    aput-object v9, v3, v8

    move-object v9, v7

    goto :goto_8

    :cond_14
    add-int/2addr v6, v8

    goto :goto_6

    :catchall_1
    move-exception v0

    goto :goto_7

    :cond_15
    aput-object v9, v3, v15

    aput-object v9, v3, v8

    goto :goto_8

    :cond_16
    :try_start_2
    invoke-virtual {v0, v10, v2, v9}, LM2;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    aput-object v9, v3, v15

    aput-object v9, v3, v8

    move-object v9, v0

    goto :goto_8

    :goto_7
    aput-object v9, v3, v15

    aput-object v9, v3, v8

    throw v0

    :catch_0
    aput-object v9, v3, v15

    aput-object v9, v3, v8

    :goto_8
    move-object v7, v9

    :cond_17
    if-eqz v7, :cond_1f

    .line 24
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_1a

    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 25
    invoke-virtual {v7}, Landroid/view/View;->hasOnClickListeners()Z

    move-result v2

    if-nez v2, :cond_18

    goto :goto_9

    .line 26
    :cond_18
    sget-object v2, LM2;->c:[I

    invoke-virtual {v0, v4, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_19

    new-instance v3, LL2;

    invoke-direct {v3, v7, v2}, LL2;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_19
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 27
    :cond_1a
    :goto_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-le v0, v2, :cond_1b

    goto/16 :goto_b

    :cond_1b
    sget-object v0, LM2;->d:[I

    invoke-virtual {v10, v4, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    const-class v5, Ljava/lang/Boolean;

    if-eqz v3, :cond_1c

    invoke-virtual {v0, v15, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    .line 28
    sget-object v6, LLj;->a:Ljava/util/WeakHashMap;

    new-instance v6, LAj;

    const v12, 0x7f0800a0

    const/16 v16, 0x2

    move-object v11, v6

    move-object v13, v5

    move v14, v15

    move v8, v15

    move v15, v2

    .line 29
    invoke-direct/range {v11 .. v16}, LAj;-><init>(ILjava/lang/Class;III)V

    .line 30
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v6, v7, v3}, Lbi;->e(Landroid/view/View;Ljava/lang/Object;)V

    goto :goto_a

    :cond_1c
    move v8, v15

    .line 31
    :goto_a
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    sget-object v0, LM2;->e:[I

    invoke-virtual {v10, v4, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v7, v3}, LLj;->i(Landroid/view/View;Ljava/lang/CharSequence;)V

    :cond_1d
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    sget-object v0, LM2;->f:[I

    invoke-virtual {v10, v4, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-virtual {v0, v8, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    .line 32
    sget-object v4, LLj;->a:Ljava/util/WeakHashMap;

    new-instance v4, LAj;

    const v12, 0x7f0800a5

    const/16 v16, 0x0

    move-object v11, v4

    move-object v13, v5

    move v14, v8

    move v15, v2

    .line 33
    invoke-direct/range {v11 .. v16}, LAj;-><init>(ILjava/lang/Class;III)V

    .line 34
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v4, v7, v2}, Lbi;->e(Landroid/view/View;Ljava/lang/Object;)V

    .line 35
    :cond_1e
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1f
    :goto_b
    return-object v7

    :sswitch_data_0
    .sparse-switch
        -0x7404ceea -> :sswitch_d
        -0x56c015e7 -> :sswitch_c
        -0x503aa7ad -> :sswitch_b
        -0x37f7066e -> :sswitch_a
        -0x37e04bb3 -> :sswitch_9
        -0x274065a5 -> :sswitch_8
        -0x1440b607 -> :sswitch_7
        0x2e46a6ed -> :sswitch_6
        0x2fa453c6 -> :sswitch_5
        0x431b5280 -> :sswitch_4
        0x5445f9ba -> :sswitch_3
        0x5f7507c3 -> :sswitch_2
        0x63577677 -> :sswitch_1
        0x77471352 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0, p1, p2, p3}, LM1;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final q(ILL1;LMd;)V
    .locals 3

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, LM1;->N:[LL1;

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-ge p1, v1, :cond_0

    .line 11
    .line 12
    aget-object p2, v0, p1

    .line 13
    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-object p3, p2, LL1;->h:LMd;

    .line 17
    .line 18
    :cond_1
    if-eqz p2, :cond_2

    .line 19
    .line 20
    iget-boolean p2, p2, LL1;->m:Z

    .line 21
    .line 22
    if-nez p2, :cond_2

    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    iget-boolean p2, p0, LM1;->S:Z

    .line 26
    .line 27
    if-nez p2, :cond_3

    .line 28
    .line 29
    iget-object p2, p0, LM1;->o:LG1;

    .line 30
    .line 31
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    const/4 v2, 0x0

    .line 42
    :try_start_0
    iput-boolean v1, p2, LG1;->g:Z

    .line 43
    .line 44
    invoke-interface {v0, p1, p3}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    iput-boolean v2, p2, LG1;->g:Z

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    iput-boolean v2, p2, LG1;->g:Z

    .line 52
    .line 53
    throw p1

    .line 54
    :cond_3
    :goto_0
    return-void
.end method

.method public final r(LMd;Landroid/view/MenuItem;)Z
    .locals 7

    .line 1
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-boolean v2, p0, LM1;->S:Z

    .line 11
    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p1}, LMd;->k()LMd;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v2, p0, LM1;->N:[LL1;

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    array-length v3, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v3, v1

    .line 25
    :goto_0
    move v4, v1

    .line 26
    :goto_1
    if-ge v4, v3, :cond_2

    .line 27
    .line 28
    aget-object v5, v2, v4

    .line 29
    .line 30
    if-eqz v5, :cond_1

    .line 31
    .line 32
    iget-object v6, v5, LL1;->h:LMd;

    .line 33
    .line 34
    if-ne v6, p1, :cond_1

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/4 v5, 0x0

    .line 41
    :goto_2
    if-eqz v5, :cond_3

    .line 42
    .line 43
    iget p1, v5, LL1;->a:I

    .line 44
    .line 45
    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    return p1

    .line 50
    :cond_3
    return v1
.end method

.method public final s(LMd;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, LM1;->M:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LM1;->M:Z

    .line 8
    .line 9
    iget-object v0, p0, LM1;->t:Lv6;

    .line 10
    .line 11
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 17
    .line 18
    check-cast v0, LHi;

    .line 19
    .line 20
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->v:Lj0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lj0;->f()Z

    .line 31
    .line 32
    .line 33
    iget-object v0, v0, Lj0;->v:Le0;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Lbe;->b()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget-object v0, v0, Lbe;->j:LYd;

    .line 44
    .line 45
    invoke-interface {v0}, Lgh;->dismiss()V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-boolean v1, p0, LM1;->S:Z

    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    const/16 v1, 0x6c

    .line 61
    .line 62
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    const/4 p1, 0x0

    .line 66
    iput-boolean p1, p0, LM1;->M:Z

    .line 67
    .line 68
    return-void
.end method

.method public final t(LL1;Z)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget v0, p1, LL1;->a:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, LM1;->t:Lv6;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 17
    .line 18
    check-cast v0, LHi;

    .line 19
    .line 20
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->p()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p1, p1, LL1;->h:LMd;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, LM1;->s(LMd;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, LM1;->m:Landroid/content/Context;

    .line 35
    .line 36
    const-string v1, "window"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/view/WindowManager;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-boolean v2, p1, LL1;->m:Z

    .line 48
    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    iget-object v2, p1, LL1;->e:LK1;

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    iget p2, p1, LL1;->a:I

    .line 61
    .line 62
    invoke-virtual {p0, p2, p1, v1}, LM1;->q(ILL1;LMd;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    const/4 p2, 0x0

    .line 66
    iput-boolean p2, p1, LL1;->k:Z

    .line 67
    .line 68
    iput-boolean p2, p1, LL1;->l:Z

    .line 69
    .line 70
    iput-boolean p2, p1, LL1;->m:Z

    .line 71
    .line 72
    iput-object v1, p1, LL1;->f:Landroid/view/View;

    .line 73
    .line 74
    const/4 p2, 0x1

    .line 75
    iput-boolean p2, p1, LL1;->n:Z

    .line 76
    .line 77
    iget-object p2, p0, LM1;->O:LL1;

    .line 78
    .line 79
    if-ne p2, p1, :cond_2

    .line 80
    .line 81
    iput-object v1, p0, LM1;->O:LL1;

    .line 82
    .line 83
    :cond_2
    iget p1, p1, LL1;->a:I

    .line 84
    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, LM1;->K()V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method public final v(Landroid/view/KeyEvent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, LM1;->l:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v1, v0, LGc;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    instance-of v0, v0, LN0;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v0, p1}, Llc;->l(Landroid/view/View;Landroid/view/KeyEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return v2

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    const/16 v3, 0x52

    .line 33
    .line 34
    if-ne v0, v3, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, LM1;->o:LG1;

    .line 37
    .line 38
    iget-object v4, p0, LM1;->n:Landroid/view/Window;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    :try_start_0
    iput-boolean v2, v0, LG1;->f:Z

    .line 48
    .line 49
    invoke-interface {v4, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 50
    .line 51
    .line 52
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    iput-boolean v1, v0, LG1;->f:Z

    .line 54
    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    return v2

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    iput-boolean v1, v0, LG1;->f:Z

    .line 60
    .line 61
    throw p1

    .line 62
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const/4 v5, 0x4

    .line 71
    if-nez v4, :cond_7

    .line 72
    .line 73
    if-eq v0, v5, :cond_4

    .line 74
    .line 75
    if-eq v0, v3, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_12

    .line 83
    .line 84
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-boolean v1, v0, LL1;->m:Z

    .line 89
    .line 90
    if-nez v1, :cond_12

    .line 91
    .line 92
    invoke-virtual {p0, v0, p1}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 93
    .line 94
    .line 95
    goto/16 :goto_6

    .line 96
    .line 97
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    and-int/lit16 p1, p1, 0x80

    .line 102
    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    move v2, v1

    .line 107
    :goto_0
    iput-boolean v2, p0, LM1;->P:Z

    .line 108
    .line 109
    :cond_6
    :goto_1
    move v2, v1

    .line 110
    goto/16 :goto_6

    .line 111
    .line 112
    :cond_7
    if-eq v0, v5, :cond_11

    .line 113
    .line 114
    if-eq v0, v3, :cond_8

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_8
    iget-object v0, p0, LM1;->w:Lo0;

    .line 118
    .line 119
    if-eqz v0, :cond_9

    .line 120
    .line 121
    goto/16 :goto_6

    .line 122
    .line 123
    :cond_9
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v3, p0, LM1;->t:Lv6;

    .line 128
    .line 129
    iget-object v4, p0, LM1;->m:Landroid/content/Context;

    .line 130
    .line 131
    if-eqz v3, :cond_b

    .line 132
    .line 133
    check-cast v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 134
    .line 135
    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 136
    .line 137
    .line 138
    iget-object v3, v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 139
    .line 140
    check-cast v3, LHi;

    .line 141
    .line 142
    iget-object v3, v3, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 143
    .line 144
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    if-nez v5, :cond_b

    .line 149
    .line 150
    iget-object v3, v3, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 151
    .line 152
    if-eqz v3, :cond_b

    .line 153
    .line 154
    iget-boolean v3, v3, Landroidx/appcompat/widget/ActionMenuView;->u:Z

    .line 155
    .line 156
    if-eqz v3, :cond_b

    .line 157
    .line 158
    invoke-static {v4}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-nez v3, :cond_b

    .line 167
    .line 168
    iget-object v3, p0, LM1;->t:Lv6;

    .line 169
    .line 170
    check-cast v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 171
    .line 172
    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 173
    .line 174
    .line 175
    iget-object v3, v3, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 176
    .line 177
    check-cast v3, LHi;

    .line 178
    .line 179
    iget-object v3, v3, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 180
    .line 181
    invoke-virtual {v3}, Landroidx/appcompat/widget/Toolbar;->p()Z

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-nez v3, :cond_a

    .line 186
    .line 187
    iget-boolean v3, p0, LM1;->S:Z

    .line 188
    .line 189
    if-nez v3, :cond_e

    .line 190
    .line 191
    invoke-virtual {p0, v0, p1}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_e

    .line 196
    .line 197
    iget-object p1, p0, LM1;->t:Lv6;

    .line 198
    .line 199
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 200
    .line 201
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 202
    .line 203
    .line 204
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 205
    .line 206
    check-cast p1, LHi;

    .line 207
    .line 208
    iget-object p1, p1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 209
    .line 210
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->v()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    goto :goto_5

    .line 215
    :cond_a
    iget-object p1, p0, LM1;->t:Lv6;

    .line 216
    .line 217
    check-cast p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 218
    .line 219
    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->k()V

    .line 220
    .line 221
    .line 222
    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Lw6;

    .line 223
    .line 224
    check-cast p1, LHi;

    .line 225
    .line 226
    iget-object p1, p1, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 227
    .line 228
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->c:Landroidx/appcompat/widget/ActionMenuView;

    .line 229
    .line 230
    if-eqz p1, :cond_e

    .line 231
    .line 232
    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuView;->v:Lj0;

    .line 233
    .line 234
    if-eqz p1, :cond_e

    .line 235
    .line 236
    invoke-virtual {p1}, Lj0;->f()Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_e

    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_b
    iget-boolean v3, v0, LL1;->m:Z

    .line 244
    .line 245
    if-nez v3, :cond_f

    .line 246
    .line 247
    iget-boolean v5, v0, LL1;->l:Z

    .line 248
    .line 249
    if-eqz v5, :cond_c

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_c
    iget-boolean v3, v0, LL1;->k:Z

    .line 253
    .line 254
    if-eqz v3, :cond_e

    .line 255
    .line 256
    iget-boolean v3, v0, LL1;->o:Z

    .line 257
    .line 258
    if-eqz v3, :cond_d

    .line 259
    .line 260
    iput-boolean v1, v0, LL1;->k:Z

    .line 261
    .line 262
    invoke-virtual {p0, v0, p1}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    goto :goto_2

    .line 267
    :cond_d
    move v3, v2

    .line 268
    :goto_2
    if-eqz v3, :cond_e

    .line 269
    .line 270
    invoke-virtual {p0, v0, p1}, LM1;->G(LL1;Landroid/view/KeyEvent;)V

    .line 271
    .line 272
    .line 273
    :goto_3
    move p1, v2

    .line 274
    goto :goto_5

    .line 275
    :cond_e
    move p1, v1

    .line 276
    goto :goto_5

    .line 277
    :cond_f
    :goto_4
    invoke-virtual {p0, v0, v2}, LM1;->t(LL1;Z)V

    .line 278
    .line 279
    .line 280
    move p1, v3

    .line 281
    :goto_5
    if-eqz p1, :cond_12

    .line 282
    .line 283
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    const-string v0, "audio"

    .line 288
    .line 289
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    check-cast p1, Landroid/media/AudioManager;

    .line 294
    .line 295
    if-eqz p1, :cond_10

    .line 296
    .line 297
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->playSoundEffect(I)V

    .line 298
    .line 299
    .line 300
    goto :goto_6

    .line 301
    :cond_10
    const-string p1, "AppCompatDelegate"

    .line 302
    .line 303
    const-string v0, "Couldn\'t get audio manager"

    .line 304
    .line 305
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    goto :goto_6

    .line 309
    :cond_11
    invoke-virtual {p0}, LM1;->F()Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-eqz p1, :cond_6

    .line 314
    .line 315
    :cond_12
    :goto_6
    return v2
.end method

.method public final w(I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, LM1;->B(I)LL1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, LL1;->h:LMd;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v2, v0, LL1;->h:LMd;

    .line 15
    .line 16
    invoke-virtual {v2, v1}, LMd;->t(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/os/BaseBundle;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-lez v2, :cond_0

    .line 24
    .line 25
    iput-object v1, v0, LL1;->p:Landroid/os/Bundle;

    .line 26
    .line 27
    :cond_0
    iget-object v1, v0, LL1;->h:LMd;

    .line 28
    .line 29
    invoke-virtual {v1}, LMd;->w()V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, LL1;->h:LMd;

    .line 33
    .line 34
    invoke-virtual {v1}, LMd;->clear()V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, v0, LL1;->o:Z

    .line 39
    .line 40
    iput-boolean v1, v0, LL1;->n:Z

    .line 41
    .line 42
    const/16 v0, 0x6c

    .line 43
    .line 44
    if-eq p1, v0, :cond_2

    .line 45
    .line 46
    if-nez p1, :cond_3

    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, LM1;->t:Lv6;

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    invoke-virtual {p0, p1}, LM1;->B(I)LL1;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-boolean p1, v0, LL1;->k:Z

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-virtual {p0, v0, p1}, LM1;->I(LL1;Landroid/view/KeyEvent;)Z

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method public final x()V
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    iget-boolean v2, p0, LM1;->B:Z

    .line 4
    .line 5
    if-nez v2, :cond_1b

    .line 6
    .line 7
    sget-object v2, LNf;->j:[I

    .line 8
    .line 9
    iget-object v3, p0, LM1;->m:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v3, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/16 v5, 0x75

    .line 16
    .line 17
    invoke-virtual {v4, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    if-eqz v6, :cond_1a

    .line 22
    .line 23
    const/16 v6, 0x7e

    .line 24
    .line 25
    invoke-virtual {v4, v6, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    const/16 v7, 0x6c

    .line 30
    .line 31
    if-eqz v6, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v0}, LM1;->g(I)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {v4, v5, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, v7}, LM1;->g(I)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    const/16 v5, 0x76

    .line 47
    .line 48
    invoke-virtual {v4, v5, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    const/16 v6, 0x6d

    .line 53
    .line 54
    if-eqz v5, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, v6}, LM1;->g(I)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    const/16 v5, 0x77

    .line 60
    .line 61
    invoke-virtual {v4, v5, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_3

    .line 66
    .line 67
    const/16 v5, 0xa

    .line 68
    .line 69
    invoke-virtual {p0, v5}, LM1;->g(I)Z

    .line 70
    .line 71
    .line 72
    :cond_3
    invoke-virtual {v4, v1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    iput-boolean v5, p0, LM1;->K:Z

    .line 77
    .line 78
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, LM1;->y()V

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, LM1;->n:Landroid/view/Window;

    .line 85
    .line 86
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    iget-boolean v5, p0, LM1;->L:Z

    .line 94
    .line 95
    const/4 v8, 0x0

    .line 96
    if-nez v5, :cond_9

    .line 97
    .line 98
    iget-boolean v5, p0, LM1;->K:Z

    .line 99
    .line 100
    if-eqz v5, :cond_4

    .line 101
    .line 102
    const v5, 0x7f0b000c

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4, v5, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    check-cast v4, Landroid/view/ViewGroup;

    .line 110
    .line 111
    iput-boolean v1, p0, LM1;->I:Z

    .line 112
    .line 113
    iput-boolean v1, p0, LM1;->H:Z

    .line 114
    .line 115
    goto/16 :goto_3

    .line 116
    .line 117
    :cond_4
    iget-boolean v4, p0, LM1;->H:Z

    .line 118
    .line 119
    if-eqz v4, :cond_8

    .line 120
    .line 121
    new-instance v4, Landroid/util/TypedValue;

    .line 122
    .line 123
    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    const v9, 0x7f030009

    .line 131
    .line 132
    .line 133
    invoke-virtual {v5, v9, v4, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 134
    .line 135
    .line 136
    iget v5, v4, Landroid/util/TypedValue;->resourceId:I

    .line 137
    .line 138
    if-eqz v5, :cond_5

    .line 139
    .line 140
    new-instance v5, Lq5;

    .line 141
    .line 142
    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    .line 143
    .line 144
    invoke-direct {v5, v3, v4}, Lq5;-><init>(Landroid/content/Context;I)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_5
    move-object v5, v3

    .line 149
    :goto_1
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    const v5, 0x7f0b0017

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4, v5, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    check-cast v4, Landroid/view/ViewGroup;

    .line 161
    .line 162
    const v5, 0x7f080050

    .line 163
    .line 164
    .line 165
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    check-cast v5, Lv6;

    .line 170
    .line 171
    iput-object v5, p0, LM1;->t:Lv6;

    .line 172
    .line 173
    iget-object v9, p0, LM1;->n:Landroid/view/Window;

    .line 174
    .line 175
    invoke-virtual {v9}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    invoke-interface {v5, v9}, Lv6;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 180
    .line 181
    .line 182
    iget-boolean v5, p0, LM1;->I:Z

    .line 183
    .line 184
    if-eqz v5, :cond_6

    .line 185
    .line 186
    iget-object v5, p0, LM1;->t:Lv6;

    .line 187
    .line 188
    check-cast v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 189
    .line 190
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 191
    .line 192
    .line 193
    :cond_6
    iget-boolean v5, p0, LM1;->F:Z

    .line 194
    .line 195
    if-eqz v5, :cond_7

    .line 196
    .line 197
    iget-object v5, p0, LM1;->t:Lv6;

    .line 198
    .line 199
    const/4 v6, 0x2

    .line 200
    check-cast v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 201
    .line 202
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 203
    .line 204
    .line 205
    :cond_7
    iget-boolean v5, p0, LM1;->G:Z

    .line 206
    .line 207
    if-eqz v5, :cond_b

    .line 208
    .line 209
    iget-object v5, p0, LM1;->t:Lv6;

    .line 210
    .line 211
    const/4 v6, 0x5

    .line 212
    check-cast v5, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 213
    .line 214
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j(I)V

    .line 215
    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_8
    move-object v4, v8

    .line 219
    goto :goto_3

    .line 220
    :cond_9
    iget-boolean v5, p0, LM1;->J:Z

    .line 221
    .line 222
    if-eqz v5, :cond_a

    .line 223
    .line 224
    const v5, 0x7f0b0016

    .line 225
    .line 226
    .line 227
    :goto_2
    invoke-virtual {v4, v5, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    check-cast v4, Landroid/view/ViewGroup;

    .line 232
    .line 233
    goto :goto_3

    .line 234
    :cond_a
    const v5, 0x7f0b0015

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_b
    :goto_3
    if-eqz v4, :cond_19

    .line 239
    .line 240
    new-instance v5, Lz1;

    .line 241
    .line 242
    invoke-direct {v5, p0, v1}, Lz1;-><init>(LM1;I)V

    .line 243
    .line 244
    .line 245
    sget-object v6, LLj;->a:Ljava/util/WeakHashMap;

    .line 246
    .line 247
    invoke-static {v4, v5}, LEj;->i(Landroid/view/View;LMe;)V

    .line 248
    .line 249
    .line 250
    iget-object v5, p0, LM1;->t:Lv6;

    .line 251
    .line 252
    if-nez v5, :cond_c

    .line 253
    .line 254
    const v5, 0x7f0800b1

    .line 255
    .line 256
    .line 257
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    check-cast v5, Landroid/widget/TextView;

    .line 262
    .line 263
    iput-object v5, p0, LM1;->D:Landroid/widget/TextView;

    .line 264
    .line 265
    :cond_c
    sget-object v5, LZj;->a:Ljava/lang/reflect/Method;

    .line 266
    .line 267
    const-string v5, "Could not invoke makeOptionalFitsSystemWindows"

    .line 268
    .line 269
    const-string v6, "ViewUtils"

    .line 270
    .line 271
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    .line 273
    .line 274
    move-result-object v9

    .line 275
    const-string v10, "makeOptionalFitsSystemWindows"

    .line 276
    .line 277
    invoke-virtual {v9, v10, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 278
    .line 279
    .line 280
    move-result-object v9

    .line 281
    invoke-virtual {v9}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 282
    .line 283
    .line 284
    move-result v10

    .line 285
    if-nez v10, :cond_d

    .line 286
    .line 287
    invoke-virtual {v9, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 288
    .line 289
    .line 290
    goto :goto_4

    .line 291
    :catch_0
    move-exception v9

    .line 292
    goto :goto_5

    .line 293
    :catch_1
    move-exception v9

    .line 294
    goto :goto_5

    .line 295
    :cond_d
    :goto_4
    invoke-virtual {v9, v4, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    .line 297
    .line 298
    goto :goto_6

    .line 299
    :goto_5
    invoke-static {v6, v5, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 300
    .line 301
    .line 302
    goto :goto_6

    .line 303
    :catch_2
    const-string v5, "Could not find method makeOptionalFitsSystemWindows. Oh well..."

    .line 304
    .line 305
    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    :goto_6
    const v5, 0x7f080028

    .line 309
    .line 310
    .line 311
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 312
    .line 313
    .line 314
    move-result-object v5

    .line 315
    check-cast v5, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 316
    .line 317
    iget-object v6, p0, LM1;->n:Landroid/view/Window;

    .line 318
    .line 319
    const v9, 0x1020002

    .line 320
    .line 321
    .line 322
    invoke-virtual {v6, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 323
    .line 324
    .line 325
    move-result-object v6

    .line 326
    check-cast v6, Landroid/view/ViewGroup;

    .line 327
    .line 328
    if-eqz v6, :cond_f

    .line 329
    .line 330
    :goto_7
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getChildCount()I

    .line 331
    .line 332
    .line 333
    move-result v10

    .line 334
    if-lez v10, :cond_e

    .line 335
    .line 336
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 337
    .line 338
    .line 339
    move-result-object v10

    .line 340
    invoke-virtual {v6, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v5, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 344
    .line 345
    .line 346
    goto :goto_7

    .line 347
    :cond_e
    const/4 v10, -0x1

    .line 348
    invoke-virtual {v6, v10}, Landroid/view/View;->setId(I)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v5, v9}, Landroid/view/View;->setId(I)V

    .line 352
    .line 353
    .line 354
    instance-of v10, v6, Landroid/widget/FrameLayout;

    .line 355
    .line 356
    if-eqz v10, :cond_f

    .line 357
    .line 358
    check-cast v6, Landroid/widget/FrameLayout;

    .line 359
    .line 360
    invoke-virtual {v6, v8}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 361
    .line 362
    .line 363
    :cond_f
    iget-object v6, p0, LM1;->n:Landroid/view/Window;

    .line 364
    .line 365
    invoke-virtual {v6, v4}, Landroid/view/Window;->setContentView(Landroid/view/View;)V

    .line 366
    .line 367
    .line 368
    new-instance v6, Lz1;

    .line 369
    .line 370
    invoke-direct {v6, p0, v0}, Lz1;-><init>(LM1;I)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/ContentFrameLayout;->setAttachListener(Lg5;)V

    .line 374
    .line 375
    .line 376
    iput-object v4, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 377
    .line 378
    iget-object v4, p0, LM1;->l:Ljava/lang/Object;

    .line 379
    .line 380
    instance-of v5, v4, Landroid/app/Activity;

    .line 381
    .line 382
    if-eqz v5, :cond_10

    .line 383
    .line 384
    check-cast v4, Landroid/app/Activity;

    .line 385
    .line 386
    invoke-virtual {v4}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    goto :goto_8

    .line 391
    :cond_10
    iget-object v4, p0, LM1;->s:Ljava/lang/CharSequence;

    .line 392
    .line 393
    :goto_8
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 394
    .line 395
    .line 396
    move-result v5

    .line 397
    if-nez v5, :cond_13

    .line 398
    .line 399
    iget-object v5, p0, LM1;->t:Lv6;

    .line 400
    .line 401
    if-eqz v5, :cond_11

    .line 402
    .line 403
    invoke-interface {v5, v4}, Lv6;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 404
    .line 405
    .line 406
    goto :goto_9

    .line 407
    :cond_11
    iget-object v5, p0, LM1;->q:LT;

    .line 408
    .line 409
    if-eqz v5, :cond_12

    .line 410
    .line 411
    invoke-virtual {v5, v4}, LT;->n(Ljava/lang/CharSequence;)V

    .line 412
    .line 413
    .line 414
    goto :goto_9

    .line 415
    :cond_12
    iget-object v5, p0, LM1;->D:Landroid/widget/TextView;

    .line 416
    .line 417
    if-eqz v5, :cond_13

    .line 418
    .line 419
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    .line 421
    .line 422
    :cond_13
    :goto_9
    iget-object v4, p0, LM1;->C:Landroid/view/ViewGroup;

    .line 423
    .line 424
    invoke-virtual {v4, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 425
    .line 426
    .line 427
    move-result-object v4

    .line 428
    check-cast v4, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 429
    .line 430
    iget-object v5, p0, LM1;->n:Landroid/view/Window;

    .line 431
    .line 432
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 433
    .line 434
    .line 435
    move-result-object v5

    .line 436
    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I

    .line 437
    .line 438
    .line 439
    move-result v6

    .line 440
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 441
    .line 442
    .line 443
    move-result v8

    .line 444
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    .line 445
    .line 446
    .line 447
    move-result v9

    .line 448
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    .line 449
    .line 450
    .line 451
    move-result v5

    .line 452
    iget-object v10, v4, Landroidx/appcompat/widget/ContentFrameLayout;->i:Landroid/graphics/Rect;

    .line 453
    .line 454
    invoke-virtual {v10, v6, v8, v9, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 455
    .line 456
    .line 457
    sget-object v5, LLj;->a:Ljava/util/WeakHashMap;

    .line 458
    .line 459
    invoke-virtual {v4}, Landroid/view/View;->isLaidOut()Z

    .line 460
    .line 461
    .line 462
    move-result v5

    .line 463
    if-eqz v5, :cond_14

    .line 464
    .line 465
    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 466
    .line 467
    .line 468
    :cond_14
    invoke-virtual {v3, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    const/16 v3, 0x7c

    .line 473
    .line 474
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMajor()Landroid/util/TypedValue;

    .line 475
    .line 476
    .line 477
    move-result-object v5

    .line 478
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 479
    .line 480
    .line 481
    const/16 v3, 0x7d

    .line 482
    .line 483
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMinor()Landroid/util/TypedValue;

    .line 484
    .line 485
    .line 486
    move-result-object v5

    .line 487
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 488
    .line 489
    .line 490
    const/16 v3, 0x7a

    .line 491
    .line 492
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 493
    .line 494
    .line 495
    move-result v5

    .line 496
    if-eqz v5, :cond_15

    .line 497
    .line 498
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMajor()Landroid/util/TypedValue;

    .line 499
    .line 500
    .line 501
    move-result-object v5

    .line 502
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 503
    .line 504
    .line 505
    :cond_15
    const/16 v3, 0x7b

    .line 506
    .line 507
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 508
    .line 509
    .line 510
    move-result v5

    .line 511
    if-eqz v5, :cond_16

    .line 512
    .line 513
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMinor()Landroid/util/TypedValue;

    .line 514
    .line 515
    .line 516
    move-result-object v5

    .line 517
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 518
    .line 519
    .line 520
    :cond_16
    const/16 v3, 0x78

    .line 521
    .line 522
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 523
    .line 524
    .line 525
    move-result v5

    .line 526
    if-eqz v5, :cond_17

    .line 527
    .line 528
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMajor()Landroid/util/TypedValue;

    .line 529
    .line 530
    .line 531
    move-result-object v5

    .line 532
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 533
    .line 534
    .line 535
    :cond_17
    const/16 v3, 0x79

    .line 536
    .line 537
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 538
    .line 539
    .line 540
    move-result v5

    .line 541
    if-eqz v5, :cond_18

    .line 542
    .line 543
    invoke-virtual {v4}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMinor()Landroid/util/TypedValue;

    .line 544
    .line 545
    .line 546
    move-result-object v5

    .line 547
    invoke-virtual {v2, v3, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 548
    .line 549
    .line 550
    :cond_18
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 551
    .line 552
    .line 553
    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 554
    .line 555
    .line 556
    iput-boolean v0, p0, LM1;->B:Z

    .line 557
    .line 558
    invoke-virtual {p0, v1}, LM1;->B(I)LL1;

    .line 559
    .line 560
    .line 561
    move-result-object v0

    .line 562
    iget-boolean v1, p0, LM1;->S:Z

    .line 563
    .line 564
    if-nez v1, :cond_1b

    .line 565
    .line 566
    iget-object v0, v0, LL1;->h:LMd;

    .line 567
    .line 568
    if-nez v0, :cond_1b

    .line 569
    .line 570
    invoke-virtual {p0, v7}, LM1;->D(I)V

    .line 571
    .line 572
    .line 573
    goto :goto_a

    .line 574
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 575
    .line 576
    new-instance v1, Ljava/lang/StringBuilder;

    .line 577
    .line 578
    const-string v2, "AppCompat does not support the current theme features: { windowActionBar: "

    .line 579
    .line 580
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    iget-boolean v2, p0, LM1;->H:Z

    .line 584
    .line 585
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 586
    .line 587
    .line 588
    const-string v2, ", windowActionBarOverlay: "

    .line 589
    .line 590
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 591
    .line 592
    .line 593
    iget-boolean v2, p0, LM1;->I:Z

    .line 594
    .line 595
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    const-string v2, ", android:windowIsFloating: "

    .line 599
    .line 600
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    iget-boolean v2, p0, LM1;->K:Z

    .line 604
    .line 605
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    const-string v2, ", windowActionModeOverlay: "

    .line 609
    .line 610
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    .line 612
    .line 613
    iget-boolean v2, p0, LM1;->J:Z

    .line 614
    .line 615
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    const-string v2, ", windowNoTitle: "

    .line 619
    .line 620
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    iget-boolean v2, p0, LM1;->L:Z

    .line 624
    .line 625
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    const-string v2, " }"

    .line 629
    .line 630
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 631
    .line 632
    .line 633
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v1

    .line 637
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 638
    .line 639
    .line 640
    throw v0

    .line 641
    :cond_1a
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 642
    .line 643
    .line 644
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 645
    .line 646
    const-string v1, "You need to use a Theme.AppCompat theme (or descendant) with this activity."

    .line 647
    .line 648
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 649
    .line 650
    .line 651
    throw v0

    .line 652
    :cond_1b
    :goto_a
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LM1;->l:Ljava/lang/Object;

    .line 6
    .line 7
    instance-of v1, v0, Landroid/app/Activity;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, LM1;->o(Landroid/view/Window;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, LM1;->n:Landroid/view/Window;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 26
    .line 27
    const-string v1, "We have not been given a Window"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public final z(Landroid/content/Context;)LJ1;
    .locals 3

    .line 1
    iget-object v0, p0, LM1;->Y:LH1;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, LH1;

    .line 6
    .line 7
    sget-object v1, LN2;->f:LN2;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v1, LN2;

    .line 16
    .line 17
    const-string v2, "location"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/location/LocationManager;

    .line 24
    .line 25
    invoke-direct {v1, p1, v2}, LN2;-><init>(Landroid/content/Context;Landroid/location/LocationManager;)V

    .line 26
    .line 27
    .line 28
    sput-object v1, LN2;->f:LN2;

    .line 29
    .line 30
    :cond_0
    sget-object p1, LN2;->f:LN2;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, LH1;-><init>(LM1;LN2;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, LM1;->Y:LH1;

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, LM1;->Y:LH1;

    .line 38
    .line 39
    return-object p1
.end method
