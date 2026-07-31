.class public final Lsb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lsb;->h:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lsb;->i:Ljava/lang/String;

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
    invoke-virtual {p0, p2, p1}, Lsb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lsb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lsb;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lsb;

    .line 2
    .line 3
    iget-object v1, p0, Lsb;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lsb;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lsb;-><init>(Ljava/lang/String;Ljava/lang/String;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lsb;->g:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lsb;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, Lh6;

    .line 7
    .line 8
    iget-object p1, p0, Lsb;->h:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p0, Lsb;->i:Ljava/lang/String;

    .line 11
    .line 12
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/io/File;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_5

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v3, 0x0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    new-instance p1, Lab;

    .line 61
    .line 62
    invoke-direct {p1}, Lab;-><init>()V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :catchall_0
    move-exception p1

    .line 67
    goto :goto_2

    .line 68
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 69
    invoke-static {v1, v2, p1}, Ld8;->O(Ljava/io/File;Ljava/io/File;Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    new-instance p1, Lkb;

    .line 80
    .line 81
    invoke-direct {p1, v3}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    throw p1

    .line 85
    :cond_3
    new-instance p1, LZa;

    .line 86
    .line 87
    invoke-direct {p1}, LZa;-><init>()V

    .line 88
    .line 89
    .line 90
    throw p1

    .line 91
    :cond_4
    new-instance v0, Lgb;

    .line 92
    .line 93
    invoke-direct {v0, p1, v3}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    throw v0

    .line 97
    :cond_5
    :goto_1
    sget-object p1, Lfj;->a:Lfj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :goto_2
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    :goto_3
    new-instance v0, Lpg;

    .line 105
    .line 106
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-object v0
.end method
