.class public final Lw7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:Lqe;

.field public c:Lqe;

.field public d:Lqe;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Lqe;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lw7;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Lw7;->b:Lqe;

    .line 8
    .line 9
    iput-object p1, p0, Lw7;->c:Lqe;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lw7;->c:Lqe;

    .line 2
    .line 3
    iget-object v0, v0, Lqe;->a:Landroid/util/SparseArray;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lqe;

    .line 14
    .line 15
    :goto_0
    iget v1, p0, Lw7;->a:I

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x2

    .line 19
    if-eq v1, v3, :cond_3

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lw7;->b()V

    .line 24
    .line 25
    .line 26
    goto :goto_3

    .line 27
    :cond_2
    iput v3, p0, Lw7;->a:I

    .line 28
    .line 29
    iput-object v0, p0, Lw7;->c:Lqe;

    .line 30
    .line 31
    iput v2, p0, Lw7;->f:I

    .line 32
    .line 33
    :goto_2
    move v2, v3

    .line 34
    goto :goto_3

    .line 35
    :cond_3
    if-eqz v0, :cond_4

    .line 36
    .line 37
    iput-object v0, p0, Lw7;->c:Lqe;

    .line 38
    .line 39
    iget v0, p0, Lw7;->f:I

    .line 40
    .line 41
    add-int/2addr v0, v2

    .line 42
    iput v0, p0, Lw7;->f:I

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_4
    const v0, 0xfe0e

    .line 46
    .line 47
    .line 48
    if-ne p1, v0, :cond_5

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_5
    const v0, 0xfe0f

    .line 52
    .line 53
    .line 54
    if-ne p1, v0, :cond_6

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_6
    iget-object v0, p0, Lw7;->c:Lqe;

    .line 58
    .line 59
    iget-object v1, v0, Lqe;->b:Lv7;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    iget v1, p0, Lw7;->f:I

    .line 64
    .line 65
    const/4 v3, 0x3

    .line 66
    if-ne v1, v2, :cond_7

    .line 67
    .line 68
    invoke-virtual {p0}, Lw7;->c()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Lw7;->c:Lqe;

    .line 75
    .line 76
    :cond_7
    iput-object v0, p0, Lw7;->d:Lqe;

    .line 77
    .line 78
    invoke-virtual {p0}, Lw7;->b()V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :goto_3
    iput p1, p0, Lw7;->e:I

    .line 83
    .line 84
    return v2
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lw7;->a:I

    .line 3
    .line 4
    iget-object v0, p0, Lw7;->b:Lqe;

    .line 5
    .line 6
    iput-object v0, p0, Lw7;->c:Lqe;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lw7;->f:I

    .line 10
    .line 11
    return-void
.end method

.method public final c()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lw7;->c:Lqe;

    .line 2
    .line 3
    iget-object v0, v0, Lqe;->b:Lv7;

    .line 4
    .line 5
    invoke-virtual {v0}, Lv7;->c()Loe;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x6

    .line 10
    invoke-virtual {v0, v1}, Lbi;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v3, v0, Lbi;->d:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v3, Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    iget v0, v0, Lbi;->a:I

    .line 22
    .line 23
    add-int/2addr v1, v0

    .line 24
    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    return v2

    .line 31
    :cond_0
    iget v0, p0, Lw7;->e:I

    .line 32
    .line 33
    const v1, 0xfe0f

    .line 34
    .line 35
    .line 36
    if-ne v0, v1, :cond_1

    .line 37
    .line 38
    return v2

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    return v0
.end method
