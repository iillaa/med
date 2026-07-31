.class public final LFd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public synthetic a:Z

.field public synthetic b:[J

.field public synthetic c:[Ljava/lang/Object;

.field public synthetic d:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    :goto_0
    const/16 v1, 0x20

    .line 6
    .line 7
    const/16 v2, 0x50

    .line 8
    .line 9
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    shl-int/2addr v1, v0

    .line 13
    add-int/lit8 v1, v1, -0xc

    .line 14
    .line 15
    if-gt v2, v1, :cond_0

    .line 16
    .line 17
    move v2, v1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    :goto_1
    div-int/lit8 v2, v2, 0x8

    .line 23
    .line 24
    new-array v0, v2, [J

    .line 25
    .line 26
    iput-object v0, p0, LFd;->b:[J

    .line 27
    .line 28
    new-array v0, v2, [Ljava/lang/Object;

    .line 29
    .line 30
    iput-object v0, p0, LFd;->c:[Ljava/lang/Object;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(JLjava/lang/Long;)V
    .locals 9

    .line 1
    iget v0, p0, LFd;->d:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, LFd;->b:[J

    .line 6
    .line 7
    add-int/lit8 v2, v0, -0x1

    .line 8
    .line 9
    aget-wide v2, v1, v2

    .line 10
    .line 11
    cmp-long v1, p1, v2

    .line 12
    .line 13
    if-gtz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, LFd;->d(JLjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    iget-boolean v1, p0, LFd;->a:Z

    .line 21
    .line 22
    if-eqz v1, :cond_4

    .line 23
    .line 24
    iget-object v1, p0, LFd;->b:[J

    .line 25
    .line 26
    array-length v2, v1

    .line 27
    if-lt v0, v2, :cond_4

    .line 28
    .line 29
    iget-object v2, p0, LFd;->c:[Ljava/lang/Object;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    move v4, v3

    .line 33
    move v5, v4

    .line 34
    :goto_0
    if-ge v4, v0, :cond_3

    .line 35
    .line 36
    aget-object v6, v2, v4

    .line 37
    .line 38
    sget-object v7, Llc;->d:Ljava/lang/Object;

    .line 39
    .line 40
    if-eq v6, v7, :cond_2

    .line 41
    .line 42
    if-eq v4, v5, :cond_1

    .line 43
    .line 44
    aget-wide v7, v1, v4

    .line 45
    .line 46
    aput-wide v7, v1, v5

    .line 47
    .line 48
    aput-object v6, v2, v5

    .line 49
    .line 50
    const/4 v6, 0x0

    .line 51
    aput-object v6, v2, v4

    .line 52
    .line 53
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    iput-boolean v3, p0, LFd;->a:Z

    .line 59
    .line 60
    iput v5, p0, LFd;->d:I

    .line 61
    .line 62
    :cond_4
    iget v0, p0, LFd;->d:I

    .line 63
    .line 64
    iget-object v1, p0, LFd;->b:[J

    .line 65
    .line 66
    array-length v1, v1

    .line 67
    const/4 v2, 0x1

    .line 68
    if-lt v0, v1, :cond_7

    .line 69
    .line 70
    add-int/lit8 v1, v0, 0x1

    .line 71
    .line 72
    mul-int/lit8 v1, v1, 0x8

    .line 73
    .line 74
    const/4 v3, 0x4

    .line 75
    :goto_1
    const/16 v4, 0x20

    .line 76
    .line 77
    if-ge v3, v4, :cond_6

    .line 78
    .line 79
    shl-int v4, v2, v3

    .line 80
    .line 81
    add-int/lit8 v4, v4, -0xc

    .line 82
    .line 83
    if-gt v1, v4, :cond_5

    .line 84
    .line 85
    move v1, v4

    .line 86
    goto :goto_2

    .line 87
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_6
    :goto_2
    div-int/lit8 v1, v1, 0x8

    .line 91
    .line 92
    iget-object v3, p0, LFd;->b:[J

    .line 93
    .line 94
    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v4, "copyOf(this, newSize)"

    .line 99
    .line 100
    invoke-static {v4, v3}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    iput-object v3, p0, LFd;->b:[J

    .line 104
    .line 105
    iget-object v3, p0, LFd;->c:[Ljava/lang/Object;

    .line 106
    .line 107
    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v4, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iput-object v1, p0, LFd;->c:[Ljava/lang/Object;

    .line 115
    .line 116
    :cond_7
    iget-object v1, p0, LFd;->b:[J

    .line 117
    .line 118
    aput-wide p1, v1, v0

    .line 119
    .line 120
    iget-object p1, p0, LFd;->c:[Ljava/lang/Object;

    .line 121
    .line 122
    aput-object p3, p1, v0

    .line 123
    .line 124
    add-int/2addr v0, v2

    .line 125
    iput v0, p0, LFd;->d:I

    .line 126
    .line 127
    :goto_3
    return-void
.end method

.method public final b()LFd;
    .locals 2

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "null cannot be cast to non-null type androidx.collection.LongSparseArray<E of androidx.collection.LongSparseArray>"

    .line 6
    .line 7
    invoke-static {v1, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    check-cast v0, LFd;

    .line 11
    .line 12
    iget-object v1, p0, LFd;->b:[J

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, [J

    .line 19
    .line 20
    iput-object v1, v0, LFd;->b:[J

    .line 21
    .line 22
    iget-object v1, p0, LFd;->c:[Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, [Ljava/lang/Object;

    .line 29
    .line 30
    iput-object v1, v0, LFd;->c:[Ljava/lang/Object;

    .line 31
    .line 32
    return-object v0
.end method

.method public final c(J)Ljava/lang/Object;
    .locals 3

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LFd;->b:[J

    .line 8
    .line 9
    iget v2, p0, LFd;->d:I

    .line 10
    .line 11
    invoke-static {v1, v2, p1, p2}, Lu6;->g([JIJ)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-ltz p1, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, LFd;->c:[Ljava/lang/Object;

    .line 18
    .line 19
    aget-object p1, p2, p1

    .line 20
    .line 21
    sget-object p2, Llc;->d:Ljava/lang/Object;

    .line 22
    .line 23
    if-ne p1, p2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v0, p1

    .line 27
    :cond_1
    :goto_0
    return-object v0
.end method

.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-virtual {p0}, LFd;->b()LFd;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public final d(JLjava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, LFd;->b:[J

    .line 2
    .line 3
    iget v1, p0, LFd;->d:I

    .line 4
    .line 5
    invoke-static {v0, v1, p1, p2}, Lu6;->g([JIJ)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, LFd;->c:[Ljava/lang/Object;

    .line 12
    .line 13
    aput-object p3, p1, v0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    not-int v0, v0

    .line 18
    iget v1, p0, LFd;->d:I

    .line 19
    .line 20
    sget-object v2, Llc;->d:Ljava/lang/Object;

    .line 21
    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v3, p0, LFd;->c:[Ljava/lang/Object;

    .line 25
    .line 26
    aget-object v4, v3, v0

    .line 27
    .line 28
    if-ne v4, v2, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, LFd;->b:[J

    .line 31
    .line 32
    aput-wide p1, v1, v0

    .line 33
    .line 34
    aput-object p3, v3, v0

    .line 35
    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_1
    iget-boolean v3, p0, LFd;->a:Z

    .line 39
    .line 40
    if-eqz v3, :cond_5

    .line 41
    .line 42
    iget-object v3, p0, LFd;->b:[J

    .line 43
    .line 44
    array-length v4, v3

    .line 45
    if-lt v1, v4, :cond_5

    .line 46
    .line 47
    iget-object v0, p0, LFd;->c:[Ljava/lang/Object;

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    move v5, v4

    .line 51
    move v6, v5

    .line 52
    :goto_0
    if-ge v5, v1, :cond_4

    .line 53
    .line 54
    aget-object v7, v0, v5

    .line 55
    .line 56
    if-eq v7, v2, :cond_3

    .line 57
    .line 58
    if-eq v5, v6, :cond_2

    .line 59
    .line 60
    aget-wide v8, v3, v5

    .line 61
    .line 62
    aput-wide v8, v3, v6

    .line 63
    .line 64
    aput-object v7, v0, v6

    .line 65
    .line 66
    const/4 v7, 0x0

    .line 67
    aput-object v7, v0, v5

    .line 68
    .line 69
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 70
    .line 71
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    iput-boolean v4, p0, LFd;->a:Z

    .line 75
    .line 76
    iput v6, p0, LFd;->d:I

    .line 77
    .line 78
    iget-object v0, p0, LFd;->b:[J

    .line 79
    .line 80
    invoke-static {v0, v6, p1, p2}, Lu6;->g([JIJ)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    not-int v0, v0

    .line 85
    :cond_5
    iget v1, p0, LFd;->d:I

    .line 86
    .line 87
    iget-object v2, p0, LFd;->b:[J

    .line 88
    .line 89
    array-length v2, v2

    .line 90
    const/4 v3, 0x1

    .line 91
    if-lt v1, v2, :cond_8

    .line 92
    .line 93
    add-int/2addr v1, v3

    .line 94
    mul-int/lit8 v1, v1, 0x8

    .line 95
    .line 96
    const/4 v2, 0x4

    .line 97
    :goto_1
    const/16 v4, 0x20

    .line 98
    .line 99
    if-ge v2, v4, :cond_7

    .line 100
    .line 101
    shl-int v4, v3, v2

    .line 102
    .line 103
    add-int/lit8 v4, v4, -0xc

    .line 104
    .line 105
    if-gt v1, v4, :cond_6

    .line 106
    .line 107
    move v1, v4

    .line 108
    goto :goto_2

    .line 109
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_7
    :goto_2
    div-int/lit8 v1, v1, 0x8

    .line 113
    .line 114
    iget-object v2, p0, LFd;->b:[J

    .line 115
    .line 116
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    const-string v4, "copyOf(this, newSize)"

    .line 121
    .line 122
    invoke-static {v4, v2}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    iput-object v2, p0, LFd;->b:[J

    .line 126
    .line 127
    iget-object v2, p0, LFd;->c:[Ljava/lang/Object;

    .line 128
    .line 129
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {v4, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    iput-object v1, p0, LFd;->c:[Ljava/lang/Object;

    .line 137
    .line 138
    :cond_8
    iget v1, p0, LFd;->d:I

    .line 139
    .line 140
    sub-int/2addr v1, v0

    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    iget-object v2, p0, LFd;->b:[J

    .line 144
    .line 145
    add-int/lit8 v4, v0, 0x1

    .line 146
    .line 147
    const-string v5, "<this>"

    .line 148
    .line 149
    invoke-static {v5, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2, v0, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, LFd;->c:[Ljava/lang/Object;

    .line 156
    .line 157
    iget v2, p0, LFd;->d:I

    .line 158
    .line 159
    invoke-static {v1, v1, v4, v0, v2}, Lh3;->R([Ljava/lang/Object;[Ljava/lang/Object;III)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object v1, p0, LFd;->b:[J

    .line 163
    .line 164
    aput-wide p1, v1, v0

    .line 165
    .line 166
    iget-object p1, p0, LFd;->c:[Ljava/lang/Object;

    .line 167
    .line 168
    aput-object p3, p1, v0

    .line 169
    .line 170
    iget p1, p0, LFd;->d:I

    .line 171
    .line 172
    add-int/2addr p1, v3

    .line 173
    iput p1, p0, LFd;->d:I

    .line 174
    .line 175
    :goto_3
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 15

    .line 1
    iget-boolean v0, p0, LFd;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    sget-object v2, Llc;->d:Ljava/lang/Object;

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget v0, p0, LFd;->d:I

    .line 10
    .line 11
    iget-object v4, p0, LFd;->b:[J

    .line 12
    .line 13
    iget-object v5, p0, LFd;->c:[Ljava/lang/Object;

    .line 14
    .line 15
    move v6, v3

    .line 16
    move v7, v6

    .line 17
    :goto_0
    if-ge v6, v0, :cond_2

    .line 18
    .line 19
    aget-object v8, v5, v6

    .line 20
    .line 21
    if-eq v8, v2, :cond_1

    .line 22
    .line 23
    if-eq v6, v7, :cond_0

    .line 24
    .line 25
    aget-wide v9, v4, v6

    .line 26
    .line 27
    aput-wide v9, v4, v7

    .line 28
    .line 29
    aput-object v8, v5, v7

    .line 30
    .line 31
    aput-object v1, v5, v6

    .line 32
    .line 33
    :cond_0
    add-int/lit8 v7, v7, 0x1

    .line 34
    .line 35
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iput-boolean v3, p0, LFd;->a:Z

    .line 39
    .line 40
    iput v7, p0, LFd;->d:I

    .line 41
    .line 42
    :cond_3
    iget v0, p0, LFd;->d:I

    .line 43
    .line 44
    if-gtz v0, :cond_4

    .line 45
    .line 46
    const-string v0, "{}"

    .line 47
    .line 48
    goto/16 :goto_5

    .line 49
    .line 50
    :cond_4
    mul-int/lit8 v0, v0, 0x1c

    .line 51
    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 55
    .line 56
    .line 57
    const/16 v0, 0x7b

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget v0, p0, LFd;->d:I

    .line 63
    .line 64
    move v5, v3

    .line 65
    :goto_1
    if-ge v5, v0, :cond_11

    .line 66
    .line 67
    if-lez v5, :cond_5

    .line 68
    .line 69
    const-string v6, ", "

    .line 70
    .line 71
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    :cond_5
    const-string v6, "Expected index to be within 0..size()-1, but was "

    .line 75
    .line 76
    if-ltz v5, :cond_10

    .line 77
    .line 78
    iget v7, p0, LFd;->d:I

    .line 79
    .line 80
    if-ge v5, v7, :cond_10

    .line 81
    .line 82
    iget-boolean v8, p0, LFd;->a:Z

    .line 83
    .line 84
    if-eqz v8, :cond_9

    .line 85
    .line 86
    iget-object v8, p0, LFd;->b:[J

    .line 87
    .line 88
    iget-object v9, p0, LFd;->c:[Ljava/lang/Object;

    .line 89
    .line 90
    move v10, v3

    .line 91
    move v11, v10

    .line 92
    :goto_2
    if-ge v10, v7, :cond_8

    .line 93
    .line 94
    aget-object v12, v9, v10

    .line 95
    .line 96
    if-eq v12, v2, :cond_7

    .line 97
    .line 98
    if-eq v10, v11, :cond_6

    .line 99
    .line 100
    aget-wide v13, v8, v10

    .line 101
    .line 102
    aput-wide v13, v8, v11

    .line 103
    .line 104
    aput-object v12, v9, v11

    .line 105
    .line 106
    aput-object v1, v9, v10

    .line 107
    .line 108
    :cond_6
    add-int/lit8 v11, v11, 0x1

    .line 109
    .line 110
    :cond_7
    add-int/lit8 v10, v10, 0x1

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_8
    iput-boolean v3, p0, LFd;->a:Z

    .line 114
    .line 115
    iput v11, p0, LFd;->d:I

    .line 116
    .line 117
    :cond_9
    iget-object v7, p0, LFd;->b:[J

    .line 118
    .line 119
    aget-wide v8, v7, v5

    .line 120
    .line 121
    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const/16 v7, 0x3d

    .line 125
    .line 126
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    if-ltz v5, :cond_f

    .line 130
    .line 131
    iget v7, p0, LFd;->d:I

    .line 132
    .line 133
    if-ge v5, v7, :cond_f

    .line 134
    .line 135
    iget-boolean v6, p0, LFd;->a:Z

    .line 136
    .line 137
    if-eqz v6, :cond_d

    .line 138
    .line 139
    iget-object v6, p0, LFd;->b:[J

    .line 140
    .line 141
    iget-object v8, p0, LFd;->c:[Ljava/lang/Object;

    .line 142
    .line 143
    move v9, v3

    .line 144
    move v10, v9

    .line 145
    :goto_3
    if-ge v9, v7, :cond_c

    .line 146
    .line 147
    aget-object v11, v8, v9

    .line 148
    .line 149
    if-eq v11, v2, :cond_b

    .line 150
    .line 151
    if-eq v9, v10, :cond_a

    .line 152
    .line 153
    aget-wide v12, v6, v9

    .line 154
    .line 155
    aput-wide v12, v6, v10

    .line 156
    .line 157
    aput-object v11, v8, v10

    .line 158
    .line 159
    aput-object v1, v8, v9

    .line 160
    .line 161
    :cond_a
    add-int/lit8 v10, v10, 0x1

    .line 162
    .line 163
    :cond_b
    add-int/lit8 v9, v9, 0x1

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_c
    iput-boolean v3, p0, LFd;->a:Z

    .line 167
    .line 168
    iput v10, p0, LFd;->d:I

    .line 169
    .line 170
    :cond_d
    iget-object v6, p0, LFd;->c:[Ljava/lang/Object;

    .line 171
    .line 172
    aget-object v6, v6, v5

    .line 173
    .line 174
    if-eq v6, v4, :cond_e

    .line 175
    .line 176
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_e
    const-string v6, "(this Map)"

    .line 181
    .line 182
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :cond_f
    invoke-static {v6, v5}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    throw v1

    .line 202
    :cond_10
    invoke-static {v6, v5}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    throw v1

    .line 216
    :cond_11
    const/16 v0, 0x7d

    .line 217
    .line 218
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    const-string v1, "StringBuilder(capacity).\u2026builderAction).toString()"

    .line 226
    .line 227
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    :goto_5
    return-object v0
.end method
