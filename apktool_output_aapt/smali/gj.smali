.class public final Lgj;
.super Lc6;
.source "SourceFile"


# static fields
.field public static final e:Lgj;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lgj;

    .line 2
    .line 3
    invoke-direct {v0}, Lc6;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lgj;->e:Lgj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final d(LY5;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object p1, LE6;->f:LE6;

    .line 2
    .line 3
    iget-object p1, p1, LLg;->e:Lg6;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p1, p2, v0, v1}, Lg6;->b(Ljava/lang/Runnable;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f(Ljava/lang/String;I)Lc6;
    .locals 1

    .line 1
    invoke-static {p2}, LMk;->e(I)V

    .line 2
    .line 3
    .line 4
    sget v0, Lgi;->d:I

    .line 5
    .line 6
    if-lt p2, v0, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance p2, Lue;

    .line 11
    .line 12
    invoke-direct {p2, p0, p1}, Lue;-><init>(Lc6;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p2, p0

    .line 17
    :goto_0
    return-object p2

    .line 18
    :cond_1
    invoke-super {p0, p1, p2}, Lc6;->f(Ljava/lang/String;I)Lc6;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    return-object p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object v0
.end method
