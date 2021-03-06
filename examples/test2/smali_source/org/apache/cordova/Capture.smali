.class public Lorg/apache/cordova/Capture;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "Capture.java"


# static fields
.field private static final AUDIO_3GPP:Ljava/lang/String; = "audio/3gpp"

.field private static final CAPTURE_AUDIO:I = 0x0

.field private static final CAPTURE_IMAGE:I = 0x1

.field private static final CAPTURE_INTERNAL_ERR:I = 0x0

.field private static final CAPTURE_NO_MEDIA_FILES:I = 0x3

.field private static final CAPTURE_VIDEO:I = 0x2

.field private static final IMAGE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final LOG_TAG:Ljava/lang/String; = "Capture"

.field private static final VIDEO_3GPP:Ljava/lang/String; = "video/3gpp"

.field private static final VIDEO_MP4:Ljava/lang/String; = "video/mp4"


# instance fields
.field private callbackContext:Lorg/apache/cordova/api/CallbackContext;

.field private duration:D

.field private limit:J

.field private numPics:I

.field private results:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    return-void
.end method

.method private captureAudio()V
    .registers 4

    .prologue
    .line 194
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.MediaStore.RECORD_SOUND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 196
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    const/4 v2, 0x0

    invoke-interface {v1, p0, v0, v2}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 197
    return-void
.end method

.method private captureImage()V
    .registers 5

    .prologue
    .line 222
    invoke-direct {p0}, Lorg/apache/cordova/Capture;->whichContentStore()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/Capture;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/Capture;->numPics:I

    .line 224
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 227
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Capture.jpg"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .local v1, "photo":Ljava/io/File;
    const-string v2, "output"

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 230
    iget-object v2, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    const/4 v3, 0x1

    invoke-interface {v2, p0, v0, v3}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 231
    return-void
.end method

.method private captureVideo(D)V
    .registers 6
    .param p1, "duration"    # D

    .prologue
    .line 237
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 239
    .local v0, "intent":Landroid/content/Intent;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-le v1, v2, :cond_12

    .line 240
    const-string v1, "android.intent.extra.durationLimit"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 242
    :cond_12
    iget-object v1, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    const/4 v2, 0x2

    invoke-interface {v1, p0, v0, v2}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 243
    return-void
.end method

.method private checkForDuplicateImage()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 450
    invoke-direct {p0}, Lorg/apache/cordova/Capture;->whichContentStore()Landroid/net/Uri;

    move-result-object v0

    .line 451
    .local v0, "contentStore":Landroid/net/Uri;
    invoke-direct {p0, v0}, Lorg/apache/cordova/Capture;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    .line 452
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 455
    .local v1, "currentNumOfImages":I
    iget v5, p0, Lorg/apache/cordova/Capture;->numPics:I

    sub-int v5, v1, v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_53

    .line 456
    invoke-interface {v2}, Landroid/database/Cursor;->moveToLast()Z

    .line 457
    const-string v5, "_id"

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v3, v5, -0x1

    .line 458
    .local v3, "id":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 459
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v5}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v4, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 461
    .end local v3    # "id":I
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_53
    return-void
.end method

.method private createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;
    .registers 5
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 411
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 413
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_5
    const-string v1, "code"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 414
    const-string v1, "message"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_f} :catch_10

    .line 418
    :goto_f
    return-object v0

    .line 415
    :catch_10
    move-exception v1

    goto :goto_f
.end method

