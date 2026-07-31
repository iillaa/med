.class public final Lah;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz8;


# instance fields
.field public final c:LZg;


# direct methods
.method public constructor <init>(LZg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lah;->c:LZg;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lah;->c:LZg;

    .line 2
    .line 3
    invoke-interface {v0, p2, p1}, LZg;->d(Lr5;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object p2, Li6;->c:Li6;

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    sget-object p1, Lfj;->a:Lfj;

    .line 13
    .line 14
    return-object p1
.end method
