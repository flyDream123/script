.class public Lcn/domob/wall/core/download/h;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field private static a:Lcn/domob/wall/core/h/d; = null

.field private static final b:I = 0x2800

.field private static final l:I = 0x9c40

.field private static final m:I = 0xea60

.field private static final n:I = 0x1e


# instance fields
.field private c:Ljava/net/URL;

.field private d:Ljava/io/File;

.field private e:J

.field private f:J

.field private g:J

.field private h:Z

.field private i:J

.field private j:Lcn/domob/wall/core/download/f$a;

.field private k:Lcn/domob/wall/core/download/e;

.field private o:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 17
    new-instance v0, Lcn/domob/wall/core/h/d;

    const-class v1, Lcn/domob/wall/core/download/h;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcn/domob/wall/core/h/d;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    return-void
.end method

.method constructor <init>(Ljava/net/URL;Ljava/io/File;JJLcn/domob/wall/core/download/f$a;Lcn/domob/wall/core/download/e;Landroid/content/Context;)V
    .registers 15

    .prologue
    const-wide/16 v2, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/domob/wall/core/download/h;->h:Z

    .line 34
    iput-wide v2, p0, Lcn/domob/wall/core/download/h;->i:J

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lcn/domob/wall/core/download/h;->o:Landroid/content/Context;

    .line 52
    iput-object p1, p0, Lcn/domob/wall/core/download/h;->c:Ljava/net/URL;

    .line 54
    iput-object p2, p0, Lcn/domob/wall/core/download/h;->d:Ljava/io/File;

    .line 56
    iput-wide p3, p0, Lcn/domob/wall/core/download/h;->e:J

    .line 58
    iput-wide p3, p0, Lcn/domob/wall/core/download/h;->g:J

    .line 60
    iput-wide p5, p0, Lcn/domob/wall/core/download/h;->f:J

    .line 62
    iput-object p7, p0, Lcn/domob/wall/core/download/h;->j:Lcn/domob/wall/core/download/f$a;

    .line 64
    iput-object p8, p0, Lcn/domob/wall/core/download/h;->k:Lcn/domob/wall/core/download/e;

    .line 66
    iput-wide p3, p0, Lcn/domob/wall/core/download/h;->i:J

    .line 68
    iput-object p9, p0, Lcn/domob/wall/core/download/h;->o:Landroid/content/Context;

    .line 70
    cmp-long v0, p3, p5

    if-lez v0, :cond_31

    cmp-long v0, p5, v2

    if-lez v0, :cond_31

    .line 71
    sget-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v1, "Start postition is larger than end position, set finished to true"

    invoke-virtual {v0, p0, v1}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/domob/wall/core/download/h;->h:Z

    .line 75
    :cond_31
    sget-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "download st:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ed:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    .prologue
    .line 199
    iget-boolean v0, p0, Lcn/domob/wall/core/download/h;->h:Z

    return v0
.end method

.method public b()J
    .registers 3

    .prologue
    .line 205
    iget-wide v0, p0, Lcn/domob/wall/core/download/h;->i:J

    return-wide v0
.end method

