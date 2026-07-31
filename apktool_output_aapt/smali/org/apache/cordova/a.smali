.class public final Lorg/apache/cordova/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:Lorg/apache/cordova/b;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/b;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/cordova/a;->c:Lorg/apache/cordova/b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/a;->c:Lorg/apache/cordova/b;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/apache/cordova/b;->c:Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;

    .line 4
    .line 5
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl$EngineClient;->a:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 6
    .line 7
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 8
    .line 9
    const-string v1, "spinner"

    .line 10
    .line 11
    const-string v2, "stop"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method
