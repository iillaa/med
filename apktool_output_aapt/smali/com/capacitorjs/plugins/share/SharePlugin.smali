.class public Lcom/capacitorjs/plugins/share/SharePlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "Share"
.end annotation


# instance fields
.field private broadcastReceiver:Landroid/content/BroadcastReceiver;

.field private chosenComponent:Landroid/content/ComponentName;

.field private isPresenting:Z

.field private stopped:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    return-void
.end method

.method private activityResult(Lcom/getcapacitor/PluginCall;Lv0;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/annotation/ActivityCallback;
    .end annotation

    .line 1
    iget p2, p2, Lv0;->a:I

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-boolean p2, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    const-string p2, "Share canceled"

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    new-instance p2, Lcom/getcapacitor/JSObject;

    .line 16
    .line 17
    invoke-direct {p2}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v0, ""

    .line 30
    .line 31
    :goto_0
    const-string v1, "activityType"

    .line 32
    .line 33
    invoke-virtual {p2, v1, v0}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 37
    .line 38
    .line 39
    :goto_1
    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    .line 41
    .line 42
    return-void
.end method

.method public static bridge synthetic c(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    return-void
.end method

.method public static bridge synthetic d(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/Intent;)Landroid/content/ComponentName;
    .locals 1

    .line 1
    const-string v0, "android.intent.extra.CHOSEN_COMPONENT"

    invoke-direct {p0, p1, v0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method private getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;
    .locals 0

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/ComponentName;

    return-object p1
.end method

.method private isFileUrl(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "file:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private isHttpUrl(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method private shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_3

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-direct {p0, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v4, :cond_1

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_3

    :cond_0
    :goto_1
    const-string v5, "*/*"

    :cond_1
    invoke-virtual {p2, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".fileprovider"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/io/File;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v5, v6}, Landroidx/core/content/FileProvider;->d(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const-string p1, "only file urls are supported"

    invoke-virtual {p3, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "android.intent.extra.STREAM"

    if-le p1, v4, :cond_4

    :try_start_1
    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, v4, :cond_6

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt p1, v3, :cond_5

    const-string p1, ""

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    invoke-static {p1, v3}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    :cond_5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {p2, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_6
    :goto_2
    invoke-virtual {p2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :goto_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public canShare(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    const-string v1, "value"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    return-void
.end method

.method public handleOnDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    return-void
.end method

.method public handleOnStop()V
    .locals 1

    invoke-super {p0}, Lcom/getcapacitor/Plugin;->handleOnStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    return-void
.end method

.method public load()V
    .locals 6

    .line 1
    new-instance v0, LI1;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1, p0}, LI1;-><init>(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 14
    .line 15
    new-instance v2, Landroid/content/IntentFilter;

    .line 16
    .line 17
    const-string v3, "android.intent.extra.CHOSEN_COMPONENT"

    .line 18
    .line 19
    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v4, 0x21

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    if-lt v3, v4, :cond_0

    .line 28
    .line 29
    invoke-static {v0, v1, v2, v5}, Ln5;->b(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/16 v4, 0x1a

    .line 34
    .line 35
    if-lt v3, v4, :cond_1

    .line 36
    .line 37
    invoke-static {v0, v1, v2, v5}, Ln5;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    :goto_0
    return-void
.end method

.method public share(Lcom/getcapacitor/PluginCall;)V
    .locals 10
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    iget-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    if-nez v0, :cond_c

    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "url"

    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "files"

    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v3

    const-string v4, "dialogTitle"

    const-string v5, "Share"

    invoke-virtual {p1, v4, v5}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v1, :cond_1

    if-nez v2, :cond_1

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-nez v5, :cond_1

    :cond_0
    const-string v0, "Must provide a URL or Message or files"

    :goto_0
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    return-void

    :cond_1
    if-eqz v2, :cond_2

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v0, "Unsupported url"

    goto :goto_0

    :cond_2
    new-instance v5, Landroid/content/Intent;

    const/4 v6, 0x1

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-le v7, v6, :cond_3

    const-string v7, "android.intent.action.SEND_MULTIPLE"

    goto :goto_1

    :cond_3
    const-string v7, "android.intent.action.SEND"

    :goto_1
    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v7, "text/plain"

    const-string v8, "android.intent.extra.TEXT"

    if-eqz v1, :cond_5

    if-eqz v2, :cond_4

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_4
    invoke-virtual {v5, v8, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v5, v7}, Landroid/content/Intent;->setTypeAndNormalize(Ljava/lang/String;)Landroid/content/Intent;

    :cond_5
    if-eqz v2, :cond_6

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    if-nez v1, :cond_6

    invoke-virtual {v5, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v5, v7}, Landroid/content/Intent;->setTypeAndNormalize(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    :cond_6
    if-eqz v2, :cond_7

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    new-instance v1, Lcom/getcapacitor/JSArray;

    invoke-direct {v1}, Lcom/getcapacitor/JSArray;-><init>()V

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-direct {p0, v1, v5, p1}, Lcom/capacitorjs/plugins/share/SharePlugin;->shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V

    :cond_7
    :goto_2
    if-eqz v0, :cond_8

    const-string v1, "android.intent.extra.SUBJECT"

    invoke-virtual {v5, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_8
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-eqz v0, :cond_9

    invoke-direct {p0, v3, v5, p1}, Lcom/capacitorjs/plugins/share/SharePlugin;->shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V

    :cond_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_a

    const/high16 v1, 0xa000000

    goto :goto_3

    :cond_a
    const/high16 v1, 0x8000000

    :goto_3
    const/16 v2, 0x22

    if-lt v0, v2, :cond_b

    const/high16 v0, 0x1000000

    or-int/2addr v1, v0

    :cond_b
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.extra.CHOSEN_COMPONENT"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v0

    invoke-static {v5, v4, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;Landroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    iput-boolean v3, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    iput-boolean v6, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    const-string v1, "activityResult"

    invoke-virtual {p0, p1, v0, v1}, Lcom/getcapacitor/Plugin;->startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_4

    :cond_c
    const-string v0, "Can\'t share while sharing is in progress"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    :goto_4
    return-void
.end method
