.class public final synthetic Lv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lcom/getcapacitor/Bridge;


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/Bridge;I)V
    .locals 0

    .line 1
    iput p2, p0, Lv3;->c:I

    iput-object p1, p0, Lv3;->d:Lcom/getcapacitor/Bridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget v0, p0, Lv3;->c:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lv3;->d:Lcom/getcapacitor/Bridge;

    invoke-static {v0}, Lcom/getcapacitor/Bridge;->c(Lcom/getcapacitor/Bridge;)V

    return-void

    :pswitch_0
    iget-object v0, p0, Lv3;->d:Lcom/getcapacitor/Bridge;

    invoke-static {v0}, Lcom/getcapacitor/Bridge;->d(Lcom/getcapacitor/Bridge;)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lv3;->d:Lcom/getcapacitor/Bridge;

    invoke-static {v0}, Lcom/getcapacitor/Bridge;->b(Lcom/getcapacitor/Bridge;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
