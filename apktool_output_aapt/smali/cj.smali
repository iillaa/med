.class public final Lcj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz8;


# instance fields
.field public final c:LY5;

.field public final d:Ljava/lang/Object;

.field public final e:Lbj;


# direct methods
.method public constructor <init>(Lz8;LY5;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcj;->c:LY5;

    .line 5
    .line 6
    invoke-static {p2}, Lr3;->G(LY5;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, Lcj;->d:Ljava/lang/Object;

    .line 11
    .line 12
    new-instance p2, Lbj;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p2, p1, v0}, Lbj;-><init>(Lz8;Lr5;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcj;->e:Lbj;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcj;->c:LY5;

    .line 2
    .line 3
    iget-object v1, p0, Lcj;->d:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Lcj;->e:Lbj;

    .line 6
    .line 7
    invoke-static {v0, p1, v1, v2, p2}, LSi;->I(LY5;Ljava/lang/Object;Ljava/lang/Object;LN9;Lr5;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object p2, Li6;->c:Li6;

    .line 12
    .line 13
    if-ne p1, p2, :cond_0

    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_0
    sget-object p1, Lfj;->a:Lfj;

    .line 17
    .line 18
    return-object p1
.end method
