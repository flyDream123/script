.class final Lcom/google/common/io/ByteStreams$1;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lcom/google/common/io/InputSupplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/ByteStreams;->newInputStreamSupplier([BII)Lcom/google/common/io/InputSupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/io/InputSupplier",
        "<",
        "Ljava/io/ByteArrayInputStream;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$b:[B

.field final synthetic val$len:I

.field final synthetic val$off:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/google/common/io/ByteStreams$1;

    const v1, 0x365

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>([BII)V
    .registers 4

    .prologue
    .line 76
    iput-object p1, p0, Lcom/google/common/io/ByteStreams$1;->val$b:[B

    iput p2, p0, Lcom/google/common/io/ByteStreams$1;->val$off:I

    iput p3, p0, Lcom/google/common/io/ByteStreams$1;->val$len:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native getInput()Ljava/io/ByteArrayInputStream;
.end method

.method public bridge synthetic getInput()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/google/common/io/ByteStreams$1;->getInput()Ljava/io/ByteArrayInputStream;

    move-result-object v0

    return-object v0
.end method
