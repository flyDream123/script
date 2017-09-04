package com.bontai.mobiads.ads.splash;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.drawable.Drawable;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnKeyListener;
import android.view.animation.AnimationSet;
import android.webkit.DownloadListener;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.bangcle.andjni.JniLib;
import com.bontai.mobiads.ads.AdView;
import com.bontai.mobiads.ads.BitmapHelp;
import com.bontai.mobiads.ads.entity.AdDomain;
import com.lidroid.xutils.BitmapUtils;
import com.lidroid.xutils.bitmap.BitmapCommonUtils;
import com.lidroid.xutils.bitmap.BitmapDisplayConfig;
import com.lidroid.xutils.bitmap.callback.BitmapLoadFrom;
import com.lidroid.xutils.bitmap.callback.DefaultBitmapLoadCallBack;

public class SplashDetailAdView
  extends AdView
{
  private BitmapDisplayConfig bigPicDisplayConfig;
  private BitmapUtils bitmapUtils;
  private Context context;
  private ProgressDialog dialog;
  private SplashAdListener splashAdListener;
  private String targetImgUrl;
  private String targetUrl;
  
  static
  {
    JniLib.a(SplashDetailAdView.class, 279);
  }
  
  public SplashDetailAdView(Activity paramActivity, AdDomain paramAdDomain)
  {
    super(paramActivity);
    context = paramActivity;
    targetUrl = paramAdDomain.getTargetUrl();
    targetImgUrl = paramAdDomain.getTargetImgUrl();
    bitmapUtils = BitmapHelp.getBitmapUtils(paramActivity);
    if (bitmapUtils == null) {
      bitmapUtils = BitmapHelp.getBitmapUtils(paramActivity);
    }
    bigPicDisplayConfig = new BitmapDisplayConfig();
    bigPicDisplayConfig.setBitmapConfig(Bitmap.Config.RGB_565);
    bigPicDisplayConfig.setBitmapMaxSize(BitmapCommonUtils.getScreenSize(paramActivity));
  }
  
  private native void dismiss();
  
  private native void showH5Ad(View paramView, AnimationSet[] paramArrayOfAnimationSet);
  
  private native void showImgAd(View paramView, AnimationSet[] paramArrayOfAnimationSet);
  
  public native SplashAdListener getSplashAdListener();
  
  public native void setSplashAdListener(SplashAdListener paramSplashAdListener);
  
  public native void splash(Context paramContext, View paramView);
  
  private class MyWebViewDownLoadListener
    implements DownloadListener
  {
    static
    {
      JniLib.a(MyWebViewDownLoadListener.class, 276);
    }
    
    private MyWebViewDownLoadListener() {}
    
    public native void onDownloadStart(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong);
  }
  
  private class SplashBitmapLoadCallBack<T extends View>
    extends DefaultBitmapLoadCallBack<T>
  {
    static
    {
      JniLib.a(SplashBitmapLoadCallBack.class, 277);
    }
    
    private SplashBitmapLoadCallBack() {}
    
    public native void onLoadCompleted(T paramT, String paramString, Bitmap paramBitmap, BitmapDisplayConfig paramBitmapDisplayConfig, BitmapLoadFrom paramBitmapLoadFrom);
    
    public native void onLoadFailed(T paramT, String paramString, Drawable paramDrawable);
  }
  
  public class xWebChromeClient
    extends WebChromeClient
  {
    static
    {
      JniLib.a(xWebChromeClient.class, 278);
    }
    
    public xWebChromeClient() {}
    
    public native void onProgressChanged(WebView paramWebView, int paramInt);
    
    public native void onReceivedTitle(WebView paramWebView, String paramString);
  }
}
