.class public final LB0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lw0;

.field public final b:Lx0;


# direct methods
.method public constructor <init>(Lx0;Lw0;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "contract"

    .line 7
    .line 8
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, LB0;->a:Lw0;

    .line 15
    .line 16
    iput-object p1, p0, LB0;->b:Lx0;

    .line 17
    .line 18
    return-void
.end method
