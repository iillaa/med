.class public final synthetic Lcom/getcapacitor/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;
.implements Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/getcapacitor/a;->a:I

    iput-object p2, p0, Lcom/getcapacitor/a;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(Lv0;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/getcapacitor/a;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/getcapacitor/a;->b:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/ValueCallback;

    invoke-static {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->o(Landroid/webkit/ValueCallback;Lv0;)V

    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/getcapacitor/a;->b:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/ValueCallback;

    invoke-static {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->j(Landroid/webkit/ValueCallback;Lv0;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onPermissionSelect(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/a;->b:Ljava/lang/Object;

    check-cast v0, Landroid/webkit/PermissionRequest;

    invoke-static {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->d(Landroid/webkit/PermissionRequest;Ljava/lang/Boolean;)V

    return-void
.end method
