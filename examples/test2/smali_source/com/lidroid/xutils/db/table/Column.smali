.class public Lcom/lidroid/xutils/db/table/Column;
.super Ljava/lang/Object;
.source "Column.java"


# instance fields
.field protected final columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

.field protected final columnField:Ljava/lang/reflect/Field;

.field protected final columnName:Ljava/lang/String;

.field private final defaultValue:Ljava/lang/Object;

.field protected final getMethod:Ljava/lang/reflect/Method;

.field private index:I

.field protected final setMethod:Ljava/lang/reflect/Method;

.field private table:Lcom/lidroid/xutils/db/table/Table;


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Field;)V
    .registers 5
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, -0x1

    iput v0, p0, Lcom/lidroid/xutils/db/table/Column;->index:I

    .line 43
    iput-object p2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    .line 44
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/lidroid/xutils/db/converter/ColumnConverterFactory;->getColumnConverter(Ljava/lang/Class;)Lcom/lidroid/xutils/db/converter/ColumnConverter;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    .line 45
    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnNameByField(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnName:Ljava/lang/String;

    .line 46
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    if-eqz v0, :cond_35

    .line 47
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-static {p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnDefaultValue(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getFieldValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .line 51
    :goto_28
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnGetMethod(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    .line 52
    invoke-static {p1, p2}, Lcom/lidroid/xutils/db/table/ColumnUtils;->getColumnSetMethod(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    .line 53
    return-void

    .line 49
    :cond_35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    goto :goto_28
.end method


# virtual methods
.method public getColumnConverter()Lcom/lidroid/xutils/db/converter/ColumnConverter;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    return-object v0
.end method

.method public getColumnDbType()Lcom/lidroid/xutils/db/sqlite/ColumnDbType;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v0}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getColumnDbType()Lcom/lidroid/xutils/db/sqlite/ColumnDbType;

    move-result-object v0

    return-object v0
.end method

.method public getColumnField()Ljava/lang/reflect/Field;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getColumnName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->columnName:Ljava/lang/String;

    return-object v0
.end method

.method public getColumnValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/db/table/Column;->getFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "fieldValue":Ljava/lang/Object;
    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v1, v0}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->fieldValue2ColumnValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getDefaultValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getFieldValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "entity"    # Ljava/lang/Object;

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 85
    .local v1, "fieldValue":Ljava/lang/Object;
    if-eqz p1, :cond_10

    .line 86
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1a

    .line 88
    :try_start_7
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->getMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_f} :catch_11

    move-result-object v1

    .line 101
    .end local v1    # "fieldValue":Ljava/lang/Object;
    :cond_10
    :goto_10
    return-object v1

    .line 89
    .restart local v1    # "fieldValue":Ljava/lang/Object;
    :catch_11
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_10

    .line 94
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_1a
    :try_start_1a
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 95
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_25} :catch_27

    move-result-object v1

    goto :goto_10

    .line 96
    :catch_27
    move-exception v0

    .line 97
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_10
.end method

.method public getIndex()I
    .registers 2

    .prologue
    .line 118
    iget v0, p0, Lcom/lidroid/xutils/db/table/Column;->index:I

    return v0
.end method

.method public getTable()Lcom/lidroid/xutils/db/table/Table;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/lidroid/xutils/db/table/Column;->table:Lcom/lidroid/xutils/db/table/Table;

    return-object v0
.end method

.method setTable(Lcom/lidroid/xutils/db/table/Table;)V
    .registers 2
    .param p1, "table"    # Lcom/lidroid/xutils/db/table/Table;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/lidroid/xutils/db/table/Column;->table:Lcom/lidroid/xutils/db/table/Table;

    .line 110
    return-void
.end method

.method public setValue2Entity(Ljava/lang/Object;Landroid/database/Cursor;I)V
    .registers 9
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "index"    # I

    .prologue
    .line 57
    iput p3, p0, Lcom/lidroid/xutils/db/table/Column;->index:I

    .line 58
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnConverter:Lcom/lidroid/xutils/db/converter/ColumnConverter;

    invoke-interface {v2, p2, p3}, Lcom/lidroid/xutils/db/converter/ColumnConverter;->getFieldValue(Landroid/database/Cursor;I)Ljava/lang/Object;

    move-result-object v1

    .line 59
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_f

    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    if-nez v2, :cond_f

    .line 75
    .end local v1    # "value":Ljava/lang/Object;
    :goto_e
    return-void

    .line 61
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_f
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_2c

    .line 63
    :try_start_13
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->setMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    if-nez v1, :cond_1d

    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .end local v1    # "value":Ljava/lang/Object;
    :cond_1d
    aput-object v1, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_22} :catch_23

    goto :goto_e

    .line 64
    :catch_23
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_e

    .line 69
    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_2c
    :try_start_2c
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 70
    iget-object v2, p0, Lcom/lidroid/xutils/db/table/Column;->columnField:Ljava/lang/reflect/Field;

    if-nez v1, :cond_38

    iget-object v1, p0, Lcom/lidroid/xutils/db/table/Column;->defaultValue:Ljava/lang/Object;

    .end local v1    # "value":Ljava/lang/Object;
    :cond_38
    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_3b} :catch_3c

    goto :goto_e

    .line 71
    :catch_3c
    move-exception v0

    .line 72
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_e
.end method
