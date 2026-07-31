.class public final Lva;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public g:I

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:Li0;

.field public final synthetic j:Landroid/net/Uri;

.field public final synthetic k:LIb;


# direct methods
.method public constructor <init>(Li0;Landroid/net/Uri;LIb;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lva;->i:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lva;->j:Landroid/net/Uri;

    .line 4
    .line 5
    iput-object p3, p0, Lva;->k:LIb;

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
    invoke-virtual {p0, p2, p1}, Lva;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lva;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lva;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lva;

    .line 2
    .line 3
    iget-object v1, p0, Lva;->j:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object v2, p0, Lva;->k:LIb;

    .line 6
    .line 7
    iget-object v3, p0, Lva;->i:Li0;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lva;-><init>(Li0;Landroid/net/Uri;LIb;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lva;->h:Ljava/lang/Object;

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
    iget v1, p0, Lva;->g:I

    .line 4
    .line 5
    sget-object v2, Lfj;->a:Lfj;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    if-ne v1, v4, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lva;->h:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/io/Closeable;

    .line 16
    .line 17
    :try_start_0
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p1

    .line 31
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lva;->h:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Lz8;

    .line 37
    .line 38
    iget-object v1, p0, Lva;->i:Li0;

    .line 39
    .line 40
    iget-object v1, v1, Li0;->d:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v1, Landroid/content/ContentResolver;

    .line 43
    .line 44
    iget-object v5, p0, Lva;->j:Landroid/net/Uri;

    .line 45
    .line 46
    invoke-virtual {v1, v5}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    iget-object v5, p0, Lva;->k:LIb;

    .line 53
    .line 54
    :try_start_1
    new-instance v6, Lua;

    .line 55
    .line 56
    invoke-direct {v6, p1, v3}, Lua;-><init>(Lz8;Lr5;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lva;->h:Ljava/lang/Object;

    .line 60
    .line 61
    iput v4, p0, Lva;->g:I

    .line 62
    .line 63
    const/16 p1, 0x2000

    .line 64
    .line 65
    invoke-static {v1, v5, p1, v6, p0}, Lu6;->w(Ljava/io/InputStream;LIb;ILN9;Lr5;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 69
    if-ne p1, v0, :cond_2

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_2
    move-object v0, v1

    .line 73
    :goto_0
    invoke-static {v0, v3}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    move-object p1, v2

    .line 77
    goto :goto_2

    .line 78
    :catchall_1
    move-exception p1

    .line 79
    move-object v0, v1

    .line 80
    :goto_1
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 81
    :catchall_2
    move-exception v1

    .line 82
    invoke-static {v0, p1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    throw v1

    .line 86
    :cond_3
    move-object p1, v3

    .line 87
    :goto_2
    if-eqz p1, :cond_4

    .line 88
    .line 89
    return-object v2

    .line 90
    :cond_4
    new-instance p1, Lkb;

    .line 91
    .line 92
    invoke-direct {p1, v3}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    throw p1
.end method
