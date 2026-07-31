.class public final LN6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln0;


# instance fields
.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, LM0;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, LM0;-><init>(I)V

    iput-object p1, p0, LN6;->d:Ljava/lang/Object;

    new-instance p1, Lhh;

    invoke-direct {p1}, Lhh;-><init>()V

    iput-object p1, p0, LN6;->e:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LN6;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, LN6;->f:Ljava/lang/Object;

    return-void

    .line 2
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LN6;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, LN6;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, LN6;->e:Ljava/lang/Object;

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, LN6;->d:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, LN6;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, LN6;->c:Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    iput-object p1, p0, LN6;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN6;->f:Ljava/lang/Object;

    iput-object p2, p0, LN6;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LN6;->c:Ljava/lang/Object;

    new-instance p1, Lhh;

    invoke-direct {p1}, Lhh;-><init>()V

    iput-object p1, p0, LN6;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Typeface;Lpe;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN6;->f:Ljava/lang/Object;

    iput-object p2, p0, LN6;->d:Ljava/lang/Object;

    new-instance p1, Lqe;

    const/16 v0, 0x400

    invoke-direct {p1, v0}, Lqe;-><init>(I)V

    iput-object p1, p0, LN6;->c:Ljava/lang/Object;

    const/4 p1, 0x6

    .line 5
    invoke-virtual {p2, p1}, Lbi;->a(I)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 6
    iget v2, p2, Lbi;->a:I

    add-int/2addr v0, v2

    iget-object v2, p2, Lbi;->d:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    add-int/2addr v2, v0

    iget-object v0, p2, Lbi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x2

    .line 7
    new-array v0, v0, [C

    iput-object v0, p0, LN6;->e:Ljava/lang/Object;

    .line 8
    invoke-virtual {p2, p1}, Lbi;->a(I)I

    move-result p1

    if-eqz p1, :cond_1

    .line 9
    iget v0, p2, Lbi;->a:I

    add-int/2addr p1, v0

    iget-object v0, p2, Lbi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    add-int/2addr v0, p1

    iget-object p1, p2, Lbi;->d:Ljava/lang/Object;

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    goto :goto_1

    :cond_1
    move p1, v1

    :goto_1
    move p2, v1

    :goto_2
    if-ge p2, p1, :cond_5

    .line 10
    new-instance v0, Lv7;

    invoke-direct {v0, p0, p2}, Lv7;-><init>(LN6;I)V

    .line 11
    invoke-virtual {v0}, Lv7;->c()Loe;

    move-result-object v2

    const/4 v3, 0x4

    .line 12
    invoke-virtual {v2, v3}, Lbi;->a(I)I

    move-result v3

    if-eqz v3, :cond_2

    iget-object v4, v2, Lbi;->d:Ljava/lang/Object;

    check-cast v4, Ljava/nio/ByteBuffer;

    iget v2, v2, Lbi;->a:I

    add-int/2addr v3, v2

    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    goto :goto_3

    :cond_2
    move v2, v1

    :goto_3
    mul-int/lit8 v3, p2, 0x2

    .line 13
    iget-object v4, p0, LN6;->e:Ljava/lang/Object;

    check-cast v4, [C

    invoke-static {v2, v4, v3}, Ljava/lang/Character;->toChars(I[CI)I

    .line 14
    invoke-virtual {v0}, Lv7;->b()I

    move-result v2

    const/4 v3, 0x1

    if-lez v2, :cond_3

    move v2, v3

    goto :goto_4

    :cond_3
    move v2, v1

    :goto_4
    if-eqz v2, :cond_4

    invoke-virtual {v0}, Lv7;->b()I

    move-result v2

    sub-int/2addr v2, v3

    iget-object v3, p0, LN6;->c:Ljava/lang/Object;

    check-cast v3, Lqe;

    invoke-virtual {v3, v0, v1, v2}, Lqe;->a(Lv7;II)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 15
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "invalid metadata codepoint length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    return-void
.end method


# virtual methods
.method public a(Lo0;Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, LN6;->g(Lo0;)LNh;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, LXd;

    .line 6
    .line 7
    iget-object v1, p0, LN6;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Landroid/content/Context;

    .line 10
    .line 11
    check-cast p2, LRh;

    .line 12
    .line 13
    invoke-direct {v0, v1, p2}, LXd;-><init>(Landroid/content/Context;LRh;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, LN6;->d:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p2, Landroid/view/ActionMode$Callback;

    .line 19
    .line 20
    invoke-interface {p2, p1, v0}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    return p1
.end method

.method public b(Lo0;LMd;)Z
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, LN6;->g(Lo0;)LNh;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, LN6;->e:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lhh;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/view/Menu;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lme;

    .line 18
    .line 19
    iget-object v2, p0, LN6;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Landroid/content/Context;

    .line 22
    .line 23
    invoke-direct {v1, v2, p2}, Lme;-><init>(Landroid/content/Context;LMd;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p2, v1}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p2, p0, LN6;->d:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p2, Landroid/view/ActionMode$Callback;

    .line 32
    .line 33
    invoke-interface {p2, p1, v1}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    return p1
.end method

.method public c(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .locals 4

    .line 1
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, LN6;->e:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lhh;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    if-ge v2, v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {p0, v3, p2, p3}, LN6;->c(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    .line 54
    .line 55
    const-string p2, "This graph contains cyclic dependencies"

    .line 56
    .line 57
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public d(Lo0;Landroid/view/Menu;)Z
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, LN6;->g(Lo0;)LNh;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, LN6;->e:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lhh;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Lhh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/view/Menu;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Lme;

    .line 18
    .line 19
    iget-object v2, p0, LN6;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Landroid/content/Context;

    .line 22
    .line 23
    move-object v3, p2

    .line 24
    check-cast v3, LMd;

    .line 25
    .line 26
    invoke-direct {v1, v2, v3}, Lme;-><init>(Landroid/content/Context;LMd;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2, v1}, Lhh;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p2, p0, LN6;->d:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p2, Landroid/view/ActionMode$Callback;

    .line 35
    .line 36
    invoke-interface {p2, p1, v1}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    return p1
.end method

.method public e(Lo0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, LN6;->g(Lo0;)LNh;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, LN6;->d:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroid/view/ActionMode$Callback;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, LN6;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Loh;->c(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public g(Lo0;)LNh;
    .locals 5

    .line 1
    iget-object v0, p0, LN6;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, LNh;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    iget-object v4, v3, LNh;->b:Lo0;

    .line 21
    .line 22
    if-ne v4, p1, :cond_0

    .line 23
    .line 24
    return-object v3

    .line 25
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v1, LNh;

    .line 29
    .line 30
    iget-object v2, p0, LN6;->f:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Landroid/content/Context;

    .line 33
    .line 34
    invoke-direct {v1, v2, p1}, LNh;-><init>(Landroid/content/Context;Lo0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object v1
.end method

.method public h()Ljava/util/ArrayList;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LN6;->d:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Loh;->c(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-object v0
.end method

.method public i(Lpb;)Ljava/io/File;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, LQb;->a:[I

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    aget p1, v0, p1

    .line 12
    .line 13
    :goto_0
    packed-switch p1, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    :pswitch_0
    new-instance p1, LJ4;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 19
    .line 20
    .line 21
    throw p1

    .line 22
    :pswitch_1
    sget-object p1, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_2

    .line 29
    :pswitch_2
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_2

    .line 34
    :pswitch_3
    iget-object p1, p0, LN6;->f:Ljava/lang/Object;

    .line 35
    .line 36
    :goto_1
    check-cast p1, Ljava/io/File;

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :pswitch_4
    iget-object p1, p0, LN6;->c:Ljava/lang/Object;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :pswitch_5
    iget-object p1, p0, LN6;->e:Ljava/lang/Object;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :pswitch_6
    iget-object p1, p0, LN6;->d:Ljava/lang/Object;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :pswitch_7
    const/4 p1, 0x0

    .line 49
    :goto_2
    return-object p1

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch -0x1
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

.method public j()Ljava/util/List;
    .locals 3

    .line 1
    iget-object v0, p0, LN6;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0

    .line 16
    :cond_0
    iget-object v0, p0, LN6;->c:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    iget-object v2, p0, LN6;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 28
    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-object v1

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v1
.end method

.method public k(LPb;Lr5;)Ljava/lang/Object;
    .locals 13

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v2, "/synthetic/"

    .line 3
    .line 4
    instance-of v1, p2, LSb;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    move-object v1, p2

    .line 9
    check-cast v1, LSb;

    .line 10
    .line 11
    iget v3, v1, LSb;->h:I

    .line 12
    .line 13
    const/high16 v4, -0x80000000

    .line 14
    .line 15
    and-int v5, v3, v4

    .line 16
    .line 17
    if-eqz v5, :cond_0

    .line 18
    .line 19
    sub-int/2addr v3, v4

    .line 20
    iput v3, v1, LSb;->h:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance v1, LSb;

    .line 24
    .line 25
    invoke-direct {v1, p0, p2}, LSb;-><init>(LN6;Lr5;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object p2, v1, LSb;->f:Ljava/lang/Object;

    .line 29
    .line 30
    sget-object v3, Li6;->c:Li6;

    .line 31
    .line 32
    iget v4, v1, LSb;->h:I

    .line 33
    .line 34
    const/4 v5, 0x3

    .line 35
    const/4 v6, 0x1

    .line 36
    if-eqz v4, :cond_4

    .line 37
    .line 38
    if-eq v4, v6, :cond_3

    .line 39
    .line 40
    if-eq v4, v0, :cond_2

    .line 41
    .line 42
    if-ne v4, v5, :cond_1

    .line 43
    .line 44
    :try_start_0
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    goto/16 :goto_4

    .line 48
    .line 49
    :catchall_0
    move-exception p1

    .line 50
    goto/16 :goto_7

    .line 51
    .line 52
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p1

    .line 60
    :cond_2
    :try_start_1
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_4

    .line 64
    .line 65
    :cond_3
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    .line 68
    goto/16 :goto_4

    .line 69
    .line 70
    :cond_4
    invoke-static {p2}, Llc;->P(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :try_start_2
    iget-object p2, p1, LPb;->l:Lpb;

    .line 74
    .line 75
    invoke-virtual {p0, p2}, LN6;->i(Lpb;)Ljava/io/File;

    .line 76
    .line 77
    .line 78
    move-result-object v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    iget-object v10, p1, LPb;->m:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v9, :cond_e

    .line 82
    .line 83
    :try_start_3
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    const-string v5, "content"

    .line 92
    .line 93
    invoke-static {v4, v5}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-eqz v4, :cond_5

    .line 98
    .line 99
    new-instance p1, LMb;

    .line 100
    .line 101
    invoke-direct {p1, p2}, LMb;-><init>(Landroid/net/Uri;)V

    .line 102
    .line 103
    .line 104
    goto/16 :goto_8

    .line 105
    .line 106
    :cond_5
    invoke-static {v10, v2}, LJh;->E(Ljava/lang/CharSequence;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_9

    .line 111
    .line 112
    iget-object p1, p1, LPb;->m:Ljava/lang/String;

    .line 113
    .line 114
    const/4 p2, 0x6

    .line 115
    and-int/2addr p2, v0

    .line 116
    if-eqz p2, :cond_6

    .line 117
    .line 118
    invoke-static {p1}, LJh;->F(Ljava/lang/CharSequence;)I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    :goto_1
    move v3, p2

    .line 123
    goto :goto_2

    .line 124
    :cond_6
    const/4 p2, 0x0

    .line 125
    goto :goto_1

    .line 126
    :goto_2
    const-string p2, "<this>"

    .line 127
    .line 128
    invoke-static {p2, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    const-string p2, "string"

    .line 132
    .line 133
    invoke-static {p2, v2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    instance-of p2, p1, Ljava/lang/String;

    .line 137
    .line 138
    if-nez p2, :cond_7

    .line 139
    .line 140
    const/4 v4, 0x0

    .line 141
    const/4 v6, 0x1

    .line 142
    const/4 v5, 0x0

    .line 143
    move-object v1, p1

    .line 144
    invoke-static/range {v1 .. v6}, LJh;->H(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZZ)I

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    goto :goto_3

    .line 149
    :cond_7
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    :goto_3
    add-int/lit8 p2, p2, 0xb

    .line 154
    .line 155
    invoke-static {p1}, LJh;->L(Ljava/lang/CharSequence;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-lt v0, p2, :cond_8

    .line 160
    .line 161
    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    const-string p2, "substring(...)"

    .line 166
    .line 167
    invoke-static {p2, p1}, Llc;->g(Ljava/lang/String;Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    const-string p2, "content://media/"

    .line 171
    .line 172
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    new-instance p2, LMb;

    .line 181
    .line 182
    invoke-direct {p2, p1}, LMb;-><init>(Landroid/net/Uri;)V

    .line 183
    .line 184
    .line 185
    move-object p1, p2

    .line 186
    goto/16 :goto_8

    .line 187
    .line 188
    :cond_8
    new-instance p2, Llb;

    .line 189
    .line 190
    invoke-direct {p2, p1}, Llb;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    throw p2

    .line 194
    :cond_9
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    const-string v4, "file"

    .line 199
    .line 200
    invoke-static {v2, v4}, Llc;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-eqz v2, :cond_c

    .line 205
    .line 206
    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    if-nez p1, :cond_a

    .line 211
    .line 212
    const-string p1, ""

    .line 213
    .line 214
    :cond_a
    move-object v7, p1

    .line 215
    iput v6, v1, LSb;->h:I

    .line 216
    .line 217
    sget-object p1, LR6;->a:LE6;

    .line 218
    .line 219
    sget-object p1, LB6;->e:LB6;

    .line 220
    .line 221
    new-instance p2, LRb;

    .line 222
    .line 223
    const/4 v6, 0x0

    .line 224
    const/4 v8, 0x0

    .line 225
    const/4 v9, 0x0

    .line 226
    move-object v4, p2

    .line 227
    move-object v5, p0

    .line 228
    invoke-direct/range {v4 .. v9}, LRb;-><init>(LN6;Ljava/io/File;Ljava/lang/String;Ljava/lang/Boolean;Lr5;)V

    .line 229
    .line 230
    .line 231
    invoke-static {p1, p2, v1}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    if-ne p2, v3, :cond_b

    .line 236
    .line 237
    return-object v3

    .line 238
    :cond_b
    :goto_4
    move-object p1, p2

    .line 239
    check-cast p1, LOb;

    .line 240
    .line 241
    goto :goto_8

    .line 242
    :cond_c
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    if-nez p2, :cond_d

    .line 247
    .line 248
    iget-object v7, p1, LPb;->m:Ljava/lang/String;

    .line 249
    .line 250
    iput v0, v1, LSb;->h:I

    .line 251
    .line 252
    sget-object p1, LR6;->a:LE6;

    .line 253
    .line 254
    sget-object p1, LB6;->e:LB6;

    .line 255
    .line 256
    new-instance p2, LRb;

    .line 257
    .line 258
    const/4 v6, 0x0

    .line 259
    const/4 v8, 0x0

    .line 260
    const/4 v9, 0x0

    .line 261
    move-object v4, p2

    .line 262
    move-object v5, p0

    .line 263
    invoke-direct/range {v4 .. v9}, LRb;-><init>(LN6;Ljava/io/File;Ljava/lang/String;Ljava/lang/Boolean;Lr5;)V

    .line 264
    .line 265
    .line 266
    invoke-static {p1, p2, v1}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    if-ne p2, v3, :cond_b

    .line 271
    .line 272
    return-object v3

    .line 273
    :cond_d
    new-instance p1, Llb;

    .line 274
    .line 275
    invoke-direct {p1, v10}, Llb;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    throw p1

    .line 279
    :cond_e
    iget-object p1, p1, LPb;->l:Lpb;

    .line 280
    .line 281
    if-eqz p1, :cond_f

    .line 282
    .line 283
    iget-boolean p1, p1, Lpb;->c:Z

    .line 284
    .line 285
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    :goto_5
    move-object v11, p1

    .line 290
    goto :goto_6

    .line 291
    :cond_f
    const/4 p1, 0x0

    .line 292
    goto :goto_5

    .line 293
    :goto_6
    iput v5, v1, LSb;->h:I

    .line 294
    .line 295
    sget-object p1, LR6;->a:LE6;

    .line 296
    .line 297
    sget-object p1, LB6;->e:LB6;

    .line 298
    .line 299
    new-instance p2, LRb;

    .line 300
    .line 301
    const/4 v12, 0x0

    .line 302
    move-object v7, p2

    .line 303
    move-object v8, p0

    .line 304
    invoke-direct/range {v7 .. v12}, LRb;-><init>(LN6;Ljava/io/File;Ljava/lang/String;Ljava/lang/Boolean;Lr5;)V

    .line 305
    .line 306
    .line 307
    invoke-static {p1, p2, v1}, LMk;->O(LY5;LN9;Ls5;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 311
    if-ne p2, v3, :cond_b

    .line 312
    .line 313
    return-object v3

    .line 314
    :goto_7
    invoke-static {p1}, Llc;->k(Ljava/lang/Throwable;)Log;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    :goto_8
    return-object p1
.end method
