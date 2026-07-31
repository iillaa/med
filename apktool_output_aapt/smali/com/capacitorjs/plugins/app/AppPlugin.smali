.class public Lcom/capacitorjs/plugins/app/AppPlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "App"
.end annotation


# static fields
.field private static final EVENT_BACK_BUTTON:Ljava/lang/String; = "backButton"

.field private static final EVENT_PAUSE:Ljava/lang/String; = "pause"

.field private static final EVENT_RESTORED_RESULT:Ljava/lang/String; = "appRestoredResult"

.field private static final EVENT_RESUME:Ljava/lang/String; = "resume"

.field private static final EVENT_STATE_CHANGE:Ljava/lang/String; = "appStateChange"

.field private static final EVENT_URL_OPEN:Ljava/lang/String; = "appUrlOpen"


# instance fields
.field private hasPausedEver:Z

.field private onBackPressedCallback:LNe;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->hasPausedEver:Z

    return-void
.end method

.method public static synthetic access$000(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/String;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/getcapacitor/Plugin;->hasListeners(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$100(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object p0
.end method

.method public static synthetic access$200(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object p0
.end method

.method public static synthetic access$300(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object p0
.end method

.method public static synthetic access$400(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    return-void
.end method

.method public static synthetic access$500(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;
    .locals 0

    iget-object p0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object p0
.end method

.method public static synthetic c(Lcom/capacitorjs/plugins/app/AppPlugin;Lcom/getcapacitor/PluginResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/app/AppPlugin;->lambda$load$1(Lcom/getcapacitor/PluginResult;)V

    return-void
.end method

.method public static synthetic d(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/app/AppPlugin;->lambda$load$0(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic lambda$load$0(Ljava/lang/Boolean;)V
    .locals 3

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Firing change: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "isActive"

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    const-string p1, "appStateChange"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    return-void
.end method

.method private synthetic lambda$load$1(Lcom/getcapacitor/PluginResult;)V
    .locals 2

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Firing restored result"

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/getcapacitor/PluginResult;->getWrappedResult()Lcom/getcapacitor/JSObject;

    move-result-object p1

    const/4 v0, 0x1

    const-string v1, "appRestoredResult"

    invoke-virtual {p0, v1, p1, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    return-void
.end method

.method private unsetAppListeners()V
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/getcapacitor/App;->setStatusChangeListener(Lcom/getcapacitor/App$AppStatusChangeListener;)V

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/getcapacitor/App;->setAppRestoredListener(Lcom/getcapacitor/App$AppRestoredListener;)V

    return-void
.end method


# virtual methods
.method public exitApp(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-direct {p0}, Lcom/capacitorjs/plugins/app/AppPlugin;->unsetAppListeners()V

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getBridge()Lcom/getcapacitor/Bridge;

    move-result-object p1

    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public getInfo(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    new-instance v0, Lcom/getcapacitor/JSObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v1, v2}, Lcom/getcapacitor/util/InternalUtils;->getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget v3, v2, Landroid/content/pm/ApplicationInfo;->labelRes:I

    .line 35
    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    :goto_0
    const-string v3, "name"

    .line 54
    .line 55
    invoke-virtual {v0, v3, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 56
    .line 57
    .line 58
    const-string v2, "id"

    .line 59
    .line 60
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v2, v3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 63
    .line 64
    .line 65
    const-string v2, "build"

    .line 66
    .line 67
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .line 69
    const/16 v4, 0x1c

    .line 70
    .line 71
    if-lt v3, v4, :cond_1

    .line 72
    .line 73
    invoke-static {v1}, LS6;->b(Landroid/content/pm/PackageInfo;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 79
    .line 80
    int-to-long v3, v3

    .line 81
    :goto_1
    long-to-int v3, v3

    .line 82
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0, v2, v3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 87
    .line 88
    .line 89
    const-string v2, "version"

    .line 90
    .line 91
    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :catch_0
    const-string v0, "Unable to get App Info"

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :goto_2
    return-void
.end method

.method public getLaunchUrl(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getIntentUri()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v2, "url"

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    :goto_0
    return-void
.end method

.method public getState(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getcapacitor/App;->isActive()Z

    move-result v1

    const-string v2, "isActive"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public handleOnDestroy()V
    .locals 0

    invoke-direct {p0}, Lcom/capacitorjs/plugins/app/AppPlugin;->unsetAppListeners()V

    return-void
.end method

.method public handleOnNewIntent(Landroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->handleOnNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "url"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    const-string p1, "appUrlOpen"

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public handleOnPause()V
    .locals 2

    invoke-super {p0}, Lcom/getcapacitor/Plugin;->handleOnPause()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->hasPausedEver:Z

    const-string v0, "pause"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public handleOnResume()V
    .locals 2

    invoke-super {p0}, Lcom/getcapacitor/Plugin;->handleOnResume()V

    iget-boolean v0, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->hasPausedEver:Z

    if-eqz v0, :cond_0

    const-string v0, "resume"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    :cond_0
    return-void
.end method

.method public load()V
    .locals 3

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    move-result-object v0

    const-string v1, "disableBackButtonHandler"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/PluginConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v1

    new-instance v2, LU2;

    invoke-direct {v2, p0}, LU2;-><init>(Lcom/capacitorjs/plugins/app/AppPlugin;)V

    invoke-virtual {v1, v2}, Lcom/getcapacitor/App;->setStatusChangeListener(Lcom/getcapacitor/App$AppStatusChangeListener;)V

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v1

    new-instance v2, LU2;

    invoke-direct {v2, p0}, LU2;-><init>(Lcom/capacitorjs/plugins/app/AppPlugin;)V

    invoke-virtual {v1, v2}, Lcom/getcapacitor/App;->setAppRestoredListener(Lcom/getcapacitor/App$AppRestoredListener;)V

    new-instance v1, LV2;

    xor-int/lit8 v0, v0, 0x1

    invoke-direct {v1, p0, v0}, LV2;-><init>(Lcom/capacitorjs/plugins/app/AppPlugin;Z)V

    iput-object v1, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->onBackPressedCallback:LNe;

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v0

    invoke-virtual {v0}, LX4;->getOnBackPressedDispatcher()Landroidx/activity/a;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v1

    iget-object v2, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->onBackPressedCallback:LNe;

    invoke-virtual {v0, v1, v2}, Landroidx/activity/a;->a(LYc;LNe;)V

    return-void
.end method

.method public minimizeApp(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public toggleBackButtonHandler(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->onBackPressedCallback:LNe;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "onBackPressedCallback is not set"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string v0, "enabled"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/capacitorjs/plugins/app/AppPlugin;->onBackPressedCallback:LNe;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, v1, LNe;->a:Z

    .line 24
    .line 25
    iget-object v0, v1, LNe;->c:Ly9;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ly9;->a()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
