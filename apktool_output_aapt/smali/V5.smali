.class public final LV5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:I

.field public final synthetic d:Lorg/apache/cordova/CoreAndroid;


# direct methods
.method public synthetic constructor <init>(Lorg/apache/cordova/CoreAndroid;I)V
    .locals 0

    .line 1
    iput p2, p0, LV5;->c:I

    iput-object p1, p0, LV5;->d:Lorg/apache/cordova/CoreAndroid;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, LV5;->c:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LV5;->d:Lorg/apache/cordova/CoreAndroid;

    .line 7
    .line 8
    iget-object v0, v0, LK5;->webView:LP5;

    .line 9
    .line 10
    invoke-interface {v0}, LP5;->backHistory()Z

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    iget-object v0, p0, LV5;->d:Lorg/apache/cordova/CoreAndroid;

    .line 15
    .line 16
    iget-object v0, v0, LK5;->webView:LP5;

    .line 17
    .line 18
    invoke-interface {v0}, LP5;->clearHistory()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_1
    iget-object v0, p0, LV5;->d:Lorg/apache/cordova/CoreAndroid;

    .line 23
    .line 24
    iget-object v0, v0, LK5;->webView:LP5;

    .line 25
    .line 26
    invoke-interface {v0}, LP5;->clearCache()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_2
    iget-object v0, p0, LV5;->d:Lorg/apache/cordova/CoreAndroid;

    .line 31
    .line 32
    iget-object v0, v0, LK5;->webView:LP5;

    .line 33
    .line 34
    invoke-interface {v0}, LP5;->getPluginManager()Lqf;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "spinner"

    .line 39
    .line 40
    const-string v2, "stop"

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Lqf;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
