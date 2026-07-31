.class public final LR8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    iput p5, p0, LR8;->a:I

    iput-object p1, p0, LR8;->b:Ljava/lang/String;

    iput-object p2, p0, LR8;->c:Landroid/content/Context;

    iput-object p3, p0, LR8;->e:Ljava/lang/Object;

    iput p4, p0, LR8;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget v2, p0, LR8;->d:I

    .line 4
    .line 5
    iget-object v3, p0, LR8;->e:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v4, p0, LR8;->c:Landroid/content/Context;

    .line 8
    .line 9
    iget-object v5, p0, LR8;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget v6, p0, LR8;->a:I

    .line 12
    .line 13
    packed-switch v6, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    :try_start_0
    check-cast v3, Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v5, v4, v3, v2}, LU8;->b(Ljava/lang/String;Landroid/content/Context;Ljava/util/List;I)LT8;

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    new-instance v0, LT8;

    .line 24
    .line 25
    const/4 v1, -0x3

    .line 26
    invoke-direct {v0, v1}, LT8;-><init>(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    return-object v0

    .line 30
    :pswitch_0
    check-cast v3, LO8;

    .line 31
    .line 32
    new-array v6, v1, [Ljava/lang/Object;

    .line 33
    .line 34
    aput-object v3, v6, v0

    .line 35
    .line 36
    new-instance v3, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 39
    .line 40
    .line 41
    aget-object v0, v6, v0

    .line 42
    .line 43
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v5, v4, v0, v2}, LU8;->b(Ljava/lang/String;Landroid/content/Context;Ljava/util/List;I)LT8;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    return-object v0

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
