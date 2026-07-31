.class public Lcom/getcapacitor/util/InternalUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/PackageInfo;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/getcapacitor/util/InternalUtils;->getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0
.end method

.method public static getPackageInfo(Landroid/content/pm/PackageManager;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;
    .locals 2

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    invoke-static {p2, p3}, LD;->b(J)Landroid/content/pm/PackageManager$PackageInfoFlags;

    move-result-object p2

    invoke-static {p0, p1, p2}, LD;->a(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageManager$PackageInfoFlags;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0

    :cond_0
    long-to-int p2, p2

    int-to-long p2, p2

    invoke-static {p0, p1, p2, p3}, Lcom/getcapacitor/util/InternalUtils;->getPackageInfoLegacy(Landroid/content/pm/PackageManager;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0
.end method

.method private static getPackageInfoLegacy(Landroid/content/pm/PackageManager;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;
    .locals 0

    long-to-int p2, p2

    invoke-virtual {p0, p1, p2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0
.end method
