.class public final Lm8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic j:LRf;

.field public final synthetic k:Lcom/getcapacitor/PluginCall;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LRf;Lcom/getcapacitor/PluginCall;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lm8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lm8;->j:LRf;

    .line 4
    .line 5
    iput-object p3, p0, Lm8;->k:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, LSh;-><init>(ILr5;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LOb;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lm8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lm8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lm8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 4

    .line 1
    new-instance v0, Lm8;

    .line 2
    .line 3
    iget-object v1, p0, Lm8;->j:LRf;

    .line 4
    .line 5
    iget-object v2, p0, Lm8;->k:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iget-object v3, p0, Lm8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lm8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LRf;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lm8;->h:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, Lm8;->g:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    check-cast p1, Lpg;

    .line 14
    .line 15
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 19
    .line 20
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 21
    .line 22
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p1

    .line 26
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lm8;->h:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, LOb;

    .line 32
    .line 33
    iget-object v1, p0, Lm8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v3, p0, Lm8;->j:LRf;

    .line 40
    .line 41
    iget-object v3, v3, LRf;->b:LJb;

    .line 42
    .line 43
    iput v2, p0, Lm8;->g:I

    .line 44
    .line 45
    invoke-virtual {v1, p1, v3, p0}, LHa;->h(Llc;LJb;Lr5;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-ne p1, v0, :cond_2

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_2
    :goto_0
    instance-of v0, p1, Log;

    .line 53
    .line 54
    xor-int/2addr v0, v2

    .line 55
    iget-object v1, p0, Lm8;->k:Lcom/getcapacitor/PluginCall;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    move-object v0, p1

    .line 60
    check-cast v0, Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "readData"

    .line 63
    .line 64
    invoke-static {v2, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Lcom/getcapacitor/JSObject;

    .line 68
    .line 69
    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v3, "data"

    .line 73
    .line 74
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x2

    .line 78
    invoke-static {v1, v2, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 79
    .line 80
    .line 81
    :cond_3
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const-string v2, "getMethodName(...)"

    .line 92
    .line 93
    invoke-static {v2, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {v1, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 101
    .line 102
    .line 103
    :cond_4
    sget-object p1, Lfj;->a:Lfj;

    .line 104
    .line 105
    return-object p1
.end method
