.class public final Lc4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly8;


# instance fields
.field public final c:LY5;

.field public final d:I

.field public final e:LA3;

.field public final f:Ly8;


# direct methods
.method public constructor <init>(Li0;LY5;ILA3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lc4;->c:LY5;

    .line 5
    .line 6
    iput p3, p0, Lc4;->d:I

    .line 7
    .line 8
    iput-object p4, p0, Lc4;->e:LA3;

    .line 9
    .line 10
    iput-object p1, p0, Lc4;->f:Ly8;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sget-object v1, LE7;->c:LE7;

    .line 8
    .line 9
    iget-object v2, p0, Lc4;->c:LY5;

    .line 10
    .line 11
    if-eq v2, v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "context="

    .line 16
    .line 17
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v1, -0x3

    .line 31
    iget v2, p0, Lc4;->d:I

    .line 32
    .line 33
    if-eq v2, v1, :cond_1

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v3, "capacity="

    .line 38
    .line 39
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_1
    sget-object v1, LA3;->c:LA3;

    .line 53
    .line 54
    iget-object v2, p0, Lc4;->e:LA3;

    .line 55
    .line 56
    if-eq v2, v1, :cond_2

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v3, "onBufferOverflow="

    .line 61
    .line 62
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const/16 v2, 0x5b

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const/16 v2, 0x3e

    .line 97
    .line 98
    const/4 v3, 0x0

    .line 99
    invoke-static {v0, v3, v3, v3, v2}, Lt4;->K(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Le;I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const/16 v0, 0x5d

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    return-object v0
.end method

.method public final c(Lz8;Lr5;)Ljava/lang/Object;
    .locals 7

    .line 1
    sget-object v0, Lfj;->a:Lfj;

    .line 2
    .line 3
    sget-object v1, Li6;->c:Li6;

    .line 4
    .line 5
    iget v2, p0, Lc4;->d:I

    .line 6
    .line 7
    const/4 v3, -0x3

    .line 8
    const/4 v4, 0x0

    .line 9
    if-ne v2, v3, :cond_5

    .line 10
    .line 11
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    new-instance v5, LZ5;

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    invoke-direct {v5, v6}, LZ5;-><init>(I)V

    .line 21
    .line 22
    .line 23
    iget-object v6, p0, Lc4;->c:LY5;

    .line 24
    .line 25
    invoke-interface {v6, v3, v5}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    invoke-interface {v2, v6}, LY5;->k(LY5;)LY5;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v3, 0x0

    .line 43
    invoke-static {v2, v6, v3}, LMk;->n(LY5;LY5;Z)LY5;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :goto_0
    invoke-static {v3, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    iget-object v2, p0, Lc4;->f:Ly8;

    .line 54
    .line 55
    invoke-interface {v2, p1, p2}, Ly8;->c(Lz8;Lr5;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-ne p1, v1, :cond_1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move-object p1, v0

    .line 63
    :goto_1
    if-ne p1, v1, :cond_7

    .line 64
    .line 65
    :goto_2
    move-object v0, p1

    .line 66
    goto :goto_5

    .line 67
    :cond_2
    sget-object v5, Lt5;->d:Lt5;

    .line 68
    .line 69
    invoke-interface {v3, v5}, LY5;->c(LX5;)LW5;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-interface {v2, v5}, LY5;->c(LX5;)LW5;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v6, v2}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    instance-of v5, p1, Lah;

    .line 88
    .line 89
    if-nez v5, :cond_4

    .line 90
    .line 91
    instance-of v5, p1, LJe;

    .line 92
    .line 93
    if-eqz v5, :cond_3

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_3
    new-instance v5, Lcj;

    .line 97
    .line 98
    invoke-direct {v5, p1, v2}, Lcj;-><init>(Lz8;LY5;)V

    .line 99
    .line 100
    .line 101
    move-object p1, v5

    .line 102
    :cond_4
    :goto_3
    new-instance v2, Lb4;

    .line 103
    .line 104
    invoke-direct {v2, p0, v4}, Lb4;-><init>(Lc4;Lr5;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v3}, Lr3;->G(LY5;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {v3, p1, v4, v2, p2}, LSi;->I(LY5;Ljava/lang/Object;Ljava/lang/Object;LN9;Lr5;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    if-ne p1, v1, :cond_7

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    new-instance v2, LZ3;

    .line 119
    .line 120
    invoke-direct {v2, p1, p0, v4}, LZ3;-><init>(Lz8;Lc4;Lr5;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, LMg;

    .line 124
    .line 125
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-direct {p1, p2, v3}, LMg;-><init>(Lr5;LY5;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p1, p1, v2}, Lr3;->F(LMg;LMg;LN9;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-ne p1, v1, :cond_6

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_6
    move-object p1, v0

    .line 140
    :goto_4
    if-ne p1, v1, :cond_7

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_7
    :goto_5
    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lc4;->f:Ly8;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " -> "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lc4;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    return-object v0
.end method
