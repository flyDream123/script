.class Lcom/google/common/collect/StandardTable$Column$Values$1;
.super Ljava/lang/Object;
.source "StandardTable.java"

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/StandardTable$Column$Values;->removeAll(Ljava/util/Collection;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate",
        "<",
        "Ljava/util/Map$Entry",
        "<TR;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/google/common/collect/StandardTable$Column$Values;

.field final synthetic val$c:Ljava/util/Collection;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/collect/StandardTable$Column$Values$1;

    const v1, 0x32b

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/StandardTable$Column$Values;Ljava/util/Collection;)V
    .registers 3

    .prologue
    .line 662
    .local p0, "this":Lcom/google/common/collect/StandardTable$Column$Values$1;, "Lcom/google/common/collect/StandardTable$Column$Values.1;"
    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Column$Values$1;->this$2:Lcom/google/common/collect/StandardTable$Column$Values;

    iput-object p2, p0, Lcom/google/common/collect/StandardTable$Column$Values$1;->val$c:Ljava/util/Collection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 662
    .local p0, "this":Lcom/google/common/collect/StandardTable$Column$Values$1;, "Lcom/google/common/collect/StandardTable$Column$Values.1;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/google/common/collect/StandardTable$Column$Values$1;->apply(Ljava/util/Map$Entry;)Z

    move-result v0

    return v0
.end method

.method public native apply(Ljava/util/Map$Entry;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TR;TV;>;)Z"
        }
    .end annotation
.end method
