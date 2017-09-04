package com.lidroid.xutils.view.annotation.event;

import android.widget.ExpandableListView.OnGroupExpandListener;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@EventBase(listenerSetter="setOnGroupExpandListener", listenerType=ExpandableListView.OnGroupExpandListener.class, methodName="onGroupExpand")
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnGroupExpand
{
  int[] parentId() default {0};
  
  int[] value();
}
