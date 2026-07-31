.class public final LIh;
.super LKc;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, LIh;->d:Ljava/util/List;

    .line 2
    .line 3
    iput-boolean p2, p0, LIh;->e:Z

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1}, LKc;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 1
    check-cast p1, Ljava/lang/CharSequence;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Number;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const-string v0, "$this$$receiver"

    .line 10
    .line 11
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/4 v1, 0x0

    .line 16
    iget-object v2, p0, LIh;->d:Ljava/util/List;

    .line 17
    .line 18
    iget-boolean v9, p0, LIh;->e:Z

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    if-nez v9, :cond_3

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/Collection;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-ne v4, v3, :cond_3

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_2

    .line 34
    .line 35
    if-ne v4, v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ljava/lang/String;

    .line 42
    .line 43
    const/4 v3, 0x4

    .line 44
    invoke-static {p1, v2, p2, v0, v3}, LJh;->I(Ljava/lang/CharSequence;Ljava/lang/String;IZI)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-gez p1, :cond_0

    .line 49
    .line 50
    goto/16 :goto_4

    .line 51
    .line 52
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance p2, Lgf;

    .line 57
    .line 58
    invoke-direct {p2, p1, v2}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto/16 :goto_5

    .line 62
    .line 63
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 64
    .line 65
    const-string p2, "List has more than one element."

    .line 66
    .line 67
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p1

    .line 71
    :cond_2
    new-instance p1, Ljava/util/NoSuchElementException;

    .line 72
    .line 73
    const-string p2, "List is empty."

    .line 74
    .line 75
    invoke-direct {p1, p2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :cond_3
    new-instance v4, Ljc;

    .line 80
    .line 81
    if-gez p2, :cond_4

    .line 82
    .line 83
    move p2, v0

    .line 84
    :cond_4
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-direct {v4, p2, v0, v3}, Lhc;-><init>(III)V

    .line 89
    .line 90
    .line 91
    instance-of v0, p1, Ljava/lang/String;

    .line 92
    .line 93
    iget v10, v4, Lhc;->d:I

    .line 94
    .line 95
    if-eqz v0, :cond_9

    .line 96
    .line 97
    if-le p2, v10, :cond_5

    .line 98
    .line 99
    goto/16 :goto_4

    .line 100
    .line 101
    :cond_5
    :goto_0
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-eqz v3, :cond_7

    .line 110
    .line 111
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v11

    .line 115
    move-object v6, v11

    .line 116
    check-cast v6, Ljava/lang/String;

    .line 117
    .line 118
    move-object v7, p1

    .line 119
    check-cast v7, Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    const/4 v3, 0x0

    .line 126
    move v4, p2

    .line 127
    move v8, v9

    .line 128
    invoke-static/range {v3 .. v8}, LJh;->M(IIILjava/lang/String;Ljava/lang/String;Z)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_6

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_7
    move-object v11, v1

    .line 136
    :goto_1
    check-cast v11, Ljava/lang/String;

    .line 137
    .line 138
    if-eqz v11, :cond_8

    .line 139
    .line 140
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    new-instance p2, Lgf;

    .line 145
    .line 146
    invoke-direct {p2, p1, v11}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_8
    if-eq p2, v10, :cond_e

    .line 151
    .line 152
    add-int/lit8 p2, p2, 0x1

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_9
    if-le p2, v10, :cond_a

    .line 156
    .line 157
    goto :goto_4

    .line 158
    :cond_a
    :goto_2
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    if-eqz v3, :cond_c

    .line 167
    .line 168
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    move-object v4, v3

    .line 173
    check-cast v4, Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    invoke-static {v4, p1, p2, v5, v9}, LJh;->N(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZ)Z

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    if-eqz v4, :cond_b

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_c
    move-object v3, v1

    .line 187
    :goto_3
    check-cast v3, Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v3, :cond_d

    .line 190
    .line 191
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    new-instance p2, Lgf;

    .line 196
    .line 197
    invoke-direct {p2, p1, v3}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    goto :goto_5

    .line 201
    :cond_d
    if-eq p2, v10, :cond_e

    .line 202
    .line 203
    add-int/lit8 p2, p2, 0x1

    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_e
    :goto_4
    move-object p2, v1

    .line 207
    :goto_5
    if-eqz p2, :cond_f

    .line 208
    .line 209
    iget-object p1, p2, Lgf;->d:Ljava/lang/Object;

    .line 210
    .line 211
    check-cast p1, Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    new-instance v1, Lgf;

    .line 222
    .line 223
    iget-object p2, p2, Lgf;->c:Ljava/lang/Object;

    .line 224
    .line 225
    invoke-direct {v1, p2, p1}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    :cond_f
    return-object v1
.end method
