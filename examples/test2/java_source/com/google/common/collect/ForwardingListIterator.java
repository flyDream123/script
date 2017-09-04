package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.ListIterator;

@GwtCompatible
public abstract class ForwardingListIterator<E>
  extends ForwardingIterator<E>
  implements ListIterator<E>
{
  protected ForwardingListIterator() {}
  
  public void add(E paramE)
  {
    delegate().add(paramE);
  }
  
  protected abstract ListIterator<E> delegate();
  
  public boolean hasPrevious()
  {
    return delegate().hasPrevious();
  }
  
  public int nextIndex()
  {
    return delegate().nextIndex();
  }
  
  public E previous()
  {
    return delegate().previous();
  }
  
  public int previousIndex()
  {
    return delegate().previousIndex();
  }
  
  public void set(E paramE)
  {
    delegate().set(paramE);
  }
}