.class public Lcom/getcapacitor/BridgeWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;,
        Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;
    }
.end annotation


# instance fields
.field private activityLauncher:Lz0;

.field private activityListener:Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;

.field private bridge:Lcom/getcapacitor/Bridge;

.field private permissionLauncher:Lz0;

.field private permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;


# direct methods
.method public constructor <init>(Lcom/getcapacitor/Bridge;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    .line 5
    .line 6
    new-instance v0, Ly3;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p0, v1}, Ly3;-><init>(Lcom/getcapacitor/BridgeWebChromeClient;I)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ly0;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, v2}, Ly0;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Lx0;Lw0;)Lz0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionLauncher:Lz0;

    .line 23
    .line 24
    new-instance v0, Ly0;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-direct {v0, v1}, Ly0;-><init>(I)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ly3;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-direct {v1, p0, v2}, Ly3;-><init>(Lcom/getcapacitor/BridgeWebChromeClient;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Lx0;Lw0;)Lz0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityLauncher:Lz0;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/getcapacitor/BridgeWebChromeClient;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$new$0(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic b(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsPrompt$9(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic c(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsAlert$3(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method private createImageFile(Landroid/app/Activity;)Ljava/io/File;
    .locals 3

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyyMMdd_HHmmss"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/Date;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "JPEG_"

    .line 18
    .line 19
    const-string v2, "_"

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Loh;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v1, ".jpg"

    .line 32
    .line 33
    invoke-static {v0, v1, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    return-object p1
.end method

.method private createImageFileUri()Landroid/net/Uri;
    .locals 4

    iget-object v0, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/getcapacitor/BridgeWebChromeClient;->createImageFile(Landroid/app/Activity;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v3}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".fileprovider"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroidx/core/content/FileProvider;->d(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic d(Landroid/webkit/PermissionRequest;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onPermissionRequest$2(Landroid/webkit/PermissionRequest;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsPrompt$10(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic f(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsConfirm$7(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsConfirm$6(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method private getValidTypes([Ljava/lang/String;)[Ljava/lang/String;
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p1, v3

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    :goto_1
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object p1

    array-length v0, p1

    const-class v1, [Ljava/lang/String;

    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic h(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsConfirm$5(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic i(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;ZLjava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onShowFileChooser$12(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;ZLjava/lang/Boolean;)V

    return-void
.end method

.method private isMediaCaptureSupported()Z
    .locals 3

    const-string v0, "android.permission.CAMERA"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v2}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/getcapacitor/util/PermissionHelper;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static synthetic j(Landroid/webkit/ValueCallback;Lv0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$showVideoCapturePicker$14(Landroid/webkit/ValueCallback;Lv0;)V

    return-void
.end method

.method public static synthetic k(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onGeolocationPermissionsShowPrompt$11(Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsAlert$4(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V

    return-void
.end method

.method private synthetic lambda$new$0(Ljava/util/Map;)V
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;->onPermissionSelect(Ljava/lang/Boolean;)V

    :cond_2
    return-void
.end method

.method private synthetic lambda$new$1(Lv0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityListener:Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;->onActivityResult(Lv0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic lambda$onGeolocationPermissionsShowPrompt$11(Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 4

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    :goto_0
    invoke-interface {p1, p2, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    goto :goto_1

    :cond_0
    const-string p3, "android.permission.ACCESS_COARSE_LOCATION"

    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object p3

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1f

    if-lt v2, v3, :cond_1

    iget-object v2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v2}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p3}, Lcom/getcapacitor/util/PermissionHelper;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1, p2, v1, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    :goto_1
    return-void
.end method

.method private static synthetic lambda$onJsAlert$3(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->confirm()V

    return-void
.end method

.method private static synthetic lambda$onJsAlert$4(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method

.method private static synthetic lambda$onJsConfirm$5(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->confirm()V

    return-void
.end method

.method private static synthetic lambda$onJsConfirm$6(Landroid/webkit/JsResult;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method

.method private static synthetic lambda$onJsConfirm$7(Landroid/webkit/JsResult;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method

.method private static synthetic lambda$onJsPrompt$10(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method

.method private static synthetic lambda$onJsPrompt$8(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    return-void
.end method

.method private static synthetic lambda$onJsPrompt$9(Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/webkit/JsResult;->cancel()V

    return-void
.end method

.method private static synthetic lambda$onPermissionRequest$2(Landroid/webkit/PermissionRequest;Ljava/lang/Boolean;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/webkit/PermissionRequest;->deny()V

    :goto_0
    return-void
.end method

.method private synthetic lambda$onShowFileChooser$12(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;ZLjava/lang/Boolean;)V
    .locals 0

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-eqz p4, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/getcapacitor/BridgeWebChromeClient;->showMediaCaptureOrFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Z)V

    goto :goto_0

    :cond_0
    const-string p2, "FileChooser"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string p3, "Camera permission not granted"

    invoke-static {p2, p3}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private static lambda$showFilePicker$15(Landroid/webkit/ValueCallback;Lv0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lv0;->b:Landroid/content/Intent;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    iget p1, p1, Lv0;->a:I

    .line 5
    .line 6
    if-ne p1, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    new-array v1, p1, [Landroid/net/Uri;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    aput-object v3, v1, v2

    .line 40
    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {p1, v0}, Landroid/webkit/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :cond_1
    invoke-interface {p0, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private static lambda$showImageCapturePicker$13(Landroid/net/Uri;Landroid/webkit/ValueCallback;Lv0;)V
    .locals 1

    .line 1
    iget p2, p2, Lv0;->a:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    new-array p2, p2, [Landroid/net/Uri;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aput-object p0, p2, v0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p2, 0x0

    .line 14
    :goto_0
    invoke-interface {p1, p2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private static lambda$showVideoCapturePicker$14(Landroid/webkit/ValueCallback;Lv0;)V
    .locals 2

    .line 1
    iget v0, p1, Lv0;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p1, Lv0;->b:Landroid/content/Intent;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x1

    .line 13
    new-array v0, v0, [Landroid/net/Uri;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    aput-object p1, v0, v1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-interface {p0, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic m(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$onJsPrompt$8(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic n(Landroid/net/Uri;Landroid/webkit/ValueCallback;Lv0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$showImageCapturePicker$13(Landroid/net/Uri;Landroid/webkit/ValueCallback;Lv0;)V

    return-void
.end method

.method public static synthetic o(Landroid/webkit/ValueCallback;Lv0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$showFilePicker$15(Landroid/webkit/ValueCallback;Lv0;)V

    return-void
.end method

.method public static synthetic p(Lcom/getcapacitor/BridgeWebChromeClient;Lv0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->lambda$new$1(Lv0;)V

    return-void
.end method

.method private showFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    const-string v1, "android.intent.extra.ALLOW_MULTIPLE"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    array-length v1, v1

    .line 22
    const-string v3, "."

    .line 23
    .line 24
    if-gt v1, v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    :cond_1
    invoke-virtual {p2}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-direct {p0, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->getValidTypes([Ljava/lang/String;)[Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const-string v1, "android.intent.extra.MIME_TYPES"

    .line 45
    .line 46
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    aget-object p2, p2, v1

    .line 61
    .line 62
    invoke-virtual {v0, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    :cond_2
    :try_start_0
    new-instance p2, Lcom/getcapacitor/a;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-direct {p2, v1, p1}, Lcom/getcapacitor/a;-><init>(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iput-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityListener:Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;

    .line 72
    .line 73
    iget-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityLauncher:Lz0;

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Lz0;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catch_0
    const/4 p2, 0x0

    .line 80
    invoke-interface {p1, p2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    return-void
.end method

.method private showImageCapturePicker(Landroid/webkit/ValueCallback;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.media.action.IMAGE_CAPTURE"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x0

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/getcapacitor/BridgeWebChromeClient;->createImageFileUri()Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    const-string v2, "output"

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    new-instance v2, Lcom/getcapacitor/d;

    .line 40
    .line 41
    invoke-direct {v2, v1, p1}, Lcom/getcapacitor/d;-><init>(Landroid/net/Uri;Landroid/webkit/ValueCallback;)V

    .line 42
    .line 43
    .line 44
    iput-object v2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityListener:Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;

    .line 45
    .line 46
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityLauncher:Lz0;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lz0;->a(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    return p1

    .line 53
    :catch_0
    move-exception p1

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v1, "Unable to create temporary media capture file: "

    .line 57
    .line 58
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return v2
.end method

.method private showMediaCaptureOrFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            "Z)V"
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p3, :cond_1

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->showVideoCapturePicker(Landroid/webkit/ValueCallback;)Z

    move-result p3

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1}, Lcom/getcapacitor/BridgeWebChromeClient;->showImageCapturePicker(Landroid/webkit/ValueCallback;)Z

    move-result p3

    :goto_1
    if-nez p3, :cond_2

    const-string p3, "FileChooser"

    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "Media capture intent could not be launched. Falling back to default file picker."

    invoke-static {p3, v0}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/BridgeWebChromeClient;->showFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)V

    :cond_2
    return-void
.end method

.method private showVideoCapturePicker(Landroid/webkit/ValueCallback;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.media.action.VIDEO_CAPTURE"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    return p1

    .line 26
    :cond_0
    new-instance v1, Lcom/getcapacitor/a;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v1, v2, p1}, Lcom/getcapacitor/a;-><init>(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityListener:Lcom/getcapacitor/BridgeWebChromeClient$ActivityResultListener;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->activityLauncher:Lz0;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lz0;->a(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    return p1
.end method


# virtual methods
.method public isValidMsg(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "%cresult %c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "%cnative %c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "[object Object]"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "console.groupEnd"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 7

    const/4 v0, 0x1

    const-string v1, "Console"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/getcapacitor/BridgeWebChromeClient;->isValidMsg(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    aput-object v3, v5, v0

    const/4 v2, 0x2

    aput-object v4, v5, v2

    const-string v2, "File: %s - Line %d - Msg: %s"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    const-string v3, "ERROR"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x0

    invoke-static {v1, v2, p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const-string v3, "WARNING"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {v1, v2}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v3, "TIP"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {v1, v2}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {v1, v2}, Lcom/getcapacitor/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return v0
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onGeolocationPermissionsShowPrompt: DOING IT HERE FOR ORIGIN: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    .line 22
    .line 23
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 24
    .line 25
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1, v0}, Lcom/getcapacitor/util/PermissionHelper;->hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_0

    .line 40
    .line 41
    new-instance v1, Lcom/getcapacitor/c;

    .line 42
    .line 43
    invoke-direct {v1, p0, p2, p1}, Lcom/getcapacitor/c;-><init>(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/GeolocationPermissions$Callback;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;

    .line 47
    .line 48
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionLauncher:Lz0;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lz0;->a(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v0, 0x1

    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 57
    .line 58
    .line 59
    const-string p1, "onGeolocationPermissionsShowPrompt: has required permission"

    .line 60
    .line 61
    invoke-static {p1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    return-void
.end method

.method public onHideCustomView()V
    .locals 0

    invoke-super {p0}, Landroid/webkit/WebChromeClient;->onHideCustomView()V

    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    return v0

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lw3;

    const/4 v1, 0x0

    invoke-direct {p3, p4, v1}, Lw3;-><init>(Landroid/webkit/JsResult;I)V

    const-string v1, "OK"

    invoke-virtual {p1, v1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lx3;

    const/4 v1, 0x0

    invoke-direct {p3, p4, v1}, Lx3;-><init>(Landroid/webkit/JsResult;I)V

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return v0
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    return v0

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lw3;

    const/4 v1, 0x1

    invoke-direct {p3, p4, v1}, Lw3;-><init>(Landroid/webkit/JsResult;I)V

    const-string v1, "OK"

    invoke-virtual {p1, v1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lw3;

    const/4 v1, 0x2

    invoke-direct {p3, p4, v1}, Lw3;-><init>(Landroid/webkit/JsResult;I)V

    const-string v1, "Cancel"

    invoke-virtual {p1, v1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lx3;

    const/4 v1, 0x1

    invoke-direct {p3, p4, v1}, Lx3;-><init>(Landroid/webkit/JsResult;I)V

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return v0
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 1

    iget-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p2}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p2

    const/4 p4, 0x1

    if-eqz p2, :cond_0

    return p4

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lz3;

    invoke-direct {p3, v0, p5}, Lz3;-><init>(Landroid/widget/EditText;Landroid/webkit/JsPromptResult;)V

    const-string v0, "OK"

    invoke-virtual {p1, v0, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lw3;

    const/4 v0, 0x3

    invoke-direct {p3, p5, v0}, Lw3;-><init>(Landroid/webkit/JsResult;I)V

    const-string v0, "Cancel"

    invoke-virtual {p1, v0, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p3, Lx3;

    const/4 v0, 0x2

    invoke-direct {p3, p5, v0}, Lx3;-><init>(Landroid/webkit/JsResult;I)V

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return p4
.end method

.method public onPermissionRequest(Landroid/webkit/PermissionRequest;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "android.webkit.resource.VIDEO_CAPTURE"

    .line 15
    .line 16
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const-string v1, "android.permission.CAMERA"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "android.webkit.resource.AUDIO_CAPTURE"

    .line 36
    .line 37
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const-string v1, "android.permission.MODIFY_AUDIO_SETTINGS"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    const-string v1, "android.permission.RECORD_AUDIO"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    new-array v1, v1, [Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, [Ljava/lang/String;

    .line 67
    .line 68
    new-instance v1, Lcom/getcapacitor/a;

    .line 69
    .line 70
    const/4 v2, 0x2

    .line 71
    invoke-direct {v1, v2, p1}, Lcom/getcapacitor/a;-><init>(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iput-object v1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;

    .line 75
    .line 76
    iget-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionLauncher:Lz0;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lz0;->a(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p1, v0}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :goto_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0

    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->isCaptureEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v3, "image/*"

    .line 18
    .line 19
    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    move v3, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v1

    .line 28
    :goto_0
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const-string v0, "video/*"

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    move v1, v2

    .line 39
    :cond_1
    if-nez v3, :cond_3

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    invoke-direct {p0, p2, p3}, Lcom/getcapacitor/BridgeWebChromeClient;->showFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)V

    .line 45
    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/getcapacitor/BridgeWebChromeClient;->isMediaCaptureSupported()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    invoke-direct {p0, p2, p3, v1}, Lcom/getcapacitor/BridgeWebChromeClient;->showMediaCaptureOrFilePicker(Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_4
    new-instance p1, Lcom/getcapacitor/b;

    .line 59
    .line 60
    invoke-direct {p1, p0, p2, p3, v1}, Lcom/getcapacitor/b;-><init>(Lcom/getcapacitor/BridgeWebChromeClient;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;Z)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionListener:Lcom/getcapacitor/BridgeWebChromeClient$PermissionListener;

    .line 64
    .line 65
    const-string p1, "android.permission.CAMERA"

    .line 66
    .line 67
    filled-new-array {p1}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p2, p0, Lcom/getcapacitor/BridgeWebChromeClient;->permissionLauncher:Lz0;

    .line 72
    .line 73
    invoke-virtual {p2, p1}, Lz0;->a(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    :goto_2
    return v2
.end method
