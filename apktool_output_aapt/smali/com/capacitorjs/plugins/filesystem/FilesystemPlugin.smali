.class public final Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "Filesystem"
    permissions = {
        .subannotation Lcom/getcapacitor/annotation/Permission;
            alias = "publicStorage"
            strings = {
                "android.permission.READ_EXTERNAL_STORAGE",
                "android.permission.WRITE_EXTERNAL_STORAGE"
            }
        .end subannotation,
        .subannotation Lcom/getcapacitor/annotation/Permission;
            alias = "publicStorageAboveAPI29"
            strings = {
                "android.permission.READ_EXTERNAL_STORAGE"
            }
        .end subannotation
    }
.end annotation


# instance fields
.field private final controller$delegate:LLc;

.field private final coroutineScope$delegate:LLc;

.field private legacyImplementation:LNc;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, LD0;->f:LD0;

    .line 5
    .line 6
    new-instance v1, LTh;

    .line 7
    .line 8
    invoke-direct {v1, v0}, LTh;-><init>(Ly9;)V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->coroutineScope$delegate:LLc;

    .line 12
    .line 13
    new-instance v0, Lh8;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, v1, p0}, Lh8;-><init>(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, LTh;

    .line 20
    .line 21
    invoke-direct {v1, v0}, LTh;-><init>(Ly9;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->controller$delegate:LLc;

    .line 25
    .line 26
    return-void
.end method

.method public static final synthetic access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getController()LHa;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getCoroutineScope(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)Lh6;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getCoroutineScope()Lh6;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getLegacyImplementation$p(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LNc;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->legacyImplementation:LNc;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$isStoragePermissionGranted(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->isStoragePermissionGranted(Z)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$requestAllPermissions(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/getcapacitor/Plugin;->requestAllPermissions(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$runWithPermission(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LN9;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/getcapacitor/PluginCall;Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->downloadFile$lambda$11(Lcom/getcapacitor/PluginCall;Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method private static final downloadFile$lambda$11(Lcom/getcapacitor/PluginCall;Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2

    const-string v0, "$call"

    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "this$0"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "url"

    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    const-string p0, "bytes"

    invoke-virtual {v0, p0, p2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    const-string p0, "contentLength"

    invoke-virtual {v0, p0, p3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    const-string p0, "progress"

    invoke-virtual {p1, p0, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method private final getController()LHa;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->controller$delegate:LLc;

    .line 2
    .line 3
    check-cast v0, LTh;

    .line 4
    .line 5
    invoke-virtual {v0}, LTh;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LHa;

    .line 10
    .line 11
    return-object v0
.end method

.method private final getCoroutineScope()Lh6;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->coroutineScope$delegate:LLc;

    .line 2
    .line 3
    check-cast v0, LTh;

    .line 4
    .line 5
    invoke-virtual {v0}, LTh;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lh6;

    .line 10
    .line 11
    return-object v0
.end method

.method private final isStoragePermissionGranted(Z)Z
    .locals 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x1e

    const/4 v3, 0x0

    if-lt v0, v1, :cond_2

    if-eqz p1, :cond_3

    const-string p1, "publicStorageAboveAPI29"

    invoke-virtual {p0, p1}, Lcom/getcapacitor/Plugin;->getPermissionState(Ljava/lang/String;)Lcom/getcapacitor/PermissionState;

    move-result-object p1

    sget-object v0, Lcom/getcapacitor/PermissionState;->GRANTED:Lcom/getcapacitor/PermissionState;

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    const-string p1, "publicStorage"

    invoke-virtual {p0, p1}, Lcom/getcapacitor/Plugin;->getPermissionState(Ljava/lang/String;)Lcom/getcapacitor/PermissionState;

    move-result-object p1

    sget-object v0, Lcom/getcapacitor/PermissionState;->GRANTED:Lcom/getcapacitor/PermissionState;

    if-ne p1, v0, :cond_1

    :cond_3
    :goto_0
    return v2
.end method

.method private final permissionCallback(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/annotation/PermissionCallback;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->isStoragePermissionGranted(Z)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "User denied storage permission"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lg8;->a:Lf8;

    .line 18
    .line 19
    sget-object v0, Lg8;->a:Lf8;

    .line 20
    .line 21
    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_d

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sparse-switch v1, :sswitch_data_0

    .line 36
    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :sswitch_0
    const-string v1, "deleteFile"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->deleteFile(Lcom/getcapacitor/PluginCall;)V

    .line 51
    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :sswitch_1
    const-string v1, "downloadFile"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_2
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->downloadFile(Lcom/getcapacitor/PluginCall;)V

    .line 66
    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :sswitch_2
    const-string v1, "readdir"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_3

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_3
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->readdir(Lcom/getcapacitor/PluginCall;)V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_3
    const-string v1, "readFileInChunks"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_4

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_4
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->readFileInChunks(Lcom/getcapacitor/PluginCall;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_4
    const-string v1, "rmdir"

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_5
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->rmdir(Lcom/getcapacitor/PluginCall;)V

    .line 111
    .line 112
    .line 113
    goto/16 :goto_0

    .line 114
    .line 115
    :sswitch_5
    const-string v1, "mkdir"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->mkdir(Lcom/getcapacitor/PluginCall;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_6
    const-string v1, "stat"

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_7

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_7
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->stat(Lcom/getcapacitor/PluginCall;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :sswitch_7
    const-string v1, "copy"

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_8

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_8
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->copy(Lcom/getcapacitor/PluginCall;)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :sswitch_8
    const-string v1, "readFile"

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_9

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_9
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->readFile(Lcom/getcapacitor/PluginCall;)V

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :sswitch_9
    const-string v1, "rename"

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_a

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_a
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->rename(Lcom/getcapacitor/PluginCall;)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :sswitch_a
    const-string v1, "getUri"

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_b

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_b
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getUri(Lcom/getcapacitor/PluginCall;)V

    .line 190
    .line 191
    .line 192
    goto :goto_0

    .line 193
    :sswitch_b
    const-string v1, "writeFile"

    .line 194
    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    if-nez v0, :cond_c

    .line 200
    .line 201
    goto :goto_0

    .line 202
    :sswitch_c
    const-string v1, "appendFile"

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_c

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_c
    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->writeFile(Lcom/getcapacitor/PluginCall;)V

    .line 212
    .line 213
    .line 214
    :cond_d
    :goto_0
    return-void

    .line 215
    :sswitch_data_0
    .sparse-switch
        -0x7f8ae44a -> :sswitch_c
        -0x53d94605 -> :sswitch_b
        -0x4a7789ca -> :sswitch_a
        -0x37b4c8c2 -> :sswitch_9
        -0x33bbf7ce -> :sswitch_8
        0x2eaf75 -> :sswitch_7
        0x360654 -> :sswitch_6
        0x6322a2f -> :sswitch_5
        0x6798872 -> :sswitch_4
        0x33820f7d -> :sswitch_3
        0x4065bb37 -> :sswitch_2
        0x4214ae24 -> :sswitch_1
        0x692721c7 -> :sswitch_0
    .end sparse-switch
.end method

.method private final runWithPermission(LPb;LPb;Lcom/getcapacitor/PluginCall;LO9;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LPb;",
            "LPb;",
            "Lcom/getcapacitor/PluginCall;",
            "LO9;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v6, Lu8;

    const/4 v5, 0x0

    move-object v0, v6

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lu8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LO9;Lr5;)V

    invoke-direct {p0, p1, p3, v6}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method private final runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LPb;",
            "Lcom/getcapacitor/PluginCall;",
            "LN9;",
            ")V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getCoroutineScope()Lh6;

    move-result-object v0

    new-instance v7, Ls8;

    const/4 v6, 0x0

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Ls8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;LN9;Lr5;)V

    invoke-static {v0, v7}, LMk;->z(Lh6;LN9;)Luh;

    return-void
.end method


# virtual methods
.method public final appendFile(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    const-string v1, "append"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, p1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->writeFile(Lcom/getcapacitor/PluginCall;)V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Tried to set `append` in `PluginCall`, but got exception"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object v1, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getMethodName(...)"

    invoke-static {v2, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :cond_0
    invoke-static {v1, v0}, Lg8;->e(Ljava/lang/String;Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void
.end method

.method public checkPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->isStoragePermissionGranted(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "publicStorage"

    const-string v2, "granted"

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->checkPermissions(Lcom/getcapacitor/PluginCall;)V

    :goto_0
    return-void
.end method

.method public final copy(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->n(Lcom/getcapacitor/PluginCall;)LV6;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Li8;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v2, v3}, Li8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;I)V

    iget-object v2, v0, LV6;->a:LPb;

    iget-object v0, v0, LV6;->b:LPb;

    invoke-direct {p0, v2, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;LPb;Lcom/getcapacitor/PluginCall;LO9;)V

    return-void
.end method

.method public final deleteFile(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Lj8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lj8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V

    invoke-direct {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method public final downloadFile(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "directory"

    .line 7
    .line 8
    sget-object v1, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->legacyImplementation:LNc;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    const-string v1, "DOCUMENTS"

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    const-string v1, "EXTERNAL_STORAGE"

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    :cond_0
    const/4 v1, 0x0

    .line 35
    invoke-direct {p0, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->isStoragePermissionGranted(Z)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    const-string v0, "permissionCallback"

    .line 42
    .line 43
    invoke-virtual {p0, p1, v0}, Lcom/getcapacitor/Plugin;->requestAllPermissions(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    new-instance v1, Lnf;

    .line 50
    .line 51
    const/4 v2, 0x2

    .line 52
    invoke-direct {v1, p1, v2, p0}, Lnf;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->legacyImplementation:LNc;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 60
    .line 61
    const-string v4, "bridge"

    .line 62
    .line 63
    invoke-static {v4, v3}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    new-instance v4, LN2;

    .line 67
    .line 68
    invoke-direct {v4, p0, v0, p1}, LN2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, p1, v3, v1, v4}, LNc;->b(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lnf;LN2;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v3, "Error downloading file: "

    .line 82
    .line 83
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_1
    return-void
.end method

.method public final getUri(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getCoroutineScope()Lh6;

    move-result-object v1

    new-instance v2, Lk8;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v0, p1, v3}, Lk8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LPb;Lcom/getcapacitor/PluginCall;Lr5;)V

    invoke-static {v1, v2}, LMk;->z(Lh6;LN9;)Luh;

    return-void
.end method

.method public handleOnDestroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/getcapacitor/Plugin;->handleOnDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->getCoroutineScope()Lh6;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lh6;->g()LY5;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lt5;->g:Lt5;

    .line 13
    .line 14
    invoke-interface {v1, v2}, LY5;->c(LX5;)LW5;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Luc;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {v1, v0}, Luc;->a(Ljava/util/concurrent/CancellationException;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "Scope cannot be cancelled because it does not have a job: "

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v1
.end method

.method public load()V
    .locals 3

    invoke-super {p0}, Lcom/getcapacitor/Plugin;->load()V

    new-instance v0, LNc;

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "getContext(...)"

    invoke-static {v2, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {v0, v1}, LNc;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->legacyImplementation:LNc;

    return-void
.end method

.method public final mkdir(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->u(Lcom/getcapacitor/PluginCall;)Lih;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Ll8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, p1, v2}, Ll8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lih;Lcom/getcapacitor/PluginCall;Lr5;)V

    iget-object v0, v0, Lih;->a:LPb;

    invoke-direct {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method public final readFile(Lcom/getcapacitor/PluginCall;)V
    .locals 5
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    move-object v3, v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object v2, LWa;->a:LVa;

    .line 16
    .line 17
    const-string v2, "encoding"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, LMk;->o(Ljava/lang/String;)LWa;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, LRf;

    .line 28
    .line 29
    new-instance v4, LJb;

    .line 30
    .line 31
    invoke-direct {v4, v2}, LJb;-><init>(LWa;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v3, v0, v4}, LRf;-><init>(LPb;LJb;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    if-nez v3, :cond_1

    .line 38
    .line 39
    sget-object v0, Lg8;->a:Lf8;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "getMethodName(...)"

    .line 46
    .line 47
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    new-instance v0, Lm8;

    .line 59
    .line 60
    invoke-direct {v0, p0, v3, p1, v1}, Lm8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LRf;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, v3, LRf;->a:LPb;

    .line 64
    .line 65
    invoke-direct {p0, v1, p1, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final readFileInChunks(Lcom/getcapacitor/PluginCall;)V
    .locals 6
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "callback"
    .end annotation

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    :goto_0
    move-object v4, v1

    .line 14
    goto :goto_2

    .line 15
    :cond_1
    sget-object v2, LWa;->a:LVa;

    .line 16
    .line 17
    const-string v2, "encoding"

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, LMk;->o(Ljava/lang/String;)LWa;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "chunkSize"

    .line 28
    .line 29
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-lez v4, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    move-object v3, v1

    .line 43
    :goto_1
    if-nez v3, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    new-instance v4, LQf;

    .line 51
    .line 52
    new-instance v5, LIb;

    .line 53
    .line 54
    invoke-direct {v5, v2, v3}, LIb;-><init>(LWa;I)V

    .line 55
    .line 56
    .line 57
    invoke-direct {v4, v0, v5}, LQf;-><init>(LPb;LIb;)V

    .line 58
    .line 59
    .line 60
    :goto_2
    if-nez v4, :cond_4

    .line 61
    .line 62
    sget-object v0, Lg8;->a:Lf8;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "getMethodName(...)"

    .line 69
    .line 70
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    new-instance v0, Lp8;

    .line 82
    .line 83
    invoke-direct {v0, p0, v4, p1, v1}, Lp8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LQf;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, v4, LQf;->a:LPb;

    .line 87
    .line 88
    invoke-direct {p0, v1, p1, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final readdir(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Lq8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lq8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V

    invoke-direct {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method public final rename(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->n(Lcom/getcapacitor/PluginCall;)LV6;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Li8;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, p0, p1, v2, v3}, Li8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;I)V

    iget-object v2, v0, LV6;->a:LPb;

    iget-object v0, v0, LV6;->b:LPb;

    invoke-direct {p0, v2, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;LPb;Lcom/getcapacitor/PluginCall;LO9;)V

    return-void
.end method

.method public requestPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->isStoragePermissionGranted(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "publicStorage"

    const-string v2, "granted"

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Lcom/getcapacitor/Plugin;->requestPermissions(Lcom/getcapacitor/PluginCall;)V

    :goto_0
    return-void
.end method

.method public final rmdir(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->u(Lcom/getcapacitor/PluginCall;)Lih;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Lr8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, p1, v2}, Lr8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lih;Lcom/getcapacitor/PluginCall;Lr5;)V

    iget-object v0, v0, Lih;->a:LPb;

    invoke-direct {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method public final stat(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    const-string v0, "call"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lg8;->a:Lf8;

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getMethodName(...)"

    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    move-result-object v0

    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    return-void

    :cond_0
    new-instance v1, Lv8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lv8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;)V

    invoke-direct {p0, v0, p1, v1}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    return-void
.end method

.method public final writeFile(Lcom/getcapacitor/PluginCall;)V
    .locals 8
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    :goto_0
    move-object v6, v1

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    const-string v2, "data"

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string v3, "recursive"

    .line 25
    .line 26
    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-nez v3, :cond_2

    .line 31
    .line 32
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const-string v4, "append"

    .line 39
    .line 40
    invoke-virtual {p1, v4}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-nez v4, :cond_3

    .line 45
    .line 46
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_4

    .line 53
    .line 54
    sget-object v4, LKb;->d:LKb;

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_4
    sget-object v4, LKb;->c:LKb;

    .line 58
    .line 59
    :goto_1
    sget-object v5, LWa;->a:LVa;

    .line 60
    .line 61
    const-string v5, "encoding"

    .line 62
    .line 63
    invoke-virtual {p1, v5}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-static {v5}, LMk;->o(Ljava/lang/String;)LWa;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    new-instance v6, LTk;

    .line 72
    .line 73
    new-instance v7, LLb;

    .line 74
    .line 75
    invoke-direct {v7, v2, v5, v4, v3}, LLb;-><init>(Ljava/lang/String;LWa;LKb;Z)V

    .line 76
    .line 77
    .line 78
    invoke-direct {v6, v0, v7}, LTk;-><init>(LPb;LLb;)V

    .line 79
    .line 80
    .line 81
    :goto_2
    if-nez v6, :cond_5

    .line 82
    .line 83
    sget-object v0, Lg8;->a:Lf8;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "getMethodName(...)"

    .line 90
    .line 91
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Lg8;->c(Ljava/lang/String;)Lf8;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {p1, v0}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    new-instance v0, Lw8;

    .line 103
    .line 104
    invoke-direct {v0, p0, v6, p1, v1}, Lw8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;LTk;Lcom/getcapacitor/PluginCall;Lr5;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, v6, LTk;->a:LPb;

    .line 108
    .line 109
    invoke-direct {p0, v1, p1, v0}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->runWithPermission(LPb;Lcom/getcapacitor/PluginCall;LN9;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method
