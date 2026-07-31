.class public abstract LK5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public cordova:LI5;

.field public webView:LP5;


# virtual methods
.method public execute(Ljava/lang/String;LB5;LK3;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    return p1
.end method

.method public execute(Ljava/lang/String;Ljava/lang/String;LK3;)Z
    .locals 1

    .line 2
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0, p3}, LK5;->execute(Ljava/lang/String;Lorg/json/JSONArray;LK3;)Z

    move-result p1

    return p1
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;LK3;)Z
    .locals 0

    new-instance p2, LB5;

    .line 3
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-virtual {p0, p1, p2, p3}, LK5;->execute(Ljava/lang/String;LB5;LK3;)Z

    move-result p1

    return p1
.end method

.method public getPathHandler()LL5;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, LK5;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public handleOpenForRead(Landroid/net/Uri;)LN5;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/FileNotFoundException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Plugin can\'t handle uri: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw v0
.end method

.method public hasPermisssion()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public initialize(LI5;LP5;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onOverrideUrlLoading(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public onPause(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onReceivedClientCertRequest(LP5;Lja;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public onReceivedHttpAuthRequest(LP5;Lla;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onReset()V
    .locals 0

    .line 1
    return-void
.end method

.method public onRestoreStateForActivityResult(Landroid/os/Bundle;LK3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onResume(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Bundle;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public onStart()V
    .locals 0

    .line 1
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    return-void
.end method

.method public pluginInitialize()V
    .locals 0

    .line 1
    return-void
.end method

.method public final privateInitialize(Ljava/lang/String;LI5;LP5;LM5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LK5;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, LK5;->cordova:LI5;

    .line 4
    .line 5
    iput-object p3, p0, LK5;->webView:LP5;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p3}, LK5;->initialize(LI5;LP5;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, LK5;->pluginInitialize()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public remapUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public requestPermissions(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public shouldAllowBridgeAccess(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LK5;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method
