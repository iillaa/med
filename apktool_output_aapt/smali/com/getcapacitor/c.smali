.class public final synthetic Lcom/getcapacitor/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;


# instance fields
.field public final synthetic a:Lcom/getcapacitor/BridgeWebChromeClient;

.field public final synthetic b:Landroid/webkit/GeolocationPermissions$Callback;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/c;->a:Lcom/getcapacitor/BridgeWebChromeClient;

    iput-object p2, p0, Lcom/getcapacitor/c;->b:Landroid/webkit/GeolocationPermissions$Callback;

    iput-object p3, p0, Lcom/getcapacitor/c;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onPermissionSelect(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/c;->b:Landroid/webkit/GeolocationPermissions$Callback;

    iget-object v1, p0, Lcom/getcapacitor/c;->c:Ljava/lang/String;

    iget-object v2, p0, Lcom/getcapacitor/c;->a:Lcom/getcapacitor/BridgeWebChromeClient;

    invoke-static {v2, v0, v1, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->k(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
