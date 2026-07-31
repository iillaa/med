.class public final LRe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# instance fields
.field public final synthetic a:LJ9;

.field public final synthetic b:LJ9;

.field public final synthetic c:Ly9;

.field public final synthetic d:Ly9;


# direct methods
.method public constructor <init>(LJ9;LJ9;Ly9;Ly9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LRe;->a:LJ9;

    .line 5
    .line 6
    iput-object p2, p0, LRe;->b:LJ9;

    .line 7
    .line 8
    iput-object p3, p0, LRe;->c:Ly9;

    .line 9
    .line 10
    iput-object p4, p0, LRe;->d:Ly9;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onBackCancelled()V
    .locals 1

    .line 1
    iget-object v0, p0, LRe;->d:Ly9;

    .line 2
    .line 3
    invoke-interface {v0}, Ly9;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onBackInvoked()V
    .locals 1

    .line 1
    iget-object v0, p0, LRe;->c:Ly9;

    .line 2
    .line 3
    invoke-interface {v0}, Ly9;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onBackProgressed(Landroid/window/BackEvent;)V
    .locals 2

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LRe;->b:LJ9;

    .line 7
    .line 8
    new-instance v1, Lk3;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Lk3;-><init>(Landroid/window/BackEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onBackStarted(Landroid/window/BackEvent;)V
    .locals 2

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LRe;->a:LJ9;

    .line 7
    .line 8
    new-instance v1, Lk3;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Lk3;-><init>(Landroid/window/BackEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method
