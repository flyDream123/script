package com.lidroid.xutils.view.annotation.event;

import android.widget.SeekBar.OnSeekBarChangeListener;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@EventBase(listenerSetter="setOnSeekBarChangeListener", listenerType=SeekBar.OnSeekBarChangeListener.class, methodName="onStopTrackingTouch")
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnStopTrackingTouch
{
  int[] parentId() default {0};
  
  int[] value();
}
