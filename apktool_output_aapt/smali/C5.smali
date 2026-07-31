.class public final LC5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lqf;

.field public b:Lye;

.field public volatile c:I


# virtual methods
.method public final a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, LC5;->b(I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    return-object p1

    .line 9
    :cond_0
    if-nez p5, :cond_1

    .line 10
    .line 11
    const-string p1, "@Null arguments."

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_1
    iget-object p1, p0, LC5;->b:Lye;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p1, v0}, Lye;->g(Z)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, LC5;->a:Lqf;

    .line 25
    .line 26
    invoke-virtual {v1, p2, p3, p4, p5}, Lqf;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lye;->d(Z)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    invoke-virtual {p1, v0}, Lye;->g(Z)V

    .line 34
    .line 35
    .line 36
    return-object p2

    .line 37
    :catchall_0
    move-exception p2

    .line 38
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    const-string p2, ""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lye;->g(Z)V

    .line 44
    .line 45
    .line 46
    return-object p2

    .line 47
    :catchall_1
    move-exception p2

    .line 48
    invoke-virtual {p1, v0}, Lye;->g(Z)V

    .line 49
    .line 50
    .line 51
    throw p2
.end method

.method public final b(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, LC5;->b:Lye;

    .line 2
    .line 3
    iget-object v0, v0, Lye;->d:Lve;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, LC5;->c:I

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, LC5;->c:I

    .line 12
    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    return p1

    .line 17
    :cond_0
    const-string p1, "CordovaBridge"

    .line 18
    .line 19
    const-string v0, "Bridge access attempt with wrong secret token, possibly from malicious code. Disabling exec() bridge!"

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    const/4 p1, -0x1

    .line 25
    iput p1, p0, LC5;->c:I

    .line 26
    .line 27
    new-instance p1, Ljava/lang/IllegalAccessException;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/lang/IllegalAccessException;-><init>()V

    .line 30
    .line 31
    .line 32
    throw p1

    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    return p1
.end method
