.class public Lcom/getcapacitor/Plugin;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final BUNDLE_PERSISTED_OPTIONS_JSON_KEY:Ljava/lang/String; = "_json"


# instance fields
.field private final activityLaunchers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lz0;",
            ">;"
        }
    .end annotation
.end field

.field protected bridge:Lcom/getcapacitor/Bridge;

.field private final eventListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/getcapacitor/PluginCall;",
            ">;>;"
        }
    .end annotation
.end field

.field protected handle:Lcom/getcapacitor/PluginHandle;

.field private lastPluginCallId:Ljava/lang/String;

.field private final permissionLaunchers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lz0;",
            ">;"
        }
    .end annotation
.end field

.field private final retainedEventArguments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/getcapacitor/JSObject;",
            ">;>;"
        }
    .end annotation
.end field

.field protected savedLastCall:Lcom/getcapacitor/PluginCall;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    return-void
.end method

.method public static synthetic a(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Lv0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->lambda$initializeActivityLaunchers$0(Ljava/lang/reflect/Method;Lv0;)V

    return-void
.end method

.method private addEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->sendRetainedArgumentsForEvent(Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public static synthetic b(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->lambda$initializeActivityLaunchers$1(Ljava/lang/reflect/Method;Ljava/util/Map;)V

    return-void
.end method

.method private getActivityLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Lz0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            "Ljava/lang/String;",
            ")",
            "Lz0;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lz0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "There is no ActivityCallback method registered for the name: "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p2, ". Please define a callback method annotated with @ActivityCallback that receives arguments: (PluginCall, ActivityResult)"

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    return-object p1

    .line 40
    :cond_0
    return-object v0
.end method

.method private getPermissionLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Lz0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            "Ljava/lang/String;",
            ")",
            "Lz0;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lz0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "There is no PermissionCallback method registered for the name: "

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p2, ". Please define a callback method annotated with @PermissionCallback that receives arguments: (PluginCall)"

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    return-object p1

    .line 40
    :cond_0
    return-object v0
.end method

.method private getPermissionStringsForAliases([Ljava/lang/String;)[Ljava/lang/String;
    .locals 8

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v0, v4

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    new-array p1, v3, [Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1
.end method

.method private handleLegacyPermission(Lcom/getcapacitor/PluginCall;)V
    .locals 3

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    if-lez v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/getcapacitor/Plugin;->saveCall(Lcom/getcapacitor/PluginCall;)V

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissionRequestCode()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/getcapacitor/Plugin;->pluginRequestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    :goto_0
    return-void
.end method

.method private synthetic lambda$initializeActivityLaunchers$0(Ljava/lang/reflect/Method;Lv0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->triggerActivityCallback(Ljava/lang/reflect/Method;Lv0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$initializeActivityLaunchers$1(Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->triggerPermissionCallback(Ljava/lang/reflect/Method;Ljava/util/Map;)V

    return-void
.end method

.method private permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/getcapacitor/Plugin;->getPermissionLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Lz0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->savePermissionCall(Lcom/getcapacitor/PluginCall;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, p2}, Lz0;->a(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private removeEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method private sendRetainedArgumentsForEvent(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getcapacitor/JSObject;

    invoke-virtual {p0, p1, v1}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private triggerActivityCallback(Ljava/lang/reflect/Method;Lv0;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getPluginCallForLastActivity()Lcom/getcapacitor/PluginCall;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    new-array v2, v2, [Ljava/lang/Object;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    aput-object v1, v2, v3

    .line 26
    .line 27
    aput-object p2, v2, v0

    .line 28
    .line 29
    invoke-virtual {p1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :catch_0
    move-exception p1

    .line 34
    goto :goto_0

    .line 35
    :catch_1
    move-exception p1

    .line 36
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    :goto_1
    return-void
.end method

.method private triggerPermissionCallback(Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    iget-object v2, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v2}, Lcom/getcapacitor/PluginHandle;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getcapacitor/Bridge;->getPermissionCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v1

    iget-object v2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v2, p0, v1, p2}, Lcom/getcapacitor/Bridge;->validatePermissions(Lcom/getcapacitor/Plugin;Lcom/getcapacitor/PluginCall;Ljava/util/Map;)Z

    move-result p2

    if-eqz p2, :cond_0

    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    new-array p2, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object v1, p2, v0

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    :goto_1
    return-void
.end method


# virtual methods
.method public addListener(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "none"
    .end annotation

    const-string v0, "eventName"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->setKeepAlive(Ljava/lang/Boolean;)V

    invoke-direct {p0, v0, p1}, Lcom/getcapacitor/Plugin;->addEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    return-void
.end method

.method public checkPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation runtime Lcom/getcapacitor/annotation/PermissionCallback;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getPermissionStates()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    :goto_1
    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public freeSavedCall()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/PluginCall;->release(Lcom/getcapacitor/Bridge;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    return-void
.end method

.method public getActivity()Lm1;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getActivity()Lm1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBridge()Lcom/getcapacitor/Bridge;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object v0
.end method

.method public getConfig()Lcom/getcapacitor/PluginConfig;
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v1}, Lcom/getcapacitor/PluginHandle;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getcapacitor/CapConfig;->getPluginConfiguration(Ljava/lang/String;)Lcom/getcapacitor/PluginConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfigValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/PluginConfig;->getConfigJSON()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getLogTag()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs getLogTag([Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 2
    invoke-static {p1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPermissionState(Ljava/lang/String;)Lcom/getcapacitor/PermissionState;
    .locals 1

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getPermissionStates()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/getcapacitor/PermissionState;

    return-object p1
.end method

.method public getPermissionStates()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/getcapacitor/PermissionState;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p0}, Lcom/getcapacitor/Bridge;->getPermissionStates(Lcom/getcapacitor/Plugin;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getPluginHandle()Lcom/getcapacitor/PluginHandle;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    return-object v0
.end method

.method public getSavedCall()Lcom/getcapacitor/PluginCall;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    return-object v0
.end method

.method public handleOnActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public handleOnConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    return-void
.end method

.method public handleOnDestroy()V
    .locals 0

    return-void
.end method

.method public handleOnNewIntent(Landroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public handleOnPause()V
    .locals 0

    return-void
.end method

.method public handleOnRestart()V
    .locals 0

    return-void
.end method

.method public handleOnResume()V
    .locals 0

    return-void
.end method

.method public handleOnStart()V
    .locals 0

    return-void
.end method

.method public handleOnStop()V
    .locals 0

    return-void
.end method

.method public handleRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p2}, Lcom/getcapacitor/Plugin;->hasDefinedPermissions([Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "Missing the following permissions in AndroidManifest.xml:\n"

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p3, p2}, Lcom/getcapacitor/util/PermissionHelper;->getUndefinedPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    array-length p3, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_0

    aget-object v1, p2, v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    :cond_1
    return-void
.end method

.method public hasDefinedPermissions([Ljava/lang/String;)Z
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public hasDefinedRequiredPermissions()Z
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/getcapacitor/Plugin;->hasDefinedPermissions([Ljava/lang/String;)Z

    move-result v0

    return v0

    :cond_0
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    aget-object v4, v0, v3

    invoke-interface {v4}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    move v6, v2

    :goto_1
    if-ge v6, v5, :cond_2

    aget-object v7, v4, v6

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v7}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    return v2

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public hasListeners(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, LMk;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hasRequiredPermissions()Z
    .locals 10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v0

    array-length v3, v0

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v0, v4

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6, v5}, LMk;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    return v2

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v3, v0

    move v4, v2

    :goto_1
    if-ge v4, v3, :cond_5

    aget-object v5, v0, v4

    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    move v7, v2

    :goto_2
    if-ge v7, v6, :cond_4

    aget-object v8, v5, v7

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v8}, LMk;->f(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_3

    return v2

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_5
    return v1
.end method

.method public initializeActivityLaunchers()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-class v3, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/reflect/Method;

    .line 57
    .line 58
    const-class v2, Lcom/getcapacitor/annotation/ActivityCallback;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 67
    .line 68
    new-instance v3, Ly0;

    .line 69
    .line 70
    const/4 v4, 0x1

    .line 71
    invoke-direct {v3, v4}, Ly0;-><init>(I)V

    .line 72
    .line 73
    .line 74
    new-instance v4, Lnf;

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-direct {v4, p0, v5, v1}, Lnf;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v3, v4}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Lx0;Lw0;)Lz0;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    .line 85
    .line 86
    :goto_2
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    const-class v2, Lcom/getcapacitor/annotation/PermissionCallback;

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_1

    .line 101
    .line 102
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 103
    .line 104
    new-instance v3, Ly0;

    .line 105
    .line 106
    const/4 v4, 0x0

    .line 107
    invoke-direct {v3, v4}, Ly0;-><init>(I)V

    .line 108
    .line 109
    .line 110
    new-instance v4, Lnf;

    .line 111
    .line 112
    const/4 v5, 0x1

    .line 113
    invoke-direct {v4, p0, v5, v1}, Lnf;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, v3, v4}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Lx0;Lw0;)Lz0;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    return-void
.end method

.method public isPermissionDeclared(Ljava/lang/String;)Z
    .locals 6

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v0, v3

    invoke-interface {v4}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v2, 0x1

    move v3, v1

    move v4, v2

    :goto_1
    if-ge v3, v0, :cond_1

    aget-object v5, p1, v3

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v5}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v2

    goto :goto_2

    :cond_0
    move v4, v1

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    return v4

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "isPermissionDeclared: No alias defined for "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " or missing @CapacitorPlugin annotation."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    return v1
.end method

.method public load()V
    .locals 0

    return-void
.end method

.method public notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    return-void
.end method

.method public notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V
    .locals 3

    .line 2
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Notifying listeners for event "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/getcapacitor/PluginCall;

    invoke-virtual {p3, p2}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    goto :goto_0

    :cond_1
    return-void

    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No listeners found for event "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_4

    iget-object p3, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    if-nez p3, :cond_3

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    :cond_3
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method

.method public pluginRequestAllPermissions()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v1

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissionRequestCode()I

    move-result v0

    invoke-static {v1, v2, v0}, LMk;->C(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method

.method public pluginRequestPermission(Ljava/lang/String;I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v0

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p2}, LMk;->C(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method

.method public pluginRequestPermissions([Ljava/lang/String;I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Lm1;

    move-result-object v0

    invoke-static {v0, p1, p2}, LMk;->C(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method

.method public removeAllListeners()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public removeAllListeners(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "promise"
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    return-void
.end method

.method public removeListener(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "none"
    .end annotation

    const-string v0, "eventName"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "callbackId"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1, p1}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0, v0, p1}, Lcom/getcapacitor/Plugin;->removeEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->releaseCall(Lcom/getcapacitor/PluginCall;)V

    :cond_0
    return-void
.end method

.method public requestAllPermissions(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    aget-object v5, v0, v4

    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    new-array v0, v3, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-direct {p0, p1, v0, p2}, Lcom/getcapacitor/Plugin;->permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public requestPermissionForAlias(Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 0

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/getcapacitor/Plugin;->requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    return-void
.end method

.method public requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 1

    array-length v0, p1

    if-nez v0, :cond_0

    const-string p1, "No permission alias was provided"

    invoke-static {p1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->getPermissionStringsForAliases([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    if-lez v0, :cond_1

    invoke-direct {p0, p2, p1, p3}, Lcom/getcapacitor/Plugin;->permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public requestPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 10
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->handleLegacyPermission(Lcom/getcapacitor/PluginCall;)V

    goto/16 :goto_9

    :cond_0
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const-string v2, "permissions"

    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    :try_start_0
    invoke-virtual {v2}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_1
    move-object v2, v3

    :goto_0
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    const/4 v5, 0x0

    if-eqz v2, :cond_6

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_3

    :cond_2
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v6, v0

    move v7, v5

    :goto_1
    if-ge v7, v6, :cond_4

    aget-object v8, v0, v7

    invoke-interface {v8}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {v4}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "No valid permission alias was requested of this plugin."

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    goto :goto_7

    :cond_5
    new-array v0, v5, [Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    :goto_2
    move-object v3, v0

    check-cast v3, [Ljava/lang/String;

    goto :goto_7

    :cond_6
    :goto_3
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v0

    array-length v2, v0

    move v3, v5

    :goto_4
    if-ge v3, v2, :cond_a

    aget-object v6, v0, v3

    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_7

    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    aget-object v7, v7, v5

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    goto :goto_5

    :cond_7
    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_8
    :goto_5
    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_9

    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_9
    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_a
    new-array v0, v5, [Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    goto :goto_2

    :goto_7
    if-eqz v3, :cond_b

    array-length v0, v3

    if-lez v0, :cond_b

    const-string v0, "checkPermissions"

    invoke-virtual {p0, v3, p1, v0}, Lcom/getcapacitor/Plugin;->requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    goto :goto_9

    :cond_b
    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lcom/getcapacitor/PermissionState;->GRANTED:Lcom/getcapacitor/PermissionState;

    invoke-virtual {v3}, Lcom/getcapacitor/PermissionState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    goto :goto_8

    :cond_c
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    goto :goto_9

    :cond_d
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    :goto_9
    return-void
.end method

.method public restoreState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public saveCall(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    return-void
.end method

.method public saveInstanceState()Landroid/os/Bundle;
    .locals 3

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v2, "_json"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v1
.end method

.method public setBridge(Lcom/getcapacitor/Bridge;)V
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-void
.end method

.method public setPluginHandle(Lcom/getcapacitor/PluginHandle;)V
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    return-void
.end method

.method public shouldOverrideLoad(Landroid/net/Uri;)Ljava/lang/Boolean;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1, p2, p3}, Lcom/getcapacitor/Bridge;->startActivityForPluginWithResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;I)V

    return-void
.end method

.method public startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0, p1, p3}, Lcom/getcapacitor/Plugin;->getActivityLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Lz0;

    move-result-object p3

    if-nez p3, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->setPluginCallForLastActivity(Lcom/getcapacitor/PluginCall;)V

    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getCallbackId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->saveCall(Lcom/getcapacitor/PluginCall;)V

    .line 2
    invoke-virtual {p3, p2}, Lz0;->a(Ljava/lang/Object;)V

    return-void
.end method
