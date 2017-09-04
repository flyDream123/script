.class public abstract Lcom/google/common/collect/AbstractIterator;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "AbstractIterator.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/AbstractIterator$1;,
        Lcom/google/common/collect/AbstractIterator$State;
    }
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
.field private next:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private state:Lcom/google/common/collect/AbstractIterator$State;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 66
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    .line 63
    sget-object v0, Lcom/google/common/collect/AbstractIterator$State;->NOT_READY:Lcom/google/common/collect/AbstractIterator$State;

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    .line 66
    return-void
.end method

.method private tryToComputeNext()Z
    .registers 3

    .prologue
    .line 140
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    sget-object v0, Lcom/google/common/collect/AbstractIterator$State;->FAILED:Lcom/google/common/collect/AbstractIterator$State;

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    .line 141
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->computeNext()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->next:Ljava/lang/Object;

    .line 142
    iget-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    sget-object v1, Lcom/google/common/collect/AbstractIterator$State;->DONE:Lcom/google/common/collect/AbstractIterator$State;

    if-eq v0, v1, :cond_16

    .line 143
    sget-object v0, Lcom/google/common/collect/AbstractIterator$State;->READY:Lcom/google/common/collect/AbstractIterator$State;

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    .line 144
    const/4 v0, 0x1

    .line 146
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method


# virtual methods
.method protected abstract computeNext()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method protected final endOfData()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    sget-object v0, Lcom/google/common/collect/AbstractIterator$State;->DONE:Lcom/google/common/collect/AbstractIterator$State;

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    .line 123
    const/4 v0, 0x0

    return-object v0
.end method

.method public final hasNext()Z
    .registers 5

    .prologue
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 128
    iget-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    sget-object v3, Lcom/google/common/collect/AbstractIterator$State;->FAILED:Lcom/google/common/collect/AbstractIterator$State;

    if-eq v0, v3, :cond_1e

    move v0, v1

    :goto_9
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 129
    sget-object v0, Lcom/google/common/collect/AbstractIterator$1;->$SwitchMap$com$google$common$collect$AbstractIterator$State:[I

    iget-object v3, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    invoke-virtual {v3}, Lcom/google/common/collect/AbstractIterator$State;->ordinal()I

    move-result v3

    aget v0, v0, v3

    packed-switch v0, :pswitch_data_22

    .line 136
    invoke-direct {p0}, Lcom/google/common/collect/AbstractIterator;->tryToComputeNext()Z

    move-result v2

    :goto_1d
    :pswitch_1d
    return v2

    :cond_1e
    move v0, v2

    .line 128
    goto :goto_9

    :pswitch_20
    move v2, v1

    .line 133
    goto :goto_1d

    .line 129
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_1d
        :pswitch_20
    .end packed-switch
.end method

.method public final next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    .line 152
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 154
    :cond_c
    sget-object v0, Lcom/google/common/collect/AbstractIterator$State;->NOT_READY:Lcom/google/common/collect/AbstractIterator$State;

    iput-object v0, p0, Lcom/google/common/collect/AbstractIterator;->state:Lcom/google/common/collect/AbstractIterator$State;

    .line 155
    iget-object v0, p0, Lcom/google/common/collect/AbstractIterator;->next:Ljava/lang/Object;

    return-object v0
.end method

.method public final peek()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lcom/google/common/collect/AbstractIterator;, "Lcom/google/common/collect/AbstractIterator<TT;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    .line 167
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 169
    :cond_c
    iget-object v0, p0, Lcom/google/common/collect/AbstractIterator;->next:Ljava/lang/Object;

    return-object v0
.end method
