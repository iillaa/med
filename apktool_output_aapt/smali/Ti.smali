.class public abstract LTi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LSi;

.field public static final b:LGd;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "TypefaceCompat static init"

    .line 2
    .line 3
    invoke-static {v0}, Lu6;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1d

    .line 9
    .line 10
    if-lt v0, v1, :cond_0

    .line 11
    .line 12
    new-instance v0, LYi;

    .line 13
    .line 14
    invoke-direct {v0}, LSi;-><init>()V

    .line 15
    .line 16
    .line 17
    :goto_0
    sput-object v0, LTi;->a:LSi;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/16 v1, 0x1c

    .line 21
    .line 22
    if-lt v0, v1, :cond_1

    .line 23
    .line 24
    new-instance v0, LXi;

    .line 25
    .line 26
    invoke-direct {v0}, LWi;-><init>()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/16 v1, 0x1a

    .line 31
    .line 32
    if-lt v0, v1, :cond_2

    .line 33
    .line 34
    new-instance v0, LWi;

    .line 35
    .line 36
    invoke-direct {v0}, LWi;-><init>()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/16 v1, 0x18

    .line 41
    .line 42
    if-lt v0, v1, :cond_4

    .line 43
    .line 44
    sget-object v0, LVi;->j:Ljava/lang/reflect/Method;

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    const-string v1, "TypefaceCompatApi24Impl"

    .line 49
    .line 50
    const-string v2, "Unable to collect necessary private methods.Fallback to legacy implementation."

    .line 51
    .line 52
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_3
    if-eqz v0, :cond_4

    .line 56
    .line 57
    new-instance v0, LVi;

    .line 58
    .line 59
    invoke-direct {v0}, LSi;-><init>()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    new-instance v0, LUi;

    .line 64
    .line 65
    invoke-direct {v0}, LSi;-><init>()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :goto_1
    new-instance v0, LGd;

    .line 70
    .line 71
    const/16 v1, 0x10

    .line 72
    .line 73
    invoke-direct {v0, v1}, LGd;-><init>(I)V

    .line 74
    .line 75
    .line 76
    sput-object v0, LTi;->b:LGd;

    .line 77
    .line 78
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static a(Landroid/content/Context;LV8;Landroid/content/res/Resources;ILjava/lang/String;IILs2;)Landroid/graphics/Typeface;
    .locals 15

    move-object v0, p0

    move-object/from16 v1, p1

    move/from16 v7, p6

    move-object/from16 v2, p7

    const/4 v3, 0x2

    const/4 v4, 0x7

    const/4 v5, 0x4

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 1
    instance-of v9, v1, LY8;

    if-eqz v9, :cond_d

    check-cast v1, LY8;

    .line 2
    iget-object v9, v1, LY8;->e:Ljava/lang/String;

    const/4 v10, 0x0

    if-eqz v9, :cond_1

    .line 3
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v9, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    sget-object v11, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v11, v6}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v11

    if-eqz v9, :cond_1

    invoke-virtual {v9, v11}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    move-object v9, v10

    :goto_1
    if-eqz v9, :cond_2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 5
    new-instance v1, LQ2;

    invoke-direct {v1, v2, v4, v9}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-object v9

    .line 6
    :cond_2
    iget v4, v1, LY8;->d:I

    if-nez v4, :cond_3

    move v4, v8

    goto :goto_2

    :cond_3
    move v4, v6

    .line 7
    :goto_2
    iget v9, v1, LY8;->c:I

    .line 8
    new-instance v11, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v12

    invoke-direct {v11, v12}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 9
    new-instance v12, Li0;

    const/16 v13, 0x17

    .line 10
    invoke-direct {v12, v13}, Li0;-><init>(I)V

    .line 11
    iput-object v2, v12, Li0;->d:Ljava/lang/Object;

    .line 12
    iget-object v2, v1, LY8;->b:LO8;

    if-eqz v2, :cond_5

    .line 13
    iget-object v1, v1, LY8;->a:LO8;

    .line 14
    new-array v13, v3, [Ljava/lang/Object;

    aput-object v1, v13, v6

    aput-object v2, v13, v8

    .line 15
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    move v2, v6

    :goto_3
    if-ge v2, v3, :cond_4

    aget-object v14, v13, v2

    invoke-static {v14}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v2, v8

    goto :goto_3

    :cond_4
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    :goto_4
    move-object v13, v1

    goto :goto_5

    .line 16
    :cond_5
    iget-object v1, v1, LY8;->a:LO8;

    .line 17
    new-array v2, v8, [Ljava/lang/Object;

    aput-object v1, v2, v6

    .line 18
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(I)V

    aget-object v2, v2, v6

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    goto :goto_4

    .line 19
    :goto_5
    new-instance v14, LY1;

    .line 20
    new-instance v1, Lcg;

    invoke-direct {v1, v11}, Lcg;-><init>(Landroid/os/Handler;)V

    .line 21
    invoke-direct {v14, v12, v5, v1}, LY1;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    if-eqz v4, :cond_9

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v2

    if-gt v2, v8, :cond_8

    invoke-interface {v13, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, LO8;

    sget-object v2, LU8;->a:LGd;

    .line 22
    new-array v2, v8, [Ljava/lang/Object;

    aput-object v4, v2, v6

    .line 23
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    aget-object v2, v2, v6

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 24
    invoke-static {v2, v7}, LU8;->a(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, LU8;->a:LGd;

    invoke-virtual {v3, v2}, LGd;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Typeface;

    if-eqz v3, :cond_6

    .line 25
    new-instance v0, Lg0;

    invoke-direct {v0, v12, v3, v5, v6}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    invoke-virtual {v1, v0}, Lcg;->execute(Ljava/lang/Runnable;)V

    move-object v10, v3

    goto/16 :goto_9

    :cond_6
    const/4 v1, -0x1

    if-ne v9, v1, :cond_7

    .line 26
    new-array v1, v8, [Ljava/lang/Object;

    aput-object v4, v1, v6

    .line 27
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    aget-object v1, v1, v6

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 28
    invoke-static {v2, p0, v1, v7}, LU8;->b(Ljava/lang/String;Landroid/content/Context;Ljava/util/List;I)LT8;

    move-result-object v0

    invoke-virtual {v14, v0}, LY1;->i(LT8;)V

    iget-object v10, v0, LT8;->a:Landroid/graphics/Typeface;

    goto/16 :goto_9

    :cond_7
    new-instance v8, LR8;

    const/4 v6, 0x0

    move-object v1, v8

    move-object v3, p0

    move/from16 v5, p6

    invoke-direct/range {v1 .. v6}, LR8;-><init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/Object;II)V

    :try_start_0
    sget-object v0, LU8;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 29
    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3

    int-to-long v1, v9

    :try_start_1
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_2

    .line 30
    :try_start_2
    check-cast v0, LT8;

    invoke-virtual {v14, v0}, LY1;->i(LT8;)V

    iget-object v10, v0, LT8;->a:Landroid/graphics/Typeface;

    goto/16 :goto_9

    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    goto :goto_7

    .line 31
    :catch_2
    new-instance v0, Ljava/lang/InterruptedException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_6
    throw v0

    :goto_7
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_3

    .line 32
    :catch_3
    new-instance v0, Lj3;

    iget-object v1, v14, LY1;->d:Ljava/lang/Object;

    check-cast v1, Li0;

    const/4 v2, -0x3

    invoke-direct {v0, v1, v2}, Lj3;-><init>(Li0;I)V

    iget-object v1, v14, LY1;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/Executor;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_9

    .line 33
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Fallbacks with blocking fetches are not supported for performance reasons"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_9
    invoke-static {v13, v7}, LU8;->a(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v9

    sget-object v2, LU8;->a:LGd;

    invoke-virtual {v2, v9}, LGd;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    if-eqz v2, :cond_a

    .line 35
    new-instance v0, Lg0;

    invoke-direct {v0, v12, v2, v5, v6}, Lg0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    invoke-virtual {v1, v0}, Lcg;->execute(Ljava/lang/Runnable;)V

    move-object v10, v2

    goto :goto_9

    .line 36
    :cond_a
    new-instance v1, LS8;

    invoke-direct {v1, v6, v14}, LS8;-><init>(ILjava/lang/Object;)V

    sget-object v3, LU8;->c:Ljava/lang/Object;

    monitor-enter v3

    :try_start_3
    sget-object v2, LU8;->d:Lhh;

    invoke-virtual {v2, v9}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    if-eqz v4, :cond_b

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v3

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_a

    :cond_b
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v9, v4}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    new-instance v11, LR8;

    const/4 v6, 0x1

    move-object v1, v11

    move-object v2, v9

    move-object v3, p0

    move-object v4, v13

    move/from16 v5, p6

    invoke-direct/range {v1 .. v6}, LR8;-><init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/Object;II)V

    sget-object v0, LU8;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, LS8;

    invoke-direct {v1, v8, v9}, LS8;-><init>(ILjava/lang/Object;)V

    .line 37
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-nez v2, :cond_c

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    goto :goto_8

    :cond_c
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 38
    :goto_8
    new-instance v3, Ldg;

    .line 39
    invoke-direct {v3}, Ldg;-><init>()V

    iput-object v11, v3, Ldg;->d:Ljava/lang/Object;

    iput-object v1, v3, Ldg;->e:Ljava/lang/Object;

    iput-object v2, v3, Ldg;->f:Ljava/lang/Object;

    .line 40
    invoke-virtual {v0, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :goto_9
    move-object/from16 v5, p2

    goto :goto_b

    .line 41
    :goto_a
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 42
    :cond_d
    sget-object v3, LTi;->a:LSi;

    check-cast v1, LW8;

    move-object/from16 v5, p2

    invoke-virtual {v3, p0, v1, v5, v7}, LSi;->f(Landroid/content/Context;LW8;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object v10

    if-eqz v10, :cond_e

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 44
    new-instance v1, LQ2;

    invoke-direct {v1, v2, v4, v10}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_b

    .line 45
    :cond_e
    invoke-virtual/range {p7 .. p7}, Ls2;->a()V

    :goto_b
    if-eqz v10, :cond_f

    sget-object v0, LTi;->b:LGd;

    invoke-static/range {p2 .. p6}, LTi;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v10}, LGd;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    return-object v10
.end method

.method public static b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x2d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method
