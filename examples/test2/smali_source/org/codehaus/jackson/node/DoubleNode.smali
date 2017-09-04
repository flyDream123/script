.class public final Lorg/codehaus/jackson/node/DoubleNode;
.super Lorg/codehaus/jackson/node/NumericNode;
.source "DoubleNode.java"


# instance fields
.field protected final _value:D


# direct methods
.method public constructor <init>(D)V
    .registers 4
    .param p1, "v"    # D

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/codehaus/jackson/node/NumericNode;-><init>()V

    iput-wide p1, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    return-void
.end method

.method public static valueOf(D)Lorg/codehaus/jackson/node/DoubleNode;
    .registers 4
    .param p0, "v"    # D

    .prologue
    .line 28
    new-instance v0, Lorg/codehaus/jackson/node/DoubleNode;

    invoke-direct {v0, p0, p1}, Lorg/codehaus/jackson/node/DoubleNode;-><init>(D)V

    return-object v0
.end method


# virtual methods
.method public asToken()Lorg/codehaus/jackson/JsonToken;
    .registers 2

    .prologue
    .line 36
    sget-object v0, Lorg/codehaus/jackson/JsonToken;->VALUE_NUMBER_FLOAT:Lorg/codehaus/jackson/JsonToken;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 90
    if-ne p1, p0, :cond_5

    .line 95
    .end local p1    # "o":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .line 91
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5
    if-nez p1, :cond_9

    move v0, v1

    goto :goto_4

    .line 92
    :cond_9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_15

    move v0, v1

    .line 93
    goto :goto_4

    .line 95
    :cond_15
    check-cast p1, Lorg/codehaus/jackson/node/DoubleNode;

    .end local p1    # "o":Ljava/lang/Object;
    iget-wide v2, p1, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    iget-wide v4, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getBigIntegerValue()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/codehaus/jackson/node/DoubleNode;->getDecimalValue()Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getDecimalValue()Ljava/math/BigDecimal;
    .registers 3

    .prologue
    .line 68
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method public getDoubleValue()D
    .registers 3

    .prologue
    .line 65
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    return-wide v0
.end method

.method public getIntValue()I
    .registers 3

    .prologue
    .line 59
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    double-to-int v0, v0

    return v0
.end method

.method public getLongValue()J
    .registers 3

    .prologue
    .line 62
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    double-to-long v0, v0

    return-wide v0
.end method

.method public getNumberType()Lorg/codehaus/jackson/JsonParser$NumberType;
    .registers 2

    .prologue
    .line 39
    sget-object v0, Lorg/codehaus/jackson/JsonParser$NumberType;->DOUBLE:Lorg/codehaus/jackson/JsonParser$NumberType;

    return-object v0
.end method

.method public getNumberValue()Ljava/lang/Number;
    .registers 3

    .prologue
    .line 55
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsText()Ljava/lang/String;
    .registers 3

    .prologue
    .line 77
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    invoke-static {v0, v1}, Lorg/codehaus/jackson/io/NumberOutput;->toString(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 102
    iget-wide v2, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 103
    .local v0, "l":J
    long-to-int v2, v0

    const/16 v3, 0x20

    shr-long v4, v0, v3

    long-to-int v3, v4

    xor-int/2addr v2, v3

    return v2
.end method

.method public isDouble()Z
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public isFloatingPointNumber()Z
    .registers 2

    .prologue
    .line 48
    const/4 v0, 0x1

    return v0
.end method

.method public final serialize(Lorg/codehaus/jackson/JsonGenerator;Lorg/codehaus/jackson/map/SerializerProvider;)V
    .registers 5
    .param p1, "jg"    # Lorg/codehaus/jackson/JsonGenerator;
    .param p2, "provider"    # Lorg/codehaus/jackson/map/SerializerProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/codehaus/jackson/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 84
    iget-wide v0, p0, Lorg/codehaus/jackson/node/DoubleNode;->_value:D

    invoke-virtual {p1, v0, v1}, Lorg/codehaus/jackson/JsonGenerator;->writeNumber(D)V

    .line 85
    return-void
.end method
