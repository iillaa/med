.class public Landroidx/profileinstaller/ProfileInstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "androidx.profileinstaller.action.INSTALL_PROFILE"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    new-instance p2, LBf;

    .line 17
    .line 18
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Li0;

    .line 22
    .line 23
    const/16 v1, 0x10

    .line 24
    .line 25
    invoke-direct {v0, v1, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {p1, p2, v0, v1}, LMk;->R(Landroid/content/Context;Ljava/util/concurrent/Executor;LCf;Z)V

    .line 30
    .line 31
    .line 32
    goto/16 :goto_3

    .line 33
    .line 34
    :cond_1
    const-string v1, "androidx.profileinstaller.action.SKIP_FILE"

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/16 v2, 0xa

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    if-eqz p2, :cond_9

    .line 50
    .line 51
    const-string v0, "EXTRA_SKIP_FILE_OPERATION"

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "WRITE_SKIP_FILE"

    .line 58
    .line 59
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    new-instance p2, Li0;

    .line 66
    .line 67
    const/16 v0, 0x10

    .line 68
    .line 69
    invoke-direct {p2, v0, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const/4 v4, 0x0

    .line 85
    :try_start_0
    invoke-virtual {v1, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {v0, p1}, LMk;->B(Landroid/content/pm/PackageInfo;Ljava/io/File;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, v2, v3}, LCf;->f(ILjava/io/Serializable;)V

    .line 97
    .line 98
    .line 99
    goto/16 :goto_3

    .line 100
    .line 101
    :catch_0
    move-exception p1

    .line 102
    const/4 v0, 0x7

    .line 103
    invoke-interface {p2, v0, p1}, LCf;->f(ILjava/io/Serializable;)V

    .line 104
    .line 105
    .line 106
    goto/16 :goto_3

    .line 107
    .line 108
    :cond_2
    const-string v0, "DELETE_SKIP_FILE"

    .line 109
    .line 110
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_9

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance p2, Ljava/io/File;

    .line 121
    .line 122
    const-string v0, "profileinstaller_profileWrittenFor_lastUpdateTime.dat"

    .line 123
    .line 124
    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 128
    .line 129
    .line 130
    const-string p1, "ProfileInstaller"

    .line 131
    .line 132
    const-string p2, "RESULT_DELETE_SKIP_FILE_SUCCESS"

    .line 133
    .line 134
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    const/16 p1, 0xb

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroid/content/BroadcastReceiver;->setResultCode(I)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_3

    .line 143
    .line 144
    :cond_3
    const-string v1, "androidx.profileinstaller.action.SAVE_PROFILE"

    .line 145
    .line 146
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    const/16 v4, 0x18

    .line 151
    .line 152
    if-eqz v1, :cond_5

    .line 153
    .line 154
    new-instance p1, Li0;

    .line 155
    .line 156
    const/16 p2, 0x10

    .line 157
    .line 158
    invoke-direct {p1, p2, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 162
    .line 163
    if-lt p2, v4, :cond_4

    .line 164
    .line 165
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    invoke-static {p2, v2}, Landroid/os/Process;->sendSignal(II)V

    .line 170
    .line 171
    .line 172
    const/16 p2, 0xc

    .line 173
    .line 174
    :goto_0
    invoke-virtual {p1, p2, v3}, Li0;->f(ILjava/io/Serializable;)V

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_4
    const/16 p2, 0xd

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_5
    const-string v1, "androidx.profileinstaller.action.BENCHMARK_OPERATION"

    .line 182
    .line 183
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_9

    .line 188
    .line 189
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    if-eqz p2, :cond_9

    .line 194
    .line 195
    const-string v0, "EXTRA_BENCHMARK_OPERATION"

    .line 196
    .line 197
    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    new-instance v0, Li0;

    .line 202
    .line 203
    const/16 v1, 0x10

    .line 204
    .line 205
    invoke-direct {v0, v1, p0}, Li0;-><init>(ILjava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    const-string v1, "DROP_SHADER_CACHE"

    .line 209
    .line 210
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-eqz p2, :cond_8

    .line 215
    .line 216
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 217
    .line 218
    if-lt p2, v4, :cond_6

    .line 219
    .line 220
    invoke-static {p1}, Ly;->b(Landroid/content/Context;)Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1}, Landroid/content/Context;->getCodeCacheDir()Ljava/io/File;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    goto :goto_1

    .line 229
    :cond_6
    invoke-virtual {p1}, Landroid/content/Context;->getCodeCacheDir()Ljava/io/File;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    :goto_1
    invoke-static {p1}, LSi;->o(Ljava/io/File;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_7

    .line 238
    .line 239
    const/16 p1, 0xe

    .line 240
    .line 241
    :goto_2
    invoke-virtual {v0, p1, v3}, Li0;->f(ILjava/io/Serializable;)V

    .line 242
    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_7
    const/16 p1, 0xf

    .line 246
    .line 247
    goto :goto_2

    .line 248
    :cond_8
    const/16 p1, 0x10

    .line 249
    .line 250
    invoke-virtual {v0, p1, v3}, Li0;->f(ILjava/io/Serializable;)V

    .line 251
    .line 252
    .line 253
    :cond_9
    :goto_3
    return-void
.end method
