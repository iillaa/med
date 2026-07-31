.class public final LV2;
.super LNe;
.source "SourceFile"


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/capacitorjs/plugins/app/AppPlugin;Z)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LV2;->d:I

    .line 2
    iput-object p1, p0, LV2;->e:Ljava/lang/Object;

    invoke-direct {p0, p2}, LNe;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Lq9;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LV2;->d:I

    .line 1
    iput-object p1, p0, LV2;->e:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, LNe;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget v0, p0, LV2;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LV2;->e:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lq9;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lq9;->f(Z)Z

    .line 12
    .line 13
    .line 14
    iget-object v2, v0, Lq9;->g:LV2;

    .line 15
    .line 16
    iget-boolean v2, v2, LNe;->a:Z

    .line 17
    .line 18
    if-eqz v2, :cond_4

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Lq9;->f(Z)Z

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lq9;->e(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v2, v0, Lq9;->B:Ljava/util/ArrayList;

    .line 28
    .line 29
    iget-object v3, v0, Lq9;->C:Ljava/util/ArrayList;

    .line 30
    .line 31
    iget-object v4, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-eqz v4, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v4, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    sub-int/2addr v4, v1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    const/4 v4, -0x1

    .line 51
    :goto_1
    if-gez v4, :cond_2

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_2
    iget-object v5, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    sub-int/2addr v5, v1

    .line 61
    :goto_2
    if-lt v5, v4, :cond_3

    .line 62
    .line 63
    iget-object v6, v0, Lq9;->d:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Ll3;

    .line 70
    .line 71
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    add-int/lit8 v5, v5, -0x1

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    iput-boolean v1, v0, Lq9;->b:Z

    .line 83
    .line 84
    :try_start_0
    iget-object v1, v0, Lq9;->B:Ljava/util/ArrayList;

    .line 85
    .line 86
    iget-object v2, v0, Lq9;->C:Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lq9;->j(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Lq9;->a()V

    .line 92
    .line 93
    .line 94
    :goto_3
    invoke-virtual {v0}, Lq9;->k()V

    .line 95
    .line 96
    .line 97
    iget-object v0, v0, Lq9;->c:LN6;

    .line 98
    .line 99
    iget-object v0, v0, LN6;->d:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v0, Ljava/util/HashMap;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-interface {v0, v1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_4

    .line 116
    :catchall_0
    move-exception v1

    .line 117
    invoke-virtual {v0}, Lq9;->a()V

    .line 118
    .line 119
    .line 120
    throw v1

    .line 121
    :cond_4
    iget-object v0, v0, Lq9;->f:Landroidx/activity/a;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroidx/activity/a;->c()V

    .line 124
    .line 125
    .line 126
    :goto_4
    return-void

    .line 127
    :pswitch_0
    iget-object v0, p0, LV2;->e:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v0, Lcom/capacitorjs/plugins/app/AppPlugin;

    .line 130
    .line 131
    const-string v1, "backButton"

    .line 132
    .line 133
    invoke-static {v0, v1}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$000(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-nez v2, :cond_5

    .line 138
    .line 139
    invoke-static {v0}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$100(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v1}, Landroid/webkit/WebView;->canGoBack()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_6

    .line 152
    .line 153
    invoke-static {v0}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$200(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Landroid/webkit/WebView;->goBack()V

    .line 162
    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_5
    new-instance v2, Lcom/getcapacitor/JSObject;

    .line 166
    .line 167
    invoke-direct {v2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-static {v0}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$300(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v3}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v3}, Landroid/webkit/WebView;->canGoBack()Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    const-string v4, "canGoBack"

    .line 183
    .line 184
    invoke-virtual {v2, v4, v3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 185
    .line 186
    .line 187
    const/4 v3, 0x1

    .line 188
    invoke-static {v0, v1, v2, v3}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$400(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    .line 189
    .line 190
    .line 191
    invoke-static {v0}, Lcom/capacitorjs/plugins/app/AppPlugin;->access$500(Lcom/capacitorjs/plugins/app/AppPlugin;)Lcom/getcapacitor/Bridge;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const-string v1, "backbutton"

    .line 196
    .line 197
    const-string v2, "document"

    .line 198
    .line 199
    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/Bridge;->triggerJSEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :cond_6
    :goto_5
    return-void

    .line 203
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
