.class public final Le8;
.super LKc;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public final synthetic d:LN9;


# direct methods
.method public constructor <init>(LN9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Le8;->d:LN9;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1}, LKc;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ljava/io/File;

    .line 2
    .line 3
    check-cast p2, Ljava/io/IOException;

    .line 4
    .line 5
    const-string v0, "f"

    .line 6
    .line 7
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "e"

    .line 11
    .line 12
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Le8;->d:LN9;

    .line 16
    .line 17
    invoke-interface {v0, p1, p2}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    sget-object v0, LXe;->c:LXe;

    .line 22
    .line 23
    if-eq p2, v0, :cond_0

    .line 24
    .line 25
    sget-object p1, Lfj;->a:Lfj;

    .line 26
    .line 27
    return-object p1

    .line 28
    :cond_0
    new-instance p2, Lhi;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-direct {p2, p1, v0, v0}, LU7;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p2
.end method
