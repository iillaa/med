.class public final LW7;
.super LV7;
.source "SourceFile"


# instance fields
.field public b:Z

.field public c:[Ljava/io/File;

.field public d:I

.field public e:Z

.field public final synthetic f:LZ7;


# direct methods
.method public constructor <init>(LZ7;Ljava/io/File;)V
    .locals 1

    .line 1
    const-string v0, "rootDir"

    .line 2
    .line 3
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, LW7;->f:LZ7;

    .line 7
    .line 8
    invoke-direct {p0, p2}, La8;-><init>(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Ljava/io/File;
    .locals 7

    .line 1
    iget-boolean v0, p0, LW7;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    iget-object v3, p0, LW7;->f:LZ7;

    .line 6
    .line 7
    iget-object v4, p0, La8;->a:Ljava/io/File;

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, LW7;->c:[Ljava/io/File;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, v3, LZ7;->f:Lb8;

    .line 16
    .line 17
    iget-object v0, v0, Lb8;->c:LJ9;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, v4}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_0
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, LW7;->c:[Ljava/io/File;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, v3, LZ7;->f:Lb8;

    .line 43
    .line 44
    iget-object v0, v0, Lb8;->e:LN9;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    new-instance v5, Lu;

    .line 49
    .line 50
    invoke-direct {v5, v4}, Lu;-><init>(Ljava/io/File;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v4, v5}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :cond_1
    iput-boolean v2, p0, LW7;->e:Z

    .line 57
    .line 58
    :cond_2
    iget-object v0, p0, LW7;->c:[Ljava/io/File;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget v5, p0, LW7;->d:I

    .line 63
    .line 64
    array-length v6, v0

    .line 65
    if-ge v5, v6, :cond_3

    .line 66
    .line 67
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget v1, p0, LW7;->d:I

    .line 71
    .line 72
    add-int/lit8 v2, v1, 0x1

    .line 73
    .line 74
    iput v2, p0, LW7;->d:I

    .line 75
    .line 76
    aget-object v0, v0, v1

    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_3
    iget-boolean v0, p0, LW7;->b:Z

    .line 80
    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    iput-boolean v2, p0, LW7;->b:Z

    .line 84
    .line 85
    return-object v4

    .line 86
    :cond_4
    iget-object v0, v3, LZ7;->f:Lb8;

    .line 87
    .line 88
    iget-object v0, v0, Lb8;->d:LJ9;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    invoke-interface {v0, v4}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    :cond_5
    return-object v1
.end method
