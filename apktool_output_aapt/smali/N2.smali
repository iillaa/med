.class public final LN2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfc;


# static fields
.field public static volatile d:LN2;

.field public static final e:Ljava/lang/Object;

.field public static f:LN2;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LN2;->e:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(LN6;Lt5;Lj7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, LN2;->a:Ljava/lang/Object;

    iput-object p1, p0, LN2;->b:Ljava/lang/Object;

    iput-object p3, p0, LN2;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LSj;LRj;)V
    .locals 1

    const-string v0, "store"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    sget-object v0, Lm6;->b:Lm6;

    invoke-direct {p0, p1, p2, v0}, LN2;-><init>(LSj;LRj;Ln6;)V

    return-void
.end method

.method public constructor <init>(LSj;LRj;Ln6;)V
    .locals 1

    .line 3
    const-string v0, "store"

    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "defaultCreationExtras"

    invoke-static {v0, p3}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN2;->a:Ljava/lang/Object;

    iput-object p2, p0, LN2;->b:Ljava/lang/Object;

    iput-object p3, p0, LN2;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, LN2;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, LN2;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, LN2;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN2;->c:Ljava/lang/Object;

    iput-object p2, p0, LN2;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/location/LocationManager;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, LRi;

    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-object v0, p0, LN2;->b:Ljava/lang/Object;

    iput-object p1, p0, LN2;->c:Ljava/lang/Object;

    iput-object p2, p0, LN2;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 8
    iput-object p1, p0, LN2;->a:Ljava/lang/Object;

    iput-object p2, p0, LN2;->b:Ljava/lang/Object;

    iput-object p3, p0, LN2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static e(Landroid/text/Editable;Landroid/view/KeyEvent;Z)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p1}, Landroid/view/KeyEvent;->metaStateHasNoModifiers(I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    xor-int/2addr p1, v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, -0x1

    .line 24
    if-eq p1, v3, :cond_6

    .line 25
    .line 26
    if-eq v2, v3, :cond_6

    .line 27
    .line 28
    if-eq p1, v2, :cond_1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const-class v3, LZi;

    .line 32
    .line 33
    invoke-interface {p0, p1, v2, v3}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, [LZi;

    .line 38
    .line 39
    if-eqz v2, :cond_6

    .line 40
    .line 41
    array-length v3, v2

    .line 42
    if-lez v3, :cond_6

    .line 43
    .line 44
    array-length v3, v2

    .line 45
    move v4, v1

    .line 46
    :goto_0
    if-ge v4, v3, :cond_6

    .line 47
    .line 48
    aget-object v5, v2, v4

    .line 49
    .line 50
    invoke-interface {p0, v5}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    invoke-interface {p0, v5}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz p2, :cond_2

    .line 59
    .line 60
    if-eq v6, p1, :cond_4

    .line 61
    .line 62
    :cond_2
    if-nez p2, :cond_3

    .line 63
    .line 64
    if-eq v5, p1, :cond_4

    .line 65
    .line 66
    :cond_3
    if-le p1, v6, :cond_5

    .line 67
    .line 68
    if-ge p1, v5, :cond_5

    .line 69
    .line 70
    :cond_4
    invoke-interface {p0, v6, v5}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 71
    .line 72
    .line 73
    return v0

    .line 74
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_6
    :goto_1
    return v1
.end method

.method public static m(Landroid/content/Context;)LN2;
    .locals 2

    .line 1
    sget-object v0, LN2;->d:LN2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, LN2;->e:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, LN2;->d:LN2;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, LN2;

    .line 13
    .line 14
    invoke-direct {v1, p0}, LN2;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, LN2;->d:LN2;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, LN2;->d:LN2;

    .line 27
    .line 28
    return-object p0
.end method

.method public static o(Landroid/content/Context;Landroid/util/AttributeSet;[III)LN2;
    .locals 1

    .line 1
    new-instance v0, LN2;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p0, p1}, LN2;-><init>(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()Landroid/net/Uri;
    .locals 1

    .line 1
    iget-object v0, p0, LN2;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/net/Uri;

    .line 4
    .line 5
    return-object v0
.end method

.method public c()Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public d()Landroid/net/Uri;
    .locals 1

    .line 1
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/net/Uri;

    .line 4
    .line 5
    return-object v0
.end method

.method public f(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    iget-object v0, p0, LN2;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/Context;

    .line 4
    .line 5
    const v1, 0x7f0d001b

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v3
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    iget-object v4, p0, LN2;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v4, Ljava/util/HashSet;

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    invoke-virtual {p1, v3, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_0

    .line 53
    .line 54
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const-class v5, LZb;

    .line 59
    .line 60
    invoke-virtual {v5, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_0

    .line 65
    .line 66
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto :goto_2

    .line 72
    :cond_1
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Class;

    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, LN2;->g(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :goto_2
    new-instance v0, LJ4;

    .line 93
    .line 94
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    throw v0

    .line 98
    :cond_2
    return-void
.end method

.method public g(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;
    .locals 5

    .line 1
    const-string v0, "Cannot initialize "

    .line 2
    .line 3
    invoke-static {}, Lu6;->r()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Lu6;->e(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto/16 :goto_4

    .line 19
    .line 20
    :cond_0
    :goto_0
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    if-nez v1, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ljava/util/HashMap;

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_3

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    :try_start_2
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, LZb;

    .line 49
    .line 50
    invoke-interface {v1}, LZb;->a()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_2

    .line 69
    .line 70
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Ljava/lang/Class;

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-nez v4, :cond_1

    .line 81
    .line 82
    invoke-virtual {p0, v3, p2}, LN2;->g(Ljava/lang/Class;Ljava/util/HashSet;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catchall_1
    move-exception p1

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    iget-object v2, p0, LN2;->c:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v2, Landroid/content/Context;

    .line 91
    .line 92
    invoke-interface {v1, v2}, LZb;->b(Landroid/content/Context;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :goto_2
    :try_start_3
    new-instance p2, LJ4;

    .line 104
    .line 105
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    throw p2

    .line 109
    :cond_3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 113
    :goto_3
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 114
    .line 115
    .line 116
    return-object v1

    .line 117
    :cond_4
    :try_start_4
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance p2, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p1, ". Cycle detected."

    .line 130
    .line 131
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 139
    .line 140
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 144
    :goto_4
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 145
    .line 146
    .line 147
    throw p1
.end method

.method public getDescription()Landroid/content/ClipDescription;
    .locals 1

    .line 1
    iget-object v0, p0, LN2;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/ClipDescription;

    .line 4
    .line 5
    return-object v0
.end method

.method public h(Ljava/lang/String;Ljava/lang/Class;)LOj;
    .locals 5

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LSj;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iget-object v0, v0, LSj;->a:Ljava/util/LinkedHashMap;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, LOj;

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, LN2;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v3, LRj;

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    instance-of p1, v3, LJg;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    check-cast v3, LJg;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v3, 0x0

    .line 39
    :goto_0
    if-eqz v3, :cond_1

    .line 40
    .line 41
    invoke-static {v1}, Llc;->e(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, v3, LJg;->d:LTc;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p2, v3, LJg;->e:LGg;

    .line 49
    .line 50
    invoke-static {p2}, Llc;->e(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, p2, p1}, LSi;->a(LOj;LGg;LTc;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    const-string p1, "null cannot be cast to non-null type T of androidx.lifecycle.ViewModelProvider.get"

    .line 57
    .line 58
    invoke-static {p1, v1}, Llc;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-object v1

    .line 62
    :cond_2
    new-instance v1, Lte;

    .line 63
    .line 64
    iget-object v2, p0, LN2;->c:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v2, Ln6;

    .line 67
    .line 68
    invoke-direct {v1, v2}, Lte;-><init>(Ln6;)V

    .line 69
    .line 70
    .line 71
    sget-object v2, Lt5;->k:Lt5;

    .line 72
    .line 73
    iget-object v4, v1, Ln6;->a:Ljava/util/LinkedHashMap;

    .line 74
    .line 75
    invoke-interface {v4, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    :try_start_0
    invoke-interface {v3, p2, v1}, LRj;->a(Ljava/lang/Class;Lte;)LOj;

    .line 79
    .line 80
    .line 81
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    goto :goto_1

    .line 83
    :catch_0
    invoke-interface {v3, p2}, LRj;->b(Ljava/lang/Class;)LOj;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    :goto_1
    const-string v1, "viewModel"

    .line 88
    .line 89
    invoke-static {v1, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, LOj;

    .line 97
    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    invoke-virtual {p1}, LOj;->b()V

    .line 101
    .line 102
    .line 103
    :cond_3
    return-object p2
.end method

.method public i(I)Landroid/content/res/ColorStateList;
    .locals 3

    .line 1
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, LN2;->c:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v2, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v2, v1}, LMk;->p(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    return-object p1
.end method

.method public j(I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, LN2;->c:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {p1, v1}, LMk;->q(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    return-object p1

    .line 27
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    return-object p1
.end method

.method public k(I)Landroid/graphics/drawable/Drawable;
    .locals 4

    .line 1
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Landroid/content/res/TypedArray;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {}, LP1;->a()LP1;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, LN2;->c:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Landroid/content/Context;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    iget-object v2, v0, LP1;->a:Lig;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {v2, v1, p1, v3}, Lig;->g(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    monitor-exit v0

    .line 39
    return-object p1

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    monitor-exit v0

    .line 42
    throw p1

    .line 43
    :cond_0
    const/4 p1, 0x0

    .line 44
    return-object p1
.end method

.method public l(IILs2;)Landroid/graphics/Typeface;
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p2

    .line 4
    .line 5
    move-object/from16 v10, p3

    .line 6
    .line 7
    const/4 v8, 0x7

    .line 8
    iget-object v2, v1, LN2;->a:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Landroid/content/res/TypedArray;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move/from16 v4, p1

    .line 14
    .line 15
    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 16
    .line 17
    .line 18
    move-result v9

    .line 19
    const/4 v11, 0x0

    .line 20
    if-nez v9, :cond_0

    .line 21
    .line 22
    return-object v11

    .line 23
    :cond_0
    iget-object v2, v1, LN2;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Landroid/util/TypedValue;

    .line 26
    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    new-instance v2, Landroid/util/TypedValue;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, v1, LN2;->b:Ljava/lang/Object;

    .line 35
    .line 36
    :cond_1
    iget-object v2, v1, LN2;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v2, Landroid/util/TypedValue;

    .line 39
    .line 40
    sget-object v3, Llg;->a:Ljava/lang/ThreadLocal;

    .line 41
    .line 42
    iget-object v3, v1, LN2;->c:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v3, Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/content/Context;->isRestricted()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    goto/16 :goto_5

    .line 53
    .line 54
    :cond_2
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v12

    .line 58
    const/4 v4, 0x1

    .line 59
    invoke-virtual {v12, v9, v2, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 60
    .line 61
    .line 62
    const-string v13, "ResourcesCompat"

    .line 63
    .line 64
    iget-object v4, v2, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    .line 65
    .line 66
    if-eqz v4, :cond_9

    .line 67
    .line 68
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v14

    .line 72
    const-string v4, "res/"

    .line 73
    .line 74
    invoke-virtual {v14, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-nez v4, :cond_3

    .line 79
    .line 80
    invoke-virtual/range {p3 .. p3}, Ls2;->a()V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_5

    .line 84
    .line 85
    :cond_3
    iget v4, v2, Landroid/util/TypedValue;->assetCookie:I

    .line 86
    .line 87
    sget-object v15, LTi;->b:LGd;

    .line 88
    .line 89
    invoke-static {v12, v9, v14, v4, v0}, LTi;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v15, v4}, LGd;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Landroid/graphics/Typeface;

    .line 98
    .line 99
    if-eqz v4, :cond_4

    .line 100
    .line 101
    new-instance v0, Landroid/os/Handler;

    .line 102
    .line 103
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 108
    .line 109
    .line 110
    new-instance v2, LQ2;

    .line 111
    .line 112
    invoke-direct {v2, v10, v8, v4}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 116
    .line 117
    .line 118
    move-object v11, v4

    .line 119
    goto/16 :goto_5

    .line 120
    .line 121
    :cond_4
    :try_start_0
    invoke-virtual {v14}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    const-string v5, ".xml"

    .line 126
    .line 127
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-eqz v4, :cond_6

    .line 132
    .line 133
    invoke-virtual {v12, v9}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    invoke-static {v4, v12}, Llc;->A(Landroid/content/res/XmlResourceParser;Landroid/content/res/Resources;)LV8;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    if-nez v4, :cond_5

    .line 142
    .line 143
    const-string v0, "Failed to find font-family tag"

    .line 144
    .line 145
    invoke-static {v13, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    invoke-virtual/range {p3 .. p3}, Ls2;->a()V

    .line 149
    .line 150
    .line 151
    goto :goto_5

    .line 152
    :catch_0
    move-exception v0

    .line 153
    goto :goto_1

    .line 154
    :catch_1
    move-exception v0

    .line 155
    goto :goto_3

    .line 156
    :cond_5
    iget v7, v2, Landroid/util/TypedValue;->assetCookie:I

    .line 157
    .line 158
    move-object v2, v3

    .line 159
    move-object v3, v4

    .line 160
    move-object v4, v12

    .line 161
    move v5, v9

    .line 162
    move-object v6, v14

    .line 163
    move/from16 v8, p2

    .line 164
    .line 165
    move-object/from16 v9, p3

    .line 166
    .line 167
    invoke-static/range {v2 .. v9}, LTi;->a(Landroid/content/Context;LV8;Landroid/content/res/Resources;ILjava/lang/String;IILs2;)Landroid/graphics/Typeface;

    .line 168
    .line 169
    .line 170
    move-result-object v11

    .line 171
    goto :goto_5

    .line 172
    :cond_6
    iget v7, v2, Landroid/util/TypedValue;->assetCookie:I

    .line 173
    .line 174
    sget-object v2, LTi;->a:LSi;

    .line 175
    .line 176
    move-object v4, v12

    .line 177
    move v5, v9

    .line 178
    move-object v6, v14

    .line 179
    move v11, v7

    .line 180
    move/from16 v7, p2

    .line 181
    .line 182
    invoke-virtual/range {v2 .. v7}, LSi;->j(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    if-eqz v2, :cond_7

    .line 187
    .line 188
    invoke-static {v12, v9, v14, v11, v0}, LTi;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v15, v0, v2}, LGd;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    :cond_7
    if-eqz v2, :cond_8

    .line 196
    .line 197
    new-instance v0, Landroid/os/Handler;

    .line 198
    .line 199
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-direct {v0, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 204
    .line 205
    .line 206
    new-instance v3, LQ2;

    .line 207
    .line 208
    invoke-direct {v3, v10, v8, v2}, LQ2;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 212
    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_8
    invoke-virtual/range {p3 .. p3}, Ls2;->a()V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    .line 217
    .line 218
    :goto_0
    move-object v11, v2

    .line 219
    goto :goto_5

    .line 220
    :goto_1
    const-string v2, "Failed to read xml resource "

    .line 221
    .line 222
    :goto_2
    invoke-virtual {v2, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-static {v13, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 227
    .line 228
    .line 229
    goto :goto_4

    .line 230
    :goto_3
    const-string v2, "Failed to parse xml resource "

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :goto_4
    invoke-virtual/range {p3 .. p3}, Ls2;->a()V

    .line 234
    .line 235
    .line 236
    const/4 v11, 0x0

    .line 237
    :goto_5
    return-object v11

    .line 238
    :cond_9
    new-instance v0, Landroid/content/res/Resources$NotFoundException;

    .line 239
    .line 240
    new-instance v3, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    const-string v4, "Resource \""

    .line 243
    .line 244
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v12, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    const-string v4, "\" ("

    .line 255
    .line 256
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v4, ") is not a Font: "

    .line 267
    .line 268
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    invoke-direct {v0, v2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    throw v0
.end method

.method public n(Ljava/lang/CharSequence;IILv7;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iget v1, p4, Lv7;->c:I

    .line 3
    .line 4
    const/4 v2, 0x2

    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez v1, :cond_4

    .line 7
    .line 8
    iget-object v1, p0, LN2;->c:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Lj7;

    .line 11
    .line 12
    invoke-virtual {p4}, Lv7;->c()Loe;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    const/16 v5, 0x8

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Lbi;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-eqz v5, :cond_0

    .line 23
    .line 24
    iget-object v6, v4, Lbi;->d:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v6, Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    iget v4, v4, Lbi;->a:I

    .line 29
    .line 30
    add-int/2addr v5, v4

    .line 31
    invoke-virtual {v6, v5}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 32
    .line 33
    .line 34
    :cond_0
    check-cast v1, LA6;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    sget-object v4, LA6;->b:Ljava/lang/ThreadLocal;

    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    if-nez v5, :cond_1

    .line 46
    .line 47
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 62
    .line 63
    .line 64
    :goto_0
    if-ge p2, p3, :cond_2

    .line 65
    .line 66
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    add-int/2addr p2, v0

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-object p1, v1, LA6;->a:Landroid/text/TextPaint;

    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    sget p3, Lff;->a:I

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->hasGlyph(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    move p1, v2

    .line 90
    goto :goto_1

    .line 91
    :cond_3
    move p1, v0

    .line 92
    :goto_1
    iput p1, p4, Lv7;->c:I

    .line 93
    .line 94
    :cond_4
    iget p1, p4, Lv7;->c:I

    .line 95
    .line 96
    if-ne p1, v2, :cond_5

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_5
    move v0, v3

    .line 100
    :goto_2
    return v0
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, LN2;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/res/TypedArray;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
