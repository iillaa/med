.class public Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;
.super Lve;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CapacitorEvalBridgeMode"
.end annotation


# instance fields
.field private final cordova:LI5;

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;LI5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->webView:Landroid/webkit/WebView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->cordova:LI5;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;Lye;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->lambda$onNativeToJsMessageAvailable$0(Lye;)V

    return-void
.end method

.method private synthetic lambda$onNativeToJsMessageAvailable$0(Lye;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lye;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->webView:Landroid/webkit/WebView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p1, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public onNativeToJsMessageAvailable(Lye;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->cordova:LI5;

    .line 2
    .line 3
    invoke-interface {v0}, LI5;->getActivity()Lm1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LQ2;

    .line 8
    .line 9
    const/4 v2, 0x5

    .line 10
    invoke-direct {v1, p0, v2, p1}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
