.class public final LTe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LN3;


# instance fields
.field public final c:LNe;

.field public final synthetic d:Landroidx/activity/a;


# direct methods
.method public constructor <init>(Landroidx/activity/a;LNe;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onBackPressedCallback"

    .line 5
    .line 6
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LTe;->d:Landroidx/activity/a;

    .line 10
    .line 11
    iput-object p2, p0, LTe;->c:LNe;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final cancel()V
    .locals 4

    .line 1
    iget-object v0, p0, LTe;->d:Landroidx/activity/a;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/activity/a;->b:LZ2;

    .line 4
    .line 5
    iget-object v2, p0, LTe;->c:LNe;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, LZ2;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Landroidx/activity/a;->c:LNe;

    .line 11
    .line 12
    invoke-static {v1, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object v3, v0, Landroidx/activity/a;->c:LNe;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    iget-object v0, v2, LNe;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, v2, LNe;->c:Ly9;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-interface {v0}, Ly9;->a()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    iput-object v3, v2, LNe;->c:Ly9;

    .line 40
    .line 41
    return-void
.end method
