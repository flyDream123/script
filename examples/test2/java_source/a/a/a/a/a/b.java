package a.a.a.a.a;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.provider.BaseColumns;
import cn.domob.android.i.f;

class b
  extends SQLiteOpenHelper
{
  protected static final int b = 1;
  protected static final int c = 0;
  protected static final long d = 0L;
  protected static final long e = -1L;
  protected static final int f = 0;
  protected static final int g = 1;
  protected static final int h = 2;
  protected static final int i = 3;
  protected static final int j = 0;
  protected static final int k = 1;
  protected static final int l = 2;
  protected static final int m = 3;
  protected static final int n = 4;
  private static final int o = 1;
  private static final String p = "Cache.db";
  private static b r = null;
  private static final String s = " TEXT";
  private static final String t = " LONG";
  private static final String u = " INTEGER";
  private static final String v = ",";
  private static final String w = "CREATE TABLE IF NOT EXISTS resourceGroup(_id INTEGER PRIMARY KEY,Rgid TEXT,Expires LONG,UseDate LONG,Ppid TEXT,Tracker TEXT,EventTrackerURL TEXT,State INTEGER );";
  private static final String x = "CREATE TABLE IF NOT EXISTS resource(_id INTEGER PRIMARY KEY,Ridd TEXT,Rgid TEXT,Type INTEGER,ResourceUrl TEXT,Path TEXT,DownState INTEGER,ContentLength LONG,CreatDate LONG,Width INTEGER,Height INTEGER );";
  private static final String y = "DROP TABLE IF EXISTS resourceGroup";
  private static final String z = "DROP TABLE IF EXISTS resource";
  f a = new f(b.class.getSimpleName());
  private SQLiteDatabase q = null;
  
  private b(Context paramContext)
  {
    super(paramContext.getApplicationContext(), "Cache.db", null, 1);
    try
    {
      q = getWritableDatabase();
      return;
    }
    catch (SQLiteException paramContext)
    {
      a.a(paramContext);
    }
  }
  
  protected static b a(Context paramContext)
  {
    try
    {
      if ((r == null) || (!r.a())) {
        r = new b(paramContext);
      }
      paramContext = r;
      return paramContext;
    }
    finally {}
  }
  
  protected int a(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString)
  {
    if (!a()) {
      return -1;
    }
    return q.update(paramString1, paramContentValues, paramString2, paramArrayOfString);
  }
  
  /* Error */
  protected int a(String paramString1, String paramString2, String[] paramArrayOfString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aload_0
    //   4: invokevirtual 111	a/a/a/a/a/b:a	()Z
    //   7: ifne +9 -> 16
    //   10: iconst_m1
    //   11: istore 4
    //   13: iload 4
    //   15: ireturn
    //   16: aload_0
    //   17: getfield 100	a/a/a/a/a/b:q	Landroid/database/sqlite/SQLiteDatabase;
    //   20: aload_1
    //   21: iconst_1
    //   22: anewarray 124	java/lang/String
    //   25: dup
    //   26: iconst_0
    //   27: ldc 126
    //   29: aastore
    //   30: aload_2
    //   31: aload_3
    //   32: aconst_null
    //   33: aconst_null
    //   34: aconst_null
    //   35: invokevirtual 130	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   38: astore_2
    //   39: aload_2
    //   40: ifnull +43 -> 83
    //   43: aload_2
    //   44: astore_1
    //   45: aload_2
    //   46: invokeinterface 136 1 0
    //   51: istore 5
    //   53: iload 5
    //   55: istore 4
    //   57: aload_2
    //   58: ifnull -45 -> 13
    //   61: iload 5
    //   63: istore 4
    //   65: aload_2
    //   66: invokeinterface 139 1 0
    //   71: ifne -58 -> 13
    //   74: aload_2
    //   75: invokeinterface 142 1 0
    //   80: iload 5
    //   82: ireturn
    //   83: aload_2
    //   84: ifnull +18 -> 102
    //   87: aload_2
    //   88: invokeinterface 139 1 0
    //   93: ifne +9 -> 102
    //   96: aload_2
    //   97: invokeinterface 142 1 0
    //   102: iconst_m1
    //   103: ireturn
    //   104: astore_3
    //   105: aconst_null
    //   106: astore_2
    //   107: aload_2
    //   108: astore_1
    //   109: aload_0
    //   110: getfield 98	a/a/a/a/a/b:a	Lcn/domob/android/i/f;
    //   113: aload_3
    //   114: invokevirtual 107	cn/domob/android/i/f:a	(Ljava/lang/Throwable;)V
    //   117: aload_2
    //   118: ifnull -16 -> 102
    //   121: aload_2
    //   122: invokeinterface 139 1 0
    //   127: ifne -25 -> 102
    //   130: aload_2
    //   131: invokeinterface 142 1 0
    //   136: goto -34 -> 102
    //   139: astore_1
    //   140: aload 6
    //   142: astore_2
    //   143: aload_2
    //   144: ifnull +18 -> 162
    //   147: aload_2
    //   148: invokeinterface 139 1 0
    //   153: ifne +9 -> 162
    //   156: aload_2
    //   157: invokeinterface 142 1 0
    //   162: aload_1
    //   163: athrow
    //   164: astore_3
    //   165: aload_1
    //   166: astore_2
    //   167: aload_3
    //   168: astore_1
    //   169: goto -26 -> 143
    //   172: astore_3
    //   173: goto -66 -> 107
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	176	0	this	b
    //   0	176	1	paramString1	String
    //   0	176	2	paramString2	String
    //   0	176	3	paramArrayOfString	String[]
    //   11	53	4	i1	int
    //   51	30	5	i2	int
    //   1	140	6	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   16	39	104	java/lang/Exception
    //   16	39	139	finally
    //   45	53	164	finally
    //   109	117	164	finally
    //   45	53	172	java/lang/Exception
  }
  
  protected Cursor a(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3, String paramString4)
  {
    if (!a()) {
      return null;
    }
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables(paramString1);
    return localSQLiteQueryBuilder.query(q, paramArrayOfString1, paramString2, paramArrayOfString2, null, null, paramString3, paramString4);
  }
  
  protected void a(String paramString)
  {
    if (!a()) {
      return;
    }
    q.delete("resourceGroup", "Rgid= ?", new String[] { paramString });
  }
  
  protected boolean a()
  {
    if ((q != null) && (q.isOpen()) && (!q.isReadOnly())) {
      return true;
    }
    a.e("freq database is not available");
    return false;
  }
  
  protected boolean a(c paramC)
  {
    if (!a()) {
      return false;
    }
    a.a("insert a new data : " + paramC.toString());
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("Ridd", paramC.a());
    localContentValues.put("Rgid", paramC.b());
    localContentValues.put("Type", Integer.valueOf(paramC.c()));
    localContentValues.put("ResourceUrl", paramC.d());
    localContentValues.put("Path", paramC.e());
    localContentValues.put("DownState", Integer.valueOf(paramC.f()));
    localContentValues.put("ContentLength", Long.valueOf(paramC.g()));
    localContentValues.put("CreatDate", Long.valueOf(paramC.h()));
    localContentValues.put("Width", Integer.valueOf(paramC.i()));
    localContentValues.put("Height", Integer.valueOf(paramC.j()));
    return a("resource", localContentValues);
  }
  
  protected boolean a(String paramString, ContentValues paramContentValues)
  {
    if (q.insert(paramString, null, paramContentValues) < 0L)
    {
      a.e("Insert: failed! " + paramContentValues.toString());
      return false;
    }
    a.b("insert successfully");
    return true;
  }
  
  protected void b()
  {
    if (!a()) {
      return;
    }
    a.d("empty database");
    q.delete("resourceGroup", null, null);
    q.delete("resource", null, null);
  }
  
  protected void b(String paramString)
  {
    if (!a()) {
      return;
    }
    q.delete("resource", "_id = ?", new String[] { paramString });
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    try
    {
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS resourceGroup(_id INTEGER PRIMARY KEY,Rgid TEXT,Expires LONG,UseDate LONG,Ppid TEXT,Tracker TEXT,EventTrackerURL TEXT,State INTEGER );");
      paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS resource(_id INTEGER PRIMARY KEY,Ridd TEXT,Rgid TEXT,Type INTEGER,ResourceUrl TEXT,Path TEXT,DownState INTEGER,ContentLength LONG,CreatDate LONG,Width INTEGER,Height INTEGER );");
      return;
    }
    catch (SQLException paramSQLiteDatabase)
    {
      a.a(paramSQLiteDatabase);
    }
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    try
    {
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS resourceGroup");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS resource");
      onCreate(paramSQLiteDatabase);
      return;
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        a.a(localSQLException);
      }
    }
  }
  
  protected static abstract class a
    implements BaseColumns
  {
    protected static final String a = "resourceGroup";
    protected static final String b = "Rgid";
    protected static final String c = "Expires";
    protected static final String d = "UseDate";
    protected static final String e = "State";
    protected static final String f = "Ppid";
    protected static final String g = "Tracker";
    protected static final String h = "EventTrackerURL";
    
    protected a() {}
  }
  
  protected static abstract class b
    implements BaseColumns
  {
    protected static final String a = "resource";
    protected static final String b = "Ridd";
    protected static final String c = "Rgid";
    protected static final String d = "Type";
    protected static final String e = "ResourceUrl";
    protected static final String f = "Path";
    protected static final String g = "DownState";
    protected static final String h = "ContentLength";
    protected static final String i = "CreatDate";
    protected static final String j = "Width";
    protected static final String k = "Height";
    
    protected b() {}
  }
}
