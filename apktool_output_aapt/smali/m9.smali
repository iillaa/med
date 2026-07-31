.class public final Lm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lq9;


# direct methods
.method public synthetic constructor <init>(Lr9;I)V
    .locals 0

    .line 1
    iput p2, p0, Lm9;->a:I

    iput-object p1, p0, Lm9;->b:Lq9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget v0, p0, Lm9;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lv0;

    .line 7
    .line 8
    iget-object p1, p0, Lm9;->b:Lq9;

    .line 9
    .line 10
    iget-object v0, p1, Lq9;->x:Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lp9;

    .line 17
    .line 18
    const-string v1, "FragmentManager"

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v0, "No IntentSenders were started for "

    .line 25
    .line 26
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, v0, Lp9;->a:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p1, Lq9;->c:LN6;

    .line 43
    .line 44
    invoke-virtual {p1}, LN6;->f()V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "Intent Sender result delivered for unknown Fragment "

    .line 50
    .line 51
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :goto_0
    return-void

    .line 65
    :pswitch_0
    check-cast p1, Lv0;

    .line 66
    .line 67
    iget-object p1, p0, Lm9;->b:Lq9;

    .line 68
    .line 69
    iget-object v0, p1, Lq9;->x:Ljava/util/ArrayDeque;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollLast()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lp9;

    .line 76
    .line 77
    const-string v1, "FragmentManager"

    .line 78
    .line 79
    if-nez v0, :cond_1

    .line 80
    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v0, "No Activities were started for result for "

    .line 84
    .line 85
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    iget-object v0, v0, Lp9;->a:Ljava/lang/String;

    .line 100
    .line 101
    iget-object p1, p1, Lq9;->c:LN6;

    .line 102
    .line 103
    invoke-virtual {p1}, LN6;->f()V

    .line 104
    .line 105
    .line 106
    new-instance p1, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v2, "Activity result delivered for unknown Fragment "

    .line 109
    .line 110
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    :goto_1
    return-void

    .line 124
    :pswitch_1
    check-cast p1, Ljava/util/Map;

    .line 125
    .line 126
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const/4 v1, 0x0

    .line 131
    new-array v2, v1, [Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, [Ljava/lang/String;

    .line 138
    .line 139
    new-instance v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    new-array p1, p1, [I

    .line 153
    .line 154
    move v2, v1

    .line 155
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-ge v2, v3, :cond_3

    .line 160
    .line 161
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Ljava/lang/Boolean;

    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    if-eqz v3, :cond_2

    .line 172
    .line 173
    move v3, v1

    .line 174
    goto :goto_3

    .line 175
    :cond_2
    const/4 v3, -0x1

    .line 176
    :goto_3
    aput v3, p1, v2

    .line 177
    .line 178
    add-int/lit8 v2, v2, 0x1

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_3
    iget-object p1, p0, Lm9;->b:Lq9;

    .line 182
    .line 183
    iget-object v0, p1, Lq9;->x:Ljava/util/ArrayDeque;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    check-cast v0, Lp9;

    .line 190
    .line 191
    const-string v1, "FragmentManager"

    .line 192
    .line 193
    if-nez v0, :cond_4

    .line 194
    .line 195
    new-instance p1, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v0, "No permissions were requested for "

    .line 198
    .line 199
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    goto :goto_4

    .line 213
    :cond_4
    iget-object v0, v0, Lp9;->a:Ljava/lang/String;

    .line 214
    .line 215
    iget-object p1, p1, Lq9;->c:LN6;

    .line 216
    .line 217
    invoke-virtual {p1}, LN6;->f()V

    .line 218
    .line 219
    .line 220
    new-instance p1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    const-string v2, "Permission request result delivered for unknown Fragment "

    .line 223
    .line 224
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    :goto_4
    return-void

    .line 238
    nop

    .line 239
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
