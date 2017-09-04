.class public Lcom/lidroid/xutils/DbUtils;
.super Ljava/lang/Object;
.source "DbUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lidroid/xutils/DbUtils$DaoConfig;,
        Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;,
        Lcom/lidroid/xutils/DbUtils$FindTempCache;
    }
.end annotation


# static fields
.field private static daoMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lidroid/xutils/DbUtils;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private allowTransaction:Z

.field private daoConfig:Lcom/lidroid/xutils/DbUtils$DaoConfig;

.field private database:Landroid/database/sqlite/SQLiteDatabase;

.field private debug:Z

.field private final findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

.field private writeLock:Ljava/util/concurrent/locks/Lock;

.field private volatile writeLocked:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lidroid/xutils/DbUtils;->daoMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Lcom/lidroid/xutils/DbUtils$DaoConfig;)V
    .registers 4
    .param p1, "config"    # Lcom/lidroid/xutils/DbUtils$DaoConfig;

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-boolean v1, p0, Lcom/lidroid/xutils/DbUtils;->debug:Z

    .line 51
    iput-boolean v1, p0, Lcom/lidroid/xutils/DbUtils;->allowTransaction:Z

    .line 783
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 784
    iput-boolean v1, p0, Lcom/lidroid/xutils/DbUtils;->writeLocked:Z

    .line 853
    new-instance v0, Lcom/lidroid/xutils/DbUtils$FindTempCache;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lidroid/xutils/DbUtils$FindTempCache;-><init>(Lcom/lidroid/xutils/DbUtils;Lcom/lidroid/xutils/DbUtils$FindTempCache;)V

    iput-object v0, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    .line 54
    if-nez p1, :cond_23

    .line 55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "daoConfig may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_23
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->createDatabase(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 58
    iput-object p1, p0, Lcom/lidroid/xutils/DbUtils;->daoConfig:Lcom/lidroid/xutils/DbUtils$DaoConfig;

    .line 59
    return-void
.end method

.method private beginTransaction()V
    .registers 2

    .prologue
    .line 787
    iget-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->allowTransaction:Z

    if-eqz v0, :cond_a

    .line 788
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 793
    :goto_9
    return-void

    .line 790
    :cond_a
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 791
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLocked:Z

    goto :goto_9
.end method

.method public static create(Landroid/content/Context;)Lcom/lidroid/xutils/DbUtils;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 95
    new-instance v0, Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;-><init>(Landroid/content/Context;)V

    .line 96
    .local v0, "config":Lcom/lidroid/xutils/DbUtils$DaoConfig;
    invoke-static {v0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v1

    return-object v1
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;)Lcom/lidroid/xutils/DbUtils;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 100
    new-instance v0, Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;-><init>(Landroid/content/Context;)V

    .line 101
    .local v0, "config":Lcom/lidroid/xutils/DbUtils$DaoConfig;
    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbName(Ljava/lang/String;)V

    .line 102
    invoke-static {v0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v1

    return-object v1
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;ILcom/lidroid/xutils/DbUtils$DbUpgradeListener;)Lcom/lidroid/xutils/DbUtils;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "dbVersion"    # I
    .param p3, "dbUpgradeListener"    # Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    .prologue
    .line 113
    new-instance v0, Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;-><init>(Landroid/content/Context;)V

    .line 114
    .local v0, "config":Lcom/lidroid/xutils/DbUtils$DaoConfig;
    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbName(Ljava/lang/String;)V

    .line 115
    invoke-virtual {v0, p2}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbVersion(I)V

    .line 116
    invoke-virtual {v0, p3}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbUpgradeListener(Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;)V

    .line 117
    invoke-static {v0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v1

    return-object v1
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/lidroid/xutils/DbUtils;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dbDir"    # Ljava/lang/String;
    .param p2, "dbName"    # Ljava/lang/String;

    .prologue
    .line 106
    new-instance v0, Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;-><init>(Landroid/content/Context;)V

    .line 107
    .local v0, "config":Lcom/lidroid/xutils/DbUtils$DaoConfig;
    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbDir(Ljava/lang/String;)V

    .line 108
    invoke-virtual {v0, p2}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbName(Ljava/lang/String;)V

    .line 109
    invoke-static {v0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v1

    return-object v1
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILcom/lidroid/xutils/DbUtils$DbUpgradeListener;)Lcom/lidroid/xutils/DbUtils;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dbDir"    # Ljava/lang/String;
    .param p2, "dbName"    # Ljava/lang/String;
    .param p3, "dbVersion"    # I
    .param p4, "dbUpgradeListener"    # Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    .prologue
    .line 121
    new-instance v0, Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;-><init>(Landroid/content/Context;)V

    .line 122
    .local v0, "config":Lcom/lidroid/xutils/DbUtils$DaoConfig;
    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbDir(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v0, p2}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbName(Ljava/lang/String;)V

    .line 124
    invoke-virtual {v0, p3}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbVersion(I)V

    .line 125
    invoke-virtual {v0, p4}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->setDbUpgradeListener(Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;)V

    .line 126
    invoke-static {v0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v1

    return-object v1
.end method

.method public static create(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;
    .registers 2
    .param p0, "daoConfig"    # Lcom/lidroid/xutils/DbUtils$DaoConfig;

    .prologue
    .line 130
    invoke-static {p0}, Lcom/lidroid/xutils/DbUtils;->getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;

    move-result-object v0

    return-object v0
.end method

.method private createDatabase(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Landroid/database/sqlite/SQLiteDatabase;
    .registers 10
    .param p1, "config"    # Lcom/lidroid/xutils/DbUtils$DaoConfig;

    .prologue
    const/4 v7, 0x0

    .line 635
    const/4 v3, 0x0

    .line 637
    .local v3, "result":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbDir()Ljava/lang/String;

    move-result-object v0

    .line 638
    .local v0, "dbDir":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 639
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 640
    .local v2, "dir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1d

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 641
    :cond_1d
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    .local v1, "dbFile":Ljava/io/File;
    invoke-static {v1, v7}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 647
    .end local v1    # "dbFile":Ljava/io/File;
    .end local v2    # "dir":Ljava/io/File;
    :cond_2a
    :goto_2a
    return-object v3

    .line 645
    :cond_2b
    invoke-virtual {p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    goto :goto_2a
.end method

.method private debugSql(Ljava/lang/String;)V
    .registers 3
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 778
    iget-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->debug:Z

    if-eqz v0, :cond_7

    .line 779
    invoke-static {p1}, Lcom/lidroid/xutils/util/LogUtils;->d(Ljava/lang/String;)V

    .line 781
    :cond_7
    return-void
.end method

.method private endTransaction()V
    .registers 2

    .prologue
    .line 802
    iget-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->allowTransaction:Z

    if-eqz v0, :cond_9

    .line 803
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 805
    :cond_9
    iget-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLocked:Z

    if-eqz v0, :cond_15

    .line 806
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 807
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->writeLocked:Z

    .line 809
    :cond_15
    return-void
.end method

.method private static declared-synchronized getInstance(Lcom/lidroid/xutils/DbUtils$DaoConfig;)Lcom/lidroid/xutils/DbUtils;
    .registers 10
    .param p0, "daoConfig"    # Lcom/lidroid/xutils/DbUtils$DaoConfig;

    .prologue
    .line 63
    const-class v7, Lcom/lidroid/xutils/DbUtils;

    monitor-enter v7

    :try_start_3
    sget-object v6, Lcom/lidroid/xutils/DbUtils;->daoMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lidroid/xutils/DbUtils;

    .line 64
    .local v0, "dao":Lcom/lidroid/xutils/DbUtils;
    if-nez v0, :cond_3b

    .line 65
    new-instance v0, Lcom/lidroid/xutils/DbUtils;

    .end local v0    # "dao":Lcom/lidroid/xutils/DbUtils;
    invoke-direct {v0, p0}, Lcom/lidroid/xutils/DbUtils;-><init>(Lcom/lidroid/xutils/DbUtils$DaoConfig;)V

    .line 66
    .restart local v0    # "dao":Lcom/lidroid/xutils/DbUtils;
    sget-object v6, Lcom/lidroid/xutils/DbUtils;->daoMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    :goto_1f
    iget-object v1, v0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    .line 73
    .local v1, "database":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v4

    .line 74
    .local v4, "oldVersion":I
    invoke-virtual {p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbVersion()I

    move-result v3

    .line 75
    .local v3, "newVersion":I
    if-eq v4, v3, :cond_39

    .line 76
    if-eqz v4, :cond_36

    .line 77
    invoke-virtual {p0}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbUpgradeListener()Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;

    move-result-object v5

    .line 78
    .local v5, "upgradeListener":Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;
    if-eqz v5, :cond_41

    .line 79
    invoke-interface {v5, v0, v4, v3}, Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;->onUpgrade(Lcom/lidroid/xutils/DbUtils;II)V

    .line 88
    .end local v5    # "upgradeListener":Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;
    :cond_36
    :goto_36
    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V
    :try_end_39
    .catchall {:try_start_3 .. :try_end_39} :catchall_3e

    .line 91
    :cond_39
    monitor-exit v7

    return-object v0

    .line 68
    .end local v1    # "database":Landroid/database/sqlite/SQLiteDatabase;
    .end local v3    # "newVersion":I
    .end local v4    # "oldVersion":I
    :cond_3b
    :try_start_3b
    iput-object p0, v0, Lcom/lidroid/xutils/DbUtils;->daoConfig:Lcom/lidroid/xutils/DbUtils$DaoConfig;
    :try_end_3d
    .catchall {:try_start_3b .. :try_end_3d} :catchall_3e

    goto :goto_1f

    .line 63
    .end local v0    # "dao":Lcom/lidroid/xutils/DbUtils;
    :catchall_3e
    move-exception v6

    monitor-exit v7

    throw v6

    .line 82
    .restart local v0    # "dao":Lcom/lidroid/xutils/DbUtils;
    .restart local v1    # "database":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v3    # "newVersion":I
    .restart local v4    # "oldVersion":I
    .restart local v5    # "upgradeListener":Lcom/lidroid/xutils/DbUtils$DbUpgradeListener;
    :cond_41
    :try_start_41
    invoke-virtual {v0}, Lcom/lidroid/xutils/DbUtils;->dropDb()V
    :try_end_44
    .catch Lcom/lidroid/xutils/exception/DbException; {:try_start_41 .. :try_end_44} :catch_45
    .catchall {:try_start_41 .. :try_end_44} :catchall_3e

    goto :goto_36

    .line 83
    :catch_45
    move-exception v2

    .line 84
    .local v2, "e":Lcom/lidroid/xutils/exception/DbException;
    :try_start_46
    invoke-virtual {v2}, Lcom/lidroid/xutils/exception/DbException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4d
    .catchall {:try_start_46 .. :try_end_4d} :catchall_3e

    goto :goto_36
.end method

.method private getLastAutoIncrementId(Ljava/lang/String;)J
    .registers 8
    .param p1, "tableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 686
    const-wide/16 v2, -0x1

    .line 687
    .local v2, "id":J
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "SELECT seq FROM sqlite_sequence WHERE name=\'"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 688
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_2b

    .line 690
    :try_start_1d
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_28

    .line 691
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_27} :catch_2c
    .catchall {:try_start_1d .. :try_end_27} :catchall_33

    move-result-wide v2

    .line 696
    :cond_28
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 699
    :cond_2b
    return-wide v2

    .line 693
    :catch_2c
    move-exception v1

    .line 694
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2d
    new-instance v4, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v4, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_33
    .catchall {:try_start_2d .. :try_end_33} :catchall_33

    .line 695
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_33
    move-exception v4

    .line 696
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 697
    throw v4
.end method

.method private saveBindingIdWithoutTransaction(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 666
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 667
    .local v0, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v0}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v4

    .line 668
    .local v4, "table":Lcom/lidroid/xutils/db/table/Table;
    iget-object v1, v4, Lcom/lidroid/xutils/db/table/Table;->id:Lcom/lidroid/xutils/db/table/Id;

    .line 669
    .local v1, "idColumn":Lcom/lidroid/xutils/db/table/Id;
    invoke-virtual {v1}, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement()Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 670
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildInsertSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 671
    iget-object v6, v4, Lcom/lidroid/xutils/db/table/Table;->tableName:Ljava/lang/String;

    invoke-direct {p0, v6}, Lcom/lidroid/xutils/DbUtils;->getLastAutoIncrementId(Ljava/lang/String;)J

    move-result-wide v2

    .line 672
    .local v2, "id":J
    const-wide/16 v6, -0x1

    cmp-long v6, v2, v6

    if-nez v6, :cond_26

    .line 673
    const/4 v5, 0x0

    .line 679
    .end local v2    # "id":J
    :goto_25
    return v5

    .line 675
    .restart local v2    # "id":J
    :cond_26
    invoke-virtual {v1, p1, v2, v3}, Lcom/lidroid/xutils/db/table/Id;->setAutoIncrementId(Ljava/lang/Object;J)V

    goto :goto_25

    .line 678
    .end local v2    # "id":J
    :cond_2a
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildInsertSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    goto :goto_25
.end method

.method private saveOrUpdateWithoutTransaction(Ljava/lang/Object;)V
    .registers 5
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 652
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v1

    .line 653
    .local v1, "table":Lcom/lidroid/xutils/db/table/Table;
    iget-object v0, v1, Lcom/lidroid/xutils/db/table/Table;->id:Lcom/lidroid/xutils/db/table/Id;

    .line 654
    .local v0, "id":Lcom/lidroid/xutils/db/table/Id;
    invoke-virtual {v0}, Lcom/lidroid/xutils/db/table/Id;->isAutoIncrement()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 655
    invoke-virtual {v0, p1}, Lcom/lidroid/xutils/db/table/Id;->getColumnValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_21

    .line 656
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-static {p0, p1, v2}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildUpdateSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;[Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 663
    :goto_20
    return-void

    .line 658
    :cond_21
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->saveBindingIdWithoutTransaction(Ljava/lang/Object;)Z

    goto :goto_20

    .line 661
    :cond_25
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildReplaceSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    goto :goto_20
.end method

.method private setTransactionSuccessful()V
    .registers 2

    .prologue
    .line 796
    iget-boolean v0, p0, Lcom/lidroid/xutils/DbUtils;->allowTransaction:Z

    if-eqz v0, :cond_9

    .line 797
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 799
    :cond_9
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 769
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->daoConfig:Lcom/lidroid/xutils/DbUtils$DaoConfig;

    invoke-virtual {v1}, Lcom/lidroid/xutils/DbUtils$DaoConfig;->getDbName()Ljava/lang/String;

    move-result-object v0

    .line 770
    .local v0, "dbName":Ljava/lang/String;
    sget-object v1, Lcom/lidroid/xutils/DbUtils;->daoMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 771
    sget-object v1, Lcom/lidroid/xutils/DbUtils;->daoMap:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 774
    :cond_18
    return-void
.end method

.method public configAllowTransaction(Z)Lcom/lidroid/xutils/DbUtils;
    .registers 2
    .param p1, "allowTransaction"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lcom/lidroid/xutils/DbUtils;->allowTransaction:Z

    .line 140
    return-object p0
.end method

.method public configDebug(Z)Lcom/lidroid/xutils/DbUtils;
    .registers 2
    .param p1, "debug"    # Z

    .prologue
    .line 134
    iput-boolean p1, p0, Lcom/lidroid/xutils/DbUtils;->debug:Z

    .line 135
    return-object p0
.end method

.method public count(Lcom/lidroid/xutils/db/sqlite/Selector;)J
    .registers 9
    .param p1, "selector"    # Lcom/lidroid/xutils/db/sqlite/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 560
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->getEntityType()Ljava/lang/Class;

    move-result-object v1

    .line 561
    .local v1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_d

    const-wide/16 v4, 0x0

    .line 565
    :goto_c
    return-wide v4

    .line 563
    :cond_d
    invoke-static {p0, v1}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v2

    .line 564
    .local v2, "table":Lcom/lidroid/xutils/db/table/Table;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "count("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v2, Lcom/lidroid/xutils/db/table/Table;->id:Lcom/lidroid/xutils/db/table/Id;

    invoke-virtual {v6}, Lcom/lidroid/xutils/db/table/Id;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") as count"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p1, v3}, Lcom/lidroid/xutils/db/sqlite/Selector;->select([Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/DbModelSelector;

    move-result-object v0

    .line 565
    .local v0, "dmSelector":Lcom/lidroid/xutils/db/sqlite/DbModelSelector;
    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->findDbModelFirst(Lcom/lidroid/xutils/db/sqlite/DbModelSelector;)Lcom/lidroid/xutils/db/table/DbModel;

    move-result-object v3

    const-string v4, "count"

    invoke-virtual {v3, v4}, Lcom/lidroid/xutils/db/table/DbModel;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    goto :goto_c
.end method

.method public count(Ljava/lang/Class;)J
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 569
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->count(Lcom/lidroid/xutils/db/sqlite/Selector;)J

    move-result-wide v0

    return-wide v0
.end method

.method public createTableIfNotExist(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 703
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_1a

    .line 704
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildCreateTableSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v1

    .line 705
    .local v1, "sqlInfo":Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 706
    invoke-static {p1}, Lcom/lidroid/xutils/db/table/TableUtils;->getExecAfterTableCreated(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 707
    .local v0, "execAfterTableCreated":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1a

    .line 708
    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Ljava/lang/String;)V

    .line 711
    .end local v0    # "execAfterTableCreated":Ljava/lang/String;
    .end local v1    # "sqlInfo":Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    :cond_1a
    return-void
.end method

.method public delete(Ljava/lang/Class;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;)V
    .registers 4
    .param p2, "whereBuilder"    # Lcom/lidroid/xutils/db/sqlite/WhereBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/lidroid/xutils/db/sqlite/WhereBuilder;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 300
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 310
    :goto_6
    return-void

    .line 302
    :cond_7
    :try_start_7
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 304
    invoke-static {p0, p1, p2}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildDeleteSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 306
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_18

    .line 308
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_6

    .line 307
    :catchall_18
    move-exception v0

    .line 308
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 309
    throw v0
.end method

.method public delete(Ljava/lang/Object;)V
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 287
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 297
    :goto_a
    return-void

    .line 289
    :cond_b
    :try_start_b
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 291
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildDeleteSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 293
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_1c

    .line 295
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_a

    .line 294
    :catchall_1c
    move-exception v0

    .line 295
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 296
    throw v0
.end method

.method public deleteAll(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 328
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lidroid/xutils/DbUtils;->delete(Ljava/lang/Class;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;)V

    .line 329
    return-void
.end method

.method public deleteAll(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 313
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_17

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 325
    :cond_17
    :goto_17
    return-void

    .line 315
    :cond_18
    :try_start_18
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 317
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 321
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_38

    .line 323
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_17

    .line 317
    :cond_2c
    :try_start_2c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 318
    .local v0, "entity":Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildDeleteSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    :try_end_37
    .catchall {:try_start_2c .. :try_end_37} :catchall_38

    goto :goto_1f

    .line 322
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_38
    move-exception v1

    .line 323
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 324
    throw v1
.end method

.method public deleteById(Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 4
    .param p2, "idValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 274
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 284
    :goto_6
    return-void

    .line 276
    :cond_7
    :try_start_7
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 278
    invoke-static {p0, p1, p2}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildDeleteSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 280
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_18

    .line 282
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_6

    .line 281
    :catchall_18
    move-exception v0

    .line 282
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 283
    throw v0
.end method

.method public dropDb()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 740
    const-string v3, "SELECT name FROM sqlite_master WHERE type=\'table\' AND name<>\'sqlite_sequence\'"

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 741
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_11

    .line 743
    :goto_8
    :try_start_8
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_b} :catch_36
    .catchall {:try_start_8 .. :try_end_b} :catchall_3d

    move-result v3

    if-nez v3, :cond_12

    .line 756
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 759
    :cond_11
    return-void

    .line 745
    :cond_12
    const/4 v3, 0x0

    :try_start_13
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 746
    .local v2, "tableName":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "DROP TABLE "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Ljava/lang/String;)V

    .line 747
    invoke-static {p0, v2}, Lcom/lidroid/xutils/db/table/Table;->remove(Lcom/lidroid/xutils/DbUtils;Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_2c} :catch_2d
    .catchall {:try_start_13 .. :try_end_2c} :catchall_3d

    goto :goto_8

    .line 748
    .end local v2    # "tableName":Ljava/lang/String;
    :catch_2d
    move-exception v1

    .line 749
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2e
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_35} :catch_36
    .catchall {:try_start_2e .. :try_end_35} :catchall_3d

    goto :goto_8

    .line 753
    .end local v1    # "e":Ljava/lang/Throwable;
    :catch_36
    move-exception v1

    .line 754
    .restart local v1    # "e":Ljava/lang/Throwable;
    :try_start_37
    new-instance v3, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v3, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3d
    .catchall {:try_start_37 .. :try_end_3d} :catchall_3d

    .line 755
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_3d
    move-exception v3

    .line 756
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 757
    throw v3
.end method

.method public dropTable(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 762
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 766
    :goto_6
    return-void

    .line 763
    :cond_7
    invoke-static {p1}, Lcom/lidroid/xutils/db/table/TableUtils;->getTableName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 764
    .local v0, "tableName":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "DROP TABLE "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Ljava/lang/String;)V

    .line 765
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/table/Table;->remove(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)V

    goto :goto_6
.end method

.method public execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    .registers 6
    .param p1, "sqlInfo"    # Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 813
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getSql()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/lidroid/xutils/DbUtils;->debugSql(Ljava/lang/String;)V

    .line 815
    :try_start_7
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getBindArgs()Ljava/util/LinkedList;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 816
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getSql()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getBindArgsAsArray()[Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 823
    :goto_1a
    return-void

    .line 818
    :cond_1b
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getSql()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_24} :catch_25

    goto :goto_1a

    .line 820
    :catch_25
    move-exception v0

    .line 821
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v1, v0}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public execNonQuery(Ljava/lang/String;)V
    .registers 4
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 826
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->debugSql(Ljava/lang/String;)V

    .line 828
    :try_start_3
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_8} :catch_9

    .line 832
    return-void

    .line 829
    :catch_9
    move-exception v0

    .line 830
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v1, v0}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public execQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)Landroid/database/Cursor;
    .registers 6
    .param p1, "sqlInfo"    # Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 835
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getSql()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/lidroid/xutils/DbUtils;->debugSql(Ljava/lang/String;)V

    .line 837
    :try_start_7
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getSql()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfo;->getBindArgsAsStrArray()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_14} :catch_16

    move-result-object v1

    return-object v1

    .line 838
    :catch_16
    move-exception v0

    .line 839
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v1, v0}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public execQuery(Ljava/lang/String;)Landroid/database/Cursor;
    .registers 5
    .param p1, "sql"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 844
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->debugSql(Ljava/lang/String;)V

    .line 846
    :try_start_3
    iget-object v1, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 847
    :catch_b
    move-exception v0

    .line 848
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v1, v0}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public findAll(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/util/List;
    .registers 11
    .param p1, "selector"    # Lcom/lidroid/xutils/db/sqlite/Selector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/lidroid/xutils/db/sqlite/Selector;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 454
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->getEntityType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_c

    const/4 v3, 0x0

    .line 480
    :goto_b
    return-object v3

    .line 456
    :cond_c
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->toString()Ljava/lang/String;

    move-result-object v5

    .line 457
    .local v5, "sql":Ljava/lang/String;
    invoke-static {}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->getSeq()J

    move-result-wide v6

    .line 458
    .local v6, "seq":J
    iget-object v8, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v8, v6, v7}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->setSeq(J)V

    .line 459
    iget-object v8, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v8, v5}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 460
    .local v3, "obj":Ljava/lang/Object;
    if-eqz v3, :cond_24

    .line 461
    check-cast v3, Ljava/util/List;

    goto :goto_b

    .line 464
    :cond_24
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 466
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0, v5}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 467
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_3d

    .line 469
    :goto_2f
    :try_start_2f
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-nez v8, :cond_3f

    .line 473
    iget-object v8, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v8, v5, v4}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->put(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_3a} :catch_4b
    .catchall {:try_start_2f .. :try_end_3a} :catchall_52

    .line 477
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    :cond_3d
    move-object v3, v4

    .line 480
    goto :goto_b

    .line 470
    :cond_3f
    :try_start_3f
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->getEntityType()Ljava/lang/Class;

    move-result-object v8

    invoke-static {p0, v0, v8, v6, v7}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getEntity(Lcom/lidroid/xutils/DbUtils;Landroid/database/Cursor;Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v2

    .line 471
    .local v2, "entity":Ljava/lang/Object;, "TT;"
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_4a} :catch_4b
    .catchall {:try_start_3f .. :try_end_4a} :catchall_52

    goto :goto_2f

    .line 474
    .end local v2    # "entity":Ljava/lang/Object;, "TT;"
    :catch_4b
    move-exception v1

    .line 475
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_4c
    new-instance v8, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v8, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v8
    :try_end_52
    .catchall {:try_start_4c .. :try_end_52} :catchall_52

    .line 476
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_52
    move-exception v8

    .line 477
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 478
    throw v8
