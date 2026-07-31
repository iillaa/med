.class public final Lh;
.super Ls5;
.source "SourceFile"


# instance fields
.field public f:Lrg;

.field public synthetic g:Ljava/lang/Object;

.field public final synthetic h:Li0;

.field public i:I


# direct methods
.method public constructor <init>(Li0;Lr5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lh;->h:Li0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ls5;-><init>(Lr5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lh;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lh;->i:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lh;->i:I

    .line 9
    .line 10
    iget-object p1, p0, Lh;->h:Li0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0, p0}, Li0;->c(Lz8;Lr5;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method
