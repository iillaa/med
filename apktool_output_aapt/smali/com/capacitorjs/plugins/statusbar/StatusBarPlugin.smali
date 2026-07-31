.class public Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "StatusBar"
.end annotation


# instance fields
.field private implementation:Lxh;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    return-void
.end method

.method public static synthetic c(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$setStyle$1(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic d(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$show$4(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic e(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$hide$3(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic f(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$setBackgroundColor$2(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic g(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/Boolean;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$setOverlaysWebView$5(Ljava/lang/Boolean;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method private getStatusBarConfig()Lyh;
    .locals 4

    .line 1
    new-instance v0, Lyh;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Lyh;->a:Z

    .line 8
    .line 9
    const-string v1, "#000000"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/getcapacitor/util/WebColor;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lyh;->b:Ljava/lang/Integer;

    .line 20
    .line 21
    const-string v1, "DEFAULT"

    .line 22
    .line 23
    iput-object v1, v0, Lyh;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "backgroundColor"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/getcapacitor/PluginConfig;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    :try_start_0
    invoke-static {v1}, Lcom/getcapacitor/util/WebColor;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lyh;->b:Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    const-string v1, "Background color not applied"

    .line 49
    .line 50
    invoke-static {v1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v2, v0, Lyh;->c:Ljava/lang/String;

    .line 58
    .line 59
    const-string v3, "style"

    .line 60
    .line 61
    invoke-virtual {v1, v3, v2}, Lcom/getcapacitor/PluginConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-direct {p0, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->styleFromConfig(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lyh;->c:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-boolean v2, v0, Lyh;->a:Z

    .line 76
    .line 77
    const-string v3, "overlaysWebView"

    .line 78
    .line 79
    invoke-virtual {v1, v3, v2}, Lcom/getcapacitor/PluginConfig;->getBoolean(Ljava/lang/String;Z)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iput-boolean v1, v0, Lyh;->a:Z

    .line 84
    .line 85
    return-object v0
.end method

.method public static synthetic h(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lzh;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->lambda$load$0(Ljava/lang/String;Lzh;)V

    return-void
.end method

.method private lambda$hide$3(Lcom/getcapacitor/PluginCall;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    .line 2
    .line 3
    iget-object v1, v0, Lxh;->c:Lm1;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v3, Li0;

    .line 18
    .line 19
    invoke-direct {v3, v2}, Li0;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v4, 0x23

    .line 25
    .line 26
    if-lt v2, v4, :cond_0

    .line 27
    .line 28
    new-instance v2, LOk;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v4, 0x1e

    .line 36
    .line 37
    if-lt v2, v4, :cond_1

    .line 38
    .line 39
    new-instance v2, LMk;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 v4, 0x1a

    .line 47
    .line 48
    if-lt v2, v4, :cond_2

    .line 49
    .line 50
    new-instance v2, LNk;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    new-instance v2, LMk;

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-virtual {v2}, LMk;->u()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lxh;->a()Lzh;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const/4 v2, 0x0

    .line 71
    iput-boolean v2, v1, Lzh;->d:Z

    .line 72
    .line 73
    iget-object v0, v0, Lxh;->b:Lbc;

    .line 74
    .line 75
    iget-object v0, v0, Lbc;->a:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    .line 78
    .line 79
    const-string v2, "statusBarVisibilityChanged"

    .line 80
    .line 81
    invoke-static {v0, v2, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->h(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lzh;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private synthetic lambda$load$0(Ljava/lang/String;Lzh;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->toJSObject(Lzh;)Lcom/getcapacitor/JSObject;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private lambda$setBackgroundColor$2(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/getcapacitor/util/WebColor;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    .line 12
    .line 13
    iget-object v1, v0, Lxh;->c:Lm1;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/high16 v2, 0x4000000

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 22
    .line 23
    .line 24
    const/high16 v2, -0x80000000

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 30
    .line 31
    .line 32
    iput p1, v0, Lxh;->a:I

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/getcapacitor/PluginCall;->resolve()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    const-string p1, "Invalid color provided. Must be a hex string (ex: #ff0000"

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    return-void
.end method

.method private synthetic lambda$setOverlaysWebView$5(Ljava/lang/Boolean;Lcom/getcapacitor/PluginCall;)V
    .locals 1

    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    invoke-virtual {v0, p1}, Lxh;->b(Ljava/lang/Boolean;)V

    invoke-virtual {p2}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method private synthetic lambda$setStyle$1(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 1

    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    invoke-virtual {v0, p1}, Lxh;->c(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method private lambda$show$4(Lcom/getcapacitor/PluginCall;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    .line 2
    .line 3
    iget-object v1, v0, Lxh;->c:Lm1;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v3, Li0;

    .line 18
    .line 19
    invoke-direct {v3, v2}, Li0;-><init>(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v4, 0x23

    .line 25
    .line 26
    if-lt v2, v4, :cond_0

    .line 27
    .line 28
    new-instance v2, LOk;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v4, 0x1e

    .line 36
    .line 37
    if-lt v2, v4, :cond_1

    .line 38
    .line 39
    new-instance v2, LMk;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/16 v4, 0x1a

    .line 47
    .line 48
    if-lt v2, v4, :cond_2

    .line 49
    .line 50
    new-instance v2, LNk;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    new-instance v2, LMk;

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-direct {v2, v1, v3, v4}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-virtual {v2}, LMk;->J()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Lxh;->a()Lzh;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const/4 v2, 0x1

    .line 71
    iput-boolean v2, v1, Lzh;->d:Z

    .line 72
    .line 73
    iget-object v0, v0, Lxh;->b:Lbc;

    .line 74
    .line 75
    iget-object v0, v0, Lbc;->a:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    .line 78
    .line 79
    const-string v2, "statusBarVisibilityChanged"

    .line 80
    .line 81
    invoke-static {v0, v2, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->h(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lzh;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private styleFromConfig(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x2

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "darkcontent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v3

    goto :goto_1

    :sswitch_1
    const-string v0, "default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto :goto_1

    :sswitch_2
    const-string v0, "lightcontent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :sswitch_3
    const-string v0, "light"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v2

    goto :goto_1

    :sswitch_4
    const-string v0, "dark"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    if-eqz p1, :cond_2

    if-eq p1, v1, :cond_2

    if-eq p1, v3, :cond_1

    if-eq p1, v2, :cond_1

    const-string p1, "DEFAULT"

    return-object p1

    :cond_1
    const-string p1, "LIGHT"

    return-object p1

    :cond_2
    const-string p1, "DARK"

    return-object p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x2eef76 -> :sswitch_4
        0x6233516 -> :sswitch_3
        0x20d83aa3 -> :sswitch_2
        0x5c13d641 -> :sswitch_1
        0x63781443 -> :sswitch_0
    .end sparse-switch
.end method

.method private toJSObject(Lzh;)Lcom/getcapacitor/JSObject;
    .locals 3

    .line 1
    new-instance v0, Lcom/getcapacitor/JSObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p1, Lzh;->d:Z

    .line 7
    .line 8
    const-string v2, "visible"

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lzh;->e:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "style"

    .line 16
    .line 17
    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 18
    .line 19
    .line 20
    iget-object v1, p1, Lzh;->f:Ljava/lang/String;

    .line 21
    .line 22
    const-string v2, "color"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p1, Lzh;->c:Z

    .line 28
    .line 29
    const-string v2, "overlays"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 32
    .line 33
    .line 34
    iget p1, p1, Lzh;->g:I

    .line 35
    .line 36
    const-string v1, "height"

    .line 37
    .line 38
    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    .line 39
    .line 40
    .line 41
    return-object v0
.end method


# virtual methods
.method public getInfo(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    iget-object v0, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    invoke-virtual {v0}, Lxh;->a()Lzh;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->toJSObject(Lzh;)Lcom/getcapacitor/JSObject;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public handleOnConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->handleOnConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    .line 5
    .line 6
    iget-object v0, p1, Lxh;->d:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lxh;->c(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public hide(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    new-instance v1, LAh;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, LAh;-><init>(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->executeOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public load()V
    .locals 4

    invoke-direct {p0}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->getStatusBarConfig()Lyh;

    move-result-object v0

    new-instance v1, Lxh;

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v2

    new-instance v3, Lbc;

    invoke-direct {v3, p0}, Lbc;-><init>(Ljava/lang/Object;)V

    invoke-direct {v1, v2, v0, v3}, Lxh;-><init>(Lm1;Lyh;Lbc;)V

    iput-object v1, p0, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->implementation:Lxh;

    return-void
.end method

.method public setBackgroundColor(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "color"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "Color must be provided"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v1

    new-instance v2, LBh;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v0, p1, v3}, LBh;-><init>(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {v1, v2}, Lcom/getcapacitor/Bridge;->executeOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setOverlaysWebView(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "overlay"

    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v1

    new-instance v2, Lt3;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v0, p1, v3}, Lt3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v1, v2}, Lcom/getcapacitor/Bridge;->executeOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setStyle(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "style"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "Style must be provided"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v1

    new-instance v2, LBh;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, p1, v3}, LBh;-><init>(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {v1, v2}, Lcom/getcapacitor/Bridge;->executeOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public show(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object v0

    new-instance v1, LAh;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, LAh;-><init>(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->executeOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method
