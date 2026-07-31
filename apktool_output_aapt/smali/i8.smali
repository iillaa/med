.class public final Li8;
.super LSh;
.source "SourceFile"

# interfaces
.implements LO9;


# instance fields
.field public final synthetic g:I

.field public h:I

.field public synthetic i:LOb;

.field public synthetic j:LOb;

.field public final synthetic k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

.field public final synthetic l:Lcom/getcapacitor/PluginCall;


# direct methods
.method public synthetic constructor <init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;I)V
    .locals 0

    .line 1
    iput p4, p0, Li8;->g:I

    iput-object p1, p0, Li8;->k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    iput-object p2, p0, Li8;->l:Lcom/getcapacitor/PluginCall;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p3}, LSh;-><init>(ILr5;)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Li8;->g:I

    .line 2
    .line 3
    check-cast p1, LOb;

    .line 4
    .line 5
    check-cast p2, LOb;

    .line 6
    .line 7
    check-cast p3, Lr5;

    .line 8
    .line 9
    packed-switch v0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    new-instance v0, Li8;

    .line 13
    .line 14
    iget-object v1, p0, Li8;->k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 15
    .line 16
    iget-object v2, p0, Li8;->l:Lcom/getcapacitor/PluginCall;

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-direct {v0, v1, v2, p3, v3}, Li8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, v0, Li8;->i:LOb;

    .line 23
    .line 24
    iput-object p2, v0, Li8;->j:LOb;

    .line 25
    .line 26
    sget-object p1, Lfj;->a:Lfj;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Li8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    return-object p1

    .line 33
    :pswitch_0
    new-instance v0, Li8;

    .line 34
    .line 35
    iget-object v1, p0, Li8;->k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 36
    .line 37
    iget-object v2, p0, Li8;->l:Lcom/getcapacitor/PluginCall;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-direct {v0, v1, v2, p3, v3}, Li8;-><init>(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;Lcom/getcapacitor/PluginCall;Lr5;I)V

    .line 41
    .line 42
    .line 43
    iput-object p1, v0, Li8;->i:LOb;

    .line 44
    .line 45
    iput-object p2, v0, Li8;->j:LOb;

    .line 46
    .line 47
    sget-object p1, Lfj;->a:Lfj;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Li8;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    return-object p1

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Li8;->g:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object v0, Li6;->c:Li6;

    .line 7
    .line 8
    iget v1, p0, Li8;->h:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    if-ne v1, v3, :cond_0

    .line 15
    .line 16
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    check-cast p1, Lpg;

    .line 20
    .line 21
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 27
    .line 28
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p1

    .line 32
    :cond_1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Li8;->i:LOb;

    .line 36
    .line 37
    iget-object v1, p0, Li8;->j:LOb;

    .line 38
    .line 39
    iget-object v4, p0, Li8;->k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 40
    .line 41
    invoke-static {v4}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iput-object v2, p0, Li8;->i:LOb;

    .line 46
    .line 47
    iput v3, p0, Li8;->h:I

    .line 48
    .line 49
    invoke-virtual {v4, p1, v1, p0}, LHa;->g(Llc;Llc;Lr5;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-ne p1, v0, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    instance-of v0, p1, Log;

    .line 57
    .line 58
    xor-int/2addr v0, v3

    .line 59
    iget-object v1, p0, Li8;->l:Lcom/getcapacitor/PluginCall;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    move-object v0, p1

    .line 64
    check-cast v0, Landroid/net/Uri;

    .line 65
    .line 66
    const/4 v0, 0x3

    .line 67
    invoke-static {v1, v2, v0}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 68
    .line 69
    .line 70
    :cond_3
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v2, "getMethodName(...)"

    .line 81
    .line 82
    invoke-static {v2, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {v1, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    sget-object v0, Lfj;->a:Lfj;

    .line 93
    .line 94
    :goto_1
    return-object v0

    .line 95
    :pswitch_0
    sget-object v0, Li6;->c:Li6;

    .line 96
    .line 97
    iget v1, p0, Li8;->h:I

    .line 98
    .line 99
    const/4 v2, 0x1

    .line 100
    if-eqz v1, :cond_6

    .line 101
    .line 102
    if-ne v1, v2, :cond_5

    .line 103
    .line 104
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    check-cast p1, Lpg;

    .line 108
    .line 109
    iget-object p1, p1, Lpg;->c:Ljava/lang/Object;

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 113
    .line 114
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 115
    .line 116
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :cond_6
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Li8;->i:LOb;

    .line 124
    .line 125
    iget-object v1, p0, Li8;->j:LOb;

    .line 126
    .line 127
    iget-object v3, p0, Li8;->k:Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 128
    .line 129
    invoke-static {v3}, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;->access$getController(Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;)LHa;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    const/4 v4, 0x0

    .line 134
    iput-object v4, p0, Li8;->i:LOb;

    .line 135
    .line 136
    iput v2, p0, Li8;->h:I

    .line 137
    .line 138
    invoke-virtual {v3, p1, v1, p0}, LHa;->a(Llc;Llc;Lr5;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    if-ne p1, v0, :cond_7

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_7
    :goto_2
    instance-of v0, p1, Log;

    .line 146
    .line 147
    xor-int/2addr v0, v2

    .line 148
    iget-object v1, p0, Li8;->l:Lcom/getcapacitor/PluginCall;

    .line 149
    .line 150
    if-eqz v0, :cond_8

    .line 151
    .line 152
    move-object v0, p1

    .line 153
    check-cast v0, Landroid/net/Uri;

    .line 154
    .line 155
    invoke-static {v0}, LSi;->m(Landroid/net/Uri;)Lcom/getcapacitor/JSObject;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const/4 v2, 0x2

    .line 160
    invoke-static {v1, v0, v2}, Llc;->J(Lcom/getcapacitor/PluginCall;Lcom/getcapacitor/JSObject;I)V

    .line 161
    .line 162
    .line 163
    :cond_8
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    if-eqz p1, :cond_9

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/getcapacitor/PluginCall;->getMethodName()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v2, "getMethodName(...)"

    .line 174
    .line 175
    invoke-static {v2, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    invoke-static {v0, p1}, Lu6;->C(Ljava/lang/String;Ljava/lang/Throwable;)Lf8;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-static {v1, p1}, Llc;->I(Lcom/getcapacitor/PluginCall;Lf8;)V

    .line 183
    .line 184
    .line 185
    :cond_9
    sget-object v0, Lfj;->a:Lfj;

    .line 186
    .line 187
    :goto_3
    return-object v0

    .line 188
    nop

    .line 189
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
