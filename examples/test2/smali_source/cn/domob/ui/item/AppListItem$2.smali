.class Lcn/domob/ui/item/AppListItem$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/domob/wall/core/DService$OnImageDownload;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/ui/item/AppListItem;->bindBannerViews(Landroid/view/View;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/ui/item/AppListItem;


# direct methods
.method constructor <init>(Lcn/domob/ui/item/AppListItem;)V
    .registers 2

    .prologue
    .line 212
    iput-object p1, p0, Lcn/domob/ui/item/AppListItem$2;->a:Lcn/domob/ui/item/AppListItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadFail(Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 224
    # getter for: Lcn/domob/ui/item/AppListItem;->mLogger:Lcn/domob/ui/main/Logger;
    invoke-static {}, Lcn/domob/ui/item/AppListItem;->access$300()Lcn/domob/ui/main/Logger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get img fails"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/domob/ui/main/Logger;->errorLog(Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public onDownloadSuc(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 215
    invoke-virtual {p3}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 216
    if-eqz p1, :cond_f

    .line 217
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 220
    :cond_f
    return-void
.end method
