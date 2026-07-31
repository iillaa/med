.class public abstract Llc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Li0;

.field public static final b:Li0;

.field public static final c:Li0;

.field public static final d:Ljava/lang/Object;

.field public static final e:Ljava/lang/Object;

.field public static f:Ljava/lang/reflect/Method; = null

.field public static g:Z = false

.field public static h:Z = false

.field public static i:Ljava/lang/reflect/Method; = null

.field public static j:Z = false

.field public static k:Ljava/lang/reflect/Field;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Li0;

    .line 2
    .line 3
    const-string v1, "RESUME_TOKEN"

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Llc;->a:Li0;

    .line 11
    .line 12
    new-instance v0, Li0;

    .line 13
    .line 14
    const-string v1, "UNDEFINED"

    .line 15
    .line 16
    const/16 v2, 0x14

    .line 17
    .line 18
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Llc;->b:Li0;

    .line 22
    .line 23
    new-instance v0, Li0;

    .line 24
    .line 25
    const-string v1, "REUSABLE_CLAIMED"

    .line 26
    .line 27
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Llc;->c:Li0;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/Object;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    sput-object v0, Llc;->d:Ljava/lang/Object;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/Object;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object v0, Llc;->e:Ljava/lang/Object;

    .line 45
    .line 46
    return-void
.end method

