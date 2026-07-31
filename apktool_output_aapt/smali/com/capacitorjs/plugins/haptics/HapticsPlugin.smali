.class public Lcom/capacitorjs/plugins/haptics/HapticsPlugin;
.super Lcom/getcapacitor/Plugin;
.source "SourceFile"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "Haptics"
.end annotation


# instance fields
.field private implementation:Lea;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    return-void
.end method


# virtual methods
.method public impact(Lcom/getcapacitor/PluginCall;)V
    .locals 7
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 2
    .line 3
    const-string v1, "style"

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lfa;->values()[Lfa;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    array-length v3, v2

    .line 14
    const/4 v4, 0x0

    .line 15
    :goto_0
    if-ge v4, v3, :cond_1

    .line 16
    .line 17
    aget-object v5, v2, v4

    .line 18
    .line 19
    iget-object v6, v5, Lfa;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    if-eqz v6, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-object v5, Lfa;->g:Lfa;

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v0, v5}, Lea;->a(Lha;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public load()V
    .locals 2

    new-instance v0, Lea;

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lea;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    return-void
.end method

.method public notification(Lcom/getcapacitor/PluginCall;)V
    .locals 7
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 2
    .line 3
    const-string v1, "type"

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lga;->values()[Lga;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    array-length v3, v2

    .line 14
    const/4 v4, 0x0

    .line 15
    :goto_0
    if-ge v4, v3, :cond_1

    .line 16
    .line 17
    aget-object v5, v2, v4

    .line 18
    .line 19
    iget-object v6, v5, Lga;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    if-eqz v6, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-object v5, Lga;->g:Lga;

    .line 32
    .line 33
    :goto_1
    invoke-virtual {v0, v5}, Lea;->a(Lha;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public selectionChanged(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 2
    .line 3
    iget-boolean v1, v0, Lea;->a:Z

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    const/16 v2, 0x1a

    .line 10
    .line 11
    iget-object v0, v0, Lea;->b:Landroid/os/Vibrator;

    .line 12
    .line 13
    if-lt v1, v2, :cond_0

    .line 14
    .line 15
    sget-object v1, Lr3;->o:[J

    .line 16
    .line 17
    sget-object v2, Lr3;->p:[I

    .line 18
    .line 19
    invoke-static {v1, v2}, LE;->e([J[I)Landroid/os/VibrationEffect;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, LE;->p(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v1, Lr3;->q:[J

    .line 28
    .line 29
    const/4 v2, -0x1

    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public selectionEnd(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, v0, Lea;->a:Z

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public selectionStart(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Lea;->a:Z

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public vibrate(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 1
    const/16 v0, 0x12c

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "duration"

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Lcom/getcapacitor/PluginCall;->getInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/capacitorjs/plugins/haptics/HapticsPlugin;->implementation:Lea;

    .line 18
    .line 19
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    iget-object v1, v1, Lea;->b:Landroid/os/Vibrator;

    .line 22
    .line 23
    const/16 v3, 0x1a

    .line 24
    .line 25
    if-lt v2, v3, :cond_0

    .line 26
    .line 27
    int-to-long v2, v0

    .line 28
    invoke-static {v2, v3}, LE;->d(J)Landroid/os/VibrationEffect;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v1, v0}, LE;->p(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    int-to-long v2, v0

    .line 37
    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 38
    .line 39
    .line 40
    :goto_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
