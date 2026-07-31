.class public final LGb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:Ljava/io/File;

.field public h:I

.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lt5;

.field public final synthetic l:LLb;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lt5;LLb;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LGb;->j:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, LGb;->k:Lt5;

    .line 4
    .line 5
    iput-object p3, p0, LGb;->l:LLb;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, LSh;-><init>(ILr5;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lh6;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, LGb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LGb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LGb;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 4

    .line 1
    new-instance v0, LGb;

    .line 2
    .line 3
    iget-object v1, p0, LGb;->k:Lt5;

    .line 4
    .line 5
    iget-object v2, p0, LGb;->l:LLb;

    .line 6
    .line 7
    iget-object v3, p0, LGb;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, LGb;-><init>(Ljava/lang/String;Lt5;LLb;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, LGb;->i:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, LGb;->h:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, LGb;->g:Ljava/io/File;

    .line 11
    .line 12
    iget-object v1, p0, LGb;->i:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, LLb;

    .line 15
    .line 16
    :try_start_0
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    check-cast p1, Lpg;

    .line 20
    .line 21
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto/16 :goto_a

    .line 26
    .line 27
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1

    .line 35
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, LGb;->i:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p1, Lh6;

    .line 41
    .line 42
    iget-object p1, p0, LGb;->j:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, LGb;->k:Lt5;

    .line 45
    .line 46
    :try_start_1
    new-instance v3, Ljava/io/File;

    .line 47
    .line 48
    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 52
    .line 53
    .line 54
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    iget-object v5, p0, LGb;->l:LLb;

    .line 56
    .line 57
    if-nez v4, :cond_4

    .line 58
    .line 59
    :try_start_2
    new-instance v4, LIa;

    .line 60
    .line 61
    iget-boolean v6, v5, LLb;->d:Z

    .line 62
    .line 63
    invoke-direct {v4, v6}, LIa;-><init>(Z)V

    .line 64
    .line 65
    .line 66
    iput-object v5, p0, LGb;->i:Ljava/lang/Object;

    .line 67
    .line 68
    iput-object v3, p0, LGb;->g:Ljava/io/File;

    .line 69
    .line 70
    iput v2, p0, LGb;->h:I

    .line 71
    .line 72
    invoke-virtual {v1, p1, v4, p0}, Lt5;->g(Ljava/lang/String;LIa;Lr5;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    if-ne p1, v0, :cond_2

    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_2
    move-object v0, v3

    .line 80
    move-object v1, v5

    .line 81
    :goto_0
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    move-object v3, v0

    .line 88
    move-object v5, v1

    .line 89
    goto :goto_1

    .line 90
    :cond_3
    throw p1

    .line 91
    :cond_4
    :goto_1
    new-instance p1, Ljava/io/FileOutputStream;

    .line 92
    .line 93
    iget-object v0, v5, LLb;->c:LKb;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 94
    .line 95
    iget-object v1, v5, LLb;->b:LWa;

    .line 96
    .line 97
    :try_start_3
    sget-object v4, LKb;->d:LKb;

    .line 98
    .line 99
    if-ne v0, v4, :cond_5

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_5
    const/4 v2, 0x0

    .line 103
    :goto_2
    invoke-direct {p1, v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 104
    .line 105
    .line 106
    :try_start_4
    instance-of v0, v1, LVa;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 107
    .line 108
    const/4 v2, 0x0

    .line 109
    iget-object v3, v5, LLb;->a:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    :try_start_5
    new-instance v0, Ljava/io/BufferedWriter;

    .line 114
    .line 115
    new-instance v4, Ljava/io/OutputStreamWriter;

    .line 116
    .line 117
    check-cast v1, LVa;

    .line 118
    .line 119
    iget-object v1, v1, LVa;->b:Ljava/nio/charset/Charset;

    .line 120
    .line 121
    invoke-direct {v4, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {v0, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 125
    .line 126
    .line 127
    :try_start_6
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 128
    .line 129
    .line 130
    :try_start_7
    invoke-static {v0, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 131
    .line 132
    .line 133
    goto/16 :goto_8

    .line 134
    .line 135
    :catchall_1
    move-exception v0

    .line 136
    goto/16 :goto_9

    .line 137
    .line 138
    :catchall_2
    move-exception v1

    .line 139
    :try_start_8
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 140
    :catchall_3
    move-exception v2

    .line 141
    :try_start_9
    invoke-static {v0, v1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    throw v2

    .line 145
    :cond_6
    const-string v0, ","

    .line 146
    .line 147
    invoke-static {v3, v0}, LJh;->O(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    const/4 v3, 0x1

    .line 156
    sub-int/2addr v1, v3

    .line 157
    const/4 v4, 0x0

    .line 158
    move v5, v4

    .line 159
    move v6, v5

    .line 160
    :goto_3
    if-gt v5, v1, :cond_d

    .line 161
    .line 162
    if-nez v6, :cond_7

    .line 163
    .line 164
    move v7, v5

    .line 165
    goto :goto_4

    .line 166
    :cond_7
    move v7, v1

    .line 167
    :goto_4
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    invoke-static {v7}, Ljava/lang/Character;->isWhitespace(C)Z

    .line 172
    .line 173
    .line 174
    move-result v8

    .line 175
    if-nez v8, :cond_9

    .line 176
    .line 177
    invoke-static {v7}, Ljava/lang/Character;->isSpaceChar(C)Z

    .line 178
    .line 179
    .line 180
    move-result v7

    .line 181
    if-eqz v7, :cond_8

    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_8
    move v7, v4

    .line 185
    goto :goto_6

    .line 186
    :cond_9
    :goto_5
    move v7, v3

    .line 187
    :goto_6
    if-nez v6, :cond_b

    .line 188
    .line 189
    if-nez v7, :cond_a

    .line 190
    .line 191
    move v6, v3

    .line 192
    goto :goto_3

    .line 193
    :cond_a
    add-int/lit8 v5, v5, 0x1

    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_b
    if-nez v7, :cond_c

    .line 197
    .line 198
    goto :goto_7

    .line 199
    :cond_c
    add-int/lit8 v1, v1, -0x1

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_d
    :goto_7
    add-int/2addr v1, v3

    .line 203
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    const/4 v1, 0x2

    .line 212
    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 217
    .line 218
    invoke-direct {v1, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 219
    .line 220
    .line 221
    :try_start_a
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 222
    .line 223
    .line 224
    :try_start_b
    invoke-static {v1, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 225
    .line 226
    .line 227
    :goto_8
    :try_start_c
    invoke-static {p1, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    sget-object p1, Lfj;->a:Lfj;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 231
    .line 232
    goto :goto_b

    .line 233
    :catchall_4
    move-exception v0

    .line 234
    :try_start_d
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 235
    :catchall_5
    move-exception v2

    .line 236
    :try_start_e
    invoke-static {v1, v0}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 237
    .line 238
    .line 239
    throw v2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 240
    :goto_9
    :try_start_f
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 241
    :catchall_6
    move-exception v1

    .line 242
    :try_start_10
    invoke-static {p1, v0}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 243
    .line 244
    .line 245
    throw v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 246
    :goto_a
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    :goto_b
    new-instance v0, Lpg;

    .line 251
    .line 252
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    return-object v0
.end method
