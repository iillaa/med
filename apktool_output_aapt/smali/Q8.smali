.class public final LQ8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lt5;


# instance fields
.field public final a:Lm7;

.field public b:I

.field public final c:LA6;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lt5;

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LQ8;->d:Lt5;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lm7;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LQ8;->b:I

    .line 6
    .line 7
    new-instance v0, LA6;

    .line 8
    .line 9
    invoke-direct {v0}, LA6;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LQ8;->c:LA6;

    .line 13
    .line 14
    iput-object p1, p0, LQ8;->a:Lm7;

    .line 15
    .line 16
    return-void
.end method