.end method

.method public findAll(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 484
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->findAll(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public findById(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p2, "idValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 389
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_9

    move-object v3, v2

    .line 416
    :cond_8
    :goto_8
    return-object v3

    .line 391
    :cond_9
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v8

    .line 392
    .local v8, "table":Lcom/lidroid/xutils/db/table/Table;
    invoke-static {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v9

    iget-object v10, v8, Lcom/lidroid/xutils/db/table/Table;->id:Lcom/lidroid/xutils/db/table/Id;

    invoke-virtual {v10}, Lcom/lidroid/xutils/db/table/Id;->getColumnName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "="

    invoke-virtual {v9, v10, v11, p2}, Lcom/lidroid/xutils/db/sqlite/Selector;->where(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v4

    .line 394
    .local v4, "selector":Lcom/lidroid/xutils/db/sqlite/Selector;
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Lcom/lidroid/xutils/db/sqlite/Selector;->limit(I)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v9

    invoke-virtual {v9}, Lcom/lidroid/xutils/db/sqlite/Selector;->toString()Ljava/lang/String;

    move-result-object v5

    .line 395
    .local v5, "sql":Ljava/lang/String;
    invoke-static {}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->getSeq()J

    move-result-wide v6

    .line 396
    .local v6, "seq":J
    iget-object v9, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v9, v6, v7}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->setSeq(J)V

    .line 397
    iget-object v9, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v9, v5}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 398
    .local v3, "obj":Ljava/lang/Object;
    if-nez v3, :cond_8

    .line 402
    invoke-virtual {p0, v5}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 403
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_60

    .line 405
    :try_start_3d
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_5d

    .line 406
    invoke-static {p0, v0, p1, v6, v7}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getEntity(Lcom/lidroid/xutils/DbUtils;Landroid/database/Cursor;Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v2

    .line 407
    .local v2, "entity":Ljava/lang/Object;, "TT;"
    iget-object v9, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v9, v5, v2}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->put(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_4c} :catch_51
    .catchall {:try_start_3d .. :try_end_4c} :catchall_58

    .line 413
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    move-object v3, v2

    .line 408
    goto :goto_8

    .line 410
    .end local v2    # "entity":Ljava/lang/Object;, "TT;"
    :catch_51
    move-exception v1

    .line 411
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_52
    new-instance v9, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v9, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v9
    :try_end_58
    .catchall {:try_start_52 .. :try_end_58} :catchall_58

    .line 412
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_58
    move-exception v9

    .line 413
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 414
    throw v9

    .line 413
    :cond_5d
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    :cond_60
    move-object v3, v2

    .line 416
    goto :goto_8
.end method

.method public findDbModelAll(Lcom/lidroid/xutils/db/sqlite/DbModelSelector;)Ljava/util/List;
    .registers 6
    .param p1, "selector"    # Lcom/lidroid/xutils/db/sqlite/DbModelSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lidroid/xutils/db/sqlite/DbModelSelector;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/db/table/DbModel;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 540
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/DbModelSelector;->getEntityType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_c

    const/4 v1, 0x0

    .line 556
    :cond_b
    :goto_b
    return-object v1

    .line 542
    :cond_c
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 544
    .local v1, "dbModelList":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/db/table/DbModel;>;"
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/DbModelSelector;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 545
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_b

    .line 547
    :goto_1b
    :try_start_1b
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1e} :catch_2d
    .catchall {:try_start_1b .. :try_end_1e} :catchall_34

    move-result v3

    if-nez v3, :cond_25

    .line 553
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    goto :goto_b

    .line 548
    :cond_25
    :try_start_25
    invoke-static {v0}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getDbModel(Landroid/database/Cursor;)Lcom/lidroid/xutils/db/table/DbModel;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_2c} :catch_2d
    .catchall {:try_start_25 .. :try_end_2c} :catchall_34

    goto :goto_1b

    .line 550
    :catch_2d
    move-exception v2

    .line 551
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_2e
    new-instance v3, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v3, v2}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_34
    .catchall {:try_start_2e .. :try_end_34} :catchall_34

    .line 552
    .end local v2    # "e":Ljava/lang/Throwable;
    :catchall_34
    move-exception v3

    .line 553
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 554
    throw v3
