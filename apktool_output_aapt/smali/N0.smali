.class public final LN0;
.super Landroid/app/Dialog;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface;
.implements Lq1;
.implements LYc;
.implements LIg;


# instance fields
.field public c:Landroidx/lifecycle/a;

.field public final d:LHg;

.field public final e:Landroidx/activity/a;

.field public f:LM1;

.field public final g:LN1;

.field public final h:LL0;


# direct methods
.method public constructor <init>(Landroid/view/ContextThemeWrapper;I)V
    .locals 5

    .line 1
    invoke-static {p1, p2}, LN0;->g(Landroid/content/Context;I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    const v1, 0x7f030069

    .line 7
    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    new-instance v2, Landroid/util/TypedValue;

    .line 12
    .line 13
    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3, v1, v2, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 21
    .line 22
    .line 23
    iget v2, v2, Landroid/util/TypedValue;->resourceId:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v2, p2

    .line 27
    :goto_0
    invoke-direct {p0, p1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 28
    .line 29
    .line 30
    new-instance v2, LHg;

    .line 31
    .line 32
    invoke-direct {v2, p0}, LHg;-><init>(LIg;)V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, LN0;->d:LHg;

    .line 36
    .line 37
    new-instance v2, Landroidx/activity/a;

    .line 38
    .line 39
    new-instance v3, Lq0;

    .line 40
    .line 41
    const/4 v4, 0x2

    .line 42
    invoke-direct {v3, v4, p0}, Lq0;-><init>(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {v2, v3}, Landroidx/activity/a;-><init>(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    iput-object v2, p0, LN0;->e:Landroidx/activity/a;

    .line 49
    .line 50
    new-instance v2, LN1;

    .line 51
    .line 52
    invoke-direct {v2, p0}, LN1;-><init>(LN0;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, LN0;->g:LN1;

    .line 56
    .line 57
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    if-nez p2, :cond_1

    .line 62
    .line 63
    new-instance p2, Landroid/util/TypedValue;

    .line 64
    .line 65
    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1, v1, p2, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 73
    .line 74
    .line 75
    iget p2, p2, Landroid/util/TypedValue;->resourceId:I

    .line 76
    .line 77
    :cond_1
    move-object p1, v2

    .line 78
    check-cast p1, LM1;

    .line 79
    .line 80
    iput p2, p1, LM1;->V:I

    .line 81
    .line 82
    invoke-virtual {v2}, Lx1;->d()V

    .line 83
    .line 84
    .line 85
    new-instance p1, LL0;

    .line 86
    .line 87
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-direct {p1, p2, p0, v0}, LL0;-><init>(Landroid/content/Context;LN0;Landroid/view/Window;)V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, LN0;->h:LL0;

    .line 99
    .line 100
    return-void
.end method

.method public static a(LN0;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static g(Landroid/content/Context;I)I
    .locals 2

    .line 1
    ushr-int/lit8 v0, p1, 0x18

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-lt v0, v1, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    new-instance p1, Landroid/util/TypedValue;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const v0, 0x7f030027

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0, p1, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 22
    .line 23
    .line 24
    iget p0, p1, Landroid/util/TypedValue;->resourceId:I

    .line 25
    .line 26
    return p0
.end method


# virtual methods
.method public final addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, LM1;

    .line 6
    .line 7
    invoke-virtual {v0}, LM1;->x()V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, LM1;->C:Landroid/view/ViewGroup;

    .line 11
    .line 12
    const v2, 0x1020002

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/view/ViewGroup;

    .line 20
    .line 21
    invoke-virtual {v1, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, v0, LM1;->o:LG1;

    .line 25
    .line 26
    iget-object p2, v0, LM1;->n:Landroid/view/Window;

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, LG1;->a(Landroid/view/Window$Callback;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final b()Lx1;
    .locals 3

    .line 1
    iget-object v0, p0, LN0;->f:LM1;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lx1;->c:LR2;

    .line 6
    .line 7
    new-instance v0, LM1;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, v1, v2, p0, p0}, LM1;-><init>(Landroid/content/Context;Landroid/view/Window;Lq1;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, LN0;->f:LM1;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, LN0;->f:LM1;

    .line 23
    .line 24
    return-object v0
.end method

.method public final c()Landroidx/lifecycle/a;
    .locals 1

    .line 1
    iget-object v0, p0, LN0;->c:Landroidx/lifecycle/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/lifecycle/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(LYc;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LN0;->c:Landroidx/lifecycle/a;

    .line 11
    .line 12
    :cond_0
    return-object v0
.end method

.method public final d(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x21

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, LD;->e(LN0;)Landroid/window/OnBackInvokedDispatcher;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "onBackInvokedDispatcher"

    .line 15
    .line 16
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, LN0;->e:Landroidx/activity/a;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iput-object v0, v1, Landroidx/activity/a;->e:Landroid/window/OnBackInvokedDispatcher;

    .line 25
    .line 26
    iget-boolean v0, v1, Landroidx/activity/a;->g:Z

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroidx/activity/a;->d(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, LN0;->d:LHg;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, LHg;->b(Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, LN0;->c()Landroidx/lifecycle/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v0, LRc;->ON_CREATE:LRc;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lx1;->e()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, LN0;->g:LN1;

    .line 10
    .line 11
    invoke-static {v1, v0, p0, p1}, Llc;->m(LGc;Landroid/view/View;Landroid/view/Window$Callback;Landroid/view/KeyEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    return p1
.end method

.method public final e(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lx1;->a()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, LN0;->d(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lx1;->d()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, LN0;->c()Landroidx/lifecycle/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, LRc;->ON_DESTROY:LRc;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, LN0;->c:Landroidx/lifecycle/a;

    .line 12
    .line 13
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final findViewById(I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, LM1;

    .line 6
    .line 7
    invoke-virtual {v0}, LM1;->x()V

    .line 8
    .line 9
    .line 10
    iget-object v0, v0, LM1;->n:Landroid/view/Window;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1
.end method

.method public final getLifecycle()LTc;
    .locals 1

    .line 1
    invoke-virtual {p0}, LN0;->c()Landroidx/lifecycle/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public final getSavedStateRegistry()LGg;
    .locals 1

    .line 1
    iget-object v0, p0, LN0;->d:LHg;

    .line 2
    .line 3
    iget-object v0, v0, LHg;->b:LGg;

    .line 4
    .line 5
    return-object v0
.end method

.method public final h(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p1}, Lx1;->k(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    return p1
.end method

.method public final invalidateOptionsMenu()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lx1;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onBackPressed()V
    .locals 1

    .line 1
    iget-object v0, p0, LN0;->e:Landroidx/activity/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/activity/a;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .locals 16

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x2

    .line 3
    invoke-virtual/range {p0 .. p1}, LN0;->e(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    move-object/from16 v2, p0

    .line 7
    .line 8
    iget-object v3, v2, LN0;->h:LL0;

    .line 9
    .line 10
    iget-object v4, v3, LL0;->b:LN0;

    .line 11
    .line 12
    iget v5, v3, LL0;->r:I

    .line 13
    .line 14
    invoke-virtual {v4, v5}, LN0;->setContentView(I)V

    .line 15
    .line 16
    .line 17
    iget-object v4, v3, LL0;->c:Landroid/view/Window;

    .line 18
    .line 19
    const v5, 0x7f080078

    .line 20
    .line 21
    .line 22
    invoke-virtual {v4, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    const v6, 0x7f0800b5

    .line 27
    .line 28
    .line 29
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    const v8, 0x7f08004d

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v9

    .line 40
    const v10, 0x7f080042

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v11

    .line 47
    const v12, 0x7f08004f

    .line 48
    .line 49
    .line 50
    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    check-cast v5, Landroid/view/ViewGroup;

    .line 55
    .line 56
    const/high16 v12, 0x20000

    .line 57
    .line 58
    invoke-virtual {v4, v12, v12}, Landroid/view/Window;->setFlags(II)V

    .line 59
    .line 60
    .line 61
    const/16 v12, 0x8

    .line 62
    .line 63
    invoke-virtual {v5, v12}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    invoke-virtual {v5, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    invoke-static {v6, v7}, LL0;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-static {v8, v9}, LL0;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-static {v10, v11}, LL0;->a(Landroid/view/View;Landroid/view/View;)Landroid/view/ViewGroup;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    const v9, 0x7f080083

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v9

    .line 97
    check-cast v9, Landroidx/core/widget/NestedScrollView;

    .line 98
    .line 99
    iput-object v9, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 100
    .line 101
    const/4 v10, 0x0

    .line 102
    invoke-virtual {v9, v10}, Landroid/view/View;->setFocusable(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v9, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 106
    .line 107
    invoke-virtual {v9, v10}, Landroidx/core/widget/NestedScrollView;->setNestedScrollingEnabled(Z)V

    .line 108
    .line 109
    .line 110
    const v9, 0x102000b

    .line 111
    .line 112
    .line 113
    invoke-virtual {v7, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    check-cast v9, Landroid/widget/TextView;

    .line 118
    .line 119
    iput-object v9, v3, LL0;->n:Landroid/widget/TextView;

    .line 120
    .line 121
    const/4 v11, -0x1

    .line 122
    if-nez v9, :cond_0

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_0
    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    iget-object v9, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 129
    .line 130
    iget-object v13, v3, LL0;->n:Landroid/widget/TextView;

    .line 131
    .line 132
    invoke-virtual {v9, v13}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 133
    .line 134
    .line 135
    iget-object v9, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 136
    .line 137
    if-eqz v9, :cond_1

    .line 138
    .line 139
    iget-object v9, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 140
    .line 141
    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    check-cast v9, Landroid/view/ViewGroup;

    .line 146
    .line 147
    iget-object v13, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 148
    .line 149
    invoke-virtual {v9, v13}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 150
    .line 151
    .line 152
    move-result v13

    .line 153
    invoke-virtual {v9, v13}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 154
    .line 155
    .line 156
    iget-object v14, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 157
    .line 158
    new-instance v15, Landroid/view/ViewGroup$LayoutParams;

    .line 159
    .line 160
    invoke-direct {v15, v11, v11}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v9, v14, v13, v15}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_1
    invoke-virtual {v7, v12}, Landroid/view/View;->setVisibility(I)V

    .line 168
    .line 169
    .line 170
    :goto_0
    const v9, 0x1020019

    .line 171
    .line 172
    .line 173
    invoke-virtual {v8, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v9

    .line 177
    check-cast v9, Landroid/widget/Button;

    .line 178
    .line 179
    iput-object v9, v3, LL0;->f:Landroid/widget/Button;

    .line 180
    .line 181
    iget-object v13, v3, LL0;->x:LV;

    .line 182
    .line 183
    invoke-virtual {v9, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    const/4 v9, 0x0

    .line 187
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result v14

    .line 191
    const/4 v15, 0x1

    .line 192
    if-eqz v14, :cond_2

    .line 193
    .line 194
    iget-object v14, v3, LL0;->f:Landroid/widget/Button;

    .line 195
    .line 196
    invoke-virtual {v14, v12}, Landroid/view/View;->setVisibility(I)V

    .line 197
    .line 198
    .line 199
    move v14, v10

    .line 200
    goto :goto_1

    .line 201
    :cond_2
    iget-object v14, v3, LL0;->f:Landroid/widget/Button;

    .line 202
    .line 203
    invoke-virtual {v14, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    iget-object v14, v3, LL0;->f:Landroid/widget/Button;

    .line 207
    .line 208
    invoke-virtual {v14, v10}, Landroid/view/View;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    move v14, v15

    .line 212
    :goto_1
    const v11, 0x102001a

    .line 213
    .line 214
    .line 215
    invoke-virtual {v8, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v11

    .line 219
    check-cast v11, Landroid/widget/Button;

    .line 220
    .line 221
    iput-object v11, v3, LL0;->g:Landroid/widget/Button;

    .line 222
    .line 223
    invoke-virtual {v11, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    .line 225
    .line 226
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result v11

    .line 230
    if-eqz v11, :cond_3

    .line 231
    .line 232
    iget-object v11, v3, LL0;->g:Landroid/widget/Button;

    .line 233
    .line 234
    invoke-virtual {v11, v12}, Landroid/view/View;->setVisibility(I)V

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :cond_3
    iget-object v11, v3, LL0;->g:Landroid/widget/Button;

    .line 239
    .line 240
    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    iget-object v11, v3, LL0;->g:Landroid/widget/Button;

    .line 244
    .line 245
    invoke-virtual {v11, v10}, Landroid/view/View;->setVisibility(I)V

    .line 246
    .line 247
    .line 248
    or-int/2addr v14, v1

    .line 249
    :goto_2
    const v11, 0x102001b

    .line 250
    .line 251
    .line 252
    invoke-virtual {v8, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 253
    .line 254
    .line 255
    move-result-object v11

    .line 256
    check-cast v11, Landroid/widget/Button;

    .line 257
    .line 258
    iput-object v11, v3, LL0;->h:Landroid/widget/Button;

    .line 259
    .line 260
    invoke-virtual {v11, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    .line 262
    .line 263
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result v11

    .line 267
    if-eqz v11, :cond_4

    .line 268
    .line 269
    iget-object v11, v3, LL0;->h:Landroid/widget/Button;

    .line 270
    .line 271
    invoke-virtual {v11, v12}, Landroid/view/View;->setVisibility(I)V

    .line 272
    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_4
    iget-object v11, v3, LL0;->h:Landroid/widget/Button;

    .line 276
    .line 277
    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    .line 279
    .line 280
    iget-object v11, v3, LL0;->h:Landroid/widget/Button;

    .line 281
    .line 282
    invoke-virtual {v11, v10}, Landroid/view/View;->setVisibility(I)V

    .line 283
    .line 284
    .line 285
    or-int/2addr v14, v0

    .line 286
    :goto_3
    new-instance v11, Landroid/util/TypedValue;

    .line 287
    .line 288
    invoke-direct {v11}, Landroid/util/TypedValue;-><init>()V

    .line 289
    .line 290
    .line 291
    iget-object v13, v3, LL0;->a:Landroid/content/Context;

    .line 292
    .line 293
    invoke-virtual {v13}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 294
    .line 295
    .line 296
    move-result-object v13

    .line 297
    const v9, 0x7f030025

    .line 298
    .line 299
    .line 300
    invoke-virtual {v13, v9, v11, v15}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 301
    .line 302
    .line 303
    iget v9, v11, Landroid/util/TypedValue;->data:I

    .line 304
    .line 305
    if-eqz v9, :cond_7

    .line 306
    .line 307
    const/high16 v9, 0x3f000000    # 0.5f

    .line 308
    .line 309
    if-ne v14, v15, :cond_5

    .line 310
    .line 311
    iget-object v0, v3, LL0;->f:Landroid/widget/Button;

    .line 312
    .line 313
    :goto_4
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 314
    .line 315
    .line 316
    move-result-object v11

    .line 317
    check-cast v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 318
    .line 319
    iput v15, v11, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 320
    .line 321
    iput v9, v11, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 322
    .line 323
    invoke-virtual {v0, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    .line 325
    .line 326
    goto :goto_5

    .line 327
    :cond_5
    if-ne v14, v1, :cond_6

    .line 328
    .line 329
    iget-object v0, v3, LL0;->g:Landroid/widget/Button;

    .line 330
    .line 331
    goto :goto_4

    .line 332
    :cond_6
    if-ne v14, v0, :cond_7

    .line 333
    .line 334
    iget-object v0, v3, LL0;->h:Landroid/widget/Button;

    .line 335
    .line 336
    goto :goto_4

    .line 337
    :cond_7
    :goto_5
    if-eqz v14, :cond_8

    .line 338
    .line 339
    goto :goto_6

    .line 340
    :cond_8
    invoke-virtual {v8, v12}, Landroid/view/View;->setVisibility(I)V

    .line 341
    .line 342
    .line 343
    :goto_6
    iget-object v0, v3, LL0;->o:Landroid/view/View;

    .line 344
    .line 345
    const v9, 0x7f0800b3

    .line 346
    .line 347
    .line 348
    if-eqz v0, :cond_9

    .line 349
    .line 350
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 351
    .line 352
    const/4 v11, -0x2

    .line 353
    const/4 v13, -0x1

    .line 354
    invoke-direct {v0, v13, v11}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 355
    .line 356
    .line 357
    iget-object v11, v3, LL0;->o:Landroid/view/View;

    .line 358
    .line 359
    invoke-virtual {v6, v11, v10, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v4, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 367
    .line 368
    .line 369
    goto :goto_7

    .line 370
    :cond_9
    const v0, 0x1020006

    .line 371
    .line 372
    .line 373
    invoke-virtual {v4, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    check-cast v0, Landroid/widget/ImageView;

    .line 378
    .line 379
    iput-object v0, v3, LL0;->l:Landroid/widget/ImageView;

    .line 380
    .line 381
    iget-object v0, v3, LL0;->d:Ljava/lang/CharSequence;

    .line 382
    .line 383
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    xor-int/2addr v0, v15

    .line 388
    if-eqz v0, :cond_c

    .line 389
    .line 390
    iget-boolean v0, v3, LL0;->v:Z

    .line 391
    .line 392
    if-eqz v0, :cond_c

    .line 393
    .line 394
    const v0, 0x7f08003b

    .line 395
    .line 396
    .line 397
    invoke-virtual {v4, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Landroid/widget/TextView;

    .line 402
    .line 403
    iput-object v0, v3, LL0;->m:Landroid/widget/TextView;

    .line 404
    .line 405
    iget-object v9, v3, LL0;->d:Ljava/lang/CharSequence;

    .line 406
    .line 407
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 408
    .line 409
    .line 410
    iget v0, v3, LL0;->j:I

    .line 411
    .line 412
    if-eqz v0, :cond_a

    .line 413
    .line 414
    iget-object v9, v3, LL0;->l:Landroid/widget/ImageView;

    .line 415
    .line 416
    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 417
    .line 418
    .line 419
    goto :goto_7

    .line 420
    :cond_a
    iget-object v0, v3, LL0;->k:Landroid/graphics/drawable/Drawable;

    .line 421
    .line 422
    if-eqz v0, :cond_b

    .line 423
    .line 424
    iget-object v9, v3, LL0;->l:Landroid/widget/ImageView;

    .line 425
    .line 426
    invoke-virtual {v9, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 427
    .line 428
    .line 429
    goto :goto_7

    .line 430
    :cond_b
    iget-object v0, v3, LL0;->m:Landroid/widget/TextView;

    .line 431
    .line 432
    iget-object v9, v3, LL0;->l:Landroid/widget/ImageView;

    .line 433
    .line 434
    invoke-virtual {v9}, Landroid/view/View;->getPaddingLeft()I

    .line 435
    .line 436
    .line 437
    move-result v9

    .line 438
    iget-object v11, v3, LL0;->l:Landroid/widget/ImageView;

    .line 439
    .line 440
    invoke-virtual {v11}, Landroid/view/View;->getPaddingTop()I

    .line 441
    .line 442
    .line 443
    move-result v11

    .line 444
    iget-object v13, v3, LL0;->l:Landroid/widget/ImageView;

    .line 445
    .line 446
    invoke-virtual {v13}, Landroid/view/View;->getPaddingRight()I

    .line 447
    .line 448
    .line 449
    move-result v13

    .line 450
    iget-object v14, v3, LL0;->l:Landroid/widget/ImageView;

    .line 451
    .line 452
    invoke-virtual {v14}, Landroid/view/View;->getPaddingBottom()I

    .line 453
    .line 454
    .line 455
    move-result v14

    .line 456
    invoke-virtual {v0, v9, v11, v13, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 457
    .line 458
    .line 459
    iget-object v0, v3, LL0;->l:Landroid/widget/ImageView;

    .line 460
    .line 461
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 462
    .line 463
    .line 464
    goto :goto_7

    .line 465
    :cond_c
    invoke-virtual {v4, v9}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 470
    .line 471
    .line 472
    iget-object v0, v3, LL0;->l:Landroid/widget/ImageView;

    .line 473
    .line 474
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v6, v12}, Landroid/view/View;->setVisibility(I)V

    .line 478
    .line 479
    .line 480
    :goto_7
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 481
    .line 482
    .line 483
    move-result v0

    .line 484
    if-eq v0, v12, :cond_d

    .line 485
    .line 486
    move v0, v15

    .line 487
    goto :goto_8

    .line 488
    :cond_d
    move v0, v10

    .line 489
    :goto_8
    if-eqz v6, :cond_e

    .line 490
    .line 491
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 492
    .line 493
    .line 494
    move-result v5

    .line 495
    if-eq v5, v12, :cond_e

    .line 496
    .line 497
    move v5, v15

    .line 498
    goto :goto_9

    .line 499
    :cond_e
    move v5, v10

    .line 500
    :goto_9
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    .line 501
    .line 502
    .line 503
    move-result v8

    .line 504
    if-eq v8, v12, :cond_f

    .line 505
    .line 506
    move v8, v15

    .line 507
    goto :goto_a

    .line 508
    :cond_f
    move v8, v10

    .line 509
    :goto_a
    if-nez v8, :cond_10

    .line 510
    .line 511
    const v9, 0x7f0800ad

    .line 512
    .line 513
    .line 514
    invoke-virtual {v7, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 515
    .line 516
    .line 517
    move-result-object v9

    .line 518
    if-eqz v9, :cond_10

    .line 519
    .line 520
    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 521
    .line 522
    .line 523
    :cond_10
    if-eqz v5, :cond_13

    .line 524
    .line 525
    iget-object v9, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 526
    .line 527
    if-eqz v9, :cond_11

    .line 528
    .line 529
    invoke-virtual {v9, v15}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 530
    .line 531
    .line 532
    :cond_11
    iget-object v9, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 533
    .line 534
    if-eqz v9, :cond_12

    .line 535
    .line 536
    const v9, 0x7f0800b2

    .line 537
    .line 538
    .line 539
    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 540
    .line 541
    .line 542
    move-result-object v9

    .line 543
    goto :goto_b

    .line 544
    :cond_12
    const/4 v9, 0x0

    .line 545
    :goto_b
    if-eqz v9, :cond_14

    .line 546
    .line 547
    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 548
    .line 549
    .line 550
    goto :goto_c

    .line 551
    :cond_13
    const v6, 0x7f0800ae

    .line 552
    .line 553
    .line 554
    invoke-virtual {v7, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 555
    .line 556
    .line 557
    move-result-object v6

    .line 558
    if-eqz v6, :cond_14

    .line 559
    .line 560
    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    .line 561
    .line 562
    .line 563
    :cond_14
    :goto_c
    iget-object v6, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 564
    .line 565
    instance-of v9, v6, Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 566
    .line 567
    if-eqz v9, :cond_18

    .line 568
    .line 569
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 570
    .line 571
    .line 572
    if-eqz v8, :cond_15

    .line 573
    .line 574
    if-nez v5, :cond_18

    .line 575
    .line 576
    :cond_15
    invoke-virtual {v6}, Landroid/view/View;->getPaddingLeft()I

    .line 577
    .line 578
    .line 579
    move-result v9

    .line 580
    if-eqz v5, :cond_16

    .line 581
    .line 582
    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    .line 583
    .line 584
    .line 585
    move-result v11

    .line 586
    goto :goto_d

    .line 587
    :cond_16
    iget v11, v6, Landroidx/appcompat/app/AlertController$RecycleListView;->c:I

    .line 588
    .line 589
    :goto_d
    invoke-virtual {v6}, Landroid/view/View;->getPaddingRight()I

    .line 590
    .line 591
    .line 592
    move-result v12

    .line 593
    if-eqz v8, :cond_17

    .line 594
    .line 595
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 596
    .line 597
    .line 598
    move-result v13

    .line 599
    goto :goto_e

    .line 600
    :cond_17
    iget v13, v6, Landroidx/appcompat/app/AlertController$RecycleListView;->d:I

    .line 601
    .line 602
    :goto_e
    invoke-virtual {v6, v9, v11, v12, v13}, Landroid/view/View;->setPadding(IIII)V

    .line 603
    .line 604
    .line 605
    :cond_18
    if-nez v0, :cond_1c

    .line 606
    .line 607
    iget-object v0, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 608
    .line 609
    if-eqz v0, :cond_19

    .line 610
    .line 611
    goto :goto_f

    .line 612
    :cond_19
    iget-object v0, v3, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 613
    .line 614
    :goto_f
    if-eqz v0, :cond_1c

    .line 615
    .line 616
    if-eqz v8, :cond_1a

    .line 617
    .line 618
    goto :goto_10

    .line 619
    :cond_1a
    move v1, v10

    .line 620
    :goto_10
    or-int/2addr v1, v5

    .line 621
    const v5, 0x7f080082

    .line 622
    .line 623
    .line 624
    invoke-virtual {v4, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 625
    .line 626
    .line 627
    move-result-object v5

    .line 628
    const v6, 0x7f080081

    .line 629
    .line 630
    .line 631
    invoke-virtual {v4, v6}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 632
    .line 633
    .line 634
    move-result-object v4

    .line 635
    sget-object v6, LLj;->a:Ljava/util/WeakHashMap;

    .line 636
    .line 637
    const/4 v6, 0x3

    .line 638
    invoke-static {v0, v1, v6}, LFj;->b(Landroid/view/View;II)V

    .line 639
    .line 640
    .line 641
    if-eqz v5, :cond_1b

    .line 642
    .line 643
    invoke-virtual {v7, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 644
    .line 645
    .line 646
    :cond_1b
    if-eqz v4, :cond_1c

    .line 647
    .line 648
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 649
    .line 650
    .line 651
    :cond_1c
    iget-object v0, v3, LL0;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    .line 652
    .line 653
    if-eqz v0, :cond_1d

    .line 654
    .line 655
    iget-object v1, v3, LL0;->p:Landroid/widget/ListAdapter;

    .line 656
    .line 657
    if-eqz v1, :cond_1d

    .line 658
    .line 659
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 660
    .line 661
    .line 662
    iget v1, v3, LL0;->q:I

    .line 663
    .line 664
    const/4 v3, -0x1

    .line 665
    if-le v1, v3, :cond_1d

    .line 666
    .line 667
    invoke-virtual {v0, v1, v15}, Landroid/widget/AbsListView;->setItemChecked(IZ)V

    .line 668
    .line 669
    .line 670
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 671
    .line 672
    .line 673
    :cond_1d
    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, LN0;->h:LL0;

    .line 2
    .line 3
    iget-object v0, v0, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Landroidx/core/widget/NestedScrollView;->j(Landroid/view/KeyEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    return p1

    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    return p1
.end method

.method public final onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, LN0;->h:LL0;

    .line 2
    .line 3
    iget-object v0, v0, LL0;->i:Landroidx/core/widget/NestedScrollView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Landroidx/core/widget/NestedScrollView;->j(Landroid/view/KeyEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    return p1

    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyUp(ILandroid/view/KeyEvent;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    return p1
.end method

.method public final onSaveInstanceState()Landroid/os/Bundle;
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onSaveInstanceState()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "super.onSaveInstanceState()"

    .line 6
    .line 7
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, LN0;->d:LHg;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, LHg;->c(Landroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LN0;->c()Landroidx/lifecycle/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, LRc;->ON_RESUME:LRc;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final onStop()V
    .locals 2

    .line 1
    invoke-virtual {p0}, LN0;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LN0;->b()Lx1;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, LM1;

    .line 9
    .line 10
    invoke-virtual {v0}, LM1;->C()V

    .line 11
    .line 12
    .line 13
    iget-object v0, v0, LM1;->q:LT;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, LT;->m(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final onSupportActionModeFinished(Lo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onSupportActionModeStarted(Lo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onWindowStartingSupportActionMode(Ln0;)Lo0;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public final setContentView(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, LN0;->b()Lx1;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx1;->h(I)V

    return-void
.end method

.method public final setContentView(Landroid/view/View;)V
    .locals 1

    .line 2
    invoke-virtual {p0}, LN0;->b()Lx1;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx1;->i(Landroid/view/View;)V

    return-void
.end method

.method public final setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 3
    invoke-virtual {p0}, LN0;->b()Lx1;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lx1;->j(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final setTitle(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->setTitle(I)V

    invoke-virtual {p0}, LN0;->b()Lx1;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lx1;->k(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-virtual {p0, p1}, LN0;->h(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, LN0;->h:LL0;

    iput-object p1, v0, LL0;->d:Ljava/lang/CharSequence;

    .line 3
    iget-object v0, v0, LL0;->m:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
