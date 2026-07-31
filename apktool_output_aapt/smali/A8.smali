.class public final LA8;
.super Ls5;
.source "SourceFile"


# instance fields
.field public f:Lz8;

.field public g:LSf;

.field public h:LC3;

.field public i:Z

.field public synthetic j:Ljava/lang/Object;

.field public k:I


# virtual methods
.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, LA8;->j:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, LA8;->k:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, LA8;->k:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, p1, v0, p0}, Lr3;->m(Lz8;Lzf;ZLr5;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1
.end method
