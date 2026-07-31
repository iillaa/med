.class public Lorg/apache/cordova/engine/SystemWebView;
.super Landroid/webkit/WebView;
.source "SourceFile"


# instance fields
.field public c:Lai;

.field public d:LYh;

.field public e:Lorg/apache/cordova/engine/SystemWebViewEngine;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/engine/SystemWebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebView;->e:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    invoke-interface {v0, p1}, LQ5;->onDispatchKeyEvent(Landroid/view/KeyEvent;)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public getCordovaWebView()LP5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/engine/SystemWebView;->e:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getCordovaWebView()LP5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    return-object v0
.end method

.method public setWebChromeClient(Landroid/webkit/WebChromeClient;)V
    .locals 1

    move-object v0, p1

    check-cast v0, LYh;

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebView;->d:LYh;

    invoke-super {p0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-void
.end method

.method public setWebViewClient(Landroid/webkit/WebViewClient;)V
    .locals 1

    move-object v0, p1

    check-cast v0, Lai;

    iput-object v0, p0, Lorg/apache/cordova/engine/SystemWebView;->c:Lai;

    invoke-super {p0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-void
.end method
