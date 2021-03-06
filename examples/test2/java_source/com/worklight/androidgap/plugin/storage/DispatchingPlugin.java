package com.worklight.androidgap.plugin.storage;

import com.bangcle.andjni.JniLib;
import com.worklight.androidgap.jsonstore.util.JsonstoreUtil;
import com.worklight.androidgap.jsonstore.util.Logger;
import com.worklight.androidgap.jsonstore.util.jackson.JsonOrgModule;
import java.util.HashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import org.apache.cordova.api.CallbackContext;
import org.apache.cordova.api.CordovaInterface;
import org.apache.cordova.api.CordovaPlugin;
import org.apache.cordova.api.PluginResult;
import org.apache.cordova.api.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

public abstract class DispatchingPlugin
  extends CordovaPlugin
{
  private static final SerialExecutor executor = new SerialExecutor(null);
  private static final Logger logger = JsonstoreUtil.getCoreLogger();
  private HashMap<String, ActionDispatcher> dispatchers = new HashMap();
  
  public DispatchingPlugin() {}
  
  private boolean doDispatch(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
  {
    ActionDispatcher localActionDispatcher = (ActionDispatcher)dispatchers.get(paramString);
    if (logger.isLoggable(3)) {
      logger.logDebug("dispatching action \"" + paramString + "\"");
    }
    if (localActionDispatcher == null)
    {
      paramCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.ERROR, "unable to dispatch action \"" + paramString + "\""));
      return false;
    }
    executor.execute(new ActionDispatcherRunnable(localActionDispatcher, paramJSONArray, cordova, paramCallbackContext, null));
    return true;
  }
  
  protected void addDispatcher(ActionDispatcher paramActionDispatcher)
  {
    dispatchers.put(paramActionDispatcher.getName(), paramActionDispatcher);
  }
  
  public boolean execute(String paramString1, String paramString2, CallbackContext paramCallbackContext)
    throws JSONException
  {
    try
    {
      paramString2 = JsonOrgModule.deserializeJSONArray(paramString2);
      return doDispatch(paramString1, paramString2, paramCallbackContext);
    }
    catch (Throwable paramString1)
    {
      throw new JSONException(paramString1);
    }
  }
  
  private class ActionDispatcherRunnable
    implements Runnable
  {
    private JSONArray args;
    private CallbackContext callbackContext;
    private CordovaInterface context;
    private ActionDispatcher dispatcher;
    
    static
    {
      JniLib.a(ActionDispatcherRunnable.class, 1159);
    }
    
    private ActionDispatcherRunnable(ActionDispatcher paramActionDispatcher, JSONArray paramJSONArray, CordovaInterface paramCordovaInterface, CallbackContext paramCallbackContext)
    {
      args = paramJSONArray;
      callbackContext = paramCallbackContext;
      context = paramCordovaInterface;
      dispatcher = paramActionDispatcher;
    }
    
    public native void run();
  }
  
  private static class SerialExecutor
    implements Executor
  {
    private Runnable currentRunnable;
    private LinkedBlockingQueue<Runnable> dispatcherRunnables = new LinkedBlockingQueue();
    private Executor executor = Executors.newCachedThreadPool();
    
    static
    {
      JniLib.a(SerialExecutor.class, 1161);
    }
    
    private SerialExecutor() {}
    
    private native void scheduleNextRunnable();
    
    public native void execute(Runnable paramRunnable);
  }
}
