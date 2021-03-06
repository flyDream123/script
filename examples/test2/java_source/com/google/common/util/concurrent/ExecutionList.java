package com.google.common.util.concurrent;

import com.bangcle.andjni.JniLib;
import com.google.common.annotations.Beta;
import com.google.common.collect.Lists;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.logging.Logger;

@Beta
public final class ExecutionList
  implements Runnable
{
  private static final Logger log = Logger.getLogger(ExecutionList.class.getName());
  private boolean executed = false;
  private final Queue<RunnableExecutorPair> runnables = Lists.newLinkedList();
  
  static
  {
    JniLib.a(ExecutionList.class, 941);
  }
  
  public ExecutionList() {}
  
  public native void add(Runnable paramRunnable, Executor paramExecutor);
  
  public native void run();
  
  private static class RunnableExecutorPair
  {
    final Executor executor;
    final Runnable runnable;
    
    static
    {
      JniLib.a(RunnableExecutorPair.class, 940);
    }
    
    RunnableExecutorPair(Runnable paramRunnable, Executor paramExecutor)
    {
      runnable = paramRunnable;
      executor = paramExecutor;
    }
    
    native void execute();
  }
}
