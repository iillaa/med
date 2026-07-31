.class public final LJg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LRj;


# instance fields
.field public final a:Landroid/app/Application;

.field public final b:LQj;

.field public final c:Landroid/os/Bundle;

.field public final d:LTc;

.field public final e:LGg;


# direct methods
.method public constructor <init>(Landroid/app/Application;LIg;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "owner"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-interface {p2}, LIg;->getSavedStateRegistry()LGg;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, LJg;->e:LGg;

    .line 14
    .line 15
    invoke-interface {p2}, LYc;->getLifecycle()LTc;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, LJg;->d:LTc;

    .line 20
    .line 21
    iput-object p3, p0, LJg;->c:Landroid/os/Bundle;

    .line 22
    .line 23
    iput-object p1, p0, LJg;->a:Landroid/app/Application;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget-object p2, LQj;->d:LQj;

    .line 28
    .line 29
    if-nez p2, :cond_0

    .line 30
    .line 31
    new-instance p2, LQj;

    .line 32
    .line 33
    invoke-direct {p2, p1}, LQj;-><init>(Landroid/app/Application;)V

    .line 34
    .line 35
    .line 36
    sput-object p2, LQj;->d:LQj;

    .line 37
    .line 38
    :cond_0
    sget-object p1, LQj;->d:LQj;

    .line 39
    .line 40
    invoke-static {p1}, Llc;->e(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    new-instance p1, LQj;

    .line 45
    .line 46
    const/4 p2, 0x0

    .line 47
    invoke-direct {p1, p2}, LQj;-><init>(Landroid/app/Application;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iput-object p1, p0, LJg;->b:LQj;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;Lte;)LOj;
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    sget-object v2, Lt5;->k:Lt5;

    .line 4
    .line 5
    iget-object v3, p2, Ln6;->a:Ljava/util/LinkedHashMap;

    .line 6
    .line 7
    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v2, :cond_5

    .line 14
    .line 15
    sget-object v4, LSi;->e:Lt5;

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    if-eqz v4, :cond_3

    .line 22
    .line 23
    sget-object v4, LSi;->f:Lt5;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    if-eqz v4, :cond_3

    .line 30
    .line 31
    sget-object v2, Lt5;->j:Lt5;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Landroid/app/Application;

    .line 38
    .line 39
    const-class v3, LT0;

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    sget-object v4, LKg;->a:Ljava/util/List;

    .line 50
    .line 51
    :goto_0
    invoke-static {p1, v4}, LKg;->a(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Constructor;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    sget-object v4, LKg;->b:Ljava/util/List;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :goto_1
    if-nez v4, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, LJg;->b:LQj;

    .line 62
    .line 63
    invoke-virtual {v0, p1, p2}, LQj;->a(Ljava/lang/Class;Lte;)LOj;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    return-object p1

    .line 68
    :cond_1
    if-eqz v3, :cond_2

    .line 69
    .line 70
    if-eqz v2, :cond_2

    .line 71
    .line 72
    invoke-static {p2}, LSi;->l(Lte;)LAg;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const/4 v3, 0x2

    .line 77
    new-array v3, v3, [Ljava/lang/Object;

    .line 78
    .line 79
    aput-object v2, v3, v1

    .line 80
    .line 81
    aput-object p2, v3, v0

    .line 82
    .line 83
    invoke-static {p1, v4, v3}, LKg;->b(Ljava/lang/Class;Ljava/lang/reflect/Constructor;[Ljava/lang/Object;)LOj;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    invoke-static {p2}, LSi;->l(Lte;)LAg;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    new-array v0, v0, [Ljava/lang/Object;

    .line 93
    .line 94
    aput-object p2, v0, v1

    .line 95
    .line 96
    invoke-static {p1, v4, v0}, LKg;->b(Ljava/lang/Class;Ljava/lang/reflect/Constructor;[Ljava/lang/Object;)LOj;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    goto :goto_2

    .line 101
    :cond_3
    iget-object p2, p0, LJg;->d:LTc;

    .line 102
    .line 103
    if-eqz p2, :cond_4

    .line 104
    .line 105
    invoke-virtual {p0, v2, p1}, LJg;->c(Ljava/lang/String;Ljava/lang/Class;)LOj;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    :goto_2
    return-object p1

    .line 110
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 111
    .line 112
    const-string p2, "SAVED_STATE_REGISTRY_OWNER_KEY andVIEW_MODEL_STORE_OWNER_KEY must be provided in the creation extras tosuccessfully create a ViewModel."

    .line 113
    .line 114
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p1

    .line 118
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 119
    .line 120
    const-string p2, "VIEW_MODEL_KEY must always be provided by ViewModelProvider"

    .line 121
    .line 122
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p1
.end method

.method public final b(Ljava/lang/Class;)LOj;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, LJg;->c(Ljava/lang/String;Ljava/lang/Class;)LOj;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    return-object p1

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 13
    .line 14
    const-string v0, "Local and anonymous classes can not be ViewModels"

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p1
.end method

.method public final c(Ljava/lang/String;Ljava/lang/Class;)LOj;
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    iget-object v3, p0, LJg;->d:LTc;

    .line 5
    .line 6
    if-eqz v3, :cond_a

    .line 7
    .line 8
    const-class v4, LT0;

    .line 9
    .line 10
    invoke-virtual {v4, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    iget-object v5, p0, LJg;->a:Landroid/app/Application;

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    sget-object v5, LKg;->a:Ljava/util/List;

    .line 21
    .line 22
    :goto_0
    invoke-static {p2, v5}, LKg;->a(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/reflect/Constructor;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    sget-object v5, LKg;->b:Ljava/util/List;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    if-nez v5, :cond_3

    .line 31
    .line 32
    iget-object p1, p0, LJg;->a:Landroid/app/Application;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, LJg;->b:LQj;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, LQj;->b(Ljava/lang/Class;)LOj;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    goto :goto_2

    .line 43
    :cond_1
    sget-object p1, Lt9;->b:Lt9;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    new-instance p1, Lt9;

    .line 48
    .line 49
    invoke-direct {p1, v2}, Lt9;-><init>(I)V

    .line 50
    .line 51
    .line 52
    sput-object p1, Lt9;->b:Lt9;

    .line 53
    .line 54
    :cond_2
    sget-object p1, Lt9;->b:Lt9;

    .line 55
    .line 56
    invoke-static {p1}, Llc;->e(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, p2}, Lt9;->b(Ljava/lang/Class;)LOj;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :goto_2
    return-object p1

    .line 64
    :cond_3
    iget-object v6, p0, LJg;->e:LGg;

    .line 65
    .line 66
    invoke-static {v6}, Llc;->e(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v7, p0, LJg;->c:Landroid/os/Bundle;

    .line 70
    .line 71
    invoke-virtual {v6, p1}, LGg;->a(Ljava/lang/String;)Landroid/os/Bundle;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    sget-object v9, LAg;->f:[Ljava/lang/Class;

    .line 76
    .line 77
    invoke-static {v8, v7}, LSi;->k(Landroid/os/Bundle;Landroid/os/Bundle;)LAg;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    new-instance v8, Landroidx/lifecycle/SavedStateHandleController;

    .line 82
    .line 83
    invoke-direct {v8, p1, v7}, Landroidx/lifecycle/SavedStateHandleController;-><init>(Ljava/lang/String;LAg;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v8, v3, v6}, Landroidx/lifecycle/SavedStateHandleController;->b(LTc;LGg;)V

    .line 87
    .line 88
    .line 89
    move-object p1, v3

    .line 90
    check-cast p1, Landroidx/lifecycle/a;

    .line 91
    .line 92
    iget-object p1, p1, Landroidx/lifecycle/a;->c:LSc;

    .line 93
    .line 94
    sget-object v9, LSc;->d:LSc;

    .line 95
    .line 96
    if-eq p1, v9, :cond_5

    .line 97
    .line 98
    sget-object v9, LSc;->f:LSc;

    .line 99
    .line 100
    invoke-virtual {p1, v9}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-ltz p1, :cond_4

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_4
    new-instance p1, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;

    .line 108
    .line 109
    invoke-direct {p1, v3, v6}, Landroidx/lifecycle/LegacySavedStateHandleController$tryToAddRecreator$1;-><init>(LTc;LGg;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3, p1}, LTc;->a(LXc;)V

    .line 113
    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_5
    :goto_3
    invoke-virtual {v6}, LGg;->d()V

    .line 117
    .line 118
    .line 119
    :goto_4
    if-eqz v4, :cond_6

    .line 120
    .line 121
    iget-object p1, p0, LJg;->a:Landroid/app/Application;

    .line 122
    .line 123
    if-eqz p1, :cond_6

    .line 124
    .line 125
    new-array v2, v2, [Ljava/lang/Object;

    .line 126
    .line 127
    aput-object p1, v2, v1

    .line 128
    .line 129
    aput-object v7, v2, v0

    .line 130
    .line 131
    invoke-static {p2, v5, v2}, LKg;->b(Ljava/lang/Class;Ljava/lang/reflect/Constructor;[Ljava/lang/Object;)LOj;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    goto :goto_5

    .line 136
    :cond_6
    new-array p1, v0, [Ljava/lang/Object;

    .line 137
    .line 138
    aput-object v7, p1, v1

    .line 139
    .line 140
    invoke-static {p2, v5, p1}, LKg;->b(Ljava/lang/Class;Ljava/lang/reflect/Constructor;[Ljava/lang/Object;)LOj;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :goto_5
    const-string p2, "androidx.lifecycle.savedstate.vm.tag"

    .line 145
    .line 146
    iget-object v0, p1, LOj;->a:Ljava/util/HashMap;

    .line 147
    .line 148
    monitor-enter v0

    .line 149
    :try_start_0
    iget-object v1, p1, LOj;->a:Ljava/util/HashMap;

    .line 150
    .line 151
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    if-nez v1, :cond_7

    .line 156
    .line 157
    iget-object v2, p1, LOj;->a:Ljava/util/HashMap;

    .line 158
    .line 159
    invoke-virtual {v2, p2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    goto :goto_6

    .line 163
    :catchall_0
    move-exception p1

    .line 164
    goto :goto_8

    .line 165
    :cond_7
    :goto_6
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    if-nez v1, :cond_8

    .line 167
    .line 168
    goto :goto_7

    .line 169
    :cond_8
    move-object v8, v1

    .line 170
    :goto_7
    iget-boolean p2, p1, LOj;->c:Z

    .line 171
    .line 172
    if-eqz p2, :cond_9

    .line 173
    .line 174
    invoke-static {v8}, LOj;->a(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    :cond_9
    return-object p1

    .line 178
    :goto_8
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    throw p1

    .line 180
    :cond_a
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 181
    .line 182
    const-string p2, "SavedStateViewModelFactory constructed with empty constructor supports only calls to create(modelClass: Class<T>, extras: CreationExtras)."

    .line 183
    .line 184
    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    throw p1
.end method
