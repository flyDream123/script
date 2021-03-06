package org.codehaus.jackson.map.jsontype.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.introspect.BasicBeanDescription;
import org.codehaus.jackson.map.jsontype.NamedType;
import org.codehaus.jackson.type.JavaType;

public class TypeNameIdResolver
  extends TypeIdResolverBase
{
  protected final MapperConfig<?> _config;
  protected final HashMap<String, JavaType> _idToType;
  protected final HashMap<String, String> _typeToId;
  
  protected TypeNameIdResolver(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, HashMap<String, String> paramHashMap, HashMap<String, JavaType> paramHashMap1)
  {
    super(paramJavaType, paramMapperConfig.getTypeFactory());
    _config = paramMapperConfig;
    _typeToId = paramHashMap;
    _idToType = paramHashMap1;
  }
  
  protected static String _defaultTypeId(Class<?> paramClass)
  {
    paramClass = paramClass.getName();
    int i = paramClass.lastIndexOf('.');
    if (i < 0) {
      return paramClass;
    }
    return paramClass.substring(i + 1);
  }
  
  public static TypeNameIdResolver construct(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1 == paramBoolean2) {
      throw new IllegalArgumentException();
    }
    HashMap localHashMap1 = null;
    HashMap localHashMap2 = null;
    if (paramBoolean1) {
      localHashMap1 = new HashMap();
    }
    if (paramBoolean2) {
      localHashMap2 = new HashMap();
    }
    if (paramCollection != null)
    {
      Iterator localIterator = paramCollection.iterator();
      if (localIterator.hasNext())
      {
        paramCollection = (NamedType)localIterator.next();
        Class localClass = paramCollection.getType();
        if (paramCollection.hasName()) {}
        for (paramCollection = paramCollection.getName();; paramCollection = _defaultTypeId(localClass))
        {
          if (paramBoolean1) {
            localHashMap1.put(localClass.getName(), paramCollection);
          }
          if (!paramBoolean2) {
            break;
          }
          JavaType localJavaType = (JavaType)localHashMap2.get(paramCollection);
          if ((localJavaType != null) && (localClass.isAssignableFrom(localJavaType.getRawClass()))) {
            break;
          }
          localHashMap2.put(paramCollection, paramMapperConfig.constructType(localClass));
          break;
        }
      }
    }
    return new TypeNameIdResolver(paramMapperConfig, paramJavaType, localHashMap1, localHashMap2);
  }
  
  public JsonTypeInfo.Id getMechanism()
  {
    return JsonTypeInfo.Id.NAME;
  }
  
  public String idFromValue(Object paramObject)
  {
    Class localClass = paramObject.getClass();
    String str = localClass.getName();
    synchronized (_typeToId)
    {
      paramObject = (String)_typeToId.get(str);
      Object localObject = paramObject;
      if (paramObject == null)
      {
        if (_config.isAnnotationProcessingEnabled())
        {
          paramObject = (BasicBeanDescription)_config.introspectClassAnnotations(localClass);
          paramObject = _config.getAnnotationIntrospector().findTypeName(paramObject.getClassInfo());
        }
        localObject = paramObject;
        if (paramObject == null) {
          localObject = _defaultTypeId(localClass);
        }
        _typeToId.put(str, localObject);
      }
      return localObject;
    }
  }
  
  public String idFromValueAndType(Object paramObject, Class<?> paramClass)
  {
    return idFromValue(paramObject);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append('[').append(getClass().getName());
    localStringBuilder.append("; id-to-type=").append(_idToType);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }
  
  public JavaType typeFromId(String paramString)
    throws IllegalArgumentException
  {
    return (JavaType)_idToType.get(paramString);
  }
}
