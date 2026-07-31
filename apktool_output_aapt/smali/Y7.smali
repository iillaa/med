.class public final LY7;
.super LV7;
.source "SourceFile"


# instance fields
.field public b:Z

.field public c:[Ljava/io/File;

.field public d:I

.field public final synthetic e:LZ7;


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
    iput-object p1, p0, LY7;->e:LZ7;

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
    .locals 6

    .line 1
    iget-boolean v0, p0, LY7;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, p0, LY7;->e:LZ7;

    .line 5
    .line 6
    iget-object v3, p0, La8;->a:Ljava/io/File;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, v2, LZ7;->f:Lb8;

    .line 11
    .line 12
    iget-object v0, v0, Lb8;->c:LJ9;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0, v3}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, LY7;->b:Z

    .line 31
    .line 32
    return-object v3

    .line 33
    :cond_1
    iget-object v0, p0, LY7;->c:[Ljava/io/File;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    iget v4, p0, LY7;->d:I

    .line 38
    .line 39
    array-length v5, v0

    .line 40
    if-ge v4, v5, :cond_2

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    iget-object v0, v2, LZ7;->f:Lb8;

    .line 44
    .line 45
    iget-object v0, v0, Lb8;->d:LJ9;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-interface {v0, v3}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_3
    return-object v1

    .line 53
    :cond_4
    :goto_0
    if-nez v0, :cond_8

    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, LY7;->c:[Ljava/io/File;

    .line 60
    .line 61
    if-nez v0, :cond_5

    .line 62
    .line 63
    iget-object v0, v2, LZ7;->f:Lb8;

    .line 64
    .line 65
    iget-object v0, v0, Lb8;->e:LN9;

    .line 66
    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    new-instance v4, Lu;

    .line 70
    .line 71
    invoke-direct {v4, v3}, Lu;-><init>(Ljava/io/File;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {v0, v3, v4}, LN9;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object v0, p0, LY7;->c:[Ljava/io/File;

    .line 78
    .line 79
    if-eqz v0, :cond_6

    .line 80
    .line 81
    array-length v0, v0

    .line 82
    if-nez v0, :cond_8

    .line 83
    .line 84
    :cond_6
    iget-object v0, v2, LZ7;->f:Lb8;

    .line 85
    .line 86
    iget-object v0, v0, Lb8;->d:LJ9;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    invoke-interface {v0, v3}, LJ9;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :cond_7
    return-object v1

    .line 94
    :cond_8
    iget-object v0, p0, LY7;->c:[Ljava/io/File;

    .line 95
    .line 96
    invoke-static {v0}, Llc;->e(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    iget v1, p0, LY7;->d:I

    .line 100
    .line 101
    add-int/lit8 v2, v1, 0x1

    .line 102
    .line 103
    iput v2, p0, LY7;->d:I

    .line 104
    .line 105
    aget-object v0, v0, v1

    .line 106
    .line 107
    return-object v0
.end method