.method public static A(Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources;)LV8;
    .locals 24

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    :goto_0
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x2

    .line 9
    if-eq v1, v3, :cond_0

    .line 10
    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    if-ne v1, v3, :cond_10

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const-string v4, "font-family"

    .line 18
    .line 19
    move-object/from16 v5, p0

    .line 20
    .line 21
    invoke-interface {v5, v3, v1, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_f

    .line 33
    .line 34
    invoke-static/range {p0 .. p0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    sget-object v6, LLf;->b:[I

    .line 39
    .line 40
    invoke-virtual {v0, v4, v6}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-virtual {v4, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const/4 v8, 0x5

    .line 50
    invoke-virtual {v4, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    const/4 v10, 0x6

    .line 55
    invoke-virtual {v4, v10}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    invoke-virtual {v4, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v12

    .line 63
    invoke-virtual {v4, v2, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 64
    .line 65
    .line 66
    move-result v13

    .line 67
    const/4 v14, 0x3

    .line 68
    invoke-virtual {v4, v14, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 69
    .line 70
    .line 71
    move-result v18

    .line 72
    const/4 v15, 0x4

    .line 73
    const/16 v1, 0x1f4

    .line 74
    .line 75
    invoke-virtual {v4, v15, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 76
    .line 77
    .line 78
    move-result v19

    .line 79
    const/4 v1, 0x7

    .line 80
    invoke-virtual {v4, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v20

    .line 84
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    .line 86
    .line 87
    if-eqz v7, :cond_3

    .line 88
    .line 89
    if-eqz v9, :cond_3

    .line 90
    .line 91
    if-eqz v11, :cond_3

    .line 92
    .line 93
    :goto_1
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eq v1, v14, :cond_1

    .line 98
    .line 99
    invoke-static/range {p0 .. p0}, Llc;->M(Landroid/content/res/XmlResourceParser;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_1
    invoke-static {v0, v13}, Llc;->E(Landroid/content/res/Resources;I)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    if-eqz v12, :cond_2

    .line 108
    .line 109
    new-instance v1, LO8;

    .line 110
    .line 111
    invoke-direct {v1, v7, v9, v12, v0}, LO8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 112
    .line 113
    .line 114
    move-object/from16 v17, v1

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_2
    const/16 v17, 0x0

    .line 118
    .line 119
    :goto_2
    new-instance v1, LY8;

    .line 120
    .line 121
    new-instance v2, LO8;

    .line 122
    .line 123
    invoke-direct {v2, v7, v9, v11, v0}, LO8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    move-object v15, v1

    .line 127
    move-object/from16 v16, v2

    .line 128
    .line 129
    invoke-direct/range {v15 .. v20}, LY8;-><init>(LO8;LO8;IILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    goto/16 :goto_c

    .line 133
    .line 134
    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    :goto_3
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    if-eq v7, v14, :cond_d

    .line 144
    .line 145
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    if-eq v7, v3, :cond_4

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_4
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    const-string v9, "font"

    .line 157
    .line 158
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    if-eqz v7, :cond_c

    .line 163
    .line 164
    invoke-static/range {p0 .. p0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 165
    .line 166
    .line 167
    move-result-object v7

    .line 168
    sget-object v9, LLf;->c:[I

    .line 169
    .line 170
    invoke-virtual {v0, v7, v9}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    const/16 v9, 0x8

    .line 175
    .line 176
    invoke-virtual {v7, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    if-eqz v11, :cond_5

    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_5
    move v9, v2

    .line 184
    :goto_4
    const/16 v11, 0x190

    .line 185
    .line 186
    invoke-virtual {v7, v9, v11}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 187
    .line 188
    .line 189
    move-result v18

    .line 190
    invoke-virtual {v7, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 191
    .line 192
    .line 193
    move-result v9

    .line 194
    if-eqz v9, :cond_6

    .line 195
    .line 196
    move v9, v10

    .line 197
    goto :goto_5

    .line 198
    :cond_6
    move v9, v3

    .line 199
    :goto_5
    invoke-virtual {v7, v9, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    if-ne v2, v9, :cond_7

    .line 204
    .line 205
    move/from16 v23, v2

    .line 206
    .line 207
    goto :goto_6

    .line 208
    :cond_7
    move/from16 v23, v6

    .line 209
    .line 210
    :goto_6
    const/16 v9, 0x9

    .line 211
    .line 212
    invoke-virtual {v7, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 213
    .line 214
    .line 215
    move-result v11

    .line 216
    if-eqz v11, :cond_8

    .line 217
    .line 218
    goto :goto_7

    .line 219
    :cond_8
    move v9, v14

    .line 220
    :goto_7
    invoke-virtual {v7, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 221
    .line 222
    .line 223
    move-result v11

    .line 224
    if-eqz v11, :cond_9

    .line 225
    .line 226
    move v11, v1

    .line 227
    goto :goto_8

    .line 228
    :cond_9
    move v11, v15

    .line 229
    :goto_8
    invoke-virtual {v7, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v22

    .line 233
    invoke-virtual {v7, v9, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 234
    .line 235
    .line 236
    move-result v19

    .line 237
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 238
    .line 239
    .line 240
    move-result v9

    .line 241
    if-eqz v9, :cond_a

    .line 242
    .line 243
    move v9, v8

    .line 244
    goto :goto_9

    .line 245
    :cond_a
    move v9, v6

    .line 246
    :goto_9
    invoke-virtual {v7, v9, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 247
    .line 248
    .line 249
    move-result v20

    .line 250
    invoke-virtual {v7, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v21

    .line 254
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 255
    .line 256
    .line 257
    :goto_a
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    if-eq v7, v14, :cond_b

    .line 262
    .line 263
    invoke-static/range {p0 .. p0}, Llc;->M(Landroid/content/res/XmlResourceParser;)V

    .line 264
    .line 265
    .line 266
    goto :goto_a

    .line 267
    :cond_b
    new-instance v7, LX8;

    .line 268
    .line 269
    move-object/from16 v17, v7

    .line 270
    .line 271
    invoke-direct/range {v17 .. v23}, LX8;-><init>(IIILjava/lang/String;Ljava/lang/String;Z)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    goto/16 :goto_3

    .line 278
    .line 279
    :cond_c
    invoke-static/range {p0 .. p0}, Llc;->M(Landroid/content/res/XmlResourceParser;)V

    .line 280
    .line 281
    .line 282
    goto/16 :goto_3

    .line 283
    .line 284
    :cond_d
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-eqz v0, :cond_e

    .line 289
    .line 290
    goto :goto_b

    .line 291
    :cond_e
    new-instance v1, LW8;

    .line 292
    .line 293
    new-array v0, v6, [LX8;

    .line 294
    .line 295
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    check-cast v0, [LX8;

    .line 300
    .line 301
    invoke-direct {v1, v0}, LW8;-><init>([LX8;)V

    .line 302
    .line 303
    .line 304
    goto :goto_c

    .line 305
    :cond_f
    invoke-static/range {p0 .. p0}, Llc;->M(Landroid/content/res/XmlResourceParser;)V

    .line 306
    .line 307
    .line 308
    :goto_b
    const/4 v1, 0x0

    .line 309
    :goto_c
    return-object v1

    .line 310
    :cond_10
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    .line 311
    .line 312
    const-string v1, "No start tag found"

    .line 313
    .line 314
    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    throw v0
.end method

.method public static D(Ljava/nio/MappedByteBuffer;)Lpe;
    .locals 13

    .line 1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    add-int/lit8 v0, v0, 0x4

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const v1, 0xffff

    .line 24
    .line 25
    .line 26
    and-int/2addr v0, v1

    .line 27
    const/16 v1, 0x64

    .line 28
    .line 29
    const-string v2, "Cannot read metadata."

    .line 30
    .line 31
    if-gt v0, v1, :cond_5

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/lit8 v1, v1, 0x6

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    move v3, v1

    .line 44
    :goto_0
    const-wide v4, 0xffffffffL

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    const-wide/16 v6, -0x1

    .line 50
    .line 51
    if-ge v3, v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 58
    .line 59
    .line 60
    move-result v9

    .line 61
    add-int/lit8 v9, v9, 0x4

    .line 62
    .line 63
    invoke-virtual {p0, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    int-to-long v9, v9

    .line 71
    and-long/2addr v9, v4

    .line 72
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    add-int/lit8 v11, v11, 0x4

    .line 77
    .line 78
    invoke-virtual {p0, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 79
    .line 80
    .line 81
    const v11, 0x6d657461

    .line 82
    .line 83
    .line 84
    if-ne v11, v8, :cond_0

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    move-wide v9, v6

    .line 91
    :goto_1
    cmp-long v0, v9, v6

    .line 92
    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    int-to-long v6, v0

    .line 100
    sub-long v6, v9, v6

    .line 101
    .line 102
    long-to-int v0, v6

    .line 103
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    add-int/2addr v3, v0

    .line 108
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/lit8 v0, v0, 0xc

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    int-to-long v6, v0

    .line 125
    and-long/2addr v6, v4

    .line 126
    :goto_2
    int-to-long v11, v1

    .line 127
    cmp-long v0, v11, v6

    .line 128
    .line 129
    if-gez v0, :cond_4

    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    int-to-long v11, v3

    .line 140
    and-long/2addr v11, v4

    .line 141
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 142
    .line 143
    .line 144
    const v3, 0x456d6a69

    .line 145
    .line 146
    .line 147
    if-eq v3, v0, :cond_3

    .line 148
    .line 149
    const v3, 0x656d6a69

    .line 150
    .line 151
    .line 152
    if-ne v3, v0, :cond_2

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_3
    :goto_3
    add-long/2addr v11, v9

    .line 159
    long-to-int v0, v11

    .line 160
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 161
    .line 162
    .line 163
    new-instance v0, Lpe;

    .line 164
    .line 165
    invoke-direct {v0}, Lbi;-><init>()V

    .line 166
    .line 167
    .line 168
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 169
    .line 170
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    add-int/2addr v2, v1

    .line 186
    iput-object p0, v0, Lbi;->d:Ljava/lang/Object;

    .line 187
    .line 188
    iput v2, v0, Lbi;->a:I

    .line 189
    .line 190
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    sub-int/2addr v2, p0

    .line 195
    iput v2, v0, Lbi;->b:I

    .line 196
    .line 197
    iget-object p0, v0, Lbi;->d:Ljava/lang/Object;

    .line 198
    .line 199
    check-cast p0, Ljava/nio/ByteBuffer;

    .line 200
    .line 201
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    iput p0, v0, Lbi;->c:I

    .line 206
    .line 207
    return-object v0

    .line 208
    :cond_4
    new-instance p0, Ljava/io/IOException;

    .line 209
    .line 210
    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    throw p0

    .line 214
    :cond_5
    new-instance p0, Ljava/io/IOException;

    .line 215
    .line 216
    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    throw p0
.end method

.method public static E(Landroid/content/res/Resources;I)Ljava/util/List;
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :try_start_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_3

    .line 28
    :cond_1
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getType(I)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/4 v4, 0x1

    .line 39
    if-ne v3, v4, :cond_4

    .line 40
    .line 41
    move p1, v2

    .line 42
    :goto_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-ge p1, v3, :cond_6

    .line 47
    .line 48
    invoke-virtual {v0, p1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-instance v4, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    array-length v5, v3

    .line 64
    move v6, v2

    .line 65
    :goto_1
    if-ge v6, v5, :cond_2

    .line 66
    .line 67
    aget-object v7, v3, v6

    .line 68
    .line 69
    invoke-static {v7, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    add-int/lit8 v6, v6, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_3
    add-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    array-length v3, p0

    .line 95
    move v4, v2

    .line 96
    :goto_2
    if-ge v4, v3, :cond_5

    .line 97
    .line 98
    aget-object v5, p0, v4

    .line 99
    .line 100
    invoke-static {v5, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    add-int/lit8 v4, v4, 0x1

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_5
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    .line 112
    .line 113
    :cond_6
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 114
    .line 115
    .line 116
    return-object v1

    .line 117
    :goto_3
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 118
    .line 119
    .line 120
    throw p0
.end method

.method public static final F(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    instance-of v0, p0, LI4;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LI4;

    .line 6
    .line 7
    iget-object p0, p0, LI4;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    invoke-static {p0}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    return-object p0
.end method

.method public static final G(Lr5;Ljava/lang/Object;)V
    .locals 9

    .line 1
    instance-of v0, p0, LO6;

    .line 2
    .line 3
    if-eqz v0, :cond_a

    .line 4
    .line 5
    check-cast p0, LO6;

    .line 6
    .line 7
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    move-object v1, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v1, LI4;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v1, v0, v2}, LI4;-><init>(Ljava/lang/Throwable;Z)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object v0, p0, LO6;->g:Lr5;

    .line 22
    .line 23
    invoke-interface {v0}, Lr5;->getContext()LY5;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, LO6;->f:Lc6;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Lc6;->e(LY5;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v4, 0x1

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iput-object v1, p0, LO6;->h:Ljava/lang/Object;

    .line 37
    .line 38
    iput v4, p0, LQ6;->e:I

    .line 39
    .line 40
    invoke-interface {v0}, Lr5;->getContext()LY5;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v3, p1, p0}, Lc6;->d(LY5;Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_5

    .line 48
    .line 49
    :cond_1
    invoke-static {}, Lmi;->a()LM7;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-wide v5, v2, LM7;->e:J

    .line 54
    .line 55
    const-wide v7, 0x100000000L

    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    cmp-long v3, v5, v7

    .line 61
    .line 62
    if-ltz v3, :cond_3

    .line 63
    .line 64
    iput-object v1, p0, LO6;->h:Ljava/lang/Object;

    .line 65
    .line 66
    iput v4, p0, LQ6;->e:I

    .line 67
    .line 68
    iget-object p1, v2, LM7;->g:LZ2;

    .line 69
    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    new-instance p1, LZ2;

    .line 73
    .line 74
    invoke-direct {p1}, LZ2;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, v2, LM7;->g:LZ2;

    .line 78
    .line 79
    :cond_2
    invoke-virtual {p1, p0}, LZ2;->addLast(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    goto/16 :goto_5

    .line 83
    .line 84
    :cond_3
    invoke-virtual {v2, v4}, LM7;->l(Z)V

    .line 85
    .line 86
    .line 87
    :try_start_0
    invoke-interface {v0}, Lr5;->getContext()LY5;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget-object v3, Lt5;->g:Lt5;

    .line 92
    .line 93
    invoke-interface {v1, v3}, LY5;->c(LX5;)LW5;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Luc;

    .line 98
    .line 99
    if-eqz v1, :cond_4

    .line 100
    .line 101
    invoke-interface {v1}, Luc;->b()Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_4

    .line 106
    .line 107
    check-cast v1, LBc;

    .line 108
    .line 109
    invoke-virtual {v1}, LBc;->u()Ljava/util/concurrent/CancellationException;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, LO6;->h(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :catchall_0
    move-exception p1

    .line 122
    goto :goto_4

    .line 123
    :cond_4
    iget-object v1, p0, LO6;->i:Ljava/lang/Object;

    .line 124
    .line 125
    invoke-interface {v0}, Lr5;->getContext()LY5;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-static {v3, v1}, Lr3;->J(LY5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    sget-object v4, Lr3;->t:Li0;

    .line 134
    .line 135
    if-eq v1, v4, :cond_5

    .line 136
    .line 137
    invoke-static {v0, v3, v1}, LMk;->N(Lr5;LY5;Ljava/lang/Object;)Ldj;

    .line 138
    .line 139
    .line 140
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    goto :goto_1

    .line 142
    :cond_5
    const/4 v4, 0x0

    .line 143
    :goto_1
    :try_start_1
    invoke-interface {v0, p1}, Lr5;->h(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 144
    .line 145
    .line 146
    if-eqz v4, :cond_6

    .line 147
    .line 148
    :try_start_2
    invoke-virtual {v4}, Ldj;->Q()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_7

    .line 153
    .line 154
    :cond_6
    invoke-static {v3, v1}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    :cond_7
    :goto_2
    invoke-virtual {v2}, LM7;->m()Z

    .line 158
    .line 159
    .line 160
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 161
    if-nez p1, :cond_7

    .line 162
    .line 163
    :goto_3
    invoke-virtual {v2}, LM7;->g()V

    .line 164
    .line 165
    .line 166
    goto :goto_5

    .line 167
    :catchall_1
    move-exception p1

    .line 168
    if-eqz v4, :cond_8

    .line 169
    .line 170
    :try_start_3
    invoke-virtual {v4}, Ldj;->Q()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_9

    .line 175
    .line 176
    :cond_8
    invoke-static {v3, v1}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    :cond_9
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 180
    :goto_4
    :try_start_4
    invoke-virtual {p0, p1}, LQ6;->g(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 181
    .line 182
    .line 183
    goto :goto_3

    .line 184
    :catchall_2
    move-exception p0

    .line 185
    invoke-virtual {v2}, LM7;->g()V

    .line 186
    .line 187
    .line 188
    throw p0

    .line 189
    :cond_a
    invoke-interface {p0, p1}, Lr5;->h(Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    :goto_5
    return-void
.end method

.method public static H(Ljava/lang/RuntimeException;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, -0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    :goto_0
    if-ge v3, v1, :cond_1

    .line 9
    .line 10
    aget-object v4, v0, v3

    .line 11
    .line 12
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    move v2, v3

    .line 23
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, [Ljava/lang/StackTraceElement;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static final I(Lcom/getcapacitor/PluginCall;Lf8;)V
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "error"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lf8;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lf8;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    const-string p2, "<this>"

    .line 7
    .line 8
    invoke-static {p2, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0, p2}, Lcom/getcapacitor/PluginCall;->setKeepAlive(Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 26
    .line 27
    .line 28
    :goto_0
    return-void
.end method

.method public static M(Landroid/content/res/XmlResourceParser;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    if-lez v0, :cond_2

    .line 3
    .line 4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x2

    .line 9
    if-eq v1, v2, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_2
    return-void
.end method

.method public static final N(Ljava/lang/String;JJJ)J
    .locals 4

    .line 1
    sget v0, LVh;->a:I

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {v0}, LJh;->Q(Ljava/lang/String;)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/16 p2, 0x27

    .line 17
    .line 18
    const-string v1, "System property \'"

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    cmp-long p1, p3, v2

    .line 27
    .line 28
    if-gtz p1, :cond_1

    .line 29
    .line 30
    cmp-long p1, v2, p5

    .line 31
    .line 32
    if-gtz p1, :cond_1

    .line 33
    .line 34
    move-wide p1, v2

    .line 35
    :goto_1
    return-wide p1

    .line 36
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "\' should be in range "

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, ".."

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p0, ", but is \'"

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p1

    .line 85
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 86
    .line 87
    new-instance p3, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p0, "\' has unrecognized value \'"

    .line 96
    .line 97
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p1
.end method

.method public static O(Ljava/lang/String;IIII)I
    .locals 7

    .line 1
    and-int/lit8 v0, p4, 0x4

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    :cond_0
    and-int/lit8 p4, p4, 0x8

    .line 7
    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    const p3, 0x7fffffff

    .line 11
    .line 12
    .line 13
    :cond_1
    int-to-long v1, p1

    .line 14
    int-to-long v3, p2

    .line 15
    int-to-long v5, p3

    .line 16
    move-object v0, p0

    .line 17
    invoke-static/range {v0 .. v6}, Llc;->N(Ljava/lang/String;JJJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    long-to-int p0, p0

    .line 22
    return p0
.end method

.method public static final P(Ljava/lang/Object;)V
    .locals 1

    .line 1
    instance-of v0, p0, Log;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Log;

    .line 7
    .line 8
    iget-object p0, p0, Log;->c:Ljava/lang/Throwable;

    .line 9
    .line 10
    throw p0
.end method

.method public static a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    :goto_0
    return p0
.end method

.method public static e(Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    .line 7
    .line 8
    .line 9
    const-class v0, Llc;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p0, v0}, Llc;->H(Ljava/lang/RuntimeException;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    throw p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-class p0, Llc;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Llc;->H(Ljava/lang/RuntimeException;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    throw p1
.end method

.method public static g(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .line 5
    .line 6
    const-string v0, " must not be null"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-direct {p1, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-class p0, Llc;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p1, p0}, Llc;->H(Ljava/lang/RuntimeException;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p1
.end method

.method public static h(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5

    .line 1
    if-nez p1, :cond_2

    .line 2
    .line 3
    new-instance p1, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-class v1, Llc;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_0
    aget-object v4, v0, v3

    .line 21
    .line 22
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-nez v4, :cond_0

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    :goto_1
    aget-object v4, v0, v3

    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    aget-object v0, v0, v3

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v4, "Parameter specified as non-null is null: method "

    .line 63
    .line 64
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v2, "."

    .line 71
    .line 72
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, ", parameter "

    .line 79
    .line 80
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-direct {p1, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p1, p0}, Llc;->H(Ljava/lang/RuntimeException;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p1

    .line 101
    :cond_2
    return-void
.end method

.method public static i(Landroid/content/Context;)LQ8;
    .locals 8

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Lx6;

    .line 8
    .line 9
    const/16 v1, 0xa

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v0, Lt5;

    .line 16
    .line 17
    const/16 v1, 0xa

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "Package manager required to locate emoji font provider"

    .line 27
    .line 28
    invoke-static {v2, v1}, LSi;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Landroid/content/Intent;

    .line 32
    .line 33
    const-string v3, "androidx.content.action.LOAD_EMOJI_FONT"

    .line 34
    .line 35
    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->queryIntentContentProviders(Landroid/content/Intent;I)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    const/4 v5, 0x0

    .line 52
    if-eqz v4, :cond_2

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 59
    .line 60
    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->providerInfo:Landroid/content/pm/ProviderInfo;

    .line 61
    .line 62
    if-eqz v4, :cond_1

    .line 63
    .line 64
    iget-object v6, v4, Landroid/content/pm/ProviderInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 65
    .line 66
    if-eqz v6, :cond_1

    .line 67
    .line 68
    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 69
    .line 70
    const/4 v7, 0x1

    .line 71
    and-int/2addr v6, v7

    .line 72
    if-ne v6, v7, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    move-object v4, v5

    .line 76
    :goto_1
    if-nez v4, :cond_3

    .line 77
    .line 78
    :goto_2
    move-object v1, v5

    .line 79
    goto :goto_4

    .line 80
    :cond_3
    :try_start_0
    iget-object v2, v4, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v4, v4, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1, v4}, Lt5;->n(Landroid/content/pm/PackageManager;Ljava/lang/String;)[Landroid/content/pm/Signature;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    array-length v6, v0

    .line 94
    :goto_3
    if-ge v3, v6, :cond_4

    .line 95
    .line 96
    aget-object v7, v0, v3

    .line 97
    .line 98
    invoke-virtual {v7}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    add-int/lit8 v3, v3, 0x1

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, LO8;

    .line 113
    .line 114
    const-string v3, "emojicompat-emoji-font"

    .line 115
    .line 116
    invoke-direct {v1, v2, v4, v3, v0}, LO8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    goto :goto_4

    .line 120
    :catch_0
    move-exception v0

    .line 121
    const-string v1, "emoji2.text.DefaultEmojiConfig"

    .line 122
    .line 123
    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :goto_4
    if-nez v1, :cond_5

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_5
    new-instance v5, LQ8;

    .line 131
    .line 132
    new-instance v0, LP8;

    .line 133
    .line 134
    invoke-direct {v0, p0, v1}, LP8;-><init>(Landroid/content/Context;LO8;)V

    .line 135
    .line 136
    .line 137
    invoke-direct {v5, v0}, LQ8;-><init>(Lm7;)V

    .line 138
    .line 139
    .line 140
    :goto_5
    return-object v5
.end method

.method public static j(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;I)Landroid/animation/Animator;
    .locals 26

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p5

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v11

    const/4 v0, 0x0

    const/4 v13, 0x0

    :goto_0
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v14, 0x0

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v3

    if-le v3, v11, :cond_0

    goto :goto_1

    :cond_0
    move v2, v14

    goto/16 :goto_1f

    :cond_1
    :goto_1
    const/4 v3, 0x1

    if-eq v1, v3, :cond_0

    const/4 v4, 0x2

    if-eq v1, v4, :cond_2

    goto :goto_0

    :cond_2
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "objectAnimator"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1
    new-instance v6, Landroid/animation/ObjectAnimator;

    invoke-direct {v6}, Landroid/animation/ObjectAnimator;-><init>()V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object v4, v6

    move-object/from16 v5, p3

    invoke-static/range {v0 .. v5}, Llc;->y(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ObjectAnimator;Landroid/content/res/XmlResourceParser;)Landroid/animation/ValueAnimator;

    move-object v0, v6

    goto/16 :goto_1e

    .line 2
    :cond_3
    const-string v5, "animator"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v5, p3

    invoke-static/range {v0 .. v5}, Llc;->y(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ObjectAnimator;Landroid/content/res/XmlResourceParser;)Landroid/animation/ValueAnimator;

    move-result-object v0

    goto/16 :goto_1e

    :cond_4
    const-string v5, "set"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    new-instance v15, Landroid/animation/AnimatorSet;

    invoke-direct {v15}, Landroid/animation/AnimatorSet;-><init>()V

    sget-object v0, Lr3;->j:[I

    move-object/from16 v6, p4

    invoke-static {v7, v8, v6, v0}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 3
    const-string v0, "ordering"

    invoke-static {v9, v0}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    move/from16 v16, v14

    goto :goto_2

    :cond_5
    invoke-virtual {v5, v14, v14}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    move/from16 v16, v0

    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v17, v5

    move-object v5, v15

    move/from16 v6, v16

    .line 4
    invoke-static/range {v0 .. v6}, Llc;->j(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/content/res/XmlResourceParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;I)Landroid/animation/Animator;

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/TypedArray;->recycle()V

    move-object v0, v15

    goto/16 :goto_1e

    :cond_6
    const-string v5, "propertyValuesHolder"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-static/range {p3 .. p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    const/4 v6, 0x0

    .line 5
    :goto_3
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v15

    if-eq v15, v2, :cond_32

    if-eq v15, v3, :cond_32

    if-eq v15, v4, :cond_7

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_3

    :cond_7
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_31

    sget-object v15, Lr3;->k:[I

    invoke-static {v7, v8, v1, v15}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v15

    const-string v12, "propertyName"

    invoke-static {v15, v9, v12, v2}, Llc;->q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v12

    .line 6
    const-string v14, "valueType"

    invoke-static {v9, v14}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v14

    const/4 v3, 0x4

    if-nez v14, :cond_8

    move v14, v3

    goto :goto_4

    :cond_8
    invoke-virtual {v15, v4, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v14

    :goto_4
    move/from16 v19, v14

    const/4 v4, 0x0

    .line 7
    :goto_5
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    move-object/from16 v21, v1

    if-eq v3, v2, :cond_1c

    const/4 v1, 0x1

    if-eq v3, v1, :cond_1c

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "keyframe"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    sget-object v1, Lr3;->l:[I

    const-string v3, "value"

    move/from16 v2, v19

    move-object/from16 v19, v5

    const/4 v5, 0x4

    if-ne v2, v5, :cond_b

    invoke-static/range {p3 .. p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    .line 8
    invoke-static {v7, v8, v2, v1}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 9
    invoke-static {v9, v3}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    const/4 v5, 0x0

    goto :goto_6

    :cond_9
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v23

    move-object/from16 v5, v23

    :goto_6
    if-eqz v5, :cond_a

    .line 10
    iget v5, v5, Landroid/util/TypedValue;->type:I

    invoke-static {v5}, Llc;->w(I)Z

    move-result v5

    if-eqz v5, :cond_a

    const/4 v5, 0x3

    goto :goto_7

    :cond_a
    const/4 v5, 0x0

    :goto_7
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    move v2, v5

    .line 11
    :cond_b
    invoke-static/range {p3 .. p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    .line 12
    invoke-static {v7, v8, v5, v1}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 13
    const-string v5, "fraction"

    invoke-static {v9, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    const/high16 v7, -0x40800000    # -1.0f

    if-nez v5, :cond_c

    goto :goto_8

    :cond_c
    const/4 v5, 0x3

    invoke-virtual {v1, v5, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v7

    .line 14
    :goto_8
    invoke-static {v9, v3}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_d

    const/4 v5, 0x0

    goto :goto_9

    :cond_d
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v23

    move-object/from16 v5, v23

    :goto_9
    const/4 v8, 0x4

    if-eqz v5, :cond_e

    const/16 v20, 0x1

    goto :goto_a

    :cond_e
    const/16 v20, 0x0

    :goto_a
    if-ne v2, v8, :cond_10

    if-eqz v20, :cond_f

    .line 15
    iget v5, v5, Landroid/util/TypedValue;->type:I

    invoke-static {v5}, Llc;->w(I)Z

    move-result v5

    if-eqz v5, :cond_f

    const/4 v5, 0x3

    goto :goto_b

    :cond_f
    const/4 v5, 0x0

    goto :goto_b

    :cond_10
    move v5, v2

    :goto_b
    if-eqz v20, :cond_15

    if-eqz v5, :cond_13

    const/4 v8, 0x1

    if-eq v5, v8, :cond_11

    const/4 v8, 0x3

    if-eq v5, v8, :cond_11

    const/4 v3, 0x0

    goto :goto_e

    .line 16
    :cond_11
    invoke-static {v9, v3}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12

    const/4 v3, 0x0

    const/4 v5, 0x0

    goto :goto_c

    :cond_12
    const/4 v5, 0x0

    invoke-virtual {v1, v5, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v17

    move/from16 v3, v17

    .line 17
    :goto_c
    invoke-static {v7, v3}, Landroid/animation/Keyframe;->ofInt(FI)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_e

    :cond_13
    const/4 v5, 0x0

    .line 18
    invoke-static {v9, v3}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_14

    const/4 v3, 0x0

    goto :goto_d

    :cond_14
    const/4 v3, 0x0

    invoke-virtual {v1, v5, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    .line 19
    :goto_d
    invoke-static {v7, v3}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_e

    :cond_15
    if-nez v5, :cond_16

    invoke-static {v7}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_e

    :cond_16
    invoke-static {v7}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object v3

    .line 20
    :goto_e
    const-string v5, "interpolator"

    invoke-static {v9, v5}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_17

    const/4 v8, 0x0

    goto :goto_f

    :cond_17
    const/4 v5, 0x0

    const/4 v7, 0x1

    invoke-virtual {v1, v7, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    :goto_f
    move-object/from16 v5, p0

    if-lez v8, :cond_18

    .line 21
    invoke-static {v5, v8}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v7

    .line 22
    invoke-virtual {v3, v7}, Landroid/animation/Keyframe;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :cond_18
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v3, :cond_1a

    if-nez v4, :cond_19

    .line 23
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :cond_19
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1a
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_10

    :cond_1b
    move/from16 v2, v19

    move-object/from16 v19, v5

    move-object/from16 v5, p0

    :goto_10
    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v5, v19

    move-object/from16 v1, v21

    move/from16 v19, v2

    const/4 v2, 0x3

    goto/16 :goto_5

    :cond_1c
    move/from16 v2, v19

    move-object/from16 v19, v5

    move-object/from16 v5, p0

    if-eqz v4, :cond_2c

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2c

    const/4 v3, 0x0

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/animation/Keyframe;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Keyframe;

    invoke-virtual {v3}, Landroid/animation/Keyframe;->getFraction()F

    move-result v8

    const/high16 v5, 0x3f800000    # 1.0f

    cmpg-float v20, v8, v5

    if-gez v20, :cond_20

    const/16 v20, 0x0

    cmpg-float v8, v8, v20

    if-gez v8, :cond_1d

    invoke-virtual {v3, v5}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_12

    :cond_1d
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 24
    invoke-virtual {v3}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v5

    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v5, v9, :cond_1e

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_11

    :cond_1e
    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v3}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v3

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v3, v9, :cond_1f

    invoke-static {v5}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_11

    :cond_1f
    invoke-static {v5}, Landroid/animation/Keyframe;->ofObject(F)Landroid/animation/Keyframe;

    move-result-object v3

    .line 25
    :goto_11
    invoke-virtual {v4, v8, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    :cond_20
    :goto_12
    invoke-virtual {v7}, Landroid/animation/Keyframe;->getFraction()F

    move-result v3

    const/4 v5, 0x0

    cmpl-float v8, v3, v5

    if-eqz v8, :cond_24

    cmpg-float v3, v3, v5

    if-gez v3, :cond_21

    invoke-virtual {v7, v5}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_15

    .line 26
    :cond_21
    invoke-virtual {v7}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v3

    sget-object v8, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v3, v8, :cond_22

    invoke-static {v5}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object v3

    :goto_13
    const/4 v5, 0x0

    goto :goto_14

    :cond_22
    invoke-virtual {v7}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v3

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v3, v7, :cond_23

    invoke-static {v5}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_13

    :cond_23
    invoke-static {v5}, Landroid/animation/Keyframe;->ofObject(F)Landroid/animation/Keyframe;

    move-result-object v3

    goto :goto_13

    .line 27
    :goto_14
    invoke-virtual {v4, v5, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    :cond_24
    :goto_15
    new-array v3, v1, [Landroid/animation/Keyframe;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    const/4 v5, 0x0

    :goto_16
    if-ge v5, v1, :cond_2b

    aget-object v4, v3, v5

    invoke-virtual {v4}, Landroid/animation/Keyframe;->getFraction()F

    move-result v7

    const/4 v8, 0x0

    cmpg-float v7, v7, v8

    if-gez v7, :cond_25

    if-nez v5, :cond_26

    invoke-virtual {v4, v8}, Landroid/animation/Keyframe;->setFraction(F)V

    :cond_25
    move/from16 v24, v1

    move/from16 v22, v8

    const/16 v18, 0x2

    goto :goto_1a

    :cond_26
    add-int/lit8 v7, v1, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    if-ne v5, v7, :cond_27

    invoke-virtual {v4, v8}, Landroid/animation/Keyframe;->setFraction(F)V

    move/from16 v24, v1

    const/16 v18, 0x2

    const/16 v22, 0x0

    goto :goto_1a

    :cond_27
    add-int/lit8 v4, v5, 0x1

    move v9, v5

    :goto_17
    if-ge v4, v7, :cond_29

    aget-object v20, v3, v4

    invoke-virtual/range {v20 .. v20}, Landroid/animation/Keyframe;->getFraction()F

    move-result v20

    const/16 v22, 0x0

    cmpl-float v20, v20, v22

    if-ltz v20, :cond_28

    goto :goto_18

    :cond_28
    add-int/lit8 v9, v4, 0x1

    move/from16 v25, v9

    move v9, v4

    move/from16 v4, v25

    goto :goto_17

    :cond_29
    const/16 v22, 0x0

    :goto_18
    add-int/lit8 v4, v9, 0x1

    aget-object v4, v3, v4

    invoke-virtual {v4}, Landroid/animation/Keyframe;->getFraction()F

    move-result v4

    add-int/lit8 v7, v5, -0x1

    aget-object v7, v3, v7

    invoke-virtual {v7}, Landroid/animation/Keyframe;->getFraction()F

    move-result v7

    sub-float/2addr v4, v7

    sub-int v7, v9, v5

    const/16 v18, 0x2

    add-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    div-float/2addr v4, v7

    move v7, v5

    :goto_19
    if-gt v7, v9, :cond_2a

    .line 28
    aget-object v8, v3, v7

    add-int/lit8 v23, v7, -0x1

    aget-object v23, v3, v23

    invoke-virtual/range {v23 .. v23}, Landroid/animation/Keyframe;->getFraction()F

    move-result v23

    move/from16 v24, v1

    add-float v1, v23, v4

    invoke-virtual {v8, v1}, Landroid/animation/Keyframe;->setFraction(F)V

    add-int/lit8 v7, v7, 0x1

    move/from16 v1, v24

    const/high16 v8, 0x3f800000    # 1.0f

    goto :goto_19

    :cond_2a
    move/from16 v24, v1

    :goto_1a
    add-int/lit8 v5, v5, 0x1

    move/from16 v1, v24

    goto :goto_16

    :cond_2b
    const/16 v18, 0x2

    .line 29
    invoke-static {v12, v3}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_2d

    sget-object v2, LX2;->a:LX2;

    invoke-virtual {v1, v2}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    goto :goto_1b

    :cond_2c
    const/4 v3, 0x3

    const/16 v18, 0x2

    const/4 v1, 0x0

    :cond_2d
    :goto_1b
    const/4 v2, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_2e

    .line 30
    invoke-static {v15, v14, v2, v4, v12}, Llc;->s(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    :cond_2e
    if-eqz v1, :cond_30

    if-nez v6, :cond_2f

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    :cond_2f
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_30
    invoke-virtual {v15}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_1c

    :cond_31
    move-object/from16 v21, v1

    move/from16 v18, v4

    move-object/from16 v19, v5

    move v4, v3

    move v3, v2

    move v2, v14

    :goto_1c
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move v14, v2

    move v2, v3

    move v3, v4

    move/from16 v4, v18

    move-object/from16 v5, v19

    move-object/from16 v1, v21

    goto/16 :goto_3

    :cond_32
    move v4, v3

    move v2, v14

    if-eqz v6, :cond_33

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v3, v1, [Landroid/animation/PropertyValuesHolder;

    move v14, v2

    :goto_1d
    if-ge v14, v1, :cond_34

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/animation/PropertyValuesHolder;

    aput-object v2, v3, v14

    add-int/lit8 v14, v14, 0x1

    goto :goto_1d

    :cond_33
    const/4 v3, 0x0

    :cond_34
    if-eqz v3, :cond_35

    .line 31
    instance-of v1, v0, Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_35

    move-object v1, v0

    check-cast v1, Landroid/animation/ValueAnimator;

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :cond_35
    move v14, v4

    :goto_1e
    if-eqz v10, :cond_37

    if-nez v14, :cond_37

    if-nez v13, :cond_36

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    :cond_36
    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_37
    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    goto/16 :goto_0

    :cond_38
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown animator name: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_1f
    if-eqz v10, :cond_3b

    if-eqz v13, :cond_3b

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/animation/Animator;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v14, v2

    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/animation/Animator;

    add-int/lit8 v4, v14, 0x1

    aput-object v2, v1, v14

    move v14, v4

    goto :goto_20

    :cond_39
    if-nez p6, :cond_3a

    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_21

    :cond_3a
    invoke-virtual {v10, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    :cond_3b
    :goto_21
    return-object v0
.end method

.method public static final k(Ljava/lang/Throwable;)Log;
    .locals 1

    .line 1
    const-string v0, "exception"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Log;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Log;-><init>(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static l(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .locals 5

    .line 1
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 2
    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v1, 0x1c

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    sget-object v0, LKj;->d:Ljava/util/ArrayList;

    .line 13
    .line 14
    const v0, 0x7f0800a8

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, LKj;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    new-instance v1, LKj;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v3, v1, LKj;->a:Ljava/util/WeakHashMap;

    .line 32
    .line 33
    iput-object v3, v1, LKj;->b:Landroid/util/SparseArray;

    .line 34
    .line 35
    iput-object v3, v1, LKj;->c:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, v1, LKj;->c:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    if-ne p0, p1, :cond_2

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    new-instance p0, Ljava/lang/ref/WeakReference;

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iput-object p0, v1, LKj;->c:Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    iget-object p0, v1, LKj;->b:Landroid/util/SparseArray;

    .line 59
    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    new-instance p0, Landroid/util/SparseArray;

    .line 63
    .line 64
    invoke-direct {p0}, Landroid/util/SparseArray;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p0, v1, LKj;->b:Landroid/util/SparseArray;

    .line 68
    .line 69
    :cond_3
    iget-object p0, v1, LKj;->b:Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/4 v1, 0x1

    .line 76
    if-ne v0, v1, :cond_4

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->indexOfKey(I)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ltz v0, :cond_4

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    check-cast v4, Ljava/lang/ref/WeakReference;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    move-object v4, v3

    .line 99
    :goto_0
    if-nez v4, :cond_5

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    move-object v4, p0

    .line 110
    check-cast v4, Ljava/lang/ref/WeakReference;

    .line 111
    .line 112
    :cond_5
    if-eqz v4, :cond_8

    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Landroid/view/View;

    .line 119
    .line 120
    if-eqz p0, :cond_7

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_7

    .line 127
    .line 128
    const p1, 0x7f0800a9

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    check-cast p0, Ljava/util/ArrayList;

    .line 136
    .line 137
    if-eqz p0, :cond_7

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    sub-int/2addr p1, v1

    .line 144
    if-gez p1, :cond_6

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Loh;->c(Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    throw v3

    .line 155
    :cond_7
    :goto_1
    move v2, v1

    .line 156
    :cond_8
    :goto_2
    return v2
.end method

.method public static m(LGc;Landroid/view/View;Landroid/view/Window$Callback;Landroid/view/KeyEvent;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return v1

    .line 6
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v3, 0x1c

    .line 9
    .line 10
    if-lt v2, v3, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p3}, LGc;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    instance-of v2, p2, Landroid/app/Activity;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v2, :cond_9

    .line 21
    .line 22
    check-cast p2, Landroid/app/Activity;

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/app/Activity;->onUserInteraction()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/16 p1, 0x8

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/view/Window;->hasFeature(I)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_5

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/16 v4, 0x52

    .line 48
    .line 49
    if-ne v2, v4, :cond_5

    .line 50
    .line 51
    if-eqz p1, :cond_5

    .line 52
    .line 53
    sget-boolean v2, Llc;->h:Z

    .line 54
    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const-string v4, "onMenuKeyEvent"

    .line 62
    .line 63
    new-array v5, v0, [Ljava/lang/Class;

    .line 64
    .line 65
    const-class v6, Landroid/view/KeyEvent;

    .line 66
    .line 67
    aput-object v6, v5, v1

    .line 68
    .line 69
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    sput-object v2, Llc;->i:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    :catch_0
    sput-boolean v0, Llc;->h:Z

    .line 76
    .line 77
    :cond_2
    sget-object v2, Llc;->i:Ljava/lang/reflect/Method;

    .line 78
    .line 79
    if-eqz v2, :cond_4

    .line 80
    .line 81
    :try_start_1
    new-array v4, v0, [Ljava/lang/Object;

    .line 82
    .line 83
    aput-object p3, v4, v1

    .line 84
    .line 85
    invoke-virtual {v2, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-nez p1, :cond_3

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    check-cast p1, Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result v1
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1

    .line 98
    :catch_1
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_5
    invoke-virtual {p0, p3}, Landroid/view/Window;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_6
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0, p3}, LLj;->b(Landroid/view/View;Landroid/view/KeyEvent;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_7

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_7
    if-eqz p0, :cond_8

    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    :cond_8
    invoke-virtual {p3, p2, v3, p2}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    :goto_1
    return v0

    .line 130
    :cond_9
    instance-of v2, p2, Landroid/app/Dialog;

    .line 131
    .line 132
    if-eqz v2, :cond_10

    .line 133
    .line 134
    check-cast p2, Landroid/app/Dialog;

    .line 135
    .line 136
    sget-boolean p0, Llc;->j:Z

    .line 137
    .line 138
    if-nez p0, :cond_a

    .line 139
    .line 140
    :try_start_2
    const-class p0, Landroid/app/Dialog;

    .line 141
    .line 142
    const-string p1, "mOnKeyListener"

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    sput-object p0, Llc;->k:Ljava/lang/reflect/Field;

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_2

    .line 151
    .line 152
    .line 153
    :catch_2
    sput-boolean v0, Llc;->j:Z

    .line 154
    .line 155
    :cond_a
    sget-object p0, Llc;->k:Ljava/lang/reflect/Field;

    .line 156
    .line 157
    if-eqz p0, :cond_b

    .line 158
    .line 159
    :try_start_3
    invoke-virtual {p0, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    check-cast p0, Landroid/content/DialogInterface$OnKeyListener;
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_3

    .line 164
    .line 165
    goto :goto_2

    .line 166
    :catch_3
    :cond_b
    move-object p0, v3

    .line 167
    :goto_2
    if-eqz p0, :cond_c

    .line 168
    .line 169
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    invoke-interface {p0, p2, p1, p3}, Landroid/content/DialogInterface$OnKeyListener;->onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_c

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_c
    invoke-virtual {p2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0, p3}, Landroid/view/Window;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_d

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_d
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-static {p0, p3}, LLj;->b(Landroid/view/View;Landroid/view/KeyEvent;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_e

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_e
    if-eqz p0, :cond_f

    .line 203
    .line 204
    invoke-virtual {p0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    :cond_f
    invoke-virtual {p3, p2, v3, p2}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    :goto_3
    return v0

    .line 213
    :cond_10
    if-eqz p1, :cond_11

    .line 214
    .line 215
    invoke-static {p1, p3}, LLj;->b(Landroid/view/View;Landroid/view/KeyEvent;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-nez p1, :cond_13

    .line 220
    .line 221
    :cond_11
    invoke-interface {p0, p3}, LGc;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-eqz p0, :cond_12

    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_12
    move v0, v1

    .line 229
    :cond_13
    :goto_4
    return v0
.end method

.method public static final n(Lcom/getcapacitor/PluginCall;)LV6;
    .locals 5

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "from"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    sget-object v2, Lpb;->e:Lt5;

    .line 17
    .line 18
    const-string v3, "directory"

    .line 19
    .line 20
    invoke-virtual {p0, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-static {v3}, Lt5;->l(Ljava/lang/String;)Lpb;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "to"

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_1
    const-string v1, "toDirectory"

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-static {p0}, Lt5;->l(Ljava/lang/String;)Lpb;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-nez p0, :cond_3

    .line 53
    .line 54
    :cond_2
    move-object p0, v2

    .line 55
    :cond_3
    new-instance v1, LV6;

    .line 56
    .line 57
    new-instance v4, LPb;

    .line 58
    .line 59
    invoke-direct {v4, v2, v0}, LPb;-><init>(Lpb;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, LPb;

    .line 63
    .line 64
    invoke-direct {v0, p0, v3}, LPb;-><init>(Lpb;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {v1, v4, v0}, LV6;-><init>(LPb;LPb;)V

    .line 68
    .line 69
    .line 70
    return-object v1
.end method

.method public static p(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;I)LU1;
    .locals 3

    .line 1
    invoke-static {p1, p3}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x0

    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    new-instance p1, Landroid/util/TypedValue;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p4, p1}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 15
    .line 16
    .line 17
    iget v1, p1, Landroid/util/TypedValue;->type:I

    .line 18
    .line 19
    const/16 v2, 0x1c

    .line 20
    .line 21
    if-lt v1, v2, :cond_0

    .line 22
    .line 23
    const/16 v2, 0x1f

    .line 24
    .line 25
    if-gt v1, v2, :cond_0

    .line 26
    .line 27
    iget p0, p1, Landroid/util/TypedValue;->data:I

    .line 28
    .line 29
    new-instance p1, LU1;

    .line 30
    .line 31
    invoke-direct {p1, p3, p3, p0}, LU1;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_0
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p4, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    :try_start_0
    invoke-static {p1, p0, p2}, LU1;->b(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)LU1;

    .line 44
    .line 45
    .line 46
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    const-string p1, "ComplexColorCompat"

    .line 50
    .line 51
    const-string p2, "Failed to inflate ComplexColor."

    .line 52
    .line 53
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    .line 55
    .line 56
    move-object p0, p3

    .line 57
    :goto_0
    if-eqz p0, :cond_1

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    new-instance p0, LU1;

    .line 61
    .line 62
    invoke-direct {p0, p3, p3, v0}, LU1;-><init>(Landroid/graphics/Shader;Landroid/content/res/ColorStateList;I)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method

.method public static q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static final r(Lr5;)LP3;
    .locals 6

    .line 1
    instance-of v0, p0, LO6;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LP3;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1, p0}, LP3;-><init>(ILr5;)V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    move-object v0, p0

    .line 13
    check-cast v0, LO6;

    .line 14
    .line 15
    :cond_1
    :goto_0
    sget-object v1, LO6;->j:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    sget-object v3, Llc;->c:Li0;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1, v0, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    move-object v2, v4

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    instance-of v5, v2, LP3;

    .line 32
    .line 33
    if-eqz v5, :cond_8

    .line 34
    .line 35
    :cond_3
    invoke-virtual {v1, v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-eqz v5, :cond_7

    .line 40
    .line 41
    check-cast v2, LP3;

    .line 42
    .line 43
    :goto_1
    if-eqz v2, :cond_6

    .line 44
    .line 45
    sget-object v0, LP3;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    instance-of v3, v1, LG4;

    .line 52
    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    check-cast v1, LG4;

    .line 56
    .line 57
    iget-object v1, v1, LG4;->c:Ljava/lang/Object;

    .line 58
    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    invoke-virtual {v2}, LP3;->m()V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    const v1, 0x1fffffff

    .line 66
    .line 67
    .line 68
    sget-object v3, LP3;->h:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 69
    .line 70
    invoke-virtual {v3, v2, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    .line 71
    .line 72
    .line 73
    sget-object v1, Lp0;->a:Lp0;

    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    move-object v4, v2

    .line 79
    :goto_2
    if-nez v4, :cond_5

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_5
    return-object v4

    .line 83
    :cond_6
    :goto_3
    new-instance v0, LP3;

    .line 84
    .line 85
    const/4 v1, 0x2

    .line 86
    invoke-direct {v0, v1, p0}, LP3;-><init>(ILr5;)V

    .line 87
    .line 88
    .line 89
    return-object v0

    .line 90
    :cond_7
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    if-eq v5, v2, :cond_3

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_8
    if-eq v2, v3, :cond_1

    .line 98
    .line 99
    instance-of v1, v2, Ljava/lang/Throwable;

    .line 100
    .line 101
    if-eqz v1, :cond_9

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 105
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v1, "Inconsistent state "

    .line 109
    .line 110
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p0
.end method

.method public static s(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move v4, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v4, v3

    .line 13
    :goto_0
    if-eqz v4, :cond_1

    .line 14
    .line 15
    iget v1, v1, Landroid/util/TypedValue;->type:I

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_1
    move v1, v3

    .line 19
    :goto_1
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    if-eqz v5, :cond_2

    .line 24
    .line 25
    move v6, v2

    .line 26
    goto :goto_2

    .line 27
    :cond_2
    move v6, v3

    .line 28
    :goto_2
    if-eqz v6, :cond_3

    .line 29
    .line 30
    iget v5, v5, Landroid/util/TypedValue;->type:I

    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_3
    move v5, v3

    .line 34
    :goto_3
    const/4 v7, 0x4

    .line 35
    const/4 v8, 0x3

    .line 36
    if-ne p1, v7, :cond_7

    .line 37
    .line 38
    if-eqz v4, :cond_4

    .line 39
    .line 40
    invoke-static {v1}, Llc;->w(I)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_5

    .line 45
    .line 46
    :cond_4
    if-eqz v6, :cond_6

    .line 47
    .line 48
    invoke-static {v5}, Llc;->w(I)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_6

    .line 53
    .line 54
    :cond_5
    move p1, v8

    .line 55
    goto :goto_4

    .line 56
    :cond_6
    move p1, v3

    .line 57
    :cond_7
    :goto_4
    if-nez p1, :cond_8

    .line 58
    .line 59
    move v7, v2

    .line 60
    goto :goto_5

    .line 61
    :cond_8
    move v7, v3

    .line 62
    :goto_5
    const/4 v9, 0x0

    .line 63
    if-ne p1, v0, :cond_d

    .line 64
    .line 65
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p1}, Lr3;->k(Ljava/lang/String;)[Ljf;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p0}, Lr3;->k(Ljava/lang/String;)[Ljf;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    if-nez p2, :cond_9

    .line 82
    .line 83
    if-eqz p3, :cond_1e

    .line 84
    .line 85
    :cond_9
    if-eqz p2, :cond_c

    .line 86
    .line 87
    new-instance v1, Ld1;

    .line 88
    .line 89
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 90
    .line 91
    .line 92
    if-eqz p3, :cond_b

    .line 93
    .line 94
    invoke-static {p2, p3}, Lr3;->f([Ljf;[Ljf;)Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_a

    .line 99
    .line 100
    new-array p0, v0, [Ljava/lang/Object;

    .line 101
    .line 102
    aput-object p2, p0, v3

    .line 103
    .line 104
    aput-object p3, p0, v2

    .line 105
    .line 106
    invoke-static {p4, v1, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    :goto_6
    move-object v9, p0

    .line 111
    goto/16 :goto_10

    .line 112
    .line 113
    :cond_a
    new-instance p2, Landroid/view/InflateException;

    .line 114
    .line 115
    new-instance p3, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string p4, " Can\'t morph from "

    .line 118
    .line 119
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p1, " to "

    .line 126
    .line 127
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-direct {p2, p0}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p2

    .line 141
    :cond_b
    new-array p0, v2, [Ljava/lang/Object;

    .line 142
    .line 143
    aput-object p2, p0, v3

    .line 144
    .line 145
    invoke-static {p4, v1, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    goto :goto_6

    .line 150
    :cond_c
    if-eqz p3, :cond_1e

    .line 151
    .line 152
    new-instance p0, Ld1;

    .line 153
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    .line 156
    .line 157
    new-array p1, v2, [Ljava/lang/Object;

    .line 158
    .line 159
    aput-object p3, p1, v3

    .line 160
    .line 161
    invoke-static {p4, p0, p1}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    .line 162
    .line 163
    .line 164
    move-result-object v9

    .line 165
    goto/16 :goto_10

    .line 166
    .line 167
    :cond_d
    if-ne p1, v8, :cond_e

    .line 168
    .line 169
    sget-object p1, LX2;->a:LX2;

    .line 170
    .line 171
    goto :goto_7

    .line 172
    :cond_e
    move-object p1, v9

    .line 173
    :goto_7
    const/4 v8, 0x5

    .line 174
    const/4 v10, 0x0

    .line 175
    if-eqz v7, :cond_14

    .line 176
    .line 177
    if-eqz v4, :cond_12

    .line 178
    .line 179
    if-ne v1, v8, :cond_f

    .line 180
    .line 181
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 182
    .line 183
    .line 184
    move-result p2

    .line 185
    goto :goto_8

    .line 186
    :cond_f
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    :goto_8
    if-eqz v6, :cond_11

    .line 191
    .line 192
    if-ne v5, v8, :cond_10

    .line 193
    .line 194
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    goto :goto_9

    .line 199
    :cond_10
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    :goto_9
    new-array p3, v0, [F

    .line 204
    .line 205
    aput p2, p3, v3

    .line 206
    .line 207
    aput p0, p3, v2

    .line 208
    .line 209
    invoke-static {p4, p3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    :goto_a
    move-object v9, p0

    .line 214
    goto/16 :goto_f

    .line 215
    .line 216
    :cond_11
    new-array p0, v2, [F

    .line 217
    .line 218
    aput p2, p0, v3

    .line 219
    .line 220
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    goto :goto_a

    .line 225
    :cond_12
    if-ne v5, v8, :cond_13

    .line 226
    .line 227
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    goto :goto_b

    .line 232
    :cond_13
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    :goto_b
    new-array p2, v2, [F

    .line 237
    .line 238
    aput p0, p2, v3

    .line 239
    .line 240
    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    goto :goto_a

    .line 245
    :cond_14
    if-eqz v4, :cond_1a

    .line 246
    .line 247
    if-ne v1, v8, :cond_15

    .line 248
    .line 249
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    float-to-int p2, p2

    .line 254
    goto :goto_c

    .line 255
    :cond_15
    invoke-static {v1}, Llc;->w(I)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_16

    .line 260
    .line 261
    invoke-virtual {p0, p2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 262
    .line 263
    .line 264
    move-result p2

    .line 265
    goto :goto_c

    .line 266
    :cond_16
    invoke-virtual {p0, p2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 267
    .line 268
    .line 269
    move-result p2

    .line 270
    :goto_c
    if-eqz v6, :cond_19

    .line 271
    .line 272
    if-ne v5, v8, :cond_17

    .line 273
    .line 274
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 275
    .line 276
    .line 277
    move-result p0

    .line 278
    float-to-int p0, p0

    .line 279
    goto :goto_d

    .line 280
    :cond_17
    invoke-static {v5}, Llc;->w(I)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v0, :cond_18

    .line 285
    .line 286
    invoke-virtual {p0, p3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 287
    .line 288
    .line 289
    move-result p0

    .line 290
    goto :goto_d

    .line 291
    :cond_18
    invoke-virtual {p0, p3, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    :goto_d
    filled-new-array {p2, p0}, [I

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    .line 300
    .line 301
    .line 302
    move-result-object v9

    .line 303
    goto :goto_f

    .line 304
    :cond_19
    filled-new-array {p2}, [I

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    .line 309
    .line 310
    .line 311
    move-result-object v9

    .line 312
    goto :goto_f

    .line 313
    :cond_1a
    if-eqz v6, :cond_1d

    .line 314
    .line 315
    if-ne v5, v8, :cond_1b

    .line 316
    .line 317
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 318
    .line 319
    .line 320
    move-result p0

    .line 321
    float-to-int p0, p0

    .line 322
    goto :goto_e

    .line 323
    :cond_1b
    invoke-static {v5}, Llc;->w(I)Z

    .line 324
    .line 325
    .line 326
    move-result p2

    .line 327
    if-eqz p2, :cond_1c

    .line 328
    .line 329
    invoke-virtual {p0, p3, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    goto :goto_e

    .line 334
    :cond_1c
    invoke-virtual {p0, p3, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 335
    .line 336
    .line 337
    move-result p0

    .line 338
    :goto_e
    filled-new-array {p0}, [I

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    .line 343
    .line 344
    .line 345
    move-result-object v9

    .line 346
    :cond_1d
    :goto_f
    if-eqz v9, :cond_1e

    .line 347
    .line 348
    if-eqz p1, :cond_1e

    .line 349
    .line 350
    invoke-virtual {v9, p1}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 351
    .line 352
    .line 353
    :cond_1e
    :goto_10
    return-object v9
.end method

.method public static final t(Lcom/getcapacitor/PluginCall;)LPb;
    .locals 3

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "path"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v1, "directory"

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v1, LPb;

    .line 23
    .line 24
    sget-object v2, Lpb;->e:Lt5;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lt5;->l(Ljava/lang/String;)Lpb;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v1, p0, v0}, LPb;-><init>(Lpb;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public static final u(Lcom/getcapacitor/PluginCall;)Lih;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Llc;->t(Lcom/getcapacitor/PluginCall;)LPb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v1, "recursive"

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/getcapacitor/PluginCall;->getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    new-instance v1, Lih;

    .line 29
    .line 30
    invoke-direct {v1, v0, p0}, Lih;-><init>(LPb;Z)V

    .line 31
    .line 32
    .line 33
    return-object v1
.end method

.method public static v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "http://schemas.android.com/apk/res/android"

    .line 2
    .line 3
    invoke-interface {p0, v0, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    return p0
.end method

.method public static w(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x1c

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x1f

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    return p0
.end method

.method public static x(Ljava/lang/String;)Z
    .locals 4

    .line 1
    sget-object v0, Lik;->a:Lg1;

    .line 2
    .line 3
    sget-object v0, Lh1;->c:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lb5;

    .line 29
    .line 30
    move-object v3, v2

    .line 31
    check-cast v3, Lh1;

    .line 32
    .line 33
    iget-object v3, v3, Lh1;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_5

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lb5;

    .line 66
    .line 67
    check-cast v0, Lh1;

    .line 68
    .line 69
    invoke-virtual {v0}, Lh1;->a()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {v0}, Lh1;->b()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    :cond_3
    const/4 p0, 0x1

    .line 82
    goto :goto_1

    .line 83
    :cond_4
    const/4 p0, 0x0

    .line 84
    :goto_1
    return p0

    .line 85
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    .line 86
    .line 87
    const-string v1, "Unknown feature "

    .line 88
    .line 89
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0
.end method

.method public static y(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ObjectAnimator;Landroid/content/res/XmlResourceParser;)Landroid/animation/ValueAnimator;
    .locals 20

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    sget-object v7, Lr3;->i:[I

    invoke-static {v0, v1, v2, v7}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v7

    sget-object v8, Lr3;->m:[I

    invoke-static {v0, v1, v2, v8}, Llc;->z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    if-nez p4, :cond_0

    new-instance v1, Landroid/animation/ValueAnimator;

    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    goto :goto_0

    :cond_0
    move-object/from16 v1, p4

    .line 1
    :goto_0
    const-string v2, "duration"

    invoke-static {v3, v2}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    const/16 v8, 0x12c

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v7, v6, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    :goto_1
    int-to-long v8, v8

    const-string v2, "startOffset"

    invoke-static {v3, v2}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v5

    goto :goto_2

    :cond_2
    invoke-virtual {v7, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    :goto_2
    int-to-long v10, v2

    const-string v2, "valueType"

    invoke-static {v3, v2}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    const/4 v12, 0x4

    if-nez v2, :cond_3

    move v2, v12

    goto :goto_3

    :cond_3
    const/4 v2, 0x7

    invoke-virtual {v7, v2, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 2
    :goto_3
    const-string v13, "valueFrom"

    invoke-static {v3, v13}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v13

    const/4 v14, 0x3

    if-eqz v13, :cond_c

    const-string v13, "valueTo"

    invoke-static {v3, v13}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_c

    const/4 v13, 0x6

    const/4 v15, 0x5

    if-ne v2, v12, :cond_b

    .line 3
    invoke-virtual {v7, v15}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_4

    move/from16 v16, v6

    goto :goto_4

    :cond_4
    move/from16 v16, v5

    :goto_4
    if-eqz v16, :cond_5

    iget v2, v2, Landroid/util/TypedValue;->type:I

    goto :goto_5

    :cond_5
    move v2, v5

    :goto_5
    invoke-virtual {v7, v13}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_6

    move/from16 v17, v6

    goto :goto_6

    :cond_6
    move/from16 v17, v5

    :goto_6
    if-eqz v17, :cond_7

    iget v4, v4, Landroid/util/TypedValue;->type:I

    goto :goto_7

    :cond_7
    move v4, v5

    :goto_7
    if-eqz v16, :cond_8

    invoke-static {v2}, Llc;->w(I)Z

    move-result v2

    if-nez v2, :cond_9

    :cond_8
    if-eqz v17, :cond_a

    invoke-static {v4}, Llc;->w(I)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_9
    move v2, v14

    goto :goto_8

    :cond_a
    move v2, v5

    .line 4
    :cond_b
    :goto_8
    const-string v4, ""

    invoke-static {v7, v2, v15, v13, v4}, Llc;->s(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    if-eqz v4, :cond_c

    new-array v13, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v4, v13, v5

    invoke-virtual {v1, v13}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :cond_c
    invoke-virtual {v1, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {v1, v10, v11}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 5
    const-string v4, "repeatCount"

    invoke-static {v3, v4}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d

    move v4, v5

    goto :goto_9

    :cond_d
    invoke-virtual {v7, v14, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 6
    :goto_9
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 7
    const-string v4, "repeatMode"

    invoke-static {v3, v4}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e

    move v4, v6

    goto :goto_a

    :cond_e
    invoke-virtual {v7, v12, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 8
    :goto_a
    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    if-eqz v0, :cond_19

    .line 9
    move-object v4, v1

    check-cast v4, Landroid/animation/ObjectAnimator;

    const-string v8, "pathData"

    invoke-static {v0, v3, v8, v6}, Llc;->q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_18

    const-string v9, "propertyXName"

    const/4 v10, 0x2

    invoke-static {v0, v3, v9, v10}, Llc;->q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v9

    const-string v11, "propertyYName"

    invoke-static {v0, v3, v11, v14}, Llc;->q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v11

    if-nez v9, :cond_10

    if-eqz v11, :cond_f

    goto :goto_b

    :cond_f
    new-instance v1, Landroid/view/InflateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " propertyXName or propertyYName is needed for PathData"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 10
    :cond_10
    :goto_b
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    invoke-static {v8}, Lr3;->k(Ljava/lang/String;)[Ljf;

    move-result-object v10

    :try_start_0
    invoke-static {v10, v2}, Ljf;->b([Ljf;Landroid/graphics/Path;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    new-instance v10, Landroid/graphics/PathMeasure;

    invoke-direct {v10, v2, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v8, v13

    :goto_c
    invoke-virtual {v10}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v14

    add-float/2addr v8, v14

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v10}, Landroid/graphics/PathMeasure;->nextContour()Z

    move-result v14

    if-nez v14, :cond_17

    new-instance v10, Landroid/graphics/PathMeasure;

    invoke-direct {v10, v2, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    const/high16 v2, 0x3f000000    # 0.5f

    div-float v2, v8, v2

    float-to-int v2, v2

    add-int/2addr v2, v6

    const/16 v14, 0x64

    invoke-static {v14, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-array v14, v2, [F

    new-array v15, v2, [F

    const/4 v13, 0x2

    new-array v5, v13, [F

    add-int/lit8 v13, v2, -0x1

    int-to-float v13, v13

    div-float/2addr v8, v13

    move-object/from16 p2, v1

    move-object/from16 v18, v7

    const/4 v1, 0x0

    const/4 v6, 0x0

    const/4 v13, 0x0

    :goto_d
    const/4 v7, 0x0

    if-ge v6, v2, :cond_12

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Float;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Float;->floatValue()F

    move-result v19

    move/from16 p3, v2

    sub-float v2, v13, v19

    invoke-virtual {v10, v2, v5, v7}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    const/4 v2, 0x0

    aget v7, v5, v2

    aput v7, v14, v6

    const/4 v2, 0x1

    aget v7, v5, v2

    aput v7, v15, v6

    add-float/2addr v13, v8

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v7, v2, :cond_11

    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    cmpl-float v2, v13, v2

    if-lez v2, :cond_11

    invoke-virtual {v10}, Landroid/graphics/PathMeasure;->nextContour()Z

    move v1, v7

    :cond_11
    const/4 v2, 0x1

    add-int/2addr v6, v2

    move/from16 v2, p3

    goto :goto_d

    :cond_12
    const/4 v2, 0x1

    if-eqz v9, :cond_13

    invoke-static {v9, v14}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    goto :goto_e

    :cond_13
    move-object v1, v7

    :goto_e
    if-eqz v11, :cond_14

    invoke-static {v11, v15}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    :cond_14
    if-nez v1, :cond_15

    new-array v1, v2, [Landroid/animation/PropertyValuesHolder;

    const/4 v5, 0x0

    aput-object v7, v1, v5

    invoke-virtual {v4, v1}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_f

    :cond_15
    const/4 v5, 0x0

    if-nez v7, :cond_16

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v2, v5

    invoke-virtual {v4, v2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_f

    :cond_16
    const/4 v6, 0x2

    new-array v6, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v6, v5

    aput-object v7, v6, v2

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :goto_f
    const/4 v2, 0x0

    goto :goto_10

    :cond_17
    move-object/from16 p2, v1

    move v1, v6

    move-object/from16 v1, p2

    goto/16 :goto_c

    :catch_0
    move-exception v0

    move-object v1, v0

    .line 12
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Error in parsing "

    invoke-virtual {v2, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_18
    move-object/from16 p2, v1

    move-object/from16 v18, v7

    .line 13
    const-string v1, "propertyName"

    const/4 v2, 0x0

    invoke-static {v0, v3, v1, v2}, Llc;->q(Landroid/content/res/TypedArray;Landroid/content/res/XmlResourceParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    goto :goto_10

    :cond_19
    move-object/from16 p2, v1

    move v2, v5

    move-object/from16 v18, v7

    .line 14
    :goto_10
    const-string v1, "interpolator"

    invoke-static {v3, v1}, Llc;->v(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1a

    move v5, v2

    move-object/from16 v1, v18

    goto :goto_11

    :cond_1a
    move-object/from16 v1, v18

    invoke-virtual {v1, v2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    :goto_11
    if-lez v5, :cond_1b

    move-object/from16 v2, p0

    .line 15
    invoke-static {v2, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v2

    move-object/from16 v3, p2

    .line 16
    invoke-virtual {v3, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto :goto_12

    :cond_1b
    move-object/from16 v3, p2

    :goto_12
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1c
    return-object v3
.end method

.method public static z(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p2, p3, p0, p0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public abstract B(Ls;Ls;)V
.end method

.method public abstract C(Ls;Ljava/lang/Thread;)V
.end method

.method public abstract K(Z)V
.end method

.method public abstract L(Z)V
.end method

.method public abstract b(Lt;Lp;)Z
.end method

.method public abstract c(Lt;Ljava/lang/Object;Ljava/lang/Object;)Z
.end method

.method public abstract d(Lt;Ls;Ls;)Z
.end method

.method public abstract o([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
.end method
