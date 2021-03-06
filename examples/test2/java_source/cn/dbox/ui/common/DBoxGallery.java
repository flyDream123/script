package cn.dbox.ui.common;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.widget.Gallery;

public class DBoxGallery
  extends Gallery
{
  private boolean isOnGalleryTouch = false;
  
  public DBoxGallery(Context paramContext)
  {
    super(paramContext);
    initGallery();
  }
  
  public DBoxGallery(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initGallery();
  }
  
  private void initGallery()
  {
    setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        int i = paramAnonymousMotionEvent.getAction();
        if (i == 0) {
          DBoxGallery.access$002(DBoxGallery.this, true);
        }
        while (i != 1) {
          return false;
        }
        DBoxGallery.access$002(DBoxGallery.this, false);
        return false;
      }
    });
  }
  
  public boolean isOnGalleryTouch()
  {
    return isOnGalleryTouch;
  }
  
  public boolean isScroollingLeft(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2)
  {
    return paramMotionEvent2.getX() > paramMotionEvent1.getX();
  }
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if (isScroollingLeft(paramMotionEvent1, paramMotionEvent2)) {}
    for (int i = 21;; i = 22)
    {
      onKeyDown(i, null);
      return true;
    }
  }
}
