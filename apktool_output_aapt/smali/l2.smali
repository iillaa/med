.class public final Ll2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Ll2;->c:I

    iput-object p2, p0, Ll2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    .line 1
    iget p1, p0, Ll2;->c:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll2;->d:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Landroidx/appcompat/widget/SearchView;

    .line 9
    .line 10
    invoke-virtual {p1, p3}, Landroidx/appcompat/widget/SearchView;->o(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    iget-object p1, p0, Ll2;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ln2;

    .line 17
    .line 18
    iget-object p4, p1, Ln2;->I:Lq2;

    .line 19
    .line 20
    invoke-virtual {p4, p3}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 21
    .line 22
    .line 23
    iget-object p4, p1, Ln2;->I:Lq2;

    .line 24
    .line 25
    invoke-virtual {p4}, Landroid/widget/AdapterView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    if-eqz p4, :cond_0

    .line 30
    .line 31
    iget-object p4, p1, Ln2;->I:Lq2;

    .line 32
    .line 33
    iget-object p5, p1, Ln2;->F:Landroid/widget/ListAdapter;

    .line 34
    .line 35
    invoke-interface {p5, p3}, Landroid/widget/Adapter;->getItemId(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-virtual {p4, p2, p3, v0, v1}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p1}, Lnd;->dismiss()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
