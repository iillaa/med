.class public final Lrh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr5;
.implements Lj6;


# instance fields
.field public final c:Lr5;

.field public final d:LY5;


# direct methods
.method public constructor <init>(Lr5;LY5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrh;->c:Lr5;

    .line 5
    .line 6
    iput-object p2, p0, Lrh;->d:LY5;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final e()Lj6;
    .locals 2

    .line 1
    iget-object v0, p0, Lrh;->c:Lr5;

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

.method public final getContext()LY5;
    .locals 1

    .line 1
    iget-object v0, p0, Lrh;->d:LY5;

    .line 2
    .line 3
    return-object v0
.end method

.method public final h(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrh;->c:Lr5;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lr5;->h(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
