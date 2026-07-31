.class public final Ltf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/text/TextPaint;

.field public final b:Landroid/text/TextDirectionHeuristic;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Landroid/text/PrecomputedText$Params;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lz;->i(Landroid/text/PrecomputedText$Params;)Landroid/text/TextPaint;

    move-result-object v0

    iput-object v0, p0, Ltf;->a:Landroid/text/TextPaint;

    invoke-static {p1}, Lz;->h(Landroid/text/PrecomputedText$Params;)Landroid/text/TextDirectionHeuristic;

    move-result-object v0

    iput-object v0, p0, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    invoke-static {p1}, Lz;->a(Landroid/text/PrecomputedText$Params;)I

    move-result v0

    iput v0, p0, Ltf;->c:I

    invoke-static {p1}, Lz;->x(Landroid/text/PrecomputedText$Params;)I

    move-result p1

    iput p1, p0, Ltf;->d:I

    return-void
.end method

.method public constructor <init>(Landroid/text/TextPaint;Landroid/text/TextDirectionHeuristic;II)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    invoke-static {p1}, Lz;->g(Landroid/text/TextPaint;)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object v0

    invoke-static {v0, p3}, Lz;->e(Landroid/text/PrecomputedText$Params$Builder;I)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object v0

    invoke-static {v0, p4}, Lz;->y(Landroid/text/PrecomputedText$Params$Builder;I)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object v0

    invoke-static {v0, p2}, Lz;->f(Landroid/text/PrecomputedText$Params$Builder;Landroid/text/TextDirectionHeuristic;)Landroid/text/PrecomputedText$Params$Builder;

    move-result-object v0

    invoke-static {v0}, Lz;->q(Landroid/text/PrecomputedText$Params$Builder;)V

    :cond_0
    iput-object p1, p0, Ltf;->a:Landroid/text/TextPaint;

    iput-object p2, p0, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    iput p3, p0, Ltf;->c:I

    iput p4, p0, Ltf;->d:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ltf;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ltf;

    .line 12
    .line 13
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 14
    .line 15
    iget v3, p1, Ltf;->c:I

    .line 16
    .line 17
    iget v4, p0, Ltf;->c:I

    .line 18
    .line 19
    if-eq v4, v3, :cond_2

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_2
    iget v3, p0, Ltf;->d:I

    .line 24
    .line 25
    iget v4, p1, Ltf;->d:I

    .line 26
    .line 27
    if-eq v3, v4, :cond_3

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_3
    iget-object v3, p0, Ltf;->a:Landroid/text/TextPaint;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    iget-object v5, p1, Ltf;->a:Landroid/text/TextPaint;

    .line 38
    .line 39
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTextSize()F

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    cmpl-float v4, v4, v6

    .line 44
    .line 45
    if-eqz v4, :cond_4

    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :cond_4
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    cmpl-float v4, v4, v6

    .line 58
    .line 59
    if-eqz v4, :cond_5

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_5
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSkewX()F

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTextSkewX()F

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    cmpl-float v4, v4, v6

    .line 72
    .line 73
    if-eqz v4, :cond_6

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_6
    invoke-virtual {v3}, Landroid/graphics/Paint;->getLetterSpacing()F

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    invoke-virtual {v5}, Landroid/graphics/Paint;->getLetterSpacing()F

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    cmpl-float v4, v4, v6

    .line 85
    .line 86
    if-eqz v4, :cond_7

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_7
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFontFeatureSettings()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v5}, Landroid/graphics/Paint;->getFontFeatureSettings()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_8

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_8
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFlags()I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    invoke-virtual {v5}, Landroid/graphics/Paint;->getFlags()I

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-eq v4, v6, :cond_9

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_9
    const/16 v4, 0x18

    .line 116
    .line 117
    if-lt v1, v4, :cond_a

    .line 118
    .line 119
    invoke-static {v3}, Ly;->e(Landroid/text/TextPaint;)Landroid/os/LocaleList;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v5}, Ly;->e(Landroid/text/TextPaint;)Landroid/os/LocaleList;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-static {v4, v1}, Ly;->t(Ljava/lang/Object;Landroid/os/LocaleList;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-nez v1, :cond_b

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextLocale()Ljava/util/Locale;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTextLocale()Ljava/util/Locale;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {v1, v4}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-nez v1, :cond_b

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_b
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    if-nez v1, :cond_c

    .line 154
    .line 155
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    if-eqz v1, :cond_d

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_c
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v5}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    invoke-virtual {v1, v3}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_d

    .line 175
    .line 176
    :goto_0
    return v2

    .line 177
    :cond_d
    iget-object v1, p0, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    .line 178
    .line 179
    iget-object p1, p1, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    .line 180
    .line 181
    if-ne v1, p1, :cond_e

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_e
    move v0, v2

    .line 185
    :goto_1
    return v0
