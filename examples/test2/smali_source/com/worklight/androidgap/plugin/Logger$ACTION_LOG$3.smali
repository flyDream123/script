.class final enum Lcom/worklight/androidgap/plugin/Logger$ACTION_LOG$3;
.super Lcom/worklight/androidgap/plugin/Logger$ACTION_LOG;
.source "Logger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/worklight/androidgap/plugin/Logger$ACTION_LOG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/worklight/androidgap/plugin/Logger$ACTION_LOG;-><init>(Ljava/lang/String;ILcom/worklight/androidgap/plugin/Logger$1;)V

    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-void
.end method
