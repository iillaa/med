.class public Lcom/getcapacitor/cordova/MockCordovaInterfaceImpl;
.super Lorg/apache/cordova/CordovaInterfaceImpl;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lm1;)V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/CordovaInterfaceImpl;-><init>(Lm1;Ljava/util/concurrent/ExecutorService;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getActivityResultCallback()LK5;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->activityResultCallback:LK5;

    .line 2
    .line 3
    return-object v0
.end method

.method public handlePermissionResult(I[Ljava/lang/String;[I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CordovaInterfaceImpl;->permissionResultCallbacks:LL3;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, v0, LL3;->b:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/util/Pair;

    .line 11
    .line 12
    iget-object v2, v0, LL3;->b:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object p1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, LK5;

    .line 23
    .line 24
    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p1, v0, p2, p3}, LK5;->onRequestPermissionResult(I[Ljava/lang/String;[I)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    return p1

    .line 37
    :cond_0
    const/4 p1, 0x0

    .line 38
    return p1

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    monitor-exit v0

    .line 41
    throw p1
.end method
