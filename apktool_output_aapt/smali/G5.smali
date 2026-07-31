.class public final LG5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic c:Landroid/widget/EditText;

.field public final synthetic d:LH5;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;Li0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LG5;->c:Landroid/widget/EditText;

    .line 5
    .line 6
    iput-object p2, p0, LG5;->d:LH5;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1
    iget-object p1, p0, LG5;->c:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p2, p0, LG5;->d:LH5;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-interface {p2, p1, v0}, LH5;->l(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
