.class public final Lf2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lf2;->c:I

    iput-object p2, p0, Lf2;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 4

    .line 1
    iget-object v0, p0, Lf2;->d:Ljava/lang/Object;

    .line 2
    .line 3
    iget v1, p0, Lf2;->c:I

    .line 4
    .line 5
    packed-switch v1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast v0, Lvh;

    .line 9
    .line 10
    invoke-virtual {v0}, Lvh;->b()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    iget-object v1, v0, Lvh;->k:Lge;

    .line 17
    .line 18
    iget-boolean v1, v1, Lnd;->z:Z

    .line 19
    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    iget-object v1, v0, Lvh;->p:Landroid/view/View;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, v0, Lvh;->k:Lge;

    .line 34
    .line 35
    invoke-virtual {v0}, Lnd;->f()V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lvh;->dismiss()V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_1
    return-void

    .line 43
    :pswitch_0
    check-cast v0, LW3;

    .line 44
    .line 45
    invoke-virtual {v0}, LW3;->b()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_5

    .line 50
    .line 51
    iget-object v1, v0, LW3;->k:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-lez v2, :cond_5

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, LV3;

    .line 65
    .line 66
    iget-object v2, v2, LV3;->a:Lge;

    .line 67
    .line 68
    iget-boolean v2, v2, Lnd;->z:Z

    .line 69
    .line 70
    if-nez v2, :cond_5

    .line 71
    .line 72
    iget-object v2, v0, LW3;->r:Landroid/view/View;

    .line 73
    .line 74
    if-eqz v2, :cond_4

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-nez v2, :cond_3

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_5

    .line 92
    .line 93
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, LV3;

    .line 98
    .line 99
    iget-object v1, v1, LV3;->a:Lge;

    .line 100
    .line 101
    invoke-virtual {v1}, Lnd;->f()V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_4
    :goto_3
    invoke-virtual {v0}, LW3;->dismiss()V

    .line 106
    .line 107
    .line 108
    :cond_5
    return-void

    .line 109
    :pswitch_1
    check-cast v0, Ln2;

    .line 110
    .line 111
    iget-object v1, v0, Ln2;->I:Lq2;

    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 114
    .line 115
    .line 116
    sget-object v2, LLj;->a:Ljava/util/WeakHashMap;

    .line 117
    .line 118
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_6

    .line 123
    .line 124
    iget-object v2, v0, Ln2;->G:Landroid/graphics/Rect;

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_6

    .line 131
    .line 132
    invoke-virtual {v0}, Ln2;->q()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Lnd;->f()V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_6
    invoke-virtual {v0}, Lnd;->dismiss()V

    .line 140
    .line 141
    .line 142
    :goto_4
    return-void

    .line 143
    :pswitch_2
    check-cast v0, Lq2;

    .line 144
    .line 145
    invoke-virtual {v0}, Lq2;->getInternalPopup()Lp2;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-interface {v1}, Lp2;->b()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-nez v1, :cond_7

    .line 154
    .line 155
    invoke-static {v0}, Lh2;->b(Landroid/view/View;)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    invoke-static {v0}, Lh2;->a(Landroid/view/View;)I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    iget-object v3, v0, Lq2;->h:Lp2;

    .line 164
    .line 165
    invoke-interface {v3, v1, v2}, Lp2;->e(II)V

    .line 166
    .line 167
    .line 168
    :cond_7
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    if-eqz v0, :cond_8

    .line 173
    .line 174
    invoke-static {v0, p0}, Lg2;->a(Landroid/view/ViewTreeObserver;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 175
    .line 176
    .line 177
    :cond_8
    return-void

    .line 178
    nop

    .line 179
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
