package cn.dm.download.listener;

import cn.dm.download.bean.DownloadAppInfo;

public abstract interface DownloadHelperListener
{
  public abstract void onDownloadCancel(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadFailed(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadPause(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadResume(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadStart(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadSuccess(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onDownloadWaiting(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onInstallSuccess(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onProgressChange(DownloadAppInfo paramDownloadAppInfo);
  
  public abstract void onUninstallSuccess(DownloadAppInfo paramDownloadAppInfo);
}