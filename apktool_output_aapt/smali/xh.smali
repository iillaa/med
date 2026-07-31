.class public final Lxh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Lbc;

.field public final c:Lm1;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lm1;Lyh;Lbc;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "DEFAULT"

    .line 5
    .line 6
    iput-object v0, p0, Lxh;->d:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lxh;->c:Lm1;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lxh;->a:I

    .line 19
    .line 20
    iput-object p3, p0, Lxh;->b:Lbc;

    .line 21
    .line 22
    iget-object v0, p2, Lyh;->b:Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/high16 v1, 0x4000000

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 35
    .line 36
    .line 37
    const/high16 v1, -0x80000000

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 43
    .line 44
    .line 45
    iput v0, p0, Lxh;->a:I

    .line 46
    .line 47
    iget-object p1, p2, Lyh;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lxh;->c(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-boolean p1, p2, Lyh;->a:Z

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lxh;->b(Ljava/lang/Boolean;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lxh;->a()Lzh;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const/4 p2, 0x1

    .line 66
    iput-boolean p2, p1, Lzh;->d:Z

    .line 67
    .line 68
    iget-object p2, p3, Lbc;->a:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p2, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    .line 71
    .line 72
    const-string p3, "statusBarOverlayChanged"

    .line 73
    .line 74
    invoke-static {p2, p3, p1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->h(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lzh;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method public final a()Lzh;
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    iget-object v2, p0, Lxh;->c:Lm1;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    sget-object v5, LLj;->a:Ljava/util/WeakHashMap;

    .line 14
    .line 15
    invoke-static {v4}, LFj;->a(Landroid/view/View;)LLk;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    iget-object v4, v4, LLk;->a:LIk;

    .line 22
    .line 23
    invoke-virtual {v4, v0}, LIk;->o(I)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    move v4, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v4, v1

    .line 32
    :goto_0
    new-instance v5, Lzh;

    .line 33
    .line 34
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    new-instance v8, Li0;

    .line 50
    .line 51
    invoke-direct {v8, v7, v6}, Li0;-><init>(Landroid/view/Window;Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v6, v8, Li0;->d:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v6, LMk;

    .line 57
    .line 58
    invoke-virtual {v6}, LMk;->x()Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-eqz v6, :cond_1

    .line 63
    .line 64
    const-string v6, "LIGHT"

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const-string v6, "DARK"

    .line 68
    .line 69
    :goto_1
    iput-object v6, v5, Lzh;->e:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-virtual {v6}, Landroid/view/View;->getSystemUiVisibility()I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    const/16 v7, 0x400

    .line 84
    .line 85
    and-int/2addr v6, v7

    .line 86
    if-ne v6, v7, :cond_2

    .line 87
    .line 88
    move v6, v0

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    move v6, v1

    .line 91
    :goto_2
    iput-boolean v6, v5, Lzh;->c:Z

    .line 92
    .line 93
    iput-boolean v4, v5, Lzh;->d:Z

    .line 94
    .line 95
    const v4, 0xffffff

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Landroid/view/Window;->getStatusBarColor()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    and-int/2addr v3, v4

    .line 103
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    new-array v0, v0, [Ljava/lang/Object;

    .line 108
    .line 109
    aput-object v3, v0, v1

    .line 110
    .line 111
    const-string v3, "#%06X"

    .line 112
    .line 113
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, v5, Lzh;->f:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v2}, Lm1;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 128
    .line 129
    const/16 v4, 0x1e

    .line 130
    .line 131
    if-lt v3, v4, :cond_3

    .line 132
    .line 133
    invoke-virtual {v2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {v1}, LB;->l(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-static {v1}, LB;->g(Landroid/view/WindowMetrics;)Landroid/view/WindowInsets;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {}, LB;->v()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    invoke-static {v1, v2}, LB;->d(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-static {v1}, LA;->l(Landroid/graphics/Insets;)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    :goto_3
    int-to-float v1, v1

    .line 158
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 159
    .line 160
    div-float/2addr v1, v0

    .line 161
    float-to-int v1, v1

    .line 162
    goto :goto_4

    .line 163
    :cond_3
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v2}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    if-eqz v2, :cond_4

    .line 176
    .line 177
    invoke-virtual {v2}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    goto :goto_3

    .line 182
    :cond_4
    :goto_4
    iput v1, v5, Lzh;->g:I

    .line 183
    .line 184
    return-object v5
.end method

.method public final b(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lxh;->c:Lm1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    or-int/lit16 p1, v2, 0x500

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/view/Window;->getStatusBarColor()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lxh;->a:I

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    and-int/lit16 p1, v2, -0x501

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget v0, p0, Lxh;->a:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_1
    invoke-virtual {p0}, Lxh;->a()Lzh;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p0, Lxh;->b:Lbc;

    .line 62
    .line 63
    iget-object v0, v0, Lbc;->a:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    .line 66
    .line 67
    const-string v1, "statusBarOverlayChanged"

    .line 68
    .line 69
    invoke-static {v0, v1, p1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->h(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lzh;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lxh;->c:Lm1;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iput-object p1, p0, Lxh;->d:Ljava/lang/String;

    .line 12
    .line 13
    const-string v3, "DEFAULT"

    .line 14
    .line 15
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const-string v4, "DARK"

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lm1;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    .line 32
    .line 33
    and-int/lit8 p1, p1, 0x30

    .line 34
    .line 35
    const/16 v0, 0x20

    .line 36
    .line 37
    if-eq p1, v0, :cond_0

    .line 38
    .line 39
    const-string p1, "LIGHT"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object p1, v4

    .line 43
    :cond_1
    :goto_0
    new-instance v0, Li0;

    .line 44
    .line 45
    invoke-direct {v0, v1, v2}, Li0;-><init>(Landroid/view/Window;Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    xor-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    iget-object v0, v0, Li0;->d:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v0, LMk;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, LMk;->D(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
