.class public final LD5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:LH5;


# direct methods
.method public synthetic constructor <init>(LH5;I)V
    .locals 0

    .line 1
    iput p2, p0, LD5;->c:I

    iput-object p1, p0, LD5;->d:LH5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget p1, p0, LD5;->c:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    const/4 p2, 0x0

    .line 8
    iget-object v0, p0, LD5;->d:LH5;

    .line 9
    .line 10
    invoke-interface {v0, p2, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    const/4 p1, 0x0

    .line 15
    const/4 p2, 0x0

    .line 16
    iget-object v0, p0, LD5;->d:LH5;

    .line 17
    .line 18
    invoke-interface {v0, p2, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_1
    const/4 p1, 0x1

    .line 23
    const/4 p2, 0x0

    .line 24
    iget-object v0, p0, LD5;->d:LH5;

    .line 25
    .line 26
    invoke-interface {v0, p2, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_2
    const/4 p1, 0x1

    .line 31
    const/4 p2, 0x0

    .line 32
    iget-object v0, p0, LD5;->d:LH5;

    .line 33
    .line 34
    invoke-interface {v0, p2, p1}, LH5;->l(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
