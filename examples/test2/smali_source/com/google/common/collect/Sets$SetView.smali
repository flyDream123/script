.class public abstract Lcom/google/common/collect/Sets$SetView;
.super Ljava/util/AbstractSet;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Sets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SetView"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet",
        "<TE;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 519
    .local p0, "this":Lcom/google/common/collect/Sets$SetView;, "Lcom/google/common/collect/Sets$SetView<TE;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/Sets$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/common/collect/Sets$1;

    .prologue
    .line 518
    .local p0, "this":Lcom/google/common/collect/Sets$SetView;, "Lcom/google/common/collect/Sets$SetView<TE;>;"
    invoke-direct {p0}, Lcom/google/common/collect/Sets$SetView;-><init>()V

    return-void
.end method


# virtual methods
.method public copyInto(Ljava/util/Set;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Ljava/util/Set",
            "<TE;>;>(TS;)TS;"
        }
    .end annotation

    .prologue
    .line 544
    .local p0, "this":Lcom/google/common/collect/Sets$SetView;, "Lcom/google/common/collect/Sets$SetView<TE;>;"
    .local p1, "set":Ljava/util/Set;, "TS;"
    invoke-interface {p1, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 545
    return-object p1
.end method

.method public immutableCopy()Lcom/google/common/collect/ImmutableSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 531
    .local p0, "this":Lcom/google/common/collect/Sets$SetView;, "Lcom/google/common/collect/Sets$SetView<TE;>;"
    invoke-static {p0}, Lcom/google/common/collect/ImmutableSet;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method
