.class public final Lq8;
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
    iput-object p1, p0, Lq8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lq8;->j:Lcom/getcapacitor/PluginCall;

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
    invoke-virtual {p0, p2, p1}, Lq8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lq8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lq8;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lq8;

    .line 2
    .line 3
    iget-object v1, p0, Lq8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 4
    .line 5
    iget-object v2, p0, Lq8;->j:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lq8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lq8;->h:Ljava/lang/Object;

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
    iget v1, p0, Lq8;->g:I

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
    iget-object p1, p0, Lq8;->h:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, LOb;

    .line 32
    .line 33
    iget-object v1, p0, Lq8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput v2, p0, Lq8;->g:I

    .line 40
    .line 41
    invoke-virtual {v1, p1, p0}, LHa;->f(Llc;Lr5;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-ne p1, v0, :cond_2

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    :goto_0
    instance-of v0, p1, Log;

    .line 49
    .line 50
    xor-int/2addr v0, v2

    .line 51
    iget-object v1, p0, Lq8;->j:Lcom/getcapacitor/PluginCall;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    move-object v0, p1

    .line 56
    check-cast v0, Ljava/util/List;

    .line 57
    .line 58
    const-string v2, "list"

    .line 59
    .line 60
    invoke-static {v2, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Lcom/getcapacitor/JSObject;

    .line 64
    .line 65
    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v3, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-static {v0}, Lv4;->G(Ljava/lang/Iterable;)I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 75
    .line 76
    .line 77
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_3

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, LHb;

    .line 92
    .line 93
    invoke-static {v4}, LSi;->H(LHb;)Lcom/getcapacitor/JSObject;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    new-instance v0, Lcom/getcapacitor/JSArray;

    .line 102
    .line 103
    invoke-direct {v0, v3}, Lcom/getcapacitor/JSArray;-><init>(Ljava/util/Collection;)V

    .line 104
    .line 105
    .line 106
    const-string v3, "files"

    .line 107
    .line 108
    invoke-virtual {v2, v3, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x2

    .line 112
    invoke-static {v1, v2, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 113
    .line 114
    .line 115
    :cond_4
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    if-eqz p1, :cond_5

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v2, "getMethodName(...)"

    .line 126
    .line 127
    invoke-static {v2, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {v1, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    sget-object p1, Lfj;->a:Lfj;

    .line 138
    .line 139
    return-object p1
.end method
