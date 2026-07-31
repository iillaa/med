.class public final LRb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public final synthetic g:LN6;

.field public final synthetic h:Ljava/io/File;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(LN6;Ljava/io/File;Ljava/lang/String;Ljava/lang/Boolean;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LRb;->g:LN6;

    .line 2
    .line 3
    iput-object p2, p0, LRb;->h:Ljava/io/File;

    .line 4
    .line 5
    iput-object p3, p0, LRb;->i:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, LRb;->j:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-direct {p0, p1, p5}, LSh;-><init>(ILr5;)V

    .line 11
    .line 12
    .line 13
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
    invoke-virtual {p0, p2, p1}, LRb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LRb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LRb;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 6

    .line 1
    new-instance p2, LRb;

    .line 2
    .line 3
    iget-object v3, p0, LRb;->i:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v4, p0, LRb;->j:Ljava/lang/Boolean;

    .line 6
    .line 7
    iget-object v1, p0, LRb;->g:LN6;

    .line 8
    .line 9
    iget-object v2, p0, LRb;->h:Ljava/io/File;

    .line 10
    .line 11
    move-object v0, p2

    .line 12
    move-object v5, p1

    .line 13
    invoke-direct/range {v0 .. v5}, LRb;-><init>(LN6;Ljava/io/File;Ljava/lang/String;Ljava/lang/Boolean;Lr5;)V

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lsd;->e:Lsd;

    .line 2
    .line 3
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LRb;->g:LN6;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LRb;->h:Ljava/io/File;

    .line 12
    .line 13
    iget-object v2, p0, LRb;->i:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v3, Ljava/io/File;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-direct {v3, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, LRb;->j:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    goto :goto_3

    .line 39
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v4, "getAbsolutePath(...)"

    .line 44
    .line 45
    invoke-static {v4, v2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    sget-object v5, Lpb;->m:LJ7;

    .line 49
    .line 50
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    new-instance v6, Li;

    .line 54
    .line 55
    const/4 v7, 0x0

    .line 56
    invoke-direct {v6, v7, v5}, Li;-><init>(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-virtual {v6}, Li;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-eqz v5, :cond_4

    .line 64
    .line 65
    invoke-virtual {v6}, Li;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    move-object v7, v5

    .line 70
    check-cast v7, Lpb;

    .line 71
    .line 72
    invoke-virtual {p1, v7}, LN6;->i(Lpb;)Ljava/io/File;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    if-eqz v7, :cond_3

    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v4, v7}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v2, v7}, LJh;->E(Ljava/lang/CharSequence;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    goto :goto_1

    .line 90
    :cond_3
    const/4 v7, 0x0

    .line 91
    :goto_1
    if-eqz v7, :cond_2

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    const/4 v5, 0x0

    .line 95
    :goto_2
    check-cast v5, Lpb;

    .line 96
    .line 97
    if-eqz v5, :cond_5

    .line 98
    .line 99
    iget-boolean p1, v5, Lpb;->c:Z

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_5
    const/4 p1, 0x1

    .line 103
    :goto_3
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    const-string v4, "getPath(...)"

    .line 108
    .line 109
    invoke-static {v4, v2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 113
    .line 114
    const-string v5, "separator"

    .line 115
    .line 116
    invoke-static {v5, v4}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-nez v2, :cond_6

    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-nez v2, :cond_8

    .line 130
    .line 131
    :cond_6
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    const-string v5, ""

    .line 136
    .line 137
    if-nez v2, :cond_7

    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    const-string v6, "getName(...)"

    .line 144
    .line 145
    invoke-static {v6, v2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v2, v5}, LJh;->P(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-static {v2}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_7

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_7
    move-object v4, v5

    .line 160
    :cond_8
    :goto_4
    new-instance v2, LNb;

    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    new-instance v6, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    new-instance v7, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v6, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const-string v4, "build(...)"

    .line 213
    .line 214
    invoke-static {v4, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    if-nez v4, :cond_9

    .line 222
    .line 223
    goto :goto_5

    .line 224
    :cond_9
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-eqz v4, :cond_a

    .line 229
    .line 230
    sget-object v0, Lsd;->d:Lsd;

    .line 231
    .line 232
    goto :goto_5

    .line 233
    :cond_a
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    if-eqz v3, :cond_b

    .line 238
    .line 239
    sget-object v0, Lsd;->c:Lsd;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    .line 241
    :catch_0
    :cond_b
    :goto_5
    invoke-direct {v2, v5, v1, v0, p1}, LNb;-><init>(Ljava/lang/String;Landroid/net/Uri;Lsd;Z)V

    .line 242
    .line 243
    .line 244
    return-object v2
.end method
