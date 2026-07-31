.class public final Lp6;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lp6;->a:I

    iput-object p2, p0, Lp6;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onChanged()V
    .locals 2

    .line 1
    iget v0, p0, Lp6;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lp6;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lnd;

    .line 9
    .line 10
    iget-object v1, v0, Lnd;->A:LX1;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Lnd;->f()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void

    .line 22
    :pswitch_0
    const/4 v0, 0x1

    .line 23
    iget-object v1, p0, Lp6;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Lq6;

    .line 26
    .line 27
    iput-boolean v0, v1, Lq6;->c:Z

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onInvalidated()V
    .locals 2

    .line 1
    iget v0, p0, Lp6;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lp6;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lnd;

    .line 9
    .line 10
    invoke-virtual {v0}, Lnd;->dismiss()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/4 v0, 0x0

    .line 15
    iget-object v1, p0, Lp6;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lq6;

    .line 18
    .line 19
    iput-boolean v0, v1, Lq6;->c:Z

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/widget/BaseAdapter;->notifyDataSetInvalidated()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