.end method

.method public findDbModelAll(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)Ljava/util/List;
    .registers 6
    .param p1, "sqlInfo"    # Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lidroid/xutils/db/sqlite/SqlInfo;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/lidroid/xutils/db/table/DbModel;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 522
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 524
    .local v1, "dbModelList":Ljava/util/List;, "Ljava/util/List<Lcom/lidroid/xutils/db/table/DbModel;>;"
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->execQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)Landroid/database/Cursor;

    move-result-object v0

    .line 525
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_14

    .line 527
    :goto_b
    :try_start_b
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_e} :catch_1d
    .catchall {:try_start_b .. :try_end_e} :catchall_24

    move-result v3

    if-nez v3, :cond_15

    .line 533
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 536
    :cond_14
    return-object v1

    .line 528
    :cond_15
    :try_start_15
    invoke-static {v0}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getDbModel(Landroid/database/Cursor;)Lcom/lidroid/xutils/db/table/DbModel;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_1c} :catch_1d
    .catchall {:try_start_15 .. :try_end_1c} :catchall_24

    goto :goto_b

    .line 530
    :catch_1d
    move-exception v2

    .line 531
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_1e
    new-instance v3, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v3, v2}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_24
    .catchall {:try_start_1e .. :try_end_24} :catchall_24

    .line 532
    .end local v2    # "e":Ljava/lang/Throwable;
    :catchall_24
    move-exception v3

    .line 533
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 534
    throw v3
