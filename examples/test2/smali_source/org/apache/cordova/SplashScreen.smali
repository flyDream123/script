.class public Lorg/apache/cordova/SplashScreen;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "SplashScreen.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .registers 7
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;

    .prologue
    .line 30
    const-string v0, "hide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 31
    iget-object v0, p0, Lorg/apache/cordova/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "splashscreen"

    const-string v2, "hide"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    :goto_11
    invoke-virtual {p3}, Lorg/apache/cordova/api/CallbackContext;->success()V

    .line 40
    const/4 v0, 0x1

    :goto_15
    return v0

    .line 32
    :cond_16
    const-string v0, "show"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 33
    iget-object v0, p0, Lorg/apache/cordova/SplashScreen;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "splashscreen"

    const-string v2, "show"

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_11

    .line 36
    :cond_28
    const/4 v0, 0x0

    goto :goto_15
.end method
