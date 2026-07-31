.class public final Lza;
.super Ls5;
.source "SourceFile"


# instance fields
.field public f:LHa;

.field public g:LJa;

.field public synthetic h:Ljava/lang/Object;

.field public final synthetic i:LHa;

.field public j:I


# direct methods
.method public constructor <init>(LHa;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lza;->i:LHa;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ls5;-><init>(Lr5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lza;->h:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lza;->j:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lza;->j:I

    .line 9
    .line 10
    iget-object p1, p0, Lza;->i:LHa;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, v0, p0}, LHa;->c(Llc;LJa;Lr5;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Li6;->c:Li6;

    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    new-instance v0, Lpg;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Lpg;-><init>(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
