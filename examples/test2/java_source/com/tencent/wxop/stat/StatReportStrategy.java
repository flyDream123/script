package com.tencent.wxop.stat;

public enum StatReportStrategy
{
  int a;
  
  static
  {
    BATCH = new StatReportStrategy("BATCH", 2, 3);
    APP_LAUNCH = new StatReportStrategy("APP_LAUNCH", 3, 4);
    DEVELOPER = new StatReportStrategy("DEVELOPER", 4, 5);
    PERIOD = new StatReportStrategy("PERIOD", 5, 6);
  }
  
  private StatReportStrategy(int paramInt)
  {
    a = paramInt;
  }
  
  public static StatReportStrategy getStatReportStrategy(int paramInt)
  {
    StatReportStrategy[] arrayOfStatReportStrategy = values();
    int j = arrayOfStatReportStrategy.length;
    int i = 0;
    while (i < j)
    {
      StatReportStrategy localStatReportStrategy = arrayOfStatReportStrategy[i];
      if (paramInt == localStatReportStrategy.a()) {
        return localStatReportStrategy;
      }
      i += 1;
    }
    return null;
  }
  
  public final int a()
  {
    return a;
  }
}
