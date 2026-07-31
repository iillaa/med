.class public final LPe;
.super LKc;
.source "SourceFile"

# interfaces
.implements Ly9;


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Landroidx/activity/a;


# direct methods
.method public synthetic constructor <init>(Landroidx/activity/a;I)V
    .locals 0

    .line 1
    iput p2, p0, LPe;->d:I

    iput-object p1, p0, LPe;->e:Landroidx/activity/a;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, LPe;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LPe;->e:Landroidx/activity/a;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/activity/a;->c()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lfj;->a:Lfj;

    .line 12
    .line 13
    return-object v0

    .line 14
    :pswitch_0
    iget-object v0, p0, LPe;->e:Landroidx/activity/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/activity/a;->b()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lfj;->a:Lfj;

    .line 20
    .line 21
    return-object v0

    .line 22
    :pswitch_1
    iget-object v0, p0, LPe;->e:Landroidx/activity/a;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroidx/activity/a;->c()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lfj;->a:Lfj;

    .line 28
    .line 29
    return-object v0

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
