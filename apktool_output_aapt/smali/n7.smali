.class public final Ln7;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ljava/lang/Object;

.field public static volatile j:Ln7;


# instance fields
.field public final a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field public final b:Lg3;

.field public volatile c:I

.field public final d:Landroid/os/Handler;

.field public final e:Li7;

.field public final f:Lm7;

.field public final g:I

.field public final h:LA6;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ln7;->i:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(LQ8;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    iput v1, p0, Ln7;->c:I

    .line 13
    .line 14
    iget-object v1, p1, LQ8;->a:Lm7;

    .line 15
    .line 16
    iput-object v1, p0, Ln7;->f:Lm7;

    .line 17
    .line 18
    iget v2, p1, LQ8;->b:I

    .line 19
    .line 20
    iput v2, p0, Ln7;->g:I

    .line 21
    .line 22
    iget-object p1, p1, LQ8;->c:LA6;

    .line 23
    .line 24
    iput-object p1, p0, Ln7;->h:LA6;

    .line 25
    .line 26
    new-instance p1, Landroid/os/Handler;

    .line 27
    .line 28
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-direct {p1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ln7;->d:Landroid/os/Handler;

    .line 36
    .line 37
    new-instance p1, Lg3;

    .line 38
    .line 39
    invoke-direct {p1}, Lg3;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ln7;->b:Lg3;

    .line 43
    .line 44
    new-instance p1, Li7;

    .line 45
    .line 46
    invoke-direct {p1, p0}, Li7;-><init>(Ln7;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ln7;->e:Li7;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 56
    .line 57
    .line 58
    if-nez v2, :cond_0

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    :try_start_0
    iput v2, p0, Ln7;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 72
    .line 73
    .line 74
    throw p1

    .line 75
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ln7;->b()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_1

    .line 87
    .line 88
    :try_start_1
    new-instance v0, Lh7;

    .line 89
    .line 90
    invoke-direct {v0, p1}, Lh7;-><init>(Li7;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v1, v0}, Lm7;->b(Lu6;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catchall_1
    move-exception p1

    .line 98
    invoke-virtual {p0, p1}, Ln7;->d(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    :goto_1
    return-void
.end method

.method public static a()Ln7;
    .locals 4

    .line 1
    sget-object v0, Ln7;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ln7;->j:Ln7;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    :goto_0
    const-string v3, "EmojiCompat is not initialized.\n\nYou must initialize EmojiCompat prior to referencing the EmojiCompat instance.\n\nThe most likely cause of this error is disabling the EmojiCompatInitializer\neither explicitly in AndroidManifest.xml, or by including\nandroidx.emoji2:emoji2-bundled.\n\nAutomatic initialization is typically performed by EmojiCompatInitializer. If\nyou are not expecting to initialize EmojiCompat manually in your application,\nplease check to ensure it has not been removed from your APK\'s manifest. You can\ndo this in Android Studio using Build > Analyze APK.\n\nIn the APK Analyzer, ensure that the startup entry for\nEmojiCompatInitializer and InitializationProvider is present in\n AndroidManifest.xml. If it is missing or contains tools:node=\"remove\", and you\nintend to use automatic configuration, verify:\n\n  1. Your application does not include emoji2-bundled\n  2. All modules do not contain an exclusion manifest rule for\n     EmojiCompatInitializer or InitializationProvider. For more information\n     about manifest exclusions see the documentation for the androidx startup\n     library.\n\nIf you intend to use emoji2-bundled, please call EmojiCompat.init. You can\nlearn more in the documentation for BundledEmojiCompatConfig.\n\nIf you intended to perform manual configuration, it is recommended that you call\nEmojiCompat.init immediately on application startup.\n\nIf you still cannot resolve this issue, please open a bug with your specific\nconfiguration to help improve error message."

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object v1

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 20
    .line 21
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw v1

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1
.end method


# virtual methods
.method public final b()I
    .locals 2

    .line 1
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget v0, p0, Ln7;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public final c()V
    .locals 3

    .line 1
    iget v0, p0, Ln7;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, v2, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-virtual {p0}, Ln7;->b()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ne v0, v2, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget v0, p0, Ln7;->c:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    :try_start_1
    iput v1, p0, Ln7;->c:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 43
    .line 44
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ln7;->e:Li7;

    .line 54
    .line 55
    iget-object v1, v0, Li7;->a:Ln7;

    .line 56
    .line 57
    :try_start_2
    new-instance v2, Lh7;

    .line 58
    .line 59
    invoke-direct {v2, v0}, Lh7;-><init>(Li7;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, v1, Ln7;->f:Lm7;

    .line 63
    .line 64
    invoke-interface {v0, v2}, Lm7;->b(Lu6;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    invoke-virtual {v1, v0}, Ln7;->d(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_1
    return-void

    .line 73
    :catchall_1
    move-exception v0

    .line 74
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 81
    .line 82
    .line 83
    throw v0

    .line 84
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    const-string v1, "Set metadataLoadStrategy to LOAD_STRATEGY_MANUAL to execute manual loading"

    .line 87
    .line 88
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw v0
.end method

.method public final d(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    :try_start_0
    iput v1, p0, Ln7;->c:I

    .line 17
    .line 18
    iget-object v1, p0, Ln7;->b:Lg3;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ln7;->b:Lg3;

    .line 24
    .line 25
    invoke-virtual {v1}, Lg3;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ln7;->d:Landroid/os/Handler;

    .line 38
    .line 39
    new-instance v2, Ll7;

    .line 40
    .line 41
    iget v3, p0, Ln7;->c:I

    .line 42
    .line 43
    invoke-direct {v2, v0, v3, p1}, Ll7;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public final e()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    :try_start_0
    iput v1, p0, Ln7;->c:I

    .line 17
    .line 18
    iget-object v1, p0, Ln7;->b:Lg3;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ln7;->b:Lg3;

    .line 24
    .line 25
    invoke-virtual {v1}, Lg3;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ln7;->d:Landroid/os/Handler;

    .line 38
    .line 39
    new-instance v2, Ll7;

    .line 40
    .line 41
    iget v3, p0, Ln7;->c:I

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-direct {v2, v0, v3, v4}, Ll7;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw v0
.end method

.method public final f(Ljava/lang/CharSequence;II)Ljava/lang/CharSequence;
    .locals 11

    .line 1
    invoke-virtual {p0}, Ln7;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    if-eqz v0, :cond_23

    .line 13
    .line 14
    if-ltz p2, :cond_22

    .line 15
    .line 16
    if-ltz p3, :cond_21

    .line 17
    .line 18
    if-gt p2, p3, :cond_1

    .line 19
    .line 20
    move v0, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_1
    if-eqz v0, :cond_20

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-gt p2, v3, :cond_3

    .line 34
    .line 35
    move v3, v2

    .line 36
    goto :goto_2

    .line 37
    :cond_3
    move v3, v1

    .line 38
    :goto_2
    if-eqz v3, :cond_1f

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-gt p3, v3, :cond_4

    .line 45
    .line 46
    move v3, v2

    .line 47
    goto :goto_3

    .line 48
    :cond_4
    move v3, v1

    .line 49
    :goto_3
    if-eqz v3, :cond_1e

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1d

    .line 56
    .line 57
    if-ne p2, p3, :cond_5

    .line 58
    .line 59
    goto/16 :goto_d

    .line 60
    .line 61
    :cond_5
    iget-object v3, p0, Ln7;->e:Li7;

    .line 62
    .line 63
    iget-object v3, v3, Li7;->b:LN2;

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    instance-of v4, p1, Lmh;

    .line 69
    .line 70
    if-eqz v4, :cond_6

    .line 71
    .line 72
    move-object v5, p1

    .line 73
    check-cast v5, Lmh;

    .line 74
    .line 75
    invoke-virtual {v5}, Lmh;->a()V

    .line 76
    .line 77
    .line 78
    :cond_6
    const-class v5, LZi;

    .line 79
    .line 80
    if-nez v4, :cond_8

    .line 81
    .line 82
    :try_start_0
    instance-of v6, p1, Landroid/text/Spannable;

    .line 83
    .line 84
    if-eqz v6, :cond_7

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_7
    instance-of v6, p1, Landroid/text/Spanned;

    .line 88
    .line 89
    if-eqz v6, :cond_9

    .line 90
    .line 91
    move-object v6, p1

    .line 92
    check-cast v6, Landroid/text/Spanned;

    .line 93
    .line 94
    add-int/lit8 v7, p2, -0x1

    .line 95
    .line 96
    add-int/lit8 v8, p3, 0x1

    .line 97
    .line 98
    invoke-interface {v6, v7, v8, v5}, Landroid/text/Spanned;->nextSpanTransition(IILjava/lang/Class;)I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-gt v6, p3, :cond_9

    .line 103
    .line 104
    new-instance v0, Lij;

    .line 105
    .line 106
    invoke-direct {v0, p1}, Lij;-><init>(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    goto :goto_5

    .line 110
    :catchall_0
    move-exception p2

    .line 111
    goto/16 :goto_c

    .line 112
    .line 113
    :cond_8
    :goto_4
    new-instance v0, Lij;

    .line 114
    .line 115
    move-object v6, p1

    .line 116
    check-cast v6, Landroid/text/Spannable;

    .line 117
    .line 118
    invoke-direct {v0, v6}, Lij;-><init>(Landroid/text/Spannable;)V

    .line 119
    .line 120
    .line 121
    :cond_9
    :goto_5
    if-eqz v0, :cond_b

    .line 122
    .line 123
    iget-object v6, v0, Lij;->d:Landroid/text/Spannable;

    .line 124
    .line 125
    invoke-interface {v6, p2, p3, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    check-cast v5, [LZi;

    .line 130
    .line 131
    if-eqz v5, :cond_b

    .line 132
    .line 133
    array-length v6, v5

    .line 134
    if-lez v6, :cond_b

    .line 135
    .line 136
    array-length v6, v5

    .line 137
    move v7, v1

    .line 138
    :goto_6
    if-ge v7, v6, :cond_b

    .line 139
    .line 140
    aget-object v8, v5, v7

    .line 141
    .line 142
    iget-object v9, v0, Lij;->d:Landroid/text/Spannable;

    .line 143
    .line 144
    invoke-interface {v9, v8}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 145
    .line 146
    .line 147
    move-result v9

    .line 148
    iget-object v10, v0, Lij;->d:Landroid/text/Spannable;

    .line 149
    .line 150
    invoke-interface {v10, v8}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    if-eq v9, p3, :cond_a

    .line 155
    .line 156
    invoke-virtual {v0, v8}, Lij;->removeSpan(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    :cond_a
    invoke-static {v9, p2}, Ljava/lang/Math;->min(II)I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    invoke-static {v10, p3}, Ljava/lang/Math;->max(II)I

    .line 164
    .line 165
    .line 166
    move-result p3

    .line 167
    add-int/lit8 v7, v7, 0x1

    .line 168
    .line 169
    goto :goto_6

    .line 170
    :cond_b
    if-eq p2, p3, :cond_1a

    .line 171
    .line 172
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-lt p2, v5, :cond_c

    .line 177
    .line 178
    goto/16 :goto_a

    .line 179
    .line 180
    :cond_c
    new-instance v5, Lw7;

    .line 181
    .line 182
    iget-object v6, v3, LN2;->b:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast v6, LN6;

    .line 185
    .line 186
    iget-object v6, v6, LN6;->c:Ljava/lang/Object;

    .line 187
    .line 188
    check-cast v6, Lqe;

    .line 189
    .line 190
    invoke-direct {v5, v6}, Lw7;-><init>(Lqe;)V

    .line 191
    .line 192
    .line 193
    invoke-static {p1, p2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 194
    .line 195
    .line 196
    move-result v6

    .line 197
    move v7, v6

    .line 198
    move v6, v1

    .line 199
    move-object v1, v0

    .line 200
    :cond_d
    :goto_7
    move v0, p2

    .line 201
    :cond_e
    :goto_8
    const/16 v8, 0x21

    .line 202
    .line 203
    const v9, 0x7fffffff

    .line 204
    .line 205
    .line 206
    const/4 v10, 0x2

    .line 207
    if-ge p2, p3, :cond_14

    .line 208
    .line 209
    if-ge v6, v9, :cond_14

    .line 210
    .line 211
    invoke-virtual {v5, v7}, Lw7;->a(I)I

    .line 212
    .line 213
    .line 214
    move-result v9

    .line 215
    if-eq v9, v2, :cond_12

    .line 216
    .line 217
    if-eq v9, v10, :cond_11

    .line 218
    .line 219
    const/4 v10, 0x3

    .line 220
    if-eq v9, v10, :cond_f

    .line 221
    .line 222
    goto :goto_8

    .line 223
    :cond_f
    iget-object v9, v5, Lw7;->d:Lqe;

    .line 224
    .line 225
    iget-object v9, v9, Lqe;->b:Lv7;

    .line 226
    .line 227
    invoke-virtual {v3, p1, v0, p2, v9}, LN2;->n(Ljava/lang/CharSequence;IILv7;)Z

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    if-nez v9, :cond_d

    .line 232
    .line 233
    if-nez v1, :cond_10

    .line 234
    .line 235
    new-instance v1, Lij;

    .line 236
    .line 237
    new-instance v9, Landroid/text/SpannableString;

    .line 238
    .line 239
    invoke-direct {v9, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 240
    .line 241
    .line 242
    invoke-direct {v1, v9}, Lij;-><init>(Landroid/text/Spannable;)V

    .line 243
    .line 244
    .line 245
    :cond_10
    iget-object v9, v5, Lw7;->d:Lqe;

    .line 246
    .line 247
    iget-object v9, v9, Lqe;->b:Lv7;

    .line 248
    .line 249
    iget-object v10, v3, LN2;->a:Ljava/lang/Object;

    .line 250
    .line 251
    check-cast v10, Lt5;

    .line 252
    .line 253
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    new-instance v10, LZi;

    .line 257
    .line 258
    invoke-direct {v10, v9}, LZi;-><init>(Lv7;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, v10, v0, p2, v8}, Lij;->setSpan(Ljava/lang/Object;III)V

    .line 262
    .line 263
    .line 264
    add-int/lit8 v6, v6, 0x1

    .line 265
    .line 266
    goto :goto_7

    .line 267
    :cond_11
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    add-int/2addr p2, v8

    .line 272
    if-ge p2, p3, :cond_e

    .line 273
    .line 274
    invoke-static {p1, p2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 275
    .line 276
    .line 277
    move-result v7

    .line 278
    goto :goto_8

    .line 279
    :cond_12
    invoke-static {p1, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    invoke-static {p2}, Ljava/lang/Character;->charCount(I)I

    .line 284
    .line 285
    .line 286
    move-result p2

    .line 287
    add-int/2addr v0, p2

    .line 288
    if-ge v0, p3, :cond_13

    .line 289
    .line 290
    invoke-static {p1, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 291
    .line 292
    .line 293
    move-result p2

    .line 294
    move v7, p2

    .line 295
    :cond_13
    move p2, v0

    .line 296
    goto :goto_8

    .line 297
    :cond_14
    iget p3, v5, Lw7;->a:I

    .line 298
    .line 299
    if-ne p3, v10, :cond_17

    .line 300
    .line 301
    iget-object p3, v5, Lw7;->c:Lqe;

    .line 302
    .line 303
    iget-object p3, p3, Lqe;->b:Lv7;

    .line 304
    .line 305
    if-eqz p3, :cond_17

    .line 306
    .line 307
    iget p3, v5, Lw7;->f:I

    .line 308
    .line 309
    if-gt p3, v2, :cond_15

    .line 310
    .line 311
    invoke-virtual {v5}, Lw7;->c()Z

    .line 312
    .line 313
    .line 314
    move-result p3

    .line 315
    if-eqz p3, :cond_17

    .line 316
    .line 317
    :cond_15
    if-ge v6, v9, :cond_17

    .line 318
    .line 319
    iget-object p3, v5, Lw7;->c:Lqe;

    .line 320
    .line 321
    iget-object p3, p3, Lqe;->b:Lv7;

    .line 322
    .line 323
    invoke-virtual {v3, p1, v0, p2, p3}, LN2;->n(Ljava/lang/CharSequence;IILv7;)Z

    .line 324
    .line 325
    .line 326
    move-result p3

    .line 327
    if-nez p3, :cond_17

    .line 328
    .line 329
    if-nez v1, :cond_16

    .line 330
    .line 331
    new-instance v1, Lij;

    .line 332
    .line 333
    invoke-direct {v1, p1}, Lij;-><init>(Ljava/lang/CharSequence;)V

    .line 334
    .line 335
    .line 336
    :cond_16
    iget-object p3, v5, Lw7;->c:Lqe;

    .line 337
    .line 338
    iget-object p3, p3, Lqe;->b:Lv7;

    .line 339
    .line 340
    iget-object v2, v3, LN2;->a:Ljava/lang/Object;

    .line 341
    .line 342
    check-cast v2, Lt5;

    .line 343
    .line 344
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 345
    .line 346
    .line 347
    new-instance v2, LZi;

    .line 348
    .line 349
    invoke-direct {v2, p3}, LZi;-><init>(Lv7;)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v1, v2, v0, p2, v8}, Lij;->setSpan(Ljava/lang/Object;III)V

    .line 353
    .line 354
    .line 355
    :cond_17
    if-eqz v1, :cond_19

    .line 356
    .line 357
    iget-object p2, v1, Lij;->d:Landroid/text/Spannable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 358
    .line 359
    if-eqz v4, :cond_18

    .line 360
    .line 361
    check-cast p1, Lmh;

    .line 362
    .line 363
    invoke-virtual {p1}, Lmh;->b()V

    .line 364
    .line 365
    .line 366
    :cond_18
    move-object p1, p2

    .line 367
    goto :goto_b

    .line 368
    :cond_19
    if-eqz v4, :cond_1b

    .line 369
    .line 370
    :goto_9
    move-object p2, p1

    .line 371
    check-cast p2, Lmh;

    .line 372
    .line 373
    invoke-virtual {p2}, Lmh;->b()V

    .line 374
    .line 375
    .line 376
    goto :goto_b

    .line 377
    :cond_1a
    :goto_a
    if-eqz v4, :cond_1b

    .line 378
    .line 379
    goto :goto_9

    .line 380
    :cond_1b
    :goto_b
    return-object p1

    .line 381
    :goto_c
    if-eqz v4, :cond_1c

    .line 382
    .line 383
    check-cast p1, Lmh;

    .line 384
    .line 385
    invoke-virtual {p1}, Lmh;->b()V

    .line 386
    .line 387
    .line 388
    :cond_1c
    throw p2

    .line 389
    :cond_1d
    :goto_d
    return-object p1

    .line 390
    :cond_1e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 391
    .line 392
    const-string p2, "end should be < than charSequence length"

    .line 393
    .line 394
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    throw p1

    .line 398
    :cond_1f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 399
    .line 400
    const-string p2, "start should be < than charSequence length"

    .line 401
    .line 402
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 403
    .line 404
    .line 405
    throw p1

    .line 406
    :cond_20
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 407
    .line 408
    const-string p2, "start should be <= than end"

    .line 409
    .line 410
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    throw p1

    .line 414
    :cond_21
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 415
    .line 416
    const-string p2, "end cannot be negative"

    .line 417
    .line 418
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    throw p1

    .line 422
    :cond_22
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 423
    .line 424
    const-string p2, "start cannot be negative"

    .line 425
    .line 426
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    throw p1

    .line 430
    :cond_23
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 431
    .line 432
    const-string p2, "Not initialized yet"

    .line 433
    .line 434
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    throw p1
.end method

.method public final g(Lk7;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "initCallback cannot be null"

    .line 3
    .line 4
    invoke-static {v1, p1}, LSi;->c(Ljava/lang/String;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget v1, p0, Ln7;->c:I

    .line 17
    .line 18
    if-eq v1, v0, :cond_1

    .line 19
    .line 20
    iget v1, p0, Ln7;->c:I

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    if-ne v1, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ln7;->b:Lg3;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lg3;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    :goto_0
    iget-object v1, p0, Ln7;->d:Landroid/os/Handler;

    .line 35
    .line 36
    new-instance v2, Ll7;

    .line 37
    .line 38
    iget v3, p0, Ln7;->c:I

    .line 39
    .line 40
    new-array v0, v0, [Lk7;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    aput-object p1, v0, v4

    .line 44
    .line 45
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-direct {v2, p1, v3, v0}, Ll7;-><init>(Ljava/util/List;ILjava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    .line 56
    :goto_1
    iget-object p1, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :goto_2
    iget-object v0, p0, Ln7;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method
