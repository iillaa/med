.class public abstract Lnd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgh;


# static fields
.field public static final B:Ljava/lang/reflect/Method;

.field public static final C:Ljava/lang/reflect/Method;

.field public static final D:Ljava/lang/reflect/Method;


# instance fields
.field public final A:LX1;

.field public final c:Landroid/content/Context;

.field public d:Landroid/widget/ListAdapter;

.field public e:Ld7;

.field public final f:I

.field public g:I

.field public h:I

.field public i:I

.field public final j:I

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:I

.field public final o:I

.field public p:Lp6;

.field public q:Landroid/view/View;

.field public r:Landroid/widget/AdapterView$OnItemClickListener;

.field public final s:Lkd;

.field public final t:Lmd;

.field public final u:Lld;

.field public final v:Lkd;

.field public final w:Landroid/os/Handler;

.field public final x:Landroid/graphics/Rect;

.field public y:Landroid/graphics/Rect;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v3, 0x1c

    .line 6
    .line 7
    const-string v4, "ListPopupWindow"

    .line 8
    .line 9
    const-class v5, Landroid/widget/PopupWindow;

    .line 10
    .line 11
    if-gt v2, v3, :cond_0

    .line 12
    .line 13
    :try_start_0
    const-string v2, "setClipToScreenEnabled"

    .line 14
    .line 15
    new-array v3, v1, [Ljava/lang/Class;

    .line 16
    .line 17
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 18
    .line 19
    aput-object v6, v3, v0

    .line 20
    .line 21
    invoke-virtual {v5, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sput-object v2, Lnd;->B:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    const-string v2, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well."

    .line 29
    .line 30
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    :goto_0
    :try_start_1
    const-string v2, "setEpicenterBounds"

    .line 34
    .line 35
    new-array v3, v1, [Ljava/lang/Class;

    .line 36
    .line 37
    const-class v6, Landroid/graphics/Rect;

    .line 38
    .line 39
    aput-object v6, v3, v0

    .line 40
    .line 41
    invoke-virtual {v5, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    sput-object v2, Lnd;->D:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_1
    const-string v2, "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well."

    .line 49
    .line 50
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_0
    :goto_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 54
    .line 55
    const/16 v3, 0x17

    .line 56
    .line 57
    if-gt v2, v3, :cond_1

    .line 58
    .line 59
    :try_start_2
    const-string v2, "getMaxAvailableHeight"

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    new-array v3, v3, [Ljava/lang/Class;

    .line 63
    .line 64
    const-class v6, Landroid/view/View;

    .line 65
    .line 66
    aput-object v6, v3, v0

    .line 67
    .line 68
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 69
    .line 70
    aput-object v0, v3, v1

    .line 71
    .line 72
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 73
    .line 74
    const/4 v1, 0x2

    .line 75
    aput-object v0, v3, v1

    .line 76
    .line 77
    invoke-virtual {v5, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sput-object v0, Lnd;->C:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_2

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :catch_2
    const-string v0, "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well."

    .line 85
    .line 86
    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_2
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Lnd;->f:I

    .line 6
    .line 7
    iput v0, p0, Lnd;->g:I

    .line 8
    .line 9
    const/16 v0, 0x3ea

    .line 10
    .line 11
    iput v0, p0, Lnd;->j:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lnd;->n:I

    .line 15
    .line 16
    const v1, 0x7fffffff

    .line 17
    .line 18
    .line 19
    iput v1, p0, Lnd;->o:I

    .line 20
    .line 21
    new-instance v1, Lkd;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-direct {v1, p0, v2}, Lkd;-><init>(Lnd;I)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lnd;->s:Lkd;

    .line 28
    .line 29
    new-instance v1, Lmd;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lmd;-><init>(Lnd;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lnd;->t:Lmd;

    .line 35
    .line 36
    new-instance v1, Lld;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lld;-><init>(Lnd;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lnd;->u:Lld;

    .line 42
    .line 43
    new-instance v1, Lkd;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-direct {v1, p0, v2}, Lkd;-><init>(Lnd;I)V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Lnd;->v:Lkd;

    .line 50
    .line 51
    new-instance v1, Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lnd;->x:Landroid/graphics/Rect;

    .line 57
    .line 58
    iput-object p1, p0, Lnd;->c:Landroid/content/Context;

    .line 59
    .line 60
    new-instance v1, Landroid/os/Handler;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lnd;->w:Landroid/os/Handler;

    .line 70
    .line 71
    sget-object v1, LNf;->o:[I

    .line 72
    .line 73
    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput v2, p0, Lnd;->h:I

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iput v3, p0, Lnd;->i:I

    .line 89
    .line 90
    if-eqz v3, :cond_0

    .line 91
    .line 92
    iput-boolean v2, p0, Lnd;->k:Z

    .line 93
    .line 94
    :cond_0
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    .line 96
    .line 97
    new-instance v1, LX1;

    .line 98
    .line 99
    invoke-direct {v1, p1, p2, p3, p4}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 100
    .line 101
    .line 102
    sget-object v3, LNf;->s:[I

    .line 103
    .line 104
    invoke-virtual {p1, p2, v3, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    const/4 p3, 0x2

    .line 109
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 110
    .line 111
    .line 112
    move-result p4

    .line 113
    if-eqz p4, :cond_1

    .line 114
    .line 115
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    invoke-virtual {v1, p3}, Landroid/widget/PopupWindow;->setOverlapAnchor(Z)V

    .line 120
    .line 121
    .line 122
    :cond_1
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    if-eqz p3, :cond_2

    .line 127
    .line 128
    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    if-eqz p3, :cond_2

    .line 133
    .line 134
    invoke-static {p1, p3}, LMk;->q(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    goto :goto_0

    .line 139
    :cond_2
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    :goto_0
    invoke-virtual {v1, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 147
    .line 148
    .line 149
    iput-object v1, p0, Lnd;->A:LX1;

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    .line 152
    .line 153
    .line 154
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Z)Ld7;
    .locals 1

    .line 1
    new-instance v0, Ld7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ld7;-><init>(Landroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lnd;->A:LX1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public final c(I)V
    .locals 0

    .line 1
    iput p1, p0, Lnd;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public final d()I
    .locals 1

    .line 1
    iget v0, p0, Lnd;->h:I

    .line 2
    .line 3
    return v0
.end method

.method public final dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Lnd;->A:LX1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lnd;->e:Ld7;

    .line 11
    .line 12
    iget-object v0, p0, Lnd;->w:Landroid/os/Handler;

    .line 13
    .line 14
    iget-object v1, p0, Lnd;->s:Lkd;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f()V
    .locals 14

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 5
    .line 6
    iget-object v4, p0, Lnd;->A:LX1;

    .line 7
    .line 8
    iget-object v5, p0, Lnd;->c:Landroid/content/Context;

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    iget-boolean v3, p0, Lnd;->z:Z

    .line 13
    .line 14
    xor-int/2addr v3, v1

    .line 15
    invoke-virtual {p0, v5, v3}, Lnd;->a(Landroid/content/Context;Z)Ld7;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iput-object v3, p0, Lnd;->e:Ld7;

    .line 20
    .line 21
    iget-object v6, p0, Lnd;->d:Landroid/widget/ListAdapter;

    .line 22
    .line 23
    invoke-virtual {v3, v6}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 27
    .line 28
    iget-object v6, p0, Lnd;->r:Landroid/widget/AdapterView$OnItemClickListener;

    .line 29
    .line 30
    invoke-virtual {v3, v6}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 34
    .line 35
    invoke-virtual {v3, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 39
    .line 40
    invoke-virtual {v3, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 44
    .line 45
    new-instance v6, Lhd;

    .line 46
    .line 47
    invoke-direct {v6, v2, p0}, Lhd;-><init>(ILjava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v6}, Landroid/widget/AdapterView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 54
    .line 55
    iget-object v6, p0, Lnd;->u:Lld;

    .line 56
    .line 57
    invoke-virtual {v3, v6}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lnd;->e:Ld7;

    .line 61
    .line 62
    invoke-virtual {v4, v3}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Landroid/view/ViewGroup;

    .line 71
    .line 72
    :goto_0
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iget-object v6, p0, Lnd;->x:Landroid/graphics/Rect;

    .line 77
    .line 78
    if-eqz v3, :cond_1

    .line 79
    .line 80
    invoke-virtual {v3, v6}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 81
    .line 82
    .line 83
    iget v3, v6, Landroid/graphics/Rect;->top:I

    .line 84
    .line 85
    iget v7, v6, Landroid/graphics/Rect;->bottom:I

    .line 86
    .line 87
    add-int/2addr v7, v3

    .line 88
    iget-boolean v8, p0, Lnd;->k:Z

    .line 89
    .line 90
    if-nez v8, :cond_2

    .line 91
    .line 92
    neg-int v3, v3

    .line 93
    iput v3, p0, Lnd;->i:I

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    invoke-virtual {v6}, Landroid/graphics/Rect;->setEmpty()V

    .line 97
    .line 98
    .line 99
    move v7, v2

    .line 100
    :cond_2
    :goto_1
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-ne v3, v0, :cond_3

    .line 105
    .line 106
    move v3, v1

    .line 107
    goto :goto_2

    .line 108
    :cond_3
    move v3, v2

    .line 109
    :goto_2
    iget-object v8, p0, Lnd;->q:Landroid/view/View;

    .line 110
    .line 111
    iget v9, p0, Lnd;->i:I

    .line 112
    .line 113
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 114
    .line 115
    const/16 v11, 0x17

    .line 116
    .line 117
    const-string v12, "ListPopupWindow"

    .line 118
    .line 119
    if-gt v10, v11, :cond_5

    .line 120
    .line 121
    sget-object v10, Lnd;->C:Ljava/lang/reflect/Method;

    .line 122
    .line 123
    if-eqz v10, :cond_4

    .line 124
    .line 125
    :try_start_0
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v11

    .line 129
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    const/4 v13, 0x3

    .line 134
    new-array v13, v13, [Ljava/lang/Object;

    .line 135
    .line 136
    aput-object v8, v13, v2

    .line 137
    .line 138
    aput-object v11, v13, v1

    .line 139
    .line 140
    aput-object v3, v13, v0

    .line 141
    .line 142
    invoke-virtual {v10, v4, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Ljava/lang/Integer;

    .line 147
    .line 148
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 149
    .line 150
    .line 151
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    goto :goto_3

    .line 153
    :catch_0
    const-string v3, "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version."

    .line 154
    .line 155
    invoke-static {v12, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    :cond_4
    invoke-virtual {v4, v8, v9}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;I)I

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    goto :goto_3

    .line 163
    :cond_5
    invoke-static {v4, v8, v9, v3}, Lid;->a(Landroid/widget/PopupWindow;Landroid/view/View;IZ)I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    :goto_3
    iget v8, p0, Lnd;->f:I

    .line 168
    .line 169
    const/4 v9, -0x2

    .line 170
    const/4 v10, -0x1

    .line 171
    if-ne v8, v10, :cond_6

    .line 172
    .line 173
    add-int/2addr v3, v7

    .line 174
    goto :goto_6

    .line 175
    :cond_6
    iget v11, p0, Lnd;->g:I

    .line 176
    .line 177
    if-eq v11, v9, :cond_8

    .line 178
    .line 179
    const/high16 v13, 0x40000000    # 2.0f

    .line 180
    .line 181
    if-eq v11, v10, :cond_7

    .line 182
    .line 183
    invoke-static {v11, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    goto :goto_4

    .line 188
    :cond_7
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 197
    .line 198
    iget v11, v6, Landroid/graphics/Rect;->left:I

    .line 199
    .line 200
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 201
    .line 202
    add-int/2addr v11, v6

    .line 203
    sub-int/2addr v5, v11

    .line 204
    invoke-static {v5, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    goto :goto_4

    .line 209
    :cond_8
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 218
    .line 219
    iget v11, v6, Landroid/graphics/Rect;->left:I

    .line 220
    .line 221
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 222
    .line 223
    add-int/2addr v11, v6

    .line 224
    sub-int/2addr v5, v11

    .line 225
    const/high16 v6, -0x80000000

    .line 226
    .line 227
    invoke-static {v5, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    :goto_4
    iget-object v6, p0, Lnd;->e:Ld7;

    .line 232
    .line 233
    invoke-virtual {v6, v5, v3}, Ld7;->a(II)I

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    if-lez v3, :cond_9

    .line 238
    .line 239
    iget-object v5, p0, Lnd;->e:Ld7;

    .line 240
    .line 241
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    iget-object v6, p0, Lnd;->e:Ld7;

    .line 246
    .line 247
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 248
    .line 249
    .line 250
    move-result v6

    .line 251
    add-int/2addr v6, v5

    .line 252
    add-int/2addr v6, v7

    .line 253
    goto :goto_5

    .line 254
    :cond_9
    move v6, v2

    .line 255
    :goto_5
    add-int/2addr v3, v6

    .line 256
    :goto_6
    iget-object v5, p0, Lnd;->A:LX1;

    .line 257
    .line 258
    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    if-ne v5, v0, :cond_a

    .line 263
    .line 264
    move v0, v1

    .line 265
    goto :goto_7

    .line 266
    :cond_a
    move v0, v2

    .line 267
    :goto_7
    iget v5, p0, Lnd;->j:I

    .line 268
    .line 269
    invoke-virtual {v4, v5}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v4}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 273
    .line 274
    .line 275
    move-result v5

    .line 276
    if-eqz v5, :cond_16

    .line 277
    .line 278
    iget-object v5, p0, Lnd;->q:Landroid/view/View;

    .line 279
    .line 280
    sget-object v6, LLj;->a:Ljava/util/WeakHashMap;

    .line 281
    .line 282
    invoke-virtual {v5}, Landroid/view/View;->isAttachedToWindow()Z

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    if-nez v5, :cond_b

    .line 287
    .line 288
    return-void

    .line 289
    :cond_b
    iget v5, p0, Lnd;->g:I

    .line 290
    .line 291
    if-ne v5, v10, :cond_c

    .line 292
    .line 293
    move v5, v10

    .line 294
    goto :goto_8

    .line 295
    :cond_c
    if-ne v5, v9, :cond_d

    .line 296
    .line 297
    iget-object v5, p0, Lnd;->q:Landroid/view/View;

    .line 298
    .line 299
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 300
    .line 301
    .line 302
    move-result v5

    .line 303
    :cond_d
    :goto_8
    if-ne v8, v10, :cond_12

    .line 304
    .line 305
    if-eqz v0, :cond_e

    .line 306
    .line 307
    move v8, v3

    .line 308
    goto :goto_9

    .line 309
    :cond_e
    move v8, v10

    .line 310
    :goto_9
    if-eqz v0, :cond_10

    .line 311
    .line 312
    iget v0, p0, Lnd;->g:I

    .line 313
    .line 314
    if-ne v0, v10, :cond_f

    .line 315
    .line 316
    move v0, v10

    .line 317
    goto :goto_a

    .line 318
    :cond_f
    move v0, v2

    .line 319
    :goto_a
    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v4, v2}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 323
    .line 324
    .line 325
    goto :goto_b

    .line 326
    :cond_10
    iget v0, p0, Lnd;->g:I

    .line 327
    .line 328
    if-ne v0, v10, :cond_11

    .line 329
    .line 330
    move v2, v10

    .line 331
    :cond_11
    invoke-virtual {v4, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {v4, v10}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 335
    .line 336
    .line 337
    goto :goto_b

    .line 338
    :cond_12
    if-ne v8, v9, :cond_13

    .line 339
    .line 340
    move v8, v3

    .line 341
    :cond_13
    :goto_b
    invoke-virtual {v4, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Lnd;->q:Landroid/view/View;

    .line 345
    .line 346
    iget v6, p0, Lnd;->h:I

    .line 347
    .line 348
    iget v7, p0, Lnd;->i:I

    .line 349
    .line 350
    if-gez v5, :cond_14

    .line 351
    .line 352
    move v1, v10

    .line 353
    goto :goto_c

    .line 354
    :cond_14
    move v1, v5

    .line 355
    :goto_c
    if-gez v8, :cond_15

    .line 356
    .line 357
    move v9, v10

    .line 358
    goto :goto_d

    .line 359
    :cond_15
    move v9, v8

    .line 360
    :goto_d
    move-object v5, v0

    .line 361
    move v8, v1

    .line 362
    invoke-virtual/range {v4 .. v9}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 363
    .line 364
    .line 365
    goto/16 :goto_12

    .line 366
    .line 367
    :cond_16
    iget v0, p0, Lnd;->g:I

    .line 368
    .line 369
    if-ne v0, v10, :cond_17

    .line 370
    .line 371
    move v0, v10

    .line 372
    goto :goto_e

    .line 373
    :cond_17
    if-ne v0, v9, :cond_18

    .line 374
    .line 375
    iget-object v0, p0, Lnd;->q:Landroid/view/View;

    .line 376
    .line 377
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    :cond_18
    :goto_e
    if-ne v8, v10, :cond_19

    .line 382
    .line 383
    move v8, v10

    .line 384
    goto :goto_f

    .line 385
    :cond_19
    if-ne v8, v9, :cond_1a

    .line 386
    .line 387
    move v8, v3

    .line 388
    :cond_1a
    :goto_f
    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v4, v8}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 392
    .line 393
    .line 394
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 395
    .line 396
    const/16 v3, 0x1c

    .line 397
    .line 398
    if-gt v0, v3, :cond_1b

    .line 399
    .line 400
    sget-object v0, Lnd;->B:Ljava/lang/reflect/Method;

    .line 401
    .line 402
    if-eqz v0, :cond_1c

    .line 403
    .line 404
    :try_start_1
    new-array v5, v1, [Ljava/lang/Object;

    .line 405
    .line 406
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 407
    .line 408
    aput-object v6, v5, v2

    .line 409
    .line 410
    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 411
    .line 412
    .line 413
    goto :goto_10

    .line 414
    :catch_1
    const-string v0, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well."

    .line 415
    .line 416
    invoke-static {v12, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    .line 418
    .line 419
    goto :goto_10

    .line 420
    :cond_1b
    invoke-static {v4, v1}, Ljd;->b(Landroid/widget/PopupWindow;Z)V

    .line 421
    .line 422
    .line 423
    :cond_1c
    :goto_10
    invoke-virtual {v4, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 424
    .line 425
    .line 426
    iget-object v0, p0, Lnd;->t:Lmd;

    .line 427
    .line 428
    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 429
    .line 430
    .line 431
    iget-boolean v0, p0, Lnd;->m:Z

    .line 432
    .line 433
    if-eqz v0, :cond_1d

    .line 434
    .line 435
    iget-boolean v0, p0, Lnd;->l:Z

    .line 436
    .line 437
    invoke-virtual {v4, v0}, Landroid/widget/PopupWindow;->setOverlapAnchor(Z)V

    .line 438
    .line 439
    .line 440
    :cond_1d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 441
    .line 442
    if-gt v0, v3, :cond_1e

    .line 443
    .line 444
    sget-object v0, Lnd;->D:Ljava/lang/reflect/Method;

    .line 445
    .line 446
    if-eqz v0, :cond_1f

    .line 447
    .line 448
    :try_start_2
    iget-object v3, p0, Lnd;->y:Landroid/graphics/Rect;

    .line 449
    .line 450
    new-array v5, v1, [Ljava/lang/Object;

    .line 451
    .line 452
    aput-object v3, v5, v2

    .line 453
    .line 454
    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 455
    .line 456
    .line 457
    goto :goto_11

    .line 458
    :catch_2
    move-exception v0

    .line 459
    const-string v2, "Could not invoke setEpicenterBounds on PopupWindow"

    .line 460
    .line 461
    invoke-static {v12, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 462
    .line 463
    .line 464
    goto :goto_11

    .line 465
    :cond_1e
    iget-object v0, p0, Lnd;->y:Landroid/graphics/Rect;

    .line 466
    .line 467
    invoke-static {v4, v0}, Ljd;->a(Landroid/widget/PopupWindow;Landroid/graphics/Rect;)V

    .line 468
    .line 469
    .line 470
    :cond_1f
    :goto_11
    iget-object v0, p0, Lnd;->q:Landroid/view/View;

    .line 471
    .line 472
    iget v2, p0, Lnd;->h:I

    .line 473
    .line 474
    iget v3, p0, Lnd;->i:I

    .line 475
    .line 476
    iget v5, p0, Lnd;->n:I

    .line 477
    .line 478
    invoke-virtual {v4, v0, v2, v3, v5}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 479
    .line 480
    .line 481
    iget-object v0, p0, Lnd;->e:Ld7;

    .line 482
    .line 483
    invoke-virtual {v0, v10}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 484
    .line 485
    .line 486
    iget-boolean v0, p0, Lnd;->z:Z

    .line 487
    .line 488
    if-eqz v0, :cond_20

    .line 489
    .line 490
    iget-object v0, p0, Lnd;->e:Ld7;

    .line 491
    .line 492
    invoke-virtual {v0}, Ld7;->isInTouchMode()Z

    .line 493
    .line 494
    .line 495
    move-result v0

    .line 496
    if-eqz v0, :cond_21

    .line 497
    .line 498
    :cond_20
    iget-object v0, p0, Lnd;->e:Ld7;

    .line 499
    .line 500
    if-eqz v0, :cond_21

    .line 501
    .line 502
    invoke-virtual {v0, v1}, Ld7;->setListSelectionHidden(Z)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 506
    .line 507
    .line 508
    :cond_21
    iget-boolean v0, p0, Lnd;->z:Z

    .line 509
    .line 510
    if-nez v0, :cond_22

    .line 511
    .line 512
    iget-object v0, p0, Lnd;->w:Landroid/os/Handler;

    .line 513
    .line 514
    iget-object v1, p0, Lnd;->v:Lkd;

    .line 515
    .line 516
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 517
    .line 518
    .line 519
    :cond_22
    :goto_12
    return-void
.end method

.method public final g()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lnd;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return v0

    .line 7
    :cond_0
    iget v0, p0, Lnd;->i:I

    .line 8
    .line 9
    return v0
.end method

.method public final h()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-object v0, p0, Lnd;->A:LX1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public final j()Ld7;
    .locals 1

    .line 1
    iget-object v0, p0, Lnd;->e:Ld7;

    .line 2
    .line 3
    return-object v0
.end method

.method public final l(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lnd;->A:LX1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m(I)V
    .locals 0

    .line 1
    iput p1, p0, Lnd;->i:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lnd;->k:Z

    .line 5
    .line 6
    return-void
.end method

.method public n(Landroid/widget/ListAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lnd;->p:Lp6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lp6;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p0}, Lp6;-><init>(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lnd;->p:Lp6;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lnd;->d:Landroid/widget/ListAdapter;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v1, v0}, Landroid/widget/Adapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    iput-object p1, p0, Lnd;->d:Landroid/widget/ListAdapter;

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lnd;->p:Lp6;

    .line 26
    .line 27
    invoke-interface {p1, v0}, Landroid/widget/Adapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p1, p0, Lnd;->e:Ld7;

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Lnd;->d:Landroid/widget/ListAdapter;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public final p(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lnd;->A:LX1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lnd;->x:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 12
    .line 13
    .line 14
    iget v0, v1, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr v0, v1

    .line 19
    add-int/2addr v0, p1

    .line 20
    iput v0, p0, Lnd;->g:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iput p1, p0, Lnd;->g:I

    .line 24
    .line 25
    :goto_0
    return-void
.end method
