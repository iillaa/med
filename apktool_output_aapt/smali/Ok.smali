.class public final LOk;
.super LMk;
.source "SourceFile"


# virtual methods
.method public final x()Z
    .locals 1

    .line 1
    iget-object v0, p0, LMk;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/WindowInsetsController;

    .line 4
    .line 5
    invoke-static {v0}, LJk;->b(Landroid/view/WindowInsetsController;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    and-int/lit8 v0, v0, 0x8

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    return v0
.end method
