.class Lcom/google/common/collect/RegularImmutableMap$KeySet;
.super Lcom/google/common/collect/ImmutableSet$TransformedImmutableSet;
.source "RegularImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/RegularImmutableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSet$TransformedImmutableSet",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;TK;>;"
    }
.end annotation


# instance fields
.field final map:Lcom/google/common/collect/RegularImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/RegularImmutableMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/collect/RegularImmutableMap$KeySet;

    const v1, 0x2f5

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/RegularImmutableMap;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/RegularImmutableMap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, "this":Lcom/google/common/collect/RegularImmutableMap$KeySet;, "Lcom/google/common/collect/RegularImmutableMap$KeySet<TK;TV;>;"
    .local p1, "map":Lcom/google/common/collect/RegularImmutableMap;, "Lcom/google/common/collect/RegularImmutableMap<TK;TV;>;"
    # getter for: Lcom/google/common/collect/RegularImmutableMap;->entries:[Lcom/google/common/collect/RegularImmutableMap$LinkedEntry;
    invoke-static {p1}, Lcom/google/common/collect/RegularImmutableMap;->access$000(Lcom/google/common/collect/RegularImmutableMap;)[Lcom/google/common/collect/RegularImmutableMap$LinkedEntry;

    move-result-object v0

    # getter for: Lcom/google/common/collect/RegularImmutableMap;->keySetHashCode:I
    invoke-static {p1}, Lcom/google/common/collect/RegularImmutableMap;->access$100(Lcom/google/common/collect/RegularImmutableMap;)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/common/collect/ImmutableSet$TransformedImmutableSet;-><init>([Ljava/lang/Object;I)V

    .line 230
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMap$KeySet;->map:Lcom/google/common/collect/RegularImmutableMap;

    .line 231
    return-void
.end method


# virtual methods
.method public native contains(Ljava/lang/Object;)Z
.end method

.method native isPartialView()Z
.end method

.method bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 223
    .local p0, "this":Lcom/google/common/collect/RegularImmutableMap$KeySet;, "Lcom/google/common/collect/RegularImmutableMap$KeySet<TK;TV;>;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableMap$KeySet;->transform(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method native transform(Ljava/util/Map$Entry;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)TK;"
        }
    .end annotation
.end method