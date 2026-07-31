.class public final Lu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lu0;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lu0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroidx/versionedparcelable/ParcelImpl;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Landroidx/versionedparcelable/ParcelImpl;-><init>(Landroid/os/Parcel;)V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_0
    new-instance v0, LCe;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, v0, LCe;->a:I

    .line 22
    .line 23
    return-object v0

    .line 24
    :pswitch_1
    const-string v0, "inParcel"

    .line 25
    .line 26
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Lkc;

    .line 30
    .line 31
    const-class v1, Landroid/content/IntentSender;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Llc;->e(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    check-cast v1, Landroid/content/IntentSender;

    .line 45
    .line 46
    const-class v2, Landroid/content/Intent;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Landroid/content/Intent;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-direct {v0, v1, v2, v3, p1}, Lkc;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    .line 67
    .line 68
    .line 69
    return-object v0

    .line 70
    :pswitch_2
    new-instance v0, Lv9;

    .line 71
    .line 72
    invoke-direct {v0, p1}, Lv9;-><init>(Landroid/os/Parcel;)V

    .line 73
    .line 74
    .line 75
    return-object v0

    .line 76
    :pswitch_3
    new-instance v0, Ls9;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    iput-object v1, v0, Ls9;->e:Ljava/lang/String;

    .line 83
    .line 84
    new-instance v1, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v1, v0, Ls9;->f:Ljava/util/ArrayList;

    .line 90
    .line 91
    new-instance v1, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v1, v0, Ls9;->g:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Ls9;->a:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Ls9;->b:Ljava/util/ArrayList;

    .line 109
    .line 110
    sget-object v1, Lm3;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, [Lm3;

    .line 117
    .line 118
    iput-object v1, v0, Ls9;->c:[Lm3;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    iput v1, v0, Ls9;->d:I

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Ls9;->e:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iput-object v1, v0, Ls9;->f:Ljava/util/ArrayList;

    .line 137
    .line 138
    sget-object v1, Ln3;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 139
    .line 140
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v0, Ls9;->g:Ljava/util/ArrayList;

    .line 145
    .line 146
    sget-object v1, Lp9;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 147
    .line 148
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, v0, Ls9;->h:Ljava/util/ArrayList;

    .line 153
    .line 154
    return-object v0

    .line 155
    :pswitch_4
    new-instance v0, Lp9;

    .line 156
    .line 157
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iput-object v1, v0, Lp9;->a:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, v0, Lp9;->b:I

    .line 171
    .line 172
    return-object v0

    .line 173
    :pswitch_5
    new-instance v0, Ln3;

    .line 174
    .line 175
    invoke-direct {v0, p1}, Ln3;-><init>(Landroid/os/Parcel;)V

    .line 176
    .line 177
    .line 178
    return-object v0

    .line 179
    :pswitch_6
    new-instance v0, Lm3;

    .line 180
    .line 181
    invoke-direct {v0, p1}, Lm3;-><init>(Landroid/os/Parcel;)V

    .line 182
    .line 183
    .line 184
    return-object v0

    .line 185
    :pswitch_7
    new-instance v0, Lo2;

    .line 186
    .line 187
    invoke-direct {v0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_0

    .line 195
    .line 196
    const/4 p1, 0x1

    .line 197
    goto :goto_0

    .line 198
    :cond_0
    const/4 p1, 0x0

    .line 199
    :goto_0
    iput-boolean p1, v0, Lo2;->a:Z

    .line 200
    .line 201
    return-object v0

    .line 202
    :pswitch_8
    const-string v0, "parcel"

    .line 203
    .line 204
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    new-instance v0, Lv0;

    .line 208
    .line 209
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-nez v2, :cond_1

    .line 218
    .line 219
    const/4 p1, 0x0

    .line 220
    goto :goto_1

    .line 221
    :cond_1
    sget-object v2, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 222
    .line 223
    invoke-interface {v2, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    check-cast p1, Landroid/content/Intent;

    .line 228
    .line 229
    :goto_1
    invoke-direct {v0, v1, p1}, Lv0;-><init>(ILandroid/content/Intent;)V

    .line 230
    .line 231
    .line 232
    return-object v0

    .line 233
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lu0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p1, p1, [Landroidx/versionedparcelable/ParcelImpl;

    .line 7
    .line 8
    return-object p1

    .line 9
    :pswitch_0
    new-array p1, p1, [LCe;

    .line 10
    .line 11
    return-object p1

    .line 12
    :pswitch_1
    new-array p1, p1, [Lkc;

    .line 13
    .line 14
    return-object p1

    .line 15
    :pswitch_2
    new-array p1, p1, [Lv9;

    .line 16
    .line 17
    return-object p1

    .line 18
    :pswitch_3
    new-array p1, p1, [Ls9;

    .line 19
    .line 20
    return-object p1

    .line 21
    :pswitch_4
    new-array p1, p1, [Lp9;

    .line 22
    .line 23
    return-object p1

    .line 24
    :pswitch_5
    new-array p1, p1, [Ln3;

    .line 25
    .line 26
    return-object p1

    .line 27
    :pswitch_6
    new-array p1, p1, [Lm3;

    .line 28
    .line 29
    return-object p1

    .line 30
    :pswitch_7
    new-array p1, p1, [Lo2;

    .line 31
    .line 32
    return-object p1

    .line 33
    :pswitch_8
    new-array p1, p1, [Lv0;

    .line 34
    .line 35
    return-object p1

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
