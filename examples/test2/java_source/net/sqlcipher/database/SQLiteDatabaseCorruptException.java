package net.sqlcipher.database;

public class SQLiteDatabaseCorruptException
  extends SQLiteException
{
  public SQLiteDatabaseCorruptException() {}
  
  public SQLiteDatabaseCorruptException(String paramString)
  {
    super(paramString);
  }
}
