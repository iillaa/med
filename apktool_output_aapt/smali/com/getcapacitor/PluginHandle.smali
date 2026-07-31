.class public Lcom/getcapacitor/PluginHandle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final bridge:Lcom/getcapacitor/Bridge;

.field private instance:Lcom/getcapacitor/Plugin;

.field private legacyPluginAnnotation:Lcom/getcapacitor/NativePlugin;

.field private pluginAnnotation:Lcom/getcapacitor/annotation/CapacitorPlugin;

.field private final pluginClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;"
        }
    .end annotation
.end field

.field private final pluginId:Ljava/lang/String;

.field private final pluginMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/getcapacitor/PluginMethodHandle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/getcapacitor/Bridge;Lcom/getcapacitor/Plugin;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/getcapacitor/PluginHandle;-><init>(Ljava/lang/Class;Lcom/getcapacitor/Bridge;)V

    invoke-virtual {p0, p2}, Lcom/getcapacitor/PluginHandle;->loadInstance(Lcom/getcapacitor/Plugin;)Lcom/getcapacitor/Plugin;

    return-void
.end method

.method public constructor <init>(Lcom/getcapacitor/Bridge;Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/Bridge;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p2, p1}, Lcom/getcapacitor/PluginHandle;-><init>(Ljava/lang/Class;Lcom/getcapacitor/Bridge;)V

    invoke-virtual {p0}, Lcom/getcapacitor/PluginHandle;->load()Lcom/getcapacitor/Plugin;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;Lcom/getcapacitor/Bridge;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;",
            "Lcom/getcapacitor/Bridge;",
            ")V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginMethods:Ljava/util/Map;

    iput-object p2, p0, Lcom/getcapacitor/PluginHandle;->bridge:Lcom/getcapacitor/Bridge;

    iput-object p1, p0, Lcom/getcapacitor/PluginHandle;->pluginClass:Ljava/lang/Class;

    const-class p2, Lcom/getcapacitor/annotation/CapacitorPlugin;

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/annotation/CapacitorPlugin;

    const-string v0, ""

    if-nez p2, :cond_2

    const-class p2, Lcom/getcapacitor/NativePlugin;

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p2

    check-cast p2, Lcom/getcapacitor/NativePlugin;

    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/getcapacitor/NativePlugin;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Lcom/getcapacitor/NativePlugin;->name()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginId:Ljava/lang/String;

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :goto_1
    iput-object p2, p0, Lcom/getcapacitor/PluginHandle;->legacyPluginAnnotation:Lcom/getcapacitor/NativePlugin;

    goto :goto_4

    :cond_1
    new-instance p2, Lcom/getcapacitor/InvalidPluginException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "No @CapacitorPlugin annotation found for plugin "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/getcapacitor/InvalidPluginException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    invoke-interface {p2}, Lcom/getcapacitor/annotation/CapacitorPlugin;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p2}, Lcom/getcapacitor/annotation/CapacitorPlugin;->name()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginId:Ljava/lang/String;

    goto :goto_3

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :goto_3
    iput-object p2, p0, Lcom/getcapacitor/PluginHandle;->pluginAnnotation:Lcom/getcapacitor/annotation/CapacitorPlugin;

    :goto_4
    invoke-direct {p0, p1}, Lcom/getcapacitor/PluginHandle;->indexMethods(Ljava/lang/Class;)V

    return-void
.end method

.method private indexMethods(Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->pluginClass:Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    const-class v3, Lcom/getcapacitor/PluginMethod;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/PluginMethod;

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    new-instance v4, Lcom/getcapacitor/PluginMethodHandle;

    invoke-direct {v4, v2, v3}, Lcom/getcapacitor/PluginMethodHandle;-><init>(Ljava/lang/reflect/Method;Lcom/getcapacitor/PluginMethod;)V

    iget-object v3, p0, Lcom/getcapacitor/PluginHandle;->pluginMethods:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginId:Ljava/lang/String;

    return-object v0
.end method

.method public getInstance()Lcom/getcapacitor/Plugin;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    return-object v0
.end method

.method public getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->legacyPluginAnnotation:Lcom/getcapacitor/NativePlugin;

    return-object v0
.end method

.method public getMethods()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/getcapacitor/PluginMethodHandle;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginMethods:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginAnnotation:Lcom/getcapacitor/annotation/CapacitorPlugin;

    return-object v0
.end method

.method public getPluginClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/getcapacitor/Plugin;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginClass:Ljava/lang/Class;

    return-object v0
.end method

.method public invoke(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 3

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/PluginHandle;->load()Lcom/getcapacitor/Plugin;

    :cond_0
    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginMethods:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/PluginMethodHandle;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/getcapacitor/PluginMethodHandle;->getMethod()Ljava/lang/reflect/Method;

    move-result-object p1

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    new-instance p2, Lcom/getcapacitor/InvalidPluginMethodException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "No method "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " found for plugin "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->pluginClass:Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/getcapacitor/InvalidPluginMethodException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public load()Lcom/getcapacitor/Plugin;
    .locals 2

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->pluginClass:Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/Plugin;

    iput-object v0, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    invoke-virtual {p0, v0}, Lcom/getcapacitor/PluginHandle;->loadInstance(Lcom/getcapacitor/Plugin;)Lcom/getcapacitor/Plugin;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    new-instance v0, Lcom/getcapacitor/PluginLoadException;

    const-string v1, "Unable to load plugin instance. Ensure plugin is publicly accessible"

    invoke-direct {v0, v1}, Lcom/getcapacitor/PluginLoadException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public loadInstance(Lcom/getcapacitor/Plugin;)Lcom/getcapacitor/Plugin;
    .locals 1

    iput-object p1, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    invoke-virtual {p1, p0}, Lcom/getcapacitor/Plugin;->setPluginHandle(Lcom/getcapacitor/PluginHandle;)V

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    iget-object v0, p0, Lcom/getcapacitor/PluginHandle;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {p1, v0}, Lcom/getcapacitor/Plugin;->setBridge(Lcom/getcapacitor/Bridge;)V

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    invoke-virtual {p1}, Lcom/getcapacitor/Plugin;->load()V

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    invoke-virtual {p1}, Lcom/getcapacitor/Plugin;->initializeActivityLaunchers()V

    iget-object p1, p0, Lcom/getcapacitor/PluginHandle;->instance:Lcom/getcapacitor/Plugin;

    return-object p1
.end method
