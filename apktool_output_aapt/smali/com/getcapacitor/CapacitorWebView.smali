.class public Lcom/getcapacitor/CapacitorWebView;
.super Landroid/webkit/WebView;
.source "SourceFile"


# instance fields
.field private bridge:Lcom/getcapacitor/Bridge;

.field private capInputConnection:Landroid/view/inputmethod/BaseInputConnection;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Landroid/view/View;LLk;)LLk;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/getcapacitor/CapacitorWebView;->lambda$edgeToEdgeHandler$0(Landroid/view/View;LLk;)LLk;

    move-result-object p0

    return-object p0
.end method

.method private static lambda$edgeToEdgeHandler$0(Landroid/view/View;LLk;)LLk;
    .locals 2

    .line 1
    iget-object p1, p1, LLk;->a:LIk;

    .line 2
    .line 3
    const/16 v0, 0x87

    .line 4
    .line 5
    invoke-virtual {p1, v0}, LIk;->f(I)Lgc;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    iget v1, p1, Lgc;->a:I

    .line 16
    .line 17
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 18
    .line 19
    iget v1, p1, Lgc;->d:I

    .line 20
    .line 21
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 22
    .line 23
    iget v1, p1, Lgc;->c:I

    .line 24
    .line 25
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 26
    .line 27
    iget p1, p1, Lgc;->b:I

    .line 28
    .line 29
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, LLk;->b:LLk;

    .line 35
    .line 36
    return-object p0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "document.activeElement.value = document.activeElement.value + \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getCharacters()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\';"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public edgeToEdgeHandler(Lcom/getcapacitor/Bridge;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/getcapacitor/CapConfig;->adjustMarginsForEdgeToEdge()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "disable"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string v0, "force"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    .line 26
    const/16 v2, 0x23

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-lt v1, v2, :cond_3

    .line 30
    .line 31
    const-string v1, "auto"

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    new-instance p1, Landroid/util/TypedValue;

    .line 40
    .line 41
    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const v2, 0x101069a

    .line 53
    .line 54
    .line 55
    const/4 v4, 0x1

    .line 56
    invoke-virtual {v1, v2, p1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget p1, p1, Landroid/util/TypedValue;->data:I

    .line 61
    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    move p1, v4

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    move p1, v3

    .line 67
    :goto_0
    if-eqz v1, :cond_2

    .line 68
    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    :cond_2
    move v3, v4

    .line 72
    :cond_3
    if-nez v0, :cond_4

    .line 73
    .line 74
    if-eqz v3, :cond_5

    .line 75
    .line 76
    :cond_4
    new-instance p1, LS3;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    sget-object v0, LLj;->a:Ljava/util/WeakHashMap;

    .line 82
    .line 83
    invoke-static {p0, p1}, LEj;->i(Landroid/view/View;LMe;)V

    .line 84
    .line 85
    .line 86
    :cond_5
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 1

    iget-object v0, p0, Lcom/getcapacitor/CapacitorWebView;->bridge:Lcom/getcapacitor/Bridge;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/getcapacitor/CapConfig;->loadDefault(Landroid/content/Context;)Lcom/getcapacitor/CapConfig;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Lcom/getcapacitor/CapConfig;->isInputCaptured()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/getcapacitor/CapacitorWebView;->capInputConnection:Landroid/view/inputmethod/BaseInputConnection;

    if-nez p1, :cond_1

    new-instance p1, Landroid/view/inputmethod/BaseInputConnection;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    iput-object p1, p0, Lcom/getcapacitor/CapacitorWebView;->capInputConnection:Landroid/view/inputmethod/BaseInputConnection;

    :cond_1
    iget-object p1, p0, Lcom/getcapacitor/CapacitorWebView;->capInputConnection:Landroid/view/inputmethod/BaseInputConnection;

    return-object p1

    :cond_2
    invoke-super {p0, p1}, Landroid/webkit/WebView;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object p1

    return-object p1
.end method

.method public setBridge(Lcom/getcapacitor/Bridge;)V
    .locals 0

    iput-object p1, p0, Lcom/getcapacitor/CapacitorWebView;->bridge:Lcom/getcapacitor/Bridge;

    return-void
.end method
