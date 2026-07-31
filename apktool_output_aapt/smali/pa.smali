.class public final Lpa;
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
    iput-object p1, p0, Lpa;->h:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lpa;->i:Landroid/net/Uri;

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
    invoke-virtual {p0, p2, p1}, Lpa;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lpa;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lpa;->k(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lpa;

    .line 2
    .line 3
    iget-object v1, p0, Lpa;->h:Li0;

    .line 4
    .line 5
    iget-object v2, p0, Lpa;->i:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lpa;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lpa;->g:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lpa;->i:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lpa;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Lh6;

    .line 9
    .line 10
    iget-object p1, p0, Lpa;->h:Li0;

    .line 11
    .line 12
    :try_start_0
    iget-object v1, p1, Li0;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Landroid/content/ContentResolver;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, v0, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-lez v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Lfj;->a:Lfj;

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :catchall_0
    move-exception v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v1, Lkb;

    .line 29
    .line 30
    invoke-direct {v1, v2}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :goto_0
    invoke-static {v1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    :goto_1
    invoke-static {p1, v1, v0}, Li0;->y(Li0;Ljava/lang/Object;Landroid/net/Uri;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Lpg;

    .line 43
    .line 44
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method
