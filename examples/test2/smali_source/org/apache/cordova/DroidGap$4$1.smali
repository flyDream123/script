.class Lorg/apache/cordova/DroidGap$4$1;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/DroidGap$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/cordova/DroidGap$4;


# direct methods
.method constructor <init>(Lorg/apache/cordova/DroidGap$4;)V
    .registers 2

    .prologue
    .line 927
    iput-object p1, p0, Lorg/apache/cordova/DroidGap$4$1;->this$1:Lorg/apache/cordova/DroidGap$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 929
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 930
    iget-object v0, p0, Lorg/apache/cordova/DroidGap$4$1;->this$1:Lorg/apache/cordova/DroidGap$4;

    iget-boolean v0, v0, Lorg/apache/cordova/DroidGap$4;->val$exit:Z

    if-eqz v0, :cond_10

    .line 931
    iget-object v0, p0, Lorg/apache/cordova/DroidGap$4$1;->this$1:Lorg/apache/cordova/DroidGap$4;

    iget-object v0, v0, Lorg/apache/cordova/DroidGap$4;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v0}, Lorg/apache/cordova/DroidGap;->endActivity()V

    .line 933
    :cond_10
    return-void
.end method
