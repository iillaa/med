.class public final LBg;
.super LKc;
.source "SourceFile"

# interfaces
.implements LJ9;


# static fields
.field public static final d:LBg;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LBg;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, LKc;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LBg;->d:LBg;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ln6;

    .line 2
    .line 3
    const-string v0, "$this$initializer"

    .line 4
    .line 5
    invoke-static {v0, p1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, LDg;

    .line 9
    .line 10
    invoke-direct {p1}, LDg;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method
