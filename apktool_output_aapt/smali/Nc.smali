.class public final LNc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LNc;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static final a(LNc;Ljava/lang/String;Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;)Lcom/getcapacitor/JSObject;
    .locals 19

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p4

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    new-instance v2, Lcom/getcapacitor/JSObject;

    .line 9
    .line 10
    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v3, "headers"

    .line 14
    .line 15
    invoke-virtual {v0, v3, v2}, Lcom/getcapacitor/PluginCall;->getObject(Ljava/lang/String;Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/JSObject;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Lcom/getcapacitor/JSObject;

    .line 20
    .line 21
    invoke-direct {v3}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v4, "params"

    .line 25
    .line 26
    invoke-virtual {v0, v4, v3}, Lcom/getcapacitor/PluginCall;->getObject(Ljava/lang/String;Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/JSObject;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const-string v4, "connectTimeout"

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const-string v5, "readTimeout"

    .line 37
    .line 38
    invoke-virtual {v0, v5}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const-string v6, "disableRedirects"

    .line 43
    .line 44
    invoke-virtual {v0, v6}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    if-nez v6, :cond_0

    .line 49
    .line 50
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    :cond_0
    const-string v7, "shouldEncodeUrlParams"

    .line 53
    .line 54
    invoke-virtual {v0, v7}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    if-nez v7, :cond_1

    .line 59
    .line 60
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    const-string v8, "progress"

    .line 67
    .line 68
    invoke-virtual {v0, v8}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    if-nez v8, :cond_2

    .line 73
    .line 74
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    :cond_2
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    const-string v9, "method"

    .line 81
    .line 82
    invoke-virtual {v0, v9}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    if-eqz v9, :cond_3

    .line 87
    .line 88
    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 89
    .line 90
    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    const-string v10, "toUpperCase(...)"

    .line 95
    .line 96
    invoke-static {v10, v9}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    const-string v9, "GET"

    .line 101
    .line 102
    :goto_0
    const-string v10, "path"

    .line 103
    .line 104
    invoke-virtual {v0, v10}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v11

    .line 108
    invoke-static {v11}, Llc;->e(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    const-string v12, "directory"

    .line 112
    .line 113
    sget-object v13, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v12, v13}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v12, Ljava/net/URL;

    .line 120
    .line 121
    move-object/from16 v13, p1

    .line 122
    .line 123
    invoke-direct {v12, v13}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    if-nez v0, :cond_5

    .line 127
    .line 128
    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 129
    .line 130
    .line 131
    move-result-object v13

    .line 132
    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v14

    .line 136
    if-eqz v14, :cond_4

    .line 137
    .line 138
    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v14

    .line 142
    const-string v15, "file"

    .line 143
    .line 144
    invoke-static {v14, v15}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v14

    .line 148
    if-eqz v14, :cond_5

    .line 149
    .line 150
    :cond_4
    new-instance v0, Ljava/io/File;

    .line 151
    .line 152
    invoke-virtual {v13}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v11

    .line 156
    invoke-direct {v0, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    goto/16 :goto_3

    .line 160
    .line 161
    :cond_5
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v13

    .line 168
    const/4 v14, 0x0

    .line 169
    move-object/from16 v15, p0

    .line 170
    .line 171
    iget-object v15, v15, LNc;->a:Landroid/content/Context;

    .line 172
    .line 173
    sparse-switch v13, :sswitch_data_0

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :sswitch_0
    const-string v13, "EXTERNAL_STORAGE"

    .line 178
    .line 179
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_6

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_6
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    goto :goto_2

    .line 191
    :sswitch_1
    const-string v13, "LIBRARY"

    .line 192
    .line 193
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-nez v0, :cond_8

    .line 198
    .line 199
    goto :goto_1

    .line 200
    :sswitch_2
    const-string v13, "CACHE"

    .line 201
    .line 202
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-nez v0, :cond_7

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_7
    invoke-virtual {v15}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    goto :goto_2

    .line 214
    :sswitch_3
    const-string v13, "DATA"

    .line 215
    .line 216
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_8

    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_8
    invoke-virtual {v15}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    goto :goto_2

    .line 228
    :sswitch_4
    const-string v13, "DOCUMENTS"

    .line 229
    .line 230
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-eqz v0, :cond_9

    .line 235
    .line 236
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    .line 237
    .line 238
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    goto :goto_2

    .line 243
    :sswitch_5
    const-string v13, "EXTERNAL"

    .line 244
    .line 245
    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_a

    .line 250
    .line 251
    :cond_9
    :goto_1
    move-object v0, v14

    .line 252
    goto :goto_2

    .line 253
    :cond_a
    invoke-virtual {v15, v14}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    :goto_2
    if-nez v0, :cond_b

    .line 258
    .line 259
    move-object v0, v14

    .line 260
    goto :goto_3

    .line 261
    :cond_b
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 262
    .line 263
    .line 264
    move-result v13

    .line 265
    if-nez v13, :cond_c

    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 268
    .line 269
    .line 270
    :cond_c
    new-instance v13, Ljava/io/File;

    .line 271
    .line 272
    invoke-direct {v13, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    move-object v0, v13

    .line 276
    :goto_3
    new-instance v11, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 277
    .line 278
    invoke-direct {v11}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;-><init>()V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v11, v12}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setUrl(Ljava/net/URL;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 282
    .line 283
    .line 284
    move-result-object v11

    .line 285
    invoke-virtual {v11, v9}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setMethod(Ljava/lang/String;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 286
    .line 287
    .line 288
    move-result-object v9

    .line 289
    invoke-virtual {v9, v2}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setHeaders(Lcom/getcapacitor/JSObject;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    invoke-virtual {v2, v3, v7}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setUrlParams(Lcom/getcapacitor/JSObject;Z)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-virtual {v2, v4}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setConnectTimeout(Ljava/lang/Integer;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    invoke-virtual {v2, v5}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setReadTimeout(Ljava/lang/Integer;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v2, v6}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->setDisableRedirects(Ljava/lang/Boolean;)Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    invoke-virtual {v2}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->openConnection()Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    invoke-virtual {v2}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$HttpURLConnectionBuilder;->build()Lcom/getcapacitor/plugin/util/CapacitorHttpUrlConnection;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    move-object/from16 v3, p3

    .line 318
    .line 319
    invoke-virtual {v2, v3}, Lcom/getcapacitor/plugin/util/CapacitorHttpUrlConnection;->setSSLSocketFactory(Lcom/getcapacitor/Bridge;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v2}, Lcom/getcapacitor/plugin/util/CapacitorHttpUrlConnection;->getInputStream()Ljava/io/InputStream;

    .line 323
    .line 324
    .line 325
    move-result-object v3

    .line 326
    new-instance v4, Ljava/io/FileOutputStream;

    .line 327
    .line 328
    const/4 v5, 0x0

    .line 329
    invoke-direct {v4, v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 330
    .line 331
    .line 332
    const-string v6, "content-length"

    .line 333
    .line 334
    invoke-virtual {v2, v6}, Lcom/getcapacitor/plugin/util/CapacitorHttpUrlConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    if-eqz v2, :cond_d

    .line 339
    .line 340
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 341
    .line 342
    .line 343
    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    goto :goto_4

    .line 345
    :catch_0
    :cond_d
    move v2, v5

    .line 346
    :goto_4
    const/16 v6, 0x400

    .line 347
    .line 348
    new-array v6, v6, [B

    .line 349
    .line 350
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 351
    .line 352
    .line 353
    move-result-wide v11

    .line 354
    move v7, v5

    .line 355
    :cond_e
    :goto_5
    invoke-virtual {v3, v6}, Ljava/io/InputStream;->read([B)I

    .line 356
    .line 357
    .line 358
    move-result v9

    .line 359
    if-lez v9, :cond_f

    .line 360
    .line 361
    invoke-virtual {v4, v6, v5, v9}, Ljava/io/FileOutputStream;->write([BII)V

    .line 362
    .line 363
    .line 364
    add-int/2addr v7, v9

    .line 365
    if-eqz v8, :cond_e

    .line 366
    .line 367
    if-eqz v1, :cond_e

    .line 368
    .line 369
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 370
    .line 371
    .line 372
    move-result-wide v13

    .line 373
    sub-long v15, v13, v11

    .line 374
    .line 375
    const-wide/16 v17, 0x64

    .line 376
    .line 377
    cmp-long v9, v15, v17

    .line 378
    .line 379
    if-lez v9, :cond_e

    .line 380
    .line 381
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 382
    .line 383
    .line 384
    move-result-object v9

    .line 385
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 386
    .line 387
    .line 388
    move-result-object v11

    .line 389
    invoke-interface {v1, v9, v11}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;->emit(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 390
    .line 391
    .line 392
    move-wide v11, v13

    .line 393
    goto :goto_5

    .line 394
    :cond_f
    if-eqz v8, :cond_10

    .line 395
    .line 396
    if-eqz v1, :cond_10

    .line 397
    .line 398
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 399
    .line 400
    .line 401
    move-result-object v5

    .line 402
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    invoke-interface {v1, v5, v2}, Lcom/getcapacitor/plugin/util/HttpRequestHandler$ProgressEmitter;->emit(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 407
    .line 408
    .line 409
    :cond_10
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 413
    .line 414
    .line 415
    new-instance v1, Lcom/getcapacitor/JSObject;

    .line 416
    .line 417
    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 418
    .line 419
    .line 420
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    invoke-virtual {v1, v10, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 428
    .line 429
    .line 430
    return-object v1

    .line 431
    :sswitch_data_0
    .sparse-switch
        -0x3de0ac35 -> :sswitch_5
        -0x21aa9d68 -> :sswitch_4
        0x1fe7aa -> :sswitch_3
        0x3ceb762 -> :sswitch_2
        0x34b3b09b -> :sswitch_1
        0x3c6bcde7 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public final b(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lnf;LN2;)V
    .locals 10

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bridge"

    .line 7
    .line 8
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "url"

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    new-instance v8, Landroid/os/Handler;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {v8, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, LMc;

    .line 29
    .line 30
    move-object v2, v0

    .line 31
    move-object v3, p0

    .line 32
    move-object v5, p1

    .line 33
    move-object v6, p2

    .line 34
    move-object v7, p3

    .line 35
    move-object v9, p4

    .line 36
    invoke-direct/range {v2 .. v9}, LMc;-><init>(LNc;Ljava/lang/String;Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/Bridge;Lnf;Landroid/os/Handler;LN2;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Lpi;

    .line 40
    .line 41
    invoke-direct {p1, v0}, Lpi;-><init>(LMc;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
