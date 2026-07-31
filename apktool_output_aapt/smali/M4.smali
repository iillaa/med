.class public final synthetic LM4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWc;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, LM4;->c:I

    iput-object p1, p0, LM4;->d:Ljava/lang/Object;

    iput-object p3, p0, LM4;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d(LYc;LRc;)V
    .locals 2

    .line 1
    iget p1, p0, LM4;->c:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object p1, LRc;->ON_DESTROY:LRc;

    .line 7
    .line 8
    iget-object v0, p0, LM4;->d:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, LRd;

    .line 11
    .line 12
    if-ne p2, p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, LM4;->e:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Lje;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, LRd;->d(Lje;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :pswitch_0
    iget-object p1, p0, LM4;->d:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Landroidx/activity/a;

    .line 29
    .line 30
    const-string v0, "$dispatcher"

    .line 31
    .line 32
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, LM4;->e:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, LX4;

    .line 38
    .line 39
    const-string v1, "this$0"

    .line 40
    .line 41
    invoke-static {v1, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    sget-object v1, LRc;->ON_CREATE:LRc;

    .line 45
    .line 46
    if-ne p2, v1, :cond_1

    .line 47
    .line 48
    sget-object p2, LN4;->a:LN4;

    .line 49
    .line 50
    invoke-virtual {p2, v0}, LN4;->a(Landroid/app/Activity;)Landroid/window/OnBackInvokedDispatcher;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const-string v0, "invoker"

    .line 55
    .line 56
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iput-object p2, p1, Landroidx/activity/a;->e:Landroid/window/OnBackInvokedDispatcher;

    .line 60
    .line 61
    iget-boolean p2, p1, Landroidx/activity/a;->g:Z

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroidx/activity/a;->d(Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
