.class Lcn/domob/android/offerwall/DomobActivity$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/domob/android/offerwall/DomobActivity;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/domob/android/offerwall/DomobActivity;


# direct methods
.method constructor <init>(Lcn/domob/android/offerwall/DomobActivity;)V
    .registers 2

    iput-object p1, p0, Lcn/domob/android/offerwall/DomobActivity$3;->a:Lcn/domob/android/offerwall/DomobActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    iget-object v0, p0, Lcn/domob/android/offerwall/DomobActivity$3;->a:Lcn/domob/android/offerwall/DomobActivity;

    invoke-virtual {v0}, Lcn/domob/android/offerwall/DomobActivity;->finish()V

    return-void
.end method
