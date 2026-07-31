.class public final Lorg/apache/cordova/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/b;->c:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/b;->c:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    .line 2
    .line 3
    const-wide/16 v1, 0x7d0

    .line 4
    .line 5
    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 9
    .line 10
    iget-object v1, v1, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 11
    .line 12
    invoke-interface {v1}, LI5;->getActivity()Lm1;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 19
    .line 20
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 21
    .line 22
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lorg/apache/cordova/a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lorg/apache/cordova/a;-><init>(Lorg/apache/cordova/b;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    :cond_0
    return-void
.end method