.end method

.method public final hashCode()I
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v4, 0x7

    .line 4
    const/4 v5, 0x6

    .line 5
    const/4 v6, 0x5

    .line 6
    const/4 v7, 0x4

    .line 7
    const/4 v8, 0x3

    .line 8
    const/4 v9, 0x2

    .line 9
    const/4 v10, 0x1

    .line 10
    const/4 v11, 0x0

    .line 11
    const/16 v12, 0xb

    .line 12
    .line 13
    iget-object v13, v0, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    .line 14
    .line 15
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const/16 v15, 0x18

    .line 18
    .line 19
    iget v1, v0, Ltf;->d:I

    .line 20
    .line 21
    iget v2, v0, Ltf;->c:I

    .line 22
    .line 23
    iget-object v3, v0, Ltf;->a:Landroid/text/TextPaint;

    .line 24
    .line 25
    if-lt v14, v15, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    .line 28
    .line 29
    .line 30
    move-result v14

    .line 31
    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 32
    .line 33
    .line 34
    move-result-object v14

    .line 35
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 36
    .line 37
    .line 38
    move-result v15

    .line 39
    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 40
    .line 41
    .line 42
    move-result-object v15

    .line 43
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSkewX()F

    .line 44
    .line 45
    .line 46
    move-result v16

    .line 47
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 48
    .line 49
    .line 50
    move-result-object v16

    .line 51
    invoke-virtual {v3}, Landroid/graphics/Paint;->getLetterSpacing()F

    .line 52
    .line 53
    .line 54
    move-result v17

    .line 55
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 56
    .line 57
    .line 58
    move-result-object v17

    .line 59
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFlags()I

    .line 60
    .line 61
    .line 62
    move-result v18

    .line 63
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v18

    .line 67
    invoke-static {v3}, Ly;->e(Landroid/text/TextPaint;)Landroid/os/LocaleList;

    .line 68
    .line 69
    .line 70
    move-result-object v19

    .line 71
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 72
    .line 73
    .line 74
    move-result-object v20

    .line 75
    invoke-virtual {v3}, Landroid/graphics/Paint;->isElegantTextHeight()Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    new-array v12, v12, [Ljava/lang/Object;

    .line 92
    .line 93
    aput-object v14, v12, v11

    .line 94
    .line 95
    aput-object v15, v12, v10

    .line 96
    .line 97
    aput-object v16, v12, v9

    .line 98
    .line 99
    aput-object v17, v12, v8

    .line 100
    .line 101
    aput-object v18, v12, v7

    .line 102
    .line 103
    aput-object v19, v12, v6

    .line 104
    .line 105
    aput-object v20, v12, v5

    .line 106
    .line 107
    aput-object v3, v12, v4

    .line 108
    .line 109
    const/16 v3, 0x8

    .line 110
    .line 111
    aput-object v13, v12, v3

    .line 112
    .line 113
    const/16 v3, 0x9

    .line 114
    .line 115
    aput-object v2, v12, v3

    .line 116
    .line 117
    const/16 v2, 0xa

    .line 118
    .line 119
    aput-object v1, v12, v2

    .line 120
    .line 121
    invoke-static {v12}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    return v1

    .line 126
    :cond_0
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    .line 127
    .line 128
    .line 129
    move-result v14

    .line 130
    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 131
    .line 132
    .line 133
    move-result-object v14

    .line 134
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 135
    .line 136
    .line 137
    move-result v15

    .line 138
    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 139
    .line 140
    .line 141
    move-result-object v15

    .line 142
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSkewX()F

    .line 143
    .line 144
    .line 145
    move-result v16

    .line 146
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 147
    .line 148
    .line 149
    move-result-object v16

    .line 150
    invoke-virtual {v3}, Landroid/graphics/Paint;->getLetterSpacing()F

    .line 151
    .line 152
    .line 153
    move-result v17

    .line 154
    invoke-static/range {v17 .. v17}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 155
    .line 156
    .line 157
    move-result-object v17

    .line 158
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFlags()I

    .line 159
    .line 160
    .line 161
    move-result v18

    .line 162
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v18

    .line 166
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextLocale()Ljava/util/Locale;

    .line 167
    .line 168
    .line 169
    move-result-object v19

    .line 170
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 171
    .line 172
    .line 173
    move-result-object v20

    .line 174
    invoke-virtual {v3}, Landroid/graphics/Paint;->isElegantTextHeight()Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    new-array v12, v12, [Ljava/lang/Object;

    .line 191
    .line 192
    aput-object v14, v12, v11

    .line 193
    .line 194
    aput-object v15, v12, v10

    .line 195
    .line 196
    aput-object v16, v12, v9

    .line 197
    .line 198
    aput-object v17, v12, v8

    .line 199
    .line 200
    aput-object v18, v12, v7

    .line 201
    .line 202
    aput-object v19, v12, v6

    .line 203
    .line 204
    aput-object v20, v12, v5

    .line 205
    .line 206
    aput-object v3, v12, v4

    .line 207
    .line 208
    const/16 v3, 0x8

    .line 209
    .line 210
    aput-object v13, v12, v3

    .line 211
    .line 212
    const/16 v3, 0x9

    .line 213
    .line 214
    aput-object v2, v12, v3

    .line 215
    .line 216
    const/16 v2, 0xa

    .line 217
    .line 218
    aput-object v1, v12, v2

    .line 219
    .line 220
    invoke-static {v12}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    return v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "textSize="

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ltf;->a:Landroid/text/TextPaint;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextSize()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, ", textScaleX="

    .line 34
    .line 35
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v3, ", textSkewX="

    .line 55
    .line 56
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextSkewX()F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 74
    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v4, ", letterSpacing="

    .line 78
    .line 79
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Landroid/graphics/Paint;->getLetterSpacing()F

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    new-instance v3, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v4, ", elegantTextHeight="

    .line 99
    .line 100
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/graphics/Paint;->isElegantTextHeight()Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const/16 v3, 0x18

    .line 118
    .line 119
    const-string v4, ", textLocale="

    .line 120
    .line 121
    if-lt v1, v3, :cond_0

    .line 122
    .line 123
    new-instance v3, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v2}, Ly;->e(Landroid/text/TextPaint;)Landroid/os/LocaleList;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextLocale()Ljava/util/Locale;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    goto :goto_0

    .line 153
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v4, ", typeface="

    .line 156
    .line 157
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const/16 v3, 0x1a

    .line 175
    .line 176
    if-lt v1, v3, :cond_1

    .line 177
    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    const-string v3, ", variationSettings="

    .line 181
    .line 182
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v2}, LE;->j(Landroid/text/TextPaint;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string v2, ", textDir="

    .line 202
    .line 203
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object v2, p0, Ltf;->b:Landroid/text/TextDirectionHeuristic;

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    const-string v2, ", breakStrategy="

    .line 221
    .line 222
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iget v2, p0, Ltf;->c:I

    .line 226
    .line 227
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    const-string v2, ", hyphenationFrequency="

    .line 240
    .line 241
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    iget v2, p0, Ltf;->d:I

    .line 245
    .line 246
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    const-string v1, "}"

    .line 257
    .line 258
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    return-object v0
.end method
