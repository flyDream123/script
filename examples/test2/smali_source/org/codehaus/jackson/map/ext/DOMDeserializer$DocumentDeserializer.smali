.class public Lorg/codehaus/jackson/map/ext/DOMDeserializer$DocumentDeserializer;
.super Lorg/codehaus/jackson/map/ext/DOMDeserializer;
.source "DOMDeserializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/codehaus/jackson/map/ext/DOMDeserializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DocumentDeserializer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/codehaus/jackson/map/ext/DOMDeserializer",
        "<",
        "Lorg/w3c/dom/Document;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    const-class v0, Lorg/w3c/dom/Document;

    invoke-direct {p0, v0}, Lorg/codehaus/jackson/map/ext/DOMDeserializer;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic _deserialize(Ljava/lang/String;Lorg/codehaus/jackson/map/DeserializationContext;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lorg/codehaus/jackson/map/DeserializationContext;

    .prologue
    .line 56
    invoke-virtual {p0, p1, p2}, Lorg/codehaus/jackson/map/ext/DOMDeserializer$DocumentDeserializer;->_deserialize(Ljava/lang/String;Lorg/codehaus/jackson/map/DeserializationContext;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method public _deserialize(Ljava/lang/String;Lorg/codehaus/jackson/map/DeserializationContext;)Lorg/w3c/dom/Document;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "ctxt"    # Lorg/codehaus/jackson/map/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Lorg/codehaus/jackson/map/ext/DOMDeserializer$DocumentDeserializer;->parse(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method
