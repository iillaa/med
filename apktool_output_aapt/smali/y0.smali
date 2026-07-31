.class public final Ly0;
.super Lx0;
.source "SourceFile"


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ly0;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/Object;)Landroid/content/Intent;
    .locals 4

    .line 1
    iget v0, p0, Ly0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p2, Lkc;

    .line 7
    .line 8
    new-instance p1, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v0, "androidx.activity.result.contract.action.INTENT_SENDER_REQUEST"

    .line 11
    .line 12
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p2, Lkc;->b:Landroid/content/Intent;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v1, "androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v1, "androidx.fragment.extra.ACTIVITY_OPTIONS_BUNDLE"

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p2, Lkc;->a:Landroid/content/IntentSender;

    .line 43
    .line 44
    const-string v1, "intentSender"

    .line 45
    .line 46
    invoke-static {v1, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Lkc;

    .line 50
    .line 51
    iget v2, p2, Lkc;->c:I

    .line 52
    .line 53
    iget p2, p2, Lkc;->d:I

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-direct {v1, v0, v3, v2, p2}, Lkc;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    .line 57
    .line 58
    .line 59
    move-object p2, v1

    .line 60
    :cond_0
    const-string v0, "androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST"

    .line 61
    .line 62
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    const/4 p2, 0x2

    .line 66
    const-string v0, "FragmentManager"

    .line 67
    .line 68
    invoke-static {v0, p2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_1

    .line 73
    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v1, "CreateIntent created the following intent: "

    .line 77
    .line 78
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {v0, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    :cond_1
    return-object p1

    .line 92
    :pswitch_0
    check-cast p2, Landroid/content/Intent;

    .line 93
    .line 94
    const-string v0, "context"

    .line 95
    .line 96
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    const-string p1, "input"

    .line 100
    .line 101
    invoke-static {p1, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    return-object p2

    .line 105
    :pswitch_1
    check-cast p2, [Ljava/lang/String;

    .line 106
    .line 107
    const-string v0, "context"

    .line 108
    .line 109
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    const-string p1, "input"

    .line 113
    .line 114
    invoke-static {p1, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    new-instance p1, Landroid/content/Intent;

    .line 118
    .line 119
    const-string v0, "androidx.activity.result.contract.action.REQUEST_PERMISSIONS"

    .line 120
    .line 121
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v0, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 125
    .line 126
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p2, "Intent(ACTION_REQUEST_PE\u2026EXTRA_PERMISSIONS, input)"

    .line 131
    .line 132
    invoke-static {p2, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-object p1

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b(Landroid/content/Context;Ljava/lang/Object;)LK;
    .locals 4

    .line 1
    iget v0, p0, Ly0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2}, Lx0;->b(Landroid/content/Context;Ljava/lang/Object;)LK;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    return-object p1

    .line 11
    :pswitch_0
    check-cast p2, [Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "context"

    .line 14
    .line 15
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "input"

    .line 19
    .line 20
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    array-length v0, p2

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    new-instance p1, LK;

    .line 27
    .line 28
    sget-object p2, LH7;->c:LH7;

    .line 29
    .line 30
    invoke-direct {p1, p2}, LK;-><init>(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_0
    array-length v0, p2

    .line 35
    const/4 v1, 0x0

    .line 36
    move v2, v1

    .line 37
    :goto_0
    if-ge v2, v0, :cond_2

    .line 38
    .line 39
    aget-object v3, p2, v2

    .line 40
    .line 41
    invoke-static {p1, v3}, LMk;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 p1, 0x0

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    array-length p1, p2

    .line 53
    invoke-static {p1}, LId;->E(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    const/16 v0, 0x10

    .line 58
    .line 59
    if-ge p1, v0, :cond_3

    .line 60
    .line 61
    move p1, v0

    .line 62
    :cond_3
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 63
    .line 64
    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 65
    .line 66
    .line 67
    array-length p1, p2

    .line 68
    :goto_1
    if-ge v1, p1, :cond_4

    .line 69
    .line 70
    aget-object v2, p2, v1

    .line 71
    .line 72
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    add-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_4
    new-instance p1, LK;

    .line 81
    .line 82
    invoke-direct {p1, v0}, LK;-><init>(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :goto_2
    return-object p1

    .line 86
    nop

    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c(ILandroid/content/Intent;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Ly0;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv0;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Lv0;-><init>(ILandroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_0
    new-instance v0, Lv0;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Lv0;-><init>(ILandroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_1
    sget-object v0, LH7;->c:LH7;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    if-eq p1, v1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_4

    .line 24
    .line 25
    :cond_0
    if-nez p2, :cond_1

    .line 26
    .line 27
    goto/16 :goto_4

    .line 28
    .line 29
    :cond_1
    const-string p1, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v1, "androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS"

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    if-eqz p2, :cond_8

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    goto :goto_4

    .line 46
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    array-length v1, p2

    .line 49
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    .line 51
    .line 52
    array-length v1, p2

    .line 53
    const/4 v2, 0x0

    .line 54
    move v3, v2

    .line 55
    :goto_0
    if-ge v3, v1, :cond_4

    .line 56
    .line 57
    aget v4, p2, v3

    .line 58
    .line 59
    if-nez v4, :cond_3

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move v4, v2

    .line 64
    :goto_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    new-instance p2, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    array-length v1, p1

    .line 80
    :goto_2
    if-ge v2, v1, :cond_6

    .line 81
    .line 82
    aget-object v3, p1, v2

    .line 83
    .line 84
    if-eqz v3, :cond_5

    .line 85
    .line 86
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_6
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-static {p2}, Lv4;->G(Ljava/lang/Iterable;)I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    invoke-static {v0}, Lv4;->G(Ljava/lang/Iterable;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 115
    .line 116
    .line 117
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-eqz p2, :cond_7

    .line 122
    .line 123
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_7

    .line 128
    .line 129
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v3, Lgf;

    .line 138
    .line 139
    invoke-direct {v3, p2, v0}, Lgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_7
    invoke-static {v2}, LId;->F(Ljava/util/ArrayList;)Ljava/util/Map;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    :cond_8
    :goto_4
    return-object v0

    .line 151
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
