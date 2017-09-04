.class public abstract Lcom/google/common/collect/AbstractLinkedIterator;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "AbstractLinkedIterator.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/UnmodifiableIterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private nextOrNull:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lcom/google/common/collect/AbstractLinkedIterator;, "Lcom/google/common/collect/AbstractLinkedIterator<TT;>;"
    .local p1, "firstOrNull":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    .line 47
    return-void
.end method


# virtual methods
.method protected abstract computeNext(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method

.method public final hasNext()Z
    .registers 2

    .prologue
    .line 59
    .local p0, "this":Lcom/google/common/collect/AbstractLinkedIterator;, "Lcom/google/common/collect/AbstractLinkedIterator<TT;>;"
    iget-object v0, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final next()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lcom/google/common/collect/AbstractLinkedIterator;, "Lcom/google/common/collect/AbstractLinkedIterator<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractLinkedIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    .line 65
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 68
    :cond_c
    :try_start_c
    iget-object v0, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_17

    .line 70
    iget-object v1, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/google/common/collect/AbstractLinkedIterator;->computeNext(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    return-object v0

    :catchall_17
    move-exception v0

    iget-object v1, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/google/common/collect/AbstractLinkedIterator;->computeNext(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/collect/AbstractLinkedIterator;->nextOrNull:Ljava/lang/Object;

    throw v0
.end method
