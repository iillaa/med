.class public final enum Lpb;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final e:Lt5;

.field public static final enum f:Lpb;

.field public static final enum g:Lpb;

.field public static final enum h:Lpb;

.field public static final enum i:Lpb;

.field public static final enum j:Lpb;

.field public static final enum k:Lpb;

.field public static final synthetic l:[Lpb;

.field public static final synthetic m:LJ7;


# instance fields
.field public final c:Z

.field public final d:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 1
    new-instance v6, Lpb;

    .line 2
    .line 3
    const-string v0, "CACHE"

    .line 4
    .line 5
    const-string v1, "TEMPORARY"

    .line 6
    .line 7
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    const-string v1, "INTERNAL_CACHE"

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    move-object v0, v6

    .line 21
    invoke-direct/range {v0 .. v5}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;I)V

    .line 22
    .line 23
    .line 24
    sput-object v6, Lpb;->f:Lpb;

    .line 25
    .line 26
    new-instance v0, Lpb;

    .line 27
    .line 28
    const-string v1, "DATA"

    .line 29
    .line 30
    const-string v2, "LIBRARY"

    .line 31
    .line 32
    const-string v3, "FILES"

    .line 33
    .line 34
    const-string v4, "LIBRARY_NO_CLOUD"

    .line 35
    .line 36
    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v11

    .line 44
    const/4 v9, 0x1

    .line 45
    const/4 v10, 0x0

    .line 46
    const-string v8, "INTERNAL_FILES"

    .line 47
    .line 48
    const/4 v12, 0x1

    .line 49
    move-object v7, v0

    .line 50
    invoke-direct/range {v7 .. v12}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;I)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lpb;->g:Lpb;

    .line 54
    .line 55
    new-instance v1, Lpb;

    .line 56
    .line 57
    const-string v2, "CACHE_EXTERNAL"

    .line 58
    .line 59
    invoke-static {v2}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v17

    .line 63
    const/4 v15, 0x2

    .line 64
    const/16 v16, 0x0

    .line 65
    .line 66
    const-string v14, "EXTERNAL_CACHE"

    .line 67
    .line 68
    const/16 v18, 0x1

    .line 69
    .line 70
    move-object v13, v1

    .line 71
    invoke-direct/range {v13 .. v18}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;I)V

    .line 72
    .line 73
    .line 74
    sput-object v1, Lpb;->h:Lpb;

    .line 75
    .line 76
    new-instance v2, Lpb;

    .line 77
    .line 78
    const-string v3, "EXTERNAL"

    .line 79
    .line 80
    const-string v4, "FILES_EXTERNAL"

    .line 81
    .line 82
    filled-new-array {v3, v4}, [Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v3}, Lu4;->F([Ljava/lang/Object;)Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v11

    .line 90
    const/4 v9, 0x3

    .line 91
    const-string v8, "EXTERNAL_FILES"

    .line 92
    .line 93
    move-object v7, v2

    .line 94
    invoke-direct/range {v7 .. v12}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;I)V

    .line 95
    .line 96
    .line 97
    sput-object v2, Lpb;->i:Lpb;

    .line 98
    .line 99
    new-instance v3, Lpb;

    .line 100
    .line 101
    const-string v4, "sdcard"

    .line 102
    .line 103
    invoke-static {v4}, Lu6;->t(Ljava/lang/Object;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    const/4 v5, 0x4

    .line 108
    const/4 v7, 0x1

    .line 109
    const-string v8, "EXTERNAL_STORAGE"

    .line 110
    .line 111
    invoke-direct {v3, v8, v5, v7, v4}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;)V

    .line 112
    .line 113
    .line 114
    sput-object v3, Lpb;->j:Lpb;

    .line 115
    .line 116
    new-instance v4, Lpb;

    .line 117
    .line 118
    const/4 v13, 0x0

    .line 119
    const-string v10, "DOCUMENTS"

    .line 120
    .line 121
    const/4 v11, 0x5

    .line 122
    const/4 v14, 0x2

    .line 123
    move-object v9, v4

    .line 124
    invoke-direct/range {v9 .. v14}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;I)V

    .line 125
    .line 126
    .line 127
    sput-object v4, Lpb;->k:Lpb;

    .line 128
    .line 129
    const/4 v8, 0x6

    .line 130
    new-array v8, v8, [Lpb;

    .line 131
    .line 132
    const/4 v9, 0x0

    .line 133
    aput-object v6, v8, v9

    .line 134
    .line 135
    aput-object v0, v8, v7

    .line 136
    .line 137
    const/4 v0, 0x2

    .line 138
    aput-object v1, v8, v0

    .line 139
    .line 140
    const/4 v0, 0x3

    .line 141
    aput-object v2, v8, v0

    .line 142
    .line 143
    aput-object v3, v8, v5

    .line 144
    .line 145
    const/4 v0, 0x5

    .line 146
    aput-object v4, v8, v0

    .line 147
    .line 148
    sput-object v8, Lpb;->l:[Lpb;

    .line 149
    .line 150
    new-instance v0, LJ7;

    .line 151
    .line 152
    invoke-direct {v0, v8}, LJ7;-><init>([Ljava/lang/Enum;)V

    .line 153
    .line 154
    .line 155
    sput-object v0, Lpb;->m:LJ7;

    .line 156
    .line 157
    new-instance v0, Lt5;

    .line 158
    .line 159
    const/16 v1, 0x10

    .line 160
    .line 161
    invoke-direct {v0, v1}, Lt5;-><init>(I)V

    .line 162
    .line 163
    .line 164
    sput-object v0, Lpb;->e:Lt5;

    .line 165
    .line 166
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-boolean p3, p0, Lpb;->c:Z

    iput-object p4, p0, Lpb;->d:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IZLjava/util/List;I)V
    .locals 1

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    const/4 p3, 0x0

    :cond_0
    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_1

    .line 2
    sget-object p4, LG7;->c:LG7;

    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lpb;-><init>(Ljava/lang/String;IZLjava/util/List;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lpb;
    .locals 1

    .line 1
    const-class v0, Lpb;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lpb;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lpb;
    .locals 1

    .line 1
    sget-object v0, Lpb;->l:[Lpb;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lpb;

    .line 8
    .line 9
    return-object v0
.end method
