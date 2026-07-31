.class public final enum Lfa;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lha;


# static fields
.field public static final enum g:Lfa;

.field public static final synthetic h:[Lfa;


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:[J

.field public final e:[I

.field public final f:[J


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v7, Lfa;

    .line 2
    .line 3
    const/4 v8, 0x2

    .line 4
    new-array v4, v8, [J

    .line 5
    .line 6
    fill-array-data v4, :array_0

    .line 7
    .line 8
    .line 9
    const/4 v9, 0x0

    .line 10
    const/16 v0, 0x6e

    .line 11
    .line 12
    filled-new-array {v9, v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    new-array v6, v8, [J

    .line 17
    .line 18
    fill-array-data v6, :array_1

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const-string v3, "LIGHT"

    .line 23
    .line 24
    const-string v1, "LIGHT"

    .line 25
    .line 26
    move-object v0, v7

    .line 27
    invoke-direct/range {v0 .. v6}, Lfa;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Lfa;

    .line 31
    .line 32
    new-array v14, v8, [J

    .line 33
    .line 34
    fill-array-data v14, :array_2

    .line 35
    .line 36
    .line 37
    const/16 v1, 0xb4

    .line 38
    .line 39
    filled-new-array {v9, v1}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v15

    .line 43
    new-array v1, v8, [J

    .line 44
    .line 45
    fill-array-data v1, :array_3

    .line 46
    .line 47
    .line 48
    const/4 v12, 0x1

    .line 49
    const-string v13, "MEDIUM"

    .line 50
    .line 51
    const-string v11, "MEDIUM"

    .line 52
    .line 53
    move-object v10, v0

    .line 54
    move-object/from16 v16, v1

    .line 55
    .line 56
    invoke-direct/range {v10 .. v16}, Lfa;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 57
    .line 58
    .line 59
    new-instance v1, Lfa;

    .line 60
    .line 61
    new-array v2, v8, [J

    .line 62
    .line 63
    fill-array-data v2, :array_4

    .line 64
    .line 65
    .line 66
    const/16 v3, 0xff

    .line 67
    .line 68
    filled-new-array {v9, v3}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v21

    .line 72
    new-array v3, v8, [J

    .line 73
    .line 74
    fill-array-data v3, :array_5

    .line 75
    .line 76
    .line 77
    const/16 v18, 0x2

    .line 78
    .line 79
    const-string v19, "HEAVY"

    .line 80
    .line 81
    const-string v17, "HEAVY"

    .line 82
    .line 83
    move-object/from16 v16, v1

    .line 84
    .line 85
    move-object/from16 v20, v2

    .line 86
    .line 87
    move-object/from16 v22, v3

    .line 88
    .line 89
    invoke-direct/range {v16 .. v22}, Lfa;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 90
    .line 91
    .line 92
    sput-object v1, Lfa;->g:Lfa;

    .line 93
    .line 94
    const/4 v2, 0x3

    .line 95
    new-array v2, v2, [Lfa;

    .line 96
    .line 97
    aput-object v7, v2, v9

    .line 98
    .line 99
    const/4 v3, 0x1

    .line 100
    aput-object v0, v2, v3

    .line 101
    .line 102
    aput-object v1, v2, v8

    .line 103
    .line 104
    sput-object v2, Lfa;->h:[Lfa;

    .line 105
    .line 106
    return-void

    .line 107
    :array_0
    .array-data 8
        0x0
        0x32
    .end array-data

    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :array_1
    .array-data 8
        0x0
        0x14
    .end array-data

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    :array_2
    .array-data 8
        0x0
        0x2b
    .end array-data

    :array_3
    .array-data 8
        0x0
        0x2b
    .end array-data

    :array_4
    .array-data 8
        0x0
        0x3c
    .end array-data

    :array_5
    .array-data 8
        0x0
        0x3d
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lfa;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lfa;->d:[J

    .line 7
    .line 8
    iput-object p5, p0, Lfa;->e:[I

    .line 9
    .line 10
    iput-object p6, p0, Lfa;->f:[J

    .line 11
    .line 12
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfa;
    .locals 1

    .line 1
    const-class v0, Lfa;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lfa;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lfa;
    .locals 1

    .line 1
    sget-object v0, Lfa;->h:[Lfa;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lfa;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lfa;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final b()[I
    .locals 1

    .line 1
    iget-object v0, p0, Lfa;->e:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public final c()[J
    .locals 1

    .line 1
    iget-object v0, p0, Lfa;->d:[J

    .line 2
    .line 3
    return-object v0
.end method

.method public final e()[J
    .locals 1

    .line 1
    iget-object v0, p0, Lfa;->f:[J

    .line 2
    .line 3
    return-object v0
.end method
