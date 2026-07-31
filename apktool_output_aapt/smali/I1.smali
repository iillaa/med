.class public final LI1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LI1;->a:I

    iput-object p2, p0, LI1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget p1, p0, LI1;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LI1;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Landroid/webkit/WebSettings;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v0, 0x21

    .line 17
    .line 18
    iget-object v1, p0, LI1;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Lcom/capacitorjs/plugins/share/SharePlugin;

    .line 21
    .line 22
    if-lt p1, v0, :cond_0

    .line 23
    .line 24
    invoke-static {p2}, LD;->h(Landroid/content/Intent;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/content/ComponentName;

    .line 29
    .line 30
    :goto_0
    invoke-static {v1, p1}, Lcom/capacitorjs/plugins/share/SharePlugin;->c(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/ComponentName;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-static {v1, p2}, Lcom/capacitorjs/plugins/share/SharePlugin;->d(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :goto_1
    return-void

    .line 40
    :pswitch_1
    if-eqz p2, :cond_3

    .line 41
    .line 42
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "android.intent.action.PHONE_STATE"

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    const-string p1, "state"

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget-object p2, Landroid/telephony/TelephonyManager;->EXTRA_STATE_RINGING:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    const-string v0, "telephone"

    .line 73
    .line 74
    iget-object v1, p0, LI1;->b:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v1, Lorg/apache/cordova/CoreAndroid;

    .line 77
    .line 78
    if-eqz p2, :cond_1

    .line 79
    .line 80
    iget-object p1, v1, LK5;->webView:LP5;

    .line 81
    .line 82
    invoke-interface {p1}, LP5;->getPluginManager()Lqf;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string p2, "ringing"

    .line 87
    .line 88
    :goto_2
    invoke-virtual {p1, v0, p2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_1
    sget-object p2, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_2

    .line 99
    .line 100
    iget-object p1, v1, LK5;->webView:LP5;

    .line 101
    .line 102
    invoke-interface {p1}, LP5;->getPluginManager()Lqf;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const-string p2, "offhook"

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    sget-object p2, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    iget-object p1, v1, LK5;->webView:LP5;

    .line 118
    .line 119
    invoke-interface {p1}, LP5;->getPluginManager()Lqf;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string p2, "idle"

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    :goto_3
    return-void

    .line 127
    :pswitch_2
    iget-object p1, p0, LI1;->b:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast p1, LJ1;

    .line 130
    .line 131
    invoke-virtual {p1}, LJ1;->g()V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
