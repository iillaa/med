.class public final Laa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbh;


# instance fields
.field public final synthetic a:I

.field public final b:LJ9;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LI6;Le;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Laa;->a:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laa;->c:Ljava/lang/Object;

    iput-object p2, p0, Laa;->b:LJ9;

    return-void
.end method

.method public constructor <init>(Le;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Laa;->a:I

    sget-object v0, LD0;->e:LD0;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Laa;->c:Ljava/lang/Object;

    iput-object p1, p0, Laa;->b:LJ9;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .locals 1

    .line 1
    iget v0, p0, Laa;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, LPi;

    .line 7
    .line 8
    invoke-direct {v0, p0}, LPi;-><init>(Laa;)V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_0
    new-instance v0, LZ9;

    .line 13
    .line 14
    invoke-direct {v0, p0}, LZ9;-><init>(Laa;)V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    nop

    .line 19
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
