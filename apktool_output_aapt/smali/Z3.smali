.class public final LZ3;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Lz8;

.field public final synthetic j:Lc4;


# direct methods
.method public constructor <init>(Lz8;Lc4;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LZ3;->i:Lz8;

    .line 2
    .line 3
    iput-object p2, p0, LZ3;->j:Lc4;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, LSh;-><init>(ILr5;)V

    .line 7
    .line 8
    .line 9
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
    invoke-virtual {p0, p2, p1}, LZ3;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LZ3;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LZ3;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 3

    .line 1
    new-instance v0, LZ3;

    .line 2
    .line 3
    iget-object v1, p0, LZ3;->i:Lz8;

    .line 4
    .line 5
    iget-object v2, p0, LZ3;->j:Lc4;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, LZ3;-><init>(Lz8;Lc4;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, LZ3;->h:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, LZ3;->g:I

    .line 4
    .line 5
    sget-object v2, Lfj;->a:Lfj;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v3, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, LZ3;->h:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Lh6;

    .line 31
    .line 32
    iget-object v1, p0, LZ3;->j:Lc4;

    .line 33
    .line 34
    iget v4, v1, Lc4;->d:I

    .line 35
    .line 36
    const/4 v5, -0x3

    .line 37
    const/4 v6, -0x2

    .line 38
    if-ne v4, v5, :cond_2

    .line 39
    .line 40
    move v4, v6

    .line 41
    :cond_2
    sget-object v5, Lk6;->d:Lk6;

    .line 42
    .line 43
    new-instance v7, La4;

    .line 44
    .line 45
    const/4 v8, 0x0

    .line 46
    invoke-direct {v7, v1, v8}, La4;-><init>(Lc4;Lr5;)V

    .line 47
    .line 48
    .line 49
    sget-object v9, LA3;->c:LA3;

    .line 50
    .line 51
    iget-object v10, v1, Lc4;->e:LA3;

    .line 52
    .line 53
    if-eq v4, v6, :cond_9

    .line 54
    .line 55
    const/4 v6, -0x1

    .line 56
    if-eq v4, v6, :cond_7

    .line 57
    .line 58
    if-eqz v4, :cond_5

    .line 59
    .line 60
    const v6, 0x7fffffff

    .line 61
    .line 62
    .line 63
    if-eq v4, v6, :cond_4

    .line 64
    .line 65
    if-ne v10, v9, :cond_3

    .line 66
    .line 67
    new-instance v6, LE3;

    .line 68
    .line 69
    invoke-direct {v6, v4, v8}, LE3;-><init>(ILJ9;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    new-instance v6, Ld5;

    .line 74
    .line 75
    invoke-direct {v6, v4, v10, v8}, Ld5;-><init>(ILA3;LJ9;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    new-instance v4, LE3;

    .line 80
    .line 81
    invoke-direct {v4, v6, v8}, LE3;-><init>(ILJ9;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    move-object v6, v4

    .line 85
    goto :goto_1

    .line 86
    :cond_5
    if-ne v10, v9, :cond_6

    .line 87
    .line 88
    new-instance v4, LE3;

    .line 89
    .line 90
    const/4 v6, 0x0

    .line 91
    invoke-direct {v4, v6, v8}, LE3;-><init>(ILJ9;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    new-instance v4, Ld5;

    .line 96
    .line 97
    invoke-direct {v4, v3, v10, v8}, Ld5;-><init>(ILA3;LJ9;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_7
    if-ne v10, v9, :cond_8

    .line 102
    .line 103
    new-instance v6, Ld5;

    .line 104
    .line 105
    sget-object v4, LA3;->d:LA3;

    .line 106
    .line 107
    invoke-direct {v6, v3, v4, v8}, Ld5;-><init>(ILA3;LJ9;)V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 112
    .line 113
    const-string v0, "CONFLATED capacity cannot be used with non-default onBufferOverflow"

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p1

    .line 123
    :cond_9
    if-ne v10, v9, :cond_a

    .line 124
    .line 125
    new-instance v4, LE3;

    .line 126
    .line 127
    sget-object v6, LY3;->a:LX3;

    .line 128
    .line 129
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    sget v6, LX3;->b:I

    .line 133
    .line 134
    invoke-direct {v4, v6, v8}, LE3;-><init>(ILJ9;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_a
    new-instance v4, Ld5;

    .line 139
    .line 140
    invoke-direct {v4, v3, v10, v8}, Ld5;-><init>(ILA3;LJ9;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :goto_1
    invoke-interface {p1}, Lh6;->g()LY5;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object v1, v1, Lc4;->c:LY5;

    .line 149
    .line 150
    invoke-static {p1, v1, v3}, LMk;->n(LY5;LY5;Z)LY5;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget-object v1, LR6;->a:LE6;

    .line 155
    .line 156
    if-eq p1, v1, :cond_b

    .line 157
    .line 158
    sget-object v4, Lt5;->d:Lt5;

    .line 159
    .line 160
    invoke-interface {p1, v4}, LY5;->c(LX5;)LW5;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    if-nez v4, :cond_b

    .line 165
    .line 166
    invoke-interface {p1, v1}, LY5;->k(LY5;)LY5;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    :cond_b
    new-instance v1, Lzf;

    .line 171
    .line 172
    invoke-direct {v1, p1, v6}, Lzf;-><init>(LY5;LE3;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v5, v1, v7}, Lf;->P(Lk6;Lf;LN9;)V

    .line 176
    .line 177
    .line 178
    iput v3, p0, LZ3;->g:I

    .line 179
    .line 180
    iget-object p1, p0, LZ3;->i:Lz8;

    .line 181
    .line 182
    invoke-static {p1, v1, v3, p0}, Lr3;->m(Lz8;Lzf;ZLr5;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    if-ne p1, v0, :cond_c

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_c
    move-object p1, v2

    .line 190
    :goto_2
    if-ne p1, v0, :cond_d

    .line 191
    .line 192
    return-object v0

    .line 193
    :cond_d
    :goto_3
    return-object v2
.end method
