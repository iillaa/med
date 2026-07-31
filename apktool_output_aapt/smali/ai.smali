.class public final Lai;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public final a:Lorg/apache/cordova/engine/SystemWebViewEngine;

.field public final b:Li0;

.field public c:Z

.field public final d:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Hashtable;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lai;->d:Ljava/util/Hashtable;

    .line 10
    .line 11
    iput-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->c:LM5;

    .line 19
    .line 20
    const-string v2, "hostname"

    .line 21
    .line 22
    const-string v3, "localhost"

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, LM5;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, LZh;

    .line 29
    .line 30
    invoke-direct {v2, p0, p1}, LZh;-><init>(Lai;Lorg/apache/cordova/engine/SystemWebViewEngine;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Lhf;

    .line 34
    .line 35
    const-string v3, "/"

    .line 36
    .line 37
    invoke-direct {p1, v3, v2}, Lhf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lhf;

    .line 63
    .line 64
    iget-object v3, v2, Lhf;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v3, Ljava/lang/String;

    .line 67
    .line 68
    iget-object v2, v2, Lhf;->b:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v2, LZh;

    .line 71
    .line 72
    new-instance v4, Lek;

    .line 73
    .line 74
    invoke-direct {v4, v1, v3, v2}, Lek;-><init>(Ljava/lang/String;Ljava/lang/String;LZh;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    new-instance v0, Li0;

    .line 82
    .line 83
    const/16 v1, 0x1a

    .line 84
    .line 85
    invoke-direct {v0, v1, p1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lai;->b:Li0;

    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lai;->c:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-string p1, "about:"

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lai;->c:Z

    .line 19
    .line 20
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 21
    .line 22
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 23
    .line 24
    invoke-interface {p1, p2}, LQ5;->onPageFinishedLoading(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lai;->c:Z

    .line 6
    .line 7
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->d:LC5;

    .line 10
    .line 11
    iget-object p3, p1, LC5;->b:Lye;

    .line 12
    .line 13
    monitor-enter p3

    .line 14
    :try_start_0
    iget-object v0, p3, Lye;->b:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 17
    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p3, v0}, Lye;->f(I)V

    .line 21
    .line 22
    .line 23
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    iput v0, p1, LC5;->c:I

    .line 25
    .line 26
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 27
    .line 28
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 29
    .line 30
    invoke-interface {p1, p2}, LQ5;->onPageStarted(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method

.method public final onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    new-instance v1, Lorg/apache/cordova/CordovaClientCertRequest;

    .line 8
    .line 9
    invoke-direct {v1, p2}, Lorg/apache/cordova/CordovaClientCertRequest;-><init>(Landroid/webkit/ClientCertRequest;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, v0, Lqf;->a:Ljava/util/Map;

    .line 13
    .line 14
    monitor-enter v2

    .line 15
    :try_start_0
    iget-object v3, v0, Lqf;->a:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, LK5;

    .line 36
    .line 37
    if-eqz v4, :cond_0

    .line 38
    .line 39
    iget-object v5, v0, Lqf;->d:LP5;

    .line 40
    .line 41
    invoke-virtual {v4, v5, v1}, LK5;->onReceivedClientCertRequest(LP5;Lja;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 49
    .line 50
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 51
    .line 52
    invoke-interface {p1}, LQ5;->clearLoadTimeoutTimer()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    :try_start_1
    monitor-exit v2

    .line 59
    goto :goto_1

    .line 60
    :goto_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw p1

    .line 62
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequest;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lai;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/16 v0, -0xa

    .line 7
    .line 8
    iget-object v1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 9
    .line 10
    if-ne p2, v0, :cond_2

    .line 11
    .line 12
    iget-object v0, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 13
    .line 14
    invoke-interface {v0}, LQ5;->clearLoadTimeoutTimer()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iget-object p1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 31
    .line 32
    invoke-interface {p1, p2, p3, p4}, LQ5;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lai;->d:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {p3, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 38
    .line 39
    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    new-instance v1, Lorg/apache/cordova/CordovaHttpAuthHandler;

    .line 44
    .line 45
    invoke-direct {v1, p2}, Lorg/apache/cordova/CordovaHttpAuthHandler;-><init>(Landroid/webkit/HttpAuthHandler;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, v0, Lqf;->a:Ljava/util/Map;

    .line 49
    .line 50
    monitor-enter v2

    .line 51
    :try_start_0
    iget-object v3, v0, Lqf;->a:Ljava/util/Map;

    .line 52
    .line 53
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_1

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, LK5;

    .line 72
    .line 73
    if-eqz v4, :cond_0

    .line 74
    .line 75
    iget-object v5, v0, Lqf;->d:LP5;

    .line 76
    .line 77
    invoke-virtual {v4, v5, v1, p3, p4}, LK5;->onReceivedHttpAuthRequest(LP5;Lla;Ljava/lang/String;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-eqz v4, :cond_0

    .line 82
    .line 83
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 85
    .line 86
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 87
    .line 88
    invoke-interface {p1}, LQ5;->clearLoadTimeoutTimer()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :catchall_0
    move-exception p1

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    :try_start_1
    monitor-exit v2

    .line 95
    goto :goto_1

    .line 96
    :goto_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p1

    .line 98
    :cond_2
    :goto_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    iget-object v1, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    .line 4
    .line 5
    invoke-interface {v1}, LI5;->getActivity()Lm1;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    .line 14
    .line 15
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/16 v2, 0x80

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 30
    .line 31
    and-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    return-void
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    .locals 6

    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object p1

    .line 1
    iget-object p2, p0, Lai;->b:Li0;

    iget-object p2, p2, Li0;->d:Ljava/lang/Object;

    check-cast p2, Ljava/util/List;

    .line 2
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lek;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v4, v0, Lek;->c:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-boolean v2, v0, Lek;->a:Z

    if-nez v2, :cond_0

    :goto_1
    move-object v0, v1

    goto :goto_2

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lek;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    iget-object v0, v0, Lek;->d:LZh;

    :goto_2
    if-nez v0, :cond_4

    goto :goto_0

    .line 4
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 5
    const-string v3, ""

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 6
    iget-object v3, v0, LZh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, LZh;->a:Lai;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    :try_start_0
    iget-object v0, v0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    if-eqz v0, :cond_8

    .line 8
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, v0, Lqf;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LK5;

    if-eqz v5, :cond_5

    invoke-virtual {v5}, LK5;->getPathHandler()LL5;

    goto :goto_3

    .line 9
    :cond_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_4

    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Loh;->c(Ljava/lang/Object;)V

    throw v1

    :catch_0
    move-exception v0

    goto :goto_7

    :cond_8
    :goto_4
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v2, "index.html"

    :cond_9
    iget-object v0, v3, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "www/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v0, v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v0

    const-string v3, "text/html"

    invoke-static {v2}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d

    const-string v3, ".js"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c

    const-string v3, ".mjs"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    goto :goto_5

    :cond_a
    const-string v3, ".wasm"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v3, "application/wasm"

    goto :goto_6

    :cond_b
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_6

    :cond_c
    :goto_5
    const-string v3, "application/javascript"

    :cond_d
    :goto_6
    new-instance v2, Landroid/webkit/WebResourceResponse;

    invoke-direct {v2, v3, v1, v0}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    goto :goto_8

    :goto_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 10
    const-string v2, "SystemWebViewClient"

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_8
    if-nez v1, :cond_e

    goto/16 :goto_0

    :cond_e
    return-object v1
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 6

    const-string p1, "text/plain"

    iget-object v0, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    const-string v1, "UTF-8"

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    invoke-virtual {v3, p2}, Lqf;->n(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance p2, Landroid/webkit/WebResourceResponse;

    invoke-direct {p2, p1, v1, v2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object p2

    :catch_0
    move-exception p2

    goto :goto_2

    :cond_0
    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->i:LO5;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {v0, p2}, LO5;->e(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 11
    invoke-static {p2}, LO5;->c(Landroid/net/Uri;)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    invoke-virtual {p2}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    :goto_0
    const-string v4, "content"

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_1

    :cond_3
    return-object v2

    .line 13
    :cond_4
    :goto_1
    invoke-virtual {v0, v3}, LO5;->d(Landroid/net/Uri;)LN5;

    move-result-object p2

    new-instance v0, Landroid/webkit/WebResourceResponse;

    iget-object v3, p2, LN5;->b:Ljava/lang/String;

    iget-object p2, p2, LN5;->a:Ljava/io/InputStream;

    invoke-direct {v0, v3, v1, p2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :goto_2
    instance-of v0, p2, Ljava/io/FileNotFoundException;

    if-nez v0, :cond_5

    .line 14
    const-string v0, "SystemWebViewClient"

    const-string v3, "Error occurred while loading a file (returning a 404)."

    invoke-static {v0, v3, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    :cond_5
    new-instance p2, Landroid/webkit/WebResourceResponse;

    invoke-direct {p2, p1, v1, v2}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    return-object p2
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lai;->a:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->e:LQ5;

    .line 4
    .line 5
    invoke-interface {p1, p2}, LQ5;->onNavigationAttempt(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    return p1
.end method
