package com.google.common.base;

import com.bangcle.andjni.JniLib;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Map;
import javax.annotation.Nullable;

@GwtCompatible
public final class Functions
{
  static
  {
    JniLib.a(Functions.class, 340);
  }
  
  private Functions() {}
  
  public static native <A, B, C> Function<A, C> compose(Function<B, C> paramFunction, Function<A, ? extends B> paramFunction1);
  
  public static native <E> Function<Object, E> constant(@Nullable E paramE);
  
  public static native <K, V> Function<K, V> forMap(Map<K, V> paramMap);
  
  public static native <K, V> Function<K, V> forMap(Map<K, ? extends V> paramMap, @Nullable V paramV);
  
  public static native <T> Function<T, Boolean> forPredicate(Predicate<T> paramPredicate);
  
  public static native <E> Function<E, E> identity();
  
  public static native Function<Object, String> toStringFunction();
  
  private static class ConstantFunction<E>
    implements Function<Object, E>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final E value;
    
    static
    {
      JniLib.a(ConstantFunction.class, 335);
    }
    
    public ConstantFunction(@Nullable E paramE)
    {
      value = paramE;
    }
    
    public native E apply(@Nullable Object paramObject);
    
    public native boolean equals(@Nullable Object paramObject);
    
    public native int hashCode();
    
    public native String toString();
  }
  
  private static class ForMapWithDefault<K, V>
    implements Function<K, V>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final V defaultValue;
    final Map<K, ? extends V> map;
    
    static
    {
      JniLib.a(ForMapWithDefault.class, 336);
    }
    
    ForMapWithDefault(Map<K, ? extends V> paramMap, @Nullable V paramV)
    {
      map = ((Map)Preconditions.checkNotNull(paramMap));
      defaultValue = paramV;
    }
    
    public native V apply(K paramK);
    
    public native boolean equals(@Nullable Object paramObject);
    
    public native int hashCode();
    
    public native String toString();
  }
  
  private static class FunctionComposition<A, B, C>
    implements Function<A, C>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Function<A, ? extends B> f;
    private final Function<B, C> g;
    
    static
    {
      JniLib.a(FunctionComposition.class, 337);
    }
    
    public FunctionComposition(Function<B, C> paramFunction, Function<A, ? extends B> paramFunction1)
    {
      g = ((Function)Preconditions.checkNotNull(paramFunction));
      f = ((Function)Preconditions.checkNotNull(paramFunction1));
    }
    
    public native C apply(A paramA);
    
    public native boolean equals(@Nullable Object paramObject);
    
    public native int hashCode();
    
    public native String toString();
  }
  
  private static class FunctionForMapNoDefault<K, V>
    implements Function<K, V>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Map<K, V> map;
    
    static
    {
      JniLib.a(FunctionForMapNoDefault.class, 338);
    }
    
    FunctionForMapNoDefault(Map<K, V> paramMap)
    {
      map = ((Map)Preconditions.checkNotNull(paramMap));
    }
    
    public native V apply(K paramK);
    
    public native boolean equals(@Nullable Object paramObject);
    
    public native int hashCode();
    
    public native String toString();
  }
  
  private static enum IdentityFunction
    implements Function<Object, Object>
  {
    INSTANCE;
    
    private IdentityFunction() {}
    
    public Object apply(Object paramObject)
    {
      return paramObject;
    }
    
    public String toString()
    {
      return "identity";
    }
  }
  
  private static class PredicateFunction<T>
    implements Function<T, Boolean>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Predicate<T> predicate;
    
    static
    {
      JniLib.a(PredicateFunction.class, 339);
    }
    
    private PredicateFunction(Predicate<T> paramPredicate)
    {
      predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
    }
    
    public native Boolean apply(T paramT);
    
    public native boolean equals(@Nullable Object paramObject);
    
    public native int hashCode();
    
    public native String toString();
  }
  
  private static enum ToStringFunction
    implements Function<Object, String>
  {
    INSTANCE;
    
    private ToStringFunction() {}
    
    public String apply(Object paramObject)
    {
      Preconditions.checkNotNull(paramObject);
      return paramObject.toString();
    }
    
    public String toString()
    {
      return "toString";
    }
  }
}
