.class public final LMc;
.super LKc;
.source "SourceFile"

# interfaces
.implements Ly9;


# instance fields
.field public final synthetic d:LNc;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/getcapacitor/PluginCall;

.field public final synthetic g:Lcom/getcapacitor/Bridge;

.field public final synthetic h:Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;

.field public final synthetic i:Landroid/os/Handler;

.field public final synthetic j:LN2;


# direct methods
.method public constructor <init>(LNc;Ljava/lang/String;Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lnf;Landroid/os/Handler;LN2;)V
    .locals 0

    .line 1
    iput-object p1, p0, LMc;->d:LNc;

    .line 2
    .line 3
    iput-object p2, p0, LMc;->e:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, LMc;->f:Lcom/getcapacitor/PluginCall;

    .line 6
    .line 7
    iput-object p4, p0, LMc;->g:Lcom/getcapacitor/Bridge;

    .line 8
    .line 9
    iput-object p5, p0, LMc;->h:Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;

    .line 10
    .line 11
    iput-object p6, p0, LMc;->i:Landroid/os/Handler;

    .line 12
    .line 13
    iput-object p7, p0, LMc;->j:LN2;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-direct {p0, p1}, LKc;-><init>(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, LMc;->j:LN2;

    .line 2
    .line 3
    iget-object v1, p0, LMc;->i:Landroid/os/Handler;

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, LMc;->d:LNc;

    .line 6
    .line 7
    iget-object v3, p0, LMc;->e:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, LMc;->f:Lcom/getcapacitor/PluginCall;

    .line 10
    .line 11
    iget-object v5, p0, LMc;->g:Lcom/getcapacitor/Bridge;

    .line 12
    .line 13
    iget-object v6, p0, LMc;->h:Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;

    .line 14
    .line 15
    invoke-static {v2, v3, v4, v5, v6}, LNc;->a(LNc;Ljava/lang/String;Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;)Lcom/getcapacitor/JSObject;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, LQ2;

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    invoke-direct {v3, v0, v4, v2}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v2

    .line 30
    new-instance v3, LQ2;

    .line 31
    .line 32
    const/4 v4, 0x3

    .line 33
    invoke-direct {v3, v0, v4, v2}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    :goto_0
    sget-object v0, Lfj;->a:Lfj;

    .line 40
    .line 41
    return-object v0
.end method
