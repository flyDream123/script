.class Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;
.super Ljava/lang/Object;
.source "ChildBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/phonegap/plugins/childBrowser/ChildBrowser;->showTaoBaoView(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

.field private final synthetic val$title:Ljava/lang/String;

.field private final synthetic val$url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;

    const v1, 0x3d1

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/phonegap/plugins/childBrowser/ChildBrowser;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    iput-object p2, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;->val$title:Ljava/lang/String;

    .line 526
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;)Lcom/phonegap/plugins/childBrowser/ChildBrowser;
    .registers 2

    .prologue
    .line 526
    iget-object v0, p0, Lcom/phonegap/plugins/childBrowser/ChildBrowser$5;->this$0:Lcom/phonegap/plugins/childBrowser/ChildBrowser;

    return-object v0
.end method


# virtual methods
.method public native run()V
.end method
