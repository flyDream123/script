.class final Lcom/tencent/wxop/stat/m;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/tencent/wxop/stat/StatSpecifyReportedInfo;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/tencent/wxop/stat/StatSpecifyReportedInfo;)V
    .registers 3

    iput-object p1, p0, Lcom/tencent/wxop/stat/m;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/tencent/wxop/stat/m;->b:Lcom/tencent/wxop/stat/StatSpecifyReportedInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-object v0, p0, Lcom/tencent/wxop/stat/m;->a:Landroid/content/Context;

    if-nez v0, :cond_e

    invoke-static {}, Lcom/tencent/wxop/stat/StatServiceImpl;->f()Lcom/tencent/wxop/stat/common/StatLogger;

    move-result-object v0

    const-string v1, "The Context of StatService.onPause() can not be null!"

    invoke-virtual {v0, v1}, Lcom/tencent/wxop/stat/common/StatLogger;->error(Ljava/lang/Object;)V

    :goto_d
    return-void

    :cond_e
    iget-object v0, p0, Lcom/tencent/wxop/stat/m;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/tencent/wxop/stat/m;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/tencent/wxop/stat/common/k;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/tencent/wxop/stat/m;->b:Lcom/tencent/wxop/stat/StatSpecifyReportedInfo;

    invoke-static {v0, v1, v2}, Lcom/tencent/wxop/stat/StatServiceImpl;->trackEndPage(Landroid/content/Context;Ljava/lang/String;Lcom/tencent/wxop/stat/StatSpecifyReportedInfo;)V

    goto :goto_d
.end method
