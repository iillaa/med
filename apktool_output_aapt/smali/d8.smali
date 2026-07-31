.class public abstract Ld8;
.super Lr3;
.source "SourceFile"


# direct methods
.method public static N(Ljava/io/File;Ljava/io/File;)Z
    .locals 10

    .line 1
    sget-object v0, LC4;->g:LC4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "The source file doesn\'t exist."

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_6

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    sget-object v4, Lc8;->c:Lc8;

    .line 14
    .line 15
    new-instance v5, Le8;

    .line 16
    .line 17
    invoke-direct {v5, v0}, Le8;-><init>(LN9;)V

    .line 18
    .line 19
    .line 20
    new-instance v6, Lb8;

    .line 21
    .line 22
    const v7, 0x7fffffff

    .line 23
    .line 24
    .line 25
    invoke-direct {v6, p0, v4, v5, v7}, Lb8;-><init>(Ljava/io/File;Lc8;Le8;I)V

    .line 26
    .line 27
    .line 28
    new-instance v4, LZ7;

    .line 29
    .line 30
    invoke-direct {v4, v6}, LZ7;-><init>(Lb8;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-virtual {v4}, LZ7;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_5

    .line 38
    .line 39
    invoke-virtual {v4}, LZ7;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    check-cast v5, Ljava/io/File;

    .line 44
    .line 45
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_4

    .line 50
    .line 51
    invoke-static {v5, p0}, Ld8;->R(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    new-instance v7, Ljava/io/File;

    .line 56
    .line 57
    invoke-direct {v7, p1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    if-eqz v6, :cond_1

    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-eqz v6, :cond_0

    .line 71
    .line 72
    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_0

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    new-instance p0, Lu;

    .line 80
    .line 81
    const-string p1, "The destination file already exists."

    .line 82
    .line 83
    invoke-direct {p0, v5, v7, p1}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v7, p0}, LC4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    throw v3

    .line 90
    :cond_1
    :goto_1
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_2

    .line 95
    .line 96
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    invoke-static {v5, v7, v1}, Ld8;->O(Ljava/io/File;Ljava/io/File;Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v7}, Ljava/io/File;->length()J

    .line 104
    .line 105
    .line 106
    move-result-wide v6

    .line 107
    invoke-virtual {v5}, Ljava/io/File;->length()J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    cmp-long v6, v6, v8

    .line 112
    .line 113
    if-nez v6, :cond_3

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    new-instance p0, Ljava/io/IOException;

    .line 117
    .line 118
    const-string p1, "Source file wasn\'t copied completely, length of destination file differs."

    .line 119
    .line 120
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v5, p0}, LC4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    throw v3

    .line 127
    :cond_4
    new-instance p0, Lu;

    .line 128
    .line 129
    invoke-direct {p0, v5, v3, v2}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v5, p0}, LC4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    throw v3
    :try_end_0
    .catch Lhi; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    :cond_5
    const/4 v1, 0x1

    .line 137
    :catch_0
    return v1

    .line 138
    :cond_6
    new-instance p1, Lu;

    .line 139
    .line 140
    invoke-direct {p1, p0, v3, v2}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p0, p1}, LC4;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    throw v3
.end method

