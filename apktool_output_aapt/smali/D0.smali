.class public final LD0;
.super LKc;
.source "SourceFile"

# interfaces
.implements Ly9;


# static fields
.field public static final e:LD0;

.field public static final f:LD0;

.field public static final g:LD0;


# instance fields
.field public final synthetic d:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LD0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2}, LD0;-><init>(II)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LD0;->e:LD0;

    .line 9
    .line 10
    new-instance v0, LD0;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-direct {v0, v1, v2}, LD0;-><init>(II)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LD0;->f:LD0;

    .line 18
    .line 19
    new-instance v0, LD0;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-direct {v0, v1, v2}, LD0;-><init>(II)V

    .line 24
    .line 25
    .line 26
    sput-object v0, LD0;->g:LD0;

    .line 27
    .line 28
    return-void
.end method

.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    iput p2, p0, LD0;->d:I

    invoke-direct {p0, p1}, LKc;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, LD0;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-class v0, Landroid/view/inputmethod/InputMethodManager;

    .line 7
    .line 8
    const-string v1, "mServedView"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 16
    .line 17
    .line 18
    const-string v3, "mNextServedView"

    .line 19
    .line 20
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 25
    .line 26
    .line 27
    const-string v4, "mH"

    .line 28
    .line 29
    invoke-virtual {v0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 34
    .line 35
    .line 36
    new-instance v2, LVb;

    .line 37
    .line 38
    invoke-direct {v2, v0, v1, v3}, LVb;-><init>(Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    sget-object v2, LUb;->a:LUb;

    .line 43
    .line 44
    :goto_0
    return-object v2

    .line 45
    :pswitch_0
    sget-object v0, LR6;->a:LE6;

    .line 46
    .line 47
    sget-object v0, LHd;->a:Lca;

    .line 48
    .line 49
    new-instance v1, Lo5;

    .line 50
    .line 51
    sget-object v2, Lt5;->g:Lt5;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lc6;->c(LX5;)LW5;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    new-instance v2, Lwc;

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    invoke-direct {v2, v3}, Lwc;-><init>(Luc;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lg;->k(LY5;)LY5;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_1
    invoke-direct {v1, v0}, Lo5;-><init>(LY5;)V

    .line 71
    .line 72
    .line 73
    return-object v1

    .line 74
    :pswitch_1
    sget-object v0, LPf;->c:LOf;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    sget-object v0, LPf;->d:Lm;

    .line 80
    .line 81
    invoke-virtual {v0}, Lm;->a()Ljava/util/Random;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/high16 v1, 0x7fff0000

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const/high16 v1, 0x10000

    .line 92
    .line 93
    add-int/2addr v0, v1

    .line 94
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    return-object v0

    .line 99
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
