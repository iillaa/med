.class public abstract LWa;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LVa;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LVa;

    .line 2
    .line 3
    sget-object v1, Lg4;->a:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-direct {v0, v1}, LVa;-><init>(Ljava/nio/charset/Charset;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LWa;->a:LVa;

    .line 9
    .line 10
    return-void
.end method
