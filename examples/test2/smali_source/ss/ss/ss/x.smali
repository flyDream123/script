.class Lss/ss/ss/x;
.super LgK/j;


# instance fields
.field final synthetic a:Lss/ss/ss/w;


# direct methods
.method constructor <init>(Lss/ss/ss/w;LgK/w;)V
    .registers 3

    iput-object p1, p0, Lss/ss/ss/x;->a:Lss/ss/ss/w;

    invoke-direct {p0, p2}, LgK/j;-><init>(LgK/w;)V

    return-void
.end method


# virtual methods
.method public a(LgK/e;J)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    iget-object v2, p0, Lss/ss/ss/x;->a:Lss/ss/ss/w;

    invoke-static {v2}, Lss/ss/ss/w;->a(Lss/ss/ss/w;)I

    move-result v2

    if-nez v2, :cond_b

    :cond_a
    :goto_a
    return-wide v0

    :cond_b
    iget-object v2, p0, Lss/ss/ss/x;->a:Lss/ss/ss/w;

    invoke-static {v2}, Lss/ss/ss/w;->a(Lss/ss/ss/w;)I

    move-result v2

    int-to-long v2, v2

    invoke-static {p2, p3, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-super {p0, p1, v2, v3}, LgK/j;->a(LgK/e;J)J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-eqz v4, :cond_a

    iget-object v0, p0, Lss/ss/ss/x;->a:Lss/ss/ss/w;

    iget-object v1, p0, Lss/ss/ss/x;->a:Lss/ss/ss/w;

    invoke-static {v1}, Lss/ss/ss/w;->a(Lss/ss/ss/w;)I

    move-result v1

    int-to-long v4, v1

    sub-long/2addr v4, v2

    long-to-int v1, v4

    invoke-static {v0, v1}, Lss/ss/ss/w;->a(Lss/ss/ss/w;I)I

    move-wide v0, v2

    goto :goto_a
.end method
