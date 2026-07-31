.class public final synthetic Lcom/getcapacitor/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;


# instance fields
.field public final synthetic a:Landroid/net/Uri;

.field public final synthetic b:Landroid/webkit/ValueCallback;


# direct methods
.method public synthetic constructor <init>(Landroid/net/Uri;Landroid/webkit/ValueCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/getcapacitor/d;->a:Landroid/net/Uri;

    iput-object p2, p0, Lcom/getcapacitor/d;->b:Landroid/webkit/ValueCallback;

    return-void
.end method


# virtual methods
.method public final onActivityResult(Lv0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/d;->a:Landroid/net/Uri;

    iget-object v1, p0, Lcom/getcapacitor/d;->b:Landroid/webkit/ValueCallback;

    invoke-static {v0, v1, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->n(Landroid/net/Uri;Landroid/webkit/ValueCallback;Lv0;)V

    return-void
.end method
