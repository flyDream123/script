.class final Ldn;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:I

.field private synthetic a:Lcom/arrownock/push/IAnPushCallback;

.field private synthetic a:Ldf;

.field private synthetic a:Ljava/lang/String;

.field private synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(Ldf;Ljava/lang/String;Ljava/lang/String;ILcom/arrownock/push/IAnPushCallback;)V
    .registers 6

    iput-object p1, p0, Ldn;->a:Ldf;

    iput-object p2, p0, Ldn;->a:Ljava/lang/String;

    iput-object p3, p0, Ldn;->b:Ljava/lang/String;

    iput p4, p0, Ldn;->a:I

    iput-object p5, p0, Ldn;->a:Lcom/arrownock/push/IAnPushCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    :try_start_0
    iget-object v0, p0, Ldn;->a:Ldf;

    iget-object v1, p0, Ldn;->a:Ljava/lang/String;

    iget-object v2, p0, Ldn;->b:Ljava/lang/String;

    iget v3, p0, Ldn;->a:I

    invoke-static {v0, v1, v2, v3}, Ldf;->a(Ldf;Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Ldn;->a:Lcom/arrownock/push/IAnPushCallback;

    if-eqz v0, :cond_16

    iget-object v0, p0, Ldn;->a:Lcom/arrownock/push/IAnPushCallback;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/arrownock/push/IAnPushCallback;->setBadge(ZLcom/arrownock/exception/ArrownockException;)V
    :try_end_16
    .catch Lcom/arrownock/exception/ArrownockException; {:try_start_0 .. :try_end_16} :catch_17

    :cond_16
    :goto_16
    return-void

    :catch_17
    move-exception v0

    iget-object v1, p0, Ldn;->a:Lcom/arrownock/push/IAnPushCallback;

    if-eqz v1, :cond_16

    iget-object v1, p0, Ldn;->a:Lcom/arrownock/push/IAnPushCallback;

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Lcom/arrownock/push/IAnPushCallback;->setBadge(ZLcom/arrownock/exception/ArrownockException;)V

    goto :goto_16
.end method
