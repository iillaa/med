.class public final Lb3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements LEc;


# instance fields
.field public c:I

.field public d:I

.field public e:Z

.field public final synthetic f:I

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lb3;->c:I

    return-void
.end method

.method public constructor <init>(Lf3;I)V
    .locals 0

    iput p2, p0, Lb3;->f:I

    iput-object p1, p0, Lb3;->g:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_0

    .line 2
    iget p1, p1, Lhh;->e:I

    .line 3
    invoke-direct {p0, p1}, Lb3;-><init>(I)V

    return-void

    .line 4
    :pswitch_0
    iget p1, p1, Lhh;->e:I

    .line 5
    invoke-direct {p0, p1}, Lb3;-><init>(I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Lg3;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lb3;->f:I

    iput-object p1, p0, Lb3;->g:Ljava/lang/Object;

    .line 6
    iget p1, p1, Lg3;->e:I

    .line 7
    invoke-direct {p0, p1}, Lb3;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lb3;->f:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lg3;

    .line 9
    .line 10
    iget-object v0, v0, Lg3;->d:[Ljava/lang/Object;

    .line 11
    .line 12
    aget-object p1, v0, p1

    .line 13
    .line 14
    return-object p1

    .line 15
    :pswitch_0
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lf3;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lhh;->h(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    return-object p1

    .line 24
    :pswitch_1
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Lf3;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lhh;->e(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    return-object p1

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b(I)V
    .locals 1

    .line 1
    iget v0, p0, Lb3;->f:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lg3;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lg3;->a(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lf3;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lhh;->f(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_1
    iget-object v0, p0, Lb3;->g:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lf3;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lhh;->f(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final hasNext()Z
    .locals 2

    .line 1
    iget v0, p0, Lb3;->d:I

    .line 2
    .line 3
    iget v1, p0, Lb3;->c:I

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lb3;->hasNext()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lb3;->d:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lb3;->a(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lb3;->d:I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    add-int/2addr v1, v2

    .line 17
    iput v1, p0, Lb3;->d:I

    .line 18
    .line 19
    iput-boolean v2, p0, Lb3;->e:Z

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 25
    .line 26
    .line 27
    throw v0
.end method

.method public final remove()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lb3;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lb3;->d:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    iput v0, p0, Lb3;->d:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lb3;->b(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lb3;->c:I

    .line 15
    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    iput v0, p0, Lb3;->c:I

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lb3;->e:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    const-string v1, "Call next() before removing an element."

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v0
.end method
