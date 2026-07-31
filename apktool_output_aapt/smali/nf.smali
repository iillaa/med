.class public final synthetic Lnf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw0;
.implements Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lnf;->a:I

    iput-object p1, p0, Lnf;->b:Ljava/lang/Object;

    iput-object p3, p0, Lnf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lnf;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lnf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/reflect/Method;

    check-cast p1, Ljava/util/Map;

    iget-object v1, p0, Lnf;->b:Ljava/lang/Object;

    check-cast v1, Lcom/getcapacitor/Plugin;

    invoke-static {v1, v0, p1}, Lcom/getcapacitor/Plugin;->b(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Ljava/util/Map;)V

    return-void

    :pswitch_0
    iget-object v0, p0, Lnf;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/reflect/Method;

    check-cast p1, Lv0;

    iget-object v1, p0, Lnf;->b:Ljava/lang/Object;

    check-cast v1, Lcom/getcapacitor/Plugin;

    invoke-static {v1, v0, p1}, Lcom/getcapacitor/Plugin;->a(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Lv0;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public emit(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lnf;->b:Ljava/lang/Object;

    check-cast v0, Lcom/getcapacitor/PluginCall;

    iget-object v1, p0, Lnf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    invoke-static {v0, v1, p1, p2}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->c(Lcom/getcapacitor/PluginCall;Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method
