.class public final synthetic Ly3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/getcapacitor/BridgeWebChromeClient;


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/BridgeWebChromeClient;I)V
    .locals 0

    .line 1
    iput p2, p0, Ly3;->a:I

    iput-object p1, p0, Ly3;->b:Lcom/getcapacitor/BridgeWebChromeClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ly3;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ly3;->b:Lcom/getcapacitor/BridgeWebChromeClient;

    check-cast p1, Lv0;

    invoke-static {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->p(Lcom/getcapacitor/BridgeWebChromeClient;Lv0;)V

    return-void

    :pswitch_0
    iget-object v0, p0, Ly3;->b:Lcom/getcapacitor/BridgeWebChromeClient;

    check-cast p1, Ljava/util/Map;

    invoke-static {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->a(Lcom/getcapacitor/BridgeWebChromeClient;Ljava/util/Map;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
