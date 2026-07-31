.class public final Lwa;
.super LSh;
.source "SourceFile"

# interfaces
.implements LO9;


# instance fields
.field public synthetic g:Ljava/lang/Throwable;

.field public final synthetic h:Li0;

.field public final synthetic i:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Li0;Landroid/net/Uri;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lwa;->h:Li0;

    .line 2
    .line 3
    iput-object p2, p0, Lwa;->i:Landroid/net/Uri;

    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-direct {p0, p1, p3}, LSh;-><init>(ILr5;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, Lz8;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Throwable;

    .line 4
    .line 5
    check-cast p3, Lr5;

    .line 6
    .line 7
    new-instance p1, Lwa;

    .line 8
    .line 9
    iget-object v0, p0, Lwa;->h:Li0;

    .line 10
    .line 11
    iget-object v1, p0, Lwa;->i:Landroid/net/Uri;

    .line 12
    .line 13
    invoke-direct {p1, v0, v1, p3}, Lwa;-><init>(Li0;Landroid/net/Uri;Lr5;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p1, Lwa;->g:Ljava/lang/Throwable;

    .line 17
    .line 18
    sget-object p2, Lfj;->a:Lfj;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lwa;->k(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    throw p1
.end method

.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {p1}, Llc;->P(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lwa;->g:Ljava/lang/Throwable;

    .line 5
    .line 6
    iget-object v0, p0, Lwa;->h:Li0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lwa;->i:Landroid/net/Uri;

    .line 12
    .line 13
    invoke-static {p1, v0}, Li0;->F(Ljava/lang/Throwable;Landroid/net/Uri;)Ljava/lang/Throwable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    throw p1
.end method
