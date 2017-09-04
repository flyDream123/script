package org.codehaus.jackson.map.deser;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicReference;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.AnnotationIntrospector;
import org.codehaus.jackson.map.BeanProperty;
import org.codehaus.jackson.map.BeanProperty.Std;
import org.codehaus.jackson.map.ContextualDeserializer;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.DeserializationConfig.Feature;
import org.codehaus.jackson.map.DeserializerFactory;
import org.codehaus.jackson.map.DeserializerFactory.Config;
import org.codehaus.jackson.map.DeserializerProvider;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonDeserializer.None;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.KeyDeserializer;
import org.codehaus.jackson.map.KeyDeserializer.None;
import org.codehaus.jackson.map.TypeDeserializer;
import org.codehaus.jackson.map.deser.impl.StringCollectionDeserializer;
import org.codehaus.jackson.map.ext.OptionalHandlerFactory;
import org.codehaus.jackson.map.introspect.Annotated;
import org.codehaus.jackson.map.introspect.AnnotatedClass;
import org.codehaus.jackson.map.introspect.AnnotatedConstructor;
import org.codehaus.jackson.map.introspect.AnnotatedMember;
import org.codehaus.jackson.map.introspect.AnnotatedMethod;
import org.codehaus.jackson.map.introspect.AnnotatedParameter;
import org.codehaus.jackson.map.introspect.BasicBeanDescription;
import org.codehaus.jackson.map.jsontype.SubtypeResolver;
import org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import org.codehaus.jackson.map.type.ArrayType;
import org.codehaus.jackson.map.type.CollectionLikeType;
import org.codehaus.jackson.map.type.CollectionType;
import org.codehaus.jackson.map.type.MapLikeType;
import org.codehaus.jackson.map.type.MapType;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.map.util.ClassUtil;
import org.codehaus.jackson.type.JavaType;

