.class public final LQ0;
.super Lc5;
.source "SourceFile"


# instance fields
.field public final synthetic h:Lorg/apache/cordova/AllowListPlugin;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/AllowListPlugin;)V
    .locals 1

    .line 1
    iput-object p1, p0, LQ0;->h:Lorg/apache/cordova/AllowListPlugin;

    .line 2
    .line 3
    invoke-direct {p0}, Lc5;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/HashMap;

    .line 7
    .line 8
    const/16 v0, 0x14

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 8

    .line 1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "content"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    iget-object v3, p0, LQ0;->h:Lorg/apache/cordova/AllowListPlugin;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const-string v0, "src"

    .line 17
    .line 18
    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :cond_0
    iget-object v0, v3, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0, p1}, LP0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const-string v1, "allow-navigation"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const-string v4, "https://*/*"

    .line 35
    .line 36
    const-string v5, "http://*/*"

    .line 37
    .line 38
    const-string v6, "*"

    .line 39
    .line 40
    const-string v7, "href"

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-interface {p1, v2, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object p1, v3, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 55
    .line 56
    invoke-virtual {p1, v5}, LP0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, v3, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 60
    .line 61
    invoke-virtual {p1, v4}, LP0;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, v3, Lorg/apache/cordova/AllowListPlugin;->b:LP0;

    .line 65
    .line 66
    const-string v0, "data:*"

    .line 67
    .line 68
    invoke-virtual {p1, v0}, LP0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    const-string v1, "allow-intent"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    invoke-interface {p1, v2, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object v0, v3, Lorg/apache/cordova/AllowListPlugin;->c:LP0;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    const-string v1, "access"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_6

    .line 94
    .line 95
    const-string v0, "origin"

    .line 96
    .line 97
    invoke-interface {p1, v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    if-eqz v0, :cond_6

    .line 102
    .line 103
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_4

    .line 108
    .line 109
    iget-object p1, v3, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    .line 110
    .line 111
    invoke-virtual {p1, v5}, LP0;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, v3, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    .line 115
    .line 116
    invoke-virtual {p1, v4}, LP0;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    const-string v1, "subdomains"

    .line 121
    .line 122
    invoke-interface {p1, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v1, v3, Lorg/apache/cordova/AllowListPlugin;->d:LP0;

    .line 127
    .line 128
    if-eqz p1, :cond_5

    .line 129
    .line 130
    const-string v2, "true"

    .line 131
    .line 132
    invoke-virtual {p1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    :cond_5
    invoke-virtual {v1, v0}, LP0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_6
    :goto_1
    return-void
.end method
