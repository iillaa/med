.class public final synthetic LBh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/getcapacitor/PluginCall;


# direct methods
.method public synthetic constructor <init>(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;I)V
    .locals 0

    .line 1
    iput p4, p0, LBh;->c:I

    iput-object p1, p0, LBh;->d:Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    iput-object p2, p0, LBh;->e:Ljava/lang/String;

    iput-object p3, p0, LBh;->f:Lcom/getcapacitor/PluginCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, LBh;->c:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, LBh;->e:Ljava/lang/String;

    iget-object v1, p0, LBh;->f:Lcom/getcapacitor/PluginCall;

    iget-object v2, p0, LBh;->d:Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    invoke-static {v2, v0, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->c(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void

    :pswitch_0
    iget-object v0, p0, LBh;->e:Ljava/lang/String;

    iget-object v1, p0, LBh;->f:Lcom/getcapacitor/PluginCall;

    iget-object v2, p0, LBh;->d:Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    invoke-static {v2, v0, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->f(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
