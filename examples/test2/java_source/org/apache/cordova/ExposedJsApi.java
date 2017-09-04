package org.apache.cordova;

import android.webkit.JavascriptInterface;
import org.apache.cordova.api.PluginManager;
import org.json.JSONException;

class ExposedJsApi
{
  private NativeToJsMessageQueue jsMessageQueue;
  private PluginManager pluginManager;
  
  public ExposedJsApi(PluginManager paramPluginManager, NativeToJsMessageQueue paramNativeToJsMessageQueue)
  {
    pluginManager = paramPluginManager;
    jsMessageQueue = paramNativeToJsMessageQueue;
  }
  
  @JavascriptInterface
  public String exec(String paramString1, String paramString2, String paramString3, String paramString4)
    throws JSONException
  {
    jsMessageQueue.setPaused(true);
    try
    {
      pluginManager.exec(paramString1, paramString2, paramString3, paramString4);
      paramString1 = jsMessageQueue.popAndEncode();
      return paramString1;
    }
    finally
    {
      jsMessageQueue.setPaused(false);
    }
  }
  
  @JavascriptInterface
  public String retrieveJsMessages()
  {
    return jsMessageQueue.popAndEncode();
  }
  
  @JavascriptInterface
  public void setNativeToJsBridgeMode(int paramInt)
  {
    jsMessageQueue.setBridgeMode(paramInt);
  }
}
