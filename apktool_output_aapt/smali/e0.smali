.class public final Le0;
.super Lbe;
.source "SourceFile"


# instance fields
.field public final synthetic m:I

.field public final synthetic n:Lj0;


# direct methods
.method public constructor <init>(Lj0;Landroid/content/Context;LKh;Landroid/view/View;)V
    .locals 8

    const/4 v0, 0x0

    iput v0, p0, Le0;->m:I

    iput-object p1, p0, Le0;->n:Lj0;

    const/4 v7, 0x0

    const v2, 0x7f030020

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p3

    move-object v5, p2

    move-object v6, p4

    .line 5
    invoke-direct/range {v1 .. v7}, Lbe;-><init>(IILMd;Landroid/content/Context;Landroid/view/View;Z)V

    .line 6
    iget-object p2, p3, LKh;->A:LTd;

    .line 7
    invoke-virtual {p2}, LTd;->f()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p1, Lj0;->k:Lh0;

    if-nez p2, :cond_0

    .line 8
    iget-object p2, p1, Lj0;->j:Lle;

    .line 9
    check-cast p2, Landroid/view/View;

    .line 10
    :cond_0
    iput-object p2, p0, Lbe;->f:Landroid/view/View;

    .line 11
    :cond_1
    iget-object p1, p1, Lj0;->y:Li0;

    .line 12
    iput-object p1, p0, Lbe;->i:Lhe;

    iget-object p2, p0, Lbe;->j:LYd;

    if-eqz p2, :cond_2

    invoke-interface {p2, p1}, Lie;->e(Lhe;)V

    :cond_2
    return-void
.end method

.method public constructor <init>(Lj0;Landroid/content/Context;LMd;Landroid/view/View;)V
    .locals 8

    const/4 v0, 0x1

    iput v0, p0, Le0;->m:I

    iput-object p1, p0, Le0;->n:Lj0;

    const/4 v3, 0x0

    const v2, 0x7f030020

    const/4 v7, 0x1

    move-object v1, p0

    move-object v4, p3

    move-object v5, p2

    move-object v6, p4

    .line 1
    invoke-direct/range {v1 .. v7}, Lbe;-><init>(IILMd;Landroid/content/Context;Landroid/view/View;Z)V

    const p2, 0x800005

    .line 2
    iput p2, p0, Lbe;->g:I

    .line 3
    iget-object p1, p1, Lj0;->y:Li0;

    .line 4
    iput-object p1, p0, Lbe;->i:Lhe;

    iget-object p2, p0, Lbe;->j:LYd;

    if-eqz p2, :cond_0

    invoke-interface {p2, p1}, Lie;->e(Lhe;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 3

    .line 1
    iget v0, p0, Le0;->m:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Le0;->n:Lj0;

    .line 7
    .line 8
    iget-object v1, v0, Lj0;->e:LMd;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, LMd;->c(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    iput-object v1, v0, Lj0;->u:Le0;

    .line 18
    .line 19
    invoke-super {p0}, Lbe;->c()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_0
    const/4 v0, 0x0

    .line 24
    iget-object v1, p0, Le0;->n:Lj0;

    .line 25
    .line 26
    iput-object v0, v1, Lj0;->v:Le0;

    .line 27
    .line 28
    invoke-super {p0}, Lbe;->c()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
