.class public final Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# instance fields
.field public final synthetic c:LTc;

.field public final synthetic d:LGg;


# direct methods
.method public constructor <init>(LTc;LGg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;->c:LTc;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;->d:LGg;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final d(LYc;LRc;)V
    .locals 0

    .line 1
    sget-object p1, LRc;->ON_START:LRc;

    .line 2
    .line 3
    if-ne p2, p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;->c:LTc;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, LTc;->b(LXc;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;->d:LGg;

    .line 11
    .line 12
    invoke-virtual {p1}, LGg;->d()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
