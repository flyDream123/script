.class Lcn/domob/android/ads/DomobFeedsAdView$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/android/ads/DomobFeedsAdView$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/android/ads/DomobFeedsAdView$2;


# direct methods
.method constructor <init>(Lcn/domob/android/ads/DomobFeedsAdView$2;)V
    .registers 2

    .prologue
    .line 100
    iput-object p1, p0, Lcn/domob/android/ads/DomobFeedsAdView$2$1;->a:Lcn/domob/android/ads/DomobFeedsAdView$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 103
    iget-object v0, p0, Lcn/domob/android/ads/DomobFeedsAdView$2$1;->a:Lcn/domob/android/ads/DomobFeedsAdView$2;

    iget-object v0, v0, Lcn/domob/android/ads/DomobFeedsAdView$2;->b:Lcn/domob/android/ads/DomobFeedsAdView;

    invoke-virtual {v0}, Lcn/domob/android/ads/DomobFeedsAdView;->close()V

    .line 104
    return-void
.end method
