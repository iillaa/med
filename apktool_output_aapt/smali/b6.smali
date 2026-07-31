.class public final Lb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LX5;


# instance fields
.field public final c:LJ9;

.field public final d:LX5;


# direct methods
.method public constructor <init>(LX5;LJ9;)V
    .locals 1

    .line 1
    const-string v0, "baseKey"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lb6;->c:LJ9;

    .line 10
    .line 11
    instance-of p2, p1, Lb6;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    check-cast p1, Lb6;

    .line 16
    .line 17
    iget-object p1, p1, Lb6;->d:LX5;

    .line 18
    .line 19
    :cond_0
    iput-object p1, p0, Lb6;->d:LX5;

    .line 20
    .line 21
    return-void
.end method
