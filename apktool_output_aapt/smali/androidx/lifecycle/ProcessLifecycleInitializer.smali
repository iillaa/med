.class public final Landroidx/lifecycle/ProcessLifecycleInitializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZb;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LZb;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, LG7;->c:LG7;

    return-object v0
.end method

.method public final b(Landroid/content/Context;)Ljava/lang/Object;
    .locals 4

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, LN2;->m(Landroid/content/Context;)LN2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "getInstance(context)"

    .line 11
    .line 12
    invoke-static {v1, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, v0, LN2;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ljava/util/HashSet;

    .line 18
    .line 19
    const-class v1, Landroidx/lifecycle/ProcessLifecycleInitializer;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, LVc;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const-string v1, "null cannot be cast to non-null type android.app.Application"

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v1, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    check-cast v0, Landroid/app/Application;

    .line 47
    .line 48
    new-instance v2, LUc;

    .line 49
    .line 50
    invoke-direct {v2}, LUc;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    sget-object v0, Lyf;->k:Lyf;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    new-instance v2, Landroid/os/Handler;

    .line 62
    .line 63
    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v2, v0, Lyf;->g:Landroid/os/Handler;

    .line 67
    .line 68
    iget-object v2, v0, Lyf;->h:Landroidx/lifecycle/a;

    .line 69
    .line 70
    sget-object v3, LRc;->ON_CREATE:LRc;

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {v1, p1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    check-cast p1, Landroid/app/Application;

    .line 83
    .line 84
    new-instance v1, Lxf;

    .line 85
    .line 86
    invoke-direct {v1, v0}, Lxf;-><init>(Lyf;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 90
    .line 91
    .line 92
    return-object v0

    .line 93
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 94
    .line 95
    const-string v0, "ProcessLifecycleInitializer cannot be initialized lazily.\n               Please ensure that you have:\n               <meta-data\n                   android:name=\'androidx.lifecycle.ProcessLifecycleInitializer\'\n                   android:value=\'androidx.startup\' />\n               under InitializationProvider in your AndroidManifest.xml"

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p1
.end method
