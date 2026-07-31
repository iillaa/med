.class public final LE6;
.super LLg;
.source "SourceFile"


# static fields
.field public static final f:LE6;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v6, LE6;

    .line 2
    .line 3
    sget v1, Lgi;->c:I

    .line 4
    .line 5
    sget v2, Lgi;->d:I

    .line 6
    .line 7
    sget-wide v3, Lgi;->e:J

    .line 8
    .line 9
    sget-object v5, Lgi;->a:Ljava/lang/String;

    .line 10
    .line 11
    move-object v0, v6

    .line 12
    invoke-direct/range {v0 .. v5}, LLg;-><init>(IIJLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sput-object v6, LE6;->f:LE6;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v1, "Dispatchers.Default cannot be closed"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.Default"

    .line 2
    .line 3
    return-object v0
.end method
