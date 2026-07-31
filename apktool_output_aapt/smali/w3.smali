.class public final synthetic Lw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Landroid/webkit/JsResult;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/JsResult;I)V
    .locals 0

    .line 1
    iput p2, p0, Lw3;->c:I

    iput-object p1, p0, Lw3;->d:Landroid/webkit/JsResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget v0, p0, Lw3;->c:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lw3;->d:Landroid/webkit/JsResult;

    check-cast v0, Landroid/webkit/JsPromptResult;

    invoke-static {v0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->b(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_0
    iget-object v0, p0, Lw3;->d:Landroid/webkit/JsResult;

    invoke-static {v0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->g(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lw3;->d:Landroid/webkit/JsResult;

    invoke-static {v0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->h(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lw3;->d:Landroid/webkit/JsResult;

    invoke-static {v0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->c(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
