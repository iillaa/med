.class public final LI8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz8;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lz8;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lz8;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p3, p0, LI8;->c:I

    iput-object p1, p0, LI8;->d:Lz8;

    iput-object p2, p0, LI8;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, LI8;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, LJ8;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, LJ8;

    .line 12
    .line 13
    iget v1, v0, LJ8;->g:I

    .line 14
    .line 15
    const/high16 v2, -0x80000000

    .line 16
    .line 17
    and-int v3, v1, v2

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    iput v1, v0, LJ8;->g:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, LJ8;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, LJ8;-><init>(LI8;Lr5;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, v0, LJ8;->f:Ljava/lang/Object;

    .line 31
    .line 32
    sget-object v1, Li6;->c:Li6;

    .line 33
    .line 34
    iget v2, v0, LJ8;->g:I

    .line 35
    .line 36
    const/4 v3, 0x2

    .line 37
    const/4 v4, 0x1

    .line 38
    if-eqz v2, :cond_3

    .line 39
    .line 40
    if-eq v2, v4, :cond_2

    .line 41
    .line 42
    if-ne v2, v3, :cond_1

    .line 43
    .line 44
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 49
    .line 50
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 51
    .line 52
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p1

    .line 56
    :cond_2
    iget-object p1, v0, LJ8;->j:Lz8;

    .line 57
    .line 58
    iget-object v2, v0, LJ8;->i:Ljava/lang/Object;

    .line 59
    .line 60
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, v0, LJ8;->i:Ljava/lang/Object;

    .line 68
    .line 69
    iget-object p2, p0, LI8;->d:Lz8;

    .line 70
    .line 71
    iput-object p2, v0, LJ8;->j:Lz8;

    .line 72
    .line 73
    iput v4, v0, LJ8;->g:I

    .line 74
    .line 75
    iget-object v2, p0, LI8;->e:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v2, LN9;

    .line 78
    .line 79
    invoke-interface {v2, p1, v0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    if-ne v2, v1, :cond_4

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_4
    move-object v2, p1

    .line 87
    move-object p1, p2

    .line 88
    :goto_1
    const/4 p2, 0x0

    .line 89
    iput-object p2, v0, LJ8;->i:Ljava/lang/Object;

    .line 90
    .line 91
    iput-object p2, v0, LJ8;->j:Lz8;

    .line 92
    .line 93
    iput v3, v0, LJ8;->g:I

    .line 94
    .line 95
    invoke-interface {p1, v2, v0}, Lz8;->b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    if-ne p1, v1, :cond_5

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_5
    :goto_2
    sget-object v1, Lfj;->a:Lfj;

    .line 103
    .line 104
    :goto_3
    return-object v1

    .line 105
    :pswitch_0
    instance-of v0, p2, LH8;

    .line 106
    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    move-object v0, p2

    .line 110
    check-cast v0, LH8;

    .line 111
    .line 112
    iget v1, v0, LH8;->i:I

    .line 113
    .line 114
    const/high16 v2, -0x80000000

    .line 115
    .line 116
    and-int v3, v1, v2

    .line 117
    .line 118
    if-eqz v3, :cond_6

    .line 119
    .line 120
    sub-int/2addr v1, v2

    .line 121
    iput v1, v0, LH8;->i:I

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_6
    new-instance v0, LH8;

    .line 125
    .line 126
    invoke-direct {v0, p0, p2}, LH8;-><init>(LI8;Lr5;)V

    .line 127
    .line 128
    .line 129
    :goto_4
    iget-object p2, v0, LH8;->g:Ljava/lang/Object;

    .line 130
    .line 131
    sget-object v1, Li6;->c:Li6;

    .line 132
    .line 133
    iget v2, v0, LH8;->i:I

    .line 134
    .line 135
    const/4 v3, 0x1

    .line 136
    if-eqz v2, :cond_8

    .line 137
    .line 138
    if-ne v2, v3, :cond_7

    .line 139
    .line 140
    iget-object p1, v0, LH8;->f:LI8;

    .line 141
    .line 142
    :try_start_0
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    .line 144
    .line 145
    goto :goto_5

    .line 146
    :catchall_0
    move-exception p2

    .line 147
    goto :goto_7

    .line 148
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 149
    .line 150
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 151
    .line 152
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p1

    .line 156
    :cond_8
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    :try_start_1
    iget-object p2, p0, LI8;->d:Lz8;

    .line 160
    .line 161
    iput-object p0, v0, LH8;->f:LI8;

    .line 162
    .line 163
    iput v3, v0, LH8;->i:I

    .line 164
    .line 165
    invoke-interface {p2, p1, v0}, Lz8;->b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 169
    if-ne p1, v1, :cond_9

    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_9
    :goto_5
    sget-object v1, Lfj;->a:Lfj;

    .line 173
    .line 174
    :goto_6
    return-object v1

    .line 175
    :catchall_1
    move-exception p2

    .line 176
    move-object p1, p0

    .line 177
    :goto_7
    iget-object p1, p1, LI8;->e:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast p1, LTf;

    .line 180
    .line 181
    iput-object p2, p1, LTf;->c:Ljava/lang/Object;

    .line 182
    .line 183
    throw p2

    .line 184
    nop

    .line 185
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
