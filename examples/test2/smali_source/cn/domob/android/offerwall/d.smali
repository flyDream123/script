.class public Lcn/domob/android/offerwall/d;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/domob/android/offerwall/d$a;
    }
.end annotation


# static fields
.field private static a:Lcn/domob/android/offerwall/m;

.field private static b:Lcn/domob/android/offerwall/d;

.field private static c:Lcn/domob/android/offerwall/d$a;

.field private static d:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcn/domob/android/offerwall/g;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcn/domob/android/offerwall/m;

    const-class v1, Lcn/domob/android/offerwall/d;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcn/domob/android/offerwall/m;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method protected static a()Lcn/domob/android/offerwall/d;
    .registers 2

    sget-object v0, Lcn/domob/android/offerwall/d;->b:Lcn/domob/android/offerwall/d;

    if-eqz v0, :cond_7

    sget-object v0, Lcn/domob/android/offerwall/d;->b:Lcn/domob/android/offerwall/d;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    const-string v1, "ActionReceiver needs to be initialized first."

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->e(Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected static a(Landroid/content/Context;Lcn/domob/android/offerwall/d$a;)V
    .registers 5

    sget-object v0, Lcn/domob/android/offerwall/d;->b:Lcn/domob/android/offerwall/d;

    if-nez v0, :cond_2d

    new-instance v0, Lcn/domob/android/offerwall/d;

    invoke-direct {v0}, Lcn/domob/android/offerwall/d;-><init>()V

    sput-object v0, Lcn/domob/android/offerwall/d;->b:Lcn/domob/android/offerwall/d;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcn/domob/android/offerwall/d;->b:Lcn/domob/android/offerwall/d;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    sput-object p1, Lcn/domob/android/offerwall/d;->c:Lcn/domob/android/offerwall/d$a;

    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    const-string v1, "Finish to init action receiver."

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->b(Ljava/lang/String;)V

    :goto_2c
    return-void

    :cond_2d
    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    const-string v1, "Action receiver has already been initialized."

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->b(Ljava/lang/String;)V

    goto :goto_2c
.end method


# virtual methods
.method protected a(Lcn/domob/android/offerwall/g;)V
    .registers 4

    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    :cond_b
    invoke-virtual {p1}, Lcn/domob/android/offerwall/g;->c()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_17

    sget-object v1, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v1, v0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_16
    return-void

    :cond_17
    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    const-string v1, "There is no package name in ad response."

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->e(Ljava/lang/String;)V

    goto :goto_16
.end method

.method protected a(Ljava/lang/String;)V
    .registers 5

    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    :cond_b
    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remove info : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->a(Ljava/lang/String;)V

    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_36
    return-void

    :cond_37
    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "There is no key like "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in regPkgTalbe."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->e(Ljava/lang/String;)V

    goto :goto_36
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8

    :try_start_0
    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    if-nez v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    sget-object v2, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Intent: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcn/domob/android/offerwall/m;->a(Ljava/lang/String;)V

    const-string v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_38} :catch_7f

    move-result-object v0

    :try_start_39
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
    :try_end_44
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_39 .. :try_end_44} :catch_87
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_44} :catch_7f

    :try_start_44
    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a7

    sget-object v0, Lcn/domob/android/offerwall/d;->c:Lcn/domob/android/offerwall/d$a;

    if-eqz v0, :cond_5d

    sget-object v1, Lcn/domob/android/offerwall/d;->c:Lcn/domob/android/offerwall/d$a;

    sget-object v0, Lcn/domob/android/offerwall/d;->d:Ljava/util/Hashtable;

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/domob/android/offerwall/g;

    invoke-interface {v1, v0}, Lcn/domob/android/offerwall/d$a;->a(Lcn/domob/android/offerwall/g;)V

    :cond_5d
    sget-object v0, Lcn/domob/android/a/a;->b:Ljava/util/Hashtable;

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_7b

    sget-object v1, Lcn/domob/android/a/a;->b:Ljava/util/Hashtable;

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "notification"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_7b
    invoke-virtual {p0, v2}, Lcn/domob/android/offerwall/d;->a(Ljava/lang/String;)V
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_7e} :catch_7f

    goto :goto_4

    :catch_7f
    move-exception v0

    sget-object v1, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    invoke-virtual {v1, v0}, Lcn/domob/android/offerwall/m;->a(Ljava/lang/Throwable;)V

    goto/16 :goto_4

    :catch_87
    move-exception v0

    :try_start_88
    sget-object v2, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u7cfb\u7edf\u65e0\u6cd5\u627e\u5230\u5305\u540d\u5bf9\u5e94App\uff0c\u8bf7\u786e\u8ba4\u8be5\u5305\u662f\u5426\u88ab\u5b89\u88c5 : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcn/domob/android/offerwall/m;->e(Ljava/lang/String;)V

    sget-object v1, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    invoke-virtual {v1, v0}, Lcn/domob/android/offerwall/m;->a(Ljava/lang/Throwable;)V

    goto/16 :goto_4

    :cond_a7
    sget-object v0, Lcn/domob/android/offerwall/d;->a:Lcn/domob/android/offerwall/m;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u8be5\u5305\u540d\u6ca1\u6709\u88ab\u6ce8\u518c\uff0c\u4e0d\u8fdb\u884creport : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/domob/android/offerwall/m;->e(Ljava/lang/String;)V
    :try_end_bf
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_bf} :catch_7f

    goto/16 :goto_4
.end method
