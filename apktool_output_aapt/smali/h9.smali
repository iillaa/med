.class public abstract Lh9;
.super LX4;
.source "SourceFile"

# interfaces
.implements Lr0;


# static fields
.field static final LIFECYCLE_TAG:Ljava/lang/String; = "android:support:lifecycle"


# instance fields
.field mCreated:Z

.field final mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

.field final mFragments:Lj9;

.field mResumed:Z

.field mStopped:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, LX4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lg9;

    .line 5
    .line 6
    move-object v1, p0

    .line 7
    check-cast v1, Lm1;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lg9;-><init>(Lm1;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Lj9;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Lj9;-><init>(Lg9;)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Lh9;->mFragments:Lj9;

    .line 18
    .line 19
    new-instance v0, Landroidx/lifecycle/a;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Landroidx/lifecycle/a;-><init>(LYc;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lh9;->mStopped:Z

    .line 28
    .line 29
    invoke-virtual {p0}, LX4;->getSavedStateRegistry()LGg;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v2, Ld9;

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-direct {v2, v3, v1}, Ld9;-><init>(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "android:support:lifecycle"

    .line 40
    .line 41
    invoke-virtual {v0, v3, v2}, LGg;->c(Ljava/lang/String;LFg;)V

    .line 42
    .line 43
    .line 44
    new-instance v0, Le9;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {v0, v1, v2}, Le9;-><init>(Lm1;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, LX4;->addOnConfigurationChangedListener(Lf5;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Le9;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-direct {v0, v1, v2}, Le9;-><init>(Lm1;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, LX4;->addOnNewIntentListener(Lf5;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Lf9;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-direct {v0, v1, v2}, Lf9;-><init>(Lh9;I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, LX4;->addOnContextAvailableListener(LWe;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public final dispatchFragmentsOnCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    iget-object v0, v0, Lj9;->a:Lg9;

    .line 4
    .line 5
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 6
    .line 7
    iget-object v0, v0, Lq9;->e:Lk9;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3, p4}, Lk9;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p4}, LW4;->shouldDumpInternalState([Ljava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p2, "Local FragmentActivity "

    .line 15
    .line 16
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p2, " State:"

    .line 31
    .line 32
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance p2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p4, "  "

    .line 44
    .line 45
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p4, "mCreated="

    .line 56
    .line 57
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-boolean p4, p0, Lh9;->mCreated:Z

    .line 61
    .line 62
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Z)V

    .line 63
    .line 64
    .line 65
    const-string p4, " mResumed="

    .line 66
    .line 67
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-boolean p4, p0, Lh9;->mResumed:Z

    .line 71
    .line 72
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Z)V

    .line 73
    .line 74
    .line 75
    const-string p4, " mStopped="

    .line 76
    .line 77
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-boolean p4, p0, Lh9;->mStopped:Z

    .line 81
    .line 82
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    if-eqz p4, :cond_3

    .line 90
    .line 91
    invoke-interface {p0}, LTj;->getViewModelStore()LSj;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    new-instance v0, LN2;

    .line 96
    .line 97
    sget-object v1, Lqd;->e:Lt9;

    .line 98
    .line 99
    invoke-direct {v0, p4, v1}, LN2;-><init>(LSj;LRj;)V

    .line 100
    .line 101
    .line 102
    const-class p4, Lqd;

    .line 103
    .line 104
    invoke-virtual {p4}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    const-string v2, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    .line 111
    .line 112
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1, p4}, LN2;->h(Ljava/lang/String;Ljava/lang/Class;)LOj;

    .line 117
    .line 118
    .line 119
    move-result-object p4

    .line 120
    check-cast p4, Lqd;

    .line 121
    .line 122
    iget-object p4, p4, Lqd;->d:Lnh;

    .line 123
    .line 124
    iget v0, p4, Lnh;->c:I

    .line 125
    .line 126
    if-lez v0, :cond_3

    .line 127
    .line 128
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    const-string v0, "Loaders:"

    .line 132
    .line 133
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget v0, p4, Lnh;->c:I

    .line 137
    .line 138
    if-gtz v0, :cond_1

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_1
    iget-object p1, p4, Lnh;->b:[Ljava/lang/Object;

    .line 142
    .line 143
    const/4 v0, 0x0

    .line 144
    aget-object p1, p1, v0

    .line 145
    .line 146
    invoke-static {p1}, Loh;->c(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    const-string p1, "  #"

    .line 153
    .line 154
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p4, Lnh;->a:[I

    .line 158
    .line 159
    aget p1, p1, v0

    .line 160
    .line 161
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(I)V

    .line 162
    .line 163
    .line 164
    const-string p1, ": "

    .line 165
    .line 166
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    const/4 p1, 0x0

    .line 170
    throw p1

    .line 171
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 172
    .line 173
    const-string p2, "Local and anonymous classes can not be ViewModels"

    .line 174
    .line 175
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    throw p1

    .line 179
    :cond_3
    :goto_0
    iget-object p2, p0, Lh9;->mFragments:Lj9;

    .line 180
    .line 181
    iget-object p2, p2, Lj9;->a:Lg9;

    .line 182
    .line 183
    iget-object p2, p2, Lg9;->e:Lr9;

    .line 184
    .line 185
    invoke-virtual {p2, p1, p3}, Lq9;->d(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public getSupportFragmentManager()Lq9;
    .locals 1

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    iget-object v0, v0, Lj9;->a:Lg9;

    .line 4
    .line 5
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 6
    .line 7
    return-object v0
.end method

.method public getSupportLoaderManager()Lpd;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Lrd;

    .line 2
    .line 3
    invoke-interface {p0}, LTj;->getViewModelStore()LSj;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1}, Lrd;-><init>(LYc;LSj;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public markFragmentsCreated()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lh9;->getSupportFragmentManager()Lq9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lq9;->c:LN6;

    .line 6
    .line 7
    invoke-virtual {v0}, LN6;->j()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lj9;->a()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, LX4;->onActivityResult(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAttachFragment(Lc9;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, LX4;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 5
    .line 6
    sget-object v0, LRc;->ON_CREATE:LRc;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lh9;->mFragments:Lj9;

    .line 12
    .line 13
    iget-object p1, p1, Lj9;->a:Lg9;

    .line 14
    .line 15
    iget-object p1, p1, Lg9;->e:Lr9;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p1, Lq9;->y:Z

    .line 19
    .line 20
    iput-boolean v0, p1, Lq9;->z:Z

    .line 21
    .line 22
    iget-object v0, p1, Lq9;->E:Lu9;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, v0}, Lq9;->c(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lh9;->dispatchFragmentsOnCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Lh9;->dispatchFragmentsOnCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public onDestroy()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 5
    .line 6
    iget-object v0, v0, Lj9;->a:Lg9;

    .line 7
    .line 8
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, v0, Lq9;->A:Z

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lq9;->f(Z)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lq9;->b()Ljava/util/HashSet;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/4 v4, 0x0

    .line 29
    if-nez v3, :cond_c

    .line 30
    .line 31
    iget-object v2, v0, Lq9;->r:Lg9;

    .line 32
    .line 33
    instance-of v3, v2, LTj;

    .line 34
    .line 35
    iget-object v5, v0, Lq9;->c:LN6;

    .line 36
    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    iget-object v1, v5, LN6;->f:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v1, Lu9;

    .line 42
    .line 43
    iget-boolean v1, v1, Lu9;->g:Z

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v2, v2, Lg9;->c:Landroid/content/Context;

    .line 47
    .line 48
    instance-of v3, v2, Landroid/app/Activity;

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    check-cast v2, Landroid/app/Activity;

    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    xor-int/2addr v1, v2

    .line 59
    :cond_1
    :goto_0
    if-eqz v1, :cond_3

    .line 60
    .line 61
    iget-object v1, v0, Lq9;->i:Ljava/util/Map;

    .line 62
    .line 63
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_3

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ln3;

    .line 82
    .line 83
    iget-object v2, v2, Ln3;->a:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eqz v3, :cond_2

    .line 94
    .line 95
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Ljava/lang/String;

    .line 100
    .line 101
    iget-object v6, v5, LN6;->f:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v6, Lu9;

    .line 104
    .line 105
    const/4 v7, 0x0

    .line 106
    invoke-virtual {v6, v3, v7}, Lu9;->c(Ljava/lang/String;Z)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    const/4 v1, -0x1

    .line 111
    invoke-virtual {v0, v1}, Lq9;->c(I)V

    .line 112
    .line 113
    .line 114
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 115
    .line 116
    instance-of v2, v1, Lcf;

    .line 117
    .line 118
    if-eqz v2, :cond_4

    .line 119
    .line 120
    iget-object v2, v0, Lq9;->m:Ll9;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Lg9;->j(Lf5;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 126
    .line 127
    instance-of v2, v1, LVe;

    .line 128
    .line 129
    if-eqz v2, :cond_5

    .line 130
    .line 131
    iget-object v2, v0, Lq9;->l:Ll9;

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Lg9;->g(Lf5;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 137
    .line 138
    instance-of v2, v1, LZe;

    .line 139
    .line 140
    if-eqz v2, :cond_6

    .line 141
    .line 142
    iget-object v2, v0, Lq9;->n:Ll9;

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Lg9;->h(Lf5;)V

    .line 145
    .line 146
    .line 147
    :cond_6
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 148
    .line 149
    instance-of v2, v1, Laf;

    .line 150
    .line 151
    if-eqz v2, :cond_7

    .line 152
    .line 153
    iget-object v2, v0, Lq9;->o:Ll9;

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Lg9;->i(Lf5;)V

    .line 156
    .line 157
    .line 158
    :cond_7
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 159
    .line 160
    instance-of v2, v1, LOd;

    .line 161
    .line 162
    if-eqz v2, :cond_8

    .line 163
    .line 164
    iget-object v2, v0, Lq9;->p:Ln9;

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Lg9;->f(Lje;)V

    .line 167
    .line 168
    .line 169
    :cond_8
    iput-object v4, v0, Lq9;->r:Lg9;

    .line 170
    .line 171
    iput-object v4, v0, Lq9;->s:Lg9;

    .line 172
    .line 173
    iget-object v1, v0, Lq9;->f:Landroidx/activity/a;

    .line 174
    .line 175
    if-eqz v1, :cond_a

    .line 176
    .line 177
    iget-object v1, v0, Lq9;->g:LV2;

    .line 178
    .line 179
    iget-object v1, v1, LNe;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-eqz v2, :cond_9

    .line 190
    .line 191
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    check-cast v2, LN3;

    .line 196
    .line 197
    invoke-interface {v2}, LN3;->cancel()V

    .line 198
    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_9
    iput-object v4, v0, Lq9;->f:Landroidx/activity/a;

    .line 202
    .line 203
    :cond_a
    iget-object v1, v0, Lq9;->u:LE0;

    .line 204
    .line 205
    if-eqz v1, :cond_b

    .line 206
    .line 207
    invoke-virtual {v1}, LE0;->b()V

    .line 208
    .line 209
    .line 210
    iget-object v1, v0, Lq9;->v:LE0;

    .line 211
    .line 212
    invoke-virtual {v1}, LE0;->b()V

    .line 213
    .line 214
    .line 215
    iget-object v0, v0, Lq9;->w:LE0;

    .line 216
    .line 217
    invoke-virtual {v0}, LE0;->b()V

    .line 218
    .line 219
    .line 220
    :cond_b
    iget-object v0, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 221
    .line 222
    sget-object v1, LRc;->ON_DESTROY:LRc;

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    check-cast v0, Lqh;

    .line 233
    .line 234
    invoke-virtual {v0}, Lqh;->a()V

    .line 235
    .line 236
    .line 237
    throw v4
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, LX4;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p2, 0x6

    .line 10
    const/4 v1, 0x0

    .line 11
    if-ne p1, p2, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lh9;->mFragments:Lj9;

    .line 14
    .line 15
    iget-object p1, p1, Lj9;->a:Lg9;

    .line 16
    .line 17
    iget-object p1, p1, Lg9;->e:Lr9;

    .line 18
    .line 19
    iget p2, p1, Lq9;->q:I

    .line 20
    .line 21
    if-ge p2, v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object p1, p1, Lq9;->c:LN6;

    .line 25
    .line 26
    invoke-virtual {p1}, LN6;->j()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {p2}, Loh;->c(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    :goto_1
    return v1
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lh9;->mResumed:Z

    .line 6
    .line 7
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 8
    .line 9
    iget-object v0, v0, Lj9;->a:Lg9;

    .line 10
    .line 11
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    invoke-virtual {v0, v1}, Lq9;->c(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 18
    .line 19
    sget-object v1, LRc;->ON_PAUSE:LRc;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onPostResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPostResume()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lh9;->onResumeFragments()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lj9;->a()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1, p2, p3}, LX4;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lj9;->a()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lh9;->mResumed:Z

    .line 11
    .line 12
    iget-object v1, p0, Lh9;->mFragments:Lj9;

    .line 13
    .line 14
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 15
    .line 16
    iget-object v1, v1, Lg9;->e:Lr9;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lq9;->f(Z)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onResumeFragments()V
    .locals 2

    .line 1
    iget-object v0, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 2
    .line 3
    sget-object v1, LRc;->ON_RESUME:LRc;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 9
    .line 10
    iget-object v0, v0, Lj9;->a:Lg9;

    .line 11
    .line 12
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, v0, Lq9;->y:Z

    .line 16
    .line 17
    iput-boolean v1, v0, Lq9;->z:Z

    .line 18
    .line 19
    iget-object v1, v0, Lq9;->E:Lu9;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x7

    .line 25
    invoke-virtual {v0, v1}, Lq9;->c(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lj9;->a()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lh9;->mStopped:Z

    .line 11
    .line 12
    iget-boolean v1, p0, Lh9;->mCreated:Z

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iput-boolean v2, p0, Lh9;->mCreated:Z

    .line 18
    .line 19
    iget-object v1, p0, Lh9;->mFragments:Lj9;

    .line 20
    .line 21
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 22
    .line 23
    iget-object v1, v1, Lg9;->e:Lr9;

    .line 24
    .line 25
    iput-boolean v0, v1, Lq9;->y:Z

    .line 26
    .line 27
    iput-boolean v0, v1, Lq9;->z:Z

    .line 28
    .line 29
    iget-object v3, v1, Lq9;->E:Lu9;

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x4

    .line 35
    invoke-virtual {v1, v3}, Lq9;->c(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v1, p0, Lh9;->mFragments:Lj9;

    .line 39
    .line 40
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 41
    .line 42
    iget-object v1, v1, Lg9;->e:Lr9;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lq9;->f(Z)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 48
    .line 49
    sget-object v2, LRc;->ON_START:LRc;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lh9;->mFragments:Lj9;

    .line 55
    .line 56
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 57
    .line 58
    iget-object v1, v1, Lg9;->e:Lr9;

    .line 59
    .line 60
    iput-boolean v0, v1, Lq9;->y:Z

    .line 61
    .line 62
    iput-boolean v0, v1, Lq9;->z:Z

    .line 63
    .line 64
    iget-object v0, v1, Lq9;->E:Lu9;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {v1, v0}, Lq9;->c(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onStateNotSaved()V
    .locals 1

    .line 1
    iget-object v0, p0, Lh9;->mFragments:Lj9;

    .line 2
    .line 3
    invoke-virtual {v0}, Lj9;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lh9;->mStopped:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lh9;->markFragmentsCreated()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lh9;->mFragments:Lj9;

    .line 11
    .line 12
    iget-object v1, v1, Lj9;->a:Lg9;

    .line 13
    .line 14
    iget-object v1, v1, Lg9;->e:Lr9;

    .line 15
    .line 16
    iput-boolean v0, v1, Lq9;->z:Z

    .line 17
    .line 18
    iget-object v0, v1, Lq9;->E:Lu9;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    invoke-virtual {v1, v0}, Lq9;->c(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lh9;->mFragmentLifecycleRegistry:Landroidx/lifecycle/a;

    .line 28
    .line 29
    sget-object v1, LRc;->ON_STOP:LRc;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setEnterSharedElementCallback(Lfh;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setEnterSharedElementCallback(Landroid/app/SharedElementCallback;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setExitSharedElementCallback(Lfh;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setExitSharedElementCallback(Landroid/app/SharedElementCallback;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public startActivityFromFragment(Lc9;Landroid/content/Intent;I)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3, v0}, Lh9;->startActivityFromFragment(Lc9;Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public startActivityFromFragment(Lc9;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p3, p1, :cond_0

    .line 2
    invoke-virtual {p0, p2, p1, p4}, LX4;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 3
    throw p1
.end method

.method public startIntentSenderFromFragment(Lc9;Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    move v3, p3

    .line 3
    if-ne v3, v0, :cond_0

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move v5, p5

    .line 10
    move v6, p6

    .line 11
    move/from16 v7, p7

    .line 12
    .line 13
    move-object/from16 v8, p8

    .line 14
    .line 15
    invoke-virtual/range {v1 .. v8}, LX4;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    throw v0
.end method

.method public supportFinishAfterTransition()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->finishAfterTransition()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public supportPostponeEnterTransition()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->postponeEnterTransition()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public supportStartPostponedEnterTransition()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->startPostponedEnterTransition()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final validateRequestPermissionsRequestCode(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method
