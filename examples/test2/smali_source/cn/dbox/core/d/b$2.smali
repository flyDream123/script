.class Lcn/dbox/core/d/b$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/dbox/core/d/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/dbox/core/d/b;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcn/dbox/core/d/b;


# direct methods
.method constructor <init>(Lcn/dbox/core/d/b;)V
    .registers 2

    .prologue
    .line 432
    iput-object p1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    .prologue
    .line 471
    const-string v0, "DrwSDK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v2}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "rom can\'t chmod"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    const-string v0, "sd\u5361\u4e0d\u5b58\u5728"

    .line 473
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v1

    if-eqz v1, :cond_32

    .line 474
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v1

    const/4 v2, 0x5

    invoke-interface {v1, v2, v0}, Lcn/dbox/core/d/c;->a(ILjava/lang/String;)V

    .line 476
    :cond_32
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1, v0}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;Ljava/lang/String;)V

    .line 477
    return-void
.end method

.method public a(JJJ)V
    .registers 10

    .prologue
    .line 459
    const-string v0, "DrwSDK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v2}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "not enough size sdsize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " romsize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 461
    const-string v0, "\u7a7a\u95f4\u4e0d\u8db3"

    .line 462
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v1

    if-eqz v1, :cond_40

    .line 463
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Lcn/dbox/core/d/c;->a(ILjava/lang/String;)V

    .line 465
    :cond_40
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1, v0}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;Ljava/lang/String;)V

    .line 466
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 436
    invoke-static {}, Lcn/dbox/core/d/b;->d()Lcn/dbox/core/h/d;

    move-result-object v0

    const-class v1, Lcn/dbox/core/d/b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v3}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " already exists in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcn/dbox/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 437
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0, p1}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;)Ljava/lang/String;

    .line 438
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->i(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;J)V

    .line 439
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .registers 8

    .prologue
    .line 443
    invoke-static {}, Lcn/dbox/core/d/b;->d()Lcn/dbox/core/h/d;

    move-result-object v0

    const-class v1, Lcn/dbox/core/d/b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v3}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is download but not finished in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcn/dbox/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 444
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0, p1}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;)Ljava/lang/String;

    .line 446
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->i(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 447
    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    iget-object v2, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v2}, Lcn/dbox/core/d/b;->i(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-static {v1, v2, v4, v5}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;J)V

    .line 448
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 452
    invoke-static {}, Lcn/dbox/core/d/b;->d()Lcn/dbox/core/h/d;

    move-result-object v0

    const-class v1, Lcn/dbox/core/d/b;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v3}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is  not download,it will download in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcn/dbox/core/h/d;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0, p1}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;)Ljava/lang/String;

    .line 454
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    iget-object v1, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v1}, Lcn/dbox/core/d/b;->i(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcn/dbox/core/d/b;->a(Lcn/dbox/core/d/b;Ljava/lang/String;J)V

    .line 455
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 481
    const-string v0, "DrwSDK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v2}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v0

    if-eqz v0, :cond_45

    .line 483
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0}, Lcn/dbox/core/d/b;->l(Lcn/dbox/core/d/b;)Lcn/dbox/core/d/c;

    move-result-object v0

    const/4 v1, 0x5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v3}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcn/dbox/core/d/c;->a(ILjava/lang/String;)V

    .line 485
    :cond_45
    iget-object v0, p0, Lcn/dbox/core/d/b$2;->a:Lcn/dbox/core/d/b;

    invoke-static {v0, p1}, Lcn/dbox/core/d/b;->c(Lcn/dbox/core/d/b;Ljava/lang/String;)V

    .line 486
    return-void
.end method
