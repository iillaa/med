.class public abstract Lc6;
.super Lg;
.source "SourceFile"

# interfaces
.implements Lu5;


# static fields
.field public static final d:Lb6;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lb6;

    .line 2
    .line 3
    sget-object v1, Lt5;->d:Lt5;

    .line 4
    .line 5
    new-instance v2, La6;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lb6;-><init>(LX5;LJ9;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lc6;->d:Lb6;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lt5;->d:Lt5;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lg;-><init>(LX5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(LX5;)LW5;
    .locals 3

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    instance-of v1, p1, Lb6;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    check-cast p1, Lb6;

    .line 12
    .line 13
    iget-object v1, p0, Lg;->c:LX5;

    .line 14
    .line 15
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    if-eq v1, p1, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Lb6;->d:LX5;

    .line 21
    .line 22
    if-ne v0, v1, :cond_2

    .line 23
    .line 24
    :cond_0
    iget-object p1, p1, Lb6;->c:LJ9;

    .line 25
    .line 26
    invoke-interface {p1, p0}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, LW5;

    .line 31
    .line 32
    instance-of v0, p1, LW5;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    move-object v2, p1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object v0, Lt5;->d:Lt5;

    .line 39
    .line 40
    if-ne v0, p1, :cond_2

    .line 41
    .line 42
    move-object v2, p0

    .line 43
    :cond_2
    :goto_0
    return-object v2
.end method

.method public abstract d(LY5;Ljava/lang/Runnable;)V
.end method

.method public e(LY5;)Z
    .locals 0

    .line 1
    instance-of p1, p0, Laj;

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    return p1
.end method

.method public f(Ljava/lang/String;I)Lc6;
    .locals 1

    .line 1
    invoke-static {p2}, LMk;->e(I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lbd;

    .line 5
    .line 6
    invoke-direct {v0, p0, p2, p1}, Lbd;-><init>(Lc6;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public final i(LX5;)LY5;
    .locals 3

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    instance-of v1, p1, Lb6;

    .line 7
    .line 8
    sget-object v2, LE7;->c:LE7;

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    check-cast p1, Lb6;

    .line 13
    .line 14
    iget-object v1, p0, Lg;->c:LX5;

    .line 15
    .line 16
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    if-eq v1, p1, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lb6;->d:LX5;

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object p1, p1, Lb6;->c:LJ9;

    .line 26
    .line 27
    invoke-interface {p1, p0}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, LW5;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v2, p0

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    sget-object v0, Lt5;->d:Lt5;

    .line 39
    .line 40
    if-ne v0, p1, :cond_1

    .line 41
    .line 42
    :goto_0
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const/16 v1, 0x40

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lu6;->m(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    return-object v0
.end method
