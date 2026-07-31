.class public Lcom/getcapacitor/BridgeActivity;
.super Lm1;
.source "SourceFile"


# instance fields
.field protected activityDepth:I

.field protected bridge:Lcom/getcapacitor/Bridge;

.field protected final bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

.field protected config:Lcom/getcapacitor/CapConfig;

.field protected initialPlugins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;>;"
        }
    .end annotation
.end field

.field protected keepRunning:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lh9;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, LX4;->getSavedStateRegistry()LGg;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lk1;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lk1;-><init>(Lm1;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "androidx:appcompat"

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, LGg;->c(Ljava/lang/String;LFg;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll1;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll1;-><init>(Lm1;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, LX4;->addOnContextAvailableListener(LWe;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lcom/getcapacitor/BridgeActivity;->keepRunning:Z

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lcom/getcapacitor/BridgeActivity;->activityDepth:I

    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/getcapacitor/BridgeActivity;->initialPlugins:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Lcom/getcapacitor/Bridge$Builder;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Lcom/getcapacitor/Bridge$Builder;-><init>(Lm1;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public getBridge()Lcom/getcapacitor/Bridge;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    return-object v0
.end method

.method public load()V
    .locals 2

    const-string v0, "Starting BridgeActivity"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    iget-object v1, p0, Lcom/getcapacitor/BridgeActivity;->initialPlugins:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge$Builder;->addPlugins(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/BridgeActivity;->config:Lcom/getcapacitor/CapConfig;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge$Builder;->setConfig(Lcom/getcapacitor/CapConfig;)Lcom/getcapacitor/Bridge$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge$Builder;->create()Lcom/getcapacitor/Bridge;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->shouldKeepRunning()Z

    move-result v0

    iput-boolean v0, p0, Lcom/getcapacitor/BridgeActivity;->keepRunning:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/getcapacitor/BridgeActivity;->onNewIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lcom/getcapacitor/Bridge;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2, p3}, Lh9;->onActivityResult(IILandroid/content/Intent;)V

    :cond_1
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lm1;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lh9;->onCreate(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge$Builder;->setInstanceState(Landroid/os/Bundle;)Lcom/getcapacitor/Bridge$Builder;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    sget v0, Lcom/getcapacitor/android/R$style;->AppTheme_NoActionBar:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->setTheme(I)V

    sget p1, Lcom/getcapacitor/android/R$style;->AppTheme_NoActionBar:I

    invoke-virtual {p0, p1}, Lm1;->setTheme(I)V

    :try_start_0
    sget p1, Lcom/getcapacitor/android/R$layout;->capacitor_bridge_layout_main:I

    invoke-virtual {p0, p1}, Lm1;->setContentView(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    new-instance p1, Lcom/getcapacitor/PluginManager;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/getcapacitor/PluginManager;-><init>(Landroid/content/res/AssetManager;)V

    :try_start_1
    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginManager;->loadPluginClasses()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge$Builder;->addPlugins(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;
    :try_end_1
    .catch Lcom/getcapacitor/PluginLoadException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Error loading plugins."

    invoke-static {v0, p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    invoke-virtual {p0}, Lcom/getcapacitor/BridgeActivity;->load()V

    return-void

    :catch_1
    sget p1, Lcom/getcapacitor/android/R$layout;->no_webview:I

    invoke-virtual {p0, p1}, Lm1;->setContentView(I)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lm1;->onDestroy()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onDestroy()V

    const-string v0, "App destroyed"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onDetachedFromWindow()V

    :cond_0
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1}, LX4;->onNewIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lh9;->onPause()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onPause()V

    const-string v0, "App paused"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lcom/getcapacitor/Bridge;->onRequestPermissionsResult(I[Ljava/lang/String;[I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2, p3}, Lh9;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    :cond_1
    return-void
.end method

.method public onRestart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onRestart()V

    const-string v0, "App restarted"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lh9;->onResume()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/getcapacitor/App;->fireStatusChange(Z)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onResume()V

    const-string v0, "App resumed"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, LX4;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->saveInstanceState(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lm1;->onStart()V

    iget v0, p0, Lcom/getcapacitor/BridgeActivity;->activityDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/getcapacitor/BridgeActivity;->activityDepth:I

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onStart()V

    const-string v0, "App started"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lm1;->onStop()V

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/getcapacitor/BridgeActivity;->activityDepth:I

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/getcapacitor/BridgeActivity;->activityDepth:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getApp()Lcom/getcapacitor/App;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/getcapacitor/App;->fireStatusChange(Z)V

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->onStop()V

    const-string v0, "App stopped"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public registerPlugin(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge$Builder;->addPlugin(Ljava/lang/Class;)Lcom/getcapacitor/Bridge$Builder;

    return-void
.end method

.method public registerPlugins(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/BridgeActivity;->bridgeBuilder:Lcom/getcapacitor/Bridge$Builder;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge$Builder;->addPlugins(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;

    return-void
.end method
