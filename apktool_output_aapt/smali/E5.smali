.class public final LE5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:LH5;


# direct methods
.method public synthetic constructor <init>(LH5;I)V
    .locals 0

    .line 1
    iput p2, p0, LE5;->a:I

    iput-object p1, p0, LE5;->b:LH5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget p1, p0, LE5;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    const/4 v0, 0x0

    .line 8
    iget-object v1, p0, LE5;->b:LH5;

    .line 9
    .line 10
    invoke-interface {v1, v0, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/4 p1, 0x0

    .line 15
    const/4 v0, 0x0

    .line 16
    iget-object v1, p0, LE5;->b:LH5;

    .line 17
    .line 18
    invoke-interface {v1, v0, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
