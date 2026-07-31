.class public final Lg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lg0;->c:I

    iput-object p1, p0, Lg0;->e:Ljava/lang/Object;

    iput-object p3, p0, Lg0;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    .line 2
    iput p3, p0, Lg0;->c:I

    iput-object p1, p0, Lg0;->d:Ljava/lang/Object;

    iput-object p2, p0, Lg0;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    iget-object v4, p0, Lg0;->e:Ljava/lang/Object;

    .line 6
    .line 7
    iget v5, p0, Lg0;->c:I

    .line 8
    .line 9
    packed-switch v5, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lf5;

    .line 15
    .line 16
    invoke-interface {v0, v4}, Lf5;->a(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_0
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Lye;

    .line 23
    .line 24
    iget-object v0, v0, Lye;->b:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    check-cast v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    .line 33
    .line 34
    iput-boolean v3, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->c:Z

    .line 35
    .line 36
    iget-boolean v0, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->b:Z

    .line 37
    .line 38
    iget-object v1, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->a:Lxe;

    .line 39
    .line 40
    check-cast v1, Li0;

    .line 41
    .line 42
    iget-object v1, v1, Li0;->d:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 45
    .line 46
    iget-object v1, v1, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setNetworkAvailable(Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void

    .line 54
    :pswitch_1
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v0, Lye;

    .line 57
    .line 58
    invoke-virtual {v0}, Lye;->e()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    check-cast v4, Lorg/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode;

    .line 65
    .line 66
    iget-object v1, v4, Lorg/apache/cordova/NativeToJsMessageQueue$LoadUrlBridgeMode;->a:LR5;

    .line 67
    .line 68
    const-string v2, "javascript:"

    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v1, v0, v3}, LR5;->loadUrl(Ljava/lang/String;Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void

    .line 78
    :pswitch_2
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Lye;

    .line 81
    .line 82
    invoke-virtual {v0}, Lye;->e()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    check-cast v4, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;

    .line 89
    .line 90
    iget-object v2, v4, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->a:LR5;

    .line 91
    .line 92
    invoke-interface {v2, v0, v1}, LR5;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void

    .line 96
    :cond_3
    :pswitch_3
    :try_start_0
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v0, Ljava/lang/Runnable;

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catchall_0
    move-exception v0

    .line 105
    sget-object v1, LE7;->c:LE7;

    .line 106
    .line 107
    invoke-static {v1, v0}, Lu6;->o(LY5;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :goto_0
    move-object v0, v4

    .line 111
    check-cast v0, Lbd;

    .line 112
    .line 113
    invoke-virtual {v0}, Lbd;->g()Ljava/lang/Runnable;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    if-nez v1, :cond_4

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    iput-object v1, p0, Lg0;->d:Ljava/lang/Object;

    .line 121
    .line 122
    add-int/2addr v3, v2

    .line 123
    const/16 v1, 0x10

    .line 124
    .line 125
    if-lt v3, v1, :cond_3

    .line 126
    .line 127
    iget-object v1, v0, Lbd;->e:Lc6;

    .line 128
    .line 129
    invoke-virtual {v1, v0}, Lc6;->e(LY5;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_3

    .line 134
    .line 135
    iget-object v1, v0, Lbd;->e:Lc6;

    .line 136
    .line 137
    invoke-virtual {v1, v0, p0}, Lc6;->d(LY5;Ljava/lang/Runnable;)V

    .line 138
    .line 139
    .line 140
    :goto_1
    return-void

    .line 141
    :pswitch_4
    check-cast v4, Lorg/apache/cordova/CordovaWebViewImpl;

    .line 142
    .line 143
    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebViewImpl;->stopLoading()V

    .line 144
    .line 145
    .line 146
    const-string v0, "CordovaWebViewImpl"

    .line 147
    .line 148
    const-string v1, "CordovaWebView: TIMEOUT ERROR!"

    .line 149
    .line 150
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    new-instance v0, Lorg/json/JSONObject;

    .line 154
    .line 155
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 156
    .line 157
    .line 158
    :try_start_1
    const-string v1, "errorCode"

    .line 159
    .line 160
    const/4 v2, -0x6

    .line 161
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 162
    .line 163
    .line 164
    const-string v1, "description"

    .line 165
    .line 166
    const-string v2, "The connection to the server was unsuccessful."

    .line 167
    .line 168
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    .line 170
    .line 171
    const-string v1, "url"

    .line 172
    .line 173
    iget-object v2, p0, Lg0;->d:Ljava/lang/Object;

    .line 174
    .line 175
    check-cast v2, Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    .line 179
    .line 180
    :catch_0
    iget-object v1, v4, Lorg/apache/cordova/CordovaWebViewImpl;->a:Lqf;

    .line 181
    .line 182
    const-string v2, "onReceivedError"

    .line 183
    .line 184
    invoke-virtual {v1, v2, v0}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :pswitch_5
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v0, Li0;

    .line 191
    .line 192
    iget-object v0, v0, Li0;->d:Ljava/lang/Object;

    .line 193
    .line 194
    check-cast v0, Ls2;

    .line 195
    .line 196
    if-eqz v0, :cond_5

    .line 197
    .line 198
    check-cast v4, Landroid/graphics/Typeface;

    .line 199
    .line 200
    invoke-virtual {v0, v4}, Ls2;->b(Landroid/graphics/Typeface;)V

    .line 201
    .line 202
    .line 203
    :cond_5
    return-void

    .line 204
    :pswitch_6
    :try_start_2
    sget-object v1, Lt0;->d:Ljava/lang/reflect/Method;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 205
    .line 206
    iget-object v5, p0, Lg0;->d:Ljava/lang/Object;

    .line 207
    .line 208
    if-eqz v1, :cond_6

    .line 209
    .line 210
    const/4 v6, 0x3

    .line 211
    :try_start_3
    new-array v6, v6, [Ljava/lang/Object;

    .line 212
    .line 213
    aput-object v4, v6, v3

    .line 214
    .line 215
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 216
    .line 217
    aput-object v3, v6, v2

    .line 218
    .line 219
    const-string v2, "AppCompat recreation"

    .line 220
    .line 221
    aput-object v2, v6, v0

    .line 222
    .line 223
    invoke-virtual {v1, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    goto :goto_4

    .line 227
    :catchall_1
    move-exception v0

    .line 228
    goto :goto_2

    .line 229
    :catch_1
    move-exception v0

    .line 230
    goto :goto_3

    .line 231
    :cond_6
    sget-object v1, Lt0;->e:Ljava/lang/reflect/Method;

    .line 232
    .line 233
    new-array v0, v0, [Ljava/lang/Object;

    .line 234
    .line 235
    aput-object v4, v0, v3

    .line 236
    .line 237
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 238
    .line 239
    aput-object v3, v0, v2

    .line 240
    .line 241
    invoke-virtual {v1, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 242
    .line 243
    .line 244
    goto :goto_4

    .line 245
    :goto_2
    const-string v1, "ActivityRecreator"

    .line 246
    .line 247
    const-string v2, "Exception while invoking performStopActivity"

    .line 248
    .line 249
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 250
    .line 251
    .line 252
    goto :goto_4

    .line 253
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    const-class v2, Ljava/lang/RuntimeException;

    .line 258
    .line 259
    if-ne v1, v2, :cond_8

    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    if-eqz v1, :cond_8

    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    const-string v2, "Unable to stop"

    .line 272
    .line 273
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-nez v1, :cond_7

    .line 278
    .line 279
    goto :goto_4

    .line 280
    :cond_7
    throw v0

    .line 281
    :cond_8
    :goto_4
    return-void

    .line 282
    :pswitch_7
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 283
    .line 284
    check-cast v0, Landroid/app/Application;

    .line 285
    .line 286
    check-cast v4, Ls0;

    .line 287
    .line 288
    invoke-virtual {v0, v4}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 289
    .line 290
    .line 291
    return-void

    .line 292
    :pswitch_8
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v0, Ls0;

    .line 295
    .line 296
    iput-object v4, v0, Ls0;->a:Ljava/lang/Object;

    .line 297
    .line 298
    return-void

    .line 299
    :pswitch_9
    check-cast v4, Lj0;

    .line 300
    .line 301
    iget-object v0, v4, Lj0;->e:LMd;

    .line 302
    .line 303
    if-eqz v0, :cond_9

    .line 304
    .line 305
    iget-object v2, v0, LMd;->e:LKd;

    .line 306
    .line 307
    if-eqz v2, :cond_9

    .line 308
    .line 309
    invoke-interface {v2, v0}, LKd;->n(LMd;)V

    .line 310
    .line 311
    .line 312
    :cond_9
    iget-object v0, v4, Lj0;->j:Lle;

    .line 313
    .line 314
    check-cast v0, Landroid/view/View;

    .line 315
    .line 316
    if-eqz v0, :cond_c

    .line 317
    .line 318
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    if-eqz v0, :cond_c

    .line 323
    .line 324
    iget-object v0, p0, Lg0;->d:Ljava/lang/Object;

    .line 325
    .line 326
    check-cast v0, Le0;

    .line 327
    .line 328
    invoke-virtual {v0}, Lbe;->b()Z

    .line 329
    .line 330
    .line 331
    move-result v2

    .line 332
    if-eqz v2, :cond_a

    .line 333
    .line 334
    goto :goto_5

    .line 335
    :cond_a
    iget-object v2, v0, Lbe;->f:Landroid/view/View;

    .line 336
    .line 337
    if-nez v2, :cond_b

    .line 338
    .line 339
    goto :goto_6

    .line 340
    :cond_b
    invoke-virtual {v0, v3, v3, v3, v3}, Lbe;->d(IIZZ)V

    .line 341
    .line 342
    .line 343
    :goto_5
    iput-object v0, v4, Lj0;->u:Le0;

    .line 344
    .line 345
    :cond_c
    :goto_6
    iput-object v1, v4, Lj0;->w:Lg0;

    .line 346
    .line 347
    return-void

    .line 348
    nop

    .line 349
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
