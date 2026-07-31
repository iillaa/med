.class public abstract Lg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LW5;


# instance fields
.field public final c:LX5;


# direct methods
.method public constructor <init>(LX5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg;->c:LX5;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(LX5;)LW5;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LSi;->r(LW5;LX5;)LW5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final getKey()LX5;
    .locals 1

    .line 1
    iget-object v0, p0, Lg;->c:LX5;

    .line 2
    .line 3
    return-object v0
.end method

.method public i(LX5;)LY5;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LSi;->y(LW5;LX5;)LY5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final j(Ljava/lang/Object;LN9;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p2, p1, p0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final k(LY5;)LY5;
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LE7;->c:LE7;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    move-object p1, p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, LC4;->f:LC4;

    .line 13
    .line 14
    invoke-interface {p1, p0, v0}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, LY5;

    .line 19
    .line 20
    :goto_0
    return-object p1
.end method
