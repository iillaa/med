.class public Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;
.super Lve;
.source "SourceFile"


# instance fields
.field public final a:Lxe;

.field public b:Z

.field public c:Z


# direct methods
.method public constructor <init>(Lxe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->a:Lxe;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public notifyOfFlush(Lye;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->c:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->b:Z

    .line 8
    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    iput-boolean p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->b:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onNativeToJsMessageAvailable(Lye;)V
    .locals 2

    .line 1
    new-instance v0, Lg0;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, p1}, Lg0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->a:Lxe;

    .line 9
    .line 10
    check-cast p1, Li0;

    .line 11
    .line 12
    iget-object p1, p1, Li0;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 15
    .line 16
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    .line 17
    .line 18
    invoke-interface {p1}, LI5;->getActivity()Lm1;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    new-instance v0, Lj3;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-direct {v0, v1, p0}, Lj3;-><init>(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->a:Lxe;

    .line 8
    .line 9
    check-cast v1, Li0;

    .line 10
    .line 11
    iget-object v1, v1, Li0;->d:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 14
    .line 15
    iget-object v1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    .line 16
    .line 17
    invoke-interface {v1}, LI5;->getActivity()Lm1;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
