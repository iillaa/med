.class public final LJ;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:I


# instance fields
.field public final a:Landroid/view/accessibility/AccessibilityNodeInfo;


# direct methods
.method public constructor <init>(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 5
    .line 6
    return-void
.end method

.method public static b(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    sparse-switch p0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    packed-switch p0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    packed-switch p0, :pswitch_data_1

    .line 14
    .line 15
    .line 16
    packed-switch p0, :pswitch_data_2

    .line 17
    .line 18
    .line 19
    const-string p0, "ACTION_UNKNOWN"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_0
    const-string p0, "ACTION_DRAG_CANCEL"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_1
    const-string p0, "ACTION_DRAG_DROP"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_2
    const-string p0, "ACTION_DRAG_START"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_3
    const-string p0, "ACTION_IME_ENTER"

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_4
    const-string p0, "ACTION_PRESS_AND_HOLD"

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_5
    const-string p0, "ACTION_PAGE_RIGHT"

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_6
    const-string p0, "ACTION_PAGE_LEFT"

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_7
    const-string p0, "ACTION_PAGE_DOWN"

    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_8
    const-string p0, "ACTION_PAGE_UP"

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_9
    const-string p0, "ACTION_HIDE_TOOLTIP"

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_a
    const-string p0, "ACTION_SHOW_TOOLTIP"

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_b
    const-string p0, "ACTION_SET_PROGRESS"

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_c
    const-string p0, "ACTION_CONTEXT_CLICK"

    .line 59
    .line 60
    return-object p0

    .line 61
    :pswitch_d
    const-string p0, "ACTION_SCROLL_RIGHT"

    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_e
    const-string p0, "ACTION_SCROLL_DOWN"

    .line 65
    .line 66
    return-object p0

    .line 67
    :pswitch_f
    const-string p0, "ACTION_SCROLL_LEFT"

    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_10
    const-string p0, "ACTION_SCROLL_UP"

    .line 71
    .line 72
    return-object p0

    .line 73
    :pswitch_11
    const-string p0, "ACTION_SCROLL_TO_POSITION"

    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_12
    const-string p0, "ACTION_SHOW_ON_SCREEN"

    .line 77
    .line 78
    return-object p0

    .line 79
    :sswitch_0
    const-string p0, "ACTION_SCROLL_IN_DIRECTION"

    .line 80
    .line 81
    return-object p0

    .line 82
    :sswitch_1
    const-string p0, "ACTION_MOVE_WINDOW"

    .line 83
    .line 84
    return-object p0

    .line 85
    :sswitch_2
    const-string p0, "ACTION_SET_TEXT"

    .line 86
    .line 87
    return-object p0

    .line 88
    :sswitch_3
    const-string p0, "ACTION_COLLAPSE"

    .line 89
    .line 90
    return-object p0

    .line 91
    :sswitch_4
    const-string p0, "ACTION_EXPAND"

    .line 92
    .line 93
    return-object p0

    .line 94
    :sswitch_5
    const-string p0, "ACTION_SET_SELECTION"

    .line 95
    .line 96
    return-object p0

    .line 97
    :sswitch_6
    const-string p0, "ACTION_CUT"

    .line 98
    .line 99
    return-object p0

    .line 100
    :sswitch_7
    const-string p0, "ACTION_PASTE"

    .line 101
    .line 102
    return-object p0

    .line 103
    :sswitch_8
    const-string p0, "ACTION_COPY"

    .line 104
    .line 105
    return-object p0

    .line 106
    :sswitch_9
    const-string p0, "ACTION_SCROLL_BACKWARD"

    .line 107
    .line 108
    return-object p0

    .line 109
    :sswitch_a
    const-string p0, "ACTION_SCROLL_FORWARD"

    .line 110
    .line 111
    return-object p0

    .line 112
    :sswitch_b
    const-string p0, "ACTION_PREVIOUS_HTML_ELEMENT"

    .line 113
    .line 114
    return-object p0

    .line 115
    :sswitch_c
    const-string p0, "ACTION_NEXT_HTML_ELEMENT"

    .line 116
    .line 117
    return-object p0

    .line 118
    :sswitch_d
    const-string p0, "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY"

    .line 119
    .line 120
    return-object p0

    .line 121
    :sswitch_e
    const-string p0, "ACTION_NEXT_AT_MOVEMENT_GRANULARITY"

    .line 122
    .line 123
    return-object p0

    .line 124
    :sswitch_f
    const-string p0, "ACTION_CLEAR_ACCESSIBILITY_FOCUS"

    .line 125
    .line 126
    return-object p0

    .line 127
    :sswitch_10
    const-string p0, "ACTION_ACCESSIBILITY_FOCUS"

    .line 128
    .line 129
    return-object p0

    .line 130
    :sswitch_11
    const-string p0, "ACTION_LONG_CLICK"

    .line 131
    .line 132
    return-object p0

    .line 133
    :sswitch_12
    const-string p0, "ACTION_CLICK"

    .line 134
    .line 135
    return-object p0

    .line 136
    :sswitch_13
    const-string p0, "ACTION_CLEAR_SELECTION"

    .line 137
    .line 138
    return-object p0

    .line 139
    :sswitch_14
    const-string p0, "ACTION_SELECT"

    .line 140
    .line 141
    return-object p0

    .line 142
    :cond_0
    const-string p0, "ACTION_CLEAR_FOCUS"

    .line 143
    .line 144
    return-object p0

    .line 145
    :cond_1
    const-string p0, "ACTION_FOCUS"

    .line 146
    .line 147
    return-object p0

    .line 148
    nop

    .line 149
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_14
        0x8 -> :sswitch_13
        0x10 -> :sswitch_12
        0x20 -> :sswitch_11
        0x40 -> :sswitch_10
        0x80 -> :sswitch_f
        0x100 -> :sswitch_e
        0x200 -> :sswitch_d
        0x400 -> :sswitch_c
        0x800 -> :sswitch_b
        0x1000 -> :sswitch_a
        0x2000 -> :sswitch_9
        0x4000 -> :sswitch_8
        0x8000 -> :sswitch_7
        0x10000 -> :sswitch_6
        0x20000 -> :sswitch_5
        0x40000 -> :sswitch_4
        0x80000 -> :sswitch_3
        0x200000 -> :sswitch_2
        0x1020042 -> :sswitch_1
        0x102005e -> :sswitch_0
    .end sparse-switch

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :pswitch_data_0
    .packed-switch 0x1020036
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    :pswitch_data_1
    .packed-switch 0x1020044
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    :pswitch_data_2
    .packed-switch 0x1020054
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2

    .line 1
    iget-object v0, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object v1
.end method

.method public final c(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const-string v2, "androidx.view.accessibility.AccessibilityNodeInfoCompat.BOOLEAN_PROPERTY_KEY"

    .line 12
    .line 13
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    and-int/2addr v0, p1

    .line 18
    if-ne v0, p1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    :cond_1
    return v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    instance-of v2, p1, LJ;

    .line 10
    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    return v1

    .line 14
    :cond_2
    check-cast p1, LJ;

    .line 15
    .line 16
    iget-object p1, p1, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 17
    .line 18
    iget-object v2, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 19
    .line 20
    if-nez v2, :cond_3

    .line 21
    .line 22
    if-eqz p1, :cond_4

    .line 23
    .line 24
    return v1

    .line 25
    :cond_3
    invoke-virtual {v2, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_4

    .line 30
    .line 31
    return v1

    .line 32
    :cond_4
    return v0
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :goto_0
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 15

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInParent(Landroid/graphics/Rect;)V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v4, "; boundsInParent: "

    .line 26
    .line 27
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v4, "; boundsInScreen: "

    .line 46
    .line 47
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 61
    .line 62
    const/16 v4, 0x22

    .line 63
    .line 64
    if-lt v3, v4, :cond_0

    .line 65
    .line 66
    invoke-static {v2, v1}, LI;->c(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const-string v5, "androidx.view.accessibility.AccessibilityNodeInfoCompat.BOUNDS_IN_WINDOW_KEY"

    .line 75
    .line 76
    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Landroid/graphics/Rect;

    .line 81
    .line 82
    if-eqz v3, :cond_1

    .line 83
    .line 84
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 85
    .line 86
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 87
    .line 88
    iget v7, v3, Landroid/graphics/Rect;->right:I

    .line 89
    .line 90
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 91
    .line 92
    invoke-virtual {v1, v5, v6, v7, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 93
    .line 94
    .line 95
    :cond_1
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v5, "; boundsInWindow: "

    .line 98
    .line 99
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, "; packageName: "

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v1, "; className: "

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, "; text: "

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v1, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY"

    .line 142
    .line 143
    invoke-virtual {p0, v1}, LJ;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    const/4 v5, 0x1

    .line 152
    xor-int/2addr v3, v5

    .line 153
    const/4 v6, 0x0

    .line 154
    if-eqz v3, :cond_2

    .line 155
    .line 156
    invoke-virtual {p0, v1}, LJ;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    const-string v3, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_END_KEY"

    .line 161
    .line 162
    invoke-virtual {p0, v3}, LJ;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    const-string v7, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_FLAGS_KEY"

    .line 167
    .line 168
    invoke-virtual {p0, v7}, LJ;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    const-string v8, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ID_KEY"

    .line 173
    .line 174
    invoke-virtual {p0, v8}, LJ;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 175
    .line 176
    .line 177
    move-result-object v8

    .line 178
    new-instance v9, Landroid/text/SpannableString;

    .line 179
    .line 180
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 185
    .line 186
    .line 187
    move-result-object v11

    .line 188
    invoke-interface {v11}, Ljava/lang/CharSequence;->length()I

    .line 189
    .line 190
    .line 191
    move-result v11

    .line 192
    invoke-static {v10, v6, v11}, Landroid/text/TextUtils;->substring(Ljava/lang/CharSequence;II)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v10

    .line 196
    invoke-direct {v9, v10}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    move v10, v6

    .line 200
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 201
    .line 202
    .line 203
    move-result v11

    .line 204
    if-ge v10, v11, :cond_3

    .line 205
    .line 206
    new-instance v11, Lv;

    .line 207
    .line 208
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v12

    .line 212
    check-cast v12, Ljava/lang/Integer;

    .line 213
    .line 214
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 215
    .line 216
    .line 217
    move-result v12

    .line 218
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 219
    .line 220
    .line 221
    move-result-object v13

    .line 222
    const-string v14, "androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ACTION_ID_KEY"

    .line 223
    .line 224
    invoke-virtual {v13, v14}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    move-result v13

    .line 228
    invoke-direct {v11, v12, p0, v13}, Lv;-><init>(ILJ;I)V

    .line 229
    .line 230
    .line 231
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v12

    .line 235
    check-cast v12, Ljava/lang/Integer;

    .line 236
    .line 237
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 238
    .line 239
    .line 240
    move-result v12

    .line 241
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v13

    .line 245
    check-cast v13, Ljava/lang/Integer;

    .line 246
    .line 247
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v13

    .line 251
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v14

    .line 255
    check-cast v14, Ljava/lang/Integer;

    .line 256
    .line 257
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 258
    .line 259
    .line 260
    move-result v14

    .line 261
    invoke-virtual {v9, v11, v12, v13, v14}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 262
    .line 263
    .line 264
    add-int/lit8 v10, v10, 0x1

    .line 265
    .line 266
    goto :goto_1

    .line 267
    :cond_2
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 268
    .line 269
    .line 270
    move-result-object v9

    .line 271
    :cond_3
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string v1, "; error: "

    .line 275
    .line 276
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getError()Ljava/lang/CharSequence;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    const-string v1, "; maxTextLength: "

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getMaxTextLength()I

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    const-string v1, "; stateDescription: "

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 304
    .line 305
    const/16 v3, 0x1e

    .line 306
    .line 307
    if-lt v1, v3, :cond_4

    .line 308
    .line 309
    invoke-static {v2}, LG;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    goto :goto_2

    .line 314
    :cond_4
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    const-string v7, "androidx.view.accessibility.AccessibilityNodeInfoCompat.STATE_DESCRIPTION_KEY"

    .line 319
    .line 320
    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 321
    .line 322
    .line 323
    move-result-object v3

    .line 324
    :goto_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v3, "; contentDescription: "

    .line 328
    .line 329
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    const-string v3, "; tooltipText: "

    .line 340
    .line 341
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    const/16 v3, 0x1c

    .line 345
    .line 346
    if-lt v1, v3, :cond_5

    .line 347
    .line 348
    invoke-static {v2}, Lz;->n(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    goto :goto_3

    .line 353
    :cond_5
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 354
    .line 355
    .line 356
    move-result-object v3

    .line 357
    const-string v7, "androidx.view.accessibility.AccessibilityNodeInfoCompat.TOOLTIP_TEXT_KEY"

    .line 358
    .line 359
    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    :goto_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    const-string v3, "; viewIdResName: "

    .line 367
    .line 368
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    const-string v3, "; uniqueId: "

    .line 379
    .line 380
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    const/16 v3, 0x21

    .line 384
    .line 385
    if-lt v1, v3, :cond_6

    .line 386
    .line 387
    invoke-static {v2}, LH;->b(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v7

    .line 391
    goto :goto_4

    .line 392
    :cond_6
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 393
    .line 394
    .line 395
    move-result-object v7

    .line 396
    const-string v8, "androidx.view.accessibility.AccessibilityNodeInfoCompat.UNIQUE_ID_KEY"

    .line 397
    .line 398
    invoke-virtual {v7, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v7

    .line 402
    :goto_4
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    const-string v7, "; checkable: "

    .line 406
    .line 407
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    .line 411
    .line 412
    .line 413
    move-result v7

    .line 414
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    const-string v7, "; checked: "

    .line 418
    .line 419
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    .line 423
    .line 424
    .line 425
    move-result v7

    .line 426
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    const-string v7, "; focusable: "

    .line 430
    .line 431
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocusable()Z

    .line 435
    .line 436
    .line 437
    move-result v7

    .line 438
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    const-string v7, "; focused: "

    .line 442
    .line 443
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    .line 447
    .line 448
    .line 449
    move-result v7

    .line 450
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 451
    .line 452
    .line 453
    const-string v7, "; selected: "

    .line 454
    .line 455
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isSelected()Z

    .line 459
    .line 460
    .line 461
    move-result v7

    .line 462
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    const-string v7, "; clickable: "

    .line 466
    .line 467
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    .line 471
    .line 472
    .line 473
    move-result v7

    .line 474
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    const-string v7, "; longClickable: "

    .line 478
    .line 479
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isLongClickable()Z

    .line 483
    .line 484
    .line 485
    move-result v7

    .line 486
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    const-string v7, "; contextClickable: "

    .line 490
    .line 491
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isContextClickable()Z

    .line 495
    .line 496
    .line 497
    move-result v7

    .line 498
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    const-string v7, "; enabled: "

    .line 502
    .line 503
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    .line 507
    .line 508
    .line 509
    move-result v7

    .line 510
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    const-string v7, "; password: "

    .line 514
    .line 515
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    .line 519
    .line 520
    .line 521
    move-result v7

    .line 522
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    new-instance v7, Ljava/lang/StringBuilder;

    .line 526
    .line 527
    const-string v8, "; scrollable: "

    .line 528
    .line 529
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isScrollable()Z

    .line 533
    .line 534
    .line 535
    move-result v8

    .line 536
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v7

    .line 543
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    const-string v7, "; containerTitle: "

    .line 547
    .line 548
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    if-lt v1, v4, :cond_7

    .line 552
    .line 553
    invoke-static {v2}, LI;->d(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;

    .line 554
    .line 555
    .line 556
    move-result-object v7

    .line 557
    goto :goto_5

    .line 558
    :cond_7
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getExtras()Landroid/os/Bundle;

    .line 559
    .line 560
    .line 561
    move-result-object v7

    .line 562
    const-string v8, "androidx.view.accessibility.AccessibilityNodeInfoCompat.CONTAINER_TITLE_KEY"

    .line 563
    .line 564
    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 565
    .line 566
    .line 567
    move-result-object v7

    .line 568
    :goto_5
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    const-string v7, "; granularScrollingSupported: "

    .line 572
    .line 573
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    const/high16 v7, 0x4000000

    .line 577
    .line 578
    invoke-virtual {p0, v7}, LJ;->c(I)Z

    .line 579
    .line 580
    .line 581
    move-result v7

    .line 582
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 583
    .line 584
    .line 585
    const-string v7, "; importantForAccessibility: "

    .line 586
    .line 587
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    .line 589
    .line 590
    const/16 v7, 0x18

    .line 591
    .line 592
    if-lt v1, v7, :cond_8

    .line 593
    .line 594
    invoke-static {v2}, Ly;->s(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 595
    .line 596
    .line 597
    move-result v7

    .line 598
    goto :goto_6

    .line 599
    :cond_8
    move v7, v5

    .line 600
    :goto_6
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    const-string v7, "; visible: "

    .line 604
    .line 605
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    .line 609
    .line 610
    .line 611
    move-result v7

    .line 612
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 613
    .line 614
    .line 615
    const-string v7, "; isTextSelectable: "

    .line 616
    .line 617
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 618
    .line 619
    .line 620
    if-lt v1, v3, :cond_9

    .line 621
    .line 622
    invoke-static {v2}, LH;->c(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 623
    .line 624
    .line 625
    move-result v3

    .line 626
    goto :goto_7

    .line 627
    :cond_9
    const/high16 v3, 0x800000

    .line 628
    .line 629
    invoke-virtual {p0, v3}, LJ;->c(I)Z

    .line 630
    .line 631
    .line 632
    move-result v3

    .line 633
    :goto_7
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 634
    .line 635
    .line 636
    const-string v3, "; accessibilityDataSensitive: "

    .line 637
    .line 638
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    if-lt v1, v4, :cond_a

    .line 642
    .line 643
    invoke-static {v2}, LI;->g(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 644
    .line 645
    .line 646
    move-result v1

    .line 647
    goto :goto_8

    .line 648
    :cond_a
    const/16 v1, 0x40

    .line 649
    .line 650
    invoke-virtual {p0, v1}, LJ;->c(I)Z

    .line 651
    .line 652
    .line 653
    move-result v1

    .line 654
    :goto_8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    const-string v1, "; ["

    .line 658
    .line 659
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    .line 663
    .line 664
    .line 665
    move-result-object v1

    .line 666
    new-instance v2, Ljava/util/ArrayList;

    .line 667
    .line 668
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 669
    .line 670
    .line 671
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 672
    .line 673
    .line 674
    move-result v3

    .line 675
    move v4, v6

    .line 676
    :goto_9
    if-ge v4, v3, :cond_b

    .line 677
    .line 678
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 679
    .line 680
    .line 681
    move-result-object v7

    .line 682
    new-instance v8, LF;

    .line 683
    .line 684
    const/4 v9, 0x0

    .line 685
    invoke-direct {v8, v7, v6, v9}, LF;-><init>(Ljava/lang/Object;ILjava/lang/Class;)V

    .line 686
    .line 687
    .line 688
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    add-int/lit8 v4, v4, 0x1

    .line 692
    .line 693
    goto :goto_9

    .line 694
    :cond_b
    :goto_a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 695
    .line 696
    .line 697
    move-result v1

    .line 698
    if-ge v6, v1, :cond_e

    .line 699
    .line 700
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 701
    .line 702
    .line 703
    move-result-object v1

    .line 704
    check-cast v1, LF;

    .line 705
    .line 706
    iget-object v3, v1, LF;->a:Ljava/lang/Object;

    .line 707
    .line 708
    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 709
    .line 710
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    .line 711
    .line 712
    .line 713
    move-result v3

    .line 714
    invoke-static {v3}, LJ;->b(I)Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object v3

    .line 718
    const-string v4, "ACTION_UNKNOWN"

    .line 719
    .line 720
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 721
    .line 722
    .line 723
    move-result v4

    .line 724
    if-eqz v4, :cond_c

    .line 725
    .line 726
    iget-object v1, v1, LF;->a:Ljava/lang/Object;

    .line 727
    .line 728
    move-object v4, v1

    .line 729
    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 730
    .line 731
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    .line 732
    .line 733
    .line 734
    move-result-object v4

    .line 735
    if-eqz v4, :cond_c

    .line 736
    .line 737
    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 738
    .line 739
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getLabel()Ljava/lang/CharSequence;

    .line 740
    .line 741
    .line 742
    move-result-object v1

    .line 743
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 744
    .line 745
    .line 746
    move-result-object v3

    .line 747
    :cond_c
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 748
    .line 749
    .line 750
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 751
    .line 752
    .line 753
    move-result v1

    .line 754
    sub-int/2addr v1, v5

    .line 755
    if-eq v6, v1, :cond_d

    .line 756
    .line 757
    const-string v1, ", "

    .line 758
    .line 759
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 760
    .line 761
    .line 762
    :cond_d
    add-int/lit8 v6, v6, 0x1

    .line 763
    .line 764
    goto :goto_a

    .line 765
    :cond_e
    const-string v1, "]"

    .line 766
    .line 767
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 768
    .line 769
    .line 770
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 771
    .line 772
    .line 773
    move-result-object v0

    .line 774
    return-object v0
.end method
