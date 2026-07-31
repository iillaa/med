.class public Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ5;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/CordovaWebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EngineClient"
.end annotation


# instance fields
.field public final synthetic a:Lorg/apache/cordova/CordovaWebViewImpl;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    return-void
.end method


# virtual methods
.method public clearLoadTimeoutTimer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 2
    .line 3
    iget v1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    iput v1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    .line 8
    .line 9
    return-void
.end method

.method public onDispatchKeyEvent(Landroid/view/KeyEvent;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x4

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    move v3, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v3, 0x0

    .line 12
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    const/4 v5, 0x0

    .line 17
    iget-object v6, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 18
    .line 19
    if-nez v4, :cond_3

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p1

    .line 30
    :cond_1
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    return-object p1

    .line 45
    :cond_2
    if-eqz v3, :cond_b

    .line 46
    .line 47
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 48
    .line 49
    invoke-interface {p1}, LR5;->canGoBack()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    return-object p1

    .line 58
    :cond_3
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-ne p1, v1, :cond_b

    .line 63
    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->l:LU5;

    .line 67
    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    invoke-virtual {v6}, Lorg/apache/cordova/CordovaWebViewImpl;->hideCustomView()V

    .line 71
    .line 72
    .line 73
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 74
    .line 75
    return-object p1

    .line 76
    :cond_4
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_a

    .line 87
    .line 88
    if-eq v0, v2, :cond_9

    .line 89
    .line 90
    const/16 p1, 0x52

    .line 91
    .line 92
    if-eq v0, p1, :cond_8

    .line 93
    .line 94
    const/16 p1, 0x54

    .line 95
    .line 96
    if-eq v0, p1, :cond_7

    .line 97
    .line 98
    const/16 p1, 0x18

    .line 99
    .line 100
    if-eq v0, p1, :cond_6

    .line 101
    .line 102
    const/16 p1, 0x19

    .line 103
    .line 104
    if-eq v0, p1, :cond_5

    .line 105
    .line 106
    move-object p1, v5

    .line 107
    goto :goto_1

    .line 108
    :cond_5
    const-string p1, "volumedownbutton"

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_6
    const-string p1, "volumeupbutton"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_7
    const-string p1, "searchbutton"

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_8
    const-string p1, "menubutton"

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_9
    const-string p1, "backbutton"

    .line 121
    .line 122
    :goto_1
    if-eqz p1, :cond_b

    .line 123
    .line 124
    invoke-virtual {v6, p1}, Lorg/apache/cordova/CordovaWebViewImpl;->a(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 128
    .line 129
    return-object p1

    .line 130
    :cond_a
    if-eqz v3, :cond_b

    .line 131
    .line 132
    iget-object p1, v6, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 133
    .line 134
    invoke-interface {p1}, LR5;->goBack()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    return-object p1

    .line 143
    :cond_b
    return-object v5
.end method

.method public onNavigationAttempt(Ljava/lang/String;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 4
    .line 5
    iget-object v1, v0, Lqf;->b:Ljava/util/Map;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v2, v0, Lqf;->b:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lof;

    .line 30
    .line 31
    iget-object v5, v0, Lqf;->a:Ljava/util/Map;

    .line 32
    .line 33
    iget-object v3, v3, Lof;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, LK5;

    .line 40
    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    invoke-virtual {v3, p1}, LK5;->onOverrideUrlLoading(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    monitor-exit v1

    .line 50
    return v4

    .line 51
    :catchall_0
    move-exception p1

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 55
    .line 56
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Lqf;->m(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    return v1

    .line 66
    :cond_2
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 67
    .line 68
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Lqf;->o(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {v0, p1, v4, v1, v2}, Lorg/apache/cordova/CordovaWebViewImpl;->showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return v4

    .line 87
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p1
.end method

.method public onPageFinishedLoading(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->clearLoadTimeoutTimer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 5
    .line 6
    iget-object v1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 7
    .line 8
    const-string v2, "onPageFinished"

    .line 9
    .line 10
    invoke-virtual {v1, v2, p1}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 14
    .line 15
    invoke-interface {v1}, LR5;->getView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Ljava/lang/Thread;

    .line 26
    .line 27
    new-instance v2, Lorg/apache/cordova/b;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lorg/apache/cordova/b;-><init>(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 36
    .line 37
    .line 38
    :cond_0
    const-string v1, "about:blank"

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 47
    .line 48
    const-string v0, "exit"

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p1, v0, v1}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public onPageStarted(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->n:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 9
    .line 10
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 11
    .line 12
    iget-object v1, v0, Lqf;->a:Ljava/util/Map;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v0, v0, Lqf;->a:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, LK5;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v2}, LK5;->onReset()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 47
    .line 48
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 49
    .line 50
    const-string v1, "onPageStarted"

    .line 51
    .line 52
    invoke-virtual {v0, v1, p1}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p1
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->clearLoadTimeoutTimer()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    const-string v1, "errorCode"

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    const-string p1, "description"

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    const-string p1, "url"

    .line 20
    .line 21
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 30
    .line 31
    iget-object p1, p1, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 32
    .line 33
    const-string p2, "onReceivedError"

    .line 34
    .line 35
    invoke-virtual {p1, p2, v0}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    return-void
.end method
