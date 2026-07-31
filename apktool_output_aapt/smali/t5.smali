.class public Lt5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LX5;
.implements Lkk;
.implements Lhe;
.implements LW;
.implements LCf;
.implements Lka;


# static fields
.field public static final synthetic d:Lt5;

.field public static final synthetic e:Lt5;

.field public static final f:[Ljava/lang/String;

.field public static final synthetic g:Lt5;

.field public static final h:Lt5;

.field public static final i:Lt5;

.field public static final j:Lt5;

.field public static final k:Lt5;


# instance fields
.field public final synthetic c:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lt5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lt5;->d:Lt5;

    .line 8
    .line 9
    new-instance v0, Lt5;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lt5;->e:Lt5;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    new-array v0, v0, [Ljava/lang/String;

    .line 19
    .line 20
    sput-object v0, Lt5;->f:[Ljava/lang/String;

    .line 21
    .line 22
    new-instance v0, Lt5;

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lt5;->g:Lt5;

    .line 29
    .line 30
    new-instance v0, Lt5;

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Lt5;->h:Lt5;

    .line 37
    .line 38
    new-instance v0, Lt5;

    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lt5;->i:Lt5;

    .line 45
    .line 46
    new-instance v0, Lt5;

    .line 47
    .line 48
    const/4 v1, 0x6

    .line 49
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lt5;->j:Lt5;

    .line 53
    .line 54
    new-instance v0, Lt5;

    .line 55
    .line 56
    const/4 v1, 0x7

    .line 57
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lt5;->k:Lt5;

    .line 61
    .line 62
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lt5;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/webkit/WebView;)V
    .locals 2

    const/16 v0, 0x1a

    iput v0, p0, Lt5;->c:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Landroid/webkit/CookieManager;->setAcceptFileSchemeCookies(Z)V

    invoke-virtual {v0, p1, v1}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    return-void
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "alias"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/Appendable;

    .line 29
    .line 30
    .line 31
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "toString(...)"

    .line 39
    .line 40
    invoke-static {v0, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "toLowerCase(...)"

    .line 50
    .line 51
    invoke-static {v0, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-object p0
.end method

.method public static l(Ljava/lang/String;)Lpb;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_6

    .line 3
    .line 4
    invoke-static {p0}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    sget-object v1, Lpb;->m:LJ7;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    new-instance v2, Li;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-direct {v2, v3, v1}, Li;-><init>(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    invoke-virtual {v2}, Li;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_5

    .line 27
    .line 28
    invoke-virtual {v2}, Li;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    move-object v3, v1

    .line 33
    check-cast v3, Lpb;

    .line 34
    .line 35
    sget-object v4, Lpb;->e:Lt5;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Lt5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {v5}, Lt5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_4

    .line 57
    .line 58
    iget-object v3, v3, Lpb;->d:Ljava/util/List;

    .line 59
    .line 60
    instance-of v4, v3, Ljava/util/Collection;

    .line 61
    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v4, :cond_1

    .line 80
    .line 81
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Ljava/lang/String;

    .line 86
    .line 87
    sget-object v5, Lpb;->e:Lt5;

    .line 88
    .line 89
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-static {p0}, Lt5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-static {v4}, Lt5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-eqz v4, :cond_3

    .line 105
    .line 106
    :cond_4
    move-object v0, v1

    .line 107
    :cond_5
    check-cast v0, Lpb;

    .line 108
    .line 109
    :cond_6
    :goto_1
    return-object v0
.end method

.method public static p(Landroid/view/inputmethod/InputConnection;Landroid/text/Editable;IIZ)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1a

    .line 3
    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    goto/16 :goto_9

    .line 7
    .line 8
    :cond_0
    if-ltz p2, :cond_1a

    .line 9
    .line 10
    if-gez p3, :cond_1

    .line 11
    .line 12
    goto/16 :goto_9

    .line 13
    .line 14
    :cond_1
    invoke-static {p1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {p1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, -0x1

    .line 23
    if-eq v1, v3, :cond_1a

    .line 24
    .line 25
    if-eq v2, v3, :cond_1a

    .line 26
    .line 27
    if-eq v1, v2, :cond_2

    .line 28
    .line 29
    goto/16 :goto_9

    .line 30
    .line 31
    :cond_2
    const/4 v4, 0x1

    .line 32
    if-eqz p4, :cond_17

    .line 33
    .line 34
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 39
    .line 40
    .line 41
    move-result p4

    .line 42
    if-ltz v1, :cond_4

    .line 43
    .line 44
    if-ge p4, v1, :cond_3

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    if-gez p2, :cond_5

    .line 48
    .line 49
    :cond_4
    :goto_0
    move v1, v3

    .line 50
    goto :goto_3

    .line 51
    :cond_5
    :goto_1
    move p4, v0

    .line 52
    :goto_2
    if-nez p2, :cond_6

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_6
    add-int/lit8 v1, v1, -0x1

    .line 56
    .line 57
    if-gez v1, :cond_8

    .line 58
    .line 59
    if-eqz p4, :cond_7

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_7
    move v1, v0

    .line 63
    goto :goto_3

    .line 64
    :cond_8
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz p4, :cond_a

    .line 69
    .line 70
    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    if-nez p4, :cond_9

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_9
    add-int/lit8 p2, p2, -0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_a
    invoke-static {v5}, Ljava/lang/Character;->isSurrogate(C)Z

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-nez v6, :cond_b

    .line 85
    .line 86
    add-int/lit8 p2, p2, -0x1

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_b
    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    if-eqz p4, :cond_c

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_c
    move p4, v4

    .line 97
    goto :goto_2

    .line 98
    :goto_3
    invoke-static {p3, v0}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 103
    .line 104
    .line 105
    move-result p3

    .line 106
    if-ltz v2, :cond_e

    .line 107
    .line 108
    if-ge p3, v2, :cond_d

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_d
    if-gez p2, :cond_f

    .line 112
    .line 113
    :cond_e
    :goto_4
    move p3, v3

    .line 114
    goto :goto_7

    .line 115
    :cond_f
    :goto_5
    move p4, v0

    .line 116
    :goto_6
    if-nez p2, :cond_10

    .line 117
    .line 118
    move p3, v2

    .line 119
    goto :goto_7

    .line 120
    :cond_10
    if-lt v2, p3, :cond_11

    .line 121
    .line 122
    if-eqz p4, :cond_16

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_11
    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz p4, :cond_13

    .line 130
    .line 131
    invoke-static {v5}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 132
    .line 133
    .line 134
    move-result p4

    .line 135
    if-nez p4, :cond_12

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_12
    add-int/lit8 p2, p2, -0x1

    .line 139
    .line 140
    add-int/lit8 v2, v2, 0x1

    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_13
    invoke-static {v5}, Ljava/lang/Character;->isSurrogate(C)Z

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    if-nez v6, :cond_14

    .line 148
    .line 149
    add-int/lit8 p2, p2, -0x1

    .line 150
    .line 151
    add-int/lit8 v2, v2, 0x1

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_14
    invoke-static {v5}, Ljava/lang/Character;->isLowSurrogate(C)Z

    .line 155
    .line 156
    .line 157
    move-result p4

    .line 158
    if-eqz p4, :cond_15

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_15
    add-int/lit8 v2, v2, 0x1

    .line 162
    .line 163
    move p4, v4

    .line 164
    goto :goto_6

    .line 165
    :cond_16
    :goto_7
    if-eq v1, v3, :cond_1a

    .line 166
    .line 167
    if-ne p3, v3, :cond_18

    .line 168
    .line 169
    goto :goto_9

    .line 170
    :cond_17
    sub-int/2addr v1, p2

    .line 171
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    add-int/2addr v2, p3

    .line 176
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 181
    .line 182
    .line 183
    move-result p3

    .line 184
    :cond_18
    const-class p2, LZi;

    .line 185
    .line 186
    invoke-interface {p1, v1, p3, p2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    check-cast p2, [LZi;

    .line 191
    .line 192
    if-eqz p2, :cond_1a

    .line 193
    .line 194
    array-length p4, p2

    .line 195
    if-lez p4, :cond_1a

    .line 196
    .line 197
    array-length p4, p2

    .line 198
    move v2, v0

    .line 199
    :goto_8
    if-ge v2, p4, :cond_19

    .line 200
    .line 201
    aget-object v3, p2, v2

    .line 202
    .line 203
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    invoke-interface {p1, v3}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-static {v3, p3}, Ljava/lang/Math;->max(II)I

    .line 216
    .line 217
    .line 218
    move-result p3

    .line 219
    add-int/lit8 v2, v2, 0x1

    .line 220
    .line 221
    goto :goto_8

    .line 222
    :cond_19
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 223
    .line 224
    .line 225
    move-result p2

    .line 226
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 227
    .line 228
    .line 229
    move-result p4

    .line 230
    invoke-static {p3, p4}, Ljava/lang/Math;->min(II)I

    .line 231
    .line 232
    .line 233
    move-result p3

    .line 234
    invoke-interface {p0}, Landroid/view/inputmethod/InputConnection;->beginBatchEdit()Z

    .line 235
    .line 236
    .line 237
    invoke-interface {p1, p2, p3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 238
    .line 239
    .line 240
    invoke-interface {p0}, Landroid/view/inputmethod/InputConnection;->endBatchEdit()Z

    .line 241
    .line 242
    .line 243
    move v0, v4

    .line 244
    :cond_1a
    :goto_9
    return v0
.end method

.method private final v()V
    .locals 0

    .line 1
    return-void
.end method

.method private final w(ILjava/io/Serializable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(LMd;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LKa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LKa;

    .line 7
    .line 8
    iget v1, v0, LKa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LKa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LKa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LKa;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LKa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LKa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LLa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, LLa;-><init>(Ljava/lang/String;Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LKa;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public createWebView(Landroid/webkit/WebView;)Lorg/chromium/support_lib_boundary/WebViewProviderBoundaryInterface;
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "This should never happen, if this method was called it means we\'re trying to reach into WebView APK code on an incompatible device. This most likely means the current method is being called too early, or is being called on start-up rather than lazily"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p1
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, Lrb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lrb;

    .line 7
    .line 8
    iget v1, v0, Lrb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lrb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lrb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lrb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lrb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lrb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lsb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, Lsb;-><init>(Ljava/lang/String;Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lrb;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public e(Ljava/lang/String;LIa;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LMa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LMa;

    .line 7
    .line 8
    iget v1, v0, LMa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LMa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LMa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LMa;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LMa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LMa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LNa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, LNa;-><init>(Ljava/lang/String;LIa;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LMa;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public f(ILjava/io/Serializable;)V
    .locals 3

    .line 1
    iget v0, p0, Lt5;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    packed-switch p1, :pswitch_data_1

    .line 7
    .line 8
    .line 9
    :pswitch_0
    const-string v0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :pswitch_1
    const-string v0, "RESULT_DELETE_SKIP_FILE_SUCCESS"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :pswitch_2
    const-string v0, "RESULT_INSTALL_SKIP_FILE_SUCCESS"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :pswitch_3
    const-string v0, "RESULT_PARSE_EXCEPTION"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :pswitch_4
    const-string v0, "RESULT_IO_EXCEPTION"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_5
    const-string v0, "RESULT_BASELINE_PROFILE_NOT_FOUND"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_6
    const-string v0, "RESULT_DESIRED_FORMAT_UNSUPPORTED"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_7
    const-string v0, "RESULT_NOT_WRITABLE"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_8
    const-string v0, "RESULT_UNSUPPORTED_ART_VERSION"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_9
    const-string v0, "RESULT_ALREADY_INSTALLED"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_a
    const-string v0, "RESULT_INSTALL_SUCCESS"

    .line 40
    .line 41
    :goto_0
    const/4 v1, 0x6

    .line 42
    const-string v2, "ProfileInstaller"

    .line 43
    .line 44
    if-eq p1, v1, :cond_0

    .line 45
    .line 46
    const/4 v1, 0x7

    .line 47
    if-eq p1, v1, :cond_0

    .line 48
    .line 49
    const/16 v1, 0x8

    .line 50
    .line 51
    if-eq p1, v1, :cond_0

    .line 52
    .line 53
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_0
    check-cast p2, Ljava/lang/Throwable;

    .line 58
    .line 59
    invoke-static {v2, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    :goto_1
    :pswitch_b
    return-void

    .line 63
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_b
    .end packed-switch

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public g(Ljava/lang/String;LIa;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, Ltb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Ltb;

    .line 7
    .line 8
    iget v1, v0, Ltb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Ltb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ltb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Ltb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Ltb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Ltb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lub;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, Lub;-><init>(Ljava/lang/String;LIa;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Ltb;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public getStatics()Lorg/chromium/support_lib_boundary/StaticsBoundaryInterface;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v1, "This should never happen, if this method was called it means we\'re trying to reach into WebView APK code on an incompatible device. This most likely means the current method is being called too early, or is being called on start-up rather than lazily"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method

.method public h(Ljava/lang/String;LJa;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LOa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LOa;

    .line 7
    .line 8
    iget v1, v0, LOa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LOa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LOa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LOa;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LOa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LOa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LPa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, LPa;-><init>(Ljava/lang/String;LJa;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LOa;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public i()V
    .locals 2

    .line 1
    iget v0, p0, Lt5;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "ProfileInstaller"

    .line 7
    .line 8
    const-string v1, "DIAGNOSTIC_PROFILE_IS_COMPRESSED"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    :pswitch_0
    return-void

    .line 14
    nop

    .line 15
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public j()[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lt5;->f:[Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public k(Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, Lvb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lvb;

    .line 7
    .line 8
    iget v1, v0, Lvb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lvb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lvb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lvb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lvb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lvb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p2, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p2, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lwb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, v4}, Lwb;-><init>(Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lvb;->h:I

    .line 62
    .line 63
    invoke-static {p2, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-ne p2, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public m(Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, Lxb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lxb;

    .line 7
    .line 8
    iget v1, v0, Lxb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lxb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lxb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lxb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lxb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lxb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p2, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p2, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lyb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, v4}, Lyb;-><init>(Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lxb;->h:I

    .line 62
    .line 63
    invoke-static {p2, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-ne p2, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public n(Landroid/content/pm/PackageManager;Ljava/lang/String;)[Landroid/content/pm/Signature;
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 8
    .line 9
    return-object p1
.end method

.method public o(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, LZ8;

    .line 2
    .line 3
    iget p1, p1, LZ8;->c:I

    .line 4
    .line 5
    return p1
.end method

.method public q(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, LZ8;

    .line 2
    .line 3
    iget-boolean p1, p1, LZ8;->d:Z

    .line 4
    .line 5
    return p1
.end method

.method public r(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public s(Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, LQa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LQa;

    .line 7
    .line 8
    iget v1, v0, LQa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LQa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LQa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LQa;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LQa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LQa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p2, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p2, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LRa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, v4}, LRa;-><init>(Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LQa;->h:I

    .line 62
    .line 63
    invoke-static {p2, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-ne p2, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public t(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LSa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LSa;

    .line 7
    .line 8
    iget v1, v0, LSa;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LSa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LSa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LSa;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LSa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LSa;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LTa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, p0, v4}, LTa;-><init>(Ljava/lang/String;Ljava/lang/String;Lt5;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LSa;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public u(LMd;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public x(Ljava/lang/String;LJb;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, Lzb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lzb;

    .line 7
    .line 8
    iget v1, v0, Lzb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lzb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lzb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lzb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lzb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lzb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LAb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, v4}, LAb;-><init>(Ljava/lang/String;LJb;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lzb;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public y(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LDb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LDb;

    .line 7
    .line 8
    iget v1, v0, LDb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LDb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LDb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LDb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LDb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LDb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LEb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p2, p0, v4}, LEb;-><init>(Ljava/lang/String;Ljava/lang/String;Lt5;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LDb;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public z(Ljava/lang/String;LLb;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, LFb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LFb;

    .line 7
    .line 8
    iget v1, v0, LFb;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LFb;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LFb;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LFb;-><init>(Lt5;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LFb;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LFb;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, LGb;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p1, p0, p2, v4}, LGb;-><init>(Ljava/lang/String;Lt5;LLb;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, LFb;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method
