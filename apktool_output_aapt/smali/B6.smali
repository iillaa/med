.class public final LB6;
.super LN7;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field public static final e:LB6;

.field public static final f:Lc6;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, LB6;

    .line 2
    .line 3
    invoke-direct {v0}, Lc6;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LB6;->e:LB6;

    .line 7
    .line 8
    sget-object v0, Lgj;->e:Lgj;

    .line 9
    .line 10
    sget v1, LVh;->a:I

    .line 11
    .line 12
    const/16 v2, 0x40

    .line 13
    .line 14
    if-ge v2, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    const/16 v2, 0xc

    .line 19
    .line 20
    const-string v3, "kotlinx.coroutines.io.parallelism"

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {v3, v1, v4, v4, v2}, Llc;->O(Ljava/lang/String;IIII)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v2, v1}, Lgj;->f(Ljava/lang/String;I)Lc6;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, LB6;->f:Lc6;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "Cannot be invoked on Dispatchers.IO"

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    throw v0
.end method

.method public final d(LY5;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, LB6;->f:Lc6;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lc6;->d(LY5;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final execute(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, LE7;->c:LE7;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, LB6;->d(LY5;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object v0
.end method
