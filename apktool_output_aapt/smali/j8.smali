.class public final Lj8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic j:Lcom/getcapacitor/PluginCall;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lj8;->j:Lcom/getcapacitor/PluginCall;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, LSh;-><init>(ILr5;)V

    .line 7
    .line 8
    .line 9
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
    invoke-virtual {p0, p2, p1}, Lj8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lj8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lj8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 3

    .line 1
    new-instance v0, Lj8;

    .line 2
    .line 3
    iget-object v1, p0, Lj8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 4
    .line 5
    iget-object v2, p0, Lj8;->j:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lj8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lj8;->h:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, Lj8;->g:I

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
    iget-object p1, p0, Lj8;->h:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, LOb;

    .line 32
    .line 33
    iget-object v1, p0, Lj8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v3, LJa;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-direct {v3, v4}, LJa;-><init>(Z)V

    .line 43
    .line 44
    .line 45
    iput v2, p0, Lj8;->g:I

    .line 46
    .line 47
    invoke-virtual {v1, p1, v3, p0}, LHa;->c(Llc;LJa;Lr5;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-ne p1, v0, :cond_2

    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_2
    :goto_0
    instance-of v0, p1, Log;

    .line 55
    .line 56
    xor-int/2addr v0, v2

    .line 57
    iget-object v1, p0, Lj8;->j:Lcom/getcapacitor/PluginCall;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    move-object v0, p1

    .line 62
    check-cast v0, Lfj;

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-static {v1, v2, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v2, "getMethodName(...)"

    .line 80
    .line 81
    invoke-static {v2, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {v1, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 89
    .line 90
    .line 91
    :cond_4
    sget-object p1, Lfj;->a:Lfj;

    .line 92
    .line 93
    return-object p1
.end method
