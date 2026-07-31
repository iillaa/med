.class public final synthetic Ls3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic c:Lcom/getcapacitor/Bridge;

.field public final synthetic d:Lcom/getcapacitor/PluginHandle;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/getcapacitor/PluginCall;


# direct methods
.method public synthetic constructor <init>(Lcom/getcapacitor/Bridge;Lcom/getcapacitor/PluginHandle;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls3;->c:Lcom/getcapacitor/Bridge;

    iput-object p2, p0, Ls3;->d:Lcom/getcapacitor/PluginHandle;

    iput-object p3, p0, Ls3;->e:Ljava/lang/String;

    iput-object p4, p0, Ls3;->f:Lcom/getcapacitor/PluginCall;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3;->e:Ljava/lang/String;

    iget-object v1, p0, Ls3;->f:Lcom/getcapacitor/PluginCall;

    iget-object v2, p0, Ls3;->c:Lcom/getcapacitor/Bridge;

    iget-object v3, p0, Ls3;->d:Lcom/getcapacitor/PluginHandle;

    invoke-static {v2, v3, v0, v1}, Lcom/getcapacitor/Bridge;->a(Lcom/getcapacitor/Bridge;Lcom/getcapacitor/PluginHandle;Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method
