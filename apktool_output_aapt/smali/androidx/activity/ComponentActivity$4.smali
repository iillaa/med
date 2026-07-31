.class public final Landroidx/activity/ComponentActivity$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# instance fields
.field public final synthetic c:LX4;


# direct methods
.method public constructor <init>(Lh9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/activity/ComponentActivity$4;->c:LX4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final d(LYc;LRc;)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/activity/ComponentActivity$4;->c:LX4;

    .line 2
    .line 3
    invoke-static {p1}, LX4;->access$ensureViewModelStore(LX4;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, LX4;->getLifecycle()LTc;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p0}, LTc;->b(LXc;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
