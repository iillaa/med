.class public Lorg/apache/cordova/ResumeCallback;
.super LK3;
.source "SourceFile"


# instance fields
.field public final d:Ljava/lang/String;

.field public final e:Lqf;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lqf;)V
    .locals 2

    .line 1
    const-string v0, "resumecallback"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, LK3;-><init>(Ljava/lang/String;LP5;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lorg/apache/cordova/ResumeCallback;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lorg/apache/cordova/ResumeCallback;->e:Lqf;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public sendPluginResult(Lrf;)V
    .locals 5

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
    goto :goto_1

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, LK3;->c:Z

    .line 15
    .line 16
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    new-instance v0, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 25
    .line 26
    .line 27
    :try_start_1
    const-string v2, "pluginServiceName"

    .line 28
    .line 29
    iget-object v3, p0, Lorg/apache/cordova/ResumeCallback;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string v2, "pluginStatus"

    .line 35
    .line 36
    sget-object v3, Lrf;->g:[Ljava/lang/String;

    .line 37
    .line 38
    iget v4, p1, Lrf;->a:I

    .line 39
    .line 40
    aget-object v3, v3, v4

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    const-string v2, "action"

    .line 46
    .line 47
    const-string v3, "resume"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    const-string v2, "pendingResult"

    .line 53
    .line 54
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    const-string v1, "CordovaResumeCallback"

    .line 59
    .line 60
    const-string v2, "Unable to create resume object for Activity Result"

    .line 61
    .line 62
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    :goto_0
    new-instance v1, Lrf;

    .line 66
    .line 67
    const/4 v2, 0x2

    .line 68
    invoke-direct {v1, v2, v0}, Lrf;-><init>(ILorg/json/JSONObject;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lorg/apache/cordova/ResumeCallback;->e:Lqf;

    .line 83
    .line 84
    const-string v1, "CoreAndroid"

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Lqf;->d(Ljava/lang/String;)LK5;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lorg/apache/cordova/CoreAndroid;

    .line 91
    .line 92
    new-instance v1, Lrf;

    .line 93
    .line 94
    invoke-direct {v1, v0}, Lrf;-><init>(Ljava/util/ArrayList;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v1}, Lorg/apache/cordova/CoreAndroid;->sendResumeEvent(Lrf;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 102
    throw p1
.end method
