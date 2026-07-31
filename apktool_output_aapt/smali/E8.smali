.class public final LE8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly8;


# instance fields
.field public final synthetic c:Ly8;

.field public final synthetic d:LO9;


# direct methods
.method public constructor <init>(LY1;Lo8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LE8;->c:Ly8;

    .line 5
    .line 6
    iput-object p2, p0, LE8;->d:LO9;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Lz8;Lr5;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p2, LD8;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LD8;

    .line 7
    .line 8
    iget v1, v0, LD8;->g:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LD8;->g:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LD8;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LD8;-><init>(LE8;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LD8;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LD8;->g:I

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    const/4 v4, 0x2

    .line 33
    const/4 v5, 0x1

    .line 34
    const/4 v6, 0x0

    .line 35
    if-eqz v2, :cond_4

    .line 36
    .line 37
    if-eq v2, v5, :cond_3

    .line 38
    .line 39
    if-eq v2, v4, :cond_2

    .line 40
    .line 41
    if-ne v2, v3, :cond_1

    .line 42
    .line 43
    iget-object p1, v0, LD8;->i:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Lrg;

    .line 46
    .line 47
    :try_start_0
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_0
    move-exception p2

    .line 52
    goto :goto_3

    .line 53
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 56
    .line 57
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p1

    .line 61
    :cond_2
    iget-object p1, v0, LD8;->i:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, Ljava/lang/Throwable;

    .line 64
    .line 65
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_5

    .line 69
    :cond_3
    iget-object p1, v0, LD8;->j:Lz8;

    .line 70
    .line 71
    iget-object v2, v0, LD8;->i:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v2, LE8;

    .line 74
    .line 75
    :try_start_1
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catchall_1
    move-exception p1

    .line 80
    goto :goto_4

    .line 81
    :cond_4
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :try_start_2
    iget-object p2, p0, LE8;->c:Ly8;

    .line 85
    .line 86
    iput-object p0, v0, LD8;->i:Ljava/lang/Object;

    .line 87
    .line 88
    iput-object p1, v0, LD8;->j:Lz8;

    .line 89
    .line 90
    iput v5, v0, LD8;->g:I

    .line 91
    .line 92
    invoke-interface {p2, p1, v0}, Ly8;->c(Lz8;Lr5;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 96
    if-ne p2, v1, :cond_5

    .line 97
    .line 98
    return-object v1

    .line 99
    :cond_5
    move-object v2, p0

    .line 100
    :goto_1
    new-instance p2, Lrg;

    .line 101
    .line 102
    iget-object v4, v0, Ls5;->d:LY5;

    .line 103
    .line 104
    invoke-static {v4}, Llc;->e(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p2, p1, v4}, Lrg;-><init>(Lz8;LY5;)V

    .line 108
    .line 109
    .line 110
    :try_start_3
    iget-object p1, v2, LE8;->d:LO9;

    .line 111
    .line 112
    iput-object p2, v0, LD8;->i:Ljava/lang/Object;

    .line 113
    .line 114
    iput-object v6, v0, LD8;->j:Lz8;

    .line 115
    .line 116
    iput v3, v0, LD8;->g:I

    .line 117
    .line 118
    invoke-interface {p1, p2, v6, v0}, LO9;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 122
    if-ne p1, v1, :cond_6

    .line 123
    .line 124
    return-object v1

    .line 125
    :cond_6
    move-object p1, p2

    .line 126
    :goto_2
    invoke-virtual {p1}, Ls5;->l()V

    .line 127
    .line 128
    .line 129
    sget-object p1, Lfj;->a:Lfj;

    .line 130
    .line 131
    return-object p1

    .line 132
    :catchall_2
    move-exception p1

    .line 133
    move-object v7, p2

    .line 134
    move-object p2, p1

    .line 135
    move-object p1, v7

    .line 136
    :goto_3
    invoke-virtual {p1}, Ls5;->l()V

    .line 137
    .line 138
    .line 139
    throw p2

    .line 140
    :catchall_3
    move-exception p1

    .line 141
    move-object v2, p0

    .line 142
    :goto_4
    new-instance p2, Lqi;

    .line 143
    .line 144
    invoke-direct {p2, p1}, Lqi;-><init>(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    iget-object v2, v2, LE8;->d:LO9;

    .line 148
    .line 149
    iput-object p1, v0, LD8;->i:Ljava/lang/Object;

    .line 150
    .line 151
    iput-object v6, v0, LD8;->j:Lz8;

    .line 152
    .line 153
    iput v4, v0, LD8;->g:I

    .line 154
    .line 155
    check-cast v2, Lo8;

    .line 156
    .line 157
    invoke-static {p2, v2, p1, v0}, Lu6;->d(Lqi;Lo8;Ljava/lang/Throwable;Lr5;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    if-ne p2, v1, :cond_7

    .line 162
    .line 163
    return-object v1

    .line 164
    :cond_7
    :goto_5
    throw p1
.end method
