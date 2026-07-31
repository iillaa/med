.class public final LS5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Runnable;

.field public final synthetic f:Lorg/apache/cordova/CordovaWebViewImpl;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl;IILg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LS5;->f:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 5
    .line 6
    iput p2, p0, LS5;->c:I

    .line 7
    .line 8
    iput p3, p0, LS5;->d:I

    .line 9
    .line 10
    iput-object p4, p0, LS5;->e:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    :try_start_1
    iget v0, p0, LS5;->c:I

    .line 3
    .line 4
    int-to-long v0, v0

    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    :goto_0
    iget-object v0, p0, LS5;->f:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 18
    .line 19
    iget v1, v0, Lorg/apache/cordova/CordovaWebViewImpl;->d:I

    .line 20
    .line 21
    iget v2, p0, LS5;->d:I

    .line 22
    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 26
    .line 27
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, LS5;->f:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 34
    .line 35
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 36
    .line 37
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, LS5;->e:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_0
    iget-object v0, p0, LS5;->f:Lorg/apache/cordova/CordovaWebViewImpl;

    .line 48
    .line 49
    iget-object v0, v0, Lorg/apache/cordova/CordovaWebViewImpl;->c:LI5;

    .line 50
    .line 51
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 52
    .line 53
    .line 54
    :goto_1
    return-void
.end method