.end method

.method public findDbModelFirst(Lcom/lidroid/xutils/db/sqlite/DbModelSelector;)Lcom/lidroid/xutils/db/table/DbModel;
    .registers 6
    .param p1, "selector"    # Lcom/lidroid/xutils/db/sqlite/DbModelSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 504
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/DbModelSelector;->getEntityType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 518
    :cond_b
    :goto_b
    return-object v2

    .line 506
    :cond_c
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lcom/lidroid/xutils/db/sqlite/DbModelSelector;->limit(I)Lcom/lidroid/xutils/db/sqlite/DbModelSelector;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lidroid/xutils/db/sqlite/DbModelSelector;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 507
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_b

    .line 509
    :try_start_1b
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 510
    invoke-static {v0}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getDbModel(Landroid/database/Cursor;)Lcom/lidroid/xutils/db/table/DbModel;
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_24} :catch_29
    .catchall {:try_start_1b .. :try_end_24} :catchall_30

    move-result-object v2

    .line 515
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    goto :goto_b

    .line 512
    :catch_29
    move-exception v1

    .line 513
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2a
    new-instance v2, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v2, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_30
    .catchall {:try_start_2a .. :try_end_30} :catchall_30

    .line 514
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_30
    move-exception v2

    .line 515
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 516
    throw v2

    .line 515
    :cond_35
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    goto :goto_b
.end method

