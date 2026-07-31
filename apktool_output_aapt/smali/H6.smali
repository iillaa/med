.class public final LH6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements LEc;


# instance fields
.field public c:I

.field public d:I

.field public e:I

.field public f:Ljc;

.field public g:I

.field public final synthetic h:LI6;


# direct methods
.method public constructor <init>(LI6;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LH6;->h:LI6;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, LH6;->c:I

    .line 8
    .line 9
    iget v0, p1, LI6;->b:I

    .line 10
    .line 11
    iget-object p1, p1, LI6;->a:Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-ltz p1, :cond_2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-le v0, p1, :cond_1

    .line 24
    .line 25
    move v0, p1

    .line 26
    :cond_1
    :goto_0
    iput v0, p0, LH6;->d:I

    .line 27
    .line 28
    iput v0, p0, LH6;->e:I

    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "Cannot coerce value to an empty range: maximum "

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, " is less than minimum 0."

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw v0
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget v0, p0, LH6;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-gez v0, :cond_0

    .line 5
    .line 6
    iput v1, p0, LH6;->c:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, LH6;->f:Ljc;

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    iget-object v2, p0, LH6;->h:LI6;

    .line 14
    .line 15
    iget v3, v2, LI6;->c:I

    .line 16
    .line 17
    const/4 v4, -0x1

    .line 18
    const/4 v5, 0x1

    .line 19
    if-lez v3, :cond_1

    .line 20
    .line 21
    iget v6, p0, LH6;->g:I

    .line 22
    .line 23
    add-int/2addr v6, v5

    .line 24
    iput v6, p0, LH6;->g:I

    .line 25
    .line 26
    if-ge v6, v3, :cond_2

    .line 27
    .line 28
    :cond_1
    iget-object v3, v2, LI6;->a:Ljava/lang/CharSequence;

    .line 29
    .line 30
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-le v0, v3, :cond_3

    .line 35
    .line 36
    :cond_2
    new-instance v0, Ljc;

    .line 37
    .line 38
    iget v1, p0, LH6;->d:I

    .line 39
    .line 40
    iget-object v2, v2, LI6;->a:Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-static {v2}, LJh;->F(Ljava/lang/CharSequence;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {v0, v1, v2, v5}, Lhc;-><init>(III)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iput-object v0, p0, LH6;->f:Ljc;

    .line 50
    .line 51
    iput v4, p0, LH6;->e:I

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    iget-object v0, v2, LI6;->d:LN9;

    .line 55
    .line 56
    iget-object v3, v2, LI6;->a:Ljava/lang/CharSequence;

    .line 57
    .line 58
    iget v6, p0, LH6;->e:I

    .line 59
    .line 60
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-interface {v0, v3, v6}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lgf;

    .line 69
    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    new-instance v0, Ljc;

    .line 73
    .line 74
    iget v1, p0, LH6;->d:I

    .line 75
    .line 76
    iget-object v2, v2, LI6;->a:Ljava/lang/CharSequence;

    .line 77
    .line 78
    invoke-static {v2}, LJh;->F(Ljava/lang/CharSequence;)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-direct {v0, v1, v2, v5}, Lhc;-><init>(III)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    iget-object v2, v0, Lgf;->c:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v2, Ljava/lang/Number;

    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    iget-object v0, v0, Lgf;->d:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v0, Ljava/lang/Number;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget v3, p0, LH6;->d:I

    .line 103
    .line 104
    const/high16 v4, -0x80000000

    .line 105
    .line 106
    if-gt v2, v4, :cond_5

    .line 107
    .line 108
    sget-object v3, Ljc;->f:Ljc;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_5
    new-instance v4, Ljc;

    .line 112
    .line 113
    add-int/lit8 v6, v2, -0x1

    .line 114
    .line 115
    invoke-direct {v4, v3, v6, v5}, Lhc;-><init>(III)V

    .line 116
    .line 117
    .line 118
    move-object v3, v4

    .line 119
    :goto_1
    iput-object v3, p0, LH6;->f:Ljc;

    .line 120
    .line 121
    add-int/2addr v2, v0

    .line 122
    iput v2, p0, LH6;->d:I

    .line 123
    .line 124
    if-nez v0, :cond_6

    .line 125
    .line 126
    move v1, v5

    .line 127
    :cond_6
    add-int/2addr v2, v1

    .line 128
    iput v2, p0, LH6;->e:I

    .line 129
    .line 130
    :goto_2
    iput v5, p0, LH6;->c:I

    .line 131
    .line 132
    :goto_3
    return-void
.end method

.method public final hasNext()Z
    .locals 2

    .line 1
    iget v0, p0, LH6;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, LH6;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, LH6;->c:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v1, 0x0

    .line 16
    :goto_0
    return v1
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LH6;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, LH6;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, LH6;->c:I

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, LH6;->f:Ljc;

    .line 14
    .line 15
    const-string v2, "null cannot be cast to non-null type kotlin.ranges.IntRange"

    .line 16
    .line 17
    invoke-static {v2, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput-object v2, p0, LH6;->f:Ljc;

    .line 22
    .line 23
    iput v1, p0, LH6;->c:I

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 29
    .line 30
    .line 31
    throw v0
.end method

.method public final remove()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v1, "Operation is not supported for read-only collection"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method
