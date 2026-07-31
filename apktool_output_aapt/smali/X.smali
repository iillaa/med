.class public final LX;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LXj;Landroid/view/View;)V
    .locals 0

    const/4 p2, 0x1

    iput p2, p0, LX;->a:I

    .line 1
    iput-object p1, p0, LX;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroidx/appcompat/widget/ActionBarOverlayLayout;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LX;->a:I

    .line 2
    iput-object p1, p0, LX;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget p1, p0, LX;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LX;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, LXj;

    .line 9
    .line 10
    invoke-interface {p1}, LXj;->b()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/4 p1, 0x0

    .line 15
    iget-object v0, p0, LX;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 18
    .line 19
    iput-object p1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Z

    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget p1, p0, LX;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LX;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, LXj;

    .line 9
    .line 10
    invoke-interface {p1}, LXj;->a()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/4 p1, 0x0

    .line 15
    iget-object v0, p0, LX;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 18
    .line 19
    iput-object p1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->y:Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-boolean p1, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->m:Z

    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget v0, p0, LX;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :pswitch_0
    iget-object p1, p0, LX;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, LXj;

    .line 13
    .line 14
    invoke-interface {p1}, LXj;->c()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
