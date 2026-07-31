.class public abstract LJ3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LCc;
.implements Ljava/io/Serializable;


# instance fields
.field public transient c:LCc;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Class;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Z


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LJ3;->d:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, LJ3;->e:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p3, p0, LJ3;->f:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, LJ3;->g:Ljava/lang/String;

    .line 11
    .line 12
    iput-boolean p5, p0, LJ3;->h:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final b()Ll4;
    .locals 2

    .line 1
    iget-object v0, p0, LJ3;->e:Ljava/lang/Class;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    iget-boolean v1, p0, LJ3;->h:Z

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    sget-object v1, LUf;->a:LVf;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lef;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Lef;-><init>(Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    move-object v0, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    sget-object v1, LUf;->a:LVf;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    new-instance v1, Lm4;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Lm4;-><init>(Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    return-object v0
.end method
