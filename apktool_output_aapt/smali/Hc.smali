.class public final LHc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/WindowInsets;

.field public final synthetic b:Lm1;

.field public final synthetic c:Z

.field public final synthetic d:LIc;


# direct methods
.method public constructor <init>(LIc;Lm1;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LHc;->d:LIc;

    .line 5
    .line 6
    iput-object p2, p0, LHc;->b:Lm1;

    .line 7
    .line 8
    iput-boolean p3, p0, LHc;->c:Z

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, LHc;->d:LIc;

    .line 2
    .line 3
    iget-object v1, v0, LIc;->c:Landroid/view/View;

    .line 4
    .line 5
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 6
    .line 7
    invoke-static {v1}, LFj;->a(Landroid/view/View;)LLk;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, LLk;->a:LIk;

    .line 12
    .line 13
    const/16 v2, 0x8

    .line 14
    .line 15
    invoke-virtual {v1, v2}, LIk;->o(I)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v3, v0, LIc;->c:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v3}, LFj;->a(Landroid/view/View;)LLk;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v3, v3, LLk;->a:LIk;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, LIk;->f(I)Lgc;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v2, v2, Lgc;->d:I

    .line 32
    .line 33
    iget-object v3, p0, LHc;->b:Lm1;

    .line 34
    .line 35
    invoke-virtual {v3}, Lm1;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 44
    .line 45
    iget-object v0, v0, LIc;->g:Lbc;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    int-to-float v1, v2

    .line 50
    div-float/2addr v1, v3

    .line 51
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iget-object v0, v0, Lbc;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    .line 58
    .line 59
    const-string v2, "keyboardDidShow"

    .line 60
    .line 61
    invoke-virtual {v0, v2, v1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->onKeyboardEvent(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object v0, v0, Lbc;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    .line 68
    .line 69
    const-string v1, "keyboardDidHide"

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-virtual {v0, v1, v2}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->onKeyboardEvent(Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    :goto_0
    return-void
.end method

.method public final b(LY1;)V
    .locals 10

    .line 1
    iget-object p1, p0, LHc;->d:LIc;

    .line 2
    .line 3
    iget-object v0, p1, LIc;->c:Landroid/view/View;

    .line 4
    .line 5
    sget-object v1, LLj;->a:Ljava/util/WeakHashMap;

    .line 6
    .line 7
    invoke-static {v0}, LFj;->a(Landroid/view/View;)LLk;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, LLk;->a:LIk;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    invoke-virtual {v0, v1}, LIk;->o(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v2, p1, LIc;->c:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v2}, LFj;->a(Landroid/view/View;)LLk;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v2, v2, LLk;->a:LIk;

    .line 26
    .line 27
    invoke-virtual {v2, v1}, LIk;->f(I)Lgc;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v1, v1, Lgc;->d:I

    .line 32
    .line 33
    iget-object v2, p0, LHc;->b:Lm1;

    .line 34
    .line 35
    invoke-virtual {v2}, Lm1;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 44
    .line 45
    iget-boolean v3, p0, LHc;->c:Z

    .line 46
    .line 47
    if-eqz v3, :cond_6

    .line 48
    .line 49
    iget-object v3, p1, LIc;->f:Landroid/view/View;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    new-instance v4, Landroid/graphics/Rect;

    .line 54
    .line 55
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v4}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 59
    .line 60
    .line 61
    iget-object v5, p1, LIc;->a:Lcom/getcapacitor/Bridge;

    .line 62
    .line 63
    const-string v6, "auto"

    .line 64
    .line 65
    if-nez v5, :cond_0

    .line 66
    .line 67
    move-object v5, v6

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {v5}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v5}, Lcom/getcapacitor/CapConfig;->adjustMarginsForEdgeToEdge()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    :goto_0
    const-string v7, "force"

    .line 78
    .line 79
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    iget-object v8, p1, LIc;->b:Lm1;

    .line 84
    .line 85
    if-eqz v7, :cond_1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 89
    .line 90
    const/16 v9, 0x23

    .line 91
    .line 92
    if-lt v7, v9, :cond_3

    .line 93
    .line 94
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-eqz v5, :cond_3

    .line 99
    .line 100
    new-instance v5, Landroid/util/TypedValue;

    .line 101
    .line 102
    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v8}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    const v7, 0x101069a

    .line 110
    .line 111
    .line 112
    const/4 v9, 0x1

    .line 113
    invoke-virtual {v6, v7, v5, v9}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    if-nez v6, :cond_2

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_2
    iget v5, v5, Landroid/util/TypedValue;->data:I

    .line 121
    .line 122
    if-nez v5, :cond_3

    .line 123
    .line 124
    :goto_1
    iget-object v5, p1, LIc;->c:Landroid/view/View;

    .line 125
    .line 126
    invoke-static {v5}, LFj;->a(Landroid/view/View;)LLk;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    if-eqz v5, :cond_3

    .line 131
    .line 132
    iget-object v5, v5, LLk;->a:LIk;

    .line 133
    .line 134
    const/4 v6, 0x7

    .line 135
    invoke-virtual {v5, v6}, LIk;->f(I)Lgc;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    iget v5, v5, Lgc;->d:I

    .line 140
    .line 141
    if-lez v5, :cond_3

    .line 142
    .line 143
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 144
    .line 145
    add-int/2addr v4, v5

    .line 146
    goto :goto_2

    .line 147
    :cond_3
    invoke-virtual {v8}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {v5}, Landroid/view/View;->getSystemUiVisibility()I

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    const/16 v6, 0x400

    .line 160
    .line 161
    and-int/2addr v5, v6

    .line 162
    if-ne v5, v6, :cond_4

    .line 163
    .line 164
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    goto :goto_2

    .line 172
    :cond_5
    const/4 v4, -0x1

    .line 173
    :goto_2
    iget v5, p1, LIc;->d:I

    .line 174
    .line 175
    if-eq v5, v4, :cond_6

    .line 176
    .line 177
    iget-object v5, p1, LIc;->e:Landroid/widget/FrameLayout$LayoutParams;

    .line 178
    .line 179
    iput v4, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 180
    .line 181
    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 182
    .line 183
    .line 184
    iput v4, p1, LIc;->d:I

    .line 185
    .line 186
    :cond_6
    iget-object p1, p1, LIc;->g:Lbc;

    .line 187
    .line 188
    if-eqz v0, :cond_7

    .line 189
    .line 190
    int-to-float v0, v1

    .line 191
    div-float/2addr v0, v2

    .line 192
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iget-object p1, p1, Lbc;->a:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast p1, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    .line 199
    .line 200
    const-string v1, "keyboardWillShow"

    .line 201
    .line 202
    invoke-virtual {p1, v1, v0}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->onKeyboardEvent(Ljava/lang/String;I)V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_7
    iget-object p1, p1, Lbc;->a:Ljava/lang/Object;

    .line 207
    .line 208
    check-cast p1, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    .line 209
    .line 210
    const-string v0, "keyboardWillHide"

    .line 211
    .line 212
    const/4 v1, 0x0

    .line 213
    invoke-virtual {p1, v0, v1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->onKeyboardEvent(Ljava/lang/String;I)V

    .line 214
    .line 215
    .line 216
    :goto_3
    return-void
.end method
