.class public Lcom/lidroid/xutils/http/callback/StringDownloadHandler;
.super Ljava/lang/Object;
.source "StringDownloadHandler.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleEntity(Lorg/apache/http/HttpEntity;Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "callBackHandler"    # Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v6, 0x1

    .line 30
    if-nez p1, :cond_6

    move-object v1, v10

    .line 60
    :goto_5
    return-object v1

    .line 32
    :cond_6
    const-wide/16 v4, 0x0

    .line 33
    .local v4, "current":J
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    .line 35
    .local v2, "total":J
    if-eqz p2, :cond_17

    move-object v1, p2

    invoke-interface/range {v1 .. v6}, Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;->updateProgress(JJZ)Z

    move-result v1

    if-nez v1, :cond_17

    move-object v1, v10

    .line 36
    goto :goto_5

    .line 39
    :cond_17
    const/4 v0, 0x0

    .line 40
    .local v0, "inputStream":Ljava/io/InputStream;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .local v9, "sb":Ljava/lang/StringBuilder;
    :try_start_1d
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 43
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0, p3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v8, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 44
    .local v8, "reader":Ljava/io/BufferedReader;
    const-string v7, ""

    .line 45
    .local v7, "line":Ljava/lang/String;
    :cond_2d
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_46

    .line 54
    :goto_33
    if-eqz p2, :cond_3a

    .line 55
    const/4 v6, 0x1

    move-object v1, p2

    invoke-interface/range {v1 .. v6}, Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;->updateProgress(JJZ)Z
    :try_end_3a
    .catchall {:try_start_1d .. :try_end_3a} :catchall_5f

    .line 58
    :cond_3a
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 60
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_5

    .line 46
    :cond_46
    :try_start_46
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v6, 0xa

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    invoke-static {v7, p3}, Lcom/lidroid/xutils/util/OtherUtils;->sizeOfString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v10

    add-long/2addr v4, v10

    .line 48
    if-eqz p2, :cond_2d

    .line 49
    const/4 v6, 0x0

    move-object v1, p2

    invoke-interface/range {v1 .. v6}, Lcom/lidroid/xutils/http/callback/RequestCallBackHandler;->updateProgress(JJZ)Z
    :try_end_5b
    .catchall {:try_start_46 .. :try_end_5b} :catchall_5f

    move-result v1

    if-nez v1, :cond_2d

    goto :goto_33

    .line 57
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "reader":Ljava/io/BufferedReader;
    :catchall_5f
    move-exception v1

    .line 58
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 59
    throw v1
.end method
