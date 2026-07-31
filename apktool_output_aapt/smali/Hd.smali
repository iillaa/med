.class public abstract LHd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lca;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const-string v0, "kotlinx.coroutines.fast.service.loader"

    .line 2
    .line 3
    sget v1, LVh;->a:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-object v0, v1

    .line 12
    :goto_0
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    :try_start_1
    new-instance v0, LR0;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    new-array v2, v2, [LR0;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput-object v0, v2, v3

    .line 27
    .line 28
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 36
    const-string v2, "<this>"

    .line 37
    .line 38
    invoke-static {v2, v0}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Leh;

    .line 42
    .line 43
    invoke-direct {v2, v0}, Leh;-><init>(Ljava/util/Iterator;)V

    .line 44
    .line 45
    .line 46
    instance-of v0, v2, Le5;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    new-instance v0, Le5;

    .line 52
    .line 53
    invoke-direct {v0, v2}, Le5;-><init>(Lbh;)V

    .line 54
    .line 55
    .line 56
    move-object v2, v0

    .line 57
    :goto_1
    invoke-static {v2}, Lch;->N(Lbh;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-nez v3, :cond_3

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    move-object v3, v1

    .line 84
    check-cast v3, LR0;

    .line 85
    .line 86
    invoke-virtual {v3}, LR0;->b()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    move-object v5, v4

    .line 95
    check-cast v5, LR0;

    .line 96
    .line 97
    invoke-virtual {v5}, LR0;->b()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-ge v3, v5, :cond_5

    .line 102
    .line 103
    move-object v1, v4

    .line 104
    move v3, v5

    .line 105
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-nez v4, :cond_4

    .line 110
    .line 111
    :goto_2
    check-cast v1, LR0;

    .line 112
    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    :try_start_2
    invoke-virtual {v1, v0}, LR0;->a(Ljava/util/List;)Lca;

    .line 116
    .line 117
    .line 118
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 119
    if-eqz v0, :cond_6

    .line 120
    .line 121
    sput-object v0, LHd;->a:Lca;

    .line 122
    .line 123
    return-void

    .line 124
    :catchall_0
    move-exception v0

    .line 125
    invoke-virtual {v1}, LR0;->c()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    throw v0

    .line 129
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 130
    .line 131
    const-string v1, "Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. \'kotlinx-coroutines-android\' and ensure it has the same version as \'kotlinx-coroutines-core\'"

    .line 132
    .line 133
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    throw v0

    .line 137
    :catchall_1
    move-exception v0

    .line 138
    new-instance v1, Ljava/util/ServiceConfigurationError;

    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-direct {v1, v2, v0}, Ljava/util/ServiceConfigurationError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    throw v1
.end method
