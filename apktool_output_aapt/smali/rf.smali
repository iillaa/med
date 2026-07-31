.class public final Lrf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:[Ljava/lang/String;


# instance fields
.field public final a:I

.field public final b:I

.field public c:Z

.field public final d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public final f:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const-string v8, "JSON error"

    .line 2
    .line 3
    const-string v9, "Error"

    .line 4
    .line 5
    const-string v0, "No result"

    .line 6
    .line 7
    const-string v1, "OK"

    .line 8
    .line 9
    const-string v2, "Class not found"

    .line 10
    .line 11
    const-string v3, "Illegal access"

    .line 12
    .line 13
    const-string v4, "Instantiation error"

    .line 14
    .line 15
    const-string v5, "Malformed url"

    .line 16
    .line 17
    const-string v6, "IO error"

    .line 18
    .line 19
    const-string v7, "Invalid action"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lrf;->g:[Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    sget-object v0, Lrf;->g:[Ljava/lang/String;

    invoke-static {p1}, Loh;->d(I)I

    move-result v1

    aget-object v0, v0, v1

    invoke-direct {p0, v0, p1}, Lrf;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    invoke-static {p1}, Loh;->d(I)I

    move-result p1

    iput p1, p0, Lrf;->a:I

    const/4 p1, 0x3

    iput p1, p0, Lrf;->b:I

    const-string p1, ""

    .line 3
    invoke-static {p1, p2}, Loh;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 4
    iput-object p1, p0, Lrf;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILorg/json/JSONObject;)V
    .locals 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    invoke-static {p1}, Loh;->d(I)I

    move-result p1

    iput p1, p0, Lrf;->a:I

    const/4 p1, 0x2

    iput p1, p0, Lrf;->b:I

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrf;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    invoke-static {p2}, Loh;->d(I)I

    move-result p2

    iput p2, p0, Lrf;->a:I

    if-nez p1, :cond_0

    const/4 p2, 0x5

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    iput p2, p0, Lrf;->b:I

    iput-object p1, p0, Lrf;->d:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    const/4 v0, 0x2

    invoke-static {v0}, Loh;->d(I)I

    move-result v0

    iput v0, p0, Lrf;->a:I

    const/16 v0, 0x8

    iput v0, p0, Lrf;->b:I

    iput-object p1, p0, Lrf;->f:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONArray;)V
    .locals 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    const/4 v0, 0x2

    invoke-static {v0}, Loh;->d(I)I

    move-result v1

    iput v1, p0, Lrf;->a:I

    iput v0, p0, Lrf;->b:I

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrf;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrf;->c:Z

    const/4 v0, 0x2

    invoke-static {v0}, Loh;->d(I)I

    move-result v1

    iput v1, p0, Lrf;->a:I

    const/4 v1, 0x6

    iput v1, p0, Lrf;->b:I

    invoke-static {p1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrf;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lrf;->e:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrf;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lrf;->e:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lrf;->e:Ljava/lang/String;

    .line 14
    .line 15
    return-object v0
.end method
