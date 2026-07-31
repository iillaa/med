.class public Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LP5;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private cookieManager:Lcom/getcapacitor/cordova/CapacitorCordovaCookieManager;

.field private cordova:LI5;

.field private hasPausedEver:Z

.field private nativeToJsMessageQueue:Lye;

.field private pluginManager:Lqf;

.field private preferences:LM5;

.field private resourceApi:LO5;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->context:Landroid/content/Context;

    return-void
.end method

.method public static synthetic a(Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->lambda$eval$0(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->lambda$triggerDocumentEvent$1(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic lambda$eval$0(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private static synthetic lambda$triggerDocumentEvent$1(Ljava/lang/String;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public backHistory()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public canGoBack()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public clearCache()V
    .locals 0

    .line 1
    return-void
.end method

.method public clearCache(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    return-void
.end method

.method public clearHistory()V
    .locals 0

    return-void
.end method

.method public eval(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lt3;

    const/4 v2, 0x2

    invoke-direct {v1, p0, p1, p2, v2}, Lt3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getCookieManager()Lka;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cookieManager:Lcom/getcapacitor/cordova/CapacitorCordovaCookieManager;

    .line 2
    .line 3
    return-object v0
.end method

.method public getEngine()LR5;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public getPluginManager()Lqf;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    .line 2
    .line 3
    return-object v0
.end method

.method public getPreferences()LM5;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->preferences:LM5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getResourceApi()LO5;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->resourceApi:LO5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method public handleDestroy()V
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v0}, Lqf;->f()V

    return-void
.end method

.method public handlePause(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->hasPausedEver:Z

    iget-object v1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v1, p1}, Lqf;->h(Z)V

    const-string v1, "pause"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->triggerDocumentEvent(Ljava/lang/String;)V

    if-nez p1, :cond_1

    invoke-virtual {p0, v0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->setPaused(Z)V

    :cond_1
    return-void
.end method

.method public handleResume(Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->setPaused(Z)V

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v0, p1}, Lqf;->i(Z)V

    iget-boolean p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->hasPausedEver:Z

    if-eqz p1, :cond_1

    const-string p1, "resume"

    invoke-virtual {p0, p1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->triggerDocumentEvent(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public handleStart()V
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v0}, Lqf;->j()V

    return-void
.end method

.method public handleStop()V
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v0}, Lqf;->k()V

    return-void
.end method

.method public hideCustomView()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public init(LI5;Ljava/util/List;LM5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI5;",
            "Ljava/util/List<",
            "Lof;",
            ">;",
            "LM5;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    iput-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->preferences:LM5;

    new-instance p1, Lqf;

    iget-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    invoke-direct {p1, p0, p3, p2}, Lqf;-><init>(LP5;LI5;Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    new-instance p2, LO5;

    iget-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->context:Landroid/content/Context;

    invoke-direct {p2, p3, p1}, LO5;-><init>(Landroid/content/Context;Lqf;)V

    iput-object p2, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->resourceApi:LO5;

    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {p1}, Lqf;->e()V

    return-void
.end method

.method public init(LI5;Ljava/util/List;LM5;Landroid/webkit/WebView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI5;",
            "Ljava/util/List<",
            "Lof;",
            ">;",
            "LM5;",
            "Landroid/webkit/WebView;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    iput-object p4, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    iput-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->preferences:LM5;

    new-instance p1, Lqf;

    iget-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    invoke-direct {p1, p0, p3, p2}, Lqf;-><init>(LP5;LI5;Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    new-instance p2, LO5;

    iget-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->context:Landroid/content/Context;

    invoke-direct {p2, p3, p1}, LO5;-><init>(Landroid/content/Context;Lqf;)V

    iput-object p2, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->resourceApi:LO5;

    new-instance p1, Lye;

    invoke-direct {p1}, Lye;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->nativeToJsMessageQueue:Lye;

    new-instance p2, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;

    iget-object p3, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    invoke-direct {p2, p4, p3}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;-><init>(Landroid/webkit/WebView;LI5;)V

    .line 2
    iget-object p1, p1, Lye;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->nativeToJsMessageQueue:Lye;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lye;->f(I)V

    new-instance p1, Lcom/getcapacitor/cordova/CapacitorCordovaCookieManager;

    invoke-direct {p1, p4}, Lcom/getcapacitor/cordova/CapacitorCordovaCookieManager;-><init>(Landroid/webkit/WebView;)V

    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cookieManager:Lcom/getcapacitor/cordova/CapacitorCordovaCookieManager;

    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {p1}, Lqf;->e()V

    return-void
.end method

.method public isButtonPlumbedToJs(I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public isCustomViewShowing()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->cordova:LI5;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->loadUrlIntoView(Ljava/lang/String;Z)V

    return-void
.end method

.method public loadUrlIntoView(Ljava/lang/String;Z)V
    .locals 0

    const-string p2, "about:blank"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "javascript:"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {p2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lqf;->g(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->pluginManager:Lqf;

    invoke-virtual {v0, p1, p2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->nativeToJsMessageQueue:Lye;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v1, Lwe;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Lwe;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lye;->b(Lwe;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public sendPluginResult(Lrf;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->nativeToJsMessageQueue:Lye;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lye;->a(Lrf;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setButtonPlumbedToJs(IZ)V
    .locals 0

    return-void
.end method

.method public setPaused(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->onPause()V

    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->pauseTimers()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->onResume()V

    iget-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->resumeTimers()V

    :goto_0
    return-void
.end method

.method public showCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public stopLoading()V
    .locals 0

    return-void
.end method

.method public triggerDocumentEvent(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "window.Capacitor.triggerEvent(\'"

    .line 2
    .line 3
    const-string v1, "\', \'document\');"

    .line 4
    .line 5
    invoke-static {v0, p1, v1}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Lu3;

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-direct {v0, v1}, Lu3;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->eval(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
