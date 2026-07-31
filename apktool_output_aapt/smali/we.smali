.class public final Lwe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lrf;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lwe;->a:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lwe;->b:Lrf;

    return-void
.end method

.method public constructor <init>(Lrf;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    iput-object p2, p0, Lwe;->a:Ljava/lang/String;

    iput-object p1, p0, Lwe;->b:Lrf;

    return-void

    :cond_0
    const/4 p1, 0x0

    throw p1
.end method

.method public static c(Lrf;)I
    .locals 5

    .line 1
    iget v0, p0, Lrf;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    :pswitch_0
    invoke-virtual {p0}, Lrf;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :pswitch_1
    const/4 v0, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    iget-object v3, p0, Lrf;->f:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v0, v3, :cond_0

    .line 25
    .line 26
    iget-object v3, p0, Lrf;->f:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lrf;

    .line 33
    .line 34
    invoke-static {v3}, Lwe;->c(Lrf;)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    add-int/2addr v4, v1

    .line 47
    add-int/2addr v4, v3

    .line 48
    add-int/2addr v2, v4

    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return v2

    .line 53
    :pswitch_2
    invoke-virtual {p0}, Lrf;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    add-int/2addr p0, v1

    .line 62
    return p0

    .line 63
    :pswitch_3
    invoke-virtual {p0}, Lrf;->a()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    add-int/2addr p0, v1

    .line 72
    return p0

    .line 73
    :pswitch_4
    return v1

    .line 74
    :pswitch_5
    invoke-virtual {p0}, Lrf;->a()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    add-int/2addr p0, v1

    .line 83
    return p0

    .line 84
    :pswitch_6
    iget-object p0, p0, Lrf;->d:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/2addr p0, v1

    .line 91
    return p0

    .line 92
    nop

    .line 93
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static e(Ljava/lang/StringBuilder;Lrf;)V
    .locals 3

    .line 1
    iget v0, p1, Lrf;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    :goto_0
    :pswitch_0
    invoke-virtual {p1}, Lrf;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    goto :goto_5

    .line 15
    :pswitch_1
    const/16 v0, 0x4d

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :goto_2
    iget-object v0, p1, Lrf;->f:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-ge v1, v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lrf;->f:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lrf;

    .line 35
    .line 36
    invoke-static {v0}, Lwe;->c(Lrf;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const/16 v2, 0x20

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v0}, Lwe;->e(Ljava/lang/StringBuilder;Lrf;)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :pswitch_2
    const/16 v0, 0x53

    .line 59
    .line 60
    :goto_3
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :pswitch_3
    const/16 v0, 0x41

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :pswitch_4
    const/16 p1, 0x4e

    .line 68
    .line 69
    :goto_4
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    goto :goto_5

    .line 73
    :pswitch_5
    invoke-virtual {p1}, Lrf;->a()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    goto :goto_4

    .line 82
    :pswitch_6
    const/16 v0, 0x6e

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :pswitch_7
    const/16 v0, 0x73

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object p1, p1, Lrf;->d:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_0
    :goto_5
    return-void

    .line 94
    nop

    .line 95
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public final a(Ljava/lang/StringBuilder;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lwe;->b:Lrf;

    .line 2
    .line 3
    iget v1, v0, Lrf;->b:I

    .line 4
    .line 5
    const/4 v2, 0x5

    .line 6
    if-eq v1, v2, :cond_4

    .line 7
    .line 8
    const/4 v2, 0x6

    .line 9
    const-string v3, "\')"

    .line 10
    .line 11
    if-eq v1, v2, :cond_3

    .line 12
    .line 13
    const/4 v2, 0x7

    .line 14
    if-eq v1, v2, :cond_2

    .line 15
    .line 16
    const/16 v2, 0x8

    .line 17
    .line 18
    if-eq v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lrf;->a()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    goto :goto_3

    .line 28
    :cond_0
    iget-object v1, v0, Lrf;->f:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x0

    .line 35
    :goto_1
    if-ge v2, v1, :cond_5

    .line 36
    .line 37
    iget-object v3, v0, Lrf;->f:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lrf;

    .line 44
    .line 45
    new-instance v4, Lwe;

    .line 46
    .line 47
    iget-object v5, p0, Lwe;->a:Ljava/lang/String;

    .line 48
    .line 49
    invoke-direct {v4, v3, v5}, Lwe;-><init>(Lrf;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, p1}, Lwe;->a(Ljava/lang/StringBuilder;)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v3, v1, -0x1

    .line 56
    .line 57
    if-ge v2, v3, :cond_1

    .line 58
    .line 59
    const-string v3, ","

    .line 60
    .line 61
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    const-string v1, "atob(\'"

    .line 68
    .line 69
    :goto_2
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lrf;->a()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_3
    const-string v1, "cordova.require(\'cordova/base64\').toArrayBuffer(\'"

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    const-string v0, "null"

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_5
    :goto_3
    return-void
.end method

.method public final b()I
    .locals 3

    .line 1
    iget-object v0, p0, Lwe;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lwe;->b:Lrf;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget v2, v1, Lrf;->a:I

    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    add-int/lit8 v2, v2, 0x3

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    add-int/2addr v0, v2

    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    invoke-static {v1}, Lwe;->c(Lrf;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v1, v0

    .line 38
    return v1
.end method

.method public final d(Ljava/lang/StringBuilder;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lwe;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lwe;->b:Lrf;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget v2, v1, Lrf;->a:I

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq v2, v3, :cond_2

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v3, 0x0

    .line 20
    :cond_2
    :goto_0
    const-string v4, "cordova.callbackFromNative(\'"

    .line 21
    .line 22
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, "\',"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ","

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, ",["

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lwe;->a(Ljava/lang/StringBuilder;)V

    .line 50
    .line 51
    .line 52
    const-string v0, "],"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-boolean v0, v1, Lrf;->c:Z

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v0, ");"

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    :goto_1
    return-void
.end method
