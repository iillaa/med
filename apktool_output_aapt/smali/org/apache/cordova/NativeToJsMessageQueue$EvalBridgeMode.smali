.class public Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;
.super Lve;
.source "SourceFile"


# instance fields
.field public final a:LR5;

.field public final b:LI5;


# direct methods
.method public constructor <init>(LR5;LI5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->a:LR5;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->b:LI5;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onNativeToJsMessageAvailable(Lye;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->b:LI5;

    .line 2
    .line 3
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lg0;

    .line 8
    .line 9
    const/4 v2, 0x7

    .line 10
    invoke-direct {v1, p0, v2, p1}, Lg0;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
