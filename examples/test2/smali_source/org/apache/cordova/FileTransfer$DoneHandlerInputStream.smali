.class final Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;
.super Ljava/io/FilterInputStream;
.source "FileTransfer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/cordova/FileTransfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DoneHandlerInputStream"
.end annotation


# instance fields
.field private done:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 110
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 111
    return-void
.end method


# virtual methods
.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 115
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_c

    move v0, v1

    .line 116
    .local v0, "result":I
    :goto_6
    if-ne v0, v1, :cond_11

    const/4 v1, 0x1

    :goto_9
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 117
    return v0

    .line 115
    .end local v0    # "result":I
    :cond_c
    invoke-super {p0}, Ljava/io/FilterInputStream;->read()I

    move-result v0

    goto :goto_6

    .line 116
    .restart local v0    # "result":I
    :cond_11
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public read([B)I
    .registers 5
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 122
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_c

    move v0, v1

    .line 123
    .local v0, "result":I
    :goto_6
    if-ne v0, v1, :cond_11

    const/4 v1, 0x1

    :goto_9
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 124
    return v0

    .line 122
    .end local v0    # "result":I
    :cond_c
    invoke-super {p0, p1}, Ljava/io/FilterInputStream;->read([B)I

    move-result v0

    goto :goto_6

    .line 123
    .restart local v0    # "result":I
    :cond_11
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public read([BII)I
    .registers 7
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 129
    iget-boolean v2, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    if-eqz v2, :cond_c

    move v0, v1

    .line 130
    .local v0, "result":I
    :goto_6
    if-ne v0, v1, :cond_11

    const/4 v1, 0x1

    :goto_9
    iput-boolean v1, p0, Lorg/apache/cordova/FileTransfer$DoneHandlerInputStream;->done:Z

    .line 131
    return v0

    .line 129
    .end local v0    # "result":I
    :cond_c
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterInputStream;->read([BII)I

    move-result v0

    goto :goto_6

    .line 130
    .restart local v0    # "result":I
    :cond_11
    const/4 v1, 0x0

    goto :goto_9
.end method