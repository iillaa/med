.class public Lx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Landroid/view/View$AccessibilityDelegate;


# instance fields
.field public final a:Landroid/view/View$AccessibilityDelegate;

.field public final b:Lw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx;->c:Landroid/view/View$AccessibilityDelegate;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Lx;->c:Landroid/view/View$AccessibilityDelegate;

    invoke-direct {p0, v0}, Lx;-><init>(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View$AccessibilityDelegate;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx;->a:Landroid/view/View$AccessibilityDelegate;

    new-instance p1, Lw;

    invoke-direct {p1, p0}, Lw;-><init>(Lx;)V

    iput-object p1, p0, Lx;->b:Lw;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lx;->a:Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/view/View;LJ;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lx;->a:Landroid/view/View$AccessibilityDelegate;

    .line 2
    .line 3
    iget-object p2, p2, LJ;->a:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 4

    .line 1
    const v0, 0x7f08009e

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/util/List;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-ge v2, v3, :cond_2

    .line 23
    .line 24
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, LF;

    .line 29
    .line 30
    iget-object v3, v3, LF;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-ne v3, p2, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    :goto_1
    iget-object v0, p0, Lx;->a:Landroid/view/View$AccessibilityDelegate;

    .line 45
    .line 46
    invoke-virtual {v0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->performAccessibilityAction(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    const v2, 0x7f080006

    .line 53
    .line 54
    .line 55
    if-ne p2, v2, :cond_6

    .line 56
    .line 57
    if-eqz p3, :cond_6

    .line 58
    .line 59
    const-string p2, "ACCESSIBILITY_CLICKABLE_SPAN_ID"

    .line 60
    .line 61
    const/4 v0, -0x1

    .line 62
    invoke-virtual {p3, p2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    const p3, 0x7f08009f

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    check-cast p3, Landroid/util/SparseArray;

    .line 74
    .line 75
    if-eqz p3, :cond_5

    .line 76
    .line 77
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Ljava/lang/ref/WeakReference;

    .line 82
    .line 83
    if-eqz p2, :cond_5

    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    check-cast p2, Landroid/text/style/ClickableSpan;

    .line 90
    .line 91
    if-eqz p2, :cond_5

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    instance-of v0, p3, Landroid/text/Spanned;

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    move-object v0, p3

    .line 106
    check-cast v0, Landroid/text/Spanned;

    .line 107
    .line 108
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    const-class v2, Landroid/text/style/ClickableSpan;

    .line 113
    .line 114
    invoke-interface {v0, v1, p3, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    check-cast p3, [Landroid/text/style/ClickableSpan;

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_3
    const/4 p3, 0x0

    .line 122
    :goto_2
    move v0, v1

    .line 123
    :goto_3
    if-eqz p3, :cond_5

    .line 124
    .line 125
    array-length v2, p3

    .line 126
    if-ge v0, v2, :cond_5

    .line 127
    .line 128
    aget-object v2, p3, v0

    .line 129
    .line 130
    invoke-virtual {p2, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-eqz v2, :cond_4

    .line 135
    .line 136
    invoke-virtual {p2, p1}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    .line 137
    .line 138
    .line 139
    const/4 v1, 0x1

    .line 140
    goto :goto_4

    .line 141
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_5
    :goto_4
    move v0, v1

    .line 145
    :cond_6
    return v0
.end method
