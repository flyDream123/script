.class Lorg/apache/cordova/DroidGap$1;
.super Ljava/lang/Object;
.source "DroidGap.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/DroidGap;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/DroidGap;

.field final synthetic val$me:Lorg/apache/cordova/DroidGap;


# direct methods
.method constructor <init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;)V
    .registers 3

    .prologue
    .line 776
    iput-object p1, p0, Lorg/apache/cordova/DroidGap$1;->this$0:Lorg/apache/cordova/DroidGap;

    iput-object p2, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 778
    iget-object v0, p0, Lorg/apache/cordova/DroidGap$1;->val$me:Lorg/apache/cordova/DroidGap;

    const/4 v1, 0x0

    iput-object v1, v0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 779
    return-void
.end method
