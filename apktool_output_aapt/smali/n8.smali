.class public final Ln8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Lcom/getcapacitor/PluginCall;


# direct methods
.method public constructor <init>(Lcom/getcapacitor/PluginCall;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln8;->h:Lcom/getcapacitor/PluginCall;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, LSh;-><init>(ILr5;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ln8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ln8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ln8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 2

    .line 1
    new-instance v0, Ln8;

    .line 2
    .line 3
    iget-object v1, p0, Ln8;->h:Lcom/getcapacitor/PluginCall;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ln8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, Ln8;->g:Ljava/lang/Object;

    .line 9
    .line 10
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ln8;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "readData"

    .line 9
    .line 10
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/getcapacitor/JSObject;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "data"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    const-string p1, "<this>"

    .line 24
    .line 25
    iget-object v1, p0, Ln8;->h:Lcom/getcapacitor/PluginCall;

    .line 26
    .line 27
    invoke-static {p1, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/getcapacitor/PluginCall;->setKeepAlive(Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 36
    .line 37
    .line 38
    sget-object p1, Lfj;->a:Lfj;

    .line 39
    .line 40
    return-object p1
.end method
