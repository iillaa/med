.class public final LFa;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:LHa;

.field public final synthetic j:Llc;

.field public final synthetic k:LIb;


# direct methods
.method public constructor <init>(LHa;Llc;LIb;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LFa;->i:LHa;

    .line 2
    .line 3
    iput-object p2, p0, LFa;->j:Llc;

    .line 4
    .line 5
    iput-object p3, p0, LFa;->k:LIb;

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
    check-cast p1, Lz8;

    .line 2
    .line 3
    check-cast p2, Lr5;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, LFa;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LFa;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LFa;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, LFa;

    .line 2
    .line 3
    iget-object v1, p0, LFa;->j:Llc;

    .line 4
    .line 5
    iget-object v2, p0, LFa;->k:LIb;

    .line 6
    .line 7
    iget-object v3, p0, LFa;->i:LHa;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, LFa;-><init>(LHa;Llc;LIb;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, LFa;->h:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    sget-object v1, Li6;->c:Li6;

    .line 4
    .line 5
    iget v2, p0, LFa;->g:I

    .line 6
    .line 7
    sget-object v3, Lfj;->a:Lfj;

    .line 8
    .line 9
    iget-object v4, p0, LFa;->i:LHa;

    .line 10
    .line 11
    const/4 v5, 0x2

    .line 12
    const/4 v6, 0x1

    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    if-eq v2, v6, :cond_1

    .line 16
    .line 17
    if-ne v2, v5, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_5

    .line 23
    .line 24
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 27
    .line 28
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p1

    .line 32
    :cond_1
    iget-object v2, p0, LFa;->h:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v2, Lz8;

    .line 35
    .line 36
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    check-cast p1, Lpg;

    .line 40
    .line 41
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, LFa;->h:Ljava/lang/Object;

    .line 48
    .line 49
    move-object v2, p1

    .line 50
    check-cast v2, Lz8;

    .line 51
    .line 52
    iget-object p1, v4, LHa;->a:LN6;

    .line 53
    .line 54
    iget-object v7, p0, LFa;->j:Llc;

    .line 55
    .line 56
    instance-of v8, v7, LOb;

    .line 57
    .line 58
    if-eqz v8, :cond_3

    .line 59
    .line 60
    check-cast v7, LOb;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    instance-of v8, v7, LPb;

    .line 64
    .line 65
    if-eqz v8, :cond_d

    .line 66
    .line 67
    check-cast v7, LPb;

    .line 68
    .line 69
    iput-object v2, p0, LFa;->h:Ljava/lang/Object;

    .line 70
    .line 71
    iput v6, p0, LFa;->g:I

    .line 72
    .line 73
    invoke-virtual {p1, v7, p0}, LN6;->k(LPb;Lr5;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-ne p1, v1, :cond_4

    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_4
    :goto_0
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    if-nez v6, :cond_6

    .line 85
    .line 86
    move-object v7, p1

    .line 87
    check-cast v7, LOb;

    .line 88
    .line 89
    :goto_1
    instance-of p1, v7, LNb;

    .line 90
    .line 91
    if-eqz p1, :cond_7

    .line 92
    .line 93
    move-object p1, v7

    .line 94
    check-cast p1, LNb;

    .line 95
    .line 96
    iget-object p1, p1, LNb;->o:Lsd;

    .line 97
    .line 98
    sget-object v6, Lsd;->d:Lsd;

    .line 99
    .line 100
    if-eq p1, v6, :cond_5

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_5
    new-instance p1, Lib;

    .line 104
    .line 105
    invoke-direct {p1}, Lib;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    goto :goto_2

    .line 113
    :cond_6
    invoke-static {v6}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    :cond_7
    :goto_2
    invoke-static {v7}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    if-nez p1, :cond_c

    .line 122
    .line 123
    check-cast v7, LOb;

    .line 124
    .line 125
    instance-of p1, v7, LNb;

    .line 126
    .line 127
    const-string v6, "options"

    .line 128
    .line 129
    const/4 v8, 0x0

    .line 130
    iget-object v9, p0, LFa;->k:LIb;

    .line 131
    .line 132
    if-eqz p1, :cond_8

    .line 133
    .line 134
    iget-object p1, v4, LHa;->b:Lt5;

    .line 135
    .line 136
    check-cast v7, LNb;

    .line 137
    .line 138
    iget-object v4, v7, LNb;->m:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    const-string p1, "fullPath"

    .line 144
    .line 145
    invoke-static {p1, v4}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v6, v9}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    new-instance p1, LCb;

    .line 152
    .line 153
    const/16 v6, 0x2000

    .line 154
    .line 155
    invoke-direct {p1, v4, v9, v6, v8}, LCb;-><init>(Ljava/lang/String;LIb;ILr5;)V

    .line 156
    .line 157
    .line 158
    new-instance v4, Li0;

    .line 159
    .line 160
    invoke-direct {v4, v0, p1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    sget-object p1, LR6;->a:LE6;

    .line 164
    .line 165
    sget-object p1, LB6;->e:LB6;

    .line 166
    .line 167
    invoke-static {v4, p1}, LMk;->m(Li0;LY5;)Ly8;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    goto :goto_3

    .line 172
    :cond_8
    iget-object p1, v4, LHa;->d:Li0;

    .line 173
    .line 174
    invoke-virtual {v7}, LOb;->R()Landroid/net/Uri;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    const-string v7, "uri"

    .line 182
    .line 183
    invoke-static {v7, v4}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v6, v9}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    new-instance v6, Lva;

    .line 190
    .line 191
    invoke-direct {v6, p1, v4, v9, v8}, Lva;-><init>(Li0;Landroid/net/Uri;LIb;Lr5;)V

    .line 192
    .line 193
    .line 194
    new-instance v7, Li0;

    .line 195
    .line 196
    invoke-direct {v7, v0, v6}, Li0;-><init>(ILjava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    sget-object v0, LR6;->a:LE6;

    .line 200
    .line 201
    sget-object v0, LB6;->e:LB6;

    .line 202
    .line 203
    invoke-static {v7, v0}, LMk;->m(Li0;LY5;)Ly8;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    new-instance v6, Lwa;

    .line 208
    .line 209
    invoke-direct {v6, p1, v4, v8}, Lwa;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 210
    .line 211
    .line 212
    new-instance p1, LY1;

    .line 213
    .line 214
    const/4 v4, 0x7

    .line 215
    invoke-direct {p1, v0, v4, v6}, LY1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    :goto_3
    iput-object v8, p0, LFa;->h:Ljava/lang/Object;

    .line 219
    .line 220
    iput v5, p0, LFa;->g:I

    .line 221
    .line 222
    instance-of v0, v2, Lqi;

    .line 223
    .line 224
    if-nez v0, :cond_b

    .line 225
    .line 226
    invoke-interface {p1, v2, p0}, Ly8;->c(Lz8;Lr5;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    if-ne p1, v1, :cond_9

    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_9
    move-object p1, v3

    .line 234
    :goto_4
    if-ne p1, v1, :cond_a

    .line 235
    .line 236
    return-object v1

    .line 237
    :cond_a
    :goto_5
    return-object v3

    .line 238
    :cond_b
    check-cast v2, Lqi;

    .line 239
    .line 240
    iget-object p1, v2, Lqi;->c:Ljava/lang/Throwable;

    .line 241
    .line 242
    throw p1

    .line 243
    :cond_c
    throw p1

    .line 244
    :cond_d
    new-instance p1, LJ4;

    .line 245
    .line 246
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 247
    .line 248
    .line 249
    throw p1
.end method
