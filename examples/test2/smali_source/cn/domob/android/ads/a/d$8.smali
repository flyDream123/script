.class Lcn/domob/android/ads/a/d$8;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/android/ads/a/d;->g()Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/android/ads/a/d;


# direct methods
.method constructor <init>(Lcn/domob/android/ads/a/d;)V
    .registers 2

    .prologue
    .line 369
    iput-object p1, p0, Lcn/domob/android/ads/a/d$8;->a:Lcn/domob/android/ads/a/d;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .registers 5
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "callback"    # Landroid/webkit/GeolocationPermissions$Callback;

    .prologue
    .line 379
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 380
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 381
    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 372
    iget-object v0, p0, Lcn/domob/android/ads/a/d$8;->a:Lcn/domob/android/ads/a/d;

    invoke-static {v0}, Lcn/domob/android/ads/a/d;->j(Lcn/domob/android/ads/a/d;)V

    .line 373
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 374
    return-void
.end method
