.class public Lcom/getcapacitor/Bridge$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getcapacitor/Bridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private activity:Lm1;

.field private config:Lcom/getcapacitor/CapConfig;

.field private fragment:Lc9;

.field private instanceState:Landroid/os/Bundle;

.field private pluginInstances:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/getcapacitor/Plugin;",
            ">;"
        }
    .end annotation
.end field

.field private plugins:Ljava/util/List;
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

.field private routeProcessor:Lcom/getcapacitor/RouteProcessor;

.field private serverPath:Lcom/getcapacitor/ServerPath;

.field private final webViewListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/getcapacitor/WebViewListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lc9;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->instanceState:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->config:Lcom/getcapacitor/CapConfig;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->plugins:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->pluginInstances:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->webViewListeners:Ljava/util/List;

    throw p1
.end method

.method public constructor <init>(Lm1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->instanceState:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->config:Lcom/getcapacitor/CapConfig;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->plugins:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->pluginInstances:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->webViewListeners:Ljava/util/List;

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    return-void
.end method


# virtual methods
.method public addPlugin(Ljava/lang/Class;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;)",
            "Lcom/getcapacitor/Bridge$Builder;"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->plugins:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addPluginInstance(Lcom/getcapacitor/Plugin;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->pluginInstances:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addPluginInstances(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/getcapacitor/Plugin;",
            ">;)",
            "Lcom/getcapacitor/Bridge$Builder;"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->pluginInstances:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public addPlugins(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;>;)",
            "Lcom/getcapacitor/Bridge$Builder;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Bridge$Builder;->addPlugin(Ljava/lang/Class;)Lcom/getcapacitor/Bridge$Builder;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public addWebViewListener(Lcom/getcapacitor/WebViewListener;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Bridge$Builder;->webViewListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addWebViewListeners(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/getcapacitor/WebViewListener;",
            ">;)",
            "Lcom/getcapacitor/Bridge$Builder;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/WebViewListener;

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Bridge$Builder;->addWebViewListener(Lcom/getcapacitor/WebViewListener;)Lcom/getcapacitor/Bridge$Builder;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public create()Lcom/getcapacitor/Bridge;
    .locals 13

    .line 1
    new-instance v0, Lc5;

    .line 2
    .line 3
    invoke-direct {v0}, Lc5;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lc5;->c(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget-object v10, v0, Lc5;->a:LM5;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object v0, v0, Lc5;->b:Ljava/util/ArrayList;

    .line 30
    .line 31
    new-instance v8, Lcom/getcapacitor/cordova/MockCordovaInterfaceImpl;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 34
    .line 35
    invoke-direct {v8, v1}, Lcom/getcapacitor/cordova/MockCordovaInterfaceImpl;-><init>(Lm1;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->instanceState:Landroid/os/Bundle;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v8, v1}, Lorg/apache/cordova/CordovaInterfaceImpl;->restoreInstanceState(Landroid/os/Bundle;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 46
    .line 47
    sget v2, Lcom/getcapacitor/android/R$id;->webview:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lm1;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroid/webkit/WebView;

    .line 54
    .line 55
    new-instance v12, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-direct {v12, v2}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v12, v8, v0, v10, v1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->init(LI5;Ljava/util/List;LM5;Landroid/webkit/WebView;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v12}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->getPluginManager()Lqf;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-virtual {v8, v9}, Lorg/apache/cordova/CordovaInterfaceImpl;->onCordovaInit(Lqf;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Lcom/getcapacitor/Bridge;

    .line 77
    .line 78
    iget-object v3, p0, Lcom/getcapacitor/Bridge$Builder;->activity:Lm1;

    .line 79
    .line 80
    iget-object v4, p0, Lcom/getcapacitor/Bridge$Builder;->serverPath:Lcom/getcapacitor/ServerPath;

    .line 81
    .line 82
    iget-object v6, p0, Lcom/getcapacitor/Bridge$Builder;->plugins:Ljava/util/List;

    .line 83
    .line 84
    iget-object v7, p0, Lcom/getcapacitor/Bridge$Builder;->pluginInstances:Ljava/util/List;

    .line 85
    .line 86
    iget-object v11, p0, Lcom/getcapacitor/Bridge$Builder;->config:Lcom/getcapacitor/CapConfig;

    .line 87
    .line 88
    move-object v2, v0

    .line 89
    move-object v5, v1

    .line 90
    invoke-direct/range {v2 .. v11}, Lcom/getcapacitor/Bridge;-><init>(Lm1;Lcom/getcapacitor/ServerPath;Landroid/webkit/WebView;Ljava/util/List;Ljava/util/List;Lcom/getcapacitor/cordova/MockCordovaInterfaceImpl;Lqf;LM5;Lcom/getcapacitor/CapConfig;)V

    .line 91
    .line 92
    .line 93
    instance-of v2, v1, Lcom/getcapacitor/CapacitorWebView;

    .line 94
    .line 95
    if-eqz v2, :cond_1

    .line 96
    .line 97
    check-cast v1, Lcom/getcapacitor/CapacitorWebView;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Lcom/getcapacitor/CapacitorWebView;->setBridge(Lcom/getcapacitor/Bridge;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v0}, Lcom/getcapacitor/CapacitorWebView;->edgeToEdgeHandler(Lcom/getcapacitor/Bridge;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-virtual {v0, v12}, Lcom/getcapacitor/Bridge;->setCordovaWebView(LP5;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->webViewListeners:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->setWebViewListeners(Ljava/util/List;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->routeProcessor:Lcom/getcapacitor/RouteProcessor;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->setRouteProcessor(Lcom/getcapacitor/RouteProcessor;)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/getcapacitor/Bridge$Builder;->instanceState:Landroid/os/Bundle;

    .line 119
    .line 120
    if-eqz v1, :cond_2

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->restoreInstanceState(Landroid/os/Bundle;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-object v0
.end method

.method public setConfig(Lcom/getcapacitor/CapConfig;)Lcom/getcapacitor/Bridge$Builder;
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->config:Lcom/getcapacitor/CapConfig;

    return-object p0
.end method

.method public setInstanceState(Landroid/os/Bundle;)Lcom/getcapacitor/Bridge$Builder;
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->instanceState:Landroid/os/Bundle;

    return-object p0
.end method

.method public setPlugins(Ljava/util/List;)Lcom/getcapacitor/Bridge$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;>;)",
            "Lcom/getcapacitor/Bridge$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->plugins:Ljava/util/List;

    return-object p0
.end method

.method public setRouteProcessor(Lcom/getcapacitor/RouteProcessor;)Lcom/getcapacitor/Bridge$Builder;
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->routeProcessor:Lcom/getcapacitor/RouteProcessor;

    return-object p0
.end method

.method public setServerPath(Lcom/getcapacitor/ServerPath;)Lcom/getcapacitor/Bridge$Builder;
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Bridge$Builder;->serverPath:Lcom/getcapacitor/ServerPath;

    return-object p0
.end method
