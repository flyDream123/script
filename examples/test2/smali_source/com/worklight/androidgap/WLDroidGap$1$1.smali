.class Lcom/worklight/androidgap/WLDroidGap$1$1;
.super Ljava/lang/Object;
.source "WLDroidGap.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/worklight/androidgap/WLDroidGap$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/worklight/androidgap/WLDroidGap$1;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/worklight/androidgap/WLDroidGap$1$1;

    const v1, 0x439

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/worklight/androidgap/WLDroidGap$1;)V
    .registers 2

    .prologue
    .line 166
    iput-object p1, p0, Lcom/worklight/androidgap/WLDroidGap$1$1;->this$1:Lcom/worklight/androidgap/WLDroidGap$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native onClick(Landroid/content/DialogInterface;I)V
.end method
