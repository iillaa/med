.class public final Lj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lj3;->c:I

    iput-object p2, p0, Lj3;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Li0;I)V
    .locals 0

    const/4 p2, 0x1

    iput p2, p0, Lj3;->c:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj3;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    iget-object v4, v1, Lj3;->d:Ljava/lang/Object;

    .line 7
    .line 8
    iget v5, v1, Lj3;->c:I

    .line 9
    .line 10
    packed-switch v5, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    check-cast v4, LEi;

    .line 14
    .line 15
    iget-object v2, v4, LEi;->b:Landroid/view/Window$Callback;

    .line 16
    .line 17
    invoke-virtual {v4}, LEi;->p()Landroid/view/Menu;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    instance-of v5, v4, LMd;

    .line 22
    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    move-object v5, v4

    .line 26
    check-cast v5, LMd;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object v5, v0

    .line 30
    :goto_0
    if-eqz v5, :cond_1

    .line 31
    .line 32
    invoke-virtual {v5}, LMd;->w()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :try_start_0
    invoke-interface {v4}, Landroid/view/Menu;->clear()V

    .line 36
    .line 37
    .line 38
    invoke-interface {v2, v3, v4}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-eqz v6, :cond_2

    .line 43
    .line 44
    invoke-interface {v2, v3, v0, v4}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_3

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    :goto_1
    invoke-interface {v4}, Landroid/view/Menu;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    .line 56
    :cond_3
    if-eqz v5, :cond_4

    .line 57
    .line 58
    invoke-virtual {v5}, LMd;->v()V

    .line 59
    .line 60
    .line 61
    :cond_4
    return-void

    .line 62
    :goto_2
    if-eqz v5, :cond_5

    .line 63
    .line 64
    invoke-virtual {v5}, LMd;->v()V

    .line 65
    .line 66
    .line 67
    :cond_5
    throw v0

    .line 68
    :pswitch_0
    check-cast v4, Landroidx/appcompat/widget/Toolbar;

    .line 69
    .line 70
    invoke-virtual {v4}, Landroidx/appcompat/widget/Toolbar;->v()Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_1
    check-cast v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    .line 75
    .line 76
    iput-boolean v3, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->b:Z

    .line 77
    .line 78
    iput-boolean v2, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->c:Z

    .line 79
    .line 80
    iget-object v0, v4, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->a:Lxe;

    .line 81
    .line 82
    check-cast v0, Li0;

    .line 83
    .line 84
    iget-object v0, v0, Li0;->d:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v0, Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 87
    .line 88
    iget-object v0, v0, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setNetworkAvailable(Z)V

    .line 93
    .line 94
    .line 95
    :cond_6
    return-void

    .line 96
    :pswitch_2
    check-cast v4, Lq9;

    .line 97
    .line 98
    invoke-virtual {v4, v2}, Lq9;->f(Z)Z

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :pswitch_3
    check-cast v4, Ld7;

    .line 103
    .line 104
    iput-object v0, v4, Ld7;->n:Lj3;

    .line 105
    .line 106
    invoke-virtual {v4}, Ld7;->drawableStateChanged()V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :pswitch_4
    check-cast v4, LY0;

    .line 111
    .line 112
    invoke-virtual {v4, v2}, LY0;->a(Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_5
    check-cast v4, Li0;

    .line 120
    .line 121
    iget-object v0, v4, Li0;->d:Ljava/lang/Object;

    .line 122
    .line 123
    return-void

    .line 124
    :pswitch_6
    check-cast v4, Lod;

    .line 125
    .line 126
    iget-boolean v0, v4, Lod;->q:Z

    .line 127
    .line 128
    if-nez v0, :cond_7

    .line 129
    .line 130
    goto/16 :goto_4

    .line 131
    .line 132
    :cond_7
    iget-boolean v0, v4, Lod;->o:Z

    .line 133
    .line 134
    iget-object v2, v4, Lod;->c:Li3;

    .line 135
    .line 136
    if-eqz v0, :cond_8

    .line 137
    .line 138
    iput-boolean v3, v4, Lod;->o:Z

    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 144
    .line 145
    .line 146
    move-result-wide v5

    .line 147
    iput-wide v5, v2, Li3;->e:J

    .line 148
    .line 149
    const-wide/16 v7, -0x1

    .line 150
    .line 151
    iput-wide v7, v2, Li3;->g:J

    .line 152
    .line 153
    iput-wide v5, v2, Li3;->f:J

    .line 154
    .line 155
    const/high16 v0, 0x3f000000    # 0.5f

    .line 156
    .line 157
    iput v0, v2, Li3;->h:F

    .line 158
    .line 159
    :cond_8
    iget-wide v5, v2, Li3;->g:J

    .line 160
    .line 161
    const-wide/16 v7, 0x0

    .line 162
    .line 163
    cmp-long v0, v5, v7

    .line 164
    .line 165
    if-lez v0, :cond_9

    .line 166
    .line 167
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 168
    .line 169
    .line 170
    move-result-wide v5

    .line 171
    iget-wide v9, v2, Li3;->g:J

    .line 172
    .line 173
    iget v0, v2, Li3;->i:I

    .line 174
    .line 175
    int-to-long v11, v0

    .line 176
    add-long/2addr v9, v11

    .line 177
    cmp-long v0, v5, v9

    .line 178
    .line 179
    if-lez v0, :cond_9

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_9
    invoke-virtual {v4}, Lod;->e()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_a

    .line 187
    .line 188
    :goto_3
    iput-boolean v3, v4, Lod;->q:Z

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_a
    iget-boolean v0, v4, Lod;->p:Z

    .line 192
    .line 193
    iget-object v5, v4, Lod;->e:Landroid/view/View;

    .line 194
    .line 195
    if-eqz v0, :cond_b

    .line 196
    .line 197
    iput-boolean v3, v4, Lod;->p:Z

    .line 198
    .line 199
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 200
    .line 201
    .line 202
    move-result-wide v11

    .line 203
    const/4 v15, 0x0

    .line 204
    const/16 v16, 0x0

    .line 205
    .line 206
    const/4 v13, 0x3

    .line 207
    const/4 v14, 0x0

    .line 208
    move-wide v9, v11

    .line 209
    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v5, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 217
    .line 218
    .line 219
    :cond_b
    iget-wide v9, v2, Li3;->f:J

    .line 220
    .line 221
    cmp-long v0, v9, v7

    .line 222
    .line 223
    if-eqz v0, :cond_c

    .line 224
    .line 225
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 226
    .line 227
    .line 228
    move-result-wide v6

    .line 229
    invoke-virtual {v2, v6, v7}, Li3;->a(J)F

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    const/high16 v3, -0x3f800000    # -4.0f

    .line 234
    .line 235
    mul-float/2addr v3, v0

    .line 236
    mul-float/2addr v3, v0

    .line 237
    const/high16 v8, 0x40800000    # 4.0f

    .line 238
    .line 239
    mul-float/2addr v0, v8

    .line 240
    add-float/2addr v0, v3

    .line 241
    iget-wide v8, v2, Li3;->f:J

    .line 242
    .line 243
    sub-long v8, v6, v8

    .line 244
    .line 245
    iput-wide v6, v2, Li3;->f:J

    .line 246
    .line 247
    long-to-float v3, v8

    .line 248
    mul-float/2addr v3, v0

    .line 249
    iget v0, v2, Li3;->d:F

    .line 250
    .line 251
    mul-float/2addr v3, v0

    .line 252
    float-to-int v0, v3

    .line 253
    iget-object v2, v4, Lod;->s:Landroid/widget/ListView;

    .line 254
    .line 255
    invoke-virtual {v2, v0}, Landroid/widget/AbsListView;->scrollListBy(I)V

    .line 256
    .line 257
    .line 258
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 259
    .line 260
    invoke-virtual {v5, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 261
    .line 262
    .line 263
    :goto_4
    return-void

    .line 264
    :cond_c
    new-instance v0, Ljava/lang/RuntimeException;

    .line 265
    .line 266
    const-string v2, "Cannot compute scroll delta before calling start()"

    .line 267
    .line 268
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    throw v0

    .line 272
    nop

    .line 273
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
