package com.lidroid.xutils.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;

public class GZipDecompressingEntity
  extends DecompressingEntity
{
  public GZipDecompressingEntity(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
  }
  
  InputStream decorate(InputStream paramInputStream)
    throws IOException
  {
    return new GZIPInputStream(paramInputStream);
  }
  
  public Header getContentEncoding()
  {
    return null;
  }
}
