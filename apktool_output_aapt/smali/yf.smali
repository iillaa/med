.class public final Lyf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LYc;


# static fields
.field public static final k:Lyf;


# instance fields
.field public c:I

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Landroid/os/Handler;

.field public final h:Landroidx/lifecycle/a;

.field public final i:Lq0;

.field public final j:Li0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lyf;

    .line 2
    .line 3
    invoke-direct {v0}, Lyf;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lyf;->k:Lyf;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lyf;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lyf;->f:Z

    .line 8
    .line 9
    new-instance v0, Landroidx/lifecycle/a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(LYc;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lyf;->h:Landroidx/lifecycle/a;

    .line 15
    .line 16
    new-instance v0, Lq0;

    .line 17
    .line 18
    const/4 v1, 0x5

    .line 19
    invoke-direct {v0, v1, p0}, Lq0;-><init>(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lyf;->i:Lq0;

    .line 23
    .line 24
    new-instance v0, Li0;

    .line 25
    .line 26
    const/16 v1, 0xf

    .line 27
    .line 28
    invoke-direct {v0, v1, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lyf;->j:Li0;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget v0, p0, Lyf;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lyf;->d:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Lyf;->e:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lyf;->h:Landroidx/lifecycle/a;

    .line 14
    .line 15
    sget-object v1, LRc;->ON_RESUME:LRc;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lyf;->e:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lyf;->g:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lyf;->i:Lq0;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public final getLifecycle()LTc;
    .locals 1

    .line 1
    iget-object v0, p0, Lyf;->h:Landroidx/lifecycle/a;

    .line 2
    .line 3
    return-object v0
.end method