.method public findDbModelFirst(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)Lcom/lidroid/xutils/db/table/DbModel;
    .registers 5
    .param p1, "sqlInfo"    # Lcom/lidroid/xutils/db/sqlite/SqlInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 488
    invoke-virtual {p0, p1}, Lcom/lidroid/xutils/DbUtils;->execQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)Landroid/database/Cursor;

    move-result-object v0

    .line 489
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_23

    .line 491
    :try_start_6
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 492
    invoke-static {v0}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getDbModel(Landroid/database/Cursor;)Lcom/lidroid/xutils/db/table/DbModel;
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_f} :catch_14
    .catchall {:try_start_6 .. :try_end_f} :catchall_1b

    move-result-object v2

    .line 497
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 500
    :goto_13
    return-object v2

    .line 494
    :catch_14
    move-exception v1

    .line 495
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_15
    new-instance v2, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v2, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_1b
    .catchall {:try_start_15 .. :try_end_1b} :catchall_1b

    .line 496
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_1b
    move-exception v2

    .line 497
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 498
    throw v2

    .line 497
    :cond_20
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 500
    :cond_23
    const/4 v2, 0x0

    goto :goto_13
.end method

.method public findFirst(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/lang/Object;
    .registers 10
    .param p1, "selector"    # Lcom/lidroid/xutils/db/sqlite/Selector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/lidroid/xutils/db/sqlite/Selector;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 421
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->getEntityType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_d

    move-object v3, v2

    .line 445
    :cond_c
    :goto_c
    return-object v3

    .line 423
    :cond_d
    const/4 v7, 0x1

    invoke-virtual {p1, v7}, Lcom/lidroid/xutils/db/sqlite/Selector;->limit(I)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v7

    invoke-virtual {v7}, Lcom/lidroid/xutils/db/sqlite/Selector;->toString()Ljava/lang/String;

    move-result-object v6

    .line 424
    .local v6, "sql":Ljava/lang/String;
    invoke-static {}, Lcom/lidroid/xutils/db/sqlite/CursorUtils$FindCacheSequence;->getSeq()J

    move-result-wide v4

    .line 425
    .local v4, "seq":J
    iget-object v7, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v7, v4, v5}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->setSeq(J)V

    .line 426
    iget-object v7, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v7, v6}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 427
    .local v3, "obj":Ljava/lang/Object;
    if-nez v3, :cond_c

    .line 431
    invoke-virtual {p0, v6}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 432
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_54

    .line 434
    :try_start_2d
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_51

    .line 435
    invoke-virtual {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->getEntityType()Ljava/lang/Class;

    move-result-object v7

    invoke-static {p0, v0, v7, v4, v5}, Lcom/lidroid/xutils/db/sqlite/CursorUtils;->getEntity(Lcom/lidroid/xutils/DbUtils;Landroid/database/Cursor;Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v2

    .line 436
    .local v2, "entity":Ljava/lang/Object;, "TT;"
    iget-object v7, p0, Lcom/lidroid/xutils/DbUtils;->findTempCache:Lcom/lidroid/xutils/DbUtils$FindTempCache;

    invoke-virtual {v7, v6, v2}, Lcom/lidroid/xutils/DbUtils$FindTempCache;->put(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_40} :catch_45
    .catchall {:try_start_2d .. :try_end_40} :catchall_4c

    .line 442
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    move-object v3, v2

    .line 437
    goto :goto_c

    .line 439
    .end local v2    # "entity":Ljava/lang/Object;, "TT;"
    :catch_45
    move-exception v1

    .line 440
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_46
    new-instance v7, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v7, v1}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_4c
    .catchall {:try_start_46 .. :try_end_4c} :catchall_4c

    .line 441
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_4c
    move-exception v7

    .line 442
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 443
    throw v7

    .line 442
    :cond_51
    invoke-static {v0}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    :cond_54
    move-object v3, v2

    .line 445
    goto :goto_c
.end method

.method public findFirst(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 449
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1}, Lcom/lidroid/xutils/db/sqlite/Selector;->from(Ljava/lang/Class;)Lcom/lidroid/xutils/db/sqlite/Selector;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->findFirst(Lcom/lidroid/xutils/db/sqlite/Selector;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDaoConfig()Lcom/lidroid/xutils/DbUtils$DaoConfig;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->daoConfig:Lcom/lidroid/xutils/DbUtils$DaoConfig;

    return-object v0
.end method

.method public getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/lidroid/xutils/DbUtils;->database:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public replace(Ljava/lang/Object;)V
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 184
    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 186
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 187
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildReplaceSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 189
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_18

    .line 191
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 193
    return-void

    .line 190
    :catchall_18
    move-exception v0

    .line 191
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 192
    throw v0
.end method

.method public replaceAll(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 196
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9

    .line 209
    :cond_8
    :goto_8
    return-void

    .line 198
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 200
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 201
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_29

    .line 205
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_9 .. :try_end_25} :catchall_35

    .line 207
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_8

    .line 201
    :cond_29
    :try_start_29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 202
    .local v0, "entity":Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildReplaceSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    :try_end_34
    .catchall {:try_start_29 .. :try_end_34} :catchall_35

    goto :goto_1c

    .line 206
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_35
    move-exception v1

    .line 207
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 208
    throw v1
.end method

.method public save(Ljava/lang/Object;)V
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 213
    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 215
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 216
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildInsertSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 218
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_18

    .line 220
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 222
    return-void

    .line 219
    :catchall_18
    move-exception v0

    .line 220
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 221
    throw v0
.end method

.method public saveAll(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9

    .line 238
    :cond_8
    :goto_8
    return-void

    .line 227
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 229
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 230
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_29

    .line 234
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_9 .. :try_end_25} :catchall_35

    .line 236
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_8

    .line 230
    :cond_29
    :try_start_29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 231
    .local v0, "entity":Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildInsertSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    :try_end_34
    .catchall {:try_start_29 .. :try_end_34} :catchall_35

    goto :goto_1c

    .line 235
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_35
    move-exception v1

    .line 236
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 237
    throw v1
.end method

.method public saveBindingId(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 241
    const/4 v0, 0x0

    .line 243
    .local v0, "result":Z
    :try_start_1
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 245
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 246
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->saveBindingIdWithoutTransaction(Ljava/lang/Object;)Z

    move-result v0

    .line 248
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_16

    .line 250
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 252
    return v0

    .line 249
    :catchall_16
    move-exception v1

    .line 250
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 251
    throw v1
.end method

.method public saveBindingIdAll(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 256
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9

    .line 271
    :cond_8
    :goto_8
    return-void

    .line 258
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 260
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 261
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_29

    .line 267
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_9 .. :try_end_25} :catchall_3b

    .line 269
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_8

    .line 261
    :cond_29
    :try_start_29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 262
    .local v0, "entity":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/DbUtils;->saveBindingIdWithoutTransaction(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 263
    new-instance v1, Lcom/lidroid/xutils/exception/DbException;

    const-string v2, "saveBindingId error, transaction will not commit!"

    invoke-direct {v1, v2}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3b
    .catchall {:try_start_29 .. :try_end_3b} :catchall_3b

    .line 268
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_3b
    move-exception v1

    .line 269
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 270
    throw v1
.end method

.method public saveOrUpdate(Ljava/lang/Object;)V
    .registers 3
    .param p1, "entity"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 155
    :try_start_0
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 157
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 158
    invoke-direct {p0, p1}, Lcom/lidroid/xutils/DbUtils;->saveOrUpdateWithoutTransaction(Ljava/lang/Object;)V

    .line 160
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_10
    .catchall {:try_start_0 .. :try_end_10} :catchall_14

    .line 162
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 164
    return-void

    .line 161
    :catchall_14
    move-exception v0

    .line 162
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 163
    throw v0
.end method

.method public saveOrUpdateAll(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_9

    .line 180
    :cond_8
    :goto_8
    return-void

    .line 169
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 171
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->createTableIfNotExist(Ljava/lang/Class;)V

    .line 172
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_29

    .line 176
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_25
    .catchall {:try_start_9 .. :try_end_25} :catchall_31

    .line 178
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_8

    .line 172
    :cond_29
    :try_start_29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 173
    .local v0, "entity":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/lidroid/xutils/DbUtils;->saveOrUpdateWithoutTransaction(Ljava/lang/Object;)V
    :try_end_30
    .catchall {:try_start_29 .. :try_end_30} :catchall_31

    goto :goto_1c

    .line 177
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_31
    move-exception v1

    .line 178
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 179
    throw v1
.end method

.method public tableIsExist(Ljava/lang/Class;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .local p1, "entityType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 714
    invoke-static {p0, p1}, Lcom/lidroid/xutils/db/table/Table;->get(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Class;)Lcom/lidroid/xutils/db/table/Table;

    move-result-object v3

    .line 715
    .local v3, "table":Lcom/lidroid/xutils/db/table/Table;
    invoke-virtual {v3}, Lcom/lidroid/xutils/db/table/Table;->isCheckedDatabase()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 736
    :goto_c
    return v4

    .line 719
    :cond_d
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "SELECT COUNT(*) AS c FROM sqlite_master WHERE type=\'table\' AND name=\'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, v3, Lcom/lidroid/xutils/db/table/Table;->tableName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/lidroid/xutils/DbUtils;->execQuery(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 720
    .local v1, "cursor":Landroid/database/Cursor;
    if-eqz v1, :cond_4e

    .line 722
    :try_start_2a
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_4b

    .line 723
    const/4 v6, 0x0

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    .line 724
    .local v0, "count":I
    if-lez v0, :cond_4b

    .line 725
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/lidroid/xutils/db/table/Table;->setCheckedDatabase(Z)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_3b} :catch_3f
    .catchall {:try_start_2a .. :try_end_3b} :catchall_46

    .line 732
    invoke-static {v1}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    goto :goto_c

    .line 729
    .end local v0    # "count":I
    :catch_3f
    move-exception v2

    .line 730
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_40
    new-instance v4, Lcom/lidroid/xutils/exception/DbException;

    invoke-direct {v4, v2}, Lcom/lidroid/xutils/exception/DbException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 731
    .end local v2    # "e":Ljava/lang/Throwable;
    :catchall_46
    move-exception v4

    .line 732
    invoke-static {v1}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    .line 733
    throw v4

    .line 732
    :cond_4b
    invoke-static {v1}, Lcom/lidroid/xutils/util/IOUtils;->closeQuietly(Landroid/database/Cursor;)V

    :cond_4e
    move v4, v5

    .line 736
    goto :goto_c
.end method

.method public varargs update(Ljava/lang/Object;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;[Ljava/lang/String;)V
    .registers 5
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "whereBuilder"    # Lcom/lidroid/xutils/db/sqlite/WhereBuilder;
    .param p3, "updateColumnNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 345
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 355
    :goto_a
    return-void

    .line 347
    :cond_b
    :try_start_b
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 349
    invoke-static {p0, p1, p2, p3}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildUpdateSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;[Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 351
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_1c

    .line 353
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_a

    .line 352
    :catchall_1c
    move-exception v0

    .line 353
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 354
    throw v0
.end method

.method public varargs update(Ljava/lang/Object;[Ljava/lang/String;)V
    .registers 4
    .param p1, "entity"    # Ljava/lang/Object;
    .param p2, "updateColumnNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 332
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 342
    :goto_a
    return-void

    .line 334
    :cond_b
    :try_start_b
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 336
    invoke-static {p0, p1, p2}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildUpdateSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;[Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V

    .line 338
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_1c

    .line 340
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_a

    .line 339
    :catchall_1c
    move-exception v0

    .line 340
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 341
    throw v0
.end method

.method public varargs updateAll(Ljava/util/List;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;[Ljava/lang/String;)V
    .registers 7
    .param p2, "whereBuilder"    # Lcom/lidroid/xutils/db/sqlite/WhereBuilder;
    .param p3, "updateColumnNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;",
            "Lcom/lidroid/xutils/db/sqlite/WhereBuilder;",
            "[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 373
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_17

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 385
    :cond_17
    :goto_17
    return-void

    .line 375
    :cond_18
    :try_start_18
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 377
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 381
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_38

    .line 383
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_17

    .line 377
    :cond_2c
    :try_start_2c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 378
    .local v0, "entity":Ljava/lang/Object;
    invoke-static {p0, v0, p2, p3}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildUpdateSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;Lcom/lidroid/xutils/db/sqlite/WhereBuilder;[Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    :try_end_37
    .catchall {:try_start_2c .. :try_end_37} :catchall_38

    goto :goto_1f

    .line 382
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_38
    move-exception v1

    .line 383
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 384
    throw v1
.end method

.method public varargs updateAll(Ljava/util/List;[Ljava/lang/String;)V
    .registers 6
    .param p2, "updateColumnNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lidroid/xutils/exception/DbException;
        }
    .end annotation

    .prologue
    .line 358
    .local p1, "entities":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz p1, :cond_17

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_17

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/lidroid/xutils/DbUtils;->tableIsExist(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 370
    :cond_17
    :goto_17
    return-void

    .line 360
    :cond_18
    :try_start_18
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->beginTransaction()V

    .line 362
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 366
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->setTransactionSuccessful()V
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_38

    .line 368
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    goto :goto_17

    .line 362
    :cond_2c
    :try_start_2c
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 363
    .local v0, "entity":Ljava/lang/Object;
    invoke-static {p0, v0, p2}, Lcom/lidroid/xutils/db/sqlite/SqlInfoBuilder;->buildUpdateSqlInfo(Lcom/lidroid/xutils/DbUtils;Ljava/lang/Object;[Ljava/lang/String;)Lcom/lidroid/xutils/db/sqlite/SqlInfo;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lidroid/xutils/DbUtils;->execNonQuery(Lcom/lidroid/xutils/db/sqlite/SqlInfo;)V
    :try_end_37
    .catchall {:try_start_2c .. :try_end_37} :catchall_38

    goto :goto_1f

    .line 367
    .end local v0    # "entity":Ljava/lang/Object;
    :catchall_38
    move-exception v1

    .line 368
    invoke-direct {p0}, Lcom/lidroid/xutils/DbUtils;->endTransaction()V

    .line 369
    throw v1
.end method
