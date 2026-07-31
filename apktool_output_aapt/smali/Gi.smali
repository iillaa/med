.class public final LGi;
.super Lu6;
.source "SourceFile"


# instance fields
.field public final synthetic E:I

.field public F:Z

.field public G:I

.field public final synthetic H:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LHi;I)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LGi;->E:I

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, LGi;->H:Ljava/lang/Object;

    iput p2, p0, LGi;->G:I

    const/4 p1, 0x0

    iput-boolean p1, p0, LGi;->F:Z

    return-void
.end method

.method public constructor <init>(LWj;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LGi;->E:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, LGi;->H:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, LGi;->F:Z

    iput p1, p0, LGi;->G:I

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    iget v0, p0, LGi;->E:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget v0, p0, LGi;->G:I

    .line 7
    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iput v0, p0, LGi;->G:I

    .line 11
    .line 12
    iget-object v1, p0, LGi;->H:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, LWj;

    .line 15
    .line 16
    iget-object v2, v1, LWj;->a:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ne v0, v2, :cond_1

    .line 23
    .line 24
    iget-object v0, v1, LWj;->d:LXj;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, LXj;->a()V

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    iput v0, p0, LGi;->G:I

    .line 33
    .line 34
    iput-boolean v0, p0, LGi;->F:Z

    .line 35
    .line 36
    iput-boolean v0, v1, LWj;->e:Z

    .line 37
    .line 38
    :cond_1
    return-void

    .line 39
    :pswitch_0
    iget-boolean v0, p0, LGi;->F:Z

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, LGi;->H:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, LHi;

    .line 46
    .line 47
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 48
    .line 49
    iget v1, p0, LGi;->G:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public b()V
    .locals 1

    .line 1
    iget v0, p0, LGi;->E:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, LGi;->F:Z

    .line 9
    .line 10
    return-void

    .line 11
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()V
    .locals 2

    .line 1
    iget v0, p0, LGi;->E:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, LGi;->F:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, LGi;->F:Z

    .line 13
    .line 14
    iget-object v0, p0, LGi;->H:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, LWj;

    .line 17
    .line 18
    iget-object v0, v0, LWj;->d:LXj;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, LXj;->c()V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void

    .line 26
    :pswitch_0
    iget-object v0, p0, LGi;->H:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, LHi;

    .line 29
    .line 30
    iget-object v0, v0, LHi;->a:Landroidx/appcompat/widget/Toolbar;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
