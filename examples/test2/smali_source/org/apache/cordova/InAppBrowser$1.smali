.class Lorg/apache/cordova/InAppBrowser$1;
.super Ljava/lang/Object;
.source "InAppBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/InAppBrowser;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/InAppBrowser;

.field final synthetic val$callbackContext:Lorg/apache/cordova/api/CallbackContext;

.field final synthetic val$features:Ljava/util/HashMap;

.field final synthetic val$target:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/InAppBrowser;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lorg/apache/cordova/api/CallbackContext;)V
    .registers 6

    .prologue
    .line 112
    iput-object p1, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iput-object p2, p0, Lorg/apache/cordova/InAppBrowser$1;->val$target:Ljava/lang/String;

    iput-object p3, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$features:Ljava/util/HashMap;

    iput-object p5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 115
    const-string v3, ""

    .line 117
    .local v3, "result":Ljava/lang/String;
    const-string v4, "_self"

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$target:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a4

    .line 118
    const-string v4, "InAppBrowser"

    const-string v5, "in self"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    const-string v5, "file://"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2f

    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    const-string v5, "javascript:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2f

    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    invoke-static {v4}, Lorg/apache/cordova/Config;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_49

    .line 122
    :cond_2f
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iget-object v4, v4, Lorg/apache/cordova/InAppBrowser;->webView:Lorg/apache/cordova/CordovaWebView;

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 150
    :goto_38
    new-instance v2, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v2, v4, v3}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 151
    .local v2, "pluginResult":Lorg/apache/cordova/api/PluginResult;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 152
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v4, v2}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    .line 153
    return-void

    .line 125
    .end local v2    # "pluginResult":Lorg/apache/cordova/api/PluginResult;
    :cond_49
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    const-string v5, "tel:"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_99

    .line 128
    :try_start_53
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.DIAL"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 129
    .local v1, "intent":Landroid/content/Intent;
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 130
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iget-object v4, v4, Lorg/apache/cordova/InAppBrowser;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_6e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_53 .. :try_end_6e} :catch_6f

    goto :goto_38

    .line 131
    .end local v1    # "intent":Landroid/content/Intent;
    :catch_6f
    move-exception v0

    .line 132
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v4, "InAppBrowser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error dialing "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_38

    .line 137
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_99
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/cordova/InAppBrowser$1;->val$features:Ljava/util/HashMap;

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/InAppBrowser;->showWebPage(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v3

    goto :goto_38

    .line 141
    :cond_a4
    const-string v4, "_system"

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$target:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_bf

    .line 142
    const-string v4, "InAppBrowser"

    const-string v5, "in system"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/apache/cordova/InAppBrowser;->openExternal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_38

    .line 147
    :cond_bf
    const-string v4, "InAppBrowser"

    const-string v5, "in blank"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v4, p0, Lorg/apache/cordova/InAppBrowser$1;->this$0:Lorg/apache/cordova/InAppBrowser;

    iget-object v5, p0, Lorg/apache/cordova/InAppBrowser$1;->val$url:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/cordova/InAppBrowser$1;->val$features:Ljava/util/HashMap;

    invoke-virtual {v4, v5, v6}, Lorg/apache/cordova/InAppBrowser;->showWebPage(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_38
.end method
