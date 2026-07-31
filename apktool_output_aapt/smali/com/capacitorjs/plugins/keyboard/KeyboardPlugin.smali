.class public Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "Keyboard"
.end annotation


# instance fields
.field private implementation:LIc;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    return-void
.end method

.method public static synthetic c(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->lambda$show$1(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic d(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->lambda$hide$3(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public static synthetic e(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->lambda$load$0()V

    return-void
.end method

.method public static synthetic f(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->lambda$show$2(Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method private lambda$hide$3(Lcom/getcapacitor/PluginCall;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->implementation:LIc;

    .line 2
    .line 3
    iget-object v0, v0, LIc;->b:Lm1;

    .line 4
    .line 5
    const-string v1, "input_method"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const-string v0, "Can\'t close keyboard, not currently focused"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {v1, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 34
    .line 35
    .line 36
    :goto_0
    return-void
.end method

.method private lambda$load$0()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "resizeOnFullScreen"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/PluginConfig;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    new-instance v1, LIc;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v4, v1, LIc;->b:Lm1;

    .line 26
    .line 27
    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const v6, 0x1020002

    .line 36
    .line 37
    .line 38
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    check-cast v5, Landroid/widget/FrameLayout;

    .line 43
    .line 44
    invoke-virtual {v5}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    iput-object v6, v1, LIc;->c:Landroid/view/View;

    .line 49
    .line 50
    new-instance v7, LHc;

    .line 51
    .line 52
    invoke-direct {v7, v1, v4, v0}, LHc;-><init>(LIc;Lm1;Z)V

    .line 53
    .line 54
    .line 55
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 56
    .line 57
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 58
    .line 59
    const/16 v4, 0x1e

    .line 60
    .line 61
    if-lt v0, v4, :cond_0

    .line 62
    .line 63
    new-instance v0, Lvk;

    .line 64
    .line 65
    invoke-direct {v0, v7}, Lvk;-><init>(LHc;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v6, v0}, LB;->o(Landroid/view/View;Lvk;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    sget-object v0, Luk;->d:Landroid/view/animation/PathInterpolator;

    .line 73
    .line 74
    const v0, 0x7f0800a2

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v4, Ltk;

    .line 82
    .line 83
    invoke-direct {v4, v6, v7}, Ltk;-><init>(Landroid/view/View;LHc;)V

    .line 84
    .line 85
    .line 86
    const v7, 0x7f0800aa

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6, v7, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    if-nez v0, :cond_1

    .line 93
    .line 94
    invoke-virtual {v6, v4}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    :goto_0
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, v1, LIc;->f:Landroid/view/View;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 108
    .line 109
    iput-object v0, v1, LIc;->e:Landroid/widget/FrameLayout$LayoutParams;

    .line 110
    .line 111
    iput-object v3, v1, LIc;->a:Lcom/getcapacitor/Bridge;

    .line 112
    .line 113
    iput-object v1, p0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->implementation:LIc;

    .line 114
    .line 115
    new-instance v0, Lbc;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Lbc;-><init>(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iput-object v0, v1, LIc;->g:Lbc;

    .line 121
    .line 122
    return-void
.end method

.method private lambda$show$1(Lcom/getcapacitor/PluginCall;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->implementation:LIc;

    .line 2
    .line 3
    iget-object v0, v0, LIc;->b:Lm1;

    .line 4
    .line 5
    const-string v1, "input_method"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v1, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic lambda$show$2(Lcom/getcapacitor/PluginCall;)V
    .locals 4

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, LJc;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, v2}, LJc;-><init>(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;I)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method public getResizeMode(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->unimplemented()V

    return-void
.end method

.method public handleOnDestroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->implementation:LIc;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, LIc;->g:Lbc;

    .line 5
    .line 6
    return-void
.end method

.method public hide(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    new-instance v0, LJc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, LJc;-><init>(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Plugin;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public load()V
    .locals 2

    new-instance v0, Lq0;

    const/4 v1, 0x4

    invoke-direct {v0, v1, p0}, Lq0;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Plugin;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onKeyboardEvent(Ljava/lang/String;I)V
    .locals 3

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "keyboardWillShow"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    goto :goto_0

    :sswitch_1
    const-string v2, "keyboardWillHide"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    :sswitch_2
    const-string v2, "keyboardDidShow"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0

    :sswitch_3
    const-string v2, "keyboardDidHide"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "{ \'keyboardHeight\': "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " }"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v2, p1, v1}, Lcom/getcapacitor/Bridge;->triggerWindowJSEvent(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "keyboardHeight"

    invoke-virtual {v0, v1, p2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;I)Lcom/getcapacitor/JSObject;

    :goto_1
    invoke-virtual {p0, p1, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    goto :goto_2

    :pswitch_1
    iget-object p2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2, p1}, Lcom/getcapacitor/Bridge;->triggerWindowJSEvent(Ljava/lang/String;)V

    goto :goto_1

    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x27763f86 -> :sswitch_3
        -0x277141cb -> :sswitch_2
        -0x20836c5 -> :sswitch_1
        -0x203390a -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setAccessoryBarVisible(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->unimplemented()V

    return-void
.end method

.method public setResizeMode(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->unimplemented()V

    return-void
.end method

.method public setScroll(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->unimplemented()V

    return-void
.end method

.method public setStyle(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->unimplemented()V

    return-void
.end method

.method public show(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    new-instance v0, LJc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, LJc;-><init>(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;I)V

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Plugin;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
