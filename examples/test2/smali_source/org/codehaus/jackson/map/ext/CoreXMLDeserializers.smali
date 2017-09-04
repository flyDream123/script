.class public Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers;
.super Ljava/lang/Object;
.source "CoreXMLDeserializers.java"

# interfaces
.implements Lorg/codehaus/jackson/map/util/Provider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$QNameDeserializer;,
        Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$GregorianCalendarDeserializer;,
        Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$DurationDeserializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/codehaus/jackson/map/util/Provider",
        "<",
        "Lorg/codehaus/jackson/map/deser/StdDeserializer",
        "<*>;>;"
    }
.end annotation


# static fields
.field static final _dataTypeFactory:Ljavax/xml/datatype/DatatypeFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 38
    :try_start_0
    invoke-static {}, Ljavax/xml/datatype/DatatypeFactory;->newInstance()Ljavax/xml/datatype/DatatypeFactory;

    move-result-object v1

    sput-object v1, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers;->_dataTypeFactory:Ljavax/xml/datatype/DatatypeFactory;
    :try_end_6
    .catch Ljavax/xml/datatype/DatatypeConfigurationException; {:try_start_0 .. :try_end_6} :catch_7

    .line 42
    return-void

    .line 39
    :catch_7
    move-exception v0

    .line 40
    .local v0, "e":Ljavax/xml/datatype/DatatypeConfigurationException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    return-void
.end method


# virtual methods
.method public provide()Ljava/util/Collection;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/codehaus/jackson/map/deser/StdDeserializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 56
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/codehaus/jackson/map/deser/StdDeserializer;

    const/4 v1, 0x0

    new-instance v2, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$DurationDeserializer;

    invoke-direct {v2}, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$DurationDeserializer;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$GregorianCalendarDeserializer;

    invoke-direct {v2}, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$GregorianCalendarDeserializer;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$QNameDeserializer;

    invoke-direct {v2}, Lorg/codehaus/jackson/map/ext/CoreXMLDeserializers$QNameDeserializer;-><init>()V

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