.method private createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "data"    # Landroid/net/Uri;

    .prologue
    .line 380
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {p1, v3}, Lorg/apache/cordova/FileHelper;->getRealPath(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 381
    .local v1, "fp":Ljava/io/File;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 385
    .local v2, "obj":Lorg/json/JSONObject;
    :try_start_10
    const-string v3, "name"

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 386
    const-string v3, "fullPath"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 390
    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".3gp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_55

    invoke-virtual {v1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".3gpp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_88

    .line 391
    :cond_55
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/audio/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 392
    const-string v3, "type"

    const-string v4, "audio/3gpp"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 400
    :goto_68
    const-string v3, "lastModifiedDate"

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 401
    const-string v3, "size"

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 407
    :goto_7a
    return-object v2

    .line 394
    :cond_7b
    const-string v3, "type"

    const-string v4, "video/3gpp"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_82
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_82} :catch_83

    goto :goto_68

    .line 402
    :catch_83
    move-exception v0

    .line 404
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_7a

    .line 397
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_88
    :try_start_88
    const-string v3, "type"

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {v4, v5}, Lorg/apache/cordova/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_97
    .catch Lorg/json/JSONException; {:try_start_88 .. :try_end_97} :catch_83

    goto :goto_68
.end method

.method private getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;
    .registers 8
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .param p3, "video"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 177
    .local v1, "player":Landroid/media/MediaPlayer;
    :try_start_5
    invoke-virtual {v1, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 178
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 179
    const-string v2, "duration"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 180
    if-eqz p3, :cond_2a

    .line 181
    const-string v2, "height"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 182
    const-string v2, "width"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_2a} :catch_2b

    .line 187
    :cond_2a
    :goto_2a
    return-object p2

    .line 184
    :catch_2b
    move-exception v0

    .line 185
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Capture"

    const-string v3, "Error: loading video file"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2a
.end method

.method private getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 121
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 123
    .local v0, "obj":Lorg/json/JSONObject;
    const-string v1, "height"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 124
    const-string v1, "width"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 125
    const-string v1, "bitrate"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 126
    const-string v1, "duration"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 127
    const-string v1, "codecs"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    if-eqz p2, :cond_33

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_33

    const-string v1, "null"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 132
    :cond_33
    iget-object v1, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-static {p1, v1}, Lorg/apache/cordova/FileHelper;->getMimeType(Ljava/lang/String;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object p2

    .line 134
    :cond_39
    const-string v1, "Capture"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Mime type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string v1, "image/jpeg"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_61

    const-string v1, ".jpg"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_66

    .line 137
    :cond_61
    invoke-direct {p0, p1, v0}, Lorg/apache/cordova/Capture;->getImageData(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 145
    :cond_65
    :goto_65
    return-object v0

    .line 139
    :cond_66
    const-string v1, "audio/3gpp"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_73

    .line 140
    invoke-direct {p0, p1, v0, v4}, Lorg/apache/cordova/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_65

    .line 142
    :cond_73
    const-string v1, "video/3gpp"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_83

    const-string v1, "video/mp4"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 143
    :cond_83
    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/cordova/Capture;->getAudioVideoData(Ljava/lang/String;Lorg/json/JSONObject;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_65
.end method

.method private getImageData(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 6
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "obj"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 157
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 158
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 159
    invoke-static {p1}, Lorg/apache/cordova/FileHelper;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 160
    const-string v1, "height"

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 161
    const-string v1, "width"

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {p2, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 162
    return-object p2
.end method

.method private getTempDirectoryPath()Ljava/lang/String;
    .registers 4

    .prologue
    .line 200
    const/4 v0, 0x0

    .line 203
    .local v0, "cache":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    .line 204
    new-instance v0, Ljava/io/File;

    .end local v0    # "cache":Ljava/io/File;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/Android/data/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/cache/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 213
    .restart local v0    # "cache":Ljava/io/File;
    :goto_41
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 214
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 209
    :cond_49
    iget-object v1, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_41
.end method

.method private queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;
    .registers 8
    .param p1, "contentStore"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 437
    iget-object v0, p0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v1

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private whichContentStore()Landroid/net/Uri;
    .registers 3

    .prologue
    .line 468
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 469
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 471
    :goto_e
    return-object v0

    :cond_f
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_e
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .registers 14
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/api/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x1

    const-wide/16 v6, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 81
    iput-object p3, p0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    .line 82
    iput-wide v8, p0, Lorg/apache/cordova/Capture;->limit:J

    .line 83
    iput-wide v6, p0, Lorg/apache/cordova/Capture;->duration:D

    .line 84
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    iput-object v4, p0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    .line 86
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 87
    .local v1, "options":Lorg/json/JSONObject;
    if-eqz v1, :cond_29

    .line 88
    const-string v4, "limit"

    invoke-virtual {v1, v4, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/cordova/Capture;->limit:J

    .line 89
    const-string v4, "duration"

    invoke-virtual {v1, v4, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/cordova/Capture;->duration:D

    .line 92
    :cond_29
    const-string v4, "getFormatData"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 93
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lorg/apache/cordova/Capture;->getFormatData(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 94
    .local v0, "obj":Lorg/json/JSONObject;
    invoke-virtual {p3, v0}, Lorg/apache/cordova/api/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 110
    .end local v0    # "obj":Lorg/json/JSONObject;
    :goto_40
    return v2

    .line 97
    :cond_41
    const-string v4, "captureAudio"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d

    .line 98
    invoke-direct {p0}, Lorg/apache/cordova/Capture;->captureAudio()V

    goto :goto_40

    .line 100
    :cond_4d
    const-string v4, "captureImage"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 101
    invoke-direct {p0}, Lorg/apache/cordova/Capture;->captureImage()V

    goto :goto_40

    .line 103
    :cond_59
    const-string v4, "captureVideo"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_67

    .line 104
    iget-wide v4, p0, Lorg/apache/cordova/Capture;->duration:D

    invoke-direct {p0, v4, v5}, Lorg/apache/cordova/Capture;->captureVideo(D)V

    goto :goto_40

    :cond_67
    move v2, v3

    .line 107
    goto :goto_40
.end method

.method public fail(Lorg/json/JSONObject;)V
    .registers 3
    .param p1, "err"    # Lorg/json/JSONObject;

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 428
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 20
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 257
    const/4 v12, -0x1

    move/from16 v0, p2

    if-ne v0, v12, :cond_18b

    .line 259
    if-nez p1, :cond_40

    .line 261
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    .line 263
    .local v3, "data":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/cordova/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 265
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    int-to-long v12, v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/apache/cordova/Capture;->limit:J

    cmp-long v12, v12, v14

    if-ltz v12, :cond_3c

    .line 267
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v13, Lorg/apache/cordova/api/PluginResult;

    sget-object v14, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {v13, v14, v15}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v12, v13}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    .line 370
    .end local v3    # "data":Landroid/net/Uri;
    :cond_3b
    :goto_3b
    return-void

    .line 270
    .restart local v3    # "data":Landroid/net/Uri;
    :cond_3c
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/Capture;->captureAudio()V

    goto :goto_3b

    .line 272
    .end local v3    # "data":Landroid/net/Uri;
    :cond_40
    const/4 v12, 0x1

    move/from16 v0, p1

    if-ne v0, v12, :cond_131

    .line 280
    :try_start_45
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 281
    .local v11, "values":Landroid/content/ContentValues;
    const-string v12, "mime_type"

    const-string v13, "image/jpeg"

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_51} :catch_a8

    .line 282
    const/4 v10, 0x0

    .line 284
    .local v10, "uri":Landroid/net/Uri;
    :try_start_52
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_63
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_52 .. :try_end_63} :catch_bb
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_63} :catch_a8

    move-result-object v10

    .line 295
    :goto_64
    :try_start_64
    new-instance v6, Ljava/io/FileInputStream;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/Capture.jpg"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 296
    .local v6, "fis":Ljava/io/FileInputStream;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    invoke-virtual {v12, v10}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v9

    .line 297
    .local v9, "os":Ljava/io/OutputStream;
    const/16 v12, 0x1000

    new-array v2, v12, [B

    .line 299
    .local v2, "buffer":[B
    :goto_9c
    invoke-virtual {v6, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v7

    .local v7, "len":I
    const/4 v12, -0x1

    if-eq v7, v12, :cond_ee

    .line 300
    const/4 v12, 0x0

    invoke-virtual {v9, v2, v12, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_a7
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_a7} :catch_a8

    goto :goto_9c

    .line 318
    .end local v2    # "buffer":[B
    .end local v6    # "fis":Ljava/io/FileInputStream;
    .end local v7    # "len":I
    .end local v9    # "os":Ljava/io/OutputStream;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :catch_a8
    move-exception v4

    .line 319
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 320
    const/4 v12, 0x0

    const-string v13, "Error capturing image."

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/cordova/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/Capture;->fail(Lorg/json/JSONObject;)V

    goto :goto_3b

    .line 285
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v10    # "uri":Landroid/net/Uri;
    .restart local v11    # "values":Landroid/content/ContentValues;
    :catch_bb
    move-exception v4

    .line 286
    .local v4, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_bc
    const-string v12, "Capture"

    const-string v13, "Can\'t write to external media storage."

    invoke-static {v12, v13}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c3
    .catch Ljava/io/IOException; {:try_start_bc .. :try_end_c3} :catch_a8

    .line 288
    :try_start_c3
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v12}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v12

    invoke-virtual {v12}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    sget-object v13, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v12, v13, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_d4
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_c3 .. :try_end_d4} :catch_d6
    .catch Ljava/io/IOException; {:try_start_c3 .. :try_end_d4} :catch_a8

    move-result-object v10

    goto :goto_64

    .line 289
    :catch_d6
    move-exception v5

    .line 290
    .local v5, "ex":Ljava/lang/UnsupportedOperationException;
    :try_start_d7
    const-string v12, "Capture"

    const-string v13, "Can\'t write to internal media storage."

    invoke-static {v12, v13}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const/4 v12, 0x0

    const-string v13, "Error capturing image - no media storage found."

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/cordova/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_3b

    .line 302
    .end local v4    # "e":Ljava/lang/UnsupportedOperationException;
    .end local v5    # "ex":Ljava/lang/UnsupportedOperationException;
    .restart local v2    # "buffer":[B
    .restart local v6    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "len":I
    .restart local v9    # "os":Ljava/io/OutputStream;
    :cond_ee
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 303
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 304
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    .line 307
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/cordova/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 309
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/Capture;->checkForDuplicateImage()V

    .line 311
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    int-to-long v12, v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/apache/cordova/Capture;->limit:J

    cmp-long v12, v12, v14

    if-ltz v12, :cond_12c

    .line 313
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v13, Lorg/apache/cordova/api/PluginResult;

    sget-object v14, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {v13, v14, v15}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v12, v13}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    goto/16 :goto_3b

    .line 316
    :cond_12c
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/Capture;->captureImage()V
    :try_end_12f
    .catch Ljava/io/IOException; {:try_start_d7 .. :try_end_12f} :catch_a8

    goto/16 :goto_3b

    .line 322
    .end local v2    # "buffer":[B
    .end local v6    # "fis":Ljava/io/FileInputStream;
    .end local v7    # "len":I
    .end local v9    # "os":Ljava/io/OutputStream;
    .end local v10    # "uri":Landroid/net/Uri;
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_131
    const/4 v12, 0x2

    move/from16 v0, p1

    if-ne v0, v12, :cond_3b

    .line 324
    const/4 v3, 0x0

    .line 326
    .restart local v3    # "data":Landroid/net/Uri;
    if-eqz p3, :cond_13d

    .line 328
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    .line 331
    :cond_13d
    if-nez v3, :cond_14e

    .line 332
    new-instance v8, Ljava/io/File;

    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/Capture;->getTempDirectoryPath()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Capture.avi"

    invoke-direct {v8, v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    .local v8, "movie":Ljava/io/File;
    invoke-static {v8}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    .line 337
    .end local v8    # "movie":Ljava/io/File;
    :cond_14e
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/cordova/Capture;->createMediaFile(Landroid/net/Uri;)Lorg/json/JSONObject;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 339
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    int-to-long v12, v12

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/apache/cordova/Capture;->limit:J

    cmp-long v12, v12, v14

    if-ltz v12, :cond_180

    .line 341
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v13, Lorg/apache/cordova/api/PluginResult;

    sget-object v14, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {v13, v14, v15}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v12, v13}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    goto/16 :goto_3b

    .line 344
    :cond_180
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/apache/cordova/Capture;->duration:D

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/cordova/Capture;->captureVideo(D)V

    goto/16 :goto_3b

    .line 349
    .end local v3    # "data":Landroid/net/Uri;
    :cond_18b
    if-nez p2, :cond_1bb

    .line 351
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lez v12, :cond_1ab

    .line 352
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v13, Lorg/apache/cordova/api/PluginResult;

    sget-object v14, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {v13, v14, v15}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v12, v13}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    goto/16 :goto_3b

    .line 356
    :cond_1ab
    const/4 v12, 0x3

    const-string v13, "Canceled."

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/cordova/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_3b

    .line 362
    :cond_1bb
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lez v12, :cond_1d9

    .line 363
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/cordova/Capture;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v13, Lorg/apache/cordova/api/PluginResult;

    sget-object v14, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/cordova/Capture;->results:Lorg/json/JSONArray;

    invoke-direct {v13, v14, v15}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Lorg/json/JSONArray;)V

    invoke-virtual {v12, v13}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    goto/16 :goto_3b

    .line 367
    :cond_1d9
    const/4 v12, 0x3

    const-string v13, "Did not complete!"

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/cordova/Capture;->createErrorObject(ILjava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/apache/cordova/Capture;->fail(Lorg/json/JSONObject;)V

    goto/16 :goto_3b
.end method
