package com.arrownock.im.callback;

import com.bangcle.andjni.JniLib;
import java.util.Map;
import java.util.Set;

public class AnIMMessageCallbackData
  extends AnIMBaseMessageCallbackData
{
  private Map<String, String> customData = null;
  private String message = null;
  private Set<String> parties = null;
  private long timestamp = -1L;
  
  static
  {
    JniLib.a(AnIMMessageCallbackData.class, 203);
  }
  
  public AnIMMessageCallbackData(String paramString1, String paramString2, Set<String> paramSet, String paramString3, Map<String, String> paramMap, long paramLong)
  {
    super(paramString1, paramString2);
    parties = paramSet;
    message = paramString3;
    customData = paramMap;
    timestamp = paramLong;
  }
  
  public native Map<String, String> getCustomData();
  
  public native String getMessage();
  
  public native Set<String> getParties();
  
  public native long getTimestamp();
}
