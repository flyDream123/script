.class Lcom/MobileTicket/TrackRestart$1;
.super Lcom/lidroid/xutils/http/callback/RequestCallBack;
.source "TrackRestart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/MobileTicket/TrackRestart;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lidroid/xutils/http/callback/RequestCallBack",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/MobileTicket/TrackRestart;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/MobileTicket/TrackRestart$1;

    const v1, 0x15

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method constructor <init>(Lcom/MobileTicket/TrackRestart;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/MobileTicket/TrackRestart$1;->this$0:Lcom/MobileTicket/TrackRestart;

    .line 30
    invoke-direct {p0}, Lcom/lidroid/xutils/http/callback/RequestCallBack;-><init>()V

    return-void
.end method


# virtual methods
.method public native onFailure(Lcom/lidroid/xutils/exception/HttpException;Ljava/lang/String;)V
.end method

.method public native onLoading(JJZ)V
.end method

.method public native onStart()V
.end method

.method public native onSuccess(Lcom/lidroid/xutils/http/ResponseInfo;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lidroid/xutils/http/ResponseInfo",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
