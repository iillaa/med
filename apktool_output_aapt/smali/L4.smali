.class public final synthetic LL4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LL4;->c:I

    iput-object p2, p0, LL4;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(LYc;LRc;)V
    .locals 1

    .line 1
    iget v0, p0, LL4;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LL4;->d:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, LGg;

    .line 9
    .line 10
    const-string v0, "this$0"

    .line 11
    .line 12
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, LRc;->ON_START:LRc;

    .line 16
    .line 17
    if-ne p2, v0, :cond_0

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    :goto_0
    iput-boolean p2, p1, LGg;->f:Z

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    sget-object v0, LRc;->ON_STOP:LRc;

    .line 24
    .line 25
    if-ne p2, v0, :cond_1

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :goto_1
    return-void

    .line 30
    :pswitch_0
    iget-object v0, p0, LL4;->d:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, LX4;

    .line 33
    .line 34
    invoke-static {v0, p1, p2}, LX4;->b(LX4;LYc;LRc;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_1
    iget-object p1, p0, LL4;->d:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p1, LX4;

    .line 41
    .line 42
    const-string v0, "this$0"

    .line 43
    .line 44
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, LRc;->ON_STOP:LRc;

    .line 48
    .line 49
    if-ne p2, v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->cancelPendingInputEvents()V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
