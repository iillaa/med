.class public final LPg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Landroidx/appcompat/widget/SearchView;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/widget/SearchView;I)V
    .locals 0

    .line 1
    iput p2, p0, LPg;->c:I

    iput-object p1, p0, LPg;->d:Landroidx/appcompat/widget/SearchView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, LPg;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LPg;->d:Landroidx/appcompat/widget/SearchView;

    .line 7
    .line 8
    iget-object v0, v0, Landroidx/appcompat/widget/SearchView;->Q:Lq6;

    .line 9
    .line 10
    instance-of v1, v0, LMh;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lq6;->b(Landroid/database/Cursor;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :pswitch_0
    iget-object v0, p0, LPg;->d:Landroidx/appcompat/widget/SearchView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->t()V

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
