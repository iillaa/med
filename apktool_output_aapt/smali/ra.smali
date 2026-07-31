.class public final Lra;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Li0;

.field public final synthetic i:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Li0;Landroid/net/Uri;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lra;->h:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lra;->i:Landroid/net/Uri;

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
    invoke-virtual {p0, p2, p1}, Lra;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lra;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lra;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lra;

    .line 2
    .line 3
    iget-object v1, p0, Lra;->h:Li0;

    .line 4
    .line 5
    iget-object v2, p0, Lra;->i:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lra;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lra;->g:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Llc;->P(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, v1, Lra;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lh6;

    .line 9
    .line 10
    iget-object v2, v1, Lra;->h:Li0;

    .line 11
    .line 12
    iget-object v0, v1, Lra;->i:Landroid/net/Uri;

    .line 13
    .line 14
    :try_start_0
    iget-object v3, v2, Li0;->d:Ljava/lang/Object;

    .line 15
    .line 16
    move-object v9, v3

    .line 17
    check-cast v9, Landroid/content/ContentResolver;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    const/4 v8, 0x0

    .line 23
    move-object v3, v9

    .line 24
    move-object v4, v0

    .line 25
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 26
    .line 27
    .line 28
    move-result-object v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 29
    const/4 v14, 0x0

    .line 30
    if-eqz v13, :cond_6

    .line 31
    .line 32
    :try_start_1
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_5

    .line 37
    .line 38
    invoke-virtual {v9}, Landroid/content/ContentResolver;->getPersistedUriPermissions()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    const-string v3, "_display_name"

    .line 42
    .line 43
    filled-new-array {v3, v3, v3}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v3}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v13, v3}, Li0;->B(Landroid/database/Cursor;Ljava/util/List;)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    if-eqz v3, :cond_0

    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-interface {v13, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    move-object v5, v3

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    move-object v5, v14

    .line 68
    :goto_0
    if-eqz v5, :cond_4

    .line 69
    .line 70
    invoke-static {v2, v13, v0}, Li0;->x(Li0;Landroid/database/Cursor;Landroid/net/Uri;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v7

    .line 74
    const-string v3, "date_modified"

    .line 75
    .line 76
    const-string v4, "last_modified"

    .line 77
    .line 78
    filled-new-array {v3, v4}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v13, v3}, Li0;->B(Landroid/database/Cursor;Ljava/util/List;)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    if-eqz v3, :cond_1

    .line 91
    .line 92
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    invoke-interface {v13, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const-string v4, "getString(...)"

    .line 101
    .line 102
    invoke-static {v4, v3}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v3}, LJh;->Q(Ljava/lang/String;)Ljava/lang/Long;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    if-eqz v3, :cond_1

    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 112
    .line 113
    .line 114
    move-result-wide v3

    .line 115
    :goto_1
    move-wide v11, v3

    .line 116
    goto :goto_2

    .line 117
    :cond_1
    invoke-static {v13}, Li0;->C(Landroid/database/Cursor;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    goto :goto_1

    .line 122
    :goto_2
    invoke-static {v13}, Li0;->C(Landroid/database/Cursor;)J

    .line 123
    .line 124
    .line 125
    move-result-wide v3

    .line 126
    invoke-virtual {v9, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    if-nez v6, :cond_2

    .line 131
    .line 132
    const-string v6, "application/octet-binary"

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :catchall_0
    move-exception v0

    .line 136
    move-object v3, v0

    .line 137
    goto :goto_4

    .line 138
    :cond_2
    :goto_3
    new-instance v15, LHb;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v9

    .line 144
    if-nez v9, :cond_3

    .line 145
    .line 146
    const-string v9, ""

    .line 147
    .line 148
    :cond_3
    new-instance v10, Lob;

    .line 149
    .line 150
    invoke-direct {v10, v6}, Lob;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-instance v6, Ljava/lang/Long;

    .line 154
    .line 155
    invoke-direct {v6, v3, v4}, Ljava/lang/Long;-><init>(J)V

    .line 156
    .line 157
    .line 158
    move-object v3, v15

    .line 159
    move-object v4, v9

    .line 160
    move-object/from16 v16, v6

    .line 161
    .line 162
    move-object v6, v0

    .line 163
    move-object v9, v10

    .line 164
    move-object/from16 v10, v16

    .line 165
    .line 166
    invoke-direct/range {v3 .. v12}, LHb;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;JLr3;Ljava/lang/Long;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 167
    .line 168
    .line 169
    :try_start_2
    invoke-static {v13, v14}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 170
    .line 171
    .line 172
    goto :goto_6

    .line 173
    :catchall_1
    move-exception v0

    .line 174
    goto :goto_5

    .line 175
    :cond_4
    :try_start_3
    new-instance v0, Lkb;

    .line 176
    .line 177
    invoke-direct {v0, v14}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    throw v0

    .line 181
    :cond_5
    new-instance v3, Lgb;

    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v4, "toString(...)"

    .line 188
    .line 189
    invoke-static {v4, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    invoke-direct {v3, v0, v14}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    :goto_4
    :try_start_4
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 197
    :catchall_2
    move-exception v0

    .line 198
    move-object v4, v0

    .line 199
    :try_start_5
    invoke-static {v13, v3}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    throw v4

    .line 203
    :cond_6
    new-instance v0, Lkb;

    .line 204
    .line 205
    invoke-direct {v0, v14}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 206
    .line 207
    .line 208
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 209
    :goto_5
    invoke-static {v0}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 210
    .line 211
    .line 212
    move-result-object v15

    .line 213
    :goto_6
    iget-object v0, v1, Lra;->i:Landroid/net/Uri;

    .line 214
    .line 215
    invoke-static {v2, v15, v0}, Li0;->y(Li0;Ljava/lang/Object;Landroid/net/Uri;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    new-instance v2, Lpg;

    .line 220
    .line 221
    invoke-direct {v2, v0}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    return-object v2
.end method
