.class public final LM6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Li0;

.field public final c:LS3;

.field public final d:LS3;

.field public e:Landroid/view/VelocityTracker;

.field public f:F

.field public g:I

.field public h:I

.field public i:I

.field public final j:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;Li0;)V
    .locals 4

    .line 1
    new-instance v0, LS3;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, LS3;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    iput v2, p0, LM6;->g:I

    .line 16
    .line 17
    iput v2, p0, LM6;->h:I

    .line 18
    .line 19
    iput v2, p0, LM6;->i:I

    .line 20
    .line 21
    const v2, 0x7fffffff

    .line 22
    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    filled-new-array {v2, v3}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, p0, LM6;->j:[I

    .line 30
    .line 31
    iput-object p1, p0, LM6;->a:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p2, p0, LM6;->b:Li0;

    .line 34
    .line 35
    iput-object v0, p0, LM6;->c:LS3;

    .line 36
    .line 37
    iput-object v1, p0, LM6;->d:LS3;

    .line 38
    .line 39
    return-void
.end method
