.class public abstract LN7;
.super Lc6;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/lang/AutoCloseable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "baseKey"

    .line 2
    .line 3
    sget-object v1, Lc6;->d:Lb6;

    .line 4
    .line 5
    invoke-static {v0, v1}, Llc;->h(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
