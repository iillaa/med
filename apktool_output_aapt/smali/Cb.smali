.class public final LCb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:LIb;

.field public final synthetic k:I


# direct methods
.method public constructor <init>(Ljava/lang/String;LIb;ILr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, LCb;->i:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, LCb;->j:LIb;

    .line 4
    .line 5
    iput p3, p0, LCb;->k:I

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
    invoke-virtual {p0, p2, p1}, LCb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LCb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LCb;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, LCb;

    .line 2
    .line 3
    iget-object v1, p0, LCb;->j:LIb;

    .line 4
    .line 5
    iget v2, p0, LCb;->k:I

    .line 6
    .line 7
    iget-object v3, p0, LCb;->i:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, LCb;-><init>(Ljava/lang/String;LIb;ILr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, LCb;->h:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    sget-object v0, Li6;->c:Li6;

    .line 2
    .line 3
    iget v1, p0, LCb;->g:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    if-ne v1, v3, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, LCb;->h:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/io/Closeable;

    .line 14
    .line 15
    :try_start_0
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 24
    .line 25
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p1

    .line 29
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, LCb;->h:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Lz8;

    .line 35
    .line 36
    new-instance v1, Ljava/io/File;

    .line 37
    .line 38
    iget-object v4, p0, LCb;->i:Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eqz v5, :cond_3

    .line 48
    .line 49
    new-instance v4, Ljava/io/FileInputStream;

    .line 50
    .line 51
    invoke-direct {v4, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, LCb;->j:LIb;

    .line 55
    .line 56
    iget v5, p0, LCb;->k:I

    .line 57
    .line 58
    :try_start_1
    new-instance v6, LBb;

    .line 59
    .line 60
    invoke-direct {v6, p1, v2}, LBb;-><init>(Lz8;Lr5;)V

    .line 61
    .line 62
    .line 63
    iput-object v4, p0, LCb;->h:Ljava/lang/Object;

    .line 64
    .line 65
    iput v3, p0, LCb;->g:I

    .line 66
    .line 67
    invoke-static {v4, v1, v5, v6, p0}, Lu6;->w(Ljava/io/InputStream;LIb;ILN9;Lr5;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    if-ne p1, v0, :cond_2

    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_2
    move-object v0, v4

    .line 75
    :goto_0
    invoke-static {v0, v2}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    sget-object p1, Lfj;->a:Lfj;

    .line 79
    .line 80
    return-object p1

    .line 81
    :catchall_1
    move-exception p1

    .line 82
    move-object v0, v4

    .line 83
    :goto_1
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 84
    :catchall_2
    move-exception v1

    .line 85
    invoke-static {v0, p1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    throw v1

    .line 89
    :cond_3
    new-instance p1, Lgb;

    .line 90
    .line 91
    invoke-direct {p1, v4, v2}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    throw p1
.end method
