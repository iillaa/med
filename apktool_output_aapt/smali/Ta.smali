.class public final LTa;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:Lt5;

.field public h:I

.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lt5;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lt5;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LTa;->j:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, LTa;->k:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, LTa;->l:Lt5;

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
    invoke-virtual {p0, p2, p1}, LTa;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LTa;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LTa;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, LTa;

    .line 2
    .line 3
    iget-object v1, p0, LTa;->k:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, LTa;->l:Lt5;

    .line 6
    .line 7
    iget-object v3, p0, LTa;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, LTa;-><init>(Ljava/lang/String;Ljava/lang/String;Lt5;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, LTa;->i:Ljava/lang/Object;

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
    iget v1, p0, LTa;->h:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, 0x1

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    if-eq v1, v4, :cond_1

    .line 11
    .line 12
    if-ne v1, v3, :cond_0

    .line 13
    .line 14
    :try_start_0
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    check-cast p1, Lpg;

    .line 18
    .line 19
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto/16 :goto_4

    .line 25
    .line 26
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 27
    .line 28
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p1

    .line 34
    :cond_1
    iget-object v1, p0, LTa;->g:Lt5;

    .line 35
    .line 36
    iget-object v5, p0, LTa;->i:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v5, Ljava/lang/String;

    .line 39
    .line 40
    :try_start_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    check-cast p1, Lpg;

    .line 44
    .line 45
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, LTa;->i:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p1, Lh6;

    .line 54
    .line 55
    iget-object v5, p0, LTa;->j:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p1, p0, LTa;->k:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, LTa;->l:Lt5;

    .line 60
    .line 61
    :try_start_2
    new-instance v6, Ljava/io/File;

    .line 62
    .line 63
    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance v7, Ljava/io/File;

    .line 67
    .line 68
    invoke-direct {v7, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    if-nez v8, :cond_c

    .line 76
    .line 77
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    if-eqz v8, :cond_b

    .line 82
    .line 83
    invoke-virtual {v6}, Ljava/io/File;->isFile()Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    if-nez v8, :cond_a

    .line 88
    .line 89
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    if-nez v8, :cond_a

    .line 94
    .line 95
    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    if-eqz v8, :cond_4

    .line 100
    .line 101
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 102
    .line 103
    .line 104
    move-result v8

    .line 105
    if-eqz v8, :cond_3

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    new-instance p1, Lab;

    .line 109
    .line 110
    invoke-direct {p1}, Lab;-><init>()V

    .line 111
    .line 112
    .line 113
    throw p1

    .line 114
    :cond_4
    :goto_0
    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    if-nez v8, :cond_9

    .line 119
    .line 120
    invoke-virtual {v6, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    if-nez v6, :cond_c

    .line 125
    .line 126
    iput-object v5, p0, LTa;->i:Ljava/lang/Object;

    .line 127
    .line 128
    iput-object v1, p0, LTa;->g:Lt5;

    .line 129
    .line 130
    iput v4, p0, LTa;->h:I

    .line 131
    .line 132
    invoke-virtual {v1, v5, p1, p0}, Lt5;->c(Ljava/lang/String;Ljava/lang/String;Lr5;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-ne p1, v0, :cond_5

    .line 137
    .line 138
    return-object v0

    .line 139
    :cond_5
    :goto_1
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    if-nez p1, :cond_8

    .line 144
    .line 145
    new-instance p1, LJa;

    .line 146
    .line 147
    invoke-direct {p1, v4}, LJa;-><init>(Z)V

    .line 148
    .line 149
    .line 150
    iput-object v2, p0, LTa;->i:Ljava/lang/Object;

    .line 151
    .line 152
    iput-object v2, p0, LTa;->g:Lt5;

    .line 153
    .line 154
    iput v3, p0, LTa;->h:I

    .line 155
    .line 156
    invoke-virtual {v1, v5, p1, p0}, Lt5;->h(Ljava/lang/String;LJa;Lr5;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    if-ne p1, v0, :cond_6

    .line 161
    .line 162
    return-object v0

    .line 163
    :cond_6
    :goto_2
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    if-nez p1, :cond_7

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_7
    new-instance v0, Lkb;

    .line 171
    .line 172
    invoke-direct {v0, p1}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 173
    .line 174
    .line 175
    throw v0

    .line 176
    :cond_8
    new-instance v0, Lkb;

    .line 177
    .line 178
    invoke-direct {v0, p1}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    throw v0

    .line 182
    :cond_9
    new-instance v0, LXa;

    .line 183
    .line 184
    invoke-direct {v0, p1}, LXa;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    throw v0

    .line 188
    :cond_a
    new-instance p1, LZa;

    .line 189
    .line 190
    invoke-direct {p1}, LZa;-><init>()V

    .line 191
    .line 192
    .line 193
    throw p1

    .line 194
    :cond_b
    new-instance p1, Lgb;

    .line 195
    .line 196
    invoke-direct {p1, v5, v2}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    .line 198
    .line 199
    throw p1

    .line 200
    :cond_c
    :goto_3
    sget-object p1, Lfj;->a:Lfj;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 201
    .line 202
    goto :goto_5

    .line 203
    :goto_4
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    :goto_5
    new-instance v0, Lpg;

    .line 208
    .line 209
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    return-object v0
.end method
