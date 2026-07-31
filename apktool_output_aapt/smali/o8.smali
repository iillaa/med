.class public final Lo8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LO9;


# instance fields
.field public final synthetic g:I

.field public synthetic h:Ljava/lang/Throwable;

.field public final synthetic i:Lcom/getcapacitor/PluginCall;


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/PluginCall;Lr5;I)V
    .locals 0

    .line 1
    iput p3, p0, Lo8;->g:I

    iput-object p1, p0, Lo8;->i:Lcom/getcapacitor/PluginCall;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, LSh;-><init>(ILr5;)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lo8;->g:I

    .line 2
    .line 3
    check-cast p1, Lz8;

    .line 4
    .line 5
    check-cast p2, Ljava/lang/Throwable;

    .line 6
    .line 7
    check-cast p3, Lr5;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance p1, Lo8;

    .line 13
    .line 14
    iget-object v0, p0, Lo8;->i:Lcom/getcapacitor/PluginCall;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {p1, v0, p3, v1}, Lo8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p1, Lo8;->h:Ljava/lang/Throwable;

    .line 21
    .line 22
    sget-object p2, Lfj;->a:Lfj;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Lo8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return-object p2

    .line 28
    :pswitch_0
    new-instance p1, Lo8;

    .line 29
    .line 30
    iget-object v0, p0, Lo8;->i:Lcom/getcapacitor/PluginCall;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {p1, v0, p3, v1}, Lo8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 34
    .line 35
    .line 36
    iput-object p2, p1, Lo8;->h:Ljava/lang/Throwable;

    .line 37
    .line 38
    sget-object p2, Lfj;->a:Lfj;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lo8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    return-object p2

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lo8;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lo8;->h:Ljava/lang/Throwable;

    .line 10
    .line 11
    iget-object v0, p0, Lo8;->i:Lcom/getcapacitor/PluginCall;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "getMethodName(...)"

    .line 18
    .line 19
    invoke-static {v2, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {v0, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 27
    .line 28
    .line 29
    sget-object p1, Lfj;->a:Lfj;

    .line 30
    .line 31
    return-object p1

    .line 32
    :pswitch_0
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lo8;->h:Ljava/lang/Throwable;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    new-instance p1, Lcom/getcapacitor/JSObject;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v0, "data"

    .line 45
    .line 46
    const-string v1, ""

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x2

    .line 52
    iget-object v1, p0, Lo8;->i:Lcom/getcapacitor/PluginCall;

    .line 53
    .line 54
    invoke-static {v1, p1, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 55
    .line 56
    .line 57
    :cond_0
    sget-object p1, Lfj;->a:Lfj;

    .line 58
    .line 59
    return-object p1

    .line 60
    nop

    .line 61
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
