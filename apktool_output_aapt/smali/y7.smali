.class public final Ly7;
.super Llc;
.source "SourceFile"


# instance fields
.field public final l:Lx7;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lx7;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lx7;-><init>(Landroid/widget/TextView;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ly7;->l:Lx7;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final K(Z)V
    .locals 2

    .line 1
    sget-object v0, Ln7;->j:Ln7;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    xor-int/2addr v0, v1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    iget-object v0, p0, Ly7;->l:Lx7;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lx7;->K(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final L(Z)V
    .locals 2

    .line 1
    sget-object v0, Ln7;->j:Ln7;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    xor-int/2addr v0, v1

    .line 10
    iget-object v1, p0, Ly7;->l:Lx7;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iput-boolean p1, v1, Lx7;->n:Z

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v1, p1}, Lx7;->L(Z)V

    .line 18
    .line 19
    .line 20
    :goto_1
    return-void
.end method

.method public final o([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
    .locals 2

    .line 1
    sget-object v0, Ln7;->j:Ln7;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    xor-int/2addr v0, v1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_1
    iget-object v0, p0, Ly7;->l:Lx7;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lx7;->o([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    return-object p1
.end method
