.class public final LWh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LH5;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Landroid/webkit/JsResult;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/JsResult;I)V
    .locals 0

    .line 1
    iput p2, p0, LWh;->c:I

    iput-object p1, p0, LWh;->d:Landroid/webkit/JsResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final l(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget p1, p0, LWh;->c:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LWh;->d:Landroid/webkit/JsResult;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/webkit/JsResult;->confirm()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/JsResult;->cancel()V

    .line 15
    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :pswitch_0
    iget-object p1, p0, LWh;->d:Landroid/webkit/JsResult;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/webkit/JsResult;->confirm()V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/webkit/JsResult;->cancel()V

    .line 27
    .line 28
    .line 29
    :goto_1
    return-void

    .line 30
    nop

    .line 31
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
