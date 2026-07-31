.class public final synthetic Lcom/getcapacitor/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;


# instance fields
.field public final synthetic a:Lcom/getcapacitor/BridgeWebChromeClient;

.field public final synthetic b:Landroid/webkit/ValueCallback;

.field public final synthetic c:Landroid/webkit/WebChromeClient$FileChooserParams;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/b;->a:Lcom/getcapacitor/BridgeWebChromeClient;

    iput-object p2, p0, Lcom/getcapacitor/b;->b:Landroid/webkit/ValueCallback;

    iput-object p3, p0, Lcom/getcapacitor/b;->c:Landroid/webkit/WebChromeClient$FileChooserParams;

    iput-boolean p4, p0, Lcom/getcapacitor/b;->d:Z

    return-void
.end method


# virtual methods
.method public final onPermissionSelect(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/b;->c:Landroid/webkit/WebChromeClient$FileChooserParams;

    iget-boolean v1, p0, Lcom/getcapacitor/b;->d:Z

    iget-object v2, p0, Lcom/getcapacitor/b;->a:Lcom/getcapacitor/BridgeWebChromeClient;

    iget-object v3, p0, Lcom/getcapacitor/b;->b:Landroid/webkit/ValueCallback;

    invoke-static {v2, v3, v0, v1, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->i(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;ZLjava/lang/Boolean;)V

    return-void
.end method
