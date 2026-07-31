.class public final LYh;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lorg/apache/cordova/engine/SystemWebViewEngine;

.field public c:Landroid/widget/LinearLayout;

.field public final d:LY1;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/engine/SystemWebViewEngine;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0x6400000

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, LYh;->a:J

    .line 8
    .line 9
    iput-object p1, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 10
    .line 11
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->a:Lorg/apache/cordova/engine/SystemWebView;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, LY1;

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    invoke-direct {v0, v1, p1}, LY1;-><init>(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LYh;->d:LY1;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final getVideoLoadingProgressView()Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, LYh;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/widget/LinearLayout;

    .line 6
    .line 7
    iget-object v1, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 25
    .line 26
    const/4 v3, -0x2

    .line 27
    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    const/16 v4, 0xd

    .line 31
    .line 32
    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Landroid/widget/ProgressBar;

    .line 39
    .line 40
    invoke-virtual {v1}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {v2, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 52
    .line 53
    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 54
    .line 55
    .line 56
    const/16 v3, 0x11

    .line 57
    .line 58
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 59
    .line 60
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, LYh;->c:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, LYh;->c:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    return-object v0
.end method

.method public final onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 0

    .line 1
    iget-wide p1, p0, LYh;->a:J

    .line 2
    .line 3
    invoke-interface {p9, p1, p2}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 10
    .line 11
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->h:Lqf;

    .line 12
    .line 13
    const-string p2, "Geolocation"

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lqf;->d(Ljava/lang/String;)LK5;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, LK5;->hasPermisssion()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v1}, LK5;->requestPermissions(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final onHideCustomView()V
    .locals 1

    .line 1
    iget-object v0, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getCordovaWebView()LP5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, LP5;->hideCustomView()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2

    .line 1
    new-instance p1, LWh;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-direct {p1, p4, p2}, LWh;-><init>(Landroid/webkit/JsResult;I)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, LYh;->d:LY1;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance p4, Landroid/app/AlertDialog$Builder;

    .line 13
    .line 14
    iget-object v0, p2, LY1;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Landroid/content/Context;

    .line 17
    .line 18
    invoke-direct {p4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 22
    .line 23
    .line 24
    const-string p3, "Alert"

    .line 25
    .line 26
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 27
    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 31
    .line 32
    .line 33
    new-instance v0, LD5;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-direct {v0, p1, v1}, LD5;-><init>(LH5;I)V

    .line 37
    .line 38
    .line 39
    const v1, 0x104000a

    .line 40
    .line 41
    .line 42
    invoke-virtual {p4, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 43
    .line 44
    .line 45
    new-instance v0, LE5;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-direct {v0, p1, v1}, LE5;-><init>(LH5;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p4, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 52
    .line 53
    .line 54
    new-instance v0, LF5;

    .line 55
    .line 56
    invoke-direct {v0, p1, v1}, LF5;-><init>(LH5;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, v0}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p2, LY1;->e:Ljava/lang/Object;

    .line 67
    .line 68
    return p3
.end method

.method public final onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2

    .line 1
    new-instance p1, LWh;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-direct {p1, p4, p2}, LWh;-><init>(Landroid/webkit/JsResult;I)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, LYh;->d:LY1;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    new-instance p4, Landroid/app/AlertDialog$Builder;

    .line 13
    .line 14
    iget-object v0, p2, LY1;->d:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Landroid/content/Context;

    .line 17
    .line 18
    invoke-direct {p4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 22
    .line 23
    .line 24
    const-string p3, "Confirm"

    .line 25
    .line 26
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 27
    .line 28
    .line 29
    const/4 p3, 0x1

    .line 30
    invoke-virtual {p4, p3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 31
    .line 32
    .line 33
    new-instance v0, LD5;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-direct {v0, p1, v1}, LD5;-><init>(LH5;I)V

    .line 37
    .line 38
    .line 39
    const v1, 0x104000a

    .line 40
    .line 41
    .line 42
    invoke-virtual {p4, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 43
    .line 44
    .line 45
    new-instance v0, LD5;

    .line 46
    .line 47
    const/4 v1, 0x2

    .line 48
    invoke-direct {v0, p1, v1}, LD5;-><init>(LH5;I)V

    .line 49
    .line 50
    .line 51
    const/high16 v1, 0x1040000

    .line 52
    .line 53
    invoke-virtual {p4, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 54
    .line 55
    .line 56
    new-instance v0, LE5;

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-direct {v0, p1, v1}, LE5;-><init>(LH5;I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p4, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 63
    .line 64
    .line 65
    new-instance v0, LF5;

    .line 66
    .line 67
    invoke-direct {v0, p1, v1}, LF5;-><init>(LH5;I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p4, v0}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p2, LY1;->e:Ljava/lang/Object;

    .line 78
    .line 79
    return p3
.end method

.method public final onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 8

    .line 1
    iget-object p1, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    iget-object v0, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->d:LC5;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    const/4 v6, 0x0

    .line 10
    if-eqz p4, :cond_0

    .line 11
    .line 12
    const-string v1, "gap:"

    .line 13
    .line 14
    invoke-virtual {p4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    :try_start_0
    new-instance p2, Lorg/json/JSONArray;

    .line 21
    .line 22
    const/4 v1, 0x4

    .line 23
    invoke-virtual {p4, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {p2, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v6}, Lorg/json/JSONArray;->getInt(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {p2, p1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const/4 v3, 0x2

    .line 39
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/4 v4, 0x3

    .line 44
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    move-object v5, p3

    .line 49
    invoke-virtual/range {v0 .. v5}, LC5;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    if-nez p2, :cond_9

    .line 54
    .line 55
    const-string p2, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    goto/16 :goto_5

    .line 58
    .line 59
    :catch_0
    move-exception p2

    .line 60
    goto :goto_2

    .line 61
    :catch_1
    move-exception p2

    .line 62
    goto :goto_2

    .line 63
    :goto_0
    const-string p2, ""

    .line 64
    .line 65
    goto/16 :goto_5

    .line 66
    .line 67
    :cond_0
    if-eqz p4, :cond_2

    .line 68
    .line 69
    const-string v1, "gap_bridge_mode:"

    .line 70
    .line 71
    invoke-virtual {p4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    const/16 p2, 0x10

    .line 78
    .line 79
    :try_start_1
    invoke-virtual {p4, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-virtual {v0, p2}, LC5;->b(I)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iget-object p2, v0, LC5;->b:Lye;

    .line 99
    .line 100
    invoke-virtual {p2, v1}, Lye;->f(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :catch_2
    move-exception p2

    .line 105
    goto :goto_2

    .line 106
    :catch_3
    move-exception p2

    .line 107
    goto :goto_2

    .line 108
    :cond_2
    const/4 v1, 0x0

    .line 109
    const/16 v2, 0x9

    .line 110
    .line 111
    if-eqz p4, :cond_4

    .line 112
    .line 113
    const-string v3, "gap_poll:"

    .line 114
    .line 115
    invoke-virtual {p4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-eqz v3, :cond_4

    .line 120
    .line 121
    invoke-virtual {p4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    :try_start_2
    const-string v2, "1"

    .line 130
    .line 131
    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-virtual {v0, p2}, LC5;->b(I)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-nez p2, :cond_3

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_3
    iget-object p2, v0, LC5;->b:Lye;

    .line 143
    .line 144
    invoke-virtual {p2, v2}, Lye;->d(Z)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    :goto_1
    if-nez v1, :cond_8

    .line 149
    .line 150
    const-string p2, ""
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_4

    .line 151
    .line 152
    goto/16 :goto_5

    .line 153
    .line 154
    :catch_4
    move-exception p2

    .line 155
    :goto_2
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 156
    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_4
    if-eqz p4, :cond_8

    .line 160
    .line 161
    const-string v3, "gap_init:"

    .line 162
    .line 163
    invoke-virtual {p4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-eqz v3, :cond_8

    .line 168
    .line 169
    iget-object v1, v0, LC5;->a:Lqf;

    .line 170
    .line 171
    iget-object v3, v1, Lqf;->b:Ljava/util/Map;

    .line 172
    .line 173
    monitor-enter v3

    .line 174
    :try_start_3
    iget-object v4, v1, Lqf;->b:Ljava/util/Map;

    .line 175
    .line 176
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-eqz v5, :cond_6

    .line 189
    .line 190
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    check-cast v5, Lof;

    .line 195
    .line 196
    iget-object v7, v1, Lqf;->a:Ljava/util/Map;

    .line 197
    .line 198
    iget-object v5, v5, Lof;->a:Ljava/lang/String;

    .line 199
    .line 200
    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    check-cast v5, LK5;

    .line 205
    .line 206
    if-eqz v5, :cond_5

    .line 207
    .line 208
    invoke-virtual {v5, p2}, LK5;->shouldAllowBridgeAccess(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    if-eqz v5, :cond_5

    .line 213
    .line 214
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    monitor-exit v3

    .line 219
    goto :goto_3

    .line 220
    :catchall_0
    move-exception p1

    .line 221
    goto :goto_4

    .line 222
    :cond_6
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 223
    invoke-virtual {v1}, Lqf;->c()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    :goto_3
    if-eqz v1, :cond_7

    .line 232
    .line 233
    invoke-virtual {p4, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    iget-object v1, v0, LC5;->b:Lye;

    .line 242
    .line 243
    invoke-virtual {v1, p2}, Lye;->f(I)V

    .line 244
    .line 245
    .line 246
    new-instance p2, Ljava/security/SecureRandom;

    .line 247
    .line 248
    invoke-direct {p2}, Ljava/security/SecureRandom;-><init>()V

    .line 249
    .line 250
    .line 251
    const v1, 0x7fffffff

    .line 252
    .line 253
    .line 254
    invoke-virtual {p2, v1}, Ljava/util/Random;->nextInt(I)I

    .line 255
    .line 256
    .line 257
    move-result p2

    .line 258
    iput p2, v0, LC5;->c:I

    .line 259
    .line 260
    iget p2, v0, LC5;->c:I

    .line 261
    .line 262
    const-string v0, ""

    .line 263
    .line 264
    invoke-static {v0, p2}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    goto :goto_5

    .line 269
    :cond_7
    const-string v0, "CordovaBridge"

    .line 270
    .line 271
    new-instance v1, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v2, "gap_init called from restricted origin: "

    .line 274
    .line 275
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p2

    .line 285
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    const-string p2, ""

    .line 289
    .line 290
    goto :goto_5

    .line 291
    :goto_4
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 292
    throw p1

    .line 293
    :cond_8
    move-object p2, v1

    .line 294
    :cond_9
    :goto_5
    if-eqz p2, :cond_a

    .line 295
    .line 296
    invoke-virtual {p5, p2}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    goto :goto_6

    .line 300
    :cond_a
    iget-object p2, p0, LYh;->d:LY1;

    .line 301
    .line 302
    new-instance v0, Li0;

    .line 303
    .line 304
    const/16 v1, 0x15

    .line 305
    .line 306
    invoke-direct {v0, v1, p5}, Li0;-><init>(ILjava/lang/Object;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 310
    .line 311
    .line 312
    new-instance p5, Landroid/app/AlertDialog$Builder;

    .line 313
    .line 314
    iget-object v1, p2, LY1;->d:Ljava/lang/Object;

    .line 315
    .line 316
    check-cast v1, Landroid/content/Context;

    .line 317
    .line 318
    invoke-direct {p5, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p5, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 322
    .line 323
    .line 324
    new-instance p3, Landroid/widget/EditText;

    .line 325
    .line 326
    invoke-direct {p3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 327
    .line 328
    .line 329
    if-eqz p4, :cond_b

    .line 330
    .line 331
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    :cond_b
    invoke-virtual {p5, p3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {p5, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 338
    .line 339
    .line 340
    new-instance p4, LG5;

    .line 341
    .line 342
    invoke-direct {p4, p3, v0}, LG5;-><init>(Landroid/widget/EditText;Li0;)V

    .line 343
    .line 344
    .line 345
    const p3, 0x104000a

    .line 346
    .line 347
    .line 348
    invoke-virtual {p5, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 349
    .line 350
    .line 351
    new-instance p3, LD5;

    .line 352
    .line 353
    const/4 p4, 0x3

    .line 354
    invoke-direct {p3, v0, p4}, LD5;-><init>(LH5;I)V

    .line 355
    .line 356
    .line 357
    const/high16 p4, 0x1040000

    .line 358
    .line 359
    invoke-virtual {p5, p4, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {p5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 363
    .line 364
    .line 365
    move-result-object p3

    .line 366
    iput-object p3, p2, LY1;->e:Ljava/lang/Object;

    .line 367
    .line 368
    :goto_6
    return p1
.end method

.method public final onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1, v0}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apache/cordova/engine/SystemWebViewEngine;->getCordovaWebView()LP5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1, p2}, LP5;->showCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 3

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "android.intent.extra.ALLOW_MULTIPLE"

    .line 17
    .line 18
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    array-length p3, p1

    .line 26
    if-le p3, v1, :cond_1

    .line 27
    .line 28
    const-string p3, "*/*"

    .line 29
    .line 30
    invoke-virtual {v0, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    const-string p3, "android.intent.extra.MIME_TYPES"

    .line 34
    .line 35
    invoke-virtual {v0, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    :cond_1
    :try_start_0
    iget-object p1, p0, LYh;->b:Lorg/apache/cordova/engine/SystemWebViewEngine;

    .line 39
    .line 40
    iget-object p1, p1, Lorg/apache/cordova/engine/SystemWebViewEngine;->g:LI5;

    .line 41
    .line 42
    new-instance p3, LXh;

    .line 43
    .line 44
    invoke-direct {p3, p2}, LXh;-><init>(Landroid/webkit/ValueCallback;)V

    .line 45
    .line 46
    .line 47
    const/16 v2, 0x1435

    .line 48
    .line 49
    invoke-interface {p1, p3, v0, v2}, LI5;->startActivityForResult(LK5;Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    const/4 p1, 0x0

    .line 54
    invoke-interface {p2, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    return v1
.end method
