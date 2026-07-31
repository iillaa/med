.class public final Lb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbh;


# instance fields
.field public final a:Ljava/io/File;

.field public final b:Lc8;

.field public final c:LJ9;

.field public final d:LJ9;

.field public final e:LN9;

.field public final f:I


# direct methods
.method public constructor <init>(Ljava/io/File;Lc8;Le8;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lb8;->a:Ljava/io/File;

    .line 5
    .line 6
    iput-object p2, p0, Lb8;->b:Lc8;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lb8;->c:LJ9;

    .line 10
    .line 11
    iput-object p1, p0, Lb8;->d:LJ9;

    .line 12
    .line 13
    iput-object p3, p0, Lb8;->e:LN9;

    .line 14
    .line 15
    iput p4, p0, Lb8;->f:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    new-instance v0, LZ7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LZ7;-><init>(Lb8;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
