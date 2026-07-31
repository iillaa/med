.class public final Lta;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Li0;

.field public final synthetic i:Landroid/net/Uri;

.field public final synthetic j:LJb;


# direct methods
.method public constructor <init>(Li0;Landroid/net/Uri;LJb;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lta;->h:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lta;->i:Landroid/net/Uri;

    .line 4
    .line 5
    iput-object p3, p0, Lta;->j:LJb;

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
    invoke-virtual {p0, p2, p1}, Lta;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lta;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lta;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lta;

    .line 2
    .line 3
    iget-object v1, p0, Lta;->i:Landroid/net/Uri;

    .line 4
    .line 5
    iget-object v2, p0, Lta;->j:LJb;

    .line 6
    .line 7
    iget-object v3, p0, Lta;->h:Li0;

    .line 8
    .line 9
    invoke-direct {v0, v3, v1, v2, p1}, Lta;-><init>(Li0;Landroid/net/Uri;LJb;Lr5;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, v0, Lta;->g:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lta;->i:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lta;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Lh6;

    .line 9
    .line 10
    iget-object p1, p0, Lta;->h:Li0;

    .line 11
    .line 12
    iget-object v1, p0, Lta;->j:LJb;

    .line 13
    .line 14
    :try_start_0
    iget-object v2, p1, Li0;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Landroid/content/ContentResolver;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 19
    .line 20
    .line 21
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    const/4 v3, 0x0

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    :try_start_1
    invoke-static {v2, v1}, Lu6;->x(Ljava/io/InputStream;LJb;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    :try_start_2
    invoke-static {v2, v3}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :catchall_0
    move-exception v1

    .line 34
    goto :goto_0

    .line 35
    :catchall_1
    move-exception v1

    .line 36
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 37
    :catchall_2
    move-exception v3

    .line 38
    :try_start_4
    invoke-static {v2, v1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    throw v3

    .line 42
    :cond_0
    new-instance v1, Lkb;

    .line 43
    .line 44
    invoke-direct {v1, v3}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 48
    :goto_0
    invoke-static {v1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :goto_1
    invoke-static {p1, v1, v0}, Li0;->y(Li0;Ljava/lang/Object;Landroid/net/Uri;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Lpg;

    .line 57
    .line 58
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method
