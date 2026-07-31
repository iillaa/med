.class public Li0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhe;
.implements LKd;
.implements LA2;
.implements LSd;
.implements Li5;
.implements Lk5;
.implements LMe;
.implements Lm7;
.implements LCf;
.implements Ly8;
.implements LH5;
.implements Lxe;
.implements Lorg/chromium/support_lib_boundary/WebMessageListenerBoundaryInterface;
.implements Lkk;


# instance fields
.field public final synthetic c:I

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/16 v0, 0xc

    iput v0, p0, Li0;->c:I

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v3, v1}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 2
    iput p1, p0, Li0;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 3
    iput p1, p0, Li0;->c:I

    iput-object p2, p0, Li0;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/ClipData;I)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Li0;->c:I

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, p2}, Lh5;->e(Landroid/content/ClipData;I)Landroid/view/ContentInfo$Builder;

    move-result-object p1

    iput-object p1, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Li0;->c:I

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V
    .locals 2

    const/16 v0, 0xb

    iput v0, p0, Li0;->c:I

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_0

    new-instance v0, Lec;

    invoke-direct {v0, p1, p2, p3}, Lec;-><init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V

    :goto_0
    iput-object v0, p0, Li0;->d:Ljava/lang/Object;

    goto :goto_1

    :cond_0
    new-instance v0, LN2;

    invoke-direct {v0, p1, p2, p3}, LN2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :goto_1
    return-void
.end method

