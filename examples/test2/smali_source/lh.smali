.class public final Llh;
.super Lli;


# virtual methods
.method protected final a()B
    .registers 2

    const/4 v0, 0x2

    return v0
.end method

.method public final b()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljm;
        }
    .end annotation

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v0, 0x0

    :goto_b
    const/4 v3, 0x0

    array-length v3, v3

    if-ge v0, v3, :cond_16

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_16
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_19} :catch_1b

    move-result-object v0

    return-object v0

    :catch_1b
    move-exception v0

    new-instance v1, Ljm;

    invoke-direct {v1, v0}, Ljm;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected final b_()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljm;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iget v2, p0, Llh;->b:I

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeShort(I)V

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_15} :catch_17

    move-result-object v0

    return-object v0

    :catch_17
    move-exception v0

    new-instance v1, Ljm;

    invoke-direct {v1, v0}, Ljm;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
