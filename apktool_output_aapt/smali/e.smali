.class public final Le;
.super LKc;
.source "SourceFile"

# interfaces
.implements LJ9;


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Le;->d:I

    sget-object v0, LD0;->e:LD0;

    .line 1
    iput-object v0, p0, Le;->e:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, LKc;-><init>(I)V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 2
    iput p1, p0, Le;->d:I

    iput-object p2, p0, Le;->e:Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Le;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljc;

    .line 7
    .line 8
    const-string v0, "it"

    .line 9
    .line 10
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "<this>"

    .line 14
    .line 15
    iget-object v1, p0, Le;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget v0, p1, Lhc;->d:I

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    iget p1, p1, Lhc;->c:I

    .line 27
    .line 28
    invoke-interface {v1, p1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    return-object p1

    .line 37
    :pswitch_0
    const-string v0, "it"

    .line 38
    .line 39
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Le;->e:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p1, Ly9;

    .line 45
    .line 46
    invoke-interface {p1}, Ly9;->a()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    return-object p1

    .line 51
    :pswitch_1
    iget-object v0, p0, Le;->e:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ll;

    .line 54
    .line 55
    if-ne p1, v0, :cond_0

    .line 56
    .line 57
    const-string p1, "(this Collection)"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    :goto_0
    return-object p1

    .line 65
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
