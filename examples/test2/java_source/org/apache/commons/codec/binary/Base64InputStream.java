package org.apache.commons.codec.binary;

import java.io.InputStream;

public class Base64InputStream
  extends BaseNCodecInputStream
{
  public Base64InputStream(InputStream paramInputStream)
  {
    this(paramInputStream, false);
  }
  
  public Base64InputStream(InputStream paramInputStream, boolean paramBoolean)
  {
    super(paramInputStream, new Base64(false), paramBoolean);
  }
  
  public Base64InputStream(InputStream paramInputStream, boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    super(paramInputStream, new Base64(paramInt, paramArrayOfByte), paramBoolean);
  }
}
