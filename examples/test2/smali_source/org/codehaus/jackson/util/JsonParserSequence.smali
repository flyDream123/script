.class public Lorg/codehaus/jackson/util/JsonParserSequence;
.super Lorg/codehaus/jackson/util/JsonParserDelegate;
.source "JsonParserSequence.java"


# instance fields
.field protected _nextParser:I

.field protected final _parsers:[Lorg/codehaus/jackson/JsonParser;


# direct methods
.method protected constructor <init>([Lorg/codehaus/jackson/JsonParser;)V
    .registers 3
    .param p1, "parsers"    # [Lorg/codehaus/jackson/JsonParser;

    .prologue
    .line 40
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-direct {p0, v0}, Lorg/codehaus/jackson/util/JsonParserDelegate;-><init>(Lorg/codehaus/jackson/JsonParser;)V

    .line 41
    iput-object p1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    .line 42
    const/4 v0, 0x1

    iput v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_nextParser:I

    .line 43
    return-void
.end method

.method public static createFlattened(Lorg/codehaus/jackson/JsonParser;Lorg/codehaus/jackson/JsonParser;)Lorg/codehaus/jackson/util/JsonParserSequence;
    .registers 6
    .param p0, "first"    # Lorg/codehaus/jackson/JsonParser;
    .param p1, "second"    # Lorg/codehaus/jackson/JsonParser;

    .prologue
    .line 56
    instance-of v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;

    if-nez v1, :cond_17

    instance-of v1, p1, Lorg/codehaus/jackson/util/JsonParserSequence;

    if-nez v1, :cond_17

    .line 58
    new-instance v1, Lorg/codehaus/jackson/util/JsonParserSequence;

    const/4 v2, 0x2

    new-array v2, v2, [Lorg/codehaus/jackson/JsonParser;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-direct {v1, v2}, Lorg/codehaus/jackson/util/JsonParserSequence;-><init>([Lorg/codehaus/jackson/JsonParser;)V

    .line 71
    .end local p0    # "first":Lorg/codehaus/jackson/JsonParser;
    .end local p1    # "second":Lorg/codehaus/jackson/JsonParser;
    :goto_16
    return-object v1

    .line 60
    .restart local p0    # "first":Lorg/codehaus/jackson/JsonParser;
    .restart local p1    # "second":Lorg/codehaus/jackson/JsonParser;
    :cond_17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v0, "p":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/codehaus/jackson/JsonParser;>;"
    instance-of v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;

    if-eqz v1, :cond_41

    .line 62
    check-cast p0, Lorg/codehaus/jackson/util/JsonParserSequence;

    .end local p0    # "first":Lorg/codehaus/jackson/JsonParser;
    invoke-virtual {p0, v0}, Lorg/codehaus/jackson/util/JsonParserSequence;->addFlattenedActiveParsers(Ljava/util/List;)V

    .line 66
    :goto_25
    instance-of v1, p1, Lorg/codehaus/jackson/util/JsonParserSequence;

    if-eqz v1, :cond_45

    .line 67
    check-cast p1, Lorg/codehaus/jackson/util/JsonParserSequence;

    .end local p1    # "second":Lorg/codehaus/jackson/JsonParser;
    invoke-virtual {p1, v0}, Lorg/codehaus/jackson/util/JsonParserSequence;->addFlattenedActiveParsers(Ljava/util/List;)V

    .line 71
    :goto_2e
    new-instance v2, Lorg/codehaus/jackson/util/JsonParserSequence;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lorg/codehaus/jackson/JsonParser;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/codehaus/jackson/JsonParser;

    invoke-direct {v2, v1}, Lorg/codehaus/jackson/util/JsonParserSequence;-><init>([Lorg/codehaus/jackson/JsonParser;)V

    move-object v1, v2

    goto :goto_16

    .line 64
    .restart local p0    # "first":Lorg/codehaus/jackson/JsonParser;
    .restart local p1    # "second":Lorg/codehaus/jackson/JsonParser;
    :cond_41
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 69
    .end local p0    # "first":Lorg/codehaus/jackson/JsonParser;
    :cond_45
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e
.end method


# virtual methods
.method protected addFlattenedActiveParsers(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/codehaus/jackson/JsonParser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lorg/codehaus/jackson/JsonParser;>;"
    iget v3, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_nextParser:I

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    iget-object v3, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    array-length v1, v3

    .local v1, "len":I
    :goto_7
    if-ge v0, v1, :cond_1d

    .line 77
    iget-object v3, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    aget-object v2, v3, v0

    .line 78
    .local v2, "p":Lorg/codehaus/jackson/JsonParser;
    instance-of v3, v2, Lorg/codehaus/jackson/util/JsonParserSequence;

    if-eqz v3, :cond_19

    .line 79
    check-cast v2, Lorg/codehaus/jackson/util/JsonParserSequence;

    .end local v2    # "p":Lorg/codehaus/jackson/JsonParser;
    invoke-virtual {v2, p1}, Lorg/codehaus/jackson/util/JsonParserSequence;->addFlattenedActiveParsers(Ljava/util/List;)V

    .line 76
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 81
    .restart local v2    # "p":Lorg/codehaus/jackson/JsonParser;
    :cond_19
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 84
    .end local v2    # "p":Lorg/codehaus/jackson/JsonParser;
    :cond_1d
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    :cond_0
    iget-object v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->delegate:Lorg/codehaus/jackson/JsonParser;

    invoke-virtual {v0}, Lorg/codehaus/jackson/JsonParser;->close()V

    .line 98
    invoke-virtual {p0}, Lorg/codehaus/jackson/util/JsonParserSequence;->switchToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    return-void
.end method

.method public containedParsersCount()I
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    array-length v0, v0

    return v0
.end method

.method public nextToken()Lorg/codehaus/jackson/JsonToken;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonParseException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->delegate:Lorg/codehaus/jackson/JsonParser;

    invoke-virtual {v1}, Lorg/codehaus/jackson/JsonParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    .line 105
    .local v0, "t":Lorg/codehaus/jackson/JsonToken;
    if-eqz v0, :cond_a

    move-object v1, v0

    .line 110
    :goto_9
    return-object v1

    .line 106
    :cond_a
    invoke-virtual {p0}, Lorg/codehaus/jackson/util/JsonParserSequence;->switchToNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 107
    iget-object v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->delegate:Lorg/codehaus/jackson/JsonParser;

    invoke-virtual {v1}, Lorg/codehaus/jackson/JsonParser;->nextToken()Lorg/codehaus/jackson/JsonToken;

    move-result-object v0

    .line 108
    if-eqz v0, :cond_a

    move-object v1, v0

    goto :goto_9

    .line 110
    :cond_1a
    const/4 v1, 0x0

    goto :goto_9
.end method

.method protected switchToNext()Z
    .registers 4

    .prologue
    .line 144
    iget v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_nextParser:I

    iget-object v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    array-length v1, v1

    if-lt v0, v1, :cond_9

    .line 145
    const/4 v0, 0x0

    .line 148
    :goto_8
    return v0

    .line 147
    :cond_9
    iget-object v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_parsers:[Lorg/codehaus/jackson/JsonParser;

    iget v1, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_nextParser:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->_nextParser:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lorg/codehaus/jackson/util/JsonParserSequence;->delegate:Lorg/codehaus/jackson/JsonParser;

    .line 148
    const/4 v0, 0x1

    goto :goto_8
.end method
