.class public final Lye;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/util/LinkedList;

.field public final c:Ljava/util/ArrayList;

.field public d:Lve;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lye;->c:Ljava/util/ArrayList;

    .line 17
    .line 18
    return-void
.end method

.method public static c(Lwe;Ljava/lang/StringBuilder;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lwe;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x20

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lwe;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lwe;->b:Lrf;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/16 p0, 0x4a

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    goto :goto_4

    .line 28
    :cond_0
    iget v2, p0, Lrf;->a:I

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, 0x1

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    move v5, v4

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v5, v3

    .line 37
    :goto_0
    if-ne v2, v4, :cond_2

    .line 38
    .line 39
    move v3, v4

    .line 40
    :cond_2
    iget-boolean v4, p0, Lrf;->c:Z

    .line 41
    .line 42
    if-nez v5, :cond_4

    .line 43
    .line 44
    if-eqz v3, :cond_3

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    const/16 v3, 0x46

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_4
    :goto_1
    const/16 v3, 0x53

    .line 51
    .line 52
    :goto_2
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    if-eqz v4, :cond_5

    .line 56
    .line 57
    const/16 v3, 0x31

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_5
    const/16 v3, 0x30

    .line 61
    .line 62
    :goto_3
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-static {p1, p0}, Lwe;->e(Ljava/lang/StringBuilder;Lrf;)V

    .line 78
    .line 79
    .line 80
    :goto_4
    return-void
.end method


# virtual methods
.method public final a(Lrf;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/lang/Throwable;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/Throwable;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string p2, "JsMessageQueue"

    .line 9
    .line 10
    const-string v0, "Got plugin result with no callbackId"

    .line 11
    .line 12
    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget v0, p1, Lrf;->a:I

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    iget-boolean v1, p1, Lrf;->c:Z

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    new-instance v0, Lwe;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2}, Lwe;-><init>(Lrf;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lye;->b(Lwe;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final b(Lwe;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lye;->d:Lve;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p0, Lye;->a:Z

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lye;->d:Lve;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lve;->onNativeToJsMessageAvailable(Lye;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p1
.end method

.method public final d(Z)Ljava/lang/String;
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lye;->d:Lve;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-object v1

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    goto :goto_3

    .line 11
    :cond_0
    invoke-virtual {v0, p0, p1}, Lve;->notifyOfFlush(Lye;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lye;->b:Ljava/util/LinkedList;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-object v1

    .line 24
    :cond_1
    iget-object p1, p0, Lye;->b:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    move v1, v0

    .line 32
    move v2, v1

    .line 33
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_3

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lwe;

    .line 44
    .line 45
    invoke-virtual {v3}, Lwe;->b()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    add-int/2addr v4, v3

    .line 58
    add-int/lit8 v4, v4, 0x1

    .line 59
    .line 60
    if-lez v1, :cond_2

    .line 61
    .line 62
    add-int v3, v2, v4

    .line 63
    .line 64
    const/high16 v5, 0x1000000

    .line 65
    .line 66
    if-le v3, v5, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    add-int/2addr v2, v4

    .line 70
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 76
    .line 77
    .line 78
    :goto_2
    if-ge v0, v1, :cond_4

    .line 79
    .line 80
    iget-object v2, p0, Lye;->b:Ljava/util/LinkedList;

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Lwe;

    .line 87
    .line 88
    invoke-static {v2, p1}, Lye;->c(Lwe;Ljava/lang/StringBuilder;)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_5

    .line 101
    .line 102
    const/16 v0, 0x2a

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    :cond_5
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    monitor-exit p0

    .line 112
    return-object p1

    .line 113
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    throw p1
.end method

.method public final e()Ljava/lang/String;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    const/4 v0, 0x0

    .line 12
    return-object v0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto/16 :goto_7

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    move v2, v1

    .line 24
    move v3, v2

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_2

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lwe;

    .line 36
    .line 37
    invoke-virtual {v4}, Lwe;->b()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    add-int/lit8 v4, v4, 0x32

    .line 42
    .line 43
    if-lez v2, :cond_1

    .line 44
    .line 45
    add-int v5, v3, v4

    .line 46
    .line 47
    const/high16 v6, 0x1000000

    .line 48
    .line 49
    if-le v5, v6, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    add-int/2addr v3, v4

    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    :goto_1
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-ne v2, v0, :cond_3

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    move v0, v1

    .line 67
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    move v5, v1

    .line 72
    goto :goto_3

    .line 73
    :cond_4
    const/16 v5, 0x64

    .line 74
    .line 75
    :goto_3
    add-int/2addr v3, v5

    .line 76
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 77
    .line 78
    .line 79
    :goto_4
    if-ge v1, v2, :cond_6

    .line 80
    .line 81
    iget-object v3, p0, Lye;->b:Ljava/util/LinkedList;

    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lwe;

    .line 88
    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    add-int/lit8 v5, v1, 0x1

    .line 92
    .line 93
    if-ne v5, v2, :cond_5

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Lwe;->d(Ljava/lang/StringBuilder;)V

    .line 96
    .line 97
    .line 98
    goto :goto_5

    .line 99
    :cond_5
    const-string v5, "try{"

    .line 100
    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v4}, Lwe;->d(Ljava/lang/StringBuilder;)V

    .line 105
    .line 106
    .line 107
    const-string v3, "}finally{"

    .line 108
    .line 109
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    :goto_5
    add-int/lit8 v1, v1, 0x1

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_6
    if-nez v0, :cond_7

    .line 116
    .line 117
    const-string v1, "window.setTimeout(function(){cordova.require(\'cordova/plugin/android/polling\').pollOnce();},0);"

    .line 118
    .line 119
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    :cond_7
    :goto_6
    if-ge v0, v2, :cond_8

    .line 123
    .line 124
    const/16 v1, 0x7d

    .line 125
    .line 126
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    add-int/lit8 v0, v0, 0x1

    .line 130
    .line 131
    goto :goto_6

    .line 132
    :cond_8
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    monitor-exit p0

    .line 137
    return-object v0

    .line 138
    :goto_7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    throw v0
.end method

.method public final f(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-lt p1, v0, :cond_3

    .line 3
    .line 4
    iget-object v0, p0, Lye;->c:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lt p1, v0, :cond_0

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_0
    if-gez p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lye;->c:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lve;

    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Lye;->d:Lve;

    .line 26
    .line 27
    if-eq p1, v0, :cond_3

    .line 28
    .line 29
    monitor-enter p0

    .line 30
    :try_start_0
    iput-object p1, p0, Lye;->d:Lve;

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lve;->reset()V

    .line 35
    .line 36
    .line 37
    iget-boolean v0, p0, Lye;->a:Z

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Lye;->b:Ljava/util/LinkedList;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lve;->onNativeToJsMessageAvailable(Lye;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    :goto_1
    monitor-exit p0

    .line 56
    goto :goto_3

    .line 57
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p1

    .line 59
    :cond_3
    :goto_3
    return-void
.end method

.method public final g(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lye;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "JsMessageQueue"

    .line 8
    .line 9
    const-string v1, "nested call to setPaused detected."

    .line 10
    .line 11
    new-instance v2, Ljava/lang/Throwable;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    iput-boolean p1, p0, Lye;->a:Z

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    iget-object p1, p0, Lye;->b:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lye;->d:Lve;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lve;->onNativeToJsMessageAvailable(Lye;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_2
    :goto_2
    return-void
.end method
