.class public LK3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:LP5;

.field public c:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LP5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LK3;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LK3;->b:LP5;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public error(I)V
    .locals 2

    .line 1
    new-instance v0, Lrf;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p1}, Lrf;-><init>(II)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 2

    .line 2
    new-instance v0, Lrf;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Lrf;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public error(Lorg/json/JSONObject;)V
    .locals 2

    .line 3
    new-instance v0, Lrf;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p1}, Lrf;-><init>(ILorg/json/JSONObject;)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public getCallbackId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, LK3;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public isChangingThreads()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public isFinished()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, LK3;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public sendPluginResult(Lrf;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, LK3;->c:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lrf;->a()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-boolean v0, p1, Lrf;->c:Z

    .line 14
    .line 15
    xor-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    iput-boolean v0, p0, LK3;->c:Z

    .line 18
    .line 19
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    iget-object v0, p0, LK3;->b:LP5;

    .line 21
    .line 22
    iget-object v1, p0, LK3;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v0, p1, v1}, LP5;->sendPluginResult(Lrf;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method

.method public success()V
    .locals 2

    .line 1
    new-instance v0, Lrf;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lrf;-><init>(I)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public success(I)V
    .locals 2

    .line 2
    new-instance v0, Lrf;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p1}, Lrf;-><init>(II)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 2

    .line 3
    new-instance v0, Lrf;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v1}, Lrf;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public success(Lorg/json/JSONArray;)V
    .locals 1

    .line 4
    new-instance v0, Lrf;

    invoke-direct {v0, p1}, Lrf;-><init>(Lorg/json/JSONArray;)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 2

    .line 5
    new-instance v0, Lrf;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p1}, Lrf;-><init>(ILorg/json/JSONObject;)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method

.method public success([B)V
    .locals 1

    .line 6
    new-instance v0, Lrf;

    invoke-direct {v0, p1}, Lrf;-><init>([B)V

    invoke-virtual {p0, v0}, LK3;->sendPluginResult(Lrf;)V

    return-void
.end method
