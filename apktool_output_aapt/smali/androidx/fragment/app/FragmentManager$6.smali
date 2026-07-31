.class Landroidx/fragment/app/FragmentManager$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# virtual methods
.method public final d(LYc;LRc;)V
    .locals 1

    .line 1
    sget-object p1, LRc;->ON_START:LRc;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eq p2, p1, :cond_1

    .line 5
    .line 6
    sget-object p1, LRc;->ON_DESTROY:LRc;

    .line 7
    .line 8
    if-eq p2, p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw v0

    .line 12
    :cond_1
    throw v0
.end method
