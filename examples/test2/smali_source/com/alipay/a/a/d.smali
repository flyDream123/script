.class public final Lcom/alipay/a/a/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/alipay/a/a/i;
.implements Lcom/alipay/a/a/j;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lcom/alipay/a/a/d;

    const v1, 0x1a

    invoke-static {v0, v1}, Lcom/bangcle/andjni/JniLib;->a(Ljava/lang/Class;I)V

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final native a(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public final native a(Ljava/lang/Object;Ljava/lang/reflect/Type;)Ljava/lang/Object;
.end method

.method public final native a(Ljava/lang/Class;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation
.end method
