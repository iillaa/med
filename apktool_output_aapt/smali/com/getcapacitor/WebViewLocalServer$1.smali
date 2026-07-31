.class Lcom/getcapacitor/WebViewLocalServer$1;
.super Lcom/getcapacitor/WebViewLocalServer$PathHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/WebViewLocalServer;->createHostingDetails()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/WebViewLocalServer;

.field final synthetic val$assetPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/getcapacitor/WebViewLocalServer;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    iput-object p2, p0, Lcom/getcapacitor/WebViewLocalServer$1;->val$assetPath:Ljava/lang/String;

    invoke-direct {p0}, Lcom/getcapacitor/WebViewLocalServer$PathHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 6

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v1}, Lcom/getcapacitor/WebViewLocalServer;->b(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/Bridge;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getRouteProcessor()Lcom/getcapacitor/RouteProcessor;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v2}, Lcom/getcapacitor/WebViewLocalServer;->b(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/Bridge;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getcapacitor/Bridge;->getRouteProcessor()Lcom/getcapacitor/RouteProcessor;

    move-result-object v2

    const-string v3, ""

    invoke-interface {v2, v3, v0}, Lcom/getcapacitor/RouteProcessor;->process(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/ProcessedRoute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/ProcessedRoute;->getPath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-virtual {v0}, Lcom/getcapacitor/ProcessedRoute;->isAsset()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/getcapacitor/WebViewLocalServer;->e(Lcom/getcapacitor/WebViewLocalServer;Z)V

    invoke-virtual {v0}, Lcom/getcapacitor/ProcessedRoute;->isIgnoreAssetPath()Z

    move-result v0

    move-object v5, v2

    move v2, v0

    move-object v0, v5

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    :try_start_0
    const-string v3, "/_capacitor_content_"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v0, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v0}, Lcom/getcapacitor/WebViewLocalServer;->d(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/AndroidProtocolHandler;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/getcapacitor/AndroidProtocolHandler;->openContentUrl(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_3

    :cond_1
    const-string v3, "/_capacitor_file_"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    :goto_1
    invoke-static {v1}, Lcom/getcapacitor/WebViewLocalServer;->d(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/AndroidProtocolHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/getcapacitor/AndroidProtocolHandler;->openFile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_3

    :cond_2
    iget-object v3, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v3}, Lcom/getcapacitor/WebViewLocalServer;->c(Lcom/getcapacitor/WebViewLocalServer;)Z

    move-result v3

    if-nez v3, :cond_4

    if-nez v1, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v1}, Lcom/getcapacitor/WebViewLocalServer;->a(Lcom/getcapacitor/WebViewLocalServer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    goto :goto_1

    :cond_4
    if-eqz v2, :cond_5

    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v1}, Lcom/getcapacitor/WebViewLocalServer;->d(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/AndroidProtocolHandler;

    move-result-object v1

    :goto_2
    invoke-virtual {v1, v0}, Lcom/getcapacitor/AndroidProtocolHandler;->openAsset(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_3

    :cond_5
    iget-object v1, p0, Lcom/getcapacitor/WebViewLocalServer$1;->this$0:Lcom/getcapacitor/WebViewLocalServer;

    invoke-static {v1}, Lcom/getcapacitor/WebViewLocalServer;->d(Lcom/getcapacitor/WebViewLocalServer;)Lcom/getcapacitor/AndroidProtocolHandler;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/getcapacitor/WebViewLocalServer$1;->val$assetPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_3
    return-object p1

    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to open asset URL: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method
