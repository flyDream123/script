.class final Laq;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lf;

.field private synthetic a:Ljava/lang/String;


# direct methods
.method constructor <init>(Lf;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Laq;->a:Lf;

    iput-object p2, p0, Laq;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    new-instance v0, Lcom/arrownock/im/callback/AnIMMessageSentCallbackData;

    const/4 v1, 0x1

    new-instance v2, Lcom/arrownock/exception/ArrownockException;

    const-string v3, "Failed to send message, client is offline."

    const/16 v4, 0xc20

    invoke-direct {v2, v3, v4}, Lcom/arrownock/exception/ArrownockException;-><init>(Ljava/lang/String;I)V

    iget-object v3, p0, Laq;->a:Ljava/lang/String;

    const-wide/16 v4, -0x1

    invoke-direct/range {v0 .. v5}, Lcom/arrownock/im/callback/AnIMMessageSentCallbackData;-><init>(ZLcom/arrownock/exception/ArrownockException;Ljava/lang/String;J)V

    iget-object v1, p0, Laq;->a:Lf;

    invoke-static {v1}, Lf;->a(Lf;)Lcom/arrownock/im/callback/IAnIMCallback;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/arrownock/im/callback/IAnIMCallback;->messageSent(Lcom/arrownock/im/callback/AnIMMessageSentCallbackData;)V

    return-void
.end method
