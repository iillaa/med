.class public final LF5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:LH5;


# direct methods
.method public synthetic constructor <init>(LH5;I)V
    .locals 0

    .line 1
    iput p2, p0, LF5;->c:I

    iput-object p1, p0, LF5;->d:LH5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget p1, p0, LF5;->c:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x4

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, LF5;->d:LH5;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 p3, 0x0

    .line 13
    invoke-interface {p1, p2, p3}, LH5;->l(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p3, 0x1

    .line 18
    :goto_0
    return p3

    .line 19
    :pswitch_0
    const/4 p1, 0x4

    .line 20
    const/4 p3, 0x1

    .line 21
    if-ne p2, p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, LF5;->d:LH5;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-interface {p1, p2, p3}, LH5;->l(Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    const/4 p3, 0x0

    .line 30
    :cond_1
    return p3

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
