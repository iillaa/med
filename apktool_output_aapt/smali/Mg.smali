.class public LMg;
.super Lf;
.source "SourceFile"

# interfaces
.implements Lj6;


# instance fields
.field public final f:Lr5;


# direct methods
.method public constructor <init>(Lr5;LY5;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p2, v0}, Lf;-><init>(LY5;Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, LMg;->f:Lr5;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final B()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public final e()Lj6;
    .locals 2

    .line 1
    iget-object v0, p0, LMg;->f:Lr5;

    .line 2
    .line 3
    instance-of v1, v0, Lj6;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lj6;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    return-object v0
.end method

.method public l(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LMg;->f:Lr5;

    .line 2
    .line 3
    invoke-static {v0}, LMk;->w(Lr5;)Lr5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Llc;->F(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Llc;->G(Lr5;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public m(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LMg;->f:Lr5;

    .line 2
    .line 3
    invoke-static {p1}, Llc;->F(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {v0, p1}, Lr5;->h(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
