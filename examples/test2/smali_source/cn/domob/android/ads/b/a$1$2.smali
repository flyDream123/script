.class Lcn/domob/android/ads/b/a$1$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/domob/android/ads/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/android/ads/b/a$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/android/ads/b/a$1;


# direct methods
.method constructor <init>(Lcn/domob/android/ads/b/a$1;)V
    .registers 2

    .prologue
    .line 117
    iput-object p1, p0, Lcn/domob/android/ads/b/a$1$2;->a:Lcn/domob/android/ads/b/a$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcn/domob/android/ads/a;Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 120
    invoke-static {}, Lcn/domob/android/ads/b/a;->n()Lcn/domob/android/i/f;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MRAID WebView \u62e6\u622a\u5230 URL\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/domob/android/i/f;->b(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcn/domob/android/ads/b/a$1$2;->a:Lcn/domob/android/ads/b/a$1;

    iget-object v0, v0, Lcn/domob/android/ads/b/a$1;->b:Lcn/domob/android/ads/b/a;

    const/4 v1, 0x1

    invoke-static {v0, p1, p2, v1}, Lcn/domob/android/ads/b/a;->a(Lcn/domob/android/ads/b/a;Landroid/webkit/WebView;Ljava/lang/String;Z)Z

    .line 122
    return-void
.end method
