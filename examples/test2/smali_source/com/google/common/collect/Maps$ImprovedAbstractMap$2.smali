.class Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;
.super Lcom/google/common/collect/ForwardingCollection;
.source "Maps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Maps$ImprovedAbstractMap;->values()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingCollection",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Maps$ImprovedAbstractMap;

.field final synthetic val$delegate:Ljava/util/Collection;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;

    const v1, 0x2ab

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/Maps$ImprovedAbstractMap;Ljava/util/Collection;)V
    .registers 3

    .prologue
    .line 1472
    .local p0, "this":Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;, "Lcom/google/common/collect/Maps$ImprovedAbstractMap.2;"
    iput-object p1, p0, Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;->this$0:Lcom/google/common/collect/Maps$ImprovedAbstractMap;

    iput-object p2, p0, Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;->val$delegate:Ljava/util/Collection;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingCollection;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1472
    .local p0, "this":Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;, "Lcom/google/common/collect/Maps$ImprovedAbstractMap.2;"
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$ImprovedAbstractMap$2;->delegate()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method protected native delegate()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation
.end method

.method public native isEmpty()Z
.end method