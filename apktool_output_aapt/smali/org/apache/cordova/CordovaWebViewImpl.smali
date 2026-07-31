.class public Lorg/apache/cordova/CordovaWebViewImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LP5;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "CordovaWebViewImpl"


# instance fields
.field public a:Lqf;

.field public final b:LR5;

.field public c:LI5;

.field public d:I

.field public e:LO5;

.field public f:LM5;

.field public g:Lorg/apache/cordova/CoreAndroid;

.field public h:Lye;

.field public final i:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

.field public j:Z

.field public k:Ljava/lang/String;

.field public l:LU5;

.field public m:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field public final n:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(LR5;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    .line 6
    .line 7
    new-instance v0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;-><init>(Lorg/apache/cordova/CordovaWebViewImpl;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->i:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    .line 13
    .line 14
    new-instance v0, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    .line 20
    .line 21
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 22
    .line 23
    return-void
.end method

.method public static createEngine(Landroid/content/Context;LM5;)LR5;
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const-class v3, Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 5
    .line 6
    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    const-string v4, "webview"

    .line 11
    .line 12
    invoke-virtual {p1, v4, v3}, LM5;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-array v4, v2, [Ljava/lang/Class;

    .line 21
    .line 22
    const-class v5, Landroid/content/Context;

    .line 23
    .line 24
    aput-object v5, v4, v1

    .line 25
    .line 26
    const-class v5, LM5;

    .line 27
    .line 28
    aput-object v5, v4, v0

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    new-array v2, v2, [Ljava/lang/Object;

    .line 35
    .line 36
    aput-object p0, v2, v1

    .line 37
    .line 38
    aput-object p1, v2, v0

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, LR5;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    return-object p0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    new-instance p1, Ljava/lang/RuntimeException;

    .line 49
    .line 50
    const-string v0, "Failed to create webview. "

    .line 51
    .line 52
    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->g:Lorg/apache/cordova/CoreAndroid;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    const-string v1, "CoreAndroid"

    invoke-virtual {v0, v1}, Lqf;->d(Ljava/lang/String;)LK5;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CoreAndroid;

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->g:Lorg/apache/cordova/CoreAndroid;

    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->g:Lorg/apache/cordova/CoreAndroid;

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0, p1}, Lorg/apache/cordova/CoreAndroid;->fireJavascriptEvent(Ljava/lang/String;)V

    return-void
.end method

.method public backHistory()Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->goBack()Z

    move-result v0

    return v0
.end method

.method public canGoBack()Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->canGoBack()Z

    move-result v0

    return v0
.end method

.method public clearCache()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->clearCache()V

    return-void
.end method

.method public clearCache(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {p1}, LR5;->clearCache()V

    return-void
.end method

.method public clearHistory()V
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->clearHistory()V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getCookieManager()Lka;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 2
    .line 3
    invoke-interface {v0}, LR5;->getCookieManager()Lka;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public getEngine()LR5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getPluginManager()Lqf;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 2
    .line 3
    return-object v0
.end method

.method public getPreferences()LM5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->f:LM5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getResourceApi()LO5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->e:LO5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public handleDestroy()V
    .locals 1

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v0}, Lqf;->f()V

    const-string v0, "about:blank"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebViewImpl;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->destroy()V

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->hideCustomView()V

    return-void
.end method

.method public handlePause(Z)V
    .locals 2

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->j:Z

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v1, p1}, Lqf;->h(Z)V

    const-string v1, "pause"

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebViewImpl;->a(Ljava/lang/String;)V

    if-nez p1, :cond_1

    iget-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {p1, v0}, LR5;->setPaused(Z)V

    :cond_1
    return-void
.end method

.method public handleResume(Z)V
    .locals 2

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, LR5;->setPaused(Z)V

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v0, p1}, Lqf;->i(Z)V

    iget-boolean p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->j:Z

    if-eqz p1, :cond_1

    const-string p1, "resume"

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebViewImpl;->a(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public handleStart()V
    .locals 1

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v0}, Lqf;->j()V

    return-void
.end method

.method public handleStop()V
    .locals 1

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v0}, Lqf;->k()V

    return-void
.end method

