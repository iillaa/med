.class public final synthetic LB3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LO9;


# instance fields
.field public final synthetic c:LJ9;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LJ9;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LB3;->c:LJ9;

    iput-object p2, p0, LB3;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    check-cast p3, LY5;

    .line 4
    .line 5
    iget-object p1, p0, LB3;->c:LJ9;

    .line 6
    .line 7
    iget-object p2, p0, LB3;->d:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {p1, p2, p3}, LMk;->b(LJ9;Ljava/lang/Object;LY5;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lfj;->a:Lfj;

    .line 13
    .line 14
    return-object p1
.end method
