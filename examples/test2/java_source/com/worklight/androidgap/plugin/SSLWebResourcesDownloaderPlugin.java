package com.worklight.androidgap.plugin;

import android.app.ProgressDialog;
import android.os.AsyncTask;
import com.bangcle.andjni.JniLib;
import com.worklight.androidgap.WLDroidGap;
import com.worklight.common.SSLConfig;
import com.worklight.common.WLConfig;
import com.worklight.common.WLUtils;
import java.io.IOException;
import org.apache.cordova.api.CallbackContext;
import org.apache.cordova.api.CordovaPlugin;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONArray;
import org.json.JSONException;

public class SSLWebResourcesDownloaderPlugin
  extends CordovaPlugin
{
  private static final String ACTION_SWITCH_APP = "switchApp";
  private static final String ACTION_UPDATE_APP = "updateApp";
  private static boolean isUpdating = false;
  
  static
  {
    JniLib.a(SSLWebResourcesDownloaderPlugin.class, 1128);
  }
  
  public SSLWebResourcesDownloaderPlugin() {}
  
  public native boolean execute(String paramString, JSONArray paramJSONArray, CallbackContext paramCallbackContext)
    throws JSONException;
  
  public native boolean isUpdating();
  
  public class SSLWebResourcesDownloader
    extends AsyncTask<Void, Integer, String>
  {
    private static final String CONTENT_TYPE_APPLICATION_ZIP = "application/zip";
    private static final String DOWNLOADED_ZIP_FILE_NAME = "assets.zip";
    private static final int HONEYCOMB = 11;
    private String cookies;
    private String downloadingMessage;
    private String instanceAuthId = null;
    private boolean isDirectUpdateSuccess = true;
    private ProgressDialog progressDialog;
    private boolean shouldUpdateSilently = false;
    private String skinName;
    private SSLConfig sslConfig;
    private String url = null;
    private WLConfig wlConfig;
    private WLDroidGap wlDroidGap;
    
    static
    {
      JniLib.a(SSLWebResourcesDownloader.class, 1127);
    }
    
    public SSLWebResourcesDownloader(WLDroidGap paramWLDroidGap, String paramString1, String paramString2, boolean paramBoolean, String paramString3, String paramString4, String paramString5)
    {
      wlDroidGap = paramWLDroidGap;
      wlConfig = new WLConfig(wlDroidGap);
      cookies = paramString1;
      instanceAuthId = paramString2;
      downloadingMessage = WLUtils.getResourceString(paramString3, paramWLDroidGap);
      skinName = paramString5;
      url = paramString4;
      shouldUpdateSilently = paramBoolean;
      sslConfig = new SSLConfig(paramWLDroidGap.getContext());
    }
    
    private native void createProgressDialog();
    
    private native void downloadZipFile()
      throws IOException;
    
    private native void extractZipFile(String paramString1, String paramString2)
      throws IOException;
    
    private native String handleUpdateException(String paramString1, String paramString2, int paramInt);
    
    private native void processZipFile()
      throws IOException;
    
    private native String runDirectUpdate();
    
    private native HttpResponse sendRequest()
      throws ClientProtocolException, IOException;
    
    protected String doInBackground(Void... paramVarArgs)
    {
      return runDirectUpdate();
    }
    
    protected native void onPostExecute(String paramString);
    
    protected native void onPreExecute();
    
    protected void onProgressUpdate(Integer... paramVarArgs)
    {
      progressDialog.setProgress(paramVarArgs[0].intValue());
    }
  }
}
