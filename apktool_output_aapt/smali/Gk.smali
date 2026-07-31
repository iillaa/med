.class public LGk;
.super LFk;
.source "SourceFile"


# instance fields
.field public n:Lgc;

.field public o:Lgc;

.field public p:Lgc;


# direct methods
.method public constructor <init>(LLk;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LFk;-><init>(LLk;Landroid/view/WindowInsets;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, LGk;->n:Lgc;

    .line 6
    .line 7
    iput-object p1, p0, LGk;->o:Lgc;

    .line 8
    .line 9
    iput-object p1, p0, LGk;->p:Lgc;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public g()Lgc;
    .locals 1

    .line 1
    iget-object v0, p0, LGk;->o:Lgc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LA;->m(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lgc;->c(Landroid/graphics/Insets;)Lgc;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LGk;->o:Lgc;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LGk;->o:Lgc;

    .line 18
    .line 19
    return-object v0
.end method

.method public i()Lgc;
    .locals 1

    .line 1
    iget-object v0, p0, LGk;->n:Lgc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LA;->q(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lgc;->c(Landroid/graphics/Insets;)Lgc;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LGk;->n:Lgc;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LGk;->n:Lgc;

    .line 18
    .line 19
    return-object v0
.end method

.method public k()Lgc;
    .locals 1

    .line 1
    iget-object v0, p0, LGk;->p:Lgc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LA;->b(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lgc;->c(Landroid/graphics/Insets;)Lgc;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LGk;->p:Lgc;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LGk;->p:Lgc;

    .line 18
    .line 19
    return-object v0
.end method

.method public l(IIII)LLk;
    .locals 1

    .line 1
    iget-object v0, p0, LDk;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3, p4}, LA;->g(Landroid/view/WindowInsets;IIII)Landroid/view/WindowInsets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p2, p1}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    return-object p1
.end method

.method public r(Lgc;)V
    .locals 0

    .line 1
    return-void
.end method
