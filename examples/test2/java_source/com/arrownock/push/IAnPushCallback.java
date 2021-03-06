package com.arrownock.push;

import com.arrownock.exception.ArrownockException;

public abstract interface IAnPushCallback
{
  @Deprecated
  public abstract void clearMute(boolean paramBoolean, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void clearSilentPeriod(boolean paramBoolean, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void register(boolean paramBoolean, String paramString, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void setBadge(boolean paramBoolean, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void setMute(boolean paramBoolean, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void setScheduledMute(boolean paramBoolean, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void setSilentPeriod(boolean paramBoolean, ArrownockException paramArrownockException);
  
  public abstract void statusChanged(AnPushStatus paramAnPushStatus, ArrownockException paramArrownockException);
  
  @Deprecated
  public abstract void unregister(boolean paramBoolean, ArrownockException paramArrownockException);
}
