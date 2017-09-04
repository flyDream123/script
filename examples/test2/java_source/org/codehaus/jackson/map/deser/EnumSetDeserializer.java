package org.codehaus.jackson.map.deser;

import java.io.IOException;
import java.util.EnumSet;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.TypeDeserializer;

public final class EnumSetDeserializer
  extends StdDeserializer<EnumSet<?>>
{
  final Class<Enum> _enumClass;
  final EnumDeserializer _enumDeserializer;
  
  public EnumSetDeserializer(EnumResolver paramEnumResolver)
  {
    super(EnumSet.class);
    _enumDeserializer = new EnumDeserializer(paramEnumResolver);
    _enumClass = paramEnumResolver.getEnumClass();
  }
  
  private EnumSet constructSet()
  {
    return EnumSet.noneOf(_enumClass);
  }
  
  public EnumSet<?> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (!paramJsonParser.isExpectedStartArrayToken()) {
      throw paramDeserializationContext.mappingException(EnumSet.class);
    }
    EnumSet localEnumSet = constructSet();
    for (;;)
    {
      JsonToken localJsonToken = paramJsonParser.nextToken();
      if (localJsonToken == JsonToken.END_ARRAY) {
        break;
      }
      if (localJsonToken == JsonToken.VALUE_NULL) {
        throw paramDeserializationContext.mappingException(_enumClass);
      }
      localEnumSet.add(_enumDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
    }
    return localEnumSet;
  }
  
  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromArray(paramJsonParser, paramDeserializationContext);
  }
}