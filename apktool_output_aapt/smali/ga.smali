.class public final enum Lga;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lha;


# static fields
.field public static final enum g:Lga;

.field public static final synthetic h:[Lga;


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:[J

.field public final e:[I

.field public final f:[J


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v7, Lga;

    .line 2
    .line 3
    const/4 v8, 0x4

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
    const/16 v10, 0xfa

    .line 11
    .line 12
    const/16 v0, 0xb4

    .line 13
    .line 14
    filled-new-array {v9, v10, v9, v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    new-array v6, v8, [J

    .line 19
    .line 20
    fill-array-data v6, :array_1

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const-string v3, "SUCCESS"

    .line 25
    .line 26
    const-string v1, "SUCCESS"

    .line 27
    .line 28
    move-object v0, v7

    .line 29
    invoke-direct/range {v0 .. v6}, Lga;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 30
    .line 31
    .line 32
    sput-object v7, Lga;->g:Lga;

    .line 33
    .line 34
    new-instance v0, Lga;

    .line 35
    .line 36
    const/4 v1, 0x6

    .line 37
    new-array v15, v1, [J

    .line 38
    .line 39
    fill-array-data v15, :array_2

    .line 40
    .line 41
    .line 42
    new-array v2, v1, [I

    .line 43
    .line 44
    fill-array-data v2, :array_3

    .line 45
    .line 46
    .line 47
    new-array v1, v1, [J

    .line 48
    .line 49
    fill-array-data v1, :array_4

    .line 50
    .line 51
    .line 52
    const/4 v13, 0x1

    .line 53
    const-string v14, "WARNING"

    .line 54
    .line 55
    const-string v12, "WARNING"

    .line 56
    .line 57
    move-object v11, v0

    .line 58
    move-object/from16 v16, v2

    .line 59
    .line 60
    move-object/from16 v17, v1

    .line 61
    .line 62
    invoke-direct/range {v11 .. v17}, Lga;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Lga;

    .line 66
    .line 67
    new-array v2, v8, [J

    .line 68
    .line 69
    fill-array-data v2, :array_5

    .line 70
    .line 71
    .line 72
    const/16 v3, 0x78

    .line 73
    .line 74
    filled-new-array {v9, v3, v9, v10}, [I

    .line 75
    .line 76
    .line 77
    move-result-object v21

    .line 78
    new-array v3, v8, [J

    .line 79
    .line 80
    fill-array-data v3, :array_6

    .line 81
    .line 82
    .line 83
    const/16 v18, 0x2

    .line 84
    .line 85
    const-string v19, "ERROR"

    .line 86
    .line 87
    const-string v17, "ERROR"

    .line 88
    .line 89
    move-object/from16 v16, v1

    .line 90
    .line 91
    move-object/from16 v20, v2

    .line 92
    .line 93
    move-object/from16 v22, v3

    .line 94
    .line 95
    invoke-direct/range {v16 .. v22}, Lga;-><init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V

    .line 96
    .line 97
    .line 98
    const/4 v2, 0x3

    .line 99
    new-array v2, v2, [Lga;

    .line 100
    .line 101
    aput-object v7, v2, v9

    .line 102
    .line 103
    const/4 v3, 0x1

    .line 104
    aput-object v0, v2, v3

    .line 105
    .line 106
    const/4 v0, 0x2

    .line 107
    aput-object v1, v2, v0

    .line 108
    .line 109
    sput-object v2, Lga;->h:[Lga;

    .line 110
    .line 111
    return-void

    .line 112
    nop

    .line 113
    :array_0
    .array-data 8
        0x0
        0x23
        0x41
        0x15
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
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
    :array_1
    .array-data 8
        0x0
        0x23
        0x41
        0x15
    .end array-data

    :array_2
    .array-data 8
        0x0
        0x1e
        0x28
        0x1e
        0x32
        0x3c
    .end array-data

    :array_3
    .array-data 4
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
    .end array-data

    :array_4
    .array-data 8
        0x0
        0x1e
        0x28
        0x1e
        0x32
        0x3c
    .end array-data

    :array_5
    .array-data 8
        0x0
        0x1b
        0x2d
        0x32
    .end array-data

    :array_6
    .array-data 8
        0x0
        0x1b
        0x2d
        0x32
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;[J[I[J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lga;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lga;->d:[J

    .line 7
    .line 8
    iput-object p5, p0, Lga;->e:[I

    .line 9
    .line 10
    iput-object p6, p0, Lga;->f:[J

    .line 11
    .line 12
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lga;
    .locals 1

    .line 1
    const-class v0, Lga;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lga;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lga;
    .locals 1

    .line 1
    sget-object v0, Lga;->h:[Lga;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lga;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lga;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final b()[I
    .locals 1

    .line 1
    iget-object v0, p0, Lga;->e:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public final c()[J
    .locals 1

    .line 1
    iget-object v0, p0, Lga;->d:[J

    .line 2
    .line 3
    return-object v0
.end method

.method public final e()[J
    .locals 1

    .line 1
    iget-object v0, p0, Lga;->f:[J

    .line 2
    .line 3
    return-object v0
.end method
