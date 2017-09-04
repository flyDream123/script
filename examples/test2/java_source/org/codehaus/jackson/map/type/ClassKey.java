package org.codehaus.jackson.map.type;

public final class ClassKey
  implements Comparable<ClassKey>
{
  Class<?> _class;
  String _className;
  int _hashCode;
  
  public ClassKey()
  {
    _class = null;
    _className = null;
    _hashCode = 0;
  }
  
  public ClassKey(Class<?> paramClass)
  {
    _class = paramClass;
    _className = paramClass.getName();
    _hashCode = _className.hashCode();
  }
  
  public int compareTo(ClassKey paramClassKey)
  {
    return _className.compareTo(_className);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (paramObject.getClass() != getClass()) {
        return false;
      }
    } while (_class == _class);
    return false;
  }
  
  public int hashCode()
  {
    return _hashCode;
  }
  
  public void reset(Class<?> paramClass)
  {
    _class = paramClass;
    _className = paramClass.getName();
    _hashCode = _className.hashCode();
  }
  
  public String toString()
  {
    return _className;
  }
}
