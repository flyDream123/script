.class Lcn/dbox/core/f/b$n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/dbox/core/c/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/dbox/core/f/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "n"
.end annotation


# instance fields
.field final synthetic a:Lcn/dbox/core/f/b;

.field private b:Landroid/content/Context;

.field private c:Lcn/dbox/core/c/c;


# direct methods
.method protected constructor <init>(Lcn/dbox/core/f/b;Landroid/content/Context;)V
    .registers 3

    .prologue
    .line 876
    iput-object p1, p0, Lcn/dbox/core/f/b$n;->a:Lcn/dbox/core/f/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 877
    iput-object p2, p0, Lcn/dbox/core/f/b$n;->b:Landroid/content/Context;

    .line 878
    return-void
.end method


# virtual methods
.method public a(Lcn/dbox/core/c/c;)V
    .registers 6

    .prologue
    .line 892
    invoke-virtual {p1}, Lcn/dbox/core/c/c;->f()I

    move-result v0

    .line 893
    invoke-static {}, Lcn/dbox/core/f/b;->b()Lcn/dbox/core/h/d;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "imp repoet response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcn/dbox/core/h/d;->b(Ljava/lang/String;)V

    .line 894
    const/16 v1, 0xc8

    if-ne v0, v1, :cond_2c

    .line 895
    invoke-static {}, Lcn/dbox/core/f/b;->b()Lcn/dbox/core/h/d;

    move-result-object v0

    const-string v1, "Imp report finish."

    invoke-virtual {v0, v1}, Lcn/dbox/core/h/d;->b(Ljava/lang/String;)V

    .line 899
    :goto_2b
    return-void

    .line 897
    :cond_2c
    invoke-static {}, Lcn/dbox/core/f/b;->b()Lcn/dbox/core/h/d;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onConnectionFinished:respCode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcn/dbox/core/h/d;->e(Ljava/lang/String;)V

    goto :goto_2b
.end method

.method protected a(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 882
    invoke-static {p1}, Lcn/dbox/core/h/f;->a(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    .line 883
    invoke-static {}, Lcn/dbox/core/f/b;->b()Lcn/dbox/core/h/d;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "imp report: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/dbox/core/h/d;->b(Ljava/lang/String;)V

    .line 884
    new-instance v0, Lcn/dbox/core/c/c;

    iget-object v1, p0, Lcn/dbox/core/f/b$n;->b:Landroid/content/Context;

    const-string v3, ""

    const/4 v4, 0x0

    const-string v5, "POST"

    const/16 v7, 0x4e20

    move-object v2, p3

    move-object v8, p0

    invoke-direct/range {v0 .. v8}, Lcn/dbox/core/c/c;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;ILcn/dbox/core/c/c$a;)V

    iput-object v0, p0, Lcn/dbox/core/f/b$n;->c:Lcn/dbox/core/c/c;

    .line 887
    iget-object v0, p0, Lcn/dbox/core/f/b$n;->c:Lcn/dbox/core/c/c;

    invoke-virtual {v0}, Lcn/dbox/core/c/c;->run()V

    .line 888
    return-void
.end method
