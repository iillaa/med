.class public final Lqb;
.super Ls5;
.source "SourceFile"


# instance fields
.field public f:Ljava/io/InputStream;

.field public g:LIb;

.field public h:LN9;

.field public i:I

.field public j:I

.field public k:I

.field public synthetic l:Ljava/lang/Object;

.field public m:I


# virtual methods
.method public final k(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iput-object p1, p0, Lqb;->l:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Lqb;->m:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lqb;->m:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, p1, v0, p1, p0}, Lu6;->w(Ljava/io/InputStream;LIb;ILN9;Lr5;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    return-object p1
.end method
