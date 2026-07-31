.class public final LC4;
.super LKc;
.source "SourceFile"

# interfaces
.implements LN9;


# static fields
.field public static final e:LC4;

.field public static final f:LC4;

.field public static final g:LC4;


# instance fields
.field public final synthetic d:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LC4;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2}, LC4;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LC4;->e:LC4;

    .line 9
    .line 10
    new-instance v0, LC4;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-direct {v0, v1, v2}, LC4;-><init>(II)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LC4;->f:LC4;

    .line 18
    .line 19
    new-instance v0, LC4;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-direct {v0, v1, v2}, LC4;-><init>(II)V

    .line 24
    .line 25
    .line 26
    sput-object v0, LC4;->g:LC4;

    .line 27
    .line 28
    return-void
.end method

.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    iput p2, p0, LC4;->d:I

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LC4;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/io/File;

    .line 7
    .line 8
    check-cast p2, Ljava/io/IOException;

    .line 9
    .line 10
    const-string v0, "<anonymous parameter 0>"

    .line 11
    .line 12
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "exception"

    .line 16
    .line 17
    invoke-static {p1, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    throw p2

    .line 21
    :pswitch_0
    check-cast p1, LY5;

    .line 22
    .line 23
    check-cast p2, LW5;

    .line 24
    .line 25
    const-string v0, "acc"

    .line 26
    .line 27
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "element"

    .line 31
    .line 32
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {p2}, LW5;->getKey()LX5;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {p1, v0}, LY5;->i(LX5;)LY5;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v0, LE7;->c:LE7;

    .line 44
    .line 45
    if-ne p1, v0, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    sget-object v1, Lt5;->d:Lt5;

    .line 49
    .line 50
    invoke-interface {p1, v1}, LY5;->c(LX5;)LW5;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lu5;

    .line 55
    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    new-instance v0, LD4;

    .line 59
    .line 60
    invoke-direct {v0, p1, p2}, LD4;-><init>(LY5;LW5;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    move-object p2, v0

    .line 64
    goto :goto_1

    .line 65
    :cond_1
    invoke-interface {p1, v1}, LY5;->i(LX5;)LY5;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    if-ne p1, v0, :cond_2

    .line 70
    .line 71
    new-instance p1, LD4;

    .line 72
    .line 73
    invoke-direct {p1, p2, v2}, LD4;-><init>(LY5;LW5;)V

    .line 74
    .line 75
    .line 76
    move-object p2, p1

    .line 77
    goto :goto_1

    .line 78
    :cond_2
    new-instance v0, LD4;

    .line 79
    .line 80
    new-instance v1, LD4;

    .line 81
    .line 82
    invoke-direct {v1, p1, p2}, LD4;-><init>(LY5;LW5;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {v0, v1, v2}, LD4;-><init>(LY5;LW5;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :goto_1
    return-object p2

    .line 90
    :pswitch_1
    check-cast p1, Ljava/lang/String;

    .line 91
    .line 92
    check-cast p2, LW5;

    .line 93
    .line 94
    const-string v0, "acc"

    .line 95
    .line 96
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    const-string v0, "element"

    .line 100
    .line 101
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    goto :goto_2

    .line 115
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p1, ", "

    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    :goto_2
    return-object p1

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
