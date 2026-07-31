.class public Lorg/apache/cordova/CoreAndroid;
.super LK5;
.source "SourceFile"


# static fields
.field public static final PLUGIN_NAME:Ljava/lang/String; = "CoreAndroid"


# instance fields
.field public b:LI1;

.field public c:LK3;

.field public d:Lrf;

.field public e:Lrf;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apache/cordova/CoreAndroid;->f:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method

.method public static getBuildConfigValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".BuildConfig"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_0

    :catch_2
    move-exception p0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :catch_3
    return-object v0
.end method


# virtual methods
.method public backHistory()V
    .locals 3

    iget-object v0, p0, LK5;->cordova:LI5;

    invoke-interface {v0}, LI5;->getActivity()Lm1;

    move-result-object v0

    new-instance v1, LV5;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, LV5;-><init>(Lorg/apache/cordova/CoreAndroid;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public clearCache()V
    .locals 3

    iget-object v0, p0, LK5;->cordova:LI5;

    invoke-interface {v0}, LI5;->getActivity()Lm1;

    move-result-object v0

    new-instance v1, LV5;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, LV5;-><init>(Lorg/apache/cordova/CoreAndroid;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public clearHistory()V
    .locals 3

    iget-object v0, p0, LK5;->cordova:LI5;

    invoke-interface {v0}, LI5;->getActivity()Lm1;

    move-result-object v0

    new-instance v1, LV5;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, LV5;-><init>(Lorg/apache/cordova/CoreAndroid;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;LK3;)Z
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    const-string v2, "clearCache"

    .line 5
    .line 6
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->clearCache()V

    .line 14
    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_0
    const-string v2, "show"

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, LK5;->cordova:LI5;

    .line 27
    .line 28
    invoke-interface {p1}, LI5;->getActivity()Lm1;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, LV5;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-direct {p2, p0, v2}, LV5;-><init>(Lorg/apache/cordova/CoreAndroid;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    goto/16 :goto_2

    .line 42
    .line 43
    :cond_1
    const-string v2, "loadUrl"

    .line 44
    .line 45
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/CoreAndroid;->loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 60
    .line 61
    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :cond_2
    const-string v2, "cancelLoadUrl"

    .line 65
    .line 66
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    goto/16 :goto_2

    .line 73
    .line 74
    :cond_3
    const-string v2, "clearHistory"

    .line 75
    .line 76
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_4

    .line 81
    .line 82
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->clearHistory()V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_2

    .line 86
    .line 87
    :cond_4
    const-string v2, "backHistory"

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_5

    .line 94
    .line 95
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->backHistory()V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_5
    const-string v2, "overrideButton"

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_6

    .line 106
    .line 107
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getBoolean(I)Z

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/CoreAndroid;->overrideButton(Ljava/lang/String;Z)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_6
    const-string v2, "overrideBackbutton"

    .line 120
    .line 121
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v2, :cond_7

    .line 126
    .line 127
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->getBoolean(I)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CoreAndroid;->overrideBackbutton(Z)V

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_7
    const-string p2, "exitApp"

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_8

    .line 142
    .line 143
    invoke-virtual {p0}, Lorg/apache/cordova/CoreAndroid;->exitApp()V

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_8
    const-string p2, "messageChannel"

    .line 148
    .line 149
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_d

    .line 154
    .line 155
    iget-object p1, p0, Lorg/apache/cordova/CoreAndroid;->f:Ljava/lang/Object;

    .line 156
    .line 157
    monitor-enter p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :try_start_1
    iput-object p3, p0, Lorg/apache/cordova/CoreAndroid;->c:LK3;

    .line 159
    .line 160
    iget-object p2, p0, Lorg/apache/cordova/CoreAndroid;->e:Lrf;

    .line 161
    .line 162
    const/4 v0, 0x0

    .line 163
    if-eqz p2, :cond_a

    .line 164
    .line 165
    iput-boolean v3, p2, Lrf;->c:Z

    .line 166
    .line 167
    if-eqz p3, :cond_9

    .line 168
    .line 169
    invoke-virtual {p3, p2}, LK3;->sendPluginResult(Lrf;)V

    .line 170
    .line 171
    .line 172
    :cond_9
    iput-object v0, p0, Lorg/apache/cordova/CoreAndroid;->e:Lrf;

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :catchall_0
    move-exception p2

    .line 176
    goto :goto_1

    .line 177
    :cond_a
    :goto_0
    iget-object p2, p0, Lorg/apache/cordova/CoreAndroid;->d:Lrf;

    .line 178
    .line 179
    if-eqz p2, :cond_c

    .line 180
    .line 181
    iput-boolean v3, p2, Lrf;->c:Z

    .line 182
    .line 183
    iget-object v2, p0, Lorg/apache/cordova/CoreAndroid;->c:LK3;

    .line 184
    .line 185
    if-eqz v2, :cond_b

    .line 186
    .line 187
    invoke-virtual {v2, p2}, LK3;->sendPluginResult(Lrf;)V

    .line 188
    .line 189
    .line 190
    :cond_b
    iput-object v0, p0, Lorg/apache/cordova/CoreAndroid;->d:Lrf;

    .line 191
    .line 192
    :cond_c
    monitor-exit p1

    .line 193
    return v3

    .line 194
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    :try_start_2
    throw p2

    .line 196
    :cond_d
    :goto_2
    new-instance p1, Lrf;

    .line 197
    .line 198
    const/4 p2, 0x2

    .line 199
    invoke-direct {p1, v0, p2}, Lrf;-><init>(Ljava/lang/String;I)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p3, p1}, LK3;->sendPluginResult(Lrf;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 203
    .line 204
    .line 205
    return v3

    .line 206
    :catch_0
    new-instance p1, Lrf;

    .line 207
    .line 208
    const/16 p2, 0x9

    .line 209
    .line 210
    invoke-direct {p1, p2}, Lrf;-><init>(I)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p3, p1}, LK3;->sendPluginResult(Lrf;)V

    .line 214
    .line 215
    .line 216
    return v1
.end method

.method public exitApp()V
    .locals 3

    iget-object v0, p0, LK5;->webView:LP5;

    invoke-interface {v0}, LP5;->getPluginManager()Lqf;

    move-result-object v0

    const-string v1, "exit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public fireJavascriptEvent(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "action"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception v1

    .line 13
    const-string v2, "CordovaApp"

    .line 14
    .line 15
    const-string v3, "Failed to create event message"

    .line 16
    .line 17
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    .line 19
    .line 20
    :goto_0
    new-instance v1, Lrf;

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-direct {v1, v2, v0}, Lrf;-><init>(ILorg/json/JSONObject;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->c:LK3;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const-string v0, "pause"

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iput-object v1, p0, Lorg/apache/cordova/CoreAndroid;->e:Lrf;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    const-string v0, "resume"

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lorg/apache/cordova/CoreAndroid;->e:Lrf;

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, v1, Lrf;->c:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, v1}, LK3;->sendPluginResult(Lrf;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_1
    return-void
.end method

.method public isBackbuttonOverridden()Z
    .locals 2

    iget-object v0, p0, LK5;->webView:LP5;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, LP5;->isButtonPlumbedToJs(I)Z

    move-result v0

    return v0
.end method

.method public loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 10

    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    if-eqz p2, :cond_8

    invoke-virtual {p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v2

    move v3, v1

    move v4, v3

    move v5, v4

    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v1, v6, :cond_7

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "wait"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_2

    :cond_0
    const-string v7, "openexternal"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    goto :goto_2

    :cond_1
    const-string v7, "clearhistory"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    goto :goto_2

    :cond_2
    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    check-cast v7, Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/Boolean;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    check-cast v7, Ljava/lang/Boolean;

    goto :goto_1

    :cond_5
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/Integer;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    check-cast v7, Ljava/lang/Integer;

    goto :goto_1

    :cond_6
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_7
    move v1, v3

    goto :goto_3

    :cond_8
    move v4, v1

    move v5, v4

    :goto_3
    if-lez v1, :cond_9

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v1, v1

    :try_start_1
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V

    monitor-exit p0

    goto :goto_4

    :catchall_0
    move-exception p2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_9
    :goto_4
    iget-object p2, p0, LK5;->webView:LP5;

    invoke-interface {p2, p1, v4, v5, v0}, LP5;->showWebPage(Ljava/lang/String;ZZLjava/util/Map;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, LK5;->webView:LP5;

    invoke-interface {v0}, LP5;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/cordova/CoreAndroid;->b:LI1;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public overrideBackbutton(Z)V
    .locals 2

    iget-object v0, p0, LK5;->webView:LP5;

    const/4 v1, 0x4

    invoke-interface {v0, v1, p1}, LP5;->setButtonPlumbedToJs(IZ)V

    return-void
.end method

.method public overrideButton(Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "volumeup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, LK5;->webView:LP5;

    const/16 v0, 0x18

    :goto_0
    invoke-interface {p1, v0, p2}, LP5;->setButtonPlumbedToJs(IZ)V

    goto :goto_1

    :cond_0
    const-string v0, "volumedown"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, LK5;->webView:LP5;

    const/16 v0, 0x19

    goto :goto_0

    :cond_1
    const-string v0, "menubutton"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, LK5;->webView:LP5;

    const/16 v0, 0x52

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public pluginInitialize()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.intent.action.PHONE_STATE"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, LI1;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-direct {v1, v2, p0}, LI1;-><init>(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lorg/apache/cordova/CoreAndroid;->b:LI1;

    .line 18
    .line 19
    iget-object v1, p0, LK5;->webView:LP5;

    .line 20
    .line 21
    invoke-interface {v1}, LP5;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lorg/apache/cordova/CoreAndroid;->b:LI1;

    .line 26
    .line 27
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public sendResumeEvent(Lrf;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/cordova/CoreAndroid;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CoreAndroid;->c:LK3;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, p1, Lrf;->c:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v1, p1}, LK3;->sendPluginResult(Lrf;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/CoreAndroid;->d:Lrf;

    .line 18
    .line 19
    :cond_1
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p1
.end method