.method public run()V
    .registers 13

    .prologue
    const/16 v0, 0x2800

    const-wide/16 v6, 0x0

    .line 83
    .line 87
    new-array v1, v0, [B

    .line 93
    :try_start_6
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->o:Landroid/content/Context;

    invoke-static {v0}, Lcn/domob/wall/core/download/g;->b(Landroid/content/Context;)Ljava/net/Proxy;

    move-result-object v0

    .line 95
    if-eqz v0, :cond_d8

    .line 96
    sget-object v2, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v3, "Proxy exists"

    invoke-virtual {v2, p0, v3}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    iget-object v2, p0, Lcn/domob/wall/core/download/h;->c:Ljava/net/URL;

    invoke-virtual {v2, v0}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 102
    :goto_1d
    const v2, 0x9c40

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 103
    const v2, 0xea60

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 104
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setAllowUserInteraction(Z)V

    .line 108
    const-string v2, "Range"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bytes="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->e:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->f:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    new-instance v2, Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lcn/domob/wall/core/download/h;->d:Ljava/io/File;

    const-string v4, "rw"

    invoke-direct {v2, v3, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 114
    iget-object v3, p0, Lcn/domob/wall/core/download/h;->d:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/data/data/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 115
    sget-object v3, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "download in rom change chmod "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcn/domob/wall/core/download/h;->d:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "chmod 777 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcn/domob/wall/core/download/h;->d:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 117
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    .line 118
    invoke-virtual {v4, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 120
    :cond_ac
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0xce

    if-ne v3, v4, :cond_e9

    .line 121
    sget-object v3, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v4, "support range parameter,continue to download"

    invoke-virtual {v3, p0, v4}, Lcn/domob/wall/core/h/d;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->e:J

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 133
    :goto_c0
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 136
    :goto_c9
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->g:J

    iget-wide v6, p0, Lcn/domob/wall/core/download/h;->f:J

    cmp-long v0, v4, v6

    if-gez v0, :cond_11e

    .line 138
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->j:Lcn/domob/wall/core/download/f$a;

    iget-boolean v0, v0, Lcn/domob/wall/core/download/f$a;->a:Z

    if-eqz v0, :cond_114

    .line 195
    :goto_d7
    return-void

    .line 99
    :cond_d8
    sget-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v2, "Proxy is null"

    invoke-virtual {v0, p0, v2}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->c:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    goto/16 :goto_1d

    .line 125
    :cond_e9
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->e:J

    cmp-long v3, v4, v6

    if-lez v3, :cond_f6

    .line 126
    sget-object v3, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v4, "don\'t support range parameter,download from beginning"

    invoke-virtual {v3, p0, v4}, Lcn/domob/wall/core/h/d;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 128
    :cond_f6
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 129
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J

    .line 130
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcn/domob/wall/core/download/h;->g:J
    :try_end_103
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_103} :catch_104
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_103} :catch_142
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_103} :catch_19f

    goto :goto_c0

    .line 181
    :catch_104
    move-exception v0

    .line 182
    sget-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    const-string v1, "download SocketTimeoutException "

    invoke-virtual {v0, p0, v1}, Lcn/domob/wall/core/h/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->k:Lcn/domob/wall/core/download/e;

    const-string v1, "\u4e0b\u8f7d\u8fc7\u7a0b\u4e2d\u7f51\u7edc\u51fa\u73b0\u5f02\u5e38"

    invoke-interface {v0, v1}, Lcn/domob/wall/core/download/e;->a(Ljava/lang/String;)V

    goto :goto_d7

    .line 142
    :cond_114
    const/4 v0, 0x0

    const/16 v4, 0x2800

    :try_start_117
    invoke-virtual {v3, v1, v0, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v0

    .line 144
    const/4 v4, -0x1

    if-ne v0, v4, :cond_168

    .line 171
    :cond_11e
    sget-object v0, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Total downloadsize: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 175
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/domob/wall/core/download/h;->h:Z

    .line 177
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 179
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_141
    .catch Ljava/net/SocketTimeoutException; {:try_start_117 .. :try_end_141} :catch_104
    .catch Ljava/io/IOException; {:try_start_117 .. :try_end_141} :catch_142
    .catch Ljava/lang/Exception; {:try_start_117 .. :try_end_141} :catch_19f

    goto :goto_d7

    .line 184
    :catch_142
    move-exception v0

    .line 185
    sget-object v1, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "download IOException "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p0, v0}, Lcn/domob/wall/core/h/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 186
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->k:Lcn/domob/wall/core/download/e;

    const-string v1, "\u4e0b\u8f7d\u8fc7\u7a0b\u4e2d\u51fa\u73b0\u5f02\u5e38"

    invoke-interface {v0, v1}, Lcn/domob/wall/core/download/e;->a(Ljava/lang/String;)V

    goto/16 :goto_d7

    .line 150
    :cond_168
    const/4 v4, 0x0

    :try_start_169
    invoke-virtual {v2, v1, v4, v0}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 152
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->g:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcn/domob/wall/core/download/h;->g:J

    .line 154
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->g:J

    iget-wide v6, p0, Lcn/domob/wall/core/download/h;->f:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_1ca

    .line 155
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J

    int-to-long v6, v0

    iget-wide v8, p0, Lcn/domob/wall/core/download/h;->g:J

    iget-wide v10, p0, Lcn/domob/wall/core/download/h;->f:J

    sub-long/2addr v8, v10

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J
    :try_end_189
    .catch Ljava/net/SocketTimeoutException; {:try_start_169 .. :try_end_189} :catch_104
    .catch Ljava/io/IOException; {:try_start_169 .. :try_end_189} :catch_142
    .catch Ljava/lang/Exception; {:try_start_169 .. :try_end_189} :catch_19f

    .line 164
    :goto_189
    const-wide/16 v4, 0x1e

    :try_start_18b
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_18e
    .catch Ljava/lang/InterruptedException; {:try_start_18b .. :try_end_18e} :catch_190
    .catch Ljava/net/SocketTimeoutException; {:try_start_18b .. :try_end_18e} :catch_104
    .catch Ljava/io/IOException; {:try_start_18b .. :try_end_18e} :catch_142
    .catch Ljava/lang/Exception; {:try_start_18b .. :try_end_18e} :catch_19f

    goto/16 :goto_c9

    .line 165
    :catch_190
    move-exception v0

    .line 166
    :try_start_191
    sget-object v4, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    invoke-virtual {v4, v0}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Throwable;)V

    .line 167
    iget-object v0, p0, Lcn/domob/wall/core/download/h;->k:Lcn/domob/wall/core/download/e;

    const-string v4, "\u4e0b\u8f7d\u8fc7\u7a0b\u4e2d\u51fa\u73b0\u5f02\u5e38"

    invoke-interface {v0, v4}, Lcn/domob/wall/core/download/e;->a(Ljava/lang/String;)V
    :try_end_19d
    .catch Ljava/net/SocketTimeoutException; {:try_start_191 .. :try_end_19d} :catch_104
    .catch Ljava/io/IOException; {:try_start_191 .. :try_end_19d} :catch_142
    .catch Ljava/lang/Exception; {:try_start_191 .. :try_end_19d} :catch_19f

    goto/16 :goto_c9

    .line 189
    :catch_19f
    move-exception v0

    .line 190
    sget-object v1, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "download error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Lcn/domob/wall/core/h/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 191
    iget-object v1, p0, Lcn/domob/wall/core/download/h;->k:Lcn/domob/wall/core/download/e;

    const-string v2, "\u4e0b\u8f7d\u8fc7\u7a0b\u4e2d\u51fa\u73b0\u5f02\u5e38"

    invoke-interface {v1, v2}, Lcn/domob/wall/core/download/e;->a(Ljava/lang/String;)V

    .line 192
    sget-object v1, Lcn/domob/wall/core/download/h;->a:Lcn/domob/wall/core/h/d;

    invoke-virtual {v1, v0}, Lcn/domob/wall/core/h/d;->a(Ljava/lang/Throwable;)V

    goto/16 :goto_d7

    .line 157
    :cond_1ca
    :try_start_1ca
    iget-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcn/domob/wall/core/download/h;->i:J
    :try_end_1d0
    .catch Ljava/net/SocketTimeoutException; {:try_start_1ca .. :try_end_1d0} :catch_104
    .catch Ljava/io/IOException; {:try_start_1ca .. :try_end_1d0} :catch_142
    .catch Ljava/lang/Exception; {:try_start_1ca .. :try_end_1d0} :catch_19f

    goto :goto_189
.end method