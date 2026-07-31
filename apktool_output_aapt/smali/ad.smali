.class public abstract Lad;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;

.field public static final b:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lad;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lad;->b:Ljava/util/HashMap;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Ljava/lang/reflect/Constructor;Ljava/lang/Object;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput-object p1, v0, v1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "{\n            constructo\u2026tance(`object`)\n        }"

    .line 12
    .line 13
    invoke-static {p1, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ljava/lang/ClassCastException;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 19
    .line 20
    .line 21
    throw p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :catch_1
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :catch_2
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :goto_0
    new-instance p1, Ljava/lang/RuntimeException;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    throw p1

    .line 34
    :goto_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    throw p1

    .line 40
    :goto_2
    new-instance p1, Ljava/lang/RuntimeException;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public static final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "."

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, v1, v2, v2}, LJh;->G(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-gez v3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-ltz v4, :cond_3

    .line 21
    .line 22
    new-instance v5, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 25
    .line 26
    .line 27
    move v4, v2

    .line 28
    :cond_1
    invoke-virtual {v5, p0, v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v4, "_"

    .line 32
    .line 33
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    add-int/lit8 v4, v3, 0x1

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-ge v3, v6, :cond_2

    .line 43
    .line 44
    invoke-static {p0, v1, v4, v2}, LJh;->G(Ljava/lang/CharSequence;Ljava/lang/String;IZ)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-gtz v3, :cond_1

    .line 49
    .line 50
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v5, p0, v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v1, "toString(...)"

    .line 62
    .line 63
    invoke-static {v1, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p0, "_LifecycleAdapter"

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 80
    .line 81
    invoke-direct {p0}, Ljava/lang/OutOfMemoryError;-><init>()V

    .line 82
    .line 83
    .line 84
    throw p0
.end method

.method public static c(Ljava/lang/Class;)I
    .locals 13

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    sget-object v2, Lad;->a:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    check-cast v3, Ljava/lang/Integer;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    goto/16 :goto_c

    .line 25
    .line 26
    :cond_1
    const/4 v3, 0x0

    .line 27
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    if-eqz v4, :cond_2

    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    goto :goto_3

    .line 44
    :cond_2
    const-string v4, ""

    .line 45
    .line 46
    :goto_0
    const-string v6, "fullPackage"

    .line 47
    .line 48
    invoke-static {v6, v4}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-nez v6, :cond_3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const-string v6, "name"

    .line 59
    .line 60
    invoke-static {v6, v5}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    add-int/2addr v6, v1

    .line 68
    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    const-string v6, "this as java.lang.String).substring(startIndex)"

    .line 73
    .line 74
    invoke-static {v6, v5}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :goto_1
    const-string v6, "if (fullPackage.isEmpty(\u2026g(fullPackage.length + 1)"

    .line 78
    .line 79
    invoke-static {v6, v5}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v5}, Lad;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-nez v6, :cond_4

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const/16 v4, 0x2e

    .line 102
    .line 103
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    :goto_2
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    new-array v5, v1, [Ljava/lang/Class;

    .line 118
    .line 119
    aput-object p0, v5, v0

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v4}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-nez v5, :cond_5

    .line 130
    .line 131
    invoke-virtual {v4, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .line 133
    .line 134
    goto :goto_4

    .line 135
    :goto_3
    new-instance v0, Ljava/lang/RuntimeException;

    .line 136
    .line 137
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    throw v0

    .line 141
    :catch_1
    move-object v4, v3

    .line 142
    :cond_5
    :goto_4
    sget-object v5, Lad;->b:Ljava/util/HashMap;

    .line 143
    .line 144
    const/4 v6, 0x2

    .line 145
    if-eqz v4, :cond_6

    .line 146
    .line 147
    invoke-static {v4}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v5, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    :goto_5
    move v1, v6

    .line 155
    goto/16 :goto_c

    .line 156
    .line 157
    :cond_6
    sget-object v4, Lp4;->c:Lp4;

    .line 158
    .line 159
    iget-object v7, v4, Lp4;->b:Ljava/util/HashMap;

    .line 160
    .line 161
    invoke-virtual {v7, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    check-cast v8, Ljava/lang/Boolean;

    .line 166
    .line 167
    if-eqz v8, :cond_7

    .line 168
    .line 169
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    goto :goto_7

    .line 174
    :cond_7
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    .line 175
    .line 176
    .line 177
    move-result-object v8
    :try_end_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_2

    .line 178
    array-length v9, v8

    .line 179
    move v10, v0

    .line 180
    :goto_6
    if-ge v10, v9, :cond_9

    .line 181
    .line 182
    aget-object v11, v8, v10

    .line 183
    .line 184
    const-class v12, LYe;

    .line 185
    .line 186
    invoke-virtual {v11, v12}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 187
    .line 188
    .line 189
    move-result-object v11

    .line 190
    check-cast v11, LYe;

    .line 191
    .line 192
    if-eqz v11, :cond_8

    .line 193
    .line 194
    invoke-virtual {v4, p0, v8}, Lp4;->a(Ljava/lang/Class;[Ljava/lang/reflect/Method;)Ln4;

    .line 195
    .line 196
    .line 197
    move v4, v1

    .line 198
    goto :goto_7

    .line 199
    :cond_8
    add-int/2addr v10, v1

    .line 200
    goto :goto_6

    .line 201
    :cond_9
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 202
    .line 203
    invoke-virtual {v7, p0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move v4, v0

    .line 207
    :goto_7
    if-eqz v4, :cond_a

    .line 208
    .line 209
    goto/16 :goto_c

    .line 210
    .line 211
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    const-class v7, LXc;

    .line 216
    .line 217
    if-eqz v4, :cond_b

    .line 218
    .line 219
    invoke-virtual {v7, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 220
    .line 221
    .line 222
    move-result v8

    .line 223
    if-eqz v8, :cond_b

    .line 224
    .line 225
    move v8, v1

    .line 226
    goto :goto_8

    .line 227
    :cond_b
    move v8, v0

    .line 228
    :goto_8
    if-eqz v8, :cond_d

    .line 229
    .line 230
    const-string v3, "superclass"

    .line 231
    .line 232
    invoke-static {v3, v4}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v4}, Lad;->c(Ljava/lang/Class;)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    if-ne v3, v1, :cond_c

    .line 240
    .line 241
    goto :goto_c

    .line 242
    :cond_c
    new-instance v3, Ljava/util/ArrayList;

    .line 243
    .line 244
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    invoke-static {v4}, Llc;->e(Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    check-cast v4, Ljava/util/Collection;

    .line 252
    .line 253
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 254
    .line 255
    .line 256
    :cond_d
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    const-string v8, "klass.interfaces"

    .line 261
    .line 262
    invoke-static {v8, v4}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    array-length v8, v4

    .line 266
    move v9, v0

    .line 267
    :goto_9
    if-ge v9, v8, :cond_12

    .line 268
    .line 269
    aget-object v10, v4, v9

    .line 270
    .line 271
    if-eqz v10, :cond_e

    .line 272
    .line 273
    invoke-virtual {v7, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 274
    .line 275
    .line 276
    move-result v11

    .line 277
    if-eqz v11, :cond_e

    .line 278
    .line 279
    move v11, v1

    .line 280
    goto :goto_a

    .line 281
    :cond_e
    move v11, v0

    .line 282
    :goto_a
    if-nez v11, :cond_f

    .line 283
    .line 284
    goto :goto_b

    .line 285
    :cond_f
    const-string v11, "intrface"

    .line 286
    .line 287
    invoke-static {v11, v10}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 288
    .line 289
    .line 290
    invoke-static {v10}, Lad;->c(Ljava/lang/Class;)I

    .line 291
    .line 292
    .line 293
    move-result v11

    .line 294
    if-ne v11, v1, :cond_10

    .line 295
    .line 296
    goto :goto_c

    .line 297
    :cond_10
    if-nez v3, :cond_11

    .line 298
    .line 299
    new-instance v3, Ljava/util/ArrayList;

    .line 300
    .line 301
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 302
    .line 303
    .line 304
    :cond_11
    invoke-virtual {v5, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v10

    .line 308
    invoke-static {v10}, Llc;->e(Ljava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    check-cast v10, Ljava/util/Collection;

    .line 312
    .line 313
    invoke-interface {v3, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 314
    .line 315
    .line 316
    :goto_b
    add-int/2addr v9, v1

    .line 317
    goto :goto_9

    .line 318
    :cond_12
    if-eqz v3, :cond_13

    .line 319
    .line 320
    invoke-virtual {v5, p0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    goto/16 :goto_5

    .line 324
    .line 325
    :cond_13
    :goto_c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v2, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    return v1

    .line 333
    :catch_2
    move-exception p0

    .line 334
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 335
    .line 336
    const-string v1, "The observer class has some methods that use newer APIs which are not available in the current OS version. Lifecycles cannot access even other methods so you should make sure that your observer classes only access framework classes that are available in your min API level OR use lifecycle:compiler annotation processor."

    .line 337
    .line 338
    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 339
    .line 340
    .line 341
    throw v0
.end method
