.class public final synthetic Lt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p4, p0, Lt3;->c:I

    iput-object p1, p0, Lt3;->d:Ljava/lang/Object;

    iput-object p2, p0, Lt3;->e:Ljava/lang/Object;

    iput-object p3, p0, Lt3;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, Lt3;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lt3;->e:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/Boolean;

    .line 9
    .line 10
    iget-object v1, p0, Lt3;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lcom/getcapacitor/PluginCall;

    .line 13
    .line 14
    iget-object v2, p0, Lt3;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;

    .line 17
    .line 18
    invoke-static {v2, v0, v1}, Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;->g(Lcom/capacitorjs/plugins/statusbar/StatusBarPlugin;Ljava/lang/Boolean;Lcom/getcapacitor/PluginCall;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_0
    iget-object v0, p0, Lt3;->e:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lt3;->f:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Landroid/webkit/ValueCallback;

    .line 29
    .line 30
    iget-object v2, p0, Lt3;->d:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;

    .line 33
    .line 34
    invoke-static {v2, v0, v1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;->a(Lcom/getcapacitor/cordova/MockCordovaWebViewImpl;Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_1
    iget-object v0, p0, Lt3;->d:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v0, Li0;

    .line 41
    .line 42
    iget-object v1, p0, Lt3;->e:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Lu6;

    .line 45
    .line 46
    iget-object v2, p0, Lt3;->f:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    :try_start_0
    iget-object v0, v0, Li0;->d:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v0, Landroid/content/Context;

    .line 56
    .line 57
    invoke-static {v0}, Llc;->i(Landroid/content/Context;)LQ8;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object v3, v0, LQ8;->a:Lm7;

    .line 64
    .line 65
    check-cast v3, LP8;

    .line 66
    .line 67
    iget-object v4, v3, LP8;->f:Ljava/lang/Object;

    .line 68
    .line 69
    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :try_start_1
    iput-object v2, v3, LP8;->h:Ljava/util/concurrent/Executor;

    .line 71
    .line 72
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 73
    :try_start_2
    iget-object v0, v0, LQ8;->a:Lm7;

    .line 74
    .line 75
    new-instance v3, Lo7;

    .line 76
    .line 77
    invoke-direct {v3, v1, v2}, Lo7;-><init>(Lu6;Ljava/util/concurrent/ThreadPoolExecutor;)V

    .line 78
    .line 79
    .line 80
    invoke-interface {v0, v3}, Lm7;->b(Lu6;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catchall_0
    move-exception v0

    .line 85
    goto :goto_0

    .line 86
    :catchall_1
    move-exception v0

    .line 87
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 88
    :try_start_4
    throw v0

    .line 89
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 90
    .line 91
    const-string v3, "EmojiCompat font provider not available on this device."

    .line 92
    .line 93
    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 97
    :goto_0
    invoke-virtual {v1, v0}, Lu6;->u(Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 101
    .line 102
    .line 103
    :goto_1
    return-void

    .line 104
    :pswitch_2
    iget-object v0, p0, Lt3;->e:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v0, Ljava/lang/String;

    .line 107
    .line 108
    iget-object v1, p0, Lt3;->f:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v1, Landroid/webkit/ValueCallback;

    .line 111
    .line 112
    iget-object v2, p0, Lt3;->d:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v2, Lcom/getcapacitor/Bridge;

    .line 115
    .line 116
    invoke-static {v2, v0, v1}, Lcom/getcapacitor/Bridge;->e(Lcom/getcapacitor/Bridge;Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    nop

    .line 121
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
