.class public LAk;
.super LCk;
.source "SourceFile"


# instance fields
.field public final c:Landroid/view/WindowInsets$Builder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, LCk;-><init>()V

    invoke-static {}, LA;->d()Landroid/view/WindowInsets$Builder;

    move-result-object v0

    iput-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public constructor <init>(LLk;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, LCk;-><init>(LLk;)V

    invoke-virtual {p1}, LLk;->f()Landroid/view/WindowInsets;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p1}, LA;->e(Landroid/view/WindowInsets;)Landroid/view/WindowInsets$Builder;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, LA;->d()Landroid/view/WindowInsets$Builder;

    move-result-object p1

    :goto_0
    iput-object p1, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    return-void
.end method


# virtual methods
.method public b()LLk;
    .locals 3

    .line 1
    invoke-virtual {p0}, LCk;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 5
    .line 6
    invoke-static {v0}, LA;->f(Landroid/view/WindowInsets$Builder;)Landroid/view/WindowInsets;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v1, v0}, LLk;->g(Landroid/view/View;Landroid/view/WindowInsets;)LLk;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, LCk;->b:[Lgc;

    .line 16
    .line 17
    iget-object v2, v0, LLk;->a:LIk;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, LIk;->p([Lgc;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public d(Lgc;)V
    .locals 1

    .line 1
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lgc;->d()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LA;->v(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e(Lgc;)V
    .locals 1

    .line 1
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lgc;->d()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LA;->o(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Lgc;)V
    .locals 1

    .line 1
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lgc;->d()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LA;->s(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g(Lgc;)V
    .locals 1

    .line 1
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lgc;->d()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LA;->j(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h(Lgc;)V
    .locals 1

    .line 1
    iget-object v0, p0, LAk;->c:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lgc;->d()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LA;->w(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
