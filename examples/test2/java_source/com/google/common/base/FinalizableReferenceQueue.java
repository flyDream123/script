package com.google.common.base;

import com.bangcle.andjni.JniLib;
import java.io.IOException;
import java.lang.ref.ReferenceQueue;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FinalizableReferenceQueue
{
  private static final String FINALIZER_CLASS_NAME = "com.google.common.base.internal.Finalizer";
  private static final Logger logger = Logger.getLogger(FinalizableReferenceQueue.class.getName());
  private static final Method startFinalizer = getStartFinalizer(loadFinalizer(new FinalizerLoader[] { new SystemLoader(), new DecoupledLoader(), new DirectLoader() }));
  final ReferenceQueue<Object> queue;
  final boolean threadStarted;
  
  static
  {
    JniLib.a(FinalizableReferenceQueue.class, 334);
  }
  
  public FinalizableReferenceQueue()
  {
    boolean bool = false;
    try
    {
      localReferenceQueue1 = (ReferenceQueue)startFinalizer.invoke(null, new Object[] { FinalizableReference.class, this });
      bool = true;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      ReferenceQueue localReferenceQueue1;
      throw new AssertionError(localIllegalAccessException);
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        logger.log(Level.INFO, "Failed to start reference finalizer thread. Reference cleanup will only occur when new references are created.", localThrowable);
        ReferenceQueue localReferenceQueue2 = new ReferenceQueue();
      }
    }
    queue = localReferenceQueue1;
    threadStarted = bool;
  }
  
  static native Method getStartFinalizer(Class<?> paramClass);
  
  private static Class<?> loadFinalizer(FinalizerLoader... paramVarArgs)
  {
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      Class localClass = paramVarArgs[i].loadFinalizer();
      if (localClass != null) {
        return localClass;
      }
      i += 1;
    }
    throw new AssertionError();
  }
  
  native void cleanUp();
  
  static class DecoupledLoader
    implements FinalizableReferenceQueue.FinalizerLoader
  {
    private static final String LOADING_ERROR = "Could not load Finalizer in its own class loader.Loading Finalizer in the current class loader instead. As a result, you will not be ableto garbage collect this class loader. To support reclaiming this class loader, eitherresolve the underlying issue, or move Google Collections to your system class path.";
    
    static
    {
      JniLib.a(DecoupledLoader.class, 331);
    }
    
    DecoupledLoader() {}
    
    native URL getBaseUrl()
      throws IOException;
    
    public native Class<?> loadFinalizer();
    
    native URLClassLoader newLoader(URL paramURL);
  }
  
  static class DirectLoader
    implements FinalizableReferenceQueue.FinalizerLoader
  {
    static
    {
      JniLib.a(DirectLoader.class, 332);
    }
    
    DirectLoader() {}
    
    public native Class<?> loadFinalizer();
  }
  
  static abstract interface FinalizerLoader
  {
    public abstract Class<?> loadFinalizer();
  }
  
  static class SystemLoader
    implements FinalizableReferenceQueue.FinalizerLoader
  {
    static
    {
      JniLib.a(SystemLoader.class, 333);
    }
    
    SystemLoader() {}
    
    public native Class<?> loadFinalizer();
  }
}