.method public hideCustomView()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->m:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v1}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public init(LI5;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, LM5;

    invoke-direct {v1}, LM5;-><init>()V

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/cordova/CordovaWebViewImpl;->init(LI5;Ljava/util/List;LM5;)V

    return-void
.end method

.method public init(LI5;Ljava/util/List;LM5;)V
    .locals 9
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

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    if-nez v0, :cond_1

    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    iput-object p3, p0, Lorg/apache/cordova/CordovaWebViewImpl;->f:LM5;

    new-instance v0, Lqf;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    invoke-direct {v0, p0, v1, p2}, Lqf;-><init>(LP5;LI5;Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    new-instance p2, LO5;

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-direct {p2, v1, v2}, LO5;-><init>(Landroid/content/Context;Lqf;)V

    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->e:LO5;

    new-instance p2, Lye;

    invoke-direct {p2}, Lye;-><init>()V

    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->h:Lye;

    new-instance v1, Lorg/apache/cordova/NativeToJsMessageQueue$NoOpBridgeMode;

    invoke-direct {v1}, Lorg/apache/cordova/NativeToJsMessageQueue$NoOpBridgeMode;-><init>()V

    .line 2
    iget-object p2, p2, Lye;->c:Ljava/util/ArrayList;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->h:Lye;

    new-instance v1, Lorg/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode;

    invoke-direct {v1, v0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode;-><init>(LR5;LI5;)V

    .line 4
    iget-object p2, p2, Lye;->c:Ljava/util/ArrayList;

    .line 5
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    const-string p2, "DisallowOverscroll"

    const/4 v1, 0x0

    invoke-virtual {p3, p2, v1}, LM5;->a(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {v0}, LR5;->getView()Landroid/view/View;

    move-result-object p2

    const/4 p3, 0x2

    invoke-virtual {p2, p3}, Landroid/view/View;->setOverScrollMode(I)V

    :cond_0
    iget-object v6, p0, Lorg/apache/cordova/CordovaWebViewImpl;->e:LO5;

    iget-object v7, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    iget-object v8, p0, Lorg/apache/cordova/CordovaWebViewImpl;->h:Lye;

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    iget-object v5, p0, Lorg/apache/cordova/CordovaWebViewImpl;->i:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    move-object v3, p0

    move-object v4, p1

    invoke-interface/range {v2 .. v8}, LR5;->init(LP5;LI5;LQ5;LO5;Lqf;Lye;)V

    iget-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    new-instance p2, Lof;

    const-string p3, "org.apache.cordova.CoreAndroid"

    const-string v0, "CoreAndroid"

    invoke-direct {p2, v0, p3, v1}, Lof;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 8
    iget-object p1, p1, Lqf;->b:Ljava/util/Map;

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    iget-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {p1}, Lqf;->e()V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public isButtonPlumbedToJs(I)Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public isCustomViewShowing()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isInitialized()Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

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

    invoke-virtual {p0, p1, v0}, Lorg/apache/cordova/CordovaWebViewImpl;->loadUrlIntoView(Ljava/lang/String;Z)V

    return-void
.end method

.method public loadUrlIntoView(Ljava/lang/String;Z)V
    .locals 8

    .line 1
    const-string v0, "about:blank"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_7

    .line 9
    .line 10
    const-string v0, "javascript:"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_5

    .line 19
    .line 20
    :cond_0
    if-nez p2, :cond_2

    .line 21
    .line 22
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->k:Ljava/lang/String;

    .line 23
    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    move v7, v1

    .line 28
    goto :goto_2

    .line 29
    :cond_2
    :goto_1
    const/4 v1, 0x1

    .line 30
    goto :goto_0

    .line 31
    :goto_2
    if-eqz v7, :cond_4

    .line 32
    .line 33
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->k:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const/4 p2, 0x0

    .line 38
    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->g:Lorg/apache/cordova/CoreAndroid;

    .line 39
    .line 40
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 41
    .line 42
    invoke-virtual {p2}, Lqf;->e()V

    .line 43
    .line 44
    .line 45
    :cond_3
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl;->k:Ljava/lang/String;

    .line 46
    .line 47
    :cond_4
    iget p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    .line 48
    .line 49
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->f:LM5;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 55
    .line 56
    const-string v2, "LoadUrlTimeoutValue"

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v0, v0, LM5;->a:Ljava/util/HashMap;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    long-to-int v0, v0

    .line 81
    :goto_3
    move v4, v0

    .line 82
    goto :goto_4

    .line 83
    :cond_5
    const/16 v0, 0x4e20

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :goto_4
    new-instance v0, Lg0;

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-direct {v0, p0, v1, p1}, Lg0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    new-instance v5, LS5;

    .line 93
    .line 94
    invoke-direct {v5, p0, v4, p2, v0}, LS5;-><init>(Lorg/apache/cordova/CordovaWebViewImpl;IILg0;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 98
    .line 99
    invoke-interface {p2}, LI5;->getActivity()Lm1;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    if-eqz p2, :cond_6

    .line 104
    .line 105
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 106
    .line 107
    invoke-interface {p2}, LI5;->getActivity()Lm1;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    new-instance v0, LT5;

    .line 112
    .line 113
    move-object v2, v0

    .line 114
    move-object v3, p0

    .line 115
    move-object v6, p1

    .line 116
    invoke-direct/range {v2 .. v7}, LT5;-><init>(Lorg/apache/cordova/CordovaWebViewImpl;ILS5;Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 120
    .line 121
    .line 122
    :cond_6
    return-void

    .line 123
    :cond_7
    :goto_5
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 124
    .line 125
    invoke-interface {p2, p1, v1}, LR5;->loadUrl(Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lqf;->g(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    invoke-virtual {v0, p1, p2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->h:Lye;

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
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->h:Lye;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lye;->a(Lrf;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setButtonPlumbedToJs(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/16 v0, 0x52

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/16 v0, 0x18

    .line 9
    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x19

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    const-string v0, "Unsupported keycode: "

    .line 20
    .line 21
    invoke-static {v0, p1}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p2

    .line 29
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :goto_1
    return-void
.end method

.method public showCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    if-eqz v0, :cond_0

    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    return-void

    :cond_0
    new-instance v0, LU5;

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    invoke-direct {v0, v1, v2}, LU5;-><init>(Landroid/content/Context;LR5;)V

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->m:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v2}, LR5;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    const/4 v3, -0x1

    invoke-direct {p2, v3, v3, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-interface {v2}, LR5;->getView()Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    return-void
.end method

.method public showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V
    .locals 7
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

    .line 1
    const-string v0, "CordovaWebViewImpl"

    .line 2
    .line 3
    const-string v1, "intent://"

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 8
    .line 9
    invoke-interface {v2}, LR5;->clearHistory()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v2, 0x1

    .line 13
    if-nez p2, :cond_2

    .line 14
    .line 15
    iget-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Lqf;->m(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1, v2}, Lorg/apache/cordova/CordovaWebViewImpl;->loadUrlIntoView(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :cond_2
    iget-object v3, p0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 28
    .line 29
    invoke-virtual {v3, p1}, Lqf;->o(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_3

    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    const/4 v3, 0x0

    .line 41
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_4

    .line 46
    .line 47
    invoke-static {p1, v2}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    :goto_0
    move-object v3, v2

    .line 52
    goto :goto_1

    .line 53
    :catch_0
    move-exception v2

    .line 54
    goto :goto_2

    .line 55
    :catch_1
    move-exception p2

    .line 56
    goto :goto_3

    .line 57
    :cond_4
    new-instance v2, Landroid/content/Intent;

    .line 58
    .line 59
    const-string v4, "android.intent.action.VIEW"

    .line 60
    .line 61
    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :try_start_1
    const-string v3, "android.intent.category.BROWSABLE"

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const-string v4, "file"

    .line 74
    .line 75
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_5

    .line 84
    .line 85
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebViewImpl;->e:LO5;

    .line 86
    .line 87
    invoke-virtual {v4, v3}, LO5;->a(Landroid/net/Uri;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_2
    move-exception v3

    .line 96
    move-object v6, v3

    .line 97
    move-object v3, v2

    .line 98
    move-object v2, v6

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :goto_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 105
    .line 106
    invoke-interface {v2}, LI5;->getActivity()Lm1;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    if-eqz v2, :cond_7

    .line 111
    .line 112
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 113
    .line 114
    invoke-interface {v2}, LI5;->getActivity()Lm1;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_4

    .line 122
    :goto_2
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_6

    .line 127
    .line 128
    if-eqz v3, :cond_6

    .line 129
    .line 130
    const-string v1, "browser_fallback_url"

    .line 131
    .line 132
    invoke-virtual {v3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    if-eqz v4, :cond_6

    .line 137
    .line 138
    invoke-virtual {v3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/cordova/CordovaWebViewImpl;->showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V

    .line 143
    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_6
    const-string p2, "Error loading url "

    .line 147
    .line 148
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-static {v0, p1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :goto_3
    new-instance p3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    const-string p4, "Error parsing url "

    .line 159
    .line 160
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 171
    .line 172
    .line 173
    :cond_7
    :goto_4
    return-void
.end method

.method public stopLoading()V
    .locals 1

    iget v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    return-void
.end method
