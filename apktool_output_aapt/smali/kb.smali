.class public final Lkb;
.super Lmb;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "An unknown error occurred."

    .line 3
    .line 4
    invoke-direct {p0, v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lkb;->c:Ljava/lang/Throwable;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getCause()Ljava/lang/Throwable;
    .locals 1

    .line 1
    iget-object v0, p0, Lkb;->c:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object v0
.end method
