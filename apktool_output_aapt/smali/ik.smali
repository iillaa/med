.class public abstract Lik;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lg1;

.field public static final b:Lg1;

.field public static final c:Lg1;

.field public static final d:Lg1;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lg1;

    .line 2
    .line 3
    const-string v1, "VISUAL_STATE_CALLBACK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lg1;

    .line 10
    .line 11
    const-string v1, "OFF_SCREEN_PRERASTER"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lg1;

    .line 18
    .line 19
    const-string v1, "SAFE_BROWSING_ENABLE"

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lg1;

    .line 26
    .line 27
    const-string v1, "DISABLED_ACTION_MODE_MENU_ITEMS"

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lg1;

    .line 34
    .line 35
    const-string v1, "START_SAFE_BROWSING"

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Lg1;

    .line 42
    .line 43
    const-string v1, "SAFE_BROWSING_WHITELIST"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Lg1;

    .line 50
    .line 51
    const-string v2, "SAFE_BROWSING_ALLOWLIST"

    .line 52
    .line 53
    const/4 v3, 0x4

    .line 54
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lg1;

    .line 58
    .line 59
    const/4 v3, 0x4

    .line 60
    invoke-direct {v0, v3, v2, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Lg1;

    .line 64
    .line 65
    const/4 v1, 0x4

    .line 66
    invoke-direct {v0, v1, v2, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Lg1;

    .line 70
    .line 71
    const-string v1, "SAFE_BROWSING_PRIVACY_POLICY_URL"

    .line 72
    .line 73
    const/4 v2, 0x4

    .line 74
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Lg1;

    .line 78
    .line 79
    const-string v1, "SERVICE_WORKER_BASIC_USAGE"

    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    new-instance v0, Lg1;

    .line 86
    .line 87
    const-string v1, "SERVICE_WORKER_CACHE_MODE"

    .line 88
    .line 89
    const/4 v2, 0x1

    .line 90
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Lg1;

    .line 94
    .line 95
    const-string v1, "SERVICE_WORKER_CONTENT_ACCESS"

    .line 96
    .line 97
    const/4 v2, 0x1

    .line 98
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Lg1;

    .line 102
    .line 103
    const-string v1, "SERVICE_WORKER_FILE_ACCESS"

    .line 104
    .line 105
    const/4 v2, 0x1

    .line 106
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Lg1;

    .line 110
    .line 111
    const-string v1, "SERVICE_WORKER_BLOCK_NETWORK_LOADS"

    .line 112
    .line 113
    const/4 v2, 0x1

    .line 114
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    new-instance v0, Lg1;

    .line 118
    .line 119
    const-string v1, "SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST"

    .line 120
    .line 121
    const/4 v2, 0x1

    .line 122
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Lg1;

    .line 126
    .line 127
    const-string v1, "RECEIVE_WEB_RESOURCE_ERROR"

    .line 128
    .line 129
    const/4 v2, 0x0

    .line 130
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    new-instance v0, Lg1;

    .line 134
    .line 135
    const-string v1, "RECEIVE_HTTP_ERROR"

    .line 136
    .line 137
    const/4 v2, 0x0

    .line 138
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Lg1;

    .line 142
    .line 143
    const-string v1, "SHOULD_OVERRIDE_WITH_REDIRECTS"

    .line 144
    .line 145
    const/4 v2, 0x1

    .line 146
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    new-instance v0, Lg1;

    .line 150
    .line 151
    const-string v1, "SAFE_BROWSING_HIT"

    .line 152
    .line 153
    const/4 v2, 0x4

    .line 154
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    new-instance v0, Lg1;

    .line 158
    .line 159
    const-string v1, "WEB_RESOURCE_REQUEST_IS_REDIRECT"

    .line 160
    .line 161
    const/4 v2, 0x1

    .line 162
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    new-instance v0, Lg1;

    .line 166
    .line 167
    const-string v1, "WEB_RESOURCE_ERROR_GET_DESCRIPTION"

    .line 168
    .line 169
    const/4 v2, 0x0

    .line 170
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    new-instance v0, Lg1;

    .line 174
    .line 175
    const-string v1, "WEB_RESOURCE_ERROR_GET_CODE"

    .line 176
    .line 177
    const/4 v2, 0x0

    .line 178
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    new-instance v0, Lg1;

    .line 182
    .line 183
    const-string v1, "SAFE_BROWSING_RESPONSE_BACK_TO_SAFETY"

    .line 184
    .line 185
    const/4 v2, 0x4

    .line 186
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Lg1;

    .line 190
    .line 191
    const-string v1, "SAFE_BROWSING_RESPONSE_PROCEED"

    .line 192
    .line 193
    const/4 v2, 0x4

    .line 194
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    new-instance v0, Lg1;

    .line 198
    .line 199
    const-string v1, "SAFE_BROWSING_RESPONSE_SHOW_INTERSTITIAL"

    .line 200
    .line 201
    const/4 v2, 0x4

    .line 202
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    new-instance v0, Lg1;

    .line 206
    .line 207
    const-string v1, "WEB_MESSAGE_PORT_POST_MESSAGE"

    .line 208
    .line 209
    const/4 v2, 0x0

    .line 210
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    new-instance v0, Lg1;

    .line 214
    .line 215
    const-string v1, "WEB_MESSAGE_PORT_CLOSE"

    .line 216
    .line 217
    const/4 v2, 0x0

    .line 218
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    new-instance v0, Lg1;

    .line 222
    .line 223
    const-string v1, "WEB_MESSAGE_ARRAY_BUFFER"

    .line 224
    .line 225
    const/4 v2, 0x2

    .line 226
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    sput-object v0, Lik;->a:Lg1;

    .line 230
    .line 231
    new-instance v0, Lg1;

    .line 232
    .line 233
    const-string v1, "WEB_MESSAGE_PORT_SET_MESSAGE_CALLBACK"

    .line 234
    .line 235
    const/4 v2, 0x0

    .line 236
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    new-instance v0, Lg1;

    .line 240
    .line 241
    const-string v1, "CREATE_WEB_MESSAGE_CHANNEL"

    .line 242
    .line 243
    const/4 v2, 0x0

    .line 244
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    new-instance v0, Lg1;

    .line 248
    .line 249
    const-string v1, "POST_WEB_MESSAGE"

    .line 250
    .line 251
    const/4 v2, 0x0

    .line 252
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    new-instance v0, Lg1;

    .line 256
    .line 257
    const-string v1, "WEB_MESSAGE_CALLBACK_ON_MESSAGE"

    .line 258
    .line 259
    const/4 v2, 0x0

    .line 260
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    new-instance v0, Lg1;

    .line 264
    .line 265
    const-string v1, "GET_WEB_VIEW_CLIENT"

    .line 266
    .line 267
    const/4 v2, 0x3

    .line 268
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    new-instance v0, Lg1;

    .line 272
    .line 273
    const-string v1, "GET_WEB_CHROME_CLIENT"

    .line 274
    .line 275
    const/4 v2, 0x3

    .line 276
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    new-instance v0, Lg1;

    .line 280
    .line 281
    const-string v1, "GET_WEB_VIEW_RENDERER"

    .line 282
    .line 283
    const/4 v2, 0x6

    .line 284
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    new-instance v0, Lg1;

    .line 288
    .line 289
    const-string v1, "WEB_VIEW_RENDERER_TERMINATE"

    .line 290
    .line 291
    const/4 v2, 0x6

    .line 292
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    new-instance v0, Lg1;

    .line 296
    .line 297
    const-string v1, "TRACING_CONTROLLER_BASIC_USAGE"

    .line 298
    .line 299
    const/4 v2, 0x5

    .line 300
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    new-instance v0, Lwh;

    .line 304
    .line 305
    invoke-direct {v0}, Lwh;-><init>()V

    .line 306
    .line 307
    .line 308
    new-instance v0, Lwh;

    .line 309
    .line 310
    invoke-direct {v0}, Lwh;-><init>()V

    .line 311
    .line 312
    .line 313
    new-instance v0, Lg1;

    .line 314
    .line 315
    const-string v1, "WEB_VIEW_RENDERER_CLIENT_BASIC_USAGE"

    .line 316
    .line 317
    const/4 v2, 0x6

    .line 318
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    new-instance v0, Lgk;

    .line 322
    .line 323
    invoke-direct {v0}, Lgk;-><init>()V

    .line 324
    .line 325
    .line 326
    new-instance v0, Lg1;

    .line 327
    .line 328
    const-string v1, "PROXY_OVERRIDE"

    .line 329
    .line 330
    const-string v2, "PROXY_OVERRIDE:3"

    .line 331
    .line 332
    const/4 v3, 0x2

    .line 333
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    new-instance v0, Lg1;

    .line 337
    .line 338
    const-string v1, "MULTI_PROCESS"

    .line 339
    .line 340
    const-string v2, "MULTI_PROCESS_QUERY"

    .line 341
    .line 342
    const/4 v3, 0x2

    .line 343
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    sput-object v0, Lik;->b:Lg1;

    .line 347
    .line 348
    new-instance v0, Lg1;

    .line 349
    .line 350
    const-string v1, "FORCE_DARK"

    .line 351
    .line 352
    const/4 v2, 0x6

    .line 353
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    new-instance v0, Lg1;

    .line 357
    .line 358
    const-string v1, "FORCE_DARK_STRATEGY"

    .line 359
    .line 360
    const-string v2, "FORCE_DARK_BEHAVIOR"

    .line 361
    .line 362
    const/4 v3, 0x2

    .line 363
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    new-instance v0, Lg1;

    .line 367
    .line 368
    const-string v1, "WEB_MESSAGE_LISTENER"

    .line 369
    .line 370
    const/4 v2, 0x2

    .line 371
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    sput-object v0, Lik;->c:Lg1;

    .line 375
    .line 376
    new-instance v0, Lg1;

    .line 377
    .line 378
    const-string v1, "DOCUMENT_START_SCRIPT"

    .line 379
    .line 380
    const-string v2, "DOCUMENT_START_SCRIPT:1"

    .line 381
    .line 382
    const/4 v3, 0x2

    .line 383
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    sput-object v0, Lik;->d:Lg1;

    .line 387
    .line 388
    new-instance v0, Lg1;

    .line 389
    .line 390
    const-string v1, "PROXY_OVERRIDE_REVERSE_BYPASS"

    .line 391
    .line 392
    const/4 v2, 0x2

    .line 393
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    new-instance v0, Lg1;

    .line 397
    .line 398
    const-string v1, "GET_VARIATIONS_HEADER"

    .line 399
    .line 400
    const/4 v2, 0x2

    .line 401
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    new-instance v0, Lg1;

    .line 405
    .line 406
    const-string v1, "ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY"

    .line 407
    .line 408
    const/4 v2, 0x2

    .line 409
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    new-instance v0, Lg1;

    .line 413
    .line 414
    const-string v1, "GET_COOKIE_INFO"

    .line 415
    .line 416
    const/4 v2, 0x2

    .line 417
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    new-instance v0, Lg1;

    .line 421
    .line 422
    const-string v1, "REQUESTED_WITH_HEADER_ALLOW_LIST"

    .line 423
    .line 424
    const/4 v2, 0x2

    .line 425
    invoke-direct {v0, v2, v1, v1}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    new-instance v0, Lg1;

    .line 429
    .line 430
    const-string v1, "USER_AGENT_METADATA"

    .line 431
    .line 432
    const-string v2, "USER_AGENT_METADATA"

    .line 433
    .line 434
    const/4 v3, 0x2

    .line 435
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    new-instance v0, Lhk;

    .line 439
    .line 440
    const-string v1, "MULTI_PROFILE"

    .line 441
    .line 442
    const-string v2, "MULTI_PROFILE"

    .line 443
    .line 444
    const/4 v3, 0x2

    .line 445
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    new-instance v0, Lg1;

    .line 449
    .line 450
    const-string v1, "ATTRIBUTION_REGISTRATION_BEHAVIOR"

    .line 451
    .line 452
    const-string v2, "ATTRIBUTION_BEHAVIOR"

    .line 453
    .line 454
    const/4 v3, 0x2

    .line 455
    invoke-direct {v0, v3, v1, v2}, Lg1;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    return-void
.end method