public abstract class BasicDeserializerFactory
  extends DeserializerFactory
{
  protected static final HashMap<JavaType, JsonDeserializer<Object>> _arrayDeserializers;
  static final HashMap<String, Class<? extends Collection>> _collectionFallbacks;
  static final HashMap<String, Class<? extends Map>> _mapFallbacks;
  static final HashMap<JavaType, JsonDeserializer<Object>> _simpleDeserializers = ;
  protected OptionalHandlerFactory optionalHandlers = OptionalHandlerFactory.instance;
  
  static
  {
    _mapFallbacks = new HashMap();
    _mapFallbacks.put(Map.class.getName(), LinkedHashMap.class);
    _mapFallbacks.put(ConcurrentMap.class.getName(), ConcurrentHashMap.class);
    _mapFallbacks.put(SortedMap.class.getName(), TreeMap.class);
    _mapFallbacks.put("java.util.NavigableMap", TreeMap.class);
    try
    {
      Class localClass1 = Class.forName("java.util.ConcurrentNavigableMap");
      Class localClass2 = Class.forName("java.util.ConcurrentSkipListMap");
      _mapFallbacks.put(localClass1.getName(), localClass2);
      _collectionFallbacks = new HashMap();
      _collectionFallbacks.put(Collection.class.getName(), ArrayList.class);
      _collectionFallbacks.put(List.class.getName(), ArrayList.class);
      _collectionFallbacks.put(Set.class.getName(), HashSet.class);
      _collectionFallbacks.put(SortedSet.class.getName(), TreeSet.class);
      _collectionFallbacks.put(Queue.class.getName(), LinkedList.class);
      _collectionFallbacks.put("java.util.Deque", LinkedList.class);
      _collectionFallbacks.put("java.util.NavigableSet", TreeSet.class);
      _arrayDeserializers = ArrayDeserializers.getAll();
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      for (;;) {}
    }
  }
  
  protected BasicDeserializerFactory() {}
  
  JsonDeserializer<Object> _constructDeserializer(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, BeanProperty paramBeanProperty, Object paramObject)
    throws JsonMappingException
  {
    if ((paramObject instanceof JsonDeserializer))
    {
      paramObject = (JsonDeserializer)paramObject;
      paramAnnotated = paramObject;
      if ((paramObject instanceof ContextualDeserializer)) {
        paramAnnotated = ((ContextualDeserializer)paramObject).createContextual(paramDeserializationConfig, paramBeanProperty);
      }
    }
    do
    {
      return paramAnnotated;
      if (!(paramObject instanceof Class)) {
        throw new IllegalStateException("AnnotationIntrospector returned deserializer definition of type " + paramObject.getClass().getName() + "; expected type JsonDeserializer or Class<JsonDeserializer> instead");
      }
      paramObject = (Class)paramObject;
      if (!JsonDeserializer.class.isAssignableFrom(paramObject)) {
        throw new IllegalStateException("AnnotationIntrospector returned Class " + paramObject.getName() + "; expected Class<JsonDeserializer>");
      }
      paramObject = paramDeserializationConfig.deserializerInstance(paramAnnotated, paramObject);
      paramAnnotated = paramObject;
    } while (!(paramObject instanceof ContextualDeserializer));
    return ((ContextualDeserializer)paramObject).createContextual(paramDeserializationConfig, paramBeanProperty);
  }
  
  protected abstract JsonDeserializer<?> _findCustomArrayDeserializer(ArrayType paramArrayType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomCollectionDeserializer(CollectionType paramCollectionType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomCollectionLikeDeserializer(CollectionLikeType paramCollectionLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomEnumDeserializer(Class<?> paramClass, DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomMapDeserializer(MapType paramMapType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomMapLikeDeserializer(MapLikeType paramMapLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;
  
  protected abstract JsonDeserializer<?> _findCustomTreeNodeDeserializer(Class<? extends JsonNode> paramClass, DeserializationConfig paramDeserializationConfig, BeanProperty paramBeanProperty)
    throws JsonMappingException;
  
  protected SettableBeanProperty constructCreatorProperty(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, String paramString, int paramInt, AnnotatedParameter paramAnnotatedParameter)
    throws JsonMappingException
  {
    JavaType localJavaType2 = paramDeserializationConfig.getTypeFactory().constructType(paramAnnotatedParameter.getParameterType(), paramBasicBeanDescription.bindingsForBeanType());
    Object localObject2 = new BeanProperty.Std(paramString, localJavaType2, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedParameter);
    JavaType localJavaType1 = resolveType(paramDeserializationConfig, paramBasicBeanDescription, localJavaType2, paramAnnotatedParameter, (BeanProperty)localObject2);
    Object localObject1 = localObject2;
    if (localJavaType1 != localJavaType2) {
      localObject1 = ((BeanProperty.Std)localObject2).withType(localJavaType1);
    }
    localObject2 = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedParameter, (BeanProperty)localObject1);
    localJavaType1 = modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedParameter, localJavaType1, paramString);
    paramDeserializationConfig = new SettableBeanProperty.CreatorProperty(paramString, localJavaType1, findTypeDeserializer(paramDeserializationConfig, localJavaType1, (BeanProperty)localObject1), paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedParameter, paramInt);
    if (localObject2 != null) {
      paramDeserializationConfig.setValueDeserializer((JsonDeserializer)localObject2);
    }
    return paramDeserializationConfig;
  }
  
  protected EnumResolver<?> constructEnumResolver(Class<?> paramClass, DeserializationConfig paramDeserializationConfig)
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.READ_ENUMS_USING_TO_STRING)) {
      return EnumResolver.constructUnsafeUsingToString(paramClass);
    }
    return EnumResolver.constructUnsafe(paramClass, paramDeserializationConfig.getAnnotationIntrospector());
  }
  
  public JsonDeserializer<?> createArrayDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, ArrayType paramArrayType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JavaType localJavaType = paramArrayType.getContentType();
    JsonDeserializer localJsonDeserializer = (JsonDeserializer)localJavaType.getValueHandler();
    if (localJsonDeserializer == null)
    {
      localObject1 = (JsonDeserializer)_arrayDeserializers.get(localJavaType);
      if (localObject1 != null)
      {
        paramDeserializerProvider = _findCustomArrayDeserializer(paramArrayType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty, null, null);
        paramDeserializationConfig = (DeserializationConfig)localObject1;
        if (paramDeserializerProvider != null) {
          paramDeserializationConfig = paramDeserializerProvider;
        }
        return paramDeserializationConfig;
      }
      if (localJavaType.isPrimitive()) {
        throw new IllegalArgumentException("Internal error: primitive type (" + paramArrayType + ") passed, no array deserializer found");
      }
    }
    Object localObject2 = (TypeDeserializer)localJavaType.getTypeHandler();
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    localObject2 = _findCustomArrayDeserializer(paramArrayType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty, (TypeDeserializer)localObject1, localJsonDeserializer);
    if (localObject2 != null) {
      return localObject2;
    }
    localObject2 = localJsonDeserializer;
    if (localJsonDeserializer == null) {
      localObject2 = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    return new ArrayDeserializer(paramArrayType, (JsonDeserializer)localObject2, (TypeDeserializer)localObject1);
  }
  
  public JsonDeserializer<?> createCollectionDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, CollectionType paramCollectionType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramCollectionType = (CollectionType)mapAbstractType(paramDeserializationConfig, paramCollectionType);
    Class localClass = paramCollectionType.getRawClass();
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(localClass);
    Object localObject = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localObject != null) {
      return localObject;
    }
    CollectionType localCollectionType = (CollectionType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramCollectionType, null);
    JavaType localJavaType = localCollectionType.getContentType();
    JsonDeserializer localJsonDeserializer = (JsonDeserializer)localJavaType.getValueHandler();
    localObject = (TypeDeserializer)localJavaType.getTypeHandler();
    paramCollectionType = (CollectionType)localObject;
    if (localObject == null) {
      paramCollectionType = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    localObject = _findCustomCollectionDeserializer(localCollectionType, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, paramCollectionType, localJsonDeserializer);
    if (localObject != null) {
      return localObject;
    }
    localObject = localJsonDeserializer;
    if (localJsonDeserializer == null)
    {
      if (EnumSet.class.isAssignableFrom(localClass)) {
        return new EnumSetDeserializer(constructEnumResolver(localJavaType.getRawClass(), paramDeserializationConfig));
      }
      localObject = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    if (!localCollectionType.isInterface())
    {
      paramDeserializerProvider = localClass;
      if (!localCollectionType.isAbstract()) {}
    }
    else
    {
      paramDeserializerProvider = (Class)_collectionFallbacks.get(localClass.getName());
      if (paramDeserializerProvider == null) {
        throw new IllegalArgumentException("Can not find a deserializer for non-concrete Collection type " + localCollectionType);
      }
    }
    paramDeserializationConfig = ClassUtil.findConstructor(paramDeserializerProvider, paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS));
    if (localJavaType.getRawClass() == String.class) {
      return new StringCollectionDeserializer(localCollectionType, (JsonDeserializer)localObject, paramDeserializationConfig);
    }
    return new CollectionDeserializer(localCollectionType, (JsonDeserializer)localObject, paramCollectionType, paramDeserializationConfig);
  }
  
  public JsonDeserializer<?> createCollectionLikeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, CollectionLikeType paramCollectionLikeType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramCollectionLikeType = (CollectionLikeType)mapAbstractType(paramDeserializationConfig, paramCollectionLikeType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(paramCollectionLikeType.getRawClass());
    Object localObject = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localObject != null) {
      return localObject;
    }
    CollectionLikeType localCollectionLikeType = (CollectionLikeType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramCollectionLikeType, null);
    JavaType localJavaType = localCollectionLikeType.getContentType();
    JsonDeserializer localJsonDeserializer = (JsonDeserializer)localJavaType.getValueHandler();
    localObject = (TypeDeserializer)localJavaType.getTypeHandler();
    paramCollectionLikeType = (CollectionLikeType)localObject;
    if (localObject == null) {
      paramCollectionLikeType = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    return _findCustomCollectionLikeDeserializer(localCollectionLikeType, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, paramCollectionLikeType, localJsonDeserializer);
  }
  
  public JsonDeserializer<?> createEnumDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramDeserializerProvider = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(paramJavaType);
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramDeserializerProvider.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer != null) {
      return localJsonDeserializer;
    }
    paramJavaType = paramJavaType.getRawClass();
    paramBeanProperty = _findCustomEnumDeserializer(paramJavaType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty);
    if (paramBeanProperty != null) {
      return paramBeanProperty;
    }
    paramDeserializerProvider = paramDeserializerProvider.getFactoryMethods().iterator();
    while (paramDeserializerProvider.hasNext())
    {
      paramBeanProperty = (AnnotatedMethod)paramDeserializerProvider.next();
      if (paramDeserializationConfig.getAnnotationIntrospector().hasCreatorAnnotation(paramBeanProperty))
      {
        if ((paramBeanProperty.getParameterCount() == 1) && (paramBeanProperty.getRawType().isAssignableFrom(paramJavaType))) {
          return EnumDeserializer.deserializerForCreator(paramDeserializationConfig, paramJavaType, paramBeanProperty);
        }
        throw new IllegalArgumentException("Unsuitable method (" + paramBeanProperty + ") decorated with @JsonCreator (for Enum type " + paramJavaType.getName() + ")");
      }
    }
    return new EnumDeserializer(constructEnumResolver(paramJavaType, paramDeserializationConfig));
  }
  
  public JsonDeserializer<?> createMapDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, MapType paramMapType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramMapType = (MapType)mapAbstractType(paramDeserializationConfig, paramMapType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(paramMapType);
    Object localObject1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localObject1 != null) {
      return localObject1;
    }
    Object localObject3 = (MapType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramMapType, null);
    JavaType localJavaType1 = ((MapType)localObject3).getKeyType();
    JavaType localJavaType2 = ((MapType)localObject3).getContentType();
    Object localObject4 = (JsonDeserializer)localJavaType2.getValueHandler();
    localObject1 = (KeyDeserializer)localJavaType1.getValueHandler();
    paramMapType = (MapType)localObject1;
    if (localObject1 == null) {
      paramMapType = paramDeserializerProvider.findKeyDeserializer(paramDeserializationConfig, localJavaType1, paramBeanProperty);
    }
    Object localObject2 = (TypeDeserializer)localJavaType2.getTypeHandler();
    localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = findTypeDeserializer(paramDeserializationConfig, localJavaType2, paramBeanProperty);
    }
    localObject2 = _findCustomMapDeserializer((MapType)localObject3, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, paramMapType, (TypeDeserializer)localObject1, (JsonDeserializer)localObject4);
    if (localObject2 != null) {
      return localObject2;
    }
    localObject2 = localObject4;
    if (localObject4 == null) {
      localObject2 = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType2, paramBeanProperty);
    }
    localObject4 = ((MapType)localObject3).getRawClass();
    if (EnumMap.class.isAssignableFrom((Class)localObject4))
    {
      paramDeserializerProvider = localJavaType1.getRawClass();
      if ((paramDeserializerProvider == null) || (!paramDeserializerProvider.isEnum())) {
        throw new IllegalArgumentException("Can not construct EnumMap; generic (key) type not available");
      }
      return new EnumMapDeserializer(constructEnumResolver(paramDeserializerProvider, paramDeserializationConfig), (JsonDeserializer)localObject2);
    }
    if (!((MapType)localObject3).isInterface())
    {
      paramDeserializerProvider = localBasicBeanDescription;
      paramBeanProperty = (BeanProperty)localObject3;
      if (!((MapType)localObject3).isAbstract()) {}
    }
    else
    {
      paramDeserializerProvider = (Class)_mapFallbacks.get(((Class)localObject4).getName());
      if (paramDeserializerProvider == null) {
        throw new IllegalArgumentException("Can not find a deserializer for non-concrete Map type " + localObject3);
      }
      paramBeanProperty = (MapType)((MapType)localObject3).forcedNarrowBy(paramDeserializerProvider);
      paramDeserializerProvider = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(paramBeanProperty);
    }
    boolean bool = paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
    localObject3 = paramDeserializerProvider.findDefaultConstructor();
    if ((localObject3 != null) && (bool)) {
      ClassUtil.checkAndFixAccess((Member)localObject3);
    }
    paramMapType = new MapDeserializer(paramBeanProperty, (Constructor)localObject3, paramMapType, (JsonDeserializer)localObject2, (TypeDeserializer)localObject1);
    paramMapType.setIgnorableProperties(paramDeserializationConfig.getAnnotationIntrospector().findPropertiesToIgnore(paramDeserializerProvider.getClassInfo()));
    paramMapType.setCreators(findMapCreators(paramDeserializationConfig, paramDeserializerProvider));
    return paramMapType;
  }
  
  public JsonDeserializer<?> createMapLikeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, MapLikeType paramMapLikeType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramMapLikeType = (MapLikeType)mapAbstractType(paramDeserializationConfig, paramMapLikeType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(paramMapLikeType);
    Object localObject1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localObject1 != null) {
      return localObject1;
    }
    MapLikeType localMapLikeType = (MapLikeType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramMapLikeType, null);
    Object localObject2 = localMapLikeType.getKeyType();
    JavaType localJavaType = localMapLikeType.getContentType();
    JsonDeserializer localJsonDeserializer = (JsonDeserializer)localJavaType.getValueHandler();
    localObject1 = (KeyDeserializer)((JavaType)localObject2).getValueHandler();
    paramMapLikeType = (MapLikeType)localObject1;
    if (localObject1 == null) {
      paramMapLikeType = paramDeserializerProvider.findKeyDeserializer(paramDeserializationConfig, (JavaType)localObject2, paramBeanProperty);
    }
    localObject2 = (TypeDeserializer)localJavaType.getTypeHandler();
    localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    return _findCustomMapLikeDeserializer(localMapLikeType, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, paramMapLikeType, (TypeDeserializer)localObject1, localJsonDeserializer);
  }
  
  public JsonDeserializer<?> createTreeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    paramDeserializerProvider = paramJavaType.getRawClass();
    paramDeserializationConfig = _findCustomTreeNodeDeserializer(paramDeserializerProvider, paramDeserializationConfig, paramBeanProperty);
    if (paramDeserializationConfig != null) {
      return paramDeserializationConfig;
    }
    return JsonNodeDeserializer.getDeserializer(paramDeserializerProvider);
  }
  
  protected JsonDeserializer<Object> findDeserializerFromAnnotation(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Object localObject = paramDeserializationConfig.getAnnotationIntrospector().findDeserializer(paramAnnotated);
    if (localObject != null) {
      return _constructDeserializer(paramDeserializationConfig, paramAnnotated, paramBeanProperty, localObject);
    }
    return null;
  }
  
  protected CreatorContainer findMapCreators(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException
  {
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    CreatorContainer localCreatorContainer = new CreatorContainer(paramBasicBeanDescription, paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS));
    Iterator localIterator = paramBasicBeanDescription.getConstructors().iterator();
    Object localObject;
    int k;
    SettableBeanProperty[] arrayOfSettableBeanProperty;
    int j;
    int i;
    AnnotatedParameter localAnnotatedParameter;
    String str;
    while (localIterator.hasNext())
    {
      localObject = (AnnotatedConstructor)localIterator.next();
      k = ((AnnotatedConstructor)localObject).getParameterCount();
      if ((k >= 1) && (localAnnotationIntrospector.hasCreatorAnnotation((Annotated)localObject)))
      {
        arrayOfSettableBeanProperty = new SettableBeanProperty[k];
        j = 0;
        i = 0;
        while (i < k)
        {
          localAnnotatedParameter = ((AnnotatedConstructor)localObject).getParameter(i);
          if (localAnnotatedParameter == null) {}
          for (str = null; (str == null) || (str.length() == 0); str = localAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter)) {
            throw new IllegalArgumentException("Parameter #" + i + " of constructor " + localObject + " has no property name annotation: must have for @JsonCreator for a Map type");
          }
          j += 1;
          arrayOfSettableBeanProperty[i] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str, i, localAnnotatedParameter);
          i += 1;
        }
        localCreatorContainer.addPropertyConstructor((AnnotatedConstructor)localObject, arrayOfSettableBeanProperty);
      }
    }
    localIterator = paramBasicBeanDescription.getFactoryMethods().iterator();
    while (localIterator.hasNext())
    {
      localObject = (AnnotatedMethod)localIterator.next();
      k = ((AnnotatedMethod)localObject).getParameterCount();
      if ((k >= 1) && (localAnnotationIntrospector.hasCreatorAnnotation((Annotated)localObject)))
      {
        arrayOfSettableBeanProperty = new SettableBeanProperty[k];
        j = 0;
        i = 0;
        while (i < k)
        {
          localAnnotatedParameter = ((AnnotatedMethod)localObject).getParameter(i);
          if (localAnnotatedParameter == null) {}
          for (str = null; (str == null) || (str.length() == 0); str = localAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter)) {
            throw new IllegalArgumentException("Parameter #" + i + " of factory method " + localObject + " has no property name annotation: must have for @JsonCreator for a Map type");
          }
          j += 1;
          arrayOfSettableBeanProperty[i] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str, i, localAnnotatedParameter);
          i += 1;
        }
        localCreatorContainer.addPropertyFactory((AnnotatedMethod)localObject, arrayOfSettableBeanProperty);
      }
    }
    return localCreatorContainer;
  }
  
  public TypeDeserializer findPropertyContentTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
  {
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyContentTypeResolver(paramDeserializationConfig, paramAnnotatedMember, paramJavaType);
    paramJavaType = paramJavaType.getContentType();
    if (localTypeResolverBuilder == null) {
      return findTypeDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    }
    return localTypeResolverBuilder.buildTypeDeserializer(paramDeserializationConfig, paramJavaType, paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramDeserializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }
  
  public TypeDeserializer findPropertyTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
  {
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyTypeResolver(paramDeserializationConfig, paramAnnotatedMember, paramJavaType);
    if (localTypeResolverBuilder == null) {
      return findTypeDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    }
    return localTypeResolverBuilder.buildTypeDeserializer(paramDeserializationConfig, paramJavaType, paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramDeserializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }
  
  protected JsonDeserializer<Object> findStdBeanDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonDeserializer localJsonDeserializer = (JsonDeserializer)_simpleDeserializers.get(paramJavaType);
    if (localJsonDeserializer != null) {
      return localJsonDeserializer;
    }
    if (AtomicReference.class.isAssignableFrom(paramJavaType.getRawClass()))
    {
      paramDeserializationConfig = paramDeserializationConfig.getTypeFactory().findTypeParameters(paramJavaType, AtomicReference.class);
      if ((paramDeserializationConfig == null) || (paramDeserializationConfig.length < 1)) {}
      for (paramDeserializationConfig = TypeFactory.unknownType();; paramDeserializationConfig = paramDeserializationConfig[0]) {
        return new StdDeserializer.AtomicReferenceDeserializer(paramDeserializationConfig, paramBeanProperty);
      }
    }
    paramDeserializationConfig = optionalHandlers.findDeserializer(paramJavaType, paramDeserializationConfig, paramDeserializerProvider);
    if (paramDeserializationConfig != null) {
      return paramDeserializationConfig;
    }
    return null;
  }
  
  public TypeDeserializer findTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
  {
    Object localObject2 = ((BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(paramJavaType.getRawClass())).getClassInfo();
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    Object localObject1 = localAnnotationIntrospector.findTypeResolver(paramDeserializationConfig, (AnnotatedClass)localObject2, paramJavaType);
    Collection localCollection = null;
    if (localObject1 == null)
    {
      localObject2 = paramDeserializationConfig.getDefaultTyper(paramJavaType);
      localObject1 = localObject2;
      if (localObject2 == null) {
        return null;
      }
    }
    else
    {
      localCollection = paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes((AnnotatedClass)localObject2, paramDeserializationConfig, localAnnotationIntrospector);
    }
    return ((TypeResolverBuilder)localObject1).buildTypeDeserializer(paramDeserializationConfig, paramJavaType, localCollection, paramBeanProperty);
  }
  
  protected abstract JavaType mapAbstractType(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException;
  
  /* Error */
  protected <T extends JavaType> T modifyTypeByAnnotation(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, T paramT, String paramString)
    throws JsonMappingException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 259	org/codehaus/jackson/map/DeserializationConfig:getAnnotationIntrospector	()Lorg/codehaus/jackson/map/AnnotationIntrospector;
    //   4: astore 6
    //   6: aload 6
    //   8: aload_2
    //   9: aload_3
    //   10: aload 4
    //   12: invokevirtual 636	org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationType	(Lorg/codehaus/jackson/map/introspect/Annotated;Lorg/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   15: astore 7
    //   17: aload_3
    //   18: astore 5
    //   20: aload 7
    //   22: ifnull +11 -> 33
    //   25: aload_3
    //   26: aload 7
    //   28: invokevirtual 639	org/codehaus/jackson/type/JavaType:narrowBy	(Ljava/lang/Class;)Lorg/codehaus/jackson/type/JavaType;
    //   31: astore 5
    //   33: aload 5
    //   35: astore_3
    //   36: aload 5
    //   38: invokevirtual 642	org/codehaus/jackson/type/JavaType:isContainerType	()Z
    //   41: ifeq +294 -> 335
    //   44: aload 6
    //   46: aload_2
    //   47: aload 5
    //   49: invokevirtual 643	org/codehaus/jackson/type/JavaType:getKeyType	()Lorg/codehaus/jackson/type/JavaType;
    //   52: aload 4
    //   54: invokevirtual 646	org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationKeyType	(Lorg/codehaus/jackson/map/introspect/Annotated;Lorg/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   57: astore 7
    //   59: aload 5
    //   61: astore_3
    //   62: aload 7
    //   64: ifnull +128 -> 192
    //   67: aload 5
    //   69: instanceof 443
    //   72: ifne +109 -> 181
    //   75: new 109	org/codehaus/jackson/map/JsonMappingException
    //   78: dup
    //   79: new 121	java/lang/StringBuilder
    //   82: dup
    //   83: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   86: ldc_w 648
    //   89: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: aload 5
    //   94: invokevirtual 295	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   97: ldc_w 650
    //   100: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   103: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   106: invokespecial 651	org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;)V
    //   109: athrow
    //   110: astore_1
    //   111: new 109	org/codehaus/jackson/map/JsonMappingException
    //   114: dup
    //   115: new 121	java/lang/StringBuilder
    //   118: dup
    //   119: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   122: ldc_w 653
    //   125: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   128: aload_3
    //   129: invokevirtual 295	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   132: ldc_w 655
    //   135: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: aload 7
    //   140: invokevirtual 41	java/lang/Class:getName	()Ljava/lang/String;
    //   143: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   146: ldc_w 657
    //   149: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: aload_2
    //   153: invokevirtual 660	org/codehaus/jackson/map/introspect/Annotated:getName	()Ljava/lang/String;
    //   156: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   159: ldc_w 662
    //   162: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   165: aload_1
    //   166: invokevirtual 665	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   169: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   172: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   175: aconst_null
    //   176: aload_1
    //   177: invokespecial 668	org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lorg/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   180: athrow
    //   181: aload 5
    //   183: checkcast 443	org/codehaus/jackson/map/type/MapType
    //   186: aload 7
    //   188: invokevirtual 671	org/codehaus/jackson/map/type/MapType:narrowKey	(Ljava/lang/Class;)Lorg/codehaus/jackson/type/JavaType;
    //   191: astore_3
    //   192: aload_3
    //   193: invokevirtual 643	org/codehaus/jackson/type/JavaType:getKeyType	()Lorg/codehaus/jackson/type/JavaType;
    //   196: astore 5
    //   198: aload 5
    //   200: ifnull +44 -> 244
    //   203: aload 5
    //   205: invokevirtual 278	org/codehaus/jackson/type/JavaType:getValueHandler	()Ljava/lang/Object;
    //   208: ifnonnull +36 -> 244
    //   211: aload 6
    //   213: aload_2
    //   214: invokevirtual 674	org/codehaus/jackson/map/AnnotationIntrospector:findKeyDeserializer	(Lorg/codehaus/jackson/map/introspect/Annotated;)Ljava/lang/Class;
    //   217: astore 7
    //   219: aload 7
    //   221: ifnull +23 -> 244
    //   224: aload 7
    //   226: ldc_w 676
    //   229: if_acmpeq +15 -> 244
    //   232: aload 5
    //   234: aload_1
    //   235: aload_2
    //   236: aload 7
    //   238: invokevirtual 680	org/codehaus/jackson/map/DeserializationConfig:keyDeserializerInstance	(Lorg/codehaus/jackson/map/introspect/Annotated;Ljava/lang/Class;)Lorg/codehaus/jackson/map/KeyDeserializer;
    //   241: invokevirtual 684	org/codehaus/jackson/type/JavaType:setValueHandler	(Ljava/lang/Object;)V
    //   244: aload 6
    //   246: aload_2
    //   247: aload_3
    //   248: invokevirtual 582	org/codehaus/jackson/type/JavaType:getContentType	()Lorg/codehaus/jackson/type/JavaType;
    //   251: aload 4
    //   253: invokevirtual 687	org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationContentType	(Lorg/codehaus/jackson/map/introspect/Annotated;Lorg/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   256: astore 5
    //   258: aload_3
    //   259: astore 4
    //   261: aload 5
    //   263: ifnull +11 -> 274
    //   266: aload_3
    //   267: aload 5
    //   269: invokevirtual 690	org/codehaus/jackson/type/JavaType:narrowContentsBy	(Ljava/lang/Class;)Lorg/codehaus/jackson/type/JavaType;
    //   272: astore 4
    //   274: aload 4
    //   276: astore_3
    //   277: aload 4
    //   279: invokevirtual 582	org/codehaus/jackson/type/JavaType:getContentType	()Lorg/codehaus/jackson/type/JavaType;
    //   282: invokevirtual 278	org/codehaus/jackson/type/JavaType:getValueHandler	()Ljava/lang/Object;
    //   285: ifnonnull +50 -> 335
    //   288: aload 6
    //   290: aload_2
    //   291: invokevirtual 693	org/codehaus/jackson/map/AnnotationIntrospector:findContentDeserializer	(Lorg/codehaus/jackson/map/introspect/Annotated;)Ljava/lang/Class;
    //   294: astore 5
    //   296: aload 4
    //   298: astore_3
    //   299: aload 5
    //   301: ifnull +34 -> 335
    //   304: aload 4
    //   306: astore_3
    //   307: aload 5
    //   309: ldc_w 695
    //   312: if_acmpeq +23 -> 335
    //   315: aload_1
    //   316: aload_2
    //   317: aload 5
    //   319: invokevirtual 156	org/codehaus/jackson/map/DeserializationConfig:deserializerInstance	(Lorg/codehaus/jackson/map/introspect/Annotated;Ljava/lang/Class;)Lorg/codehaus/jackson/map/JsonDeserializer;
    //   322: astore_1
    //   323: aload 4
    //   325: invokevirtual 582	org/codehaus/jackson/type/JavaType:getContentType	()Lorg/codehaus/jackson/type/JavaType;
    //   328: aload_1
    //   329: invokevirtual 684	org/codehaus/jackson/type/JavaType:setValueHandler	(Ljava/lang/Object;)V
    //   332: aload 4
    //   334: astore_3
    //   335: aload_3
    //   336: areturn
    //   337: astore_1
    //   338: new 109	org/codehaus/jackson/map/JsonMappingException
    //   341: dup
    //   342: new 121	java/lang/StringBuilder
    //   345: dup
    //   346: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   349: ldc_w 697
    //   352: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   355: aload 5
    //   357: invokevirtual 295	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   360: ldc_w 699
    //   363: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   366: aload 7
    //   368: invokevirtual 41	java/lang/Class:getName	()Ljava/lang/String;
    //   371: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   374: ldc_w 701
    //   377: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   380: aload_1
    //   381: invokevirtual 665	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   384: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   387: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   390: aconst_null
    //   391: aload_1
    //   392: invokespecial 668	org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lorg/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   395: athrow
    //   396: astore_1
    //   397: new 109	org/codehaus/jackson/map/JsonMappingException
    //   400: dup
    //   401: new 121	java/lang/StringBuilder
    //   404: dup
    //   405: invokespecial 122	java/lang/StringBuilder:<init>	()V
    //   408: ldc_w 703
    //   411: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   414: aload_3
    //   415: invokevirtual 295	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   418: ldc_w 705
    //   421: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   424: aload 5
    //   426: invokevirtual 41	java/lang/Class:getName	()Ljava/lang/String;
    //   429: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   432: ldc_w 701
    //   435: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   438: aload_1
    //   439: invokevirtual 665	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   442: invokevirtual 128	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   445: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   448: aconst_null
    //   449: aload_1
    //   450: invokespecial 668	org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lorg/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   453: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	454	0	this	BasicDeserializerFactory
    //   0	454	1	paramDeserializationConfig	DeserializationConfig
    //   0	454	2	paramAnnotated	Annotated
    //   0	454	3	paramT	T
    //   0	454	4	paramString	String
    //   18	407	5	localObject	Object
    //   4	285	6	localAnnotationIntrospector	AnnotationIntrospector
    //   15	352	7	localClass	Class
    // Exception table:
    //   from	to	target	type
    //   25	33	110	java/lang/IllegalArgumentException
    //   181	192	337	java/lang/IllegalArgumentException
    //   266	274	396	java/lang/IllegalArgumentException
  }
  
  protected JavaType resolveType(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
  {
    paramBasicBeanDescription = paramJavaType;
    if (paramJavaType.isContainerType())
    {
      paramBasicBeanDescription = paramDeserializationConfig.getAnnotationIntrospector();
      Object localObject = paramJavaType.getKeyType();
      if (localObject != null)
      {
        Class localClass = paramBasicBeanDescription.findKeyDeserializer(paramAnnotatedMember);
        if ((localClass != null) && (localClass != KeyDeserializer.None.class)) {
          ((JavaType)localObject).setValueHandler(paramDeserializationConfig.keyDeserializerInstance(paramAnnotatedMember, localClass));
        }
      }
      paramBasicBeanDescription = paramBasicBeanDescription.findContentDeserializer(paramAnnotatedMember);
      if ((paramBasicBeanDescription != null) && (paramBasicBeanDescription != JsonDeserializer.None.class))
      {
        paramBasicBeanDescription = paramDeserializationConfig.deserializerInstance(paramAnnotatedMember, paramBasicBeanDescription);
        paramJavaType.getContentType().setValueHandler(paramBasicBeanDescription);
      }
      paramBasicBeanDescription = paramJavaType;
      if ((paramAnnotatedMember instanceof AnnotatedMember))
      {
        localObject = findPropertyContentTypeDeserializer(paramDeserializationConfig, paramJavaType, paramAnnotatedMember, paramBeanProperty);
        paramBasicBeanDescription = paramJavaType;
        if (localObject != null) {
          paramBasicBeanDescription = paramJavaType.withContentTypeHandler(localObject);
        }
      }
    }
    if ((paramAnnotatedMember instanceof AnnotatedMember)) {}
    for (paramDeserializationConfig = findPropertyTypeDeserializer(paramDeserializationConfig, paramBasicBeanDescription, paramAnnotatedMember, paramBeanProperty);; paramDeserializationConfig = findTypeDeserializer(paramDeserializationConfig, paramBasicBeanDescription, null))
    {
      paramJavaType = paramBasicBeanDescription;
      if (paramDeserializationConfig != null) {
        paramJavaType = paramBasicBeanDescription.withTypeHandler(paramDeserializationConfig);
      }
      return paramJavaType;
    }
  }
  
  public abstract DeserializerFactory withConfig(DeserializerFactory.Config paramConfig);
}
