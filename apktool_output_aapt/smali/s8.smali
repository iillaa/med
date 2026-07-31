.class public final Ls8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:Ljava/lang/Object;

.field public h:I

.field public final synthetic i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic j:LPb;

.field public final synthetic k:Lcom/getcapacitor/PluginCall;

.field public final synthetic l:LN9;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LN9;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Ls8;->j:LPb;

    .line 4
    .line 5
    iput-object p3, p0, Ls8;->k:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iput-object p4, p0, Ls8;->l:LN9;

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-direct {p0, p1, p5}, LSh;-><init>(ILr5;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lh6;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ls8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ls8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ls8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 6

    .line 1
    new-instance p2, Ls8;

    .line 2
    .line 3
    iget-object v3, p0, Ls8;->k:Lcom/getcapacitor/PluginCall;

    .line 4
    .line 5
    iget-object v4, p0, Ls8;->l:LN9;

    .line 6
    .line 7
    iget-object v1, p0, Ls8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    iget-object v2, p0, Ls8;->j:LPb;

    .line 10
    .line 11
    move-object v0, p2

    .line 12
    move-object v5, p1

    .line 13
    invoke-direct/range {v0 .. v5}, Ls8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LN9;Lr5;)V

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, Ls8;->h:I

    .line 4
    .line 5
    iget-object v2, p0, Ls8;->k:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iget-object v3, p0, Ls8;->j:LPb;

    .line 8
    .line 9
    iget-object v4, p0, Ls8;->i:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 10
    .line 11
    const/4 v5, 0x2

    .line 12
    const/4 v6, 0x1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    if-eq v1, v6, :cond_1

    .line 16
    .line 17
    if-ne v1, v5, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ls8;->g:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 26
    .line 27
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 28
    .line 29
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p1

    .line 33
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    check-cast p1, Lpg;

    .line 37
    .line 38
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v4}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput v6, p0, Ls8;->h:I

    .line 49
    .line 50
    invoke-virtual {p1, v3, p0}, LHa;->d(LPb;Lr5;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-ne p1, v0, :cond_3

    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_3
    :goto_0
    instance-of v1, p1, Log;

    .line 58
    .line 59
    xor-int/2addr v1, v6

    .line 60
    if-eqz v1, :cond_7

    .line 61
    .line 62
    move-object v1, p1

    .line 63
    check-cast v1, LOb;

    .line 64
    .line 65
    invoke-virtual {v1}, LOb;->Q()Z

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    if-eqz v7, :cond_5

    .line 70
    .line 71
    iget-object v3, v3, LPb;->l:Lpb;

    .line 72
    .line 73
    if-nez v3, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    const/4 v6, 0x0

    .line 77
    :goto_1
    invoke-static {v4, v6}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$isStoragePermissionGranted(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Z)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-nez v3, :cond_5

    .line 82
    .line 83
    const-string v0, "permissionCallback"

    .line 84
    .line 85
    invoke-static {v4, v2, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$requestAllPermissions(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_5
    iput-object p1, p0, Ls8;->g:Ljava/lang/Object;

    .line 90
    .line 91
    iput v5, p0, Ls8;->h:I

    .line 92
    .line 93
    iget-object v3, p0, Ls8;->l:LN9;

    .line 94
    .line 95
    invoke-interface {v3, v1, p0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    if-ne v1, v0, :cond_6

    .line 100
    .line 101
    return-object v0

    .line 102
    :cond_6
    move-object v0, p1

    .line 103
    :goto_2
    move-object p1, v0

    .line 104
    :cond_7
    :goto_3
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    if-eqz p1, :cond_8

    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "getMethodName(...)"

    .line 115
    .line 116
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {v2, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 124
    .line 125
    .line 126
    :cond_8
    sget-object p1, Lfj;->a:Lfj;

    .line 127
    .line 128
    return-object p1
.end method
