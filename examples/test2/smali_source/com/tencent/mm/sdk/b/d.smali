.class public final Lcom/tencent/mm/sdk/b/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/tencent/mm/sdk/b/e$a;


# instance fields
.field private aJ:Lcom/tencent/mm/sdk/b/e;

.field private aK:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Runnable;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/tencent/mm/sdk/b/g;",
            ">;>;"
        }
    .end annotation
.end field

.field private aL:I

.field private aM:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/tencent/mm/sdk/b/g;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aK:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aM:Ljava/util/LinkedList;

    new-instance v0, Lcom/tencent/mm/sdk/b/e;

    invoke-direct {v0, p0}, Lcom/tencent/mm/sdk/b/e;-><init>(Lcom/tencent/mm/sdk/b/e$a;)V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aJ:Lcom/tencent/mm/sdk/b/e;

    iget-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aJ:Lcom/tencent/mm/sdk/b/e;

    invoke-virtual {v0}, Lcom/tencent/mm/sdk/b/e;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "initThread"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string v0, "MicroMsg.MMHandler"

    const-string v1, "MMHandler can not init handler with initThread looper, stack %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lcom/tencent/mm/sdk/b/h;->u()Lcom/tencent/mm/sdk/b/f;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/tencent/mm/sdk/b/b;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3f
    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aK:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aM:Ljava/util/LinkedList;

    new-instance v0, Lcom/tencent/mm/sdk/b/e;

    invoke-direct {v0, p1, p0}, Lcom/tencent/mm/sdk/b/e;-><init>(Landroid/os/Looper;Lcom/tencent/mm/sdk/b/e$a;)V

    iput-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aJ:Lcom/tencent/mm/sdk/b/e;

    invoke-virtual {p1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "initThread"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    const-string v0, "MicroMsg.MMHandler"

    const-string v1, "MMHandler can not init handler with initThread looper, stack %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lcom/tencent/mm/sdk/b/h;->u()Lcom/tencent/mm/sdk/b/f;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/tencent/mm/sdk/b/b;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_39
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;Lcom/tencent/mm/sdk/b/g;)V
    .registers 5

    iget-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aK:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final b(Ljava/lang/Runnable;Lcom/tencent/mm/sdk/b/g;)V
    .registers 6

    iget-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aK:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_33

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p2, :cond_33

    iget-object v1, p0, Lcom/tencent/mm/sdk/b/d;->aK:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget v1, p0, Lcom/tencent/mm/sdk/b/d;->aL:I

    if-lez v1, :cond_33

    iget-object v1, p0, Lcom/tencent/mm/sdk/b/d;->aM:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    iget v2, p0, Lcom/tencent/mm/sdk/b/d;->aL:I

    if-ne v1, v2, :cond_2e

    iget-object v1, p0, Lcom/tencent/mm/sdk/b/d;->aM:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    :cond_2e
    iget-object v1, p0, Lcom/tencent/mm/sdk/b/d;->aM:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    :cond_33
    return-void
.end method

.method public final post(Ljava/lang/Runnable;)Z
    .registers 3

    iget-object v0, p0, Lcom/tencent/mm/sdk/b/d;->aJ:Lcom/tencent/mm/sdk/b/e;

    invoke-virtual {v0, p1}, Lcom/tencent/mm/sdk/b/e;->post(Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MMHandler("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
