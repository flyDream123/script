package com.google.common.util.concurrent;

import com.bangcle.andjni.JniLib;
import com.google.common.annotations.Beta;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;

@Beta
public class ListenableFutureTask<V>
  extends FutureTask<V>
  implements ListenableFuture<V>
{
  private final ExecutionList executionList = new ExecutionList();
  
  static
  {
    JniLib.a(ListenableFutureTask.class, 954);
  }
  
  public ListenableFutureTask(Runnable paramRunnable, V paramV)
  {
    super(paramRunnable, paramV);
  }
  
  public ListenableFutureTask(Callable<V> paramCallable)
  {
    super(paramCallable);
  }
  
  public native void addListener(Runnable paramRunnable, Executor paramExecutor);
  
  protected native void done();
}