.method public constructor <init>(Landroid/view/ContentInfo;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Li0;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    invoke-static {p1}, Lh5;->g(Ljava/lang/Object;)Landroid/view/ContentInfo;

    move-result-object p1

    iput-object p1, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const/16 v0, 0x13

    iput v0, p0, Li0;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    new-instance v0, Lkh;

    const/16 v1, 0x12

    .line 9
    invoke-direct {v0, v1, p1}, Li0;-><init>(ILjava/lang/Object;)V

    iput-object p1, v0, Lkh;->e:Landroid/view/View;

    .line 10
    :goto_0
    iput-object v0, p0, Li0;->d:Ljava/lang/Object;

    goto :goto_1

    :cond_0
    new-instance v0, Li0;

    const/16 v1, 0x12

    invoke-direct {v0, v1, p1}, Li0;-><init>(ILjava/lang/Object;)V

    goto :goto_0

    :goto_1
    return-void
.end method

.method public constructor <init>(Landroid/view/Window;Landroid/view/View;)V
    .locals 2

    const/16 v0, 0x1d

    iput v0, p0, Li0;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li0;

    invoke-direct {v0, p2}, Li0;-><init>(Landroid/view/View;)V

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt p2, v1, :cond_0

    new-instance p2, LOk;

    const/4 v1, 0x1

    .line 11
    invoke-direct {p2, p1, v0, v1}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    .line 12
    :goto_0
    iput-object p2, p0, Li0;->d:Ljava/lang/Object;

    goto :goto_1

    :cond_0
    const/16 v1, 0x1e

    if-lt p2, v1, :cond_1

    new-instance p2, LMk;

    const/4 v1, 0x1

    invoke-direct {p2, p1, v0, v1}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    goto :goto_0

    :cond_1
    const/16 v1, 0x1a

    if-lt p2, v1, :cond_2

    new-instance p2, LNk;

    const/4 v1, 0x0

    .line 13
    invoke-direct {p2, p1, v0, v1}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    goto :goto_0

    .line 14
    :cond_2
    new-instance p2, LMk;

    const/4 v1, 0x0

    .line 15
    invoke-direct {p2, p1, v0, v1}, LMk;-><init>(Landroid/view/Window;Li0;I)V

    goto :goto_0

    :goto_1
    return-void
.end method

.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Li0;->c:I

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "editText cannot be null"

    invoke-static {v0, p1}, LSi;->c(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, LY1;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, LY1;-><init>(Landroid/widget/EditText;I)V

    iput-object v0, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, Li0;->c:I

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "textView cannot be null"

    invoke-static {v0, p1}, LSi;->c(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ly7;

    invoke-direct {v0, p1}, Ly7;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Li0;->d:Ljava/lang/Object;

    return-void
.end method

.method public static B(Landroid/database/Cursor;Ljava/util/List;)Ljava/lang/Integer;
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-ltz v0, :cond_1

    .line 27
    .line 28
    move-object v1, v2

    .line 29
    :cond_1
    if-eqz v1, :cond_0

    .line 30
    .line 31
    :cond_2
    return-object v1
.end method

.method public static C(Landroid/database/Cursor;)J
    .locals 2

    .line 1
    const-string v0, "datetaken"

    .line 2
    .line 3
    const-string v1, "date_added"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Li0;->B(Landroid/database/Cursor;Ljava/util/List;)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "getString(...)"

    .line 28
    .line 29
    invoke-static {v0, p0}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, LJh;->Q(Ljava/lang/String;)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-wide/16 v0, 0x0

    .line 44
    .line 45
    :goto_0
    return-wide v0
.end method

.method public static F(Ljava/lang/Throwable;Landroid/net/Uri;)Ljava/lang/Throwable;
    .locals 2

    .line 1
    instance-of v0, p0, Ljava/io/FileNotFoundException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lgb;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v1, "toString(...)"

    .line 12
    .line 13
    invoke-static {v1, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, p1, p0}, Lgb;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    move-object p0, v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    instance-of p1, p0, Ljava/lang/UnsupportedOperationException;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    new-instance p1, Lkb;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Lkb;-><init>(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    move-object p0, p1

    .line 31
    :cond_1
    :goto_0
    return-object p0
.end method

.method public static final x(Li0;Landroid/database/Cursor;Landroid/net/Uri;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "_size"

    .line 5
    .line 6
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "getString(...)"

    .line 18
    .line 19
    invoke-static {v0, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, LJh;->Q(Ljava/lang/String;)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object p1, v1

    .line 28
    :goto_0
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide p0

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    iget-object p0, p0, Li0;->d:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Landroid/content/ContentResolver;

    .line 38
    .line 39
    const-string p1, "r"

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    :try_start_0
    invoke-virtual {p0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 48
    .line 49
    .line 50
    move-result-wide p1

    .line 51
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    invoke-static {p0, v1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    move-object v1, p1

    .line 59
    goto :goto_1

    .line 60
    :catchall_0
    move-exception p1

    .line 61
    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 62
    :catchall_1
    move-exception p2

    .line 63
    invoke-static {p0, p1}, Lr3;->h(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    throw p2

    .line 67
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    const-wide/16 p0, 0x0

    .line 75
    .line 76
    :goto_2
    return-wide p0
.end method

.method public static final y(Li0;Ljava/lang/Object;Landroid/net/Uri;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lpg;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p0, p2}, Li0;->F(Ljava/lang/Throwable;Landroid/net/Uri;)Ljava/lang/Throwable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_0
    return-object p1
.end method


# virtual methods
.method public A(Landroid/net/Uri;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, Loa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Loa;

    .line 7
    .line 8
    iget v1, v0, Loa;->h:I

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
    iput v1, v0, Loa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Loa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Loa;-><init>(Li0;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Loa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Loa;->h:I

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
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p2, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p2, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lpa;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p0, p1, v4}, Lpa;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Loa;->h:I

    .line 62
    .line 63
    invoke-static {p2, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-ne p2, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public D(Landroid/net/Uri;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, Lqa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lqa;

    .line 7
    .line 8
    iget v1, v0, Lqa;->h:I

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
    iput v1, v0, Lqa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lqa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lqa;-><init>(Li0;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lqa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lqa;->h:I

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
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p2, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p2, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lra;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p0, p1, v4}, Lra;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lqa;->h:I

    .line 62
    .line 63
    invoke-static {p2, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-ne p2, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p2, Lpg;

    .line 71
    .line 72
    iget-object p1, p2, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public E()V
    .locals 3

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "input_method"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v1, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public G(Landroid/net/Uri;LJb;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, Lsa;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lsa;

    .line 7
    .line 8
    iget v1, v0, Lsa;->h:I

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
    iput v1, v0, Lsa;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lsa;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lsa;-><init>(Li0;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lsa;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lsa;->h:I

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
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lta;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p0, p1, p2, v4}, Lta;-><init>(Li0;Landroid/net/Uri;LJb;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lsa;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method

.method public H()V
    .locals 3

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->isInEditMode()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_2

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->onCheckIsTextEditor()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    goto :goto_1

    .line 30
    :cond_2
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 31
    .line 32
    .line 33
    move-object v1, v0

    .line 34
    :goto_1
    if-nez v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const v1, 0x1020002

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :cond_3
    if-eqz v1, :cond_4

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/view/View;->hasWindowFocus()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    new-instance v0, Lq0;

    .line 56
    .line 57
    const/4 v2, 0x7

    .line 58
    invoke-direct {v0, v2, v1}, Lq0;-><init>(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 62
    .line 63
    .line 64
    :cond_4
    return-void
.end method

.method public a(LMd;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, LKh;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LKh;

    .line 7
    .line 8
    iget-object v0, v0, LKh;->z:LMd;

    .line 9
    .line 10
    invoke-virtual {v0}, LMd;->k()LMd;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, LMd;->c(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Lj0;

    .line 21
    .line 22
    iget-object v0, v0, Lj0;->g:Lhe;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, p1, p2}, Lhe;->a(LMd;Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public b(Lu6;)V
    .locals 9

    .line 1
    new-instance v7, LY4;

    .line 2
    .line 3
    const-string v0, "EmojiCompatInitializer"

    .line 4
    .line 5
    invoke-direct {v7, v0}, LY4;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    new-instance v6, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 13
    .line 14
    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 15
    .line 16
    .line 17
    const-wide/16 v3, 0xf

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x1

    .line 21
    move-object v0, v8

    .line 22
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {v8, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Lt3;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-direct {v0, p0, p1, v8, v1}, Lt3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v8, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public c(Lz8;Lr5;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p2, Lh;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lh;

    .line 7
    .line 8
    iget v1, v0, Lh;->i:I

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
    iput v1, v0, Lh;->i:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lh;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lh;-><init>(Li0;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lh;->g:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lh;->i:I

    .line 30
    .line 31
    sget-object v3, Lfj;->a:Lfj;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v4, :cond_1

    .line 37
    .line 38
    iget-object p1, v0, Lh;->f:Lrg;

    .line 39
    .line 40
    :try_start_0
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :catchall_0
    move-exception p2

    .line 45
    goto :goto_4

    .line 46
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 47
    .line 48
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p1

    .line 54
    :cond_2
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    new-instance p2, Lrg;

    .line 58
    .line 59
    iget-object v2, v0, Ls5;->d:LY5;

    .line 60
    .line 61
    invoke-static {v2}, Llc;->e(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p2, p1, v2}, Lrg;-><init>(Lz8;LY5;)V

    .line 65
    .line 66
    .line 67
    :try_start_1
    iput-object p2, v0, Lh;->f:Lrg;

    .line 68
    .line 69
    iput v4, v0, Lh;->i:I

    .line 70
    .line 71
    iget-object p1, p0, Li0;->d:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast p1, LN9;

    .line 74
    .line 75
    invoke-interface {p1, p2, v0}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    if-ne p1, v1, :cond_3

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    move-object p1, v3

    .line 83
    :goto_1
    if-ne p1, v1, :cond_4

    .line 84
    .line 85
    return-object v1

    .line 86
    :cond_4
    move-object p1, p2

    .line 87
    :goto_2
    invoke-virtual {p1}, Ls5;->l()V

    .line 88
    .line 89
    .line 90
    return-object v3

    .line 91
    :goto_3
    move-object v5, p2

    .line 92
    move-object p2, p1

    .line 93
    move-object p1, v5

    .line 94
    goto :goto_4

    .line 95
    :catchall_1
    move-exception p1

    .line 96
    goto :goto_3

    .line 97
    :goto_4
    invoke-virtual {p1}, Ls5;->l()V

    .line 98
    .line 99
    .line 100
    throw p2
.end method

.method public createWebView(Landroid/webkit/WebView;)Lorg/chromium/support_lib_boundary/WebViewProviderBoundaryInterface;
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;->createWebView(Landroid/webkit/WebView;)Ljava/lang/reflect/InvocationHandler;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-class v0, Lorg/chromium/support_lib_boundary/WebViewProviderBoundaryInterface;

    .line 10
    .line 11
    invoke-static {v0, p1}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lorg/chromium/support_lib_boundary/WebViewProviderBoundaryInterface;

    .line 16
    .line 17
    return-object p1
.end method

.method public d()Landroid/content/ClipData;
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lh5;->b(Landroid/view/ContentInfo;)Landroid/content/ClipData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public e()Ll5;
    .locals 3

    .line 1
    new-instance v0, Ll5;

    .line 2
    .line 3
    new-instance v1, Li0;

    .line 4
    .line 5
    iget-object v2, p0, Li0;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Landroid/view/ContentInfo$Builder;

    .line 8
    .line 9
    invoke-static {v2}, Lh5;->f(Landroid/view/ContentInfo$Builder;)Landroid/view/ContentInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Li0;-><init>(Landroid/view/ContentInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll5;-><init>(Lk5;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public f(ILjava/io/Serializable;)V
    .locals 3

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    :pswitch_0
    const-string v0, ""

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :pswitch_1
    const-string v0, "RESULT_DELETE_SKIP_FILE_SUCCESS"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :pswitch_2
    const-string v0, "RESULT_INSTALL_SKIP_FILE_SUCCESS"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_3
    const-string v0, "RESULT_PARSE_EXCEPTION"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :pswitch_4
    const-string v0, "RESULT_IO_EXCEPTION"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :pswitch_5
    const-string v0, "RESULT_BASELINE_PROFILE_NOT_FOUND"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_6
    const-string v0, "RESULT_DESIRED_FORMAT_UNSUPPORTED"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :pswitch_7
    const-string v0, "RESULT_NOT_WRITABLE"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :pswitch_8
    const-string v0, "RESULT_UNSUPPORTED_ART_VERSION"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :pswitch_9
    const-string v0, "RESULT_ALREADY_INSTALLED"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :pswitch_a
    const-string v0, "RESULT_INSTALL_SUCCESS"

    .line 35
    .line 36
    :goto_0
    const/4 v1, 0x6

    .line 37
    const-string v2, "ProfileInstaller"

    .line 38
    .line 39
    if-eq p1, v1, :cond_0

    .line 40
    .line 41
    const/4 v1, 0x7

    .line 42
    if-eq p1, v1, :cond_0

    .line 43
    .line 44
    const/16 v1, 0x8

    .line 45
    .line 46
    if-eq p1, v1, :cond_0

    .line 47
    .line 48
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_0
    check-cast p2, Ljava/lang/Throwable;

    .line 53
    .line 54
    invoke-static {v2, v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .line 56
    .line 57
    :goto_1
    iget-object p2, p0, Li0;->d:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p2, Landroidx/profileinstaller/ProfileInstallReceiver;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Landroid/content/BroadcastReceiver;->setResultCode(I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public g(Landroid/view/View;LLk;)LLk;
    .locals 5

    .line 1
    const/4 p1, 0x1

    .line 2
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 5
    .line 6
    iget-object v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 7
    .line 8
    invoke-static {v1, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_5

    .line 13
    .line 14
    iput-object p2, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:LLk;

    .line 15
    .line 16
    invoke-virtual {p2}, LLk;->d()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-lez v1, :cond_0

    .line 22
    .line 23
    move v1, p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v2

    .line 26
    :goto_0
    iput-boolean v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->n:Z

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    move v1, p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v1, v2

    .line 39
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p2, LLk;->a:LIk;

    .line 43
    .line 44
    invoke-virtual {v1}, LIk;->m()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    :goto_2
    if-ge v2, v1, :cond_4

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    sget-object v4, LLj;->a:Ljava/util/WeakHashMap;

    .line 62
    .line 63
    invoke-virtual {v3}, Landroid/view/View;->getFitsSystemWindows()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_3

    .line 68
    .line 69
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Lx5;

    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    :cond_3
    add-int/2addr v2, p1

    .line 79
    goto :goto_2

    .line 80
    :cond_4
    :goto_3
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 81
    .line 82
    .line 83
    :cond_5
    return-object p2
.end method

.method public getStatics()Lorg/chromium/support_lib_boundary/StaticsBoundaryInterface;
    .locals 2

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;->getStatics()Ljava/lang/reflect/InvocationHandler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-class v1, Lorg/chromium/support_lib_boundary/StaticsBoundaryInterface;

    .line 10
    .line 11
    invoke-static {v1, v0}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lorg/chromium/support_lib_boundary/StaticsBoundaryInterface;

    .line 16
    .line 17
    return-object v0
.end method

.method public getSupportedFeatures()[Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "WEB_MESSAGE_LISTENER"

    .line 2
    .line 3
    const-string v1, "WEB_MESSAGE_ARRAY_BUFFER"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public h()I
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lh5;->a(Landroid/view/ContentInfo;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public i()V
    .locals 2

    .line 1
    const-string v0, "ProfileInstaller"

    .line 2
    .line 3
    const-string v1, "DIAGNOSTIC_PROFILE_IS_COMPRESSED"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j()[Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebViewProviderFactoryBoundaryInterface;->getSupportedFeatures()[Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public k()Landroid/view/ContentInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    return-object v0
.end method

.method public l(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/webkit/JsPromptResult;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/webkit/JsResult;->cancel()V

    .line 12
    .line 13
    .line 14
    :goto_0
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(LMd;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->x:LKd;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, LKd;->n(LMd;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public o(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lh5;->j(Landroid/view/ContentInfo$Builder;Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onPostMessage(Landroid/webkit/WebView;Ljava/lang/reflect/InvocationHandler;Landroid/net/Uri;ZLjava/lang/reflect/InvocationHandler;)V
    .locals 7

    .line 1
    const-class v0, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;

    .line 2
    .line 3
    invoke-static {v0, p2}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;

    .line 8
    .line 9
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getPorts()[Ljava/lang/reflect/InvocationHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v1, v0

    .line 14
    new-array v1, v1, [Li0;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_0
    array-length v3, v0

    .line 18
    if-ge v2, v3, :cond_0

    .line 19
    .line 20
    new-instance v3, Li0;

    .line 21
    .line 22
    aget-object v4, v0, v2

    .line 23
    .line 24
    const/16 v5, 0x19

    .line 25
    .line 26
    invoke-direct {v3, v5}, Li0;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const-class v5, Lorg/chromium/support_lib_boundary/WebMessagePortBoundaryInterface;

    .line 30
    .line 31
    invoke-static {v5, v4}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lorg/chromium/support_lib_boundary/WebMessagePortBoundaryInterface;

    .line 36
    .line 37
    iput-object v4, v3, Li0;->d:Ljava/lang/Object;

    .line 38
    .line 39
    aput-object v3, v1, v2

    .line 40
    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    sget-object v0, Lik;->a:Lg1;

    .line 45
    .line 46
    invoke-virtual {v0}, Lh1;->b()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    const-class v0, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;

    .line 53
    .line 54
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getMessagePayload()Ljava/lang/reflect/InvocationHandler;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {v0, p2}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    check-cast p2, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;

    .line 63
    .line 64
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getType()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    if-eq v0, v1, :cond_1

    .line 72
    .line 73
    const/4 p2, 0x0

    .line 74
    move-object v3, p2

    .line 75
    goto :goto_2

    .line 76
    :cond_1
    new-instance v0, Ldk;

    .line 77
    .line 78
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getAsArrayBuffer()[B

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-direct {v0, p2}, Ldk;-><init>([B)V

    .line 83
    .line 84
    .line 85
    :goto_1
    move-object v3, v0

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    new-instance v0, Ldk;

    .line 88
    .line 89
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;->getAsString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-direct {v0, p2}, Ldk;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_3
    new-instance v0, Ldk;

    .line 98
    .line 99
    invoke-interface {p2}, Lorg/chromium/support_lib_boundary/WebMessageBoundaryInterface;->getData()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-direct {v0, p2}, Ldk;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :goto_2
    if-eqz v3, :cond_4

    .line 108
    .line 109
    const-class p2, Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;

    .line 110
    .line 111
    invoke-static {p2, p5}, Lr3;->g(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    check-cast p2, Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;

    .line 116
    .line 117
    new-instance p5, Lsc;

    .line 118
    .line 119
    invoke-direct {p5, p2}, Lsc;-><init>(Lorg/chromium/support_lib_boundary/JsReplyProxyBoundaryInterface;)V

    .line 120
    .line 121
    .line 122
    invoke-interface {p2, p5}, Lorg/chromium/support_lib_boundary/IsomorphicObjectBoundaryInterface;->getOrCreatePeer(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    move-object v6, p2

    .line 127
    check-cast v6, Ltc;

    .line 128
    .line 129
    iget-object p2, p0, Li0;->d:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast p2, Lbc;

    .line 132
    .line 133
    iget-object p2, p2, Lbc;->a:Ljava/lang/Object;

    .line 134
    .line 135
    move-object v1, p2

    .line 136
    check-cast v1, Lcom/getcapacitor/MessageHandler;

    .line 137
    .line 138
    move-object v2, p1

    .line 139
    move-object v4, p3

    .line 140
    move v5, p4

    .line 141
    invoke-static/range {v1 .. v6}, Lcom/getcapacitor/MessageHandler;->a(Lcom/getcapacitor/MessageHandler;Landroid/webkit/WebView;Ldk;Landroid/net/Uri;ZLtc;)V

    .line 142
    .line 143
    .line 144
    :cond_4
    return-void
.end method

.method public p(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Landroid/net/Uri;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lh5;->i(Landroid/view/ContentInfo$Builder;Landroid/net/Uri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r(LMd;Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    iget-object p1, p1, Landroidx/appcompat/widget/ActionMenuView;->C:Lm0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    check-cast p1, Lwi;

    .line 11
    .line 12
    iget-object p1, p1, Lwi;->c:Landroidx/appcompat/widget/Toolbar;

    .line 13
    .line 14
    iget-object v1, p1, Landroidx/appcompat/widget/Toolbar;->I:LRd;

    .line 15
    .line 16
    invoke-virtual {v1}, LRd;->b()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->K:LAi;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    check-cast p1, LCi;

    .line 24
    .line 25
    iget-object p1, p1, LCi;->c:LEi;

    .line 26
    .line 27
    iget-object p1, p1, LEi;->b:Landroid/view/Window$Callback;

    .line 28
    .line 29
    invoke-interface {p1, v0, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move p1, v0

    .line 35
    :goto_0
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    :cond_1
    return v0
.end method

.method public s()I
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {v0}, Lh5;->k(Landroid/view/ContentInfo;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public t(LMd;LTd;)V
    .locals 0

    .line 1
    iget-object p2, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, LW3;

    .line 4
    .line 5
    iget-object p2, p2, LW3;->i:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Li0;->c:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :sswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "<"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Li0;->d:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const/16 v1, 0x3e

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    return-object v0

    .line 35
    :sswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "ContentInfoCompat{"

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Li0;->d:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Landroid/view/ContentInfo;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v1, "}"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    return-object v0

    .line 59
    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_1
        0x14 -> :sswitch_0
    .end sparse-switch
.end method

.method public u(LMd;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lj0;

    .line 4
    .line 5
    iget-object v1, v0, Lj0;->e:LMd;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    move-object v1, p1

    .line 12
    check-cast v1, LKh;

    .line 13
    .line 14
    iget-object v1, v1, LKh;->A:LTd;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, Lj0;->g:Lhe;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-interface {v0, p1}, Lhe;->u(LMd;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    :cond_1
    return v2
.end method

.method public v(LMd;LTd;)V
    .locals 7

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LW3;

    .line 4
    .line 5
    iget-object v1, v0, LW3;->i:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, v0, LW3;->k:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    const/4 v5, -0x1

    .line 19
    if-ge v4, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    check-cast v6, LV3;

    .line 26
    .line 27
    iget-object v6, v6, LV3;->b:LMd;

    .line 28
    .line 29
    if-ne p1, v6, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v5

    .line 36
    :goto_1
    if-ne v4, v5, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v4, v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    move-object v2, v1

    .line 52
    check-cast v2, LV3;

    .line 53
    .line 54
    :cond_3
    new-instance v1, LU3;

    .line 55
    .line 56
    invoke-direct {v1, p0, v2, p2, p1}, LU3;-><init>(Li0;LV3;LTd;LMd;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    const-wide/16 v4, 0xc8

    .line 64
    .line 65
    add-long/2addr v2, v4

    .line 66
    iget-object p2, v0, LW3;->i:Landroid/os/Handler;

    .line 67
    .line 68
    invoke-virtual {p2, v1, p1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public w(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Li0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lh5;->h(Landroid/view/ContentInfo$Builder;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z(Landroid/net/Uri;Ljava/lang/String;Lr5;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p3, Lma;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, Lma;

    .line 7
    .line 8
    iget v1, v0, Lma;->h:I

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
    iput v1, v0, Lma;->h:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lma;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, Lma;-><init>(Li0;Lr5;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, Lma;->f:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v1, Li6;->c:Li6;

    .line 28
    .line 29
    iget v2, v0, Lma;->h:I

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
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, Llc;->P(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object p3, LR6;->a:LE6;

    .line 52
    .line 53
    sget-object p3, LB6;->e:LB6;

    .line 54
    .line 55
    new-instance v2, Lna;

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-direct {v2, p0, p1, p2, v4}, Lna;-><init>(Li0;Landroid/net/Uri;Ljava/lang/String;Lr5;)V

    .line 59
    .line 60
    .line 61
    iput v3, v0, Lma;->h:I

    .line 62
    .line 63
    invoke-static {p3, v2, v0}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    if-ne p3, v1, :cond_3

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_3
    :goto_1
    check-cast p3, Lpg;

    .line 71
    .line 72
    iget-object p1, p3, Lpg;->c:Ljava/lang/Object;

    .line 73
    .line 74
    return-object p1
.end method
