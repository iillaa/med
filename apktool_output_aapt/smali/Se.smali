.class public final LSe;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LSe;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LSe;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LSe;->a:LSe;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(LJ9;LJ9;Ly9;Ly9;)Landroid/window/OnBackInvokedCallback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LJ9;",
            "LJ9;",
            "Ly9;",
            "Ly9;",
            ")",
            "Landroid/window/OnBackInvokedCallback;"
        }
    .end annotation

    .line 1
    const-string v0, "onBackStarted"

    .line 2
    .line 3
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onBackProgressed"

    .line 7
    .line 8
    invoke-static {v0, p2}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "onBackInvoked"

    .line 12
    .line 13
    invoke-static {v0, p3}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "onBackCancelled"

    .line 17
    .line 18
    invoke-static {v0, p4}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, LRe;

    .line 22
    .line 23
    invoke-direct {v0, p1, p2, p3, p4}, LRe;-><init>(LJ9;LJ9;Ly9;Ly9;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method
