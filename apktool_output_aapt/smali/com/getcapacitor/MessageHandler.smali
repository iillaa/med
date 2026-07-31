.class public Lcom/getcapacitor/MessageHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bridge:Lcom/getcapacitor/Bridge;

.field private cordovaPluginManager:Lqf;

.field private javaScriptReplyProxy:Lrc;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Lcom/getcapacitor/Bridge;Landroid/webkit/WebView;Lqf;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/getcapacitor/MessageHandler;->webView:Landroid/webkit/WebView;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/getcapacitor/MessageHandler;->cordovaPluginManager:Lqf;

    .line 9
    .line 10
    const-string p3, "WEB_MESSAGE_LISTENER"

    .line 11
    .line 12
    invoke-static {p3}, Llc;->x(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    const-string v0, "androidBridge"

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p3}, Lcom/getcapacitor/CapConfig;->isUsingLegacyBridge()Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-nez p3, :cond_0

    .line 29
    .line 30
    new-instance p3, Lbc;

    .line 31
    .line 32
    invoke-direct {p3, p0}, Lbc;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getAllowedOriginRules()Ljava/util/Set;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p2, p1, p3}, Lfk;->b(Landroid/webkit/WebView;Ljava/util/Set;Lbc;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    :cond_0
    invoke-virtual {p2, p0, v0}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/getcapacitor/MessageHandler;Landroid/webkit/WebView;Ldk;Landroid/net/Uri;ZLtc;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/getcapacitor/MessageHandler;->lambda$new$0(Landroid/webkit/WebView;Ldk;Landroid/net/Uri;ZLrc;)V

    return-void
.end method

.method public static synthetic b(Lcom/getcapacitor/MessageHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/getcapacitor/MessageHandler;->lambda$callCordovaPluginMethod$2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/MessageHandler;->lambda$legacySendResponseMessage$1(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method private callCordovaPluginMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    iget-object v0, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    new-instance v7, Lne;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p1

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lne;-><init>(Lcom/getcapacitor/MessageHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Lcom/getcapacitor/Bridge;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private callPluginMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 7

    new-instance v6, Lcom/getcapacitor/PluginCall;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/getcapacitor/PluginCall;-><init>(Lcom/getcapacitor/MessageHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    iget-object p1, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p1, p2, p3, v6}, Lcom/getcapacitor/Bridge;->callPluginMethod(Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method private synthetic lambda$callCordovaPluginMethod$2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/MessageHandler;->cordovaPluginManager:Lqf;

    invoke-virtual {v0, p1, p2, p3, p4}, Lqf;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static synthetic lambda$legacySendResponseMessage$1(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method private lambda$new$0(Landroid/webkit/WebView;Ldk;Landroid/net/Uri;ZLrc;)V
    .locals 0

    .line 1
    if-eqz p4, :cond_3

    .line 2
    .line 3
    iget p1, p2, Ldk;->b:I

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p2, Ldk;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/getcapacitor/MessageHandler;->postMessage(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p5, p0, Lcom/getcapacitor/MessageHandler;->javaScriptReplyProxy:Lrc;

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    new-instance p3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string p4, "Wrong data accessor type detected. "

    .line 20
    .line 21
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p4, "String"

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    const/4 p5, 0x1

    .line 29
    if-eq p1, p5, :cond_1

    .line 30
    .line 31
    const-string p1, "Unknown"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string p1, "ArrayBuffer"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object p1, p4

    .line 38
    :goto_0
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, " expected, but got "

    .line 42
    .line 43
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p2

    .line 57
    :cond_3
    const-string p1, "Plugin execution is allowed in Main Frame only"

    .line 58
    .line 59
    invoke-static {p1}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    return-void
.end method

.method private legacySendResponseMessage(Lcom/getcapacitor/PluginResult;)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "window.Capacitor.fromNative("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/getcapacitor/PluginResult;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/getcapacitor/MessageHandler;->webView:Landroid/webkit/WebView;

    new-instance v1, LQ2;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2, p1}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public postMessage(Ljava/lang/String;)V
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "To native (Capacitor plugin): callbackId: "

    const-string v1, "JavaScript Error: "

    const-string v2, "To native (Cordova plugin): callbackId: "

    :try_start_0
    new-instance v3, Lcom/getcapacitor/JSObject;

    invoke-direct {v3, p1}, Lcom/getcapacitor/JSObject;-><init>(Ljava/lang/String;)V

    const-string v4, "type"

    invoke-virtual {v3, v4}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_0

    move v7, v6

    goto :goto_0

    :cond_0
    move v7, v5

    :goto_0
    if-eqz v7, :cond_1

    const-string v8, "cordova"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v8, v6

    goto :goto_1

    :catch_0
    move-exception p1

    goto/16 :goto_2

    :cond_1
    move v8, v5

    :goto_1
    if-eqz v7, :cond_2

    const-string v7, "js.error"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v5, v6

    :cond_2
    const-string v4, "callbackId"

    invoke-virtual {v3, v4}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v6, "Plugin"

    if-eqz v8, :cond_3

    :try_start_1
    const-string p1, "service"

    invoke-virtual {v3, p1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "action"

    invoke-virtual {v3, v0}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "actionArgs"

    invoke-virtual {v3, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", service: "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", action: "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", actionArgs: "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/getcapacitor/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4, p1, v0, v1}, Lcom/getcapacitor/MessageHandler;->callCordovaPluginMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_3
    if-eqz v5, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    const-string p1, "pluginId"

    invoke-virtual {v3, p1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "methodName"

    invoke-virtual {v3, v1}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "options"

    new-instance v5, Lcom/getcapacitor/JSObject;

    invoke-direct {v5}, Lcom/getcapacitor/JSObject;-><init>()V

    invoke-virtual {v3, v2, v5}, Lcom/getcapacitor/JSObject;->getJSObject(Ljava/lang/String;Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/JSObject;

    move-result-object v2

    filled-new-array {v6}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", pluginId: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", methodName: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/getcapacitor/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v4, p1, v1, v2}, Lcom/getcapacitor/MessageHandler;->callPluginMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :goto_2
    const-string v0, "Post message error:"

    invoke-static {v0, p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_3
    return-void
.end method

.method public sendResponseMessage(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/PluginResult;Lcom/getcapacitor/PluginResult;)V
    .locals 4

    .line 1
    const-string v0, "Sending plugin error: "

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Lcom/getcapacitor/PluginResult;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/getcapacitor/PluginResult;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "save"

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->isKeptAlive()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {v1, v2, v3}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Z)Lcom/getcapacitor/PluginResult;

    .line 15
    .line 16
    .line 17
    const-string v2, "callbackId"

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getCallbackId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/PluginResult;

    .line 24
    .line 25
    .line 26
    const-string v2, "pluginId"

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getPluginId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v1, v2, v3}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/PluginResult;

    .line 33
    .line 34
    .line 35
    const-string v2, "methodName"

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v1, v2, v3}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/PluginResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    const-string v3, "success"

    .line 46
    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    :try_start_1
    invoke-virtual {v1, v3, p2}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Z)Lcom/getcapacitor/PluginResult;

    .line 51
    .line 52
    .line 53
    const-string p2, "error"

    .line 54
    .line 55
    invoke-virtual {v1, p2, p3}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Lcom/getcapacitor/PluginResult;)Lcom/getcapacitor/PluginResult;

    .line 56
    .line 57
    .line 58
    new-instance p2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/getcapacitor/PluginResult;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catch_0
    move-exception p2

    .line 79
    goto :goto_1

    .line 80
    :cond_0
    invoke-virtual {v1, v3, v2}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Z)Lcom/getcapacitor/PluginResult;

    .line 81
    .line 82
    .line 83
    if-eqz p2, :cond_1

    .line 84
    .line 85
    const-string p3, "data"

    .line 86
    .line 87
    invoke-virtual {v1, p3, p2}, Lcom/getcapacitor/PluginResult;->put(Ljava/lang/String;Lcom/getcapacitor/PluginResult;)Lcom/getcapacitor/PluginResult;

    .line 88
    .line 89
    .line 90
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getCallbackId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    const-string p3, "-1"

    .line 95
    .line 96
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    xor-int/2addr p2, v2

    .line 101
    if-eqz p2, :cond_5

    .line 102
    .line 103
    iget-object p2, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2}, Lcom/getcapacitor/CapConfig;->isUsingLegacyBridge()Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eqz p2, :cond_2

    .line 114
    .line 115
    invoke-direct {p0, v1}, Lcom/getcapacitor/MessageHandler;->legacySendResponseMessage(Lcom/getcapacitor/PluginResult;)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    const-string p2, "WEB_MESSAGE_LISTENER"

    .line 120
    .line 121
    invoke-static {p2}, Llc;->x(Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-eqz p2, :cond_4

    .line 126
    .line 127
    iget-object p2, p0, Lcom/getcapacitor/MessageHandler;->javaScriptReplyProxy:Lrc;

    .line 128
    .line 129
    if-eqz p2, :cond_4

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/getcapacitor/PluginResult;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    check-cast p2, Ltc;

    .line 136
    .line 137
    sget-object v0, Lik;->c:Lg1;

    .line 138
    .line 139
    invoke-virtual {v0}, Lh1;->b()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_3

    .line 144
    .line 145
    iget-object p2, p2, Ltc;->a:Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;

    .line 146
    .line 147
    invoke-interface {p2, p3}, Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;->postMessage(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_3
    new-instance p2, Ljava/lang/UnsupportedOperationException;

    .line 152
    .line 153
    const-string p3, "This method is not supported by the current version of the framework and the current WebView APK"

    .line 154
    .line 155
    invoke-direct {p2, p3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p2

    .line 159
    :cond_4
    invoke-direct {p0, v1}, Lcom/getcapacitor/MessageHandler;->legacySendResponseMessage(Lcom/getcapacitor/PluginResult;)V

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_5
    iget-object p2, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    .line 164
    .line 165
    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-virtual {p2, v1}, Lcom/getcapacitor/App;->fireRestoredResult(Lcom/getcapacitor/PluginResult;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :goto_1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v0, "sendResponseMessage: error: "

    .line 176
    .line 177
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-static {p2}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :goto_2
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->isKeptAlive()Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-nez p2, :cond_6

    .line 195
    .line 196
    iget-object p2, p0, Lcom/getcapacitor/MessageHandler;->bridge:Lcom/getcapacitor/Bridge;

    .line 197
    .line 198
    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->release(Lcom/getcapacitor/Bridge;)V

    .line 199
    .line 200
    .line 201
    :cond_6
    return-void
.end method
