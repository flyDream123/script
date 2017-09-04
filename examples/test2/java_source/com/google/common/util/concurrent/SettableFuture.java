package com.google.common.util.concurrent;

import com.bangcle.andjni.JniLib;
import com.google.common.annotations.Beta;
import javax.annotation.Nullable;

@Beta
public final class SettableFuture<V>
  extends AbstractListenableFuture<V>
{
  static
  {
    JniLib.a(SettableFuture.class, 958);
  }
  
  private SettableFuture() {}
  
  public static native <V> SettableFuture<V> create();
  
  public native boolean cancel(boolean paramBoolean);
  
  public native boolean set(@Nullable V paramV);
  
  public native boolean setException(Throwable paramThrowable);
}
