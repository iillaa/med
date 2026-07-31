.class public LMk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:[Ljava/lang/Object;

.field public static final e:Li0;

.field public static final f:Lt5;

.field public static final g:Ljava/lang/Object;


# instance fields
.field public final synthetic a:I

.field public final b:Landroid/view/Window;

.field public final c:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    sput-object v0, LMk;->d:[Ljava/lang/Object;

    .line 5
    .line 6
    new-instance v0, Li0;

    .line 7
    .line 8
    const-string v1, "CLOSED_EMPTY"

    .line 9
    .line 10
    const/16 v2, 0x14

    .line 11
    .line 12
    invoke-direct {v0, v2, v1}, Li0;-><init>(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, LMk;->e:Li0;

    .line 16
    .line 17
    new-instance v0, Lt5;

    .line 18
    .line 19
    const/16 v1, 0x13

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 22
    .line 23
    .line 24
    sput-object v0, LMk;->f:Lt5;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    sput-object v0, LMk;->g:Ljava/lang/Object;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/view/Window;Li0;I)V
    .locals 0

    .line 1
    iput p3, p0, LMk;->a:I

    .line 2
    .line 3
    packed-switch p3, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LMk;->b:Landroid/view/Window;

    .line 10
    .line 11
    iput-object p2, p0, LMk;->c:Ljava/lang/Object;

    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    invoke-static {p1}, LJk;->c(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, LMk;->c:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object p1, p0, LMk;->b:Landroid/view/Window;

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static A(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    const-string v1, "r"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v1, v0}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :cond_0
    return-object v0

    .line 20
    :cond_1
    :try_start_1
    new-instance p1, Ljava/io/FileInputStream;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {p1, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    :try_start_2
    invoke-virtual {p1}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    .line 34
    .line 35
    .line 36
    move-result-wide v6

    .line 37
    sget-object v3, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    .line 38
    .line 39
    const-wide/16 v4, 0x0

    .line 40
    .line 41
    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    :try_start_3
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    .line 47
    .line 48
    :try_start_4
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 49
    .line 50
    .line 51
    return-object v1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :catchall_1
    move-exception v1

    .line 55
    :try_start_5
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_2
    move-exception p1

    .line 60
    :try_start_6
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 64
    :goto_1
    :try_start_7
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :catchall_3
    move-exception p0

    .line 69
    :try_start_8
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_2
    throw p1
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 73
    :catch_0
    return-object v0
.end method

.method public static B(Landroid/content/pm/PackageInfo;Ljava/io/File;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    const-string v1, "profileinstaller_profileWrittenFor_lastUpdateTime.dat"

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance p1, Ljava/io/DataOutputStream;

    .line 9
    .line 10
    new-instance v1, Ljava/io/FileOutputStream;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :try_start_1
    iget-wide v0, p0, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    :try_start_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_1
    move-exception p1

    .line 33
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 37
    :catch_0
    :goto_1
    return-void
.end method

.method public static C(Landroid/app/Activity;[Ljava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    array-length v3, p1

    .line 9
    if-ge v2, v3, :cond_2

    .line 10
    .line 11
    aget-object v3, p1, v2

    .line 12
    .line 13
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-nez v3, :cond_1

    .line 18
    .line 19
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    const/16 v4, 0x21

    .line 22
    .line 23
    if-ge v3, v4, :cond_0

    .line 24
    .line 25
    aget-object v3, p1, v2

    .line 26
    .line 27
    const-string v4, "android.permission.POST_NOTIFICATIONS"

    .line 28
    .line 29
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 46
    .line 47
    new-instance p2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v0, "Permission request for permissions "

    .line 50
    .line 51
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, " must not contain null or empty values"

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0

    .line 74
    :cond_2
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-lez v2, :cond_3

    .line 79
    .line 80
    array-length v3, p1

    .line 81
    sub-int/2addr v3, v2

    .line 82
    new-array v3, v3, [Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move-object v3, p1

    .line 86
    :goto_1
    if-lez v2, :cond_6

    .line 87
    .line 88
    array-length v4, p1

    .line 89
    if-ne v2, v4, :cond_4

    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    move v2, v1

    .line 93
    :goto_2
    array-length v4, p1

    .line 94
    if-ge v1, v4, :cond_6

    .line 95
    .line 96
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v0, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    if-nez v4, :cond_5

    .line 105
    .line 106
    add-int/lit8 v4, v2, 0x1

    .line 107
    .line 108
    aget-object v5, p1, v1

    .line 109
    .line 110
    aput-object v5, v3, v2

    .line 111
    .line 112
    move v2, v4

    .line 113
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_6
    instance-of v0, p0, Lr0;

    .line 117
    .line 118
    if-eqz v0, :cond_7

    .line 119
    .line 120
    move-object v0, p0

    .line 121
    check-cast v0, Lr0;

    .line 122
    .line 123
    invoke-interface {v0, p2}, Lr0;->validateRequestPermissionsRequestCode(I)V

    .line 124
    .line 125
    .line 126
    :cond_7
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static E(Landroid/widget/TextView;I)V
    .locals 3

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4
    .line 5
    const/16 v1, 0x1c

    .line 6
    .line 7
    if-lt v0, v1, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, LS6;->j(Landroid/widget/TextView;I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Landroid/widget/TextView;->getIncludeFontPadding()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 31
    .line 32
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-le p1, v1, :cond_2

    .line 37
    .line 38
    add-int/2addr p1, v0

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {p0, v0, p1, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void

    .line 55
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 56
    .line 57
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 58
    .line 59
    .line 60
    throw p0
.end method

.method public static F(Landroid/widget/TextView;I)V
    .locals 3

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getIncludeFontPadding()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 21
    .line 22
    :goto_0
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-le p1, v1, :cond_1

    .line 27
    .line 28
    sub-int/2addr p1, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void

    .line 45
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 46
    .line 47
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 48
    .line 49
    .line 50
    throw p0
.end method

.method public static G(Landroid/graphics/drawable/Drawable;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static H(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static I(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final K(Ljava/util/Collection;)[Ljava/lang/Object;
    .locals 5

    .line 1
    const-string v0, "collection"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sget-object v1, LMk;->d:[Ljava/lang/Object;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_1
    new-array v0, v0, [Ljava/lang/Object;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    move v4, v1

    .line 30
    move-object v1, v0

    .line 31
    move v0, v4

    .line 32
    :goto_0
    add-int/lit8 v2, v0, 0x1

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    aput-object v3, v1, v0

    .line 39
    .line 40
    array-length v0, v1

    .line 41
    const-string v3, "copyOf(...)"

    .line 42
    .line 43
    if-lt v2, v0, :cond_6

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    mul-int/lit8 v0, v2, 0x3

    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    ushr-int/lit8 v0, v0, 0x1

    .line 57
    .line 58
    if-gt v0, v2, :cond_4

    .line 59
    .line 60
    const v0, 0x7ffffffd

    .line 61
    .line 62
    .line 63
    if-ge v2, v0, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 67
    .line 68
    invoke-direct {p0}, Ljava/lang/OutOfMemoryError;-><init>()V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :cond_4
    :goto_1
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v3, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    move v0, v2

    .line 80
    goto :goto_0

    .line 81
    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v3, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :goto_2
    return-object v1
.end method

.method public static final L(Ljava/util/Collection;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5

    .line 1
    const-string v0, "collection"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    array-length p0, p1

    .line 18
    if-lez p0, :cond_9

    .line 19
    .line 20
    aput-object v1, p1, v2

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    array-length p0, p1

    .line 35
    if-lez p0, :cond_9

    .line 36
    .line 37
    aput-object v1, p1, v2

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    array-length v3, p1

    .line 41
    if-gt v0, v3, :cond_2

    .line 42
    .line 43
    move-object v0, p1

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-static {v3, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v3, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>"

    .line 58
    .line 59
    invoke-static {v3, v0}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    check-cast v0, [Ljava/lang/Object;

    .line 63
    .line 64
    :goto_0
    add-int/lit8 v3, v2, 0x1

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    aput-object v4, v0, v2

    .line 71
    .line 72
    array-length v2, v0

    .line 73
    const-string v4, "copyOf(...)"

    .line 74
    .line 75
    if-lt v3, v2, :cond_7

    .line 76
    .line 77
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_3

    .line 82
    .line 83
    move-object p1, v0

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    mul-int/lit8 v2, v3, 0x3

    .line 86
    .line 87
    add-int/lit8 v2, v2, 0x1

    .line 88
    .line 89
    ushr-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    if-gt v2, v3, :cond_5

    .line 92
    .line 93
    const v2, 0x7ffffffd

    .line 94
    .line 95
    .line 96
    if-ge v3, v2, :cond_4

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    new-instance p0, Ljava/lang/OutOfMemoryError;

    .line 100
    .line 101
    invoke-direct {p0}, Ljava/lang/OutOfMemoryError;-><init>()V

    .line 102
    .line 103
    .line 104
    throw p0

    .line 105
    :cond_5
    :goto_1
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v4, v0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    move v2, v3

    .line 113
    goto :goto_0

    .line 114
    :cond_7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-nez v2, :cond_6

    .line 119
    .line 120
    if-ne v0, p1, :cond_8

    .line 121
    .line 122
    aput-object v1, p1, v3

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_8
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {v4, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_9
    :goto_2
    return-object p1
.end method

.method public static M(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;
    .locals 2

    .line 1
    instance-of v0, p0, Lii;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x1a

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lii;

    .line 12
    .line 13
    iget-object p0, p0, Lii;->a:Landroid/view/ActionMode$Callback;

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method public static final N(Lr5;LY5;Ljava/lang/Object;)Ldj;
    .locals 2

    .line 1
    instance-of v0, p0, Lj6;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    sget-object v0, Lej;->c:Lej;

    .line 8
    .line 9
    invoke-interface {p1, v0}, LY5;->c(LX5;)LW5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    check-cast p0, Lj6;

    .line 16
    .line 17
    :cond_1
    instance-of v0, p0, LP6;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    invoke-interface {p0}, Lj6;->e()Lj6;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_3

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_3
    instance-of v0, p0, Ldj;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    move-object v1, p0

    .line 34
    check-cast v1, Ldj;

    .line 35
    .line 36
    :goto_0
    if-eqz v1, :cond_4

    .line 37
    .line 38
    invoke-virtual {v1, p1, p2}, Ldj;->R(LY5;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    return-object v1
.end method

.method public static final O(LY5;LN9;Ls5;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    new-instance v2, LZ5;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v2, v3}, LZ5;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v1, v2}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-interface {v0, p0}, LY5;->k(LY5;)LY5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {v0, p0, v2}, LMk;->n(LY5;LY5;Z)LY5;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :goto_0
    sget-object v1, Lt5;->g:Lt5;

    .line 36
    .line 37
    invoke-interface {p0, v1}, LY5;->c(LX5;)LW5;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Luc;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-interface {v1}, Luc;->b()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    check-cast v1, LBc;

    .line 53
    .line 54
    invoke-virtual {v1}, LBc;->u()Ljava/util/concurrent/CancellationException;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    throw p0

    .line 59
    :cond_2
    :goto_1
    if-ne p0, v0, :cond_3

    .line 60
    .line 61
    new-instance v0, LMg;

    .line 62
    .line 63
    invoke-direct {v0, p2, p0}, LMg;-><init>(Lr5;LY5;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v0, p1}, Lr3;->F(LMg;LMg;LN9;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    goto/16 :goto_3

    .line 71
    .line 72
    :cond_3
    sget-object v1, Lt5;->d:Lt5;

    .line 73
    .line 74
    invoke-interface {p0, v1}, LY5;->c(LX5;)LW5;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-interface {v0, v1}, LY5;->c(LX5;)LW5;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v3, v0}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v1, 0x0

    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    new-instance v0, Ldj;

    .line 90
    .line 91
    invoke-direct {v0, p0, p2}, Ldj;-><init>(LY5;Ls5;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, v0, Lf;->e:LY5;

    .line 95
    .line 96
    invoke-static {p0, v1}, Lr3;->J(LY5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    :try_start_0
    invoke-static {v0, v0, p1}, Lr3;->F(LMg;LMg;LN9;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    invoke-static {p0, p2}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    move-object p0, p1

    .line 108
    goto :goto_3

    .line 109
    :catchall_0
    move-exception p1

    .line 110
    invoke-static {p0, p2}, Lr3;->D(LY5;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    throw p1

    .line 114
    :cond_4
    new-instance v0, LP6;

    .line 115
    .line 116
    invoke-direct {v0, p2, p0}, LMg;-><init>(Lr5;LY5;)V

    .line 117
    .line 118
    .line 119
    :try_start_1
    invoke-static {p1, v0, v0}, LMk;->j(LN9;Ljava/lang/Object;Lr5;)Lr5;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, LMk;->w(Lr5;)Lr5;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    sget-object p1, Lfj;->a:Lfj;

    .line 128
    .line 129
    invoke-static {p0, p1}, Llc;->G(Lr5;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 130
    .line 131
    .line 132
    :cond_5
    sget-object p0, LP6;->g:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_b

    .line 139
    .line 140
    const/4 p0, 0x2

    .line 141
    if-ne p1, p0, :cond_a

    .line 142
    .line 143
    sget-object p0, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    instance-of p1, p0, LYb;

    .line 150
    .line 151
    if-eqz p1, :cond_6

    .line 152
    .line 153
    move-object v1, p0

    .line 154
    check-cast v1, LYb;

    .line 155
    .line 156
    :cond_6
    if-eqz v1, :cond_8

    .line 157
    .line 158
    iget-object p1, v1, LYb;->a:LXb;

    .line 159
    .line 160
    if-nez p1, :cond_7

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_7
    move-object p0, p1

    .line 164
    :cond_8
    :goto_2
    nop

    .line 165
    instance-of p1, p0, LI4;

    .line 166
    .line 167
    if-nez p1, :cond_9

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_9
    check-cast p0, LI4;

    .line 171
    .line 172
    iget-object p0, p0, LI4;->a:Ljava/lang/Throwable;

    .line 173
    .line 174
    throw p0

    .line 175
    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 176
    .line 177
    const-string p1, "Already suspended"

    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    throw p0

    .line 187
    :cond_b
    const/4 p1, 0x1

    .line 188
    invoke-virtual {p0, v0, v2, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-eqz p0, :cond_5

    .line 193
    .line 194
    sget-object p0, Li6;->c:Li6;

    .line 195
    .line 196
    :goto_3
    return-object p0

    .line 197
    :catchall_1
    move-exception p0

    .line 198
    invoke-static {p0}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {v0, p1}, Lf;->h(Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    throw p0
.end method

.method public static P(Landroid/view/ActionMode$Callback;Landroid/widget/TextView;)Landroid/view/ActionMode$Callback;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    const/16 v1, 0x1b

    .line 8
    .line 9
    if-gt v0, v1, :cond_1

    .line 10
    .line 11
    instance-of v0, p0, Lii;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Lii;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Lii;-><init>(Landroid/view/ActionMode$Callback;Landroid/widget/TextView;)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    :goto_0
    return-object p0
.end method

.method public static Q(LN9;Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, LE7;->c:LE7;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v0, Lmc;

    .line 15
    .line 16
    invoke-direct {v0, p2}, Lo3;-><init>(Lr5;)V

    .line 17
    .line 18
    .line 19
    if-eqz p2, :cond_2

    .line 20
    .line 21
    invoke-interface {p2}, Lr5;->getContext()LY5;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    sget-object v1, LE7;->c:LE7;

    .line 26
    .line 27
    if-ne p2, v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 31
    .line 32
    const-string p1, "Coroutines with restricted suspension must have EmptyCoroutineContext"

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0

    .line 42
    :cond_1
    new-instance v1, Lnc;

    .line 43
    .line 44
    invoke-direct {v1, p2, v0}, Ls5;-><init>(Lr5;LY5;)V

    .line 45
    .line 46
    .line 47
    move-object v0, v1

    .line 48
    :cond_2
    :goto_0
    const/4 p2, 0x2

    .line 49
    invoke-static {p2, p0}, LSi;->b(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p0, p1, v0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public static R(Landroid/content/Context;Ljava/util/concurrent/Executor;LCf;Z)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v8, p2

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 18
    .line 19
    .line 20
    move-result-object v9

    .line 21
    new-instance v0, Ljava/io/File;

    .line 22
    .line 23
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v11, 0x0

    .line 37
    :try_start_0
    invoke-virtual {v0, v2, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 38
    .line 39
    .line 40
    move-result-object v12
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_13

    .line 41
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object v13

    .line 45
    const-string v3, "ProfileInstaller"

    .line 46
    .line 47
    const/4 v14, 0x0

    .line 48
    const/4 v15, 0x1

    .line 49
    if-nez p3, :cond_4

    .line 50
    .line 51
    new-instance v0, Ljava/io/File;

    .line 52
    .line 53
    const-string v4, "profileinstaller_profileWrittenFor_lastUpdateTime.dat"

    .line 54
    .line 55
    invoke-direct {v0, v13, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_0

    .line 63
    .line 64
    :catch_0
    move v0, v11

    .line 65
    goto :goto_2

    .line 66
    :cond_0
    :try_start_1
    new-instance v4, Ljava/io/DataInputStream;

    .line 67
    .line 68
    new-instance v5, Ljava/io/FileInputStream;

    .line 69
    .line 70
    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {v4, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 74
    .line 75
    .line 76
    :try_start_2
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readLong()J

    .line 77
    .line 78
    .line 79
    move-result-wide v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 81
    .line 82
    .line 83
    iget-wide v4, v12, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 84
    .line 85
    cmp-long v0, v16, v4

    .line 86
    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    move v0, v15

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v0, v11

    .line 92
    :goto_0
    if-eqz v0, :cond_2

    .line 93
    .line 94
    const/4 v4, 0x2

    .line 95
    invoke-interface {v8, v4, v14}, LCf;->f(ILjava/io/Serializable;)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :catchall_0
    move-exception v0

    .line 100
    move-object v5, v0

    .line 101
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :catchall_1
    move-exception v0

    .line 106
    move-object v4, v0

    .line 107
    :try_start_5
    invoke-virtual {v5, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :goto_1
    throw v5
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 111
    :cond_2
    :goto_2
    if-nez v0, :cond_3

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v2, "Skipping profile installation for "

    .line 117
    .line 118
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    :goto_3
    invoke-static {v1, v11}, LIf;->c(Landroid/content/Context;Z)V

    .line 136
    .line 137
    .line 138
    goto/16 :goto_2f

    .line 139
    .line 140
    :cond_4
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v4, "Installing profile for "

    .line 143
    .line 144
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 162
    .line 163
    new-instance v7, Ljava/io/File;

    .line 164
    .line 165
    new-instance v3, Ljava/io/File;

    .line 166
    .line 167
    const-string v4, "/data/misc/profiles/cur/0"

    .line 168
    .line 169
    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    const-string v2, "primary.prof"

    .line 173
    .line 174
    invoke-direct {v7, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    new-instance v5, LJ6;

    .line 178
    .line 179
    const-string v4, "dexopt/baseline.prof"

    .line 180
    .line 181
    move-object v2, v5

    .line 182
    move-object v3, v9

    .line 183
    move-object v11, v4

    .line 184
    move-object/from16 v4, p1

    .line 185
    .line 186
    move-object v10, v5

    .line 187
    move-object/from16 v5, p2

    .line 188
    .line 189
    move-object/from16 v18, v7

    .line 190
    .line 191
    invoke-direct/range {v2 .. v7}, LJ6;-><init>(Landroid/content/res/AssetManager;Ljava/util/concurrent/Executor;LCf;Ljava/lang/String;Ljava/io/File;)V

    .line 192
    .line 193
    .line 194
    iget-object v2, v10, LJ6;->c:[B

    .line 195
    .line 196
    if-nez v2, :cond_5

    .line 197
    .line 198
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    const/4 v2, 0x3

    .line 203
    invoke-virtual {v10, v2, v0}, LJ6;->b(ILjava/io/Serializable;)V

    .line 204
    .line 205
    .line 206
    :goto_5
    move v6, v15

    .line 207
    goto/16 :goto_2d

    .line 208
    .line 209
    :cond_5
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    const/4 v3, 0x4

    .line 214
    if-eqz v0, :cond_6

    .line 215
    .line 216
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->canWrite()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_7

    .line 221
    .line 222
    invoke-virtual {v10, v3, v14}, LJ6;->b(ILjava/io/Serializable;)V

    .line 223
    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_6
    :try_start_6
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->createNewFile()Z
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_12

    .line 227
    .line 228
    .line 229
    :cond_7
    iput-boolean v15, v10, LJ6;->f:Z

    .line 230
    .line 231
    sget-object v4, Lr3;->r:[B

    .line 232
    .line 233
    const/4 v5, 0x6

    .line 234
    :try_start_7
    invoke-virtual {v10, v9, v11}, LJ6;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 235
    .line 236
    .line 237
    move-result-object v0
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 238
    move-object v6, v0

    .line 239
    goto :goto_7

    .line 240
    :catch_1
    move-exception v0

    .line 241
    move-object v6, v0

    .line 242
    const/4 v7, 0x7

    .line 243
    invoke-interface {v8, v7, v6}, LCf;->f(ILjava/io/Serializable;)V

    .line 244
    .line 245
    .line 246
    goto :goto_6

    .line 247
    :catch_2
    move-exception v0

    .line 248
    move-object v6, v0

    .line 249
    invoke-interface {v8, v5, v6}, LCf;->f(ILjava/io/Serializable;)V

    .line 250
    .line 251
    .line 252
    :goto_6
    move-object v6, v14

    .line 253
    :goto_7
    const-string v7, "Invalid magic"

    .line 254
    .line 255
    const/16 v11, 0x8

    .line 256
    .line 257
    if-eqz v6, :cond_9

    .line 258
    .line 259
    :try_start_8
    invoke-static {v6, v3}, LSi;->B(Ljava/io/InputStream;I)[B

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-static {v4, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-eqz v0, :cond_8

    .line 268
    .line 269
    invoke-static {v6, v3}, LSi;->B(Ljava/io/InputStream;I)[B

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iget-object v5, v10, LJ6;->e:Ljava/lang/String;

    .line 274
    .line 275
    invoke-static {v6, v0, v5}, Lr3;->A(Ljava/io/FileInputStream;[BLjava/lang/String;)[LK6;

    .line 276
    .line 277
    .line 278
    move-result-object v5
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 279
    :try_start_9
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 280
    .line 281
    .line 282
    goto :goto_e

    .line 283
    :catch_3
    move-exception v0

    .line 284
    move-object v6, v0

    .line 285
    const/4 v15, 0x7

    .line 286
    invoke-interface {v8, v15, v6}, LCf;->f(ILjava/io/Serializable;)V

    .line 287
    .line 288
    .line 289
    goto :goto_e

    .line 290
    :goto_8
    move-object v1, v0

    .line 291
    goto :goto_f

    .line 292
    :goto_9
    const/4 v15, 0x7

    .line 293
    goto :goto_c

    .line 294
    :catchall_2
    move-exception v0

    .line 295
    goto :goto_8

    .line 296
    :catch_4
    move-exception v0

    .line 297
    goto :goto_a

    .line 298
    :catch_5
    move-exception v0

    .line 299
    goto :goto_9

    .line 300
    :cond_8
    :try_start_a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 301
    .line 302
    invoke-direct {v0, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    throw v0
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 306
    :goto_a
    :try_start_b
    invoke-interface {v8, v11, v0}, LCf;->f(ILjava/io/Serializable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 307
    .line 308
    .line 309
    :try_start_c
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_6

    .line 310
    .line 311
    .line 312
    goto :goto_d

    .line 313
    :catch_6
    move-exception v0

    .line 314
    move-object v5, v0

    .line 315
    const/4 v15, 0x7

    .line 316
    :goto_b
    invoke-interface {v8, v15, v5}, LCf;->f(ILjava/io/Serializable;)V

    .line 317
    .line 318
    .line 319
    goto :goto_d

    .line 320
    :catchall_3
    move-exception v0

    .line 321
    const/4 v15, 0x7

    .line 322
    goto :goto_8

    .line 323
    :goto_c
    :try_start_d
    invoke-interface {v8, v15, v0}, LCf;->f(ILjava/io/Serializable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 324
    .line 325
    .line 326
    :try_start_e
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_7

    .line 327
    .line 328
    .line 329
    goto :goto_d

    .line 330
    :catch_7
    move-exception v0

    .line 331
    move-object v5, v0

    .line 332
    goto :goto_b

    .line 333
    :goto_d
    move-object v5, v14

    .line 334
    :goto_e
    iput-object v5, v10, LJ6;->g:[LK6;

    .line 335
    .line 336
    goto :goto_11

    .line 337
    :goto_f
    :try_start_f
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8

    .line 338
    .line 339
    .line 340
    goto :goto_10

    .line 341
    :catch_8
    move-exception v0

    .line 342
    move-object v2, v0

    .line 343
    const/4 v3, 0x7

    .line 344
    invoke-interface {v8, v3, v2}, LCf;->f(ILjava/io/Serializable;)V

    .line 345
    .line 346
    .line 347
    :goto_10
    throw v1

    .line 348
    :cond_9
    :goto_11
    iget-object v0, v10, LJ6;->g:[LK6;

    .line 349
    .line 350
    if-eqz v0, :cond_f

    .line 351
    .line 352
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 353
    .line 354
    const/16 v6, 0x18

    .line 355
    .line 356
    if-lt v5, v6, :cond_f

    .line 357
    .line 358
    const/16 v15, 0x22

    .line 359
    .line 360
    if-le v5, v15, :cond_a

    .line 361
    .line 362
    goto/16 :goto_19

    .line 363
    .line 364
    :cond_a
    if-eq v5, v6, :cond_b

    .line 365
    .line 366
    const/16 v6, 0x19

    .line 367
    .line 368
    if-eq v5, v6, :cond_b

    .line 369
    .line 370
    packed-switch v5, :pswitch_data_0

    .line 371
    .line 372
    .line 373
    goto :goto_19

    .line 374
    :cond_b
    :pswitch_0
    :try_start_10
    const-string v5, "dexopt/baseline.profm"

    .line 375
    .line 376
    invoke-virtual {v10, v9, v5}, LJ6;->a(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 377
    .line 378
    .line 379
    move-result-object v5
    :try_end_10
    .catch Ljava/io/FileNotFoundException; {:try_start_10 .. :try_end_10} :catch_b
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_10 .. :try_end_10} :catch_9

    .line 380
    if-eqz v5, :cond_d

    .line 381
    .line 382
    :try_start_11
    sget-object v6, Lr3;->s:[B

    .line 383
    .line 384
    invoke-static {v5, v3}, LSi;->B(Ljava/io/InputStream;I)[B

    .line 385
    .line 386
    .line 387
    move-result-object v9

    .line 388
    invoke-static {v6, v9}, Ljava/util/Arrays;->equals([B[B)Z

    .line 389
    .line 390
    .line 391
    move-result v6

    .line 392
    if-eqz v6, :cond_c

    .line 393
    .line 394
    invoke-static {v5, v3}, LSi;->B(Ljava/io/InputStream;I)[B

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    invoke-static {v5, v3, v2, v0}, Lr3;->x(Ljava/io/FileInputStream;[B[B[LK6;)[LK6;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    iput-object v0, v10, LJ6;->g:[LK6;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    .line 403
    .line 404
    :try_start_12
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_12} :catch_b
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_12 .. :try_end_12} :catch_9

    .line 405
    .line 406
    .line 407
    move-object v5, v10

    .line 408
    goto :goto_18

    .line 409
    :catch_9
    move-exception v0

    .line 410
    goto :goto_14

    .line 411
    :catch_a
    move-exception v0

    .line 412
    const/4 v2, 0x7

    .line 413
    goto :goto_15

    .line 414
    :catch_b
    move-exception v0

    .line 415
    goto :goto_16

    .line 416
    :catchall_4
    move-exception v0

    .line 417
    move-object v2, v0

    .line 418
    goto :goto_12

    .line 419
    :cond_c
    :try_start_13
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 420
    .line 421
    invoke-direct {v0, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_4

    .line 425
    :goto_12
    :try_start_14
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_5

    .line 426
    .line 427
    .line 428
    goto :goto_13

    .line 429
    :catchall_5
    move-exception v0

    .line 430
    move-object v3, v0

    .line 431
    :try_start_15
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 432
    .line 433
    .line 434
    :goto_13
    throw v2

    .line 435
    :cond_d
    if-eqz v5, :cond_e

    .line 436
    .line 437
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_15 .. :try_end_15} :catch_b
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_15 .. :try_end_15} :catch_9

    .line 438
    .line 439
    .line 440
    goto :goto_17

    .line 441
    :goto_14
    iput-object v14, v10, LJ6;->g:[LK6;

    .line 442
    .line 443
    invoke-interface {v8, v11, v0}, LCf;->f(ILjava/io/Serializable;)V

    .line 444
    .line 445
    .line 446
    goto :goto_17

    .line 447
    :goto_15
    invoke-interface {v8, v2, v0}, LCf;->f(ILjava/io/Serializable;)V

    .line 448
    .line 449
    .line 450
    goto :goto_17

    .line 451
    :goto_16
    const/16 v2, 0x9

    .line 452
    .line 453
    goto :goto_15

    .line 454
    :cond_e
    :goto_17
    move-object v5, v14

    .line 455
    :goto_18
    if-eqz v5, :cond_f

    .line 456
    .line 457
    goto :goto_1a

    .line 458
    :cond_f
    :goto_19
    move-object v5, v10

    .line 459
    :goto_1a
    iget-object v2, v5, LJ6;->b:LCf;

    .line 460
    .line 461
    iget-object v0, v5, LJ6;->g:[LK6;

    .line 462
    .line 463
    const-string v3, "This device doesn\'t support aot. Did you call deviceSupportsAotProfile()?"

    .line 464
    .line 465
    if-eqz v0, :cond_13

    .line 466
    .line 467
    iget-object v6, v5, LJ6;->c:[B

    .line 468
    .line 469
    if-nez v6, :cond_10

    .line 470
    .line 471
    goto :goto_20

    .line 472
    :cond_10
    iget-boolean v7, v5, LJ6;->f:Z

    .line 473
    .line 474
    if-eqz v7, :cond_12

    .line 475
    .line 476
    :try_start_16
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    .line 477
    .line 478
    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_d
    .catch Ljava/lang/IllegalStateException; {:try_start_16 .. :try_end_16} :catch_c

    .line 479
    .line 480
    .line 481
    :try_start_17
    invoke-virtual {v7, v4}, Ljava/io/OutputStream;->write([B)V

    .line 482
    .line 483
    .line 484
    invoke-virtual {v7, v6}, Ljava/io/OutputStream;->write([B)V

    .line 485
    .line 486
    .line 487
    invoke-static {v7, v6, v0}, Lr3;->I(Ljava/io/ByteArrayOutputStream;[B[LK6;)Z

    .line 488
    .line 489
    .line 490
    move-result v0

    .line 491
    if-nez v0, :cond_11

    .line 492
    .line 493
    const/4 v0, 0x5

    .line 494
    invoke-interface {v2, v0, v14}, LCf;->f(ILjava/io/Serializable;)V

    .line 495
    .line 496
    .line 497
    iput-object v14, v5, LJ6;->g:[LK6;
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_6

    .line 498
    .line 499
    :try_start_18
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_d
    .catch Ljava/lang/IllegalStateException; {:try_start_18 .. :try_end_18} :catch_c

    .line 500
    .line 501
    .line 502
    goto :goto_20

    .line 503
    :catch_c
    move-exception v0

    .line 504
    goto :goto_1d

    .line 505
    :catch_d
    move-exception v0

    .line 506
    const/4 v4, 0x7

    .line 507
    goto :goto_1e

    .line 508
    :catchall_6
    move-exception v0

    .line 509
    move-object v4, v0

    .line 510
    goto :goto_1b

    .line 511
    :cond_11
    :try_start_19
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    iput-object v0, v5, LJ6;->h:[B
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_6

    .line 516
    .line 517
    :try_start_1a
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_d
    .catch Ljava/lang/IllegalStateException; {:try_start_1a .. :try_end_1a} :catch_c

    .line 518
    .line 519
    .line 520
    goto :goto_1f

    .line 521
    :goto_1b
    :try_start_1b
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_7

    .line 522
    .line 523
    .line 524
    goto :goto_1c

    .line 525
    :catchall_7
    move-exception v0

    .line 526
    move-object v6, v0

    .line 527
    :try_start_1c
    invoke-virtual {v4, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 528
    .line 529
    .line 530
    :goto_1c
    throw v4
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_d
    .catch Ljava/lang/IllegalStateException; {:try_start_1c .. :try_end_1c} :catch_c

    .line 531
    :goto_1d
    invoke-interface {v2, v11, v0}, LCf;->f(ILjava/io/Serializable;)V

    .line 532
    .line 533
    .line 534
    goto :goto_1f

    .line 535
    :goto_1e
    invoke-interface {v2, v4, v0}, LCf;->f(ILjava/io/Serializable;)V

    .line 536
    .line 537
    .line 538
    :goto_1f
    iput-object v14, v5, LJ6;->g:[LK6;

    .line 539
    .line 540
    goto :goto_20

    .line 541
    :cond_12
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 542
    .line 543
    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    throw v0

    .line 547
    :cond_13
    :goto_20
    iget-object v0, v5, LJ6;->h:[B

    .line 548
    .line 549
    if-nez v0, :cond_14

    .line 550
    .line 551
    const/4 v0, 0x0

    .line 552
    const/4 v6, 0x1

    .line 553
    goto/16 :goto_2b

    .line 554
    .line 555
    :cond_14
    iget-boolean v2, v5, LJ6;->f:Z

    .line 556
    .line 557
    if-eqz v2, :cond_16

    .line 558
    .line 559
    :try_start_1d
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 560
    .line 561
    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1d
    .catch Ljava/io/FileNotFoundException; {:try_start_1d .. :try_end_1d} :catch_11
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_1d} :catch_10
    .catchall {:try_start_1d .. :try_end_1d} :catchall_8

    .line 562
    .line 563
    .line 564
    :try_start_1e
    new-instance v3, Ljava/io/FileOutputStream;

    .line 565
    .line 566
    iget-object v0, v5, LJ6;->d:Ljava/io/File;

    .line 567
    .line 568
    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_d

    .line 569
    .line 570
    .line 571
    const/16 v0, 0x200

    .line 572
    .line 573
    :try_start_1f
    new-array v0, v0, [B

    .line 574
    .line 575
    :goto_21
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 576
    .line 577
    .line 578
    move-result v4

    .line 579
    if-lez v4, :cond_15

    .line 580
    .line 581
    const/4 v6, 0x0

    .line 582
    invoke-virtual {v3, v0, v6, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_b

    .line 583
    .line 584
    .line 585
    goto :goto_21

    .line 586
    :cond_15
    const/4 v6, 0x1

    .line 587
    :try_start_20
    invoke-virtual {v5, v6, v14}, LJ6;->b(ILjava/io/Serializable;)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_a

    .line 588
    .line 589
    .line 590
    :try_start_21
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_9

    .line 591
    .line 592
    .line 593
    :try_start_22
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/io/FileNotFoundException; {:try_start_22 .. :try_end_22} :catch_f
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_22} :catch_e
    .catchall {:try_start_22 .. :try_end_22} :catchall_8

    .line 594
    .line 595
    .line 596
    iput-object v14, v5, LJ6;->h:[B

    .line 597
    .line 598
    iput-object v14, v5, LJ6;->g:[LK6;

    .line 599
    .line 600
    move v0, v6

    .line 601
    goto :goto_2b

    .line 602
    :catchall_8
    move-exception v0

    .line 603
    goto :goto_2c

    .line 604
    :catch_e
    move-exception v0

    .line 605
    :goto_22
    const/4 v2, 0x7

    .line 606
    goto :goto_2a

    .line 607
    :catch_f
    move-exception v0

    .line 608
    :goto_23
    const/4 v2, 0x6

    .line 609
    goto :goto_2a

    .line 610
    :catchall_9
    move-exception v0

    .line 611
    :goto_24
    move-object v3, v0

    .line 612
    goto :goto_28

    .line 613
    :catchall_a
    move-exception v0

    .line 614
    :goto_25
    move-object v4, v0

    .line 615
    goto :goto_26

    .line 616
    :catchall_b
    move-exception v0

    .line 617
    const/4 v6, 0x1

    .line 618
    goto :goto_25

    .line 619
    :goto_26
    :try_start_23
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_c

    .line 620
    .line 621
    .line 622
    goto :goto_27

    .line 623
    :catchall_c
    move-exception v0

    .line 624
    move-object v3, v0

    .line 625
    :try_start_24
    invoke-virtual {v4, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 626
    .line 627
    .line 628
    :goto_27
    throw v4
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_9

    .line 629
    :catchall_d
    move-exception v0

    .line 630
    const/4 v6, 0x1

    .line 631
    goto :goto_24

    .line 632
    :goto_28
    :try_start_25
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_e

    .line 633
    .line 634
    .line 635
    goto :goto_29

    .line 636
    :catchall_e
    move-exception v0

    .line 637
    move-object v2, v0

    .line 638
    :try_start_26
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 639
    .line 640
    .line 641
    :goto_29
    throw v3
    :try_end_26
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_26} :catch_f
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_e
    .catchall {:try_start_26 .. :try_end_26} :catchall_8

    .line 642
    :catch_10
    move-exception v0

    .line 643
    const/4 v6, 0x1

    .line 644
    goto :goto_22

    .line 645
    :catch_11
    move-exception v0

    .line 646
    const/4 v6, 0x1

    .line 647
    goto :goto_23

    .line 648
    :goto_2a
    :try_start_27
    invoke-virtual {v5, v2, v0}, LJ6;->b(ILjava/io/Serializable;)V
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_8

    .line 649
    .line 650
    .line 651
    iput-object v14, v5, LJ6;->h:[B

    .line 652
    .line 653
    iput-object v14, v5, LJ6;->g:[LK6;

    .line 654
    .line 655
    const/4 v0, 0x0

    .line 656
    :goto_2b
    if-eqz v0, :cond_17

    .line 657
    .line 658
    invoke-static {v12, v13}, LMk;->B(Landroid/content/pm/PackageInfo;Ljava/io/File;)V

    .line 659
    .line 660
    .line 661
    goto :goto_2e

    .line 662
    :goto_2c
    iput-object v14, v5, LJ6;->h:[B

    .line 663
    .line 664
    iput-object v14, v5, LJ6;->g:[LK6;

    .line 665
    .line 666
    throw v0

    .line 667
    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 668
    .line 669
    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    throw v0

    .line 673
    :catch_12
    move v6, v15

    .line 674
    invoke-virtual {v10, v3, v14}, LJ6;->b(ILjava/io/Serializable;)V

    .line 675
    .line 676
    .line 677
    :goto_2d
    const/4 v0, 0x0

    .line 678
    :cond_17
    :goto_2e
    if-eqz v0, :cond_18

    .line 679
    .line 680
    if-eqz p3, :cond_18

    .line 681
    .line 682
    move v11, v6

    .line 683
    goto/16 :goto_3

    .line 684
    .line 685
    :cond_18
    const/4 v11, 0x0

    .line 686
    goto/16 :goto_3

    .line 687
    .line 688
    :goto_2f
    return-void

    .line 689
    :catch_13
    move-exception v0

    .line 690
    move-object v2, v0

    .line 691
    const/4 v3, 0x7

    .line 692
    invoke-interface {v8, v3, v2}, LCf;->f(ILjava/io/Serializable;)V

    .line 693
    .line 694
    .line 695
    const/4 v2, 0x0

    .line 696
    invoke-static {v1, v2}, LIf;->c(Landroid/content/Context;Z)V

    .line 697
    .line 698
    .line 699
    return-void

    .line 700
    nop

    .line 701
    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "exception"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    if-eq p0, p1, :cond_2

    .line 12
    .line 13
    sget-object v0, Lpc;->a:Ljava/lang/Integer;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x13

    .line 22
    .line 23
    if-lt v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Llf;->a:Ljava/lang/reflect/Method;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    new-array v1, v1, [Ljava/lang/Object;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    aput-object p1, v1, v2

    .line 35
    .line 36
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_1
    return-void
.end method

.method public static final b(LJ9;Ljava/lang/Object;LY5;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, LMk;->c(LJ9;Ljava/lang/Object;LJ4;)LJ4;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p2, p0}, Lu6;->o(LY5;Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static final c(LJ9;Ljava/lang/Object;LJ4;)LJ4;
    .locals 2

    .line 1
    :try_start_0
    invoke-interface {p0, p1}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catchall_0
    move-exception p0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eq v0, p0, :cond_0

    .line 13
    .line 14
    invoke-static {p2, p0}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    return-object p2

    .line 18
    :cond_0
    new-instance p2, LJ4;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "Exception in undelivered element handler for "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p2, p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-object p2
.end method

.method public static final d(Ly8;Lz8;Lr5;)Ljava/io/Serializable;
    .locals 5

    .line 1
    instance-of v0, p2, LG8;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LG8;

    .line 7
    .line 8
    iget v1, v0, LG8;->h:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LG8;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LG8;

    .line 21
    .line 22
    invoke-direct {v0, p2}, Ls5;-><init>(Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LG8;->g:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, LG8;->h:I

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    if-ne v2, v3, :cond_1

    .line 35
    .line 36
    iget-object p0, v0, LG8;->f:LTf;

    .line 37
    .line 38
    :try_start_0
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    move-object v1, p1

    .line 44
    goto :goto_2

    .line 45
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 48
    .line 49
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    new-instance p2, LTf;

    .line 57
    .line 58
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 59
    .line 60
    .line 61
    :try_start_1
    new-instance v2, LI8;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    invoke-direct {v2, p1, p2, v4}, LI8;-><init>(Lz8;Ljava/lang/Object;I)V

    .line 65
    .line 66
    .line 67
    iput-object p2, v0, LG8;->f:LTf;

    .line 68
    .line 69
    iput v3, v0, LG8;->h:I

    .line 70
    .line 71
    invoke-interface {p0, v2, v0}, Ly8;->c(Lz8;Lr5;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    if-ne p0, v1, :cond_3

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_3
    :goto_1
    const/4 v1, 0x0

    .line 79
    goto :goto_4

    .line 80
    :catchall_1
    move-exception p0

    .line 81
    move-object v1, p0

    .line 82
    move-object p0, p2

    .line 83
    :goto_2
    iget-object p0, p0, LTf;->c:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p0, Ljava/lang/Throwable;

    .line 86
    .line 87
    if-eqz p0, :cond_4

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_6

    .line 94
    .line 95
    :cond_4
    iget-object p1, v0, Ls5;->d:LY5;

    .line 96
    .line 97
    invoke-static {p1}, Llc;->e(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    sget-object p2, Lt5;->g:Lt5;

    .line 101
    .line 102
    invoke-interface {p1, p2}, LY5;->c(LX5;)LW5;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Luc;

    .line 107
    .line 108
    if-eqz p1, :cond_7

    .line 109
    .line 110
    check-cast p1, LBc;

    .line 111
    .line 112
    sget-object p2, LBc;->c:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 113
    .line 114
    invoke-virtual {p2, p1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    instance-of v0, p2, LI4;

    .line 119
    .line 120
    if-nez v0, :cond_5

    .line 121
    .line 122
    instance-of v0, p2, LAc;

    .line 123
    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    check-cast p2, LAc;

    .line 127
    .line 128
    invoke-virtual {p2}, LAc;->e()Z

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    if-eqz p2, :cond_7

    .line 133
    .line 134
    :cond_5
    invoke-virtual {p1}, LBc;->u()Ljava/util/concurrent/CancellationException;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-nez p1, :cond_6

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_6
    throw v1

    .line 146
    :cond_7
    :goto_3
    if-nez p0, :cond_8

    .line 147
    .line 148
    :goto_4
    return-object v1

    .line 149
    :cond_8
    instance-of p1, v1, Ljava/util/concurrent/CancellationException;

    .line 150
    .line 151
    if-eqz p1, :cond_9

    .line 152
    .line 153
    invoke-static {p0, v1}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 154
    .line 155
    .line 156
    throw p0

    .line 157
    :cond_9
    invoke-static {v1, p0}, LMk;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    throw v1
.end method

.method public static final e(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p0, v0, :cond_0

    .line 3
    .line 4
    return-void

    .line 5
    :cond_0
    const-string v0, "Expected positive parallelism level, but got "

    .line 6
    .line 7
    invoke-static {v0, p0}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw v0
.end method

.method public static f(Landroid/content/Context;Ljava/lang/String;)I
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x3

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v5, 0x21

    .line 10
    .line 11
    if-ge v4, v5, :cond_3

    .line 12
    .line 13
    const-string v5, "android.permission.POST_NOTIFICATIONS"

    .line 14
    .line 15
    invoke-static {v5, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    if-eqz v5, :cond_3

    .line 20
    .line 21
    new-instance p1, LLe;

    .line 22
    .line 23
    invoke-direct {p1, p0}, LLe;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const/16 v5, 0x18

    .line 27
    .line 28
    if-lt v4, v5, :cond_0

    .line 29
    .line 30
    iget-object p0, p1, LLe;->a:Landroid/app/NotificationManager;

    .line 31
    .line 32
    invoke-static {p0}, Lud;->a(Landroid/app/NotificationManager;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "appops"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Landroid/app/AppOpsManager;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 58
    .line 59
    :try_start_0
    const-class v5, Landroid/app/AppOpsManager;

    .line 60
    .line 61
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    const-string v6, "checkOpNoThrow"

    .line 70
    .line 71
    new-array v7, v1, [Ljava/lang/Class;

    .line 72
    .line 73
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 74
    .line 75
    aput-object v8, v7, v3

    .line 76
    .line 77
    aput-object v8, v7, v2

    .line 78
    .line 79
    const-class v8, Ljava/lang/String;

    .line 80
    .line 81
    aput-object v8, v7, v0

    .line 82
    .line 83
    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    const-string v7, "OP_POST_NOTIFICATION"

    .line 88
    .line 89
    invoke-virtual {v5, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    const-class v7, Ljava/lang/Integer;

    .line 94
    .line 95
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    check-cast v5, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    .line 103
    .line 104
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    new-array v1, v1, [Ljava/lang/Object;

    .line 109
    .line 110
    aput-object v5, v1, v3

    .line 111
    .line 112
    aput-object v4, v1, v2

    .line 113
    .line 114
    aput-object p0, v1, v0

    .line 115
    .line 116
    invoke-virtual {v6, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    check-cast p0, Ljava/lang/Integer;

    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    if-nez p0, :cond_1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_1
    move v2, v3

    .line 130
    :catch_0
    :goto_0
    if-eqz v2, :cond_2

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    const/4 v3, -0x1

    .line 134
    :goto_1
    return v3

    .line 135
    :cond_3
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {p0, p1, v0, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    return p0

    .line 148
    :cond_4
    new-instance p0, Ljava/lang/NullPointerException;

    .line 149
    .line 150
    const-string p1, "permission must be non-null"

    .line 151
    .line 152
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p0
.end method

.method public static g(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    :cond_0
    return-void
.end method

.method public static h(Ljava/io/File;Landroid/content/res/Resources;I)Z
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    invoke-static {p0, p1}, LMk;->i(Ljava/io/File;Ljava/io/InputStream;)Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    invoke-static {p1}, LMk;->g(Ljava/io/Closeable;)V

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :catchall_1
    move-exception p0

    .line 16
    const/4 p1, 0x0

    .line 17
    :goto_0
    invoke-static {p1}, LMk;->g(Ljava/io/Closeable;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public static i(Ljava/io/File;Ljava/io/InputStream;)Z
    .locals 5

    .line 1
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskWrites()Landroid/os/StrictMode$ThreadPolicy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    .line 8
    .line 9
    invoke-direct {v3, p0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    .line 12
    const/16 p0, 0x400

    .line 13
    .line 14
    :try_start_1
    new-array p0, p0, [B

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1, p0}, Ljava/io/InputStream;->read([B)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v4, -0x1

    .line 21
    if-eq v2, v4, :cond_0

    .line 22
    .line 23
    invoke-virtual {v3, p0, v1, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    move-object v2, v3

    .line 29
    goto :goto_2

    .line 30
    :catch_0
    move-exception p0

    .line 31
    move-object v2, v3

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-static {v3}, LMk;->g(Ljava/io/Closeable;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :catchall_1
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :catch_1
    move-exception p0

    .line 44
    :goto_1
    :try_start_2
    const-string p1, "TypefaceCompatUtil"

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v4, "Error copying resource contents to temp file: "

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 68
    .line 69
    .line 70
    invoke-static {v2}, LMk;->g(Ljava/io/Closeable;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 74
    .line 75
    .line 76
    return v1

    .line 77
    :goto_2
    invoke-static {v2}, LMk;->g(Ljava/io/Closeable;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 81
    .line 82
    .line 83
    throw p0
.end method

.method public static j(LN9;Ljava/lang/Object;Lr5;)Lr5;
    .locals 1

    .line 1
    const-string v0, "completion"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    check-cast p0, Lo3;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p1}, Lo3;->i(Lr5;Ljava/lang/Object;)Lr5;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static k(Landroid/app/Activity;LRc;)V
    .locals 1

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "event"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    instance-of v0, p0, LYc;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, LYc;

    .line 16
    .line 17
    invoke-interface {p0}, LYc;->getLifecycle()LTc;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of v0, p0, Landroidx/lifecycle/a;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    check-cast p0, Landroidx/lifecycle/a;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroidx/lifecycle/a;->e(LRc;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static final l(CCZ)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-nez p2, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eq p0, p1, :cond_3

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-ne p0, p1, :cond_2

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    move v0, v1

    .line 31
    :cond_3
    :goto_0
    return v0
.end method

.method public static final m(Li0;LY5;)Ly8;
    .locals 3

    .line 1
    sget-object v0, Lt5;->g:Lt5;

    .line 2
    .line 3
    invoke-interface {p1, v0}, LY5;->c(LX5;)LW5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    sget-object v0, LE7;->c:LE7;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    instance-of v0, p0, Lc4;

    .line 19
    .line 20
    const/4 v1, -0x3

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    check-cast p0, Lc4;

    .line 24
    .line 25
    iget-object v0, p0, Lc4;->c:LY5;

    .line 26
    .line 27
    invoke-interface {p1, v0}, LY5;->k(LY5;)LY5;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget v2, p0, Lc4;->d:I

    .line 32
    .line 33
    if-ne v2, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v1, v2

    .line 37
    :goto_0
    invoke-static {p1, v0}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    if-ne v1, v2, :cond_2

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    new-instance v0, Lc4;

    .line 47
    .line 48
    iget-object v2, p0, Lc4;->e:LA3;

    .line 49
    .line 50
    iget-object p0, p0, Lc4;->f:Ly8;

    .line 51
    .line 52
    check-cast p0, Li0;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1, v1, v2}, Lc4;-><init>(Li0;LY5;ILA3;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    new-instance v0, Lc4;

    .line 59
    .line 60
    sget-object v2, LA3;->c:LA3;

    .line 61
    .line 62
    invoke-direct {v0, p0, p1, v1, v2}, Lc4;-><init>(Li0;LY5;ILA3;)V

    .line 63
    .line 64
    .line 65
    :goto_1
    move-object p0, v0

    .line 66
    :goto_2
    return-object p0

    .line 67
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v0, "Flow context cannot contain job in it. Had "

    .line 70
    .line 71
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    throw p1
.end method

.method public static final n(LY5;LY5;Z)LY5;
    .locals 3

    .line 1
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance v0, LZ5;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, v1}, LZ5;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0, p2, v0}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v1, LZ5;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct {v1, v2}, LZ5;-><init>(I)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, p2, v1}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    if-nez p2, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, p1}, LY5;->k(LY5;)LY5;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    sget-object v0, LE7;->c:LE7;

    .line 45
    .line 46
    new-instance v1, LZ5;

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-direct {v1, v2}, LZ5;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p0, v0, v1}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, LY5;

    .line 57
    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    check-cast p1, LY5;

    .line 61
    .line 62
    new-instance p2, LZ5;

    .line 63
    .line 64
    const/4 v1, 0x2

    .line 65
    invoke-direct {p2, v1}, LZ5;-><init>(I)V

    .line 66
    .line 67
    .line 68
    invoke-interface {p1, v0, p2}, LY5;->j(Ljava/lang/Object;LN9;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :cond_1
    check-cast p1, LY5;

    .line 73
    .line 74
    invoke-interface {p0, p1}, LY5;->k(LY5;)LY5;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public static o(Ljava/lang/String;)LWa;
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, LJh;->K(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    new-instance v0, LVa;

    .line 11
    .line 12
    invoke-static {p0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v1, "forName(...)"

    .line 17
    .line 18
    invoke-static {v1, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, p0}, LVa;-><init>(Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :catch_0
    sget-object v0, LWa;->a:LVa;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    sget-object p0, LWa;->a:LVa;

    .line 29
    .line 30
    sget-object v0, LUa;->b:LUa;

    .line 31
    .line 32
    :goto_1
    return-object v0
.end method

.method public static p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Lkg;

    .line 10
    .line 11
    invoke-direct {v1, v0, p0}, Lkg;-><init>(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)V

    .line 12
    .line 13
    .line 14
    sget-object v2, Llg;->c:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    sget-object v3, Llg;->b:Ljava/util/WeakHashMap;

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Landroid/util/SparseArray;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    if-eqz v3, :cond_3

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    if-lez v5, :cond_3

    .line 33
    .line 34
    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    check-cast v5, Ljg;

    .line 39
    .line 40
    if-eqz v5, :cond_3

    .line 41
    .line 42
    iget-object v6, v5, Ljg;->b:Landroid/content/res/Configuration;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    invoke-virtual {v6, v7}, Landroid/content/res/Configuration;->equals(Landroid/content/res/Configuration;)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    if-eqz v6, :cond_2

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    iget v6, v5, Ljg;->c:I

    .line 57
    .line 58
    if-eqz v6, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_4

    .line 63
    :cond_0
    :goto_0
    if-eqz p0, :cond_2

    .line 64
    .line 65
    iget v6, v5, Ljg;->c:I

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/content/res/Resources$Theme;->hashCode()I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    if-ne v6, v7, :cond_2

    .line 72
    .line 73
    :cond_1
    iget-object v3, v5, Ljg;->a:Landroid/content/res/ColorStateList;

    .line 74
    .line 75
    monitor-exit v2

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 78
    .line 79
    .line 80
    :cond_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    move-object v3, v4

    .line 82
    :goto_1
    if-eqz v3, :cond_4

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_4
    sget-object v2, Llg;->a:Ljava/lang/ThreadLocal;

    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Landroid/util/TypedValue;

    .line 92
    .line 93
    if-nez v3, :cond_5

    .line 94
    .line 95
    new-instance v3, Landroid/util/TypedValue;

    .line 96
    .line 97
    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_5
    const/4 v2, 0x1

    .line 104
    invoke-virtual {v0, p1, v3, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 105
    .line 106
    .line 107
    iget v2, v3, Landroid/util/TypedValue;->type:I

    .line 108
    .line 109
    const/16 v3, 0x1c

    .line 110
    .line 111
    if-lt v2, v3, :cond_6

    .line 112
    .line 113
    const/16 v3, 0x1f

    .line 114
    .line 115
    if-gt v2, v3, :cond_6

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_6
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    :try_start_1
    invoke-static {v0, v2, p0}, LA4;->a(Landroid/content/res/Resources;Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 123
    .line 124
    .line 125
    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 126
    goto :goto_2

    .line 127
    :catch_0
    move-exception v2

    .line 128
    const-string v3, "ResourcesCompat"

    .line 129
    .line 130
    const-string v5, "Failed to inflate ColorStateList, leaving it to the framework"

    .line 131
    .line 132
    invoke-static {v3, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 133
    .line 134
    .line 135
    :goto_2
    if-eqz v4, :cond_7

    .line 136
    .line 137
    invoke-static {v1, p1, v4, p0}, Llg;->a(Lkg;ILandroid/content/res/ColorStateList;Landroid/content/res/Resources$Theme;)V

    .line 138
    .line 139
    .line 140
    move-object v3, v4

    .line 141
    goto :goto_3

    .line 142
    :cond_7
    invoke-virtual {v0, p1, p0}, Landroid/content/res/Resources;->getColorStateList(ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    :goto_3
    return-object v3

    .line 147
    :goto_4
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    throw p0
.end method

.method public static q(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    invoke-static {}, Lig;->d()Lig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lig;->f(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static final r(Ljava/lang/Object;)LYg;
    .locals 1

    .line 1
    sget-object v0, Lr3;->n:Li0;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LYg;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 9
    .line 10
    const-string v0, "Does not contain segment"

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public static s(Landroid/content/Context;)Ljava/io/File;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, ".font"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "-"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/os/Process;->myTid()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x0

    .line 43
    :goto_0
    const/16 v3, 0x64

    .line 44
    .line 45
    if-ge v2, v3, :cond_2

    .line 46
    .line 47
    new-instance v3, Ljava/io/File;

    .line 48
    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-direct {v3, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 68
    .line 69
    .line 70
    move-result v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    if-eqz v4, :cond_1

    .line 72
    .line 73
    return-object v3

    .line 74
    :catch_0
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    return-object v0
.end method

.method public static t(Landroid/widget/TextView;)Ltf;
    .locals 7

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ltf;

    .line 8
    .line 9
    invoke-static {p0}, LS6;->i(Landroid/widget/TextView;)Landroid/text/PrecomputedText$Params;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Ltf;-><init>(Landroid/text/PrecomputedText$Params;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    new-instance v2, Landroid/text/TextPaint;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-direct {v2, v3}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    sget-object v3, Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_LTR:Landroid/text/TextDirectionHeuristic;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/TextView;->getBreakStrategy()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getHyphenationFrequency()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-virtual {p0}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    instance-of v5, v5, Landroid/text/method/PasswordTransformationMethod;

    .line 41
    .line 42
    if-eqz v5, :cond_2

    .line 43
    .line 44
    :cond_1
    :pswitch_0
    sget-object p0, Landroid/text/TextDirectionHeuristics;->LTR:Landroid/text/TextDirectionHeuristic;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 v5, 0x1

    .line 48
    const/4 v6, 0x0

    .line 49
    if-lt v0, v1, :cond_4

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/widget/TextView;->getInputType()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    and-int/lit8 v0, v0, 0xf

    .line 56
    .line 57
    const/4 v1, 0x3

    .line 58
    if-ne v0, v1, :cond_4

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextLocale()Ljava/util/Locale;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lud;->c(Ljava/util/Locale;)Landroid/icu/text/DecimalFormatSymbols;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, LS6;->a(Landroid/icu/text/DecimalFormatSymbols;)[Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    aget-object p0, p0, v6

    .line 73
    .line 74
    invoke-virtual {p0, v6}, Ljava/lang/String;->codePointAt(I)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {p0}, Ljava/lang/Character;->getDirectionality(I)B

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eq p0, v5, :cond_3

    .line 83
    .line 84
    const/4 v0, 0x2

    .line 85
    if-ne p0, v0, :cond_1

    .line 86
    .line 87
    :cond_3
    :pswitch_1
    sget-object p0, Landroid/text/TextDirectionHeuristics;->RTL:Landroid/text/TextDirectionHeuristic;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-ne v0, v5, :cond_5

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_5
    move v5, v6

    .line 98
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getTextDirection()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    packed-switch p0, :pswitch_data_0

    .line 103
    .line 104
    .line 105
    if-eqz v5, :cond_6

    .line 106
    .line 107
    :pswitch_2
    sget-object p0, Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_RTL:Landroid/text/TextDirectionHeuristic;

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_6
    :pswitch_3
    sget-object p0, Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_LTR:Landroid/text/TextDirectionHeuristic;

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :pswitch_4
    sget-object p0, Landroid/text/TextDirectionHeuristics;->LOCALE:Landroid/text/TextDirectionHeuristic;

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :pswitch_5
    sget-object p0, Landroid/text/TextDirectionHeuristics;->ANYRTL_LTR:Landroid/text/TextDirectionHeuristic;

    .line 117
    .line 118
    :goto_1
    new-instance v0, Ltf;

    .line 119
    .line 120
    invoke-direct {v0, v2, p0, v3, v4}, Ltf;-><init>(Landroid/text/TextPaint;Landroid/text/TextDirectionHeuristic;II)V

    .line 121
    .line 122
    .line 123
    return-object v0

    .line 124
    nop

    .line 125
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public static v(Landroid/app/Activity;)V
    .locals 3

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

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
    sget-object v0, LYf;->Companion:LXf;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    new-instance v0, LYf;

    .line 18
    .line 19
    invoke-direct {v0}, LYf;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, LA;->i(Landroid/app/Activity;LYf;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag"

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, LZf;

    .line 42
    .line 43
    invoke-direct {v2}, Landroid/app/Fragment;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public static w(Lr5;)Lr5;
    .locals 2

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {v0, p0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p0, Ls5;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    check-cast v0, Ls5;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object p0, v0, Ls5;->e:Lr5;

    .line 18
    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Ls5;->getContext()LY5;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v1, Lt5;->d:Lt5;

    .line 26
    .line 27
    invoke-interface {p0, v1}, LY5;->c(LX5;)LW5;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lu5;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    check-cast p0, Lc6;

    .line 36
    .line 37
    new-instance v1, LO6;

    .line 38
    .line 39
    invoke-direct {v1, p0, v0}, LO6;-><init>(Lc6;Ls5;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move-object v1, v0

    .line 44
    :goto_1
    iput-object v1, v0, Ls5;->e:Lr5;

    .line 45
    .line 46
    move-object p0, v1

    .line 47
    :cond_2
    return-object p0
.end method

.method public static final y(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    sget-object v0, Lr3;->n:Li0;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    return p0
.end method

.method public static z(Lh6;LN9;)Luh;
    .locals 4

    .line 1
    sget-object v0, LE7;->c:LE7;

    .line 2
    .line 3
    sget-object v1, Lk6;->c:Lk6;

    .line 4
    .line 5
    invoke-interface {p0}, Lh6;->g()LY5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {p0, v0, v2}, LMk;->n(LY5;LY5;Z)LY5;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, LR6;->a:LE6;

    .line 15
    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    sget-object v3, Lt5;->d:Lt5;

    .line 19
    .line 20
    invoke-interface {p0, v3}, LY5;->c(LX5;)LW5;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    invoke-interface {p0, v0}, LY5;->k(LY5;)LY5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :cond_0
    new-instance v0, Luh;

    .line 31
    .line 32
    invoke-direct {v0, p0, v2}, Lf;-><init>(LY5;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v0, p1}, Lf;->P(Lk6;Lf;LN9;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method


# virtual methods
.method public final D(Z)V
    .locals 1

    .line 1
    iget v0, p0, LMk;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LMk;->b:Landroid/view/Window;

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    or-int/lit16 v0, v0, 0x2000

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, LMk;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Landroid/view/WindowInsetsController;

    .line 28
    .line 29
    invoke-static {p1}, LJk;->f(Landroid/view/WindowInsetsController;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    and-int/lit16 v0, v0, -0x2001

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, LMk;->c:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p1, Landroid/view/WindowInsetsController;

    .line 51
    .line 52
    invoke-static {p1}, LJk;->g(Landroid/view/WindowInsetsController;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    return-void

    .line 56
    :pswitch_0
    iget-object v0, p0, LMk;->b:Landroid/view/Window;

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    const/high16 p1, 0x4000000

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Landroid/view/Window;->clearFlags(I)V

    .line 63
    .line 64
    .line 65
    const/high16 p1, -0x80000000

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Landroid/view/Window;->addFlags(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    or-int/lit16 v0, v0, 0x2000

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    and-int/lit16 v0, v0, -0x2001

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 95
    .line 96
    .line 97
    :goto_1
    return-void

    .line 98
    nop

    .line 99
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final J()V
    .locals 5

    .line 1
    iget v0, p0, LMk;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LMk;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Landroid/view/WindowInsetsController;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, LB;->r(Landroid/view/WindowInsetsController;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    const/4 v0, 0x1

    .line 16
    move v1, v0

    .line 17
    :goto_0
    const/16 v2, 0x100

    .line 18
    .line 19
    if-gt v1, v2, :cond_4

    .line 20
    .line 21
    and-int v2, v0, v1

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget-object v2, p0, LMk;->b:Landroid/view/Window;

    .line 27
    .line 28
    if-eq v1, v0, :cond_3

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    if-eq v1, v3, :cond_2

    .line 32
    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    if-eq v1, v2, :cond_1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    iget-object v2, p0, LMk;->c:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v2, Li0;

    .line 41
    .line 42
    iget-object v2, v2, Li0;->d:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v2, Li0;

    .line 45
    .line 46
    invoke-virtual {v2}, Li0;->H()V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    and-int/lit8 v3, v3, -0x3

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3}, Landroid/view/View;->getSystemUiVisibility()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    and-int/lit8 v4, v4, -0x5

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 75
    .line 76
    .line 77
    const/16 v3, 0x400

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 80
    .line 81
    .line 82
    :goto_1
    shl-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    return-void

    .line 86
    nop

    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final u()V
    .locals 5

    .line 1
    iget v0, p0, LMk;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LMk;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Landroid/view/WindowInsetsController;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, LB;->y(Landroid/view/WindowInsetsController;I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    const/4 v0, 0x1

    .line 16
    move v1, v0

    .line 17
    :goto_0
    const/16 v2, 0x100

    .line 18
    .line 19
    if-gt v1, v2, :cond_4

    .line 20
    .line 21
    and-int v2, v0, v1

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    iget-object v2, p0, LMk;->b:Landroid/view/Window;

    .line 27
    .line 28
    if-eq v1, v0, :cond_3

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    if-eq v1, v3, :cond_2

    .line 32
    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    if-eq v1, v2, :cond_1

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_1
    iget-object v2, p0, LMk;->c:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v2, Li0;

    .line 41
    .line 42
    iget-object v2, v2, Li0;->d:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v2, Li0;

    .line 45
    .line 46
    invoke-virtual {v2}, Li0;->E()V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    or-int/2addr v3, v4

    .line 59
    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Landroid/view/View;->getSystemUiVisibility()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    or-int/lit8 v3, v3, 0x4

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :goto_2
    shl-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    return-void

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public x()Z
    .locals 1

    .line 1
    iget v0, p0, LMk;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LMk;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Landroid/view/WindowInsetsController;

    .line 9
    .line 10
    invoke-static {v0}, LJk;->d(Landroid/view/WindowInsetsController;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LMk;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Landroid/view/WindowInsetsController;

    .line 16
    .line 17
    invoke-static {v0}, LJk;->b(Landroid/view/WindowInsetsController;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    and-int/lit8 v0, v0, 0x8

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    return v0

    .line 29
    :pswitch_0
    iget-object v0, p0, LMk;->b:Landroid/view/Window;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    and-int/lit16 v0, v0, 0x2000

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_1
    return v0

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
