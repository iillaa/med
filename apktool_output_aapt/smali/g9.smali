.class public final Lg9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LVe;
.implements Lcf;
.implements LZe;
.implements Laf;
.implements LTj;
.implements LYc;
.implements LG0;
.implements LIg;
.implements LOd;


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Landroid/os/Handler;

.field public final e:Lr9;

.field public final synthetic f:Lh9;


# direct methods
.method public constructor <init>(Lm1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg9;->f:Lh9;

    .line 5
    .line 6
    new-instance v0, Landroid/os/Handler;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lr9;

    .line 12
    .line 13
    invoke-direct {v1}, Lq9;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lg9;->e:Lr9;

    .line 17
    .line 18
    iput-object p1, p0, Lg9;->c:Landroid/content/Context;

    .line 19
    .line 20
    iput-object v0, p0, Lg9;->d:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Lje;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->addMenuProvider(Lje;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->addOnConfigurationChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->addOnMultiWindowModeChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->addOnPictureInPictureModeChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->addOnTrimMemoryListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Lje;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->removeMenuProvider(Lje;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->removeOnConfigurationChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getLifecycle()LTc;
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    iget-object v0, v0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 4
    .line 5
    return-object v0
.end method

.method public final getSavedStateRegistry()LGg;
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0}, LX4;->getSavedStateRegistry()LGg;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public final getViewModelStore()LSj;
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0}, LX4;->getViewModelStore()LSj;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public final h(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->removeOnMultiWindowModeChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->removeOnPictureInPictureModeChangedListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(Lf5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lg9;->f:Lh9;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LX4;->removeOnTrimMemoryListener(Lf5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
