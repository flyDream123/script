.class public Lcn/domob/wall/core/download/DownloadCancelActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# static fields
.field public static final ACTIVITY_TYPE:Ljava/lang/String; = "ActivityType"

.field public static final NOTICE_MESSAGE:Ljava/lang/String; = "msg"

.field public static final TYPE_DOWNLOADER:I = 0x2

.field public static final TYPE_INSTALL_RECEIVER:I = 0x1

.field public static final TYPE_NONE:I = 0x0

.field public static final TYPE_NOTICE:I = 0x3

.field public static final TYPE_SHOW_WEBVIEW:I = 0x5

.field public static final TYPE_UPLOAD_PIC:I = 0x4

.field public static final WEBVIEW_URL_NAME:Ljava/lang/String; = "webview_url"

.field private static a:Lcn/domob/wall/core/h/d;


# instance fields
.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 13
    new-instance v0, Lcn/domob/wall/core/h/d;

    const-class v1, Lcn/domob/wall/core/download/DownloadCancelActivity;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcn/domob/wall/core/h/d;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcn/domob/wall/core/download/DownloadCancelActivity;->a:Lcn/domob/wall/core/h/d;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 32
    iput-object p0, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->b:Landroid/content/Context;

    .line 35
    const-string v0, ""

    iput-object v0, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->c:Ljava/lang/String;

    return-void
.end method

.method static synthetic a(Lcn/domob/wall/core/download/DownloadCancelActivity;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 12
    iget-object v0, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->c:Ljava/lang/String;

    return-object v0
.end method

.method private a()V
    .registers 4

    .prologue
    .line 73
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 74
    if-eqz v0, :cond_69

    .line 75
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 76
    const-string v1, "appName"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 77
    const-string v2, "appId"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->c:Ljava/lang/String;

    .line 79
    const-string v2, "actType"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_69

    .line 82
    const-string v2, "typeCancel"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_69

    .line 83
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->b:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u53d6\u6d88"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u6b63\u5728\u4e0b\u8f7d\u662f\u5426\u53d6\u6d88?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u53d6\u6d88\u4e0b\u8f7d"

    new-instance v2, Lcn/domob/wall/core/download/DownloadCancelActivity$2;

    invoke-direct {v2, p0}, Lcn/domob/wall/core/download/DownloadCancelActivity$2;-><init>(Lcn/domob/wall/core/download/DownloadCancelActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u7ee7\u7eed\u4e0b\u8f7d"

    new-instance v2, Lcn/domob/wall/core/download/DownloadCancelActivity$1;

    invoke-direct {v2, p0}, Lcn/domob/wall/core/download/DownloadCancelActivity$1;-><init>(Lcn/domob/wall/core/download/DownloadCancelActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 115
    :cond_69
    return-void
.end method

.method private b()V
    .registers 4

    .prologue
    .line 118
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 119
    if-eqz v0, :cond_2d

    .line 120
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 121
    const-string v1, "msg"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcn/domob/wall/core/download/DownloadCancelActivity;->b:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lcn/domob/wall/core/download/DownloadCancelActivity$3;

    invoke-direct {v2, p0}, Lcn/domob/wall/core/download/DownloadCancelActivity$3;-><init>(Lcn/domob/wall/core/download/DownloadCancelActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 133
    :cond_2d
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 144
    .line 145
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 42
    const-string v1, "ActivityType"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 43
    sget-object v1, Lcn/domob/wall/core/download/DownloadCancelActivity;->a:Lcn/domob/wall/core/h/d;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "intent activity type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcn/domob/wall/core/h/d;->b(Ljava/lang/String;)V

    .line 45
    packed-switch v0, :pswitch_data_42

    .line 67
    invoke-virtual {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->finish()V

    .line 70
    :goto_29
    return-void

    .line 49
    :pswitch_2a
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    invoke-direct {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->a()V

    goto :goto_29

    .line 53
    :pswitch_31
    const v0, 0x103000b

    invoke-virtual {p0, v0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->setTheme(I)V

    .line 54
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    goto :goto_29

    .line 58
    :pswitch_3b
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 59
    invoke-direct {p0}, Lcn/domob/wall/core/download/DownloadCancelActivity;->b()V

    goto :goto_29

    .line 45
    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_31
        :pswitch_2a
        :pswitch_3b
    .end packed-switch
.end method
