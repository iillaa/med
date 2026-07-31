.class public final Lh7;
.super Lu6;
.source "SourceFile"


# instance fields
.field public final synthetic E:Li7;


# direct methods
.method public constructor <init>(Li7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lh7;->E:Li7;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final u(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lh7;->E:Li7;

    .line 2
    .line 3
    iget-object v0, v0, Li7;->a:Ln7;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ln7;->d(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final v(LN6;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lh7;->E:Li7;

    .line 2
    .line 3
    iput-object p1, v0, Li7;->c:LN6;

    .line 4
    .line 5
    new-instance p1, LN2;

    .line 6
    .line 7
    iget-object v1, v0, Li7;->c:LN6;

    .line 8
    .line 9
    new-instance v2, Lt5;

    .line 10
    .line 11
    const/16 v3, 0xb

    .line 12
    .line 13
    invoke-direct {v2, v3}, Lt5;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Li7;->a:Ln7;

    .line 17
    .line 18
    iget-object v3, v3, Ln7;->h:LA6;

    .line 19
    .line 20
    invoke-direct {p1, v1, v2, v3}, LN2;-><init>(LN6;Lt5;Lj7;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, v0, Li7;->b:LN2;

    .line 24
    .line 25
    iget-object p1, v0, Li7;->a:Ln7;

    .line 26
    .line 27
    invoke-virtual {p1}, Ln7;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
