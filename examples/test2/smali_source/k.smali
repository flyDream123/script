.class final Lk;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lf;

.field private synthetic a:Ljava/lang/String;

.field private synthetic b:Ljava/lang/String;

.field private synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Lf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    iput-object p1, p0, Lk;->a:Lf;

    iput-object p2, p0, Lk;->a:Ljava/lang/String;

    iput-object p3, p0, Lk;->b:Ljava/lang/String;

    iput-object p4, p0, Lk;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    :try_start_0
    iget-object v0, p0, Lk;->a:Lf;

    iget-object v1, p0, Lk;->a:Ljava/lang/String;

    iget-object v2, p0, Lk;->b:Ljava/lang/String;

    iget-object v3, p0, Lk;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lf;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lk;->a:Lf;

    invoke-static {v0}, Lf;->a(Lf;)Lcom/arrownock/im/callback/IAnIMCallback;

    move-result-object v0

    if-eqz v0, :cond_23

    new-instance v0, Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;-><init>(ZLcom/arrownock/exception/ArrownockException;)V

    iget-object v1, p0, Lk;->a:Lf;

    invoke-static {v1}, Lf;->a(Lf;)Lcom/arrownock/im/callback/IAnIMCallback;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/arrownock/im/callback/IAnIMCallback;->addClientsToTopic(Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;)V
    :try_end_23
    .catch Lcom/arrownock/exception/ArrownockException; {:try_start_0 .. :try_end_23} :catch_24

    :cond_23
    :goto_23
    return-void

    :catch_24
    move-exception v0

    iget-object v1, p0, Lk;->a:Lf;

    invoke-static {v1}, Lf;->a(Lf;)Lcom/arrownock/im/callback/IAnIMCallback;

    move-result-object v1

    if-eqz v1, :cond_23

    new-instance v1, Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;-><init>(ZLcom/arrownock/exception/ArrownockException;)V

    iget-object v0, p0, Lk;->a:Lf;

    invoke-static {v0}, Lf;->a(Lf;)Lcom/arrownock/im/callback/IAnIMCallback;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/arrownock/im/callback/IAnIMCallback;->addClientsToTopic(Lcom/arrownock/im/callback/AnIMAddClientsCallbackData;)V

    goto :goto_23
.end method
