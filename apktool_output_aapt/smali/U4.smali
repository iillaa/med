.class public final LU4;
.super LF0;
.source "SourceFile"


# instance fields
.field public final synthetic h:LX4;


# direct methods
.method public constructor <init>(Lh9;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU4;->h:LX4;

    .line 2
    .line 3
    invoke-direct {p0}, LF0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(ILx0;Ljava/lang/Object;)V
    .locals 9

    .line 1
    const-string v0, "contract"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LU4;->h:LX4;

    .line 7
    .line 8
    invoke-virtual {p2, v1, p3}, Lx0;->b(Landroid/content/Context;Ljava/lang/Object;)LK;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance p2, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-direct {p2, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 21
    .line 22
    .line 23
    new-instance p3, LT4;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {p3, p0, p1, v0, v1}, LT4;-><init>(Ljava/lang/Object;ILjava/lang/Object;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p2, v1, p3}, Lx0;->a(Landroid/content/Context;Ljava/lang/Object;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    if-eqz p3, :cond_1

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-static {p3}, Llc;->e(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p3}, Landroid/os/Bundle;->getClassLoader()Ljava/lang/ClassLoader;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    if-nez p3, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-virtual {p2, p3}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    const-string p3, "androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE"

    .line 64
    .line 65
    invoke-virtual {p2, p3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p2, p3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    move-object v8, v0

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    const/4 p3, 0x0

    .line 81
    move-object v8, p3

    .line 82
    :goto_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    const-string v0, "androidx.activity.result.contract.action.REQUEST_PERMISSIONS"

    .line 87
    .line 88
    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    if-eqz p3, :cond_4

    .line 93
    .line 94
    const-string p3, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 95
    .line 96
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    if-nez p2, :cond_3

    .line 101
    .line 102
    const/4 p2, 0x0

    .line 103
    new-array p2, p2, [Ljava/lang/String;

    .line 104
    .line 105
    :cond_3
    invoke-static {v1, p2, p1}, LMk;->C(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    const-string v0, "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"

    .line 114
    .line 115
    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    if-eqz p3, :cond_5

    .line 120
    .line 121
    const-string p3, "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"

    .line 122
    .line 123
    invoke-virtual {p2, p3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    check-cast p2, Lkc;

    .line 128
    .line 129
    :try_start_0
    invoke-static {p2}, Llc;->e(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iget-object v2, p2, Lkc;->a:Landroid/content/IntentSender;

    .line 133
    .line 134
    iget-object v4, p2, Lkc;->b:Landroid/content/Intent;

    .line 135
    .line 136
    iget v5, p2, Lkc;->c:I

    .line 137
    .line 138
    iget v6, p2, Lkc;->d:I

    .line 139
    .line 140
    const/4 v7, 0x0

    .line 141
    move v3, p1

    .line 142
    invoke-virtual/range {v1 .. v8}, LX4;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :catch_0
    move-exception p2

    .line 147
    new-instance p3, Landroid/os/Handler;

    .line 148
    .line 149
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-direct {p3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, LT4;

    .line 157
    .line 158
    const/4 v1, 0x1

    .line 159
    invoke-direct {v0, p0, p1, p2, v1}, LT4;-><init>(Ljava/lang/Object;ILjava/lang/Object;I)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_5
    invoke-virtual {v1, p2, p1, v8}, LX4;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 167
    .line 168
    .line 169
    :goto_1
    return-void
.end method
