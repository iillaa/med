.class public final Lwb;
.super LSh;
.source "SourceFile"

# interfaces
.implements LN9;


# instance fields
.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lwb;->g:Ljava/lang/String;

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
    invoke-virtual {p0, p2, p1}, Lwb;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lwb;

    .line 10
    .line 11
    sget-object p2, Lfj;->a:Lfj;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lwb;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final i(Lr5;Ljava/lang/Object;)Lr5;
    .locals 1

    .line 1
    new-instance p2, Lwb;

    .line 2
    .line 3
    iget-object v0, p0, Lwb;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p2, v0, p1}, Lwb;-><init>(Ljava/lang/String;Lr5;)V

    .line 6
    .line 7
    .line 8
    return-object p2
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, LJa;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, v0}, LJa;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lwb;->g:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, LSi;->n(Ljava/lang/String;LJa;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Lpg;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
