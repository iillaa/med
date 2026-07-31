.class public final synthetic LJc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

.field public final synthetic e:Lcom/getcapacitor/PluginCall;


# direct methods
.method public synthetic constructor <init>(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;I)V
    .locals 0

    .line 1
    iput p3, p0, LJc;->c:I

    iput-object p1, p0, LJc;->d:Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    iput-object p2, p0, LJc;->e:Lcom/getcapacitor/PluginCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, LJc;->c:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, LJc;->d:Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    iget-object v1, p0, LJc;->e:Lcom/getcapacitor/PluginCall;

    invoke-static {v0, v1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->c(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V

    return-void

    :pswitch_0
    iget-object v0, p0, LJc;->d:Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    iget-object v1, p0, LJc;->e:Lcom/getcapacitor/PluginCall;

    invoke-static {v0, v1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->d(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V

    return-void

    :pswitch_1
    iget-object v0, p0, LJc;->d:Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;

    iget-object v1, p0, LJc;->e:Lcom/getcapacitor/PluginCall;

    invoke-static {v0, v1}, Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;->f(Lcom/capacitorjs/plugins/keyboard/KeyboardPlugin;Lcom/getcapacitor/PluginCall;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
