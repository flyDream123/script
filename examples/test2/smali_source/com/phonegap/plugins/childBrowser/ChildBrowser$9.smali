.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$9;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showErrorDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$9;

    const v1, 0x3d6

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$9;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    .line 896
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onClick(Landroid/content/DialogInterface;I)V
.end method
