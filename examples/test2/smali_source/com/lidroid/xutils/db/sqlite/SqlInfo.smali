.class public Lcom/lidroid/xutils/db/sqlite/SqlInfo;
.super Ljava/lang/Object;
.source "SqlInfo.java"


# instance fields
.field private bindArgs:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private sql:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->sql:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 3
    .param p1, "sql"    # Ljava/lang/String;
    .param p2, "bindArgs"    # [Ljava/lang/Object;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->sql:Ljava/lang/String;

    .line 36
    invoke-virtual {p0, p2}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->addBindArgs([Ljava/lang/Object;)V

    .line 37
    return-void
.end method


# virtual methods
.method public addBindArg(Ljava/lang/Object;)V
    .registers 4
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    if-nez v0, :cond_b

    .line 72
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    .line 75
    :cond_b
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-static {p1}, Lcom/lidroid/xutils/db/table/ColumnUtils;->convert2DbColumnValueIfNeeded(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 76
    return-void
.end method

.method addBindArgWithoutConverter(Ljava/lang/Object;)V
    .registers 3
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    if-nez v0, :cond_b

    .line 80
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    .line 83
    :cond_b
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 84
    return-void
.end method

.method public varargs addBindArgs([Ljava/lang/Object;)V
    .registers 5
    .param p1, "bindArgs"    # [Ljava/lang/Object;

    .prologue
    .line 87
    if-eqz p1, :cond_6

    .line 88
    array-length v2, p1

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v2, :cond_7

    .line 92
    :cond_6
    return-void

    .line 88
    :cond_7
    aget-object v0, p1, v1

    .line 89
    .local v0, "arg":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->addBindArg(Ljava/lang/Object;)V

    .line 88
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public getBindArgs()Ljava/util/LinkedList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    return-object v0
.end method

.method public getBindArgsAsArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    if-eqz v0, :cond_b

    .line 53
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 55
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getBindArgsAsStrArray()[Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 59
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    if-eqz v3, :cond_2a

    .line 60
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    new-array v1, v3, [Ljava/lang/String;

    .line 61
    .local v1, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lt v0, v3, :cond_17

    .line 67
    .end local v0    # "i":I
    .end local v1    # "strings":[Ljava/lang/String;
    :goto_16
    return-object v1

    .line 62
    .restart local v0    # "i":I
    .restart local v1    # "strings":[Ljava/lang/String;
    :cond_17
    iget-object v3, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->bindArgs:Ljava/util/LinkedList;

    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 63
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_25

    move-object v3, v4

    :goto_20
    aput-object v3, v1, v0

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 63
    :cond_25
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .end local v0    # "i":I
    .end local v1    # "strings":[Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2a
    move-object v1, v4

    .line 67
    goto :goto_16
.end method

.method public getSql()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->sql:Ljava/lang/String;

    return-object v0
.end method

.method public setSql(Ljava/lang/String;)V
    .registers 2
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->sql:Ljava/lang/String;

    .line 45
    return-void
.end method
