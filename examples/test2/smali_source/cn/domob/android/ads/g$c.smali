.class final enum Lcn/domob/android/ads/g$c;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/domob/android/ads/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcn/domob/android/ads/g$c;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcn/domob/android/ads/g$c;

.field public static final enum b:Lcn/domob/android/ads/g$c;

.field public static final enum c:Lcn/domob/android/ads/g$c;

.field private static final synthetic d:[Lcn/domob/android/ads/g$c;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 120
    new-instance v0, Lcn/domob/android/ads/g$c;

    const-string v1, "RUNNING"

    invoke-direct {v0, v1, v2}, Lcn/domob/android/ads/g$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/domob/android/ads/g$c;->a:Lcn/domob/android/ads/g$c;

    new-instance v0, Lcn/domob/android/ads/g$c;

    const-string v1, "PAUSE"

    invoke-direct {v0, v1, v3}, Lcn/domob/android/ads/g$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/domob/android/ads/g$c;->b:Lcn/domob/android/ads/g$c;

    new-instance v0, Lcn/domob/android/ads/g$c;

    const-string v1, "STOP"

    invoke-direct {v0, v1, v4}, Lcn/domob/android/ads/g$c;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcn/domob/android/ads/g$c;->c:Lcn/domob/android/ads/g$c;

    .line 119
    const/4 v0, 0x3

    new-array v0, v0, [Lcn/domob/android/ads/g$c;

    sget-object v1, Lcn/domob/android/ads/g$c;->a:Lcn/domob/android/ads/g$c;

    aput-object v1, v0, v2

    sget-object v1, Lcn/domob/android/ads/g$c;->b:Lcn/domob/android/ads/g$c;

    aput-object v1, v0, v3

    sget-object v1, Lcn/domob/android/ads/g$c;->c:Lcn/domob/android/ads/g$c;

    aput-object v1, v0, v4

    sput-object v0, Lcn/domob/android/ads/g$c;->d:[Lcn/domob/android/ads/g$c;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcn/domob/android/ads/g$c;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    const-class v0, Lcn/domob/android/ads/g$c;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcn/domob/android/ads/g$c;

    return-object v0
.end method

.method public static values()[Lcn/domob/android/ads/g$c;
    .registers 1

    .prologue
    .line 119
    sget-object v0, Lcn/domob/android/ads/g$c;->d:[Lcn/domob/android/ads/g$c;

    invoke-virtual {v0}, [Lcn/domob/android/ads/g$c;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/domob/android/ads/g$c;

    return-object v0
.end method
