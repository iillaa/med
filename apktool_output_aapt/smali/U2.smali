.class public final synthetic LU2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/getcapacitor/App$AppStatusChangeListener;
.implements Lcom/getcapacitor/App$AppRestoredListener;


# instance fields
.field public final synthetic a:Lcom/capacitorjs/plugins/app/AppPlugin;


# direct methods
.method public synthetic constructor <init>(Lcom/capacitorjs/plugins/app/AppPlugin;)V
    .locals 0

    .line 1
    iput-object p1, p0, LU2;->a:Lcom/capacitorjs/plugins/app/AppPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAppRestored(Lcom/getcapacitor/PluginResult;)V
    .locals 1

    .line 1
    iget-object v0, p0, LU2;->a:Lcom/capacitorjs/plugins/app/AppPlugin;

    invoke-static {v0, p1}, Lcom/capacitorjs/plugins/app/AppPlugin;->c(Lcom/capacitorjs/plugins/app/AppPlugin;Lcom/getcapacitor/PluginResult;)V

    return-void
.end method

.method public onAppStatusChanged(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, LU2;->a:Lcom/capacitorjs/plugins/app/AppPlugin;

    invoke-static {v0, p1}, Lcom/capacitorjs/plugins/app/AppPlugin;->d(Lcom/capacitorjs/plugins/app/AppPlugin;Ljava/lang/Boolean;)V

    return-void
.end method
