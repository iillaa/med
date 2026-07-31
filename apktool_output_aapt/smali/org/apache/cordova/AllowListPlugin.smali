.class public Lorg/apache/cordova/AllowListPlugin;
.super LK5;
.source "SourceFile"


# static fields
.field public static final PLUGIN_NAME:Ljava/lang/String; = "CordovaAllowListPlugin"


# instance fields
.field public b:LP0;

.field public c:LP0;

.field public d:LP0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LP0;LP0;LP0;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p3, :cond_0

    .line 3
    new-instance p3, LP0;

    invoke-direct {p3}, LP0;-><init>()V

    const-string v0, "file:///*"

    invoke-virtual {p3, v0}, LP0;->a(Ljava/lang/String;)V

    const-string v0, "data:*"

    invoke-virtual {p3, v0}, LP0;->a(Ljava/lang/String;)V

    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    iput-object p2, p0, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    iput-object p3, p0, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 4
    new-instance v0, LP0;

    invoke-direct {v0}, LP0;-><init>()V

    new-instance v1, LP0;

    invoke-direct {v1}, LP0;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/AllowListPlugin;-><init>(LP0;LP0;LP0;)V

    new-instance v0, LQ0;

    invoke-direct {v0, p0}, LQ0;-><init>(Lorg/apache/cordova/AllowListPlugin;)V

    invoke-virtual {v0, p1}, Lc5;->c(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3

    .line 5
    new-instance v0, LP0;

    invoke-direct {v0}, LP0;-><init>()V

    new-instance v1, LP0;

    invoke-direct {v1}, LP0;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/cordova/AllowListPlugin;-><init>(LP0;LP0;LP0;)V

    new-instance v0, LQ0;

    invoke-direct {v0, p0}, LQ0;-><init>(Lorg/apache/cordova/AllowListPlugin;)V

    invoke-virtual {v0, p1}, Lc5;->d(Lorg/xmlpull/v1/XmlPullParser;)V

    return-void
.end method


# virtual methods
.method public getAllowedIntents()LP0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    .line 2
    .line 3
    return-object v0
.end method

.method public getAllowedNavigations()LP0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 2
    .line 3
    return-object v0
.end method

.method public getAllowedRequests()LP0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    .line 2
    .line 3
    return-object v0
.end method

.method public pluginInitialize()V
    .locals 2

    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    if-nez v0, :cond_0

    new-instance v0, LP0;

    invoke-direct {v0}, LP0;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    new-instance v0, LP0;

    invoke-direct {v0}, LP0;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    new-instance v0, LP0;

    invoke-direct {v0}, LP0;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    new-instance v0, LQ0;

    invoke-direct {v0, p0}, LQ0;-><init>(Lorg/apache/cordova/AllowListPlugin;)V

    iget-object v1, p0, LK5;->webView:LP5;

    invoke-interface {v1}, LP5;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc5;->c(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public setAllowedIntents(LP0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    .line 2
    .line 3
    return-void
.end method

.method public setAllowedNavigations(LP0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 2
    .line 3
    return-void
.end method

.method public setAllowedRequests(LP0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    .line 2
    .line 3
    return-void
.end method

.method public shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    invoke-virtual {v0, p1}, LP0;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public shouldAllowRequest(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lorg/apache/cordova/AllowListPlugin;->shouldAllowNavigation(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    invoke-virtual {v1, p1}, LP0;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return-object v0
.end method

.method public shouldOpenExternalUrl(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    invoke-virtual {v0, p1}, LP0;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
