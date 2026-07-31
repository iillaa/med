.class public final Ll1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LWe;


# instance fields
.field public final synthetic a:Lm1;


# direct methods
.method public constructor <init>(Lm1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll1;->a:Lm1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll1;->a:Lm1;

    .line 2
    .line 3
    invoke-virtual {p1}, Lm1;->getDelegate()Lx1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lx1;->a()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, LX4;->getSavedStateRegistry()LGg;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v1, "androidx:appcompat"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, LGg;->a(Ljava/lang/String;)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lx1;->d()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
