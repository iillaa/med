.class public final Lj9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lg9;


# direct methods
.method public constructor <init>(Lg9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lj9;->a:Lg9;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lj9;->a:Lg9;

    .line 2
    .line 3
    iget-object v0, v0, Lg9;->e:Lr9;

    .line 4
    .line 5
    iget-object v1, v0, Lq9;->r:Lg9;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Lq9;->y:Z

    .line 12
    .line 13
    iput-boolean v1, v0, Lq9;->z:Z

    .line 14
    .line 15
    iget-object v1, v0, Lq9;->E:Lu9;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget-object v0, v0, Lq9;->c:LN6;

    .line 21
    .line 22
    invoke-virtual {v0}, LN6;->j()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    :goto_1
    return-void
.end method
