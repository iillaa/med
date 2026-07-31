.class public final Lu8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic i:LPb;

.field public final synthetic j:Lcom/getcapacitor/PluginCall;

.field public final synthetic k:LO9;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LO9;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 2
    .line 3
    iput-object p2, p0, Lu8;->i:LPb;

    .line 4
    .line 5
    iput-object p3, p0, Lu8;->j:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iput-object p4, p0, Lu8;->k:LO9;

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
    check-cast p1, LOb;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lu8;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lu8;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lu8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 7

    .line 1
    new-instance v6, Lu8;

    .line 2
    .line 3
    iget-object v3, p0, Lu8;->j:Lcom/getcapacitor/PluginCall;

    .line 4
    .line 5
    iget-object v4, p0, Lu8;->k:LO9;

    .line 6
    .line 7
    iget-object v1, p0, Lu8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 8
    .line 9
    iget-object v2, p0, Lu8;->i:LPb;

    .line 10
    .line 11
    move-object v0, v6

    .line 12
    move-object v5, p1

    .line 13
    invoke-direct/range {v0 .. v5}, Lu8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LO9;Lr5;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, v6, Lu8;->g:Ljava/lang/Object;

    .line 17
    .line 18
    return-object v6
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lu8;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, LOb;

    .line 7
    .line 8
    new-instance v0, Lt8;

    .line 9
    .line 10
    iget-object v1, p0, Lu8;->k:LO9;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, v1, p1, v2}, Lt8;-><init>(LO9;LOb;Lr5;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lu8;->h:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 17
    .line 18
    iget-object v1, p0, Lu8;->i:LPb;

    .line 19
    .line 20
    iget-object v2, p0, Lu8;->j:Lcom/getcapacitor/PluginCall;

    .line 21
    .line 22
    invoke-static {p1, v1, v2, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$runWithPermission(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Lfj;->a:Lfj;

    .line 26
    .line 27
    return-object p1
.end method
