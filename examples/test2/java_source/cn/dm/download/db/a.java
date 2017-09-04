package cn.dm.download.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;

public final class a
  extends SQLiteOpenHelper
{
  private static a ac = null;
  private static String ae = "dm_downloadTool.db";
  private static int af = 1;
  private static String ag = "download_app_tab";
  private SQLiteDatabase ad = null;
  private Context mContext;
  
  private a(Context paramContext)
  {
    super(paramContext, "dm_downloadTool.db", null, 1);
    mContext = paramContext;
  }
  
  public static a b(Context paramContext)
  {
    try
    {
      if (ac == null) {
        ac = new a(paramContext);
      }
      paramContext = ac;
      return paramContext;
    }
    finally {}
  }
  
  private Context p()
  {
    return mContext;
  }
  
  private Cursor rawQuery(String paramString, String[] paramArrayOfString)
  {
    return ad.rawQuery(paramString, paramArrayOfString);
  }
  
  public final Cursor a(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3)
  {
    paramArrayOfString1 = new SQLiteQueryBuilder();
    paramArrayOfString1.setTables(paramString1);
    return paramArrayOfString1.query(ad, null, paramString2, paramArrayOfString2, null, null, null);
  }
  
  public final boolean a(String paramString, ContentValues paramContentValues)
  {
    return ad.insert(paramString, null, paramContentValues) > 0L;
  }
  
  public final int delete(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    return ad.delete(paramString1, paramString2, null);
  }
  
  public final void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS download_app_tab (_app_id long PRIMARY KEY,_app_name VARCHAR,_app_packagename VARCHAR,_app_download_url VARCHAR,_app_logo_url VARCHAR,_app_size long,_app_versioncode int,_app_isupdate int,_app_tr VARCHAR,_app_refer VARCHAR,_app_position int,_app_vender VARCHAR,_app_versionname VARCHAR,_app_sid VARCHAR,_app_download_status int)");
  }
  
  public final void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2) {}
  
  public final int update(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    return ad.update(paramString1, paramContentValues, paramString2, null);
  }
}