.method public static O(Ljava/io/File;Ljava/io/File;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_6

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance p2, Lu;

    .line 24
    .line 25
    const-string v0, "Tried to overwrite the destination, but failed to delete it."

    .line 26
    .line 27
    invoke-direct {p2, p0, p1, v0}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p2

    .line 31
    :cond_1
    new-instance p2, Lu;

    .line 32
    .line 33
    const-string v0, "The destination file already exists."

    .line 34
    .line 35
    invoke-direct {p2, p0, p1, v0}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p2

    .line 39
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_4

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    new-instance p2, LU7;

    .line 53
    .line 54
    const-string v0, "Failed to create target directory."

    .line 55
    .line 56
    invoke-direct {p2, p0, p1, v0}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p2

    .line 60
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    if-eqz p2, :cond_5

    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    .line 67
    .line 68
    .line 69
    :cond_5
    new-instance p2, Ljava/io/FileInputStream;

    .line 70
    .line 71
    invoke-direct {p2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 72
    .line 73
    .line 74
    :try_start_0
    new-instance p0, Ljava/io/FileOutputStream;

    .line 75
    .line 76
    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    .line 79
    const/16 p1, 0x2000

    .line 80
    .line 81
    :try_start_1
    invoke-static {p2, p0, p1}, Lu6;->k(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    .line 83
    .line 84
    :try_start_2
    invoke-static {p0, v1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .line 86
    .line 87
    invoke-static {p2, v1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    :goto_1
    return-void

    .line 91
    :catchall_0
    move-exception p0

    .line 92
    goto :goto_2

    .line 93
    :catchall_1
    move-exception p1

    .line 94
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 95
    :catchall_2
    move-exception v0

    .line 96
    :try_start_4
    invoke-static {p0, p1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 100
    :goto_2
    :try_start_5
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 101
    :catchall_3
    move-exception p1

    .line 102
    invoke-static {p2, p0}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :cond_6
    new-instance p1, Lu;

    .line 107
    .line 108
    const-string p2, "The source file doesn\'t exist."

    .line 109
    .line 110
    invoke-direct {p1, p0, v1, p2}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p1
.end method

.method public static P(Ljava/io/File;)Z
    .locals 4

    .line 1
    sget-object v0, Lc8;->d:Lc8;

    .line 2
    .line 3
    new-instance v1, Lb8;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const v3, 0x7fffffff

    .line 7
    .line 8
    .line 9
    invoke-direct {v1, p0, v0, v2, v3}, Lb8;-><init>(Ljava/io/File;Lc8;Le8;I)V

    .line 10
    .line 11
    .line 12
    new-instance p0, LZ7;

    .line 13
    .line 14
    invoke-direct {p0, v1}, LZ7;-><init>(Lb8;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    :goto_0
    move v1, v0

    .line 19
    :goto_1
    invoke-virtual {p0}, LZ7;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, LZ7;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/io/File;

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_1

    .line 42
    .line 43
    :cond_0
    if-eqz v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v1, 0x0

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    return v1
.end method

.method public static final Q(LS7;)LS7;
    .locals 6

    .line 1
    new-instance v0, LS7;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v2, p0, LS7;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/io/File;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string v5, "."

    .line 35
    .line 36
    invoke-static {v4, v5}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    const-string v5, ".."

    .line 43
    .line 44
    invoke-static {v4, v5}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_1

    .line 55
    .line 56
    invoke-static {v1}, Lt4;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Ljava/io/File;

    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-static {v4, v5}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    add-int/lit8 v3, v3, -0x1

    .line 77
    .line 78
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    iget-object p0, p0, LS7;->a:Ljava/io/File;

    .line 87
    .line 88
    invoke-direct {v0, p0, v1}, LS7;-><init>(Ljava/io/File;Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    return-object v0
.end method

.method public static final R(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 10

    .line 1
    invoke-static {p0}, Lr3;->H(Ljava/io/File;)LS7;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ld8;->Q(LS7;)LS7;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1}, Lr3;->H(Ljava/io/File;)LS7;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ld8;->Q(LS7;)LS7;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, v0, LS7;->a:Ljava/io/File;

    .line 18
    .line 19
    iget-object v3, v1, LS7;->a:Ljava/io/File;

    .line 20
    .line 21
    invoke-static {v2, v3}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_0
    iget-object v1, v1, LS7;->b:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v0, v0, LS7;->b:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    const/4 v6, 0x0

    .line 47
    :goto_0
    if-ge v6, v5, :cond_1

    .line 48
    .line 49
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    invoke-static {v7, v8}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    if-eqz v7, :cond_1

    .line 62
    .line 63
    add-int/lit8 v6, v6, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    add-int/lit8 v7, v2, -0x1

    .line 72
    .line 73
    if-gt v6, v7, :cond_4

    .line 74
    .line 75
    :goto_1
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    check-cast v8, Ljava/io/File;

    .line 80
    .line 81
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    const-string v9, ".."

    .line 86
    .line 87
    invoke-static {v8, v9}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_2

    .line 92
    .line 93
    goto/16 :goto_6

    .line 94
    .line 95
    :cond_2
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    if-eq v7, v6, :cond_3

    .line 99
    .line 100
    sget-char v8, Ljava/io/File;->separatorChar:C

    .line 101
    .line 102
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    :cond_3
    if-eq v7, v6, :cond_4

    .line 106
    .line 107
    add-int/lit8 v7, v7, -0x1

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_4
    if-ge v6, v4, :cond_c

    .line 111
    .line 112
    if-ge v6, v2, :cond_5

    .line 113
    .line 114
    sget-char v1, Ljava/io/File;->separatorChar:C

    .line 115
    .line 116
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    :cond_5
    if-ltz v6, :cond_b

    .line 120
    .line 121
    if-nez v6, :cond_6

    .line 122
    .line 123
    invoke-static {v0}, Lt4;->M(Ljava/lang/Iterable;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    goto :goto_4

    .line 128
    :cond_6
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    sub-int/2addr v1, v6

    .line 133
    if-gtz v1, :cond_7

    .line 134
    .line 135
    sget-object v0, LG7;->c:LG7;

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_7
    const/4 v2, 0x1

    .line 139
    if-ne v1, v2, :cond_8

    .line 140
    .line 141
    invoke-static {v0}, Lt4;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-static {v0}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    goto :goto_4

    .line 150
    :cond_8
    new-instance v2, Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    .line 154
    .line 155
    instance-of v1, v0, Ljava/util/RandomAccess;

    .line 156
    .line 157
    if-eqz v1, :cond_9

    .line 158
    .line 159
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    :goto_2
    if-ge v6, v1, :cond_a

    .line 164
    .line 165
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    add-int/lit8 v6, v6, 0x1

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_9
    invoke-interface {v0, v6}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_a

    .line 184
    .line 185
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_a
    move-object v0, v2

    .line 194
    :goto_4
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 195
    .line 196
    const-string v2, "separator"

    .line 197
    .line 198
    invoke-static {v2, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    invoke-static {v0, v5, v1}, Lt4;->J(Ljava/util/List;Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    goto :goto_5

    .line 205
    :cond_b
    new-instance p0, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string p1, "Requested element count "

    .line 208
    .line 209
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    const-string p1, " is less than zero."

    .line 216
    .line 217
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 225
    .line 226
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    throw p1

    .line 234
    :cond_c
    :goto_5
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    :goto_6
    if-eqz v3, :cond_d

    .line 239
    .line 240
    return-object v3

    .line 241
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 242
    .line 243
    new-instance v1, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    const-string v2, "this and base files have different roots: "

    .line 246
    .line 247
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string p0, " and "

    .line 254
    .line 255
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    const/16 p0, 0x2e

    .line 262
    .line 263
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    throw v0
.end method
