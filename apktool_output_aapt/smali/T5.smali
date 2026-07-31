.class public final LT5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Z

.field public final synthetic g:Lorg/apache/cordova/CordovaWebViewImpl;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl;ILS5;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LT5;->g:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 5
    .line 6
    iput p2, p0, LT5;->c:I

    .line 7
    .line 8
    iput-object p3, p0, LT5;->d:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput-object p4, p0, LT5;->e:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, LT5;->f:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, LT5;->c:I

    .line 2
    .line 3
    iget-object v1, p0, LT5;->g:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v1, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 8
    .line 9
    invoke-interface {v0}, LI5;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, LT5;->d:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, v1, Lorg/apache/cordova/CordovaWebViewImpl;->b:LR5;

    .line 19
    .line 20
    iget-object v1, p0, LT5;->e:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v2, p0, LT5;->f:Z

    .line 23
    .line 24
    invoke-interface {v0, v1, v2}, LR5;->loadUrl(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
