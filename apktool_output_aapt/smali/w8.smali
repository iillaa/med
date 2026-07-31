.class public final Lw8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic j:LTk;

.field public final synthetic k:Lcom/getcapacitor/PluginCall;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LTk;Lcom/getcapacitor/PluginCall;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lw8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lw8;->j:LTk;

    .line 4
    .line 5
    iput-object p3, p0, Lw8;->k:Lcom/getcapacitor/PluginCall;

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
    invoke-virtual {p0, p2, p1}, Lw8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lw8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lw8;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lw8;

    .line 2
    .line 3
    iget-object v1, p0, Lw8;->j:LTk;

    .line 4
    .line 5
    iget-object v2, p0, Lw8;->k:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iget-object v3, p0, Lw8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lw8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LTk;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lw8;->h:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, Lw8;->g:I

    .line 4
    .line 5
    iget-object v2, p0, Lw8;->j:LTk;

    .line 6
    .line 7
    iget-object v3, p0, Lw8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    if-ne v1, v4, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lw8;->h:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, LOb;

    .line 17
    .line 18
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    check-cast p1, Lpg;

    .line 22
    .line 23
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 27
    .line 28
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p1

    .line 34
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lw8;->h:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p1, LOb;

    .line 40
    .line 41
    invoke-static {v3}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v5, v2, LTk;->b:LLb;

    .line 46
    .line 47
    iput-object p1, p0, Lw8;->h:Ljava/lang/Object;

    .line 48
    .line 49
    iput v4, p0, Lw8;->g:I

    .line 50
    .line 51
    invoke-virtual {v1, p1, v5, p0}, LHa;->i(Llc;LLb;Lr5;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-ne v1, v0, :cond_2

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_2
    move-object v0, p1

    .line 59
    move-object p1, v1

    .line 60
    :goto_0
    nop

    .line 61
    instance-of v1, p1, Log;

    .line 62
    .line 63
    xor-int/2addr v1, v4

    .line 64
    iget-object v4, p0, Lw8;->k:Lcom/getcapacitor/PluginCall;

    .line 65
    .line 66
    if-eqz v1, :cond_5

    .line 67
    .line 68
    move-object v1, p1

    .line 69
    check-cast v1, Landroid/net/Uri;

    .line 70
    .line 71
    invoke-virtual {v0}, LOb;->Q()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/4 v5, 0x0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    filled-new-array {v0}, [Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v3, v0, v5, v5}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-object v0, v2, LTk;->b:LLb;

    .line 96
    .line 97
    iget-object v0, v0, LLb;->c:LKb;

    .line 98
    .line 99
    const-string v2, "uri"

    .line 100
    .line 101
    invoke-static {v2, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    const-string v2, "mode"

    .line 105
    .line 106
    invoke-static {v2, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    sget-object v2, LKb;->d:LKb;

    .line 110
    .line 111
    if-ne v0, v2, :cond_4

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    invoke-static {v1}, LSi;->m(Landroid/net/Uri;)Lcom/getcapacitor/JSObject;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    :goto_1
    const/4 v0, 0x2

    .line 119
    invoke-static {v4, v5, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 120
    .line 121
    .line 122
    :cond_5
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    if-eqz p1, :cond_6

    .line 127
    .line 128
    invoke-virtual {v4}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v1, "getMethodName(...)"

    .line 133
    .line 134
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {v4, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 142
    .line 143
    .line 144
    :cond_6
    sget-object p1, Lfj;->a:Lfj;

    .line 145
    .line 146
    return-object p1
.end method
