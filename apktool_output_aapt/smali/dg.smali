.class public final Ldg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    iput v0, p0, Ldg;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lyk;LY1;Landroid/animation/ValueAnimator;)V
    .locals 0

    const/4 p2, 0x1

    iput p2, p0, Ldg;->c:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldg;->d:Ljava/lang/Object;

    iput-object p3, p0, Ldg;->e:Ljava/lang/Object;

    iput-object p4, p0, Ldg;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, Ldg;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ldg;->e:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LY1;

    .line 9
    .line 10
    iget-object v1, p0, Ldg;->d:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v1, v0}, Luk;->g(Landroid/view/View;LY1;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ldg;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_0
    :try_start_0
    iget-object v0, p0, Ldg;->d:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ljava/util/concurrent/Callable;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    goto :goto_0

    .line 34
    :catch_0
    const/4 v0, 0x0

    .line 35
    :goto_0
    new-instance v1, Lg0;

    .line 36
    .line 37
    iget-object v2, p0, Ldg;->e:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, Lf5;

    .line 40
    .line 41
    check-cast v2, LS8;

    .line 42
    .line 43
    const/16 v3, 0xa

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    invoke-direct {v1, v2, v0, v3, v4}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ldg;->f:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v0, Landroid/os/Handler;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
