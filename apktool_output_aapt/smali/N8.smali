.class public abstract LN8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LGd;

.field public static final b:LK8;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LGd;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, LGd;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN8;->a:LGd;

    .line 8
    .line 9
    new-instance v0, LK8;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, LN8;->b:LK8;

    .line 15
    .line 16
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/util/List;)LM0;
    .locals 5

    .line 1
    const-string v0, "FontProvider.getFontFamilyResult"

    .line 2
    .line 3
    invoke-static {v0}, Lu6;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ge v1, v2, :cond_1

    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, LO8;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-static {v3, v2, v4}, LN8;->b(Landroid/content/pm/PackageManager;LO8;Landroid/content/res/Resources;)Landroid/content/pm/ProviderInfo;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    new-instance p0, LM0;

    .line 39
    .line 40
    invoke-direct {p0}, LM0;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_0
    :try_start_1
    iget-object v3, v3, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0, v2, v3}, LN8;->c(Landroid/content/Context;LO8;Ljava/lang/String;)[LZ8;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    new-instance p0, LM0;

    .line 62
    .line 63
    invoke-direct {p0, v0}, LM0;-><init>(Ljava/util/ArrayList;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    .line 66
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 67
    .line 68
    .line 69
    return-object p0

    .line 70
    :goto_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 71
    .line 72
    .line 73
    throw p0
.end method

.method public static b(Landroid/content/pm/PackageManager;LO8;Landroid/content/res/Resources;)Landroid/content/pm/ProviderInfo;
    .locals 9

    .line 1
    const-string v0, "Found content provider "

    .line 2
    .line 3
    const-string v1, "No package found for authority: "

    .line 4
    .line 5
    const-string v2, "FontProvider.getProvider"

    .line 6
    .line 7
    invoke-static {v2}, Lu6;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v2, p1, LO8;->d:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    iget-object v3, p1, LO8;->a:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p1, p1, LO8;->b:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    :try_start_1
    invoke-static {p2, v4}, Llc;->E(Landroid/content/res/Resources;I)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    :goto_0
    new-instance p2, LM8;

    .line 25
    .line 26
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v3, p2, LM8;->a:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p2, LM8;->b:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, p2, LM8;->c:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    sget-object v5, LN8;->a:LGd;

    .line 36
    .line 37
    :try_start_2
    invoke-virtual {v5, p2}, LGd;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    check-cast v6, Landroid/content/pm/ProviderInfo;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    .line 43
    if-eqz v6, :cond_1

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 46
    .line 47
    .line 48
    return-object v6

    .line 49
    :cond_1
    :try_start_3
    invoke-virtual {p0, v3, v4}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    if-eqz v6, :cond_8

    .line 54
    .line 55
    iget-object v1, v6, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_7

    .line 62
    .line 63
    iget-object p1, v6, Landroid/content/pm/ProviderInfo;->packageName:Ljava/lang/String;

    .line 64
    .line 65
    const/16 v0, 0x40

    .line 66
    .line 67
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    array-length v0, p0

    .line 79
    move v1, v4

    .line 80
    :goto_1
    if-ge v1, v0, :cond_2

    .line 81
    .line 82
    aget-object v3, p0, v1

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    .line 90
    .line 91
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    sget-object p0, LN8;->b:LK8;

    .line 95
    .line 96
    :try_start_4
    invoke-static {p1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 97
    .line 98
    .line 99
    move v0, v4

    .line 100
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-ge v0, v1, :cond_6

    .line 105
    .line 106
    new-instance v1, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Ljava/util/Collection;

    .line 113
    .line 114
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    if-eq v3, v7, :cond_3

    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_3
    move v3, v4

    .line 132
    :goto_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    if-ge v3, v7, :cond_5

    .line 137
    .line 138
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    check-cast v7, [B

    .line 143
    .line 144
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    check-cast v8, [B

    .line 149
    .line 150
    invoke-static {v7, v8}, Ljava/util/Arrays;->equals([B[B)Z

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    if-nez v7, :cond_4

    .line 155
    .line 156
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_5
    invoke-virtual {v5, p2, v6}, LGd;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 163
    .line 164
    .line 165
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 166
    .line 167
    .line 168
    return-object v6

    .line 169
    :catchall_0
    move-exception p0

    .line 170
    goto :goto_5

    .line 171
    :cond_6
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 172
    .line 173
    .line 174
    const/4 p0, 0x0

    .line 175
    return-object p0

    .line 176
    :cond_7
    :try_start_5
    new-instance p0, Landroid/content/pm/PackageManager$NameNotFoundException;

    .line 177
    .line 178
    new-instance p2, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v0, ", but package was not "

    .line 187
    .line 188
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-direct {p0, p1}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    throw p0

    .line 202
    :cond_8
    new-instance p0, Landroid/content/pm/PackageManager$NameNotFoundException;

    .line 203
    .line 204
    new-instance p1, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-direct {p0, p1}, Landroid/content/pm/PackageManager$NameNotFoundException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 220
    :goto_5
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 221
    .line 222
    .line 223
    throw p0
.end method

.method public static c(Landroid/content/Context;LO8;Ljava/lang/String;)[LZ8;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "content"

    .line 6
    .line 7
    const-string v3, "FontProvider.query"

    .line 8
    .line 9
    invoke-static {v3}, Lu6;->e(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v4, Landroid/net/Uri$Builder;

    .line 18
    .line 19
    invoke-direct {v4}, Landroid/net/Uri$Builder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v4, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v4, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    new-instance v5, Landroid/net/Uri$Builder;

    .line 35
    .line 36
    invoke-direct {v5}, Landroid/net/Uri$Builder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "file"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 58
    .line 59
    const/16 v5, 0x18

    .line 60
    .line 61
    if-ge v2, v5, :cond_0

    .line 62
    .line 63
    new-instance v2, LL8;

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    invoke-direct {v2, v0, v4, v5}, LL8;-><init>(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    new-instance v2, LL8;

    .line 71
    .line 72
    const/4 v5, 0x1

    .line 73
    invoke-direct {v2, v0, v4, v5}, LL8;-><init>(Landroid/content/Context;Landroid/net/Uri;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 74
    .line 75
    .line 76
    :goto_0
    const/4 v5, 0x0

    .line 77
    :try_start_1
    const-string v6, "_id"

    .line 78
    .line 79
    const-string v7, "file_id"

    .line 80
    .line 81
    const-string v8, "font_ttc_index"

    .line 82
    .line 83
    const-string v9, "font_variation_settings"

    .line 84
    .line 85
    const-string v10, "font_weight"

    .line 86
    .line 87
    const-string v11, "font_italic"

    .line 88
    .line 89
    const-string v12, "result_code"

    .line 90
    .line 91
    filled-new-array/range {v6 .. v12}, [Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v6, "ContentQueryWrapper.query"

    .line 96
    .line 97
    invoke-static {v6}, Lu6;->e(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .line 99
    .line 100
    move-object/from16 v6, p1

    .line 101
    .line 102
    :try_start_2
    iget-object v6, v6, LO8;->c:Ljava/lang/String;

    .line 103
    .line 104
    filled-new-array {v6}, [Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-virtual {v2, v4, v0, v6}, LL8;->b(Landroid/net/Uri;[Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 109
    .line 110
    .line 111
    move-result-object v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 112
    :try_start_3
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 113
    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    if-eqz v5, :cond_7

    .line 117
    .line 118
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    if-lez v6, :cond_7

    .line 123
    .line 124
    const-string v3, "result_code"

    .line 125
    .line 126
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    new-instance v6, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v7, "_id"

    .line 136
    .line 137
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v7

    .line 141
    const-string v8, "file_id"

    .line 142
    .line 143
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    const-string v9, "font_ttc_index"

    .line 148
    .line 149
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    const-string v10, "font_weight"

    .line 154
    .line 155
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v10

    .line 159
    const-string v11, "font_italic"

    .line 160
    .line 161
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v11

    .line 165
    :goto_1
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 166
    .line 167
    .line 168
    move-result v12

    .line 169
    if-eqz v12, :cond_6

    .line 170
    .line 171
    const/4 v12, -0x1

    .line 172
    if-eq v3, v12, :cond_1

    .line 173
    .line 174
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 175
    .line 176
    .line 177
    move-result v13

    .line 178
    move/from16 v19, v13

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :catchall_0
    move-exception v0

    .line 182
    goto/16 :goto_a

    .line 183
    .line 184
    :cond_1
    move/from16 v19, v0

    .line 185
    .line 186
    :goto_2
    if-eq v9, v12, :cond_2

    .line 187
    .line 188
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 189
    .line 190
    .line 191
    move-result v13

    .line 192
    move/from16 v16, v13

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_2
    move/from16 v16, v0

    .line 196
    .line 197
    :goto_3
    if-ne v8, v12, :cond_3

    .line 198
    .line 199
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 200
    .line 201
    .line 202
    move-result-wide v13

    .line 203
    invoke-static {v4, v13, v14}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    .line 204
    .line 205
    .line 206
    move-result-object v13

    .line 207
    :goto_4
    move-object v15, v13

    .line 208
    goto :goto_5

    .line 209
    :cond_3
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 210
    .line 211
    .line 212
    move-result-wide v13

    .line 213
    invoke-static {v1, v13, v14}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    .line 214
    .line 215
    .line 216
    move-result-object v13

    .line 217
    goto :goto_4

    .line 218
    :goto_5
    if-eq v10, v12, :cond_4

    .line 219
    .line 220
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 221
    .line 222
    .line 223
    move-result v13

    .line 224
    :goto_6
    move/from16 v17, v13

    .line 225
    .line 226
    goto :goto_7

    .line 227
    :cond_4
    const/16 v13, 0x190

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :goto_7
    if-eq v11, v12, :cond_5

    .line 231
    .line 232
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 233
    .line 234
    .line 235
    move-result v12

    .line 236
    const/4 v13, 0x1

    .line 237
    if-ne v12, v13, :cond_5

    .line 238
    .line 239
    move/from16 v18, v13

    .line 240
    .line 241
    goto :goto_8

    .line 242
    :cond_5
    move/from16 v18, v0

    .line 243
    .line 244
    :goto_8
    new-instance v12, LZ8;

    .line 245
    .line 246
    move-object v14, v12

    .line 247
    invoke-direct/range {v14 .. v19}, LZ8;-><init>(Landroid/net/Uri;IIZI)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 251
    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_6
    move-object v3, v6

    .line 255
    :cond_7
    if-eqz v5, :cond_8

    .line 256
    .line 257
    :try_start_4
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 258
    .line 259
    .line 260
    goto :goto_9

    .line 261
    :catchall_1
    move-exception v0

    .line 262
    goto :goto_b

    .line 263
    :cond_8
    :goto_9
    invoke-virtual {v2}, LL8;->a()V

    .line 264
    .line 265
    .line 266
    new-array v0, v0, [LZ8;

    .line 267
    .line 268
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, [LZ8;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 273
    .line 274
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 275
    .line 276
    .line 277
    return-object v0

    .line 278
    :catchall_2
    move-exception v0

    .line 279
    :try_start_5
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 280
    .line 281
    .line 282
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 283
    :goto_a
    if-eqz v5, :cond_9

    .line 284
    .line 285
    :try_start_6
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 286
    .line 287
    .line 288
    :cond_9
    invoke-virtual {v2}, LL8;->a()V

    .line 289
    .line 290
    .line 291
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 292
    :goto_b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 293
    .line 294
    .line 295
    throw v0
.end method
