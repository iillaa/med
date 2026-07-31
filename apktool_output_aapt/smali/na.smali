.class public final Lna;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Li0;

.field public final synthetic i:Landroid/net/Uri;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Li0;Landroid/net/Uri;Ljava/lang/String;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lna;->h:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lna;->i:Landroid/net/Uri;

    .line 4
    .line 5
    iput-object p3, p0, Lna;->j:Ljava/lang/String;

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
    invoke-virtual {p0, p2, p1}, Lna;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lna;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lna;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lna;

    .line 2
    .line 3
    iget-object v1, p0, Lna;->i:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object v2, p0, Lna;->j:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lna;->h:Li0;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lna;-><init>(Li0;Landroid/net/Uri;Ljava/lang/String;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lna;->g:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Lna;->i:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lna;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Lh6;

    .line 9
    .line 10
    iget-object p1, p0, Lna;->h:Li0;

    .line 11
    .line 12
    iget-object v1, p0, Lna;->j:Ljava/lang/String;

    .line 13
    .line 14
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 15
    .line 16
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_5

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v1, Lab;

    .line 39
    .line 40
    invoke-direct {v1}, Lab;-><init>()V

    .line 41
    .line 42
    .line 43
    throw v1

    .line 44
    :catchall_0
    move-exception v1

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    :goto_0
    iget-object v1, p1, Li0;->d:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v1, Landroid/content/ContentResolver;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 51
    .line 52
    .line 53
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    sget-object v3, Lfj;->a:Lfj;

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    .line 60
    .line 61
    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 62
    .line 63
    .line 64
    const/16 v2, 0x2000

    .line 65
    .line 66
    :try_start_2
    invoke-static {v1, v5, v2}, Lu6;->k(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    .line 67
    .line 68
    .line 69
    move-result-wide v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 70
    const-wide/16 v8, 0x0

    .line 71
    .line 72
    cmp-long v2, v6, v8

    .line 73
    .line 74
    if-lez v2, :cond_2

    .line 75
    .line 76
    :try_start_3
    invoke-static {v5, v4}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 77
    .line 78
    .line 79
    :try_start_4
    invoke-static {v1, v4}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 80
    .line 81
    .line 82
    move-object v1, v3

    .line 83
    goto :goto_2

    .line 84
    :catchall_1
    move-exception v2

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    :try_start_5
    new-instance v2, Lkb;

    .line 87
    .line 88
    invoke-direct {v2, v4}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 92
    :catchall_2
    move-exception v2

    .line 93
    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 94
    :catchall_3
    move-exception v3

    .line 95
    :try_start_7
    invoke-static {v5, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 99
    :goto_1
    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 100
    :catchall_4
    move-exception v3

    .line 101
    :try_start_9
    invoke-static {v1, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    throw v3

    .line 105
    :cond_3
    move-object v1, v4

    .line 106
    :goto_2
    if-eqz v1, :cond_4

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_4
    new-instance v1, Lkb;

    .line 110
    .line 111
    invoke-direct {v1, v4}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    throw v1

    .line 115
    :cond_5
    new-instance v1, LZa;

    .line 116
    .line 117
    invoke-direct {v1}, LZa;-><init>()V

    .line 118
    .line 119
    .line 120
    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 121
    :goto_3
    invoke-static {v1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    :goto_4
    invoke-static {p1, v3, v0}, Li0;->y(Li0;Ljava/lang/Object;Landroid/net/Uri;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    new-instance v0, Lpg;

    .line 130
    .line 131
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    return-object v0
.end method
