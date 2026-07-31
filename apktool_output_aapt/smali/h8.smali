.class public final Lh8;
.super LKc;
.source "SourceFile"

# interfaces
.implements Ly9;


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lh8;->d:I

    iput-object p2, p0, Lh8;->e:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lh8;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lh8;->e:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LTj;

    .line 9
    .line 10
    invoke-static {v0}, LSi;->w(LTj;)LDg;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0

    .line 15
    :pswitch_0
    new-instance v0, LHa;

    .line 16
    .line 17
    iget-object v1, p0, Lh8;->e:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/capacitorjs/plugins/filesystem/FilesystemPlugin;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "getApplicationContext(...)"

    .line 30
    .line 31
    invoke-static {v2, v1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v0, v1}, LHa;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
