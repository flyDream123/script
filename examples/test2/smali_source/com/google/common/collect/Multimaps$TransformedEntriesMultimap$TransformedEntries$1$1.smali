.class Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;
.super Lcom/google/common/collect/AbstractMapEntry;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;->apply(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractMapEntry",
        "<TK;TV2;>;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;

.field final synthetic val$entry:Ljava/util/Map$Entry;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;

    const v1, 0x2cf

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;Ljava/util/Map$Entry;)V
    .registers 3

    .prologue
    .line 1422
    .local p0, "this":Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;, "Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1.1;"
    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;->this$2:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1;

    iput-object p2, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1$1;->val$entry:Ljava/util/Map$Entry;

    invoke-direct {p0}, Lcom/google/common/collect/AbstractMapEntry;-><init>()V

    return-void
.end method


# virtual methods
.method public native getKey()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation
.end method

.method public native getValue()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV2;"
        }
    .end annotation
.end method
