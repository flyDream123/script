.class Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;
.super Ljava/lang/Object;
.source "Maps.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV2;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet;

.field final synthetic val$mapIterator:Ljava/util/Iterator;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;

    const v1, 0x2ae

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet;Ljava/util/Iterator;)V
    .registers 3

    .prologue
    .line 922
    .local p0, "this":Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;, "Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet.1;"
    iput-object p1, p0, Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;->this$1:Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet;

    iput-object p2, p0, Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;->val$mapIterator:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native hasNext()Z
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 922
    .local p0, "this":Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;, "Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet.1;"
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$TransformedEntriesMap$EntrySet$1;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public native next()Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV2;>;"
        }
    .end annotation
.end method

.method public native remove()V
.end method
