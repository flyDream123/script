.class public Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;
.super Lcom/lidroid/xutils/bitmap/download/Downloader;
.source "DefaultDownloader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/lidroid/xutils/bitmap/download/Downloader;-><init>()V

    return-void
.end method


# virtual methods
.method public downloadToStream(Ljava/lang/String;Ljava/io/OutputStream;Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;)J
    .registers 28
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/OutputStream;",
            "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask",
            "<*>;)J"
        }
    .end annotation

    .prologue
    .line 40
    .local p3, "task":Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;, "Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask<*>;"
    if-eqz p3, :cond_e

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v20

    if-nez v20, :cond_e

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;

    move-result-object v20

    if-nez v20, :cond_11

    :cond_e
    const-wide/16 v16, -0x1

    .line 90
    :goto_10
    return-wide v16

    .line 42
    :cond_11
    const/16 v19, 0x0

    .line 43
    .local v19, "urlConnection":Ljava/net/URLConnection;
    const/4 v4, 0x0

    .line 45
    .local v4, "bis":Ljava/io/BufferedInputStream;
    invoke-static {}, Lcom/lidroid/xutils/util/OtherUtils;->trustAllHttpsURLConnection()V

    .line 47
    const-wide/16 v16, -0x1

    .line 48
    .local v16, "result":J
    const-wide/16 v12, 0x0

    .line 49
    .local v12, "fileLen":J
    const-wide/16 v8, 0x0

    .line 51
    .local v8, "currCount":J
    :try_start_1d
    const-string v20, "/"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_59

    .line 52
    new-instance v10, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 53
    .local v10, "fileInputStream":Ljava/io/FileInputStream;
    invoke-virtual {v10}, Ljava/io/FileInputStream;->available()I

    move-result v20

    move/from16 v0, v20

    int-to-long v12, v0

    .line 54
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_3c} :catch_11f
    .catchall {:try_start_1d .. :try_end_3c} :catchall_130

    .line 55
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .local v5, "bis":Ljava/io/BufferedInputStream;
    :try_start_3c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultExpiry()J
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_43} :catch_138
    .catchall {:try_start_3c .. :try_end_43} :catchall_135

    move-result-wide v22

    add-long v16, v20, v22

    move-object v4, v5

    .line 72
    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    :goto_47
    :try_start_47
    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v20

    if-nez v20, :cond_53

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_50} :catch_11f
    .catchall {:try_start_47 .. :try_end_50} :catchall_130

    move-result-object v20

    if-nez v20, :cond_da

    .line 88
    :cond_53
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 72
    const-wide/16 v16, -0x1

    goto :goto_10

    .line 56
    :cond_59
    :try_start_59
    const-string v20, "assets/"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_94

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v20

    const/16 v21, 0x7

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v22

    move-object/from16 v0, p1

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v11

    .line 58
    .local v11, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v11}, Ljava/io/InputStream;->available()I

    move-result v20

    move/from16 v0, v20

    int-to-long v12, v0

    .line 59
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-direct {v5, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 60
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    const-wide v16, 0x7fffffffffffffffL

    move-object v4, v5

    .line 61
    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_47

    .line 62
    .end local v11    # "inputStream":Ljava/io/InputStream;
    :cond_94
    new-instance v18, Ljava/net/URL;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 63
    .local v18, "url":Ljava/net/URL;
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v19

    .line 64
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultConnectTimeout()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 65
    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultReadTimeout()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 66
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual/range {v19 .. v19}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_ba
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_ba} :catch_11f
    .catchall {:try_start_59 .. :try_end_ba} :catchall_130

    .line 67
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :try_start_ba
    invoke-virtual/range {v19 .. v19}, Ljava/net/URLConnection;->getExpiration()J

    move-result-wide v16

    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    cmp-long v20, v16, v20

    if-gez v20, :cond_d0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    invoke-virtual/range {p0 .. p0}, Lcom/lidroid/xutils/bitmap/download/DefaultDownloader;->getDefaultExpiry()J

    move-result-wide v22

    add-long v16, v20, v22

    .line 69
    :cond_d0
    invoke-virtual/range {v19 .. v19}, Ljava/net/URLConnection;->getContentLength()I
    :try_end_d3
    .catch Ljava/lang/Throwable; {:try_start_ba .. :try_end_d3} :catch_138
    .catchall {:try_start_ba .. :try_end_d3} :catchall_135

    move-result v20

    move/from16 v0, v20

    int-to-long v12, v0

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto/16 :goto_47

    .line 74
    .end local v18    # "url":Ljava/net/URL;
    :cond_da
    const/16 v20, 0x1000

    :try_start_dc
    move/from16 v0, v20

    new-array v6, v0, [B

    .line 75
    .local v6, "buffer":[B
    const/4 v14, 0x0

    .line 76
    .local v14, "len":I
    new-instance v15, Ljava/io/BufferedOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v15, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 77
    .local v15, "out":Ljava/io/BufferedOutputStream;
    :goto_e8
    invoke-virtual {v4, v6}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v14

    const/16 v20, -0x1

    move/from16 v0, v20

    if-ne v14, v0, :cond_fa

    .line 83
    invoke-virtual {v15}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_f5
    .catch Ljava/lang/Throwable; {:try_start_dc .. :try_end_f5} :catch_11f
    .catchall {:try_start_dc .. :try_end_f5} :catchall_130

    .line 88
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_10

    .line 78
    :cond_fa
    const/16 v20, 0x0

    :try_start_fc
    move/from16 v0, v20

    invoke-virtual {v15, v6, v0, v14}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 79
    int-to-long v0, v14

    move-wide/from16 v20, v0

    add-long v8, v8, v20

    .line 80
    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->isCancelled()Z

    move-result v20

    if-nez v20, :cond_112

    invoke-virtual/range {p3 .. p3}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->getTargetContainer()Landroid/view/View;
    :try_end_10f
    .catch Ljava/lang/Throwable; {:try_start_fc .. :try_end_10f} :catch_11f
    .catchall {:try_start_fc .. :try_end_10f} :catchall_130

    move-result-object v20

    if-nez v20, :cond_119

    .line 88
    :cond_112
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 80
    const-wide/16 v16, -0x1

    goto/16 :goto_10

    .line 81
    :cond_119
    :try_start_119
    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v13, v8, v9}, Lcom/lidroid/xutils/BitmapUtils$BitmapLoadTask;->updateProgress(JJ)V
    :try_end_11e
    .catch Ljava/lang/Throwable; {:try_start_119 .. :try_end_11e} :catch_11f
    .catchall {:try_start_119 .. :try_end_11e} :catchall_130

    goto :goto_e8

    .line 84
    .end local v6    # "buffer":[B
    .end local v14    # "len":I
    .end local v15    # "out":Ljava/io/BufferedOutputStream;
    :catch_11f
    move-exception v7

    .line 85
    .local v7, "e":Ljava/lang/Throwable;
    :goto_120
    const-wide/16 v16, -0x1

    .line 86
    :try_start_122
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_12b
    .catchall {:try_start_122 .. :try_end_12b} :catchall_130

    .line 88
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_10

    .line 87
    .end local v7    # "e":Ljava/lang/Throwable;
    :catchall_130
    move-exception v20

    .line 88
    :goto_131
    invoke-static {v4}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 89
    throw v20

    .line 87
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :catchall_135
    move-exception v20

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_131

    .line 84
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "bis":Ljava/io/BufferedInputStream;
    :catch_138
    move-exception v7

    move-object v4, v5

    .end local v5    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_120
.end method
