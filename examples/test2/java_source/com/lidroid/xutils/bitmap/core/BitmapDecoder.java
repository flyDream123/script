package com.lidroid.xutils.bitmap.core;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.lidroid.xutils.util.LogUtils;
import java.io.FileDescriptor;

public class BitmapDecoder
{
  private static final Object lock = new Object();
  
  private BitmapDecoder() {}
  
  public static int calculateInSampleSize(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    int j = outHeight;
    int k = outWidth;
    int i = 1;
    float f1;
    float f2;
    if ((k > paramInt1) || (j > paramInt2))
    {
      if (k <= j) {
        break label77;
      }
      i = Math.round(j / paramInt2);
      f1 = k * j;
      f2 = paramInt1 * paramInt2 * 2;
    }
    for (;;)
    {
      if (f1 / (i * i) <= f2)
      {
        return i;
        label77:
        i = Math.round(k / paramInt1);
        break;
      }
      i += 1;
    }
  }
  
  public static Bitmap decodeByteArray(byte[] paramArrayOfByte)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inPurgeable = true;
      inInputShareable = true;
      try
      {
        paramArrayOfByte = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
        return paramArrayOfByte;
      }
      catch (Throwable paramArrayOfByte)
      {
        LogUtils.e(paramArrayOfByte.getMessage(), paramArrayOfByte);
        return null;
      }
    }
  }
  
  public static Bitmap decodeFile(String paramString)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inPurgeable = true;
      inInputShareable = true;
      try
      {
        paramString = BitmapFactory.decodeFile(paramString, localOptions);
        return paramString;
      }
      catch (Throwable paramString)
      {
        LogUtils.e(paramString.getMessage(), paramString);
        return null;
      }
    }
  }
  
  public static Bitmap decodeFileDescriptor(FileDescriptor paramFileDescriptor)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inPurgeable = true;
      inInputShareable = true;
      try
      {
        paramFileDescriptor = BitmapFactory.decodeFileDescriptor(paramFileDescriptor, null, localOptions);
        return paramFileDescriptor;
      }
      catch (Throwable paramFileDescriptor)
      {
        LogUtils.e(paramFileDescriptor.getMessage(), paramFileDescriptor);
        return null;
      }
    }
  }
  
  public static Bitmap decodeResource(Resources paramResources, int paramInt)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inPurgeable = true;
      inInputShareable = true;
      try
      {
        paramResources = BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
        return paramResources;
      }
      catch (Throwable paramResources)
      {
        LogUtils.e(paramResources.getMessage(), paramResources);
        return null;
      }
    }
  }
  
  public static Bitmap decodeSampledBitmapFromByteArray(byte[] paramArrayOfByte, BitmapSize paramBitmapSize, Bitmap.Config paramConfig)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      inPurgeable = true;
      inInputShareable = true;
      BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
      inSampleSize = calculateInSampleSize(localOptions, paramBitmapSize.getWidth(), paramBitmapSize.getHeight());
      inJustDecodeBounds = false;
      if (paramConfig != null) {
        inPreferredConfig = paramConfig;
      }
      try
      {
        paramArrayOfByte = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length, localOptions);
        return paramArrayOfByte;
      }
      catch (Throwable paramArrayOfByte)
      {
        LogUtils.e(paramArrayOfByte.getMessage(), paramArrayOfByte);
        return null;
      }
    }
  }
  
  public static Bitmap decodeSampledBitmapFromDescriptor(FileDescriptor paramFileDescriptor, BitmapSize paramBitmapSize, Bitmap.Config paramConfig)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      inPurgeable = true;
      inInputShareable = true;
      BitmapFactory.decodeFileDescriptor(paramFileDescriptor, null, localOptions);
      inSampleSize = calculateInSampleSize(localOptions, paramBitmapSize.getWidth(), paramBitmapSize.getHeight());
      inJustDecodeBounds = false;
      if (paramConfig != null) {
        inPreferredConfig = paramConfig;
      }
      try
      {
        paramFileDescriptor = BitmapFactory.decodeFileDescriptor(paramFileDescriptor, null, localOptions);
        return paramFileDescriptor;
      }
      catch (Throwable paramFileDescriptor)
      {
        LogUtils.e(paramFileDescriptor.getMessage(), paramFileDescriptor);
        return null;
      }
    }
  }
  
  public static Bitmap decodeSampledBitmapFromFile(String paramString, BitmapSize paramBitmapSize, Bitmap.Config paramConfig)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      inPurgeable = true;
      inInputShareable = true;
      BitmapFactory.decodeFile(paramString, localOptions);
      inSampleSize = calculateInSampleSize(localOptions, paramBitmapSize.getWidth(), paramBitmapSize.getHeight());
      inJustDecodeBounds = false;
      if (paramConfig != null) {
        inPreferredConfig = paramConfig;
      }
      try
      {
        paramString = BitmapFactory.decodeFile(paramString, localOptions);
        return paramString;
      }
      catch (Throwable paramString)
      {
        LogUtils.e(paramString.getMessage(), paramString);
        return null;
      }
    }
  }
  
  public static Bitmap decodeSampledBitmapFromResource(Resources paramResources, int paramInt, BitmapSize paramBitmapSize, Bitmap.Config paramConfig)
  {
    synchronized (lock)
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      inPurgeable = true;
      inInputShareable = true;
      BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
      inSampleSize = calculateInSampleSize(localOptions, paramBitmapSize.getWidth(), paramBitmapSize.getHeight());
      inJustDecodeBounds = false;
      if (paramConfig != null) {
        inPreferredConfig = paramConfig;
      }
      try
      {
        paramResources = BitmapFactory.decodeResource(paramResources, paramInt, localOptions);
        return paramResources;
      }
      catch (Throwable paramResources)
      {
        LogUtils.e(paramResources.getMessage(), paramResources);
        return null;
      }
    }
  }
}
