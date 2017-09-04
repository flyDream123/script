package org.codehaus.jackson.map.type;

import java.lang.reflect.Type;
import org.codehaus.jackson.type.JavaType;

public abstract class TypeModifier
{
  public TypeModifier() {}
  
  public abstract JavaType modifyType(JavaType paramJavaType, Type paramType, TypeBindings paramTypeBindings, TypeFactory paramTypeFactory);
}
