.class public abstract Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;
.super Lcom/worklight/wlclient/api/challengehandler/BaseChallengeHandler;
.source "WLChallengeHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/worklight/wlclient/api/challengehandler/BaseChallengeHandler",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "realm"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/worklight/wlclient/api/challengehandler/BaseChallengeHandler;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method public abstract handleFailure(Lorg/json/JSONObject;)V
.end method

.method public abstract handleSuccess(Lorg/json/JSONObject;)V
.end method

.method public submitChallengeAnswer(Ljava/lang/Object;)V
    .registers 4
    .param p1, "answer"    # Ljava/lang/Object;

    .prologue
    .line 34
    if-nez p1, :cond_f

    .line 36
    iget-object v0, p0, Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;->activeRequest:Lcom/worklight/wlclient/WLRequest;

    invoke-virtual {p0}, Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;->getRealm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/worklight/wlclient/WLRequest;->removeExpectedAnswer(Ljava/lang/String;)V

    .line 45
    :goto_b
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;->activeRequest:Lcom/worklight/wlclient/WLRequest;

    .line 47
    return-void

    .line 41
    :cond_f
    iget-object v0, p0, Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;->activeRequest:Lcom/worklight/wlclient/WLRequest;

    invoke-virtual {p0}, Lcom/worklight/wlclient/api/challengehandler/WLChallengeHandler;->getRealm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/worklight/wlclient/WLRequest;->submitAnswer(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_b
.end method
