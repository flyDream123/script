package com.worklight.androidgap.plugin.storage;

import com.bangcle.andjni.JniLib;
import com.worklight.androidgap.jsonstore.database.DatabaseSchema;
import com.worklight.androidgap.jsonstore.database.WritableDatabase;
import java.util.LinkedList;
import org.apache.cordova.api.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RemoveActionDispatcher
  extends DatabaseActionDispatcher
{
  private static final String OPTION_EXACT = "exact";
  private static final String OPTION_IS_ERASE = "isErase";
  private static final String PARAM_OPTIONS = "options";
  private static final String PARAM_QUERY_OBJ = "queryObj";
  
  static
  {
    JniLib.a(RemoveActionDispatcher.class, 1174);
  }
  
  protected RemoveActionDispatcher()
  {
    super("remove");
    addParameter("queryObj", true, new BaseActionDispatcher.ParameterType[] { BaseActionDispatcher.ParameterType.ARRAY, BaseActionDispatcher.ParameterType.OBJECT });
    addParameter("options", false, new BaseActionDispatcher.ParameterType[] { BaseActionDispatcher.ParameterType.OBJECT });
  }
  
  private native JSONObject getOptions(BaseActionDispatcher.Context paramContext);
  
  private native Object getQueryObj(DatabaseActionDispatcher.Context paramContext);
  
  public native PluginResult dispatch(DatabaseActionDispatcher.Context paramContext)
    throws Throwable;
  
  private class RemoveAction
    implements DatabaseActionDispatcher.WritableDatabaseAction<Object>
  {
    private boolean exact;
    private boolean isErase;
    private LinkedList<JSONObject> objs;
    
    static
    {
      JniLib.a(RemoveAction.class, 1173);
    }
    
    private RemoveAction(JSONArray paramJSONArray, boolean paramBoolean1, boolean paramBoolean2)
      throws JSONException
    {
      this(paramBoolean1, paramBoolean2);
      int j = paramJSONArray.length();
      int i = 0;
      while (i < j)
      {
        objs.add(paramJSONArray.getJSONObject(i));
        i += 1;
      }
    }
    
    private RemoveAction(JSONObject paramJSONObject, boolean paramBoolean1, boolean paramBoolean2)
    {
      this(paramBoolean1, paramBoolean2);
      objs.add(paramJSONObject);
    }
    
    private RemoveAction(boolean paramBoolean1, boolean paramBoolean2)
    {
      isErase = paramBoolean1;
      exact = paramBoolean2;
      objs = new LinkedList();
    }
    
    public native Object performAction(DatabaseSchema paramDatabaseSchema, WritableDatabase paramWritableDatabase)
      throws Throwable;
  }
}
