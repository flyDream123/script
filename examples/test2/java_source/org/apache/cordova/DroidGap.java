package org.apache.cordova;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.webkit.ValueCallback;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.apache.cordova.api.CordovaInterface;
import org.apache.cordova.api.CordovaPlugin;
import org.apache.cordova.api.LOG;
import org.apache.cordova.api.PluginManager;
import org.json.JSONException;
import org.json.JSONObject;

public class DroidGap
  extends Activity
  implements CordovaInterface
{
  private static int ACTIVITY_EXITING = 2;
  private static int ACTIVITY_RUNNING;
  private static int ACTIVITY_STARTING;
  public static String TAG = "DroidGap";
  private Object LOG_TAG;
  protected CordovaPlugin activityResultCallback = null;
  protected boolean activityResultKeepRunning;
  private int activityState = 0;
  protected CordovaWebView appView;
  private int backgroundColor = -16777216;
  protected boolean cancelLoadUrl = false;
  private String initCallbackClass;
  protected boolean keepRunning = true;
  private Intent lastIntent;
  private int lastRequestCode;
  private Object lastResponseCode;
  protected int loadUrlTimeoutValue = 20000;
  private Object responseCode;
  protected LinearLayout root;
  protected ProgressDialog spinnerDialog = null;
  protected Dialog splashDialog;
  protected int splashscreen = 0;
  protected int splashscreenTime = 3000;
  private final ExecutorService threadPool = Executors.newCachedThreadPool();
  protected CordovaWebViewClient webViewClient;
  
  static
  {
    ACTIVITY_STARTING = 0;
    ACTIVITY_RUNNING = 1;
  }
  
  public DroidGap() {}
  
  public void addService(String paramString1, String paramString2)
  {
    if ((appView != null) && (appView.pluginManager != null)) {
      appView.pluginManager.addService(paramString1, paramString2);
    }
  }
  
  public boolean backHistory()
  {
    if (appView != null) {
      return appView.backHistory();
    }
    return false;
  }
  
  @Deprecated
  public void cancelLoadUrl()
  {
    cancelLoadUrl = true;
  }
  
  public void clearAuthenticationTokens()
  {
    if ((appView != null) && (appView.viewClient != null)) {
      appView.viewClient.clearAuthenticationTokens();
    }
  }
  
  public void clearCache()
  {
    if (appView == null) {
      init();
    }
    appView.clearCache(true);
  }
  
  public void clearHistory()
  {
    appView.clearHistory();
  }
  
  public void displayError(final String paramString1, final String paramString2, final String paramString3, final boolean paramBoolean)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        try
        {
          AlertDialog.Builder localBuilder = new AlertDialog.Builder(jdField_this);
          localBuilder.setMessage(paramString2);
          localBuilder.setTitle(paramString1);
          localBuilder.setCancelable(false);
          localBuilder.setPositiveButton(paramString3, new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              paramAnonymous2DialogInterface.dismiss();
              if (val$exit) {
                val$me.endActivity();
              }
            }
          });
          localBuilder.create();
          localBuilder.show();
          return;
        }
        catch (Exception localException)
        {
          finish();
        }
      }
    });
  }
  
  public void endActivity()
  {
    activityState = ACTIVITY_EXITING;
    super.finish();
  }
  
  public Activity getActivity()
  {
    return this;
  }
  
  public AuthenticationToken getAuthenticationToken(String paramString1, String paramString2)
  {
    if ((appView != null) && (appView.viewClient != null)) {
      return appView.viewClient.getAuthenticationToken(paramString1, paramString2);
    }
    return null;
  }
  
  public boolean getBooleanProperty(String paramString, boolean paramBoolean)
  {
    localBundle = getIntent().getExtras();
    if (localBundle == null) {}
    do
    {
      return paramBoolean;
      try
      {
        Boolean localBoolean = (Boolean)localBundle.get(paramString);
        paramString = localBoolean;
      }
      catch (ClassCastException localClassCastException)
      {
        for (;;)
        {
          if ("true".equals(localBundle.get(paramString).toString())) {
            paramString = Boolean.valueOf(true);
          } else {
            paramString = Boolean.valueOf(false);
          }
        }
      }
    } while (paramString == null);
    return paramString.booleanValue();
  }
  
  public Context getContext()
  {
    LOG.d(TAG, "This will be deprecated December 2012");
    return this;
  }
  
  public double getDoubleProperty(String paramString, double paramDouble)
  {
    localBundle = getIntent().getExtras();
    if (localBundle == null) {}
    do
    {
      return paramDouble;
      try
      {
        Double localDouble = (Double)localBundle.get(paramString);
        paramString = localDouble;
      }
      catch (ClassCastException localClassCastException)
      {
        for (;;)
        {
          paramString = Double.valueOf(Double.parseDouble(localBundle.get(paramString).toString()));
        }
      }
    } while (paramString == null);
    return paramString.doubleValue();
  }
  
  public int getIntegerProperty(String paramString, int paramInt)
  {
    localBundle = getIntent().getExtras();
    if (localBundle == null) {}
    do
    {
      return paramInt;
      try
      {
        Integer localInteger = (Integer)localBundle.get(paramString);
        paramString = localInteger;
      }
      catch (ClassCastException localClassCastException)
      {
        for (;;)
        {
          paramString = Integer.valueOf(Integer.parseInt(localBundle.get(paramString).toString()));
        }
      }
    } while (paramString == null);
    return paramString.intValue();
  }
  
  public String getStringProperty(String paramString1, String paramString2)
  {
    Bundle localBundle = getIntent().getExtras();
    if (localBundle == null) {}
    do
    {
      return paramString2;
      paramString1 = localBundle.getString(paramString1);
    } while (paramString1 == null);
    return paramString1;
  }
  
  public ExecutorService getThreadPool()
  {
    return threadPool;
  }
  
  public void init()
  {
    CordovaWebView localCordovaWebView = new CordovaWebView(this);
    if (Build.VERSION.SDK_INT < 11) {}
    for (Object localObject = new CordovaWebViewClient(this, localCordovaWebView);; localObject = new IceCreamCordovaWebViewClient(this, localCordovaWebView))
    {
      init(localCordovaWebView, (CordovaWebViewClient)localObject, new CordovaChromeClient(this, localCordovaWebView));
      return;
    }
  }
  
  @SuppressLint({"NewApi"})
  public void init(CordovaWebView paramCordovaWebView, CordovaWebViewClient paramCordovaWebViewClient, CordovaChromeClient paramCordovaChromeClient)
  {
    LOG.d(TAG, "DroidGap.init()");
    appView = paramCordovaWebView;
    appView.setId(100);
    appView.setWebViewClient(paramCordovaWebViewClient);
    appView.setWebChromeClient(paramCordovaChromeClient);
    paramCordovaWebViewClient.setWebView(appView);
    paramCordovaChromeClient.setWebView(appView);
    appView.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 1.0F));
    if ((getBooleanProperty("disallowOverscroll", false)) && (Build.VERSION.SDK_INT >= 9)) {
      appView.setOverScrollMode(2);
    }
    appView.setVisibility(4);
    root.addView(appView);
    setContentView(root);
    cancelLoadUrl = false;
  }
  
  public boolean isUrlWhiteListed(String paramString)
  {
    return Config.isUrlWhiteListed(paramString);
  }
  
  void loadSpinner()
  {
    String str1;
    String str3;
    int i;
    if ((appView == null) || (!appView.canGoBack()))
    {
      str1 = getStringProperty("loadingDialog", null);
      if (str1 != null)
      {
        str3 = "";
        str2 = "Loading Application...";
        if (str1.length() > 0)
        {
          i = str1.indexOf(',');
          if (i <= 0) {
            break label93;
          }
          str3 = str1.substring(0, i);
        }
      }
    }
    for (String str2 = str1.substring(i + 1);; str2 = str1)
    {
      spinnerStart(str3, str2);
      return;
      str1 = getStringProperty("loadingPageDialog", null);
      break;
      label93:
      str3 = "";
    }
  }
  
  public void loadUrl(String paramString)
  {
    if (appView == null) {
      init();
    }
    backgroundColor = getIntegerProperty("backgroundColor", -16777216);
    root.setBackgroundColor(backgroundColor);
    keepRunning = getBooleanProperty("keepRunning", true);
    loadSpinner();
    appView.loadUrl(paramString);
  }
  
  public void loadUrl(String paramString, int paramInt)
  {
    if (appView == null) {
      init();
    }
    splashscreenTime = paramInt;
    splashscreen = getIntegerProperty("splashscreen", 0);
    showSplashScreen(splashscreenTime);
    appView.loadUrl(paramString, paramInt);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    LOG.d(TAG, "Incoming Result");
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    Log.d(TAG, "Request code = " + paramInt1);
    ValueCallback localValueCallback = appView.getWebChromeClient().getValueCallback();
    if (paramInt1 == 5173)
    {
      Log.d(TAG, "did we get here?");
      if (localValueCallback == null) {
        return;
      }
      if ((paramIntent != null) && (paramInt2 == -1)) {
        break label187;
      }
    }
    label187:
    for (Object localObject = null;; localObject = paramIntent.getData())
    {
      Log.d(TAG, "result = " + localObject);
      localValueCallback.onReceiveValue(localObject);
      localObject = activityResultCallback;
      if (localObject != null) {
        break label196;
      }
      if (initCallbackClass == null) {
        break;
      }
      activityResultCallback = appView.pluginManager.getPlugin(initCallbackClass);
      localObject = activityResultCallback;
      LOG.d(TAG, "We have a callback to send this result to");
      ((CordovaPlugin)localObject).onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    label196:
    LOG.d(TAG, "We have a callback to send this result to");
    ((CordovaPlugin)localObject).onActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    Config.init(this);
    LOG.d(TAG, "DroidGap.onCreate()");
    super.onCreate(paramBundle);
    if (paramBundle != null) {
      initCallbackClass = paramBundle.getString("callbackClass");
    }
    if (!getBooleanProperty("showTitle", false)) {
      getWindow().requestFeature(1);
    }
    if (getBooleanProperty("setFullscreen", false)) {
      getWindow().setFlags(1024, 1024);
    }
    for (;;)
    {
      paramBundle = getWindowManager().getDefaultDisplay();
      root = new LinearLayoutSoftKeyboardDetect(this, paramBundle.getWidth(), paramBundle.getHeight());
      root.setOrientation(1);
      root.setBackgroundColor(backgroundColor);
      root.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 0.0F));
      setVolumeControlStream(3);
      return;
      getWindow().setFlags(2048, 2048);
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    postMessage("onCreateOptionsMenu", paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  public void onDestroy()
  {
    LOG.d(TAG, "onDestroy()");
    super.onDestroy();
    removeSplashScreen();
    if (appView != null)
    {
      appView.handleDestroy();
      return;
    }
    endActivity();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((appView.getFocusedChild() != null) && ((paramInt == 4) || (paramInt == 82))) {
      return appView.onKeyDown(paramInt, paramKeyEvent);
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    View localView = appView.getFocusedChild();
    if (((appView.isCustomViewShowing()) || (localView != null)) && ((paramInt == 4) || (paramInt == 82))) {
      return appView.onKeyUp(paramInt, paramKeyEvent);
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  public Object onMessage(String paramString, Object paramObject)
  {
    LOG.d(TAG, "onMessage(" + paramString + "," + paramObject + ")");
    if ("splashscreen".equals(paramString)) {
      if ("hide".equals(paramObject.toString())) {
        removeSplashScreen();
      }
    }
    for (;;)
    {
      return null;
      if ((splashDialog == null) || (!splashDialog.isShowing()))
      {
        splashscreen = getIntegerProperty("splashscreen", 0);
        showSplashScreen(splashscreenTime);
        continue;
        if ("spinner".equals(paramString))
        {
          if ("stop".equals(paramObject.toString()))
          {
            spinnerStop();
            appView.setVisibility(0);
          }
        }
        else if ("onReceivedError".equals(paramString))
        {
          paramString = (JSONObject)paramObject;
          try
          {
            onReceivedError(paramString.getInt("errorCode"), paramString.getString("description"), paramString.getString("url"));
          }
          catch (JSONException paramString)
          {
            paramString.printStackTrace();
          }
        }
        else if ("exit".equals(paramString))
        {
          endActivity();
        }
      }
    }
  }
  
  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    if (appView != null) {
      appView.onNewIntent(paramIntent);
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    postMessage("onOptionsItemSelected", paramMenuItem);
    return true;
  }
  
  protected void onPause()
  {
    super.onPause();
    LOG.d(TAG, "Paused the application!");
    if (activityState == ACTIVITY_EXITING) {}
    while (appView == null) {
      return;
    }
    appView.handlePause(keepRunning);
    removeSplashScreen();
  }
  
  public boolean onPrepareOptionsMenu(Menu paramMenu)
  {
    postMessage("onPrepareOptionsMenu", paramMenu);
    return true;
  }
  
  public void onReceivedError(int paramInt, final String paramString1, final String paramString2)
  {
    final String str = getStringProperty("errorUrl", null);
    if ((str != null) && ((str.startsWith("file://")) || (Config.isUrlWhiteListed(str))) && (!paramString2.equals(str)))
    {
      runOnUiThread(new Runnable()
      {
        public void run()
        {
          jdField_this.spinnerStop();
          jdField_thisappView.showWebPage(str, false, true, null);
        }
      });
      return;
    }
    if (paramInt != -2) {}
    for (final boolean bool = true;; bool = false)
    {
      runOnUiThread(new Runnable()
      {
        public void run()
        {
          if (bool)
          {
            jdField_thisappView.setVisibility(8);
            jdField_this.displayError("Application Error", paramString1 + " (" + paramString2 + ")", "OK", bool);
          }
        }
      });
      return;
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    LOG.d(TAG, "Resuming the App");
    if (activityState == ACTIVITY_STARTING) {
      activityState = ACTIVITY_RUNNING;
    }
    do
    {
      do
      {
        return;
      } while (appView == null);
      appView.handleResume(keepRunning, activityResultKeepRunning);
    } while (((keepRunning) && (!activityResultKeepRunning)) || (!activityResultKeepRunning));
    keepRunning = activityResultKeepRunning;
    activityResultKeepRunning = false;
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (activityResultCallback != null) {
      paramBundle.putString("callbackClass", activityResultCallback.getClass().getName());
    }
  }
  
  public void postMessage(String paramString, Object paramObject)
  {
    if (appView != null) {
      appView.postMessage(paramString, paramObject);
    }
  }
  
  public AuthenticationToken removeAuthenticationToken(String paramString1, String paramString2)
  {
    if ((appView != null) && (appView.viewClient != null)) {
      return appView.viewClient.removeAuthenticationToken(paramString1, paramString2);
    }
    return null;
  }
  
  public void removeSplashScreen()
  {
    if ((splashDialog != null) && (splashDialog.isShowing()))
    {
      splashDialog.dismiss();
      splashDialog = null;
    }
  }
  
  public void sendJavascript(String paramString)
  {
    if (appView != null) {
      appView.jsMessageQueue.addJavaScript(paramString);
    }
  }
  
  public void setActivityResultCallback(CordovaPlugin paramCordovaPlugin)
  {
    activityResultCallback = paramCordovaPlugin;
  }
  
  public void setAuthenticationToken(AuthenticationToken paramAuthenticationToken, String paramString1, String paramString2)
  {
    if ((appView != null) && (appView.viewClient != null)) {
      appView.viewClient.setAuthenticationToken(paramAuthenticationToken, paramString1, paramString2);
    }
  }
  
  public void setBooleanProperty(String paramString, boolean paramBoolean)
  {
    Log.d(TAG, "Setting boolean properties in DroidGap will be deprecated in 3.0 on July 2013, please use config.xml");
    getIntent().putExtra(paramString, paramBoolean);
  }
  
  public void setDoubleProperty(String paramString, double paramDouble)
  {
    Log.d(TAG, "Setting double properties in DroidGap will be deprecated in 3.0 on July 2013, please use config.xml");
    getIntent().putExtra(paramString, paramDouble);
  }
  
  public void setIntegerProperty(String paramString, int paramInt)
  {
    Log.d(TAG, "Setting integer properties in DroidGap will be deprecated in 3.1 on August 2013, please use config.xml");
    getIntent().putExtra(paramString, paramInt);
  }
  
  public void setStringProperty(String paramString1, String paramString2)
  {
    Log.d(TAG, "Setting string properties in DroidGap will be deprecated in 3.0 on July 2013, please use config.xml");
    getIntent().putExtra(paramString1, paramString2);
  }
  
  protected void showSplashScreen(final int paramInt)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        Display localDisplay = getWindowManager().getDefaultDisplay();
        LinearLayout localLinearLayout = new LinearLayout(jdField_this.getActivity());
        localLinearLayout.setMinimumHeight(localDisplay.getHeight());
        localLinearLayout.setMinimumWidth(localDisplay.getWidth());
        localLinearLayout.setOrientation(1);
        localLinearLayout.setBackgroundColor(jdField_this.getIntegerProperty("backgroundColor", -16777216));
        localLinearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -1, 0.0F));
        localLinearLayout.setBackgroundResource(jdField_thissplashscreen);
        splashDialog = new Dialog(jdField_this, 16973840);
        if ((getWindow().getAttributes().flags & 0x400) == 1024) {
          splashDialog.getWindow().setFlags(1024, 1024);
        }
        splashDialog.setContentView(localLinearLayout);
        splashDialog.setCancelable(false);
        splashDialog.show();
        new Handler().postDelayed(new Runnable()
        {
          public void run()
          {
            removeSplashScreen();
          }
        }, paramInt);
      }
    });
  }
  
  public void showWebPage(String paramString, boolean paramBoolean1, boolean paramBoolean2, HashMap<String, Object> paramHashMap)
  {
    if (appView != null) {
      appView.showWebPage(paramString, paramBoolean1, paramBoolean2, paramHashMap);
    }
  }
  
  public void spinnerStart(String paramString1, String paramString2)
  {
    if (spinnerDialog != null)
    {
      spinnerDialog.dismiss();
      spinnerDialog = null;
    }
    spinnerDialog = ProgressDialog.show(this, paramString1, paramString2, true, true, new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        jdField_thisspinnerDialog = null;
      }
    });
  }
  
  public void spinnerStop()
  {
    if ((spinnerDialog != null) && (spinnerDialog.isShowing()))
    {
      spinnerDialog.dismiss();
      spinnerDialog = null;
    }
  }
  
  public void startActivityForResult(CordovaPlugin paramCordovaPlugin, Intent paramIntent, int paramInt)
  {
    activityResultCallback = paramCordovaPlugin;
    activityResultKeepRunning = keepRunning;
    if (paramCordovaPlugin != null) {
      keepRunning = false;
    }
    super.startActivityForResult(paramIntent, paramInt);
  }
}