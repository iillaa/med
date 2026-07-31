.class public final Lp8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic i:LQf;

.field public final synthetic j:Lcom/getcapacitor/PluginCall;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LQf;Lcom/getcapacitor/PluginCall;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lp8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lp8;->i:LQf;

    .line 4
    .line 5
    iput-object p3, p0, Lp8;->j:Lcom/getcapacitor/PluginCall;

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
    invoke-virtual {p0, p2, p1}, Lp8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lp8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lp8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 4

    .line 1
    new-instance v0, Lp8;

    .line 2
    .line 3
    iget-object v1, p0, Lp8;->i:LQf;

    .line 4
    .line 5
    iget-object v2, p0, Lp8;->j:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iget-object v3, p0, Lp8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lp8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LQf;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lp8;->g:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lp8;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, LOb;

    .line 7
    .line 8
    iget-object v0, p0, Lp8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lp8;->i:LQf;

    .line 15
    .line 16
    iget-object v2, v2, LQf;->b:LIb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    const-string v3, "uri"

    .line 22
    .line 23
    invoke-static {v3, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const-string v3, "options"

    .line 27
    .line 28
    invoke-static {v3, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    new-instance v3, LFa;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-direct {v3, v1, p1, v2, v4}, LFa;-><init>(LHa;Llc;LIb;Lr5;)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Li0;

    .line 38
    .line 39
    const/16 v1, 0x11

    .line 40
    .line 41
    invoke-direct {p1, v1, v3}, Li0;-><init>(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ln8;

    .line 45
    .line 46
    iget-object v2, p0, Lp8;->j:Lcom/getcapacitor/PluginCall;

    .line 47
    .line 48
    invoke-direct {v1, v2, v4}, Ln8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, LY1;

    .line 52
    .line 53
    const/16 v5, 0x8

    .line 54
    .line 55
    invoke-direct {v3, p1, v5, v1}, LY1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    new-instance p1, Lo8;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-direct {p1, v2, v4, v1}, Lo8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 62
    .line 63
    .line 64
    new-instance v1, LE8;

    .line 65
    .line 66
    invoke-direct {v1, v3, p1}, LE8;-><init>(LY1;Lo8;)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Lo8;

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    invoke-direct {p1, v2, v4, v3}, Lo8;-><init>(Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 73
    .line 74
    .line 75
    new-instance v2, LY1;

    .line 76
    .line 77
    const/4 v3, 0x7

    .line 78
    invoke-direct {v2, v1, v3, p1}, LY1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getCoroutineScope(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)Lh6;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v0, LB8;

    .line 86
    .line 87
    invoke-direct {v0, v2, v4}, LB8;-><init>(Ly8;Lr5;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, v0}, LMk;->z(Lh6;LN9;)Luh;

    .line 91
    .line 92
    .line 93
    sget-object p1, Lfj;->a:Lfj;

    .line 94
    .line 95
    return-object p1
.end method
