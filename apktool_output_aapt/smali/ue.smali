.class public final Lue;
.super Lc6;
.source "SourceFile"

# interfaces
.implements LG6;


# instance fields
.field public final e:Lc6;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lc6;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lc6;-><init>()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, LG6;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p1

    .line 9
    check-cast v0, LG6;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget v0, Lz6;->a:I

    .line 16
    .line 17
    :cond_1
    iput-object p1, p0, Lue;->e:Lc6;

    .line 18
    .line 19
    iput-object p2, p0, Lue;->f:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final d(LY5;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lue;->e:Lc6;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lc6;->d(LY5;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(LY5;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lue;->e:Lc6;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lc6;->e(LY5;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    return p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lue;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method
