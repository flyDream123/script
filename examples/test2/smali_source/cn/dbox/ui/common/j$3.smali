.class Lcn/dbox/ui/common/j$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/dbox/ui/common/j;->a(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/dbox/ui/common/j;


# direct methods
.method constructor <init>(Lcn/dbox/ui/common/j;)V
    .registers 2

    .prologue
    .line 81
    iput-object p1, p0, Lcn/dbox/ui/common/j$3;->a:Lcn/dbox/ui/common/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 85
    iget-object v0, p0, Lcn/dbox/ui/common/j$3;->a:Lcn/dbox/ui/common/j;

    invoke-static {v0}, Lcn/dbox/ui/common/j;->a(Lcn/dbox/ui/common/j;)Lcn/dbox/ui/d/g;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 86
    iget-object v0, p0, Lcn/dbox/ui/common/j$3;->a:Lcn/dbox/ui/common/j;

    invoke-static {v0}, Lcn/dbox/ui/common/j;->a(Lcn/dbox/ui/common/j;)Lcn/dbox/ui/d/g;

    move-result-object v0

    invoke-interface {v0}, Lcn/dbox/ui/d/g;->a()V

    .line 88
    :cond_11
    return-void
.end method
