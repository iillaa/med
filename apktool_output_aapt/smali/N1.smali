.class public final synthetic LN1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LGc;


# instance fields
.field public final synthetic c:LN0;


# direct methods
.method public synthetic constructor <init>(LN0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN1;->c:LN0;

    return-void
.end method


# virtual methods
.method public final superDispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, LN1;->c:LN0;

    invoke-virtual {v0, p1}, LN0;->i(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method
