.class public final synthetic LQ2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, LQ2;->c:I

    iput-object p1, p0, LQ2;->d:Ljava/lang/Object;

    iput-object p3, p0, LQ2;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, LQ2;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LQ2;->d:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ls2;

    .line 9
    .line 10
    iget-object v1, p0, LQ2;->e:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Landroid/graphics/Typeface;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ls2;->b(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_0
    iget-object v0, p0, LQ2;->d:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Landroidx/profileinstaller/ProfileInstallerInitializer;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 26
    .line 27
    const/16 v1, 0x1c

    .line 28
    .line 29
    if-lt v0, v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, LFf;->a(Landroid/os/Looper;)Landroid/os/Handler;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v0, Landroid/os/Handler;

    .line 41
    .line 42
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    new-instance v1, Ljava/util/Random;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 52
    .line 53
    .line 54
    const/16 v2, 0x3e8

    .line 55
    .line 56
    const/4 v3, 0x1

    .line 57
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    new-instance v2, Lu1;

    .line 66
    .line 67
    iget-object v3, p0, LQ2;->e:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v3, Landroid/content/Context;

    .line 70
    .line 71
    const/4 v4, 0x1

    .line 72
    invoke-direct {v2, v3, v4}, Lu1;-><init>(Landroid/content/Context;I)V

    .line 73
    .line 74
    .line 75
    add-int/lit16 v1, v1, 0x1388

    .line 76
    .line 77
    int-to-long v3, v1

    .line 78
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :pswitch_1
    iget-object v0, p0, LQ2;->d:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v0, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;

    .line 85
    .line 86
    iget-object v1, p0, LQ2;->e:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v1, Lye;

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;->a(Lcom/getcapacitor/cordova/MockCordovaWebViewImpl$CapacitorEvalBridgeMode;Lye;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :pswitch_2
    iget-object v0, p0, LQ2;->d:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v0, Landroid/webkit/WebView;

    .line 97
    .line 98
    iget-object v1, p0, LQ2;->e:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v1, Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0, v1}, Lcom/getcapacitor/MessageHandler;->c(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :pswitch_3
    const-string v0, "$callback"

    .line 107
    .line 108
    iget-object v1, p0, LQ2;->d:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v1, LN2;

    .line 111
    .line 112
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    const-string v0, "$error"

    .line 116
    .line 117
    iget-object v2, p0, LQ2;->e:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v2, Ljava/lang/Exception;

    .line 120
    .line 121
    invoke-static {v0, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    const-string v4, "Error downloading file: "

    .line 131
    .line 132
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v1, v1, LN2;->c:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast v1, Lcom/getcapacitor/PluginCall;

    .line 145
    .line 146
    invoke-virtual {v1, v0, v2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :pswitch_4
    iget-object v0, p0, LQ2;->d:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v0, LN2;

    .line 153
    .line 154
    const-string v1, "$callback"

    .line 155
    .line 156
    invoke-static {v1, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, LQ2;->e:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v1, Lcom/getcapacitor/JSObject;

    .line 162
    .line 163
    const-string v2, "$result"

    .line 164
    .line 165
    invoke-static {v2, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    iget-object v2, v0, LN2;->a:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast v2, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 171
    .line 172
    invoke-static {v2}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getLegacyImplementation$p(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LNc;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    if-eqz v3, :cond_2

    .line 177
    .line 178
    const-string v3, "DOCUMENTS"

    .line 179
    .line 180
    iget-object v4, v0, LN2;->b:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v4, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-nez v3, :cond_1

    .line 189
    .line 190
    const-string v3, "EXTERNAL_STORAGE"

    .line 191
    .line 192
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    if-eqz v3, :cond_2

    .line 197
    .line 198
    :cond_1
    invoke-virtual {v2}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const-string v3, "path"

    .line 203
    .line 204
    invoke-virtual {v1, v3}, Lcom/getcapacitor/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    filled-new-array {v3}, [Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    const/4 v4, 0x0

    .line 213
    invoke-static {v2, v3, v4, v4}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 214
    .line 215
    .line 216
    :cond_2
    iget-object v0, v0, LN2;->c:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v0, Lcom/getcapacitor/PluginCall;

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :pswitch_5
    const-string v0, "this$0"

    .line 225
    .line 226
    iget-object v1, p0, LQ2;->d:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v1, LX4;

    .line 229
    .line 230
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    const-string v0, "$dispatcher"

    .line 234
    .line 235
    iget-object v2, p0, LQ2;->e:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast v2, Landroidx/activity/a;

    .line 238
    .line 239
    invoke-static {v0, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v1, v2}, LX4;->access$addObserverForBackInvoker(LX4;Landroidx/activity/a;)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :pswitch_6
    iget-object v0, p0, LQ2;->e:Ljava/lang/Object;

    .line 247
    .line 248
    check-cast v0, Ljava/lang/Runnable;

    .line 249
    .line 250
    iget-object v1, p0, LQ2;->d:Ljava/lang/Object;

    .line 251
    .line 252
    check-cast v1, LR2;

    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    .line 256
    .line 257
    :try_start_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1}, LR2;->a()V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :catchall_0
    move-exception v0

    .line 265
    invoke-virtual {v1}, LR2;->a()V

    .line 266
    .line 267
    .line 268
    throw v0

    .line 269
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
