.class Lcn/domob/wall/core/a/b$8;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/wall/core/a/b;->g()Landroid/webkit/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/wall/core/a/b;


# direct methods
.method constructor <init>(Lcn/domob/wall/core/a/b;)V
    .registers 2

    .prologue
    .line 404
    iput-object p1, p0, Lcn/domob/wall/core/a/b$8;->a:Lcn/domob/wall/core/a/b;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 407
    iget-object v0, p0, Lcn/domob/wall/core/a/b$8;->a:Lcn/domob/wall/core/a/b;

    invoke-static {v0}, Lcn/domob/wall/core/a/b;->j(Lcn/domob/wall/core/a/b;)V

    .line 408
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 409
    return-void
.end method
