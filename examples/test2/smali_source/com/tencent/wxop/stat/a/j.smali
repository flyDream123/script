.class public Lcom/tencent/wxop/stat/a/j;
.super Lcom/tencent/wxop/stat/a/e;


# static fields
.field private static a:Ljava/lang/String;


# instance fields
.field private m:Ljava/lang/String;

.field private n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    sput-object v0, Lcom/tencent/wxop/stat/a/j;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILcom/tencent/wxop/stat/StatSpecifyReportedInfo;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/wxop/stat/a/e;-><init>(Landroid/content/Context;ILcom/tencent/wxop/stat/StatSpecifyReportedInfo;)V

    iput-object v0, p0, Lcom/tencent/wxop/stat/a/j;->m:Ljava/lang/String;

    iput-object v0, p0, Lcom/tencent/wxop/stat/a/j;->n:Ljava/lang/String;

    invoke-static {p1}, Lcom/tencent/wxop/stat/a;->a(Landroid/content/Context;)Lcom/tencent/wxop/stat/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/wxop/stat/a;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/wxop/stat/a/j;->m:Ljava/lang/String;

    sget-object v0, Lcom/tencent/wxop/stat/a/j;->a:Ljava/lang/String;

    if-nez v0, :cond_1c

    invoke-static {p1}, Lcom/tencent/wxop/stat/common/k;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tencent/wxop/stat/a/j;->a:Ljava/lang/String;

    :cond_1c
    return-void
.end method


# virtual methods
.method public a()Lcom/tencent/wxop/stat/a/f;
    .registers 2

    sget-object v0, Lcom/tencent/wxop/stat/a/f;->h:Lcom/tencent/wxop/stat/a/f;

    return-object v0
.end method

.method public a(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/tencent/wxop/stat/a/j;->n:Ljava/lang/String;

    return-void
.end method

.method public a(Lorg/json/JSONObject;)Z
    .registers 4

    const-string v0, "op"

    sget-object v1, Lcom/tencent/wxop/stat/a/j;->a:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/tencent/wxop/stat/common/q;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cn"

    iget-object v1, p0, Lcom/tencent/wxop/stat/a/j;->m:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/tencent/wxop/stat/common/q;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "sp"

    iget-object v1, p0, Lcom/tencent/wxop/stat/a/j;->n:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v0, 0x1

    return v0
.end method
