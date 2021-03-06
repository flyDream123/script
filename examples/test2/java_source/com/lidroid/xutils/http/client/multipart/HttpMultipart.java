package com.lidroid.xutils.http.client.multipart;

import com.lidroid.xutils.http.client.multipart.content.ContentBody;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.util.ByteArrayBuffer;

class HttpMultipart
{
  private static final ByteArrayBuffer CR_LF = encode(MIME.DEFAULT_CHARSET, "\r\n");
  private static final ByteArrayBuffer FIELD_SEP = encode(MIME.DEFAULT_CHARSET, ": ");
  private static final ByteArrayBuffer TWO_DASHES = encode(MIME.DEFAULT_CHARSET, "--");
  private final String boundary;
  private final Charset charset;
  private final HttpMultipartMode mode;
  private final List<FormBodyPart> parts;
  private String subType;
  
  public HttpMultipart(String paramString1, String paramString2)
  {
    this(paramString1, null, paramString2);
  }
  
  public HttpMultipart(String paramString1, Charset paramCharset, String paramString2)
  {
    this(paramString1, paramCharset, paramString2, HttpMultipartMode.STRICT);
  }
  
  public HttpMultipart(String paramString1, Charset paramCharset, String paramString2, HttpMultipartMode paramHttpMultipartMode)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("Multipart subtype may not be null");
    }
    if (paramString2 == null) {
      throw new IllegalArgumentException("Multipart boundary may not be null");
    }
    subType = paramString1;
    if (paramCharset != null) {}
    for (;;)
    {
      charset = paramCharset;
      boundary = paramString2;
      parts = new ArrayList();
      mode = paramHttpMultipartMode;
      return;
      paramCharset = MIME.DEFAULT_CHARSET;
    }
  }
  
  private void doWriteTo(HttpMultipartMode paramHttpMultipartMode, OutputStream paramOutputStream, MultipartEntity.CallBackInfo paramCallBackInfo, boolean paramBoolean)
    throws IOException
  {
    pos = 0L;
    ByteArrayBuffer localByteArrayBuffer = encode(charset, getBoundary());
    Iterator localIterator = parts.iterator();
    if (!localIterator.hasNext())
    {
      writeBytes(TWO_DASHES, paramOutputStream);
      pos += TWO_DASHES.length();
      writeBytes(localByteArrayBuffer, paramOutputStream);
      pos += localByteArrayBuffer.length();
      writeBytes(TWO_DASHES, paramOutputStream);
      pos += TWO_DASHES.length();
      writeBytes(CR_LF, paramOutputStream);
      pos += CR_LF.length();
      paramCallBackInfo.doCallBack(true);
      return;
    }
    Object localObject1 = (FormBodyPart)localIterator.next();
    if (!paramCallBackInfo.doCallBack(true)) {
      throw new InterruptedIOException("cancel");
    }
    writeBytes(TWO_DASHES, paramOutputStream);
    pos += TWO_DASHES.length();
    writeBytes(localByteArrayBuffer, paramOutputStream);
    pos += localByteArrayBuffer.length();
    writeBytes(CR_LF, paramOutputStream);
    pos += CR_LF.length();
    Object localObject2 = ((FormBodyPart)localObject1).getHeader();
    switch (paramHttpMultipartMode)
    {
    }
    for (;;)
    {
      writeBytes(CR_LF, paramOutputStream);
      pos += CR_LF.length();
      if (paramBoolean)
      {
        localObject1 = ((FormBodyPart)localObject1).getBody();
        ((ContentBody)localObject1).setCallBackInfo(paramCallBackInfo);
        ((ContentBody)localObject1).writeTo(paramOutputStream);
      }
      writeBytes(CR_LF, paramOutputStream);
      pos += CR_LF.length();
      break;
      localObject2 = ((MinimalFieldHeader)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localMinimalField = (MinimalField)((Iterator)localObject2).next();
        writeField(localMinimalField, paramOutputStream);
        pos += encode(MIME.DEFAULT_CHARSET, localMinimalField.getName() + localMinimalField.getBody()).length() + FIELD_SEP.length() + CR_LF.length();
      }
      MinimalField localMinimalField = ((MinimalFieldHeader)localObject2).getField("Content-Disposition");
      writeField(localMinimalField, charset, paramOutputStream);
      pos += encode(charset, localMinimalField.getName() + localMinimalField.getBody()).length() + FIELD_SEP.length() + CR_LF.length();
      if (((FormBodyPart)localObject1).getBody().getFilename() != null)
      {
        localObject2 = ((MinimalFieldHeader)localObject2).getField("Content-Type");
        writeField((MinimalField)localObject2, charset, paramOutputStream);
        pos += encode(charset, ((MinimalField)localObject2).getName() + ((MinimalField)localObject2).getBody()).length() + FIELD_SEP.length() + CR_LF.length();
      }
    }
  }
  
  private void doWriteTo(HttpMultipartMode paramHttpMultipartMode, OutputStream paramOutputStream, boolean paramBoolean)
    throws IOException
  {
    doWriteTo(paramHttpMultipartMode, paramOutputStream, MultipartEntity.CallBackInfo.DEFAULT, paramBoolean);
  }
  
  private static ByteArrayBuffer encode(Charset paramCharset, String paramString)
  {
    paramCharset = paramCharset.encode(CharBuffer.wrap(paramString));
    paramString = new ByteArrayBuffer(paramCharset.remaining());
    paramString.append(paramCharset.array(), paramCharset.position(), paramCharset.remaining());
    return paramString;
  }
  
  private static void writeBytes(String paramString, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(encode(MIME.DEFAULT_CHARSET, paramString), paramOutputStream);
  }
  
  private static void writeBytes(String paramString, Charset paramCharset, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(encode(paramCharset, paramString), paramOutputStream);
  }
  
  private static void writeBytes(ByteArrayBuffer paramByteArrayBuffer, OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(paramByteArrayBuffer.buffer(), 0, paramByteArrayBuffer.length());
    paramOutputStream.flush();
  }
  
  private static void writeField(MinimalField paramMinimalField, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(paramMinimalField.getName(), paramOutputStream);
    writeBytes(FIELD_SEP, paramOutputStream);
    writeBytes(paramMinimalField.getBody(), paramOutputStream);
    writeBytes(CR_LF, paramOutputStream);
  }
  
  private static void writeField(MinimalField paramMinimalField, Charset paramCharset, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(paramMinimalField.getName(), paramCharset, paramOutputStream);
    writeBytes(FIELD_SEP, paramOutputStream);
    writeBytes(paramMinimalField.getBody(), paramCharset, paramOutputStream);
    writeBytes(CR_LF, paramOutputStream);
  }
  
  public void addBodyPart(FormBodyPart paramFormBodyPart)
  {
    if (paramFormBodyPart == null) {
      return;
    }
    parts.add(paramFormBodyPart);
  }
  
  public List<FormBodyPart> getBodyParts()
  {
    return parts;
  }
  
  public String getBoundary()
  {
    return boundary;
  }
  
  public Charset getCharset()
  {
    return charset;
  }
  
  public HttpMultipartMode getMode()
  {
    return mode;
  }
  
  public String getSubType()
  {
    return subType;
  }
  
  public long getTotalLength()
  {
    long l3 = -1L;
    long l1 = 0L;
    Object localObject = parts.iterator();
    for (;;)
    {
      if (!((Iterator)localObject).hasNext()) {
        localObject = new ByteArrayOutputStream();
      }
      long l4;
      do
      {
        try
        {
          doWriteTo(mode, (OutputStream)localObject, false);
          int i = ((ByteArrayOutputStream)localObject).toByteArray().length;
          l2 = i + l1;
          return l2;
        }
        catch (Throwable localThrowable) {}
        l4 = ((FormBodyPart)((Iterator)localObject).next()).getBody().getContentLength();
        long l2 = l3;
      } while (l4 < 0L);
      l1 += l4;
    }
    return -1L;
  }
  
  public void setSubType(String paramString)
  {
    subType = paramString;
  }
  
  public void writeTo(OutputStream paramOutputStream, MultipartEntity.CallBackInfo paramCallBackInfo)
    throws IOException
  {
    doWriteTo(mode, paramOutputStream, paramCallBackInfo, true);
  }
}
