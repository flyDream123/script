package com.worklight.androidgap.plugin;

import com.bangcle.andjni.JniLib;
import org.apache.cordova.api.Plugin;
import org.apache.cordova.api.PluginResult;
import org.json.JSONArray;

public class LoggerPlugin
  extends Plugin
{
  public static final String ACTION_LOG = "log";
  public static final String ACTION_SEND = "send";
  public static final String ACTION_SET_NATIVE_OPTIONS = "setNativeOptions";
  private static final String LOG_TAG = LoggerPlugin.class.getName();
  
  static
  {
    JniLib.a(LoggerPlugin.class, 1118);
  }
  
  public LoggerPlugin() {}
  
  public native PluginResult execute(String paramString1, JSONArray paramJSONArray, String paramString2);
  
  public native boolean isSynch(String paramString);
}
