.class public Lorg/apache/cordova/engine/SystemWebViewEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LR5;


# static fields
.field public static final TAG:Ljava/lang/String; = "SystemWebViewEngine"


# instance fields
.field public final a:Lorg/apache/cordova/engine/SystemWebView;

.field public final b:Lt5;

.field public c:LM5;

.field public d:LC5;

.field public e:LQ5;

.field public f:LP5;

.field public g:LI5;

.field public h:Lqf;

.field public i:LO5;

.field public j:LI1;


# direct methods
.method public constructor <init>(Landroid/content/Context;LM5;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/cordova/engine/SystemWebView;

    invoke-direct {v0, p1}, Lorg/apache/cordova/engine/SystemWebView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/cordova/engine/SystemWebViewEngine;-><init>(Lorg/apache/cordova/engine/SystemWebView;LM5;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebView;)V
    .locals 1

    .line 2
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;-><init>(Lorg/apache/cordova/engine/SystemWebView;LM5;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebView;LM5;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    new-instance p2, Lt5;

    invoke-direct {p2, p1}, Lt5;-><init>(Landroid/webkit/WebView;)V

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->b:Lt5;

    return-void
.end method


# virtual methods
.method public canGoBack()Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    return v0
.end method

.method public clearCache()V
    .locals 2

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->clearCache(Z)V

    return-void
.end method

.method public clearHistory()V
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->clearHistory()V

    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 2
    .line 3
    iget-object v1, v0, Lorg/apache/cordova/engine/SystemWebView;->d:LYh;

    .line 4
    .line 5
    iget-object v1, v1, LYh;->d:LY1;

    .line 6
    .line 7
    iget-object v1, v1, LY1;->e:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Landroid/app/AlertDialog;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/app/Dialog;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->j:LI1;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    :try_start_0
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->j:LI1;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "Error unregistering configuration receiver: "

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "SystemWebViewEngine"

    .line 53
    .line 54
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method public getCookieManager()Lka;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->b:Lt5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getCordovaWebView()LP5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->f:LP5;

    .line 2
    .line 3
    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    return-object v0
.end method

.method public goBack()Z
    .locals 2

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public init(LP5;LI5;LQ5;LO5;Lqf;Lye;)V
    .locals 3

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    if-nez v0, :cond_0

    invoke-interface {p1}, LP5;->getPreferences()LM5;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->f:LP5;

    iput-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    iput-object p3, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    iput-object p4, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->i:LO5;

    iput-object p5, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 1
    iput-object p0, p1, Lorg/apache/cordova/engine/SystemWebView;->e:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    iget-object p3, p1, Lorg/apache/cordova/engine/SystemWebView;->c:Lai;

    if-nez p3, :cond_1

    new-instance p3, Lai;

    invoke-direct {p3, p0}, Lai;-><init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V

    invoke-virtual {p1, p3}, Lorg/apache/cordova/engine/SystemWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    :cond_1
    iget-object p3, p1, Lorg/apache/cordova/engine/SystemWebView;->d:LYh;

    if-nez p3, :cond_2

    new-instance p3, LYh;

    invoke-direct {p3, p0}, LYh;-><init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V

    invoke-virtual {p1, p3}, Lorg/apache/cordova/engine/SystemWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 3
    :cond_2
    iget-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->setInitialScale(I)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p4

    const/4 v0, 0x1

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    sget-object v1, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    invoke-virtual {p4, v1}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {p4, p3}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    iget-object v1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    const-string v2, "AndroidInsecureFileModeEnabled"

    invoke-virtual {v1, v2, p3}, LM5;->a(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    :cond_3
    invoke-virtual {p4, p3}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "database"

    invoke-virtual {v1, v2, p3}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object p3

    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_4

    .line 4
    :try_start_0
    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 5
    :cond_4
    :goto_0
    invoke-virtual {p4, p3}, Landroid/webkit/WebSettings;->setGeolocationDatabasePath(Ljava/lang/String;)V

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    invoke-virtual {p4}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object p3

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    const-string v1, "OverrideUserAgent"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, LM5;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p4, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    const-string v1, "AppendUserAgent"

    invoke-virtual {v0, v1, v2}, LM5;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p3}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    :cond_6
    :goto_1
    new-instance p3, Landroid/content/IntentFilter;

    invoke-direct {p3}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {p3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->j:LI1;

    if-nez v0, :cond_7

    new-instance v0, LI1;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p4}, LI1;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->j:LI1;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p4, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->j:LI1;

    invoke-virtual {p1, p4, p3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 6
    :cond_7
    new-instance p1, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    new-instance p3, Li0;

    const/16 p4, 0x16

    invoke-direct {p3, p4, p0}, Li0;-><init>(ILjava/lang/Object;)V

    invoke-direct {p1, p3}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;-><init>(Lxe;)V

    .line 7
    iget-object p3, p6, Lye;->c:Ljava/util/ArrayList;

    .line 8
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    new-instance p1, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;

    invoke-direct {p1, p0, p2}, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;-><init>(LR5;LI5;)V

    .line 10
    iget-object p2, p6, Lye;->c:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    new-instance p1, LC5;

    .line 12
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 p2, -0x1

    iput p2, p1, LC5;->c:I

    iput-object p5, p1, LC5;->a:Lqf;

    iput-object p6, p1, LC5;->b:Lye;

    .line 13
    iput-object p1, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->d:LC5;

    iget-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 14
    new-instance p3, LUh;

    invoke-direct {p3, p1}, LUh;-><init>(LC5;)V

    const-string p1, "_cordovaNative"

    invoke-virtual {p2, p3, p1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void

    .line 15
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public loadUrl(Ljava/lang/String;Z)V
    .locals 0

    iget-object p2, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {p2, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public setPaused(Z)V
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    invoke-virtual {v0}, Landroid/webkit/WebView;->pauseTimers()V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    invoke-virtual {v0}, Landroid/webkit/WebView;->resumeTimers()V

    :goto_0
    return-void
.end method

.method public stopLoading()V
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    return-void
.end method
