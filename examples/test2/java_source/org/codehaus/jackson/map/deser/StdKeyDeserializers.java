package org.codehaus.jackson.map.deser;

import java.util.HashMap;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.KeyDeserializer;
import org.codehaus.jackson.map.introspect.BasicBeanDescription;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.type.JavaType;

class StdKeyDeserializers
{
  final HashMap<JavaType, KeyDeserializer> _keyDeserializers = new HashMap();
  
  private StdKeyDeserializers()
  {
    add(new StdKeyDeserializer.BoolKD());
    add(new StdKeyDeserializer.ByteKD());
    add(new StdKeyDeserializer.CharKD());
    add(new StdKeyDeserializer.ShortKD());
    add(new StdKeyDeserializer.IntKD());
    add(new StdKeyDeserializer.LongKD());
    add(new StdKeyDeserializer.FloatKD());
    add(new StdKeyDeserializer.DoubleKD());
  }
  
  private void add(StdKeyDeserializer paramStdKeyDeserializer)
  {
    Class localClass = paramStdKeyDeserializer.getKeyClass();
    _keyDeserializers.put(TypeFactory.defaultInstance().constructType(localClass), paramStdKeyDeserializer);
  }
  
  public static HashMap<JavaType, KeyDeserializer> constructAll()
  {
    return StdKeyDeserializers_keyDeserializers;
  }
  
  public static KeyDeserializer constructEnumKeyDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
  {
    return new StdKeyDeserializer.EnumKD(EnumResolver.constructUnsafe(paramJavaType.getRawClass(), paramDeserializationConfig.getAnnotationIntrospector()));
  }
  
  public static KeyDeserializer findStringBasedKeyDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
  {
    paramDeserializationConfig = (BasicBeanDescription)paramDeserializationConfig.introspect(paramJavaType);
    paramJavaType = paramDeserializationConfig.findSingleArgConstructor(new Class[] { String.class });
    if (paramJavaType != null) {
      return new StdKeyDeserializer.StringCtorKeyDeserializer(paramJavaType);
    }
    paramDeserializationConfig = paramDeserializationConfig.findFactoryMethod(new Class[] { String.class });
    if (paramDeserializationConfig != null) {
      return new StdKeyDeserializer.StringFactoryKeyDeserializer(paramDeserializationConfig);
    }
    return null;
  }
}
