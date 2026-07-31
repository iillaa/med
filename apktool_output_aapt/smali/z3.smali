.class public final synthetic Lz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic c:Landroid/widget/EditText;

.field public final synthetic d:Landroid/webkit/JsPromptResult;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz3;->c:Landroid/widget/EditText;

    iput-object p2, p0, Lz3;->d:Landroid/webkit/JsPromptResult;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz3;->c:Landroid/widget/EditText;

    iget-object v1, p0, Lz3;->d:Landroid/webkit/JsPromptResult;

    invoke-static {v0, v1, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->m(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V

    return-void
.end method
