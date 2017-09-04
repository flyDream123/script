.class public Lorg/codehaus/jackson/format/DataFormatMatcher;
.super Ljava/lang/Object;
.source "DataFormatMatcher.java"


# instance fields
.field protected final _bufferedData:[B

.field protected final _bufferedLength:I

.field protected final _match:Lorg/codehaus/jackson/JsonFactory;

.field protected final _matchStrength:Lorg/codehaus/jackson/format/MatchStrength;

.field protected final _originalStream:Ljava/io/InputStream;


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;[BILorg/codehaus/jackson/JsonFactory;Lorg/codehaus/jackson/format/MatchStrength;)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "buffered"    # [B
    .param p3, "bufferedLength"    # I
    .param p4, "match"    # Lorg/codehaus/jackson/JsonFactory;
    .param p5, "strength"    # Lorg/codehaus/jackson/format/MatchStrength;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_originalStream:Ljava/io/InputStream;

    .line 41
    iput-object p2, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedData:[B

    .line 42
    iput p3, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedLength:I

    .line 43
    iput-object p4, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    .line 44
    iput-object p5, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_matchStrength:Lorg/codehaus/jackson/format/MatchStrength;

    .line 45
    return-void
.end method


# virtual methods
.method public createParserWithMatch()Lorg/codehaus/jackson/JsonParser;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    if-nez v0, :cond_6

    .line 96
    const/4 v0, 0x0

    .line 101
    :goto_5
    return-object v0

    .line 98
    :cond_6
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_originalStream:Ljava/io/InputStream;

    if-nez v0, :cond_16

    .line 99
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    iget-object v1, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedData:[B

    const/4 v2, 0x0

    iget v3, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedLength:I

    invoke-virtual {v0, v1, v2, v3}, Lorg/codehaus/jackson/JsonFactory;->createJsonParser([BII)Lorg/codehaus/jackson/JsonParser;

    move-result-object v0

    goto :goto_5

    .line 101
    :cond_16
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    invoke-virtual {p0}, Lorg/codehaus/jackson/format/DataFormatMatcher;->getDataStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/codehaus/jackson/JsonFactory;->createJsonParser(Ljava/io/InputStream;)Lorg/codehaus/jackson/JsonParser;

    move-result-object v0

    goto :goto_5
.end method

.method public getDataStream()Ljava/io/InputStream;
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 112
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_originalStream:Ljava/io/InputStream;

    if-nez v0, :cond_f

    .line 113
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedData:[B

    iget v2, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedLength:I

    invoke-direct {v0, v1, v4, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 115
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Lorg/codehaus/jackson/io/MergedStream;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_originalStream:Ljava/io/InputStream;

    iget-object v3, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedData:[B

    iget v5, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_bufferedLength:I

    invoke-direct/range {v0 .. v5}, Lorg/codehaus/jackson/io/MergedStream;-><init>(Lorg/codehaus/jackson/io/IOContext;Ljava/io/InputStream;[BII)V

    goto :goto_e
.end method

.method public getMatch()Lorg/codehaus/jackson/JsonFactory;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    return-object v0
.end method

.method public getMatchStrength()Lorg/codehaus/jackson/format/MatchStrength;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_matchStrength:Lorg/codehaus/jackson/format/MatchStrength;

    if-nez v0, :cond_7

    sget-object v0, Lorg/codehaus/jackson/format/MatchStrength;->INCONCLUSIVE:Lorg/codehaus/jackson/format/MatchStrength;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_matchStrength:Lorg/codehaus/jackson/format/MatchStrength;

    goto :goto_6
.end method

.method public getMatchedFormatName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    invoke-virtual {v0}, Lorg/codehaus/jackson/JsonFactory;->getFormatName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasMatch()Z
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/codehaus/jackson/format/DataFormatMatcher;->_match:Lorg/codehaus/jackson/JsonFactory;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method