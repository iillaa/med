.class public final LOe;
.super LKc;
.source "SourceFile"

# interfaces
.implements LJ9;


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Landroidx/activity/a;


# direct methods
.method public synthetic constructor <init>(Landroidx/activity/a;I)V
    .locals 0

    .line 1
    iput p2, p0, LOe;->d:I

    iput-object p1, p0, LOe;->e:Landroidx/activity/a;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LOe;->d:I

    .line 2
    .line 3
    check-cast p1, Lk3;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    const-string v0, "backEvent"

    .line 9
    .line 10
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, LOe;->e:Landroidx/activity/a;

    .line 14
    .line 15
    iget-object v0, p1, Landroidx/activity/a;->c:LNe;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object p1, p1, Landroidx/activity/a;->b:LZ2;

    .line 20
    .line 21
    invoke-virtual {p1}, LZ2;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    invoke-interface {p1}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    move-object v1, v0

    .line 40
    check-cast v1, LNe;

    .line 41
    .line 42
    iget-boolean v1, v1, LNe;->a:Z

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    :goto_0
    check-cast v0, LNe;

    .line 49
    .line 50
    :cond_2
    sget-object p1, Lfj;->a:Lfj;

    .line 51
    .line 52
    return-object p1

    .line 53
    :pswitch_0
    const-string v0, "backEvent"

    .line 54
    .line 55
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, LOe;->e:Landroidx/activity/a;

    .line 59
    .line 60
    iget-object v0, p1, Landroidx/activity/a;->b:LZ2;

    .line 61
    .line 62
    invoke-virtual {v0}, LZ2;->size()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_3
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    move-object v2, v1

    .line 81
    check-cast v2, LNe;

    .line 82
    .line 83
    iget-boolean v2, v2, LNe;->a:Z

    .line 84
    .line 85
    if-eqz v2, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    const/4 v1, 0x0

    .line 89
    :goto_1
    check-cast v1, LNe;

    .line 90
    .line 91
    iget-object v0, p1, Landroidx/activity/a;->c:LNe;

    .line 92
    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    invoke-virtual {p1}, Landroidx/activity/a;->b()V

    .line 96
    .line 97
    .line 98
    :cond_5
    iput-object v1, p1, Landroidx/activity/a;->c:LNe;

    .line 99
    .line 100
    sget-object p1, Lfj;->a:Lfj;

    .line 101
    .line 102
    return-object p1

    .line 103
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
