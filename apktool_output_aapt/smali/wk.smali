.class public final Lwk;
.super Lxk;
.source "SourceFile"


# instance fields
.field public final d:Landroid/view/WindowInsetsAnimation;


# direct methods
.method public constructor <init>(Landroid/view/WindowInsetsAnimation;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    invoke-direct {p0, v0, v1, v2}, Lxk;-><init>(Landroid/view/animation/Interpolator;J)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lwk;->d:Landroid/view/WindowInsetsAnimation;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()J
    .locals 2

    .line 1
    iget-object v0, p0, Lwk;->d:Landroid/view/WindowInsetsAnimation;

    .line 2
    .line 3
    invoke-static {v0}, LB;->c(Landroid/view/WindowInsetsAnimation;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final b()F
    .locals 1

    .line 1
    iget-object v0, p0, Lwk;->d:Landroid/view/WindowInsetsAnimation;

    .line 2
    .line 3
    invoke-static {v0}, LB;->a(Landroid/view/WindowInsetsAnimation;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public final c(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lwk;->d:Landroid/view/WindowInsetsAnimation;

    .line 2
    .line 3
    invoke-static {v0, p1}, LB;->q(Landroid/view/WindowInsetsAnimation;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
