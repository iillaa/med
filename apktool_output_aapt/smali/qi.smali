.class public final Lqi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz8;


# instance fields
.field public final c:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lqi;->c:Ljava/lang/Throwable;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Lr5;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p1, p0, Lqi;->c:Ljava/lang/Throwable;

    .line 2
    .line 3
    throw p1
.end method
