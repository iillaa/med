.class public final Lyb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lyb;->h:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, LSh;-><init>(ILr5;)V

    .line 5
    .line 6
    .line 7
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
    invoke-virtual {p0, p2, p1}, Lyb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lyb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lyb;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 2

    .line 1
    new-instance v0, Lyb;

    .line 2
    .line 3
    iget-object v1, p0, Lyb;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Lyb;-><init>(Ljava/lang/String;Lr5;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, Lyb;->g:Ljava/lang/Object;

    .line 9
    .line 10
    return-object v0
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lyb;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, Lh6;

    .line 7
    .line 8
    iget-object p1, p0, Lyb;->h:Ljava/lang/String;

    .line 9
    .line 10
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, LSi;->s(Ljava/io/File;)LHb;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance v0, Lgb;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-direct {v0, p1, v1}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :goto_0
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_1
    new-instance v0, Lpg;

    .line 40
    .line 41
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method
