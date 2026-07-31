.class public Lcom/getcapacitor/BridgeWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field private bridge:Lcom/getcapacitor/Bridge;


# direct methods
.method public constructor <init>(Lcom/getcapacitor/Bridge;)V
    .locals 0

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/webkit/WebView;->getProgress()I

    move-result p2

    const/16 v0, 0x64

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/WebViewListener;->onPageLoaded(Landroid/webkit/WebView;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->reset()V

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {p3, p1}, Lcom/getcapacitor/WebViewListener;->onPageStarted(Landroid/webkit/WebView;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V

    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/WebViewListener;->onReceivedError(Landroid/webkit/WebView;)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getErrorUrl()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V

    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/WebViewListener;->onReceivedHttpError(Landroid/webkit/WebView;)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p3}, Lcom/getcapacitor/Bridge;->getErrorUrl()Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 4

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    iget-object v0, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebViewListeners()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    move v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {v3, p1, p2}, Lcom/getcapacitor/WebViewListener;->onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v2, :cond_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    move v1, v2

    :cond_3
    return v1
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 0

    iget-object p1, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getLocalServer()Lcom/getcapacitor/WebViewLocalServer;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/getcapacitor/WebViewLocalServer;->shouldInterceptRequest(Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;

    move-result-object p1

    return-object p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 0

    .line 1
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2, p1}, Lcom/getcapacitor/Bridge;->launchIntent(Landroid/net/Uri;)Z

    move-result p1

    return p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebViewClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/getcapacitor/Bridge;->launchIntent(Landroid/net/Uri;)Z

    move-result p1

    return p1
.end method
