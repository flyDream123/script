package org.codehaus.jackson.map.deser;

import java.io.IOException;
import java.util.EnumMap;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.TypeDeserializer;

public final class EnumMapDeserializer
  extends StdDeserializer<EnumMap<?, ?>>
{
  final EnumResolver<?> _enumResolver;
  final JsonDeserializer<Object> _valueDeserializer;
  
  public EnumMapDeserializer(EnumResolver<?> paramEnumResolver, JsonDeserializer<Object> paramJsonDeserializer)
  {
    super(EnumMap.class);
    _enumResolver = paramEnumResolver;
    _valueDeserializer = paramJsonDeserializer;
  }
  
  private EnumMap<?, ?> constructMap()
  {
    return new EnumMap(_enumResolver.getEnumClass());
  }
  
  public EnumMap<?, ?> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getCurrentToken() != JsonToken.START_OBJECT) {
      throw paramDeserializationContext.mappingException(EnumMap.class);
    }
    EnumMap localEnumMap = constructMap();
    if (paramJsonParser.nextToken() != JsonToken.END_OBJECT)
    {
      Object localObject = paramJsonParser.getCurrentName();
      Enum localEnum = _enumResolver.findEnum((String)localObject);
      if (localEnum == null) {
        throw paramDeserializationContext.weirdStringException(_enumResolver.getEnumClass(), "value not one of declared Enum instance names");
      }
      if (paramJsonParser.nextToken() == JsonToken.VALUE_NULL) {}
      for (localObject = null;; localObject = _valueDeserializer.deserialize(paramJsonParser, paramDeserializationContext))
      {
        localEnumMap.put(localEnum, localObject);
        break;
      }
    }
    return localEnumMap;
  }
  
  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }
}
