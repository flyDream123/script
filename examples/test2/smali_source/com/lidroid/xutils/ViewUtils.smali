.class public Lcom/lidroid/xutils/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static inject(Landroid/app/Activity;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 49
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 50
    return-void
.end method

.method public static inject(Landroid/preference/PreferenceActivity;)V
    .registers 2
    .param p0, "preferenceActivity"    # Landroid/preference/PreferenceActivity;

    .prologue
    .line 53
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 54
    return-void
.end method

.method public static inject(Landroid/view/View;)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 45
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p0}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/view/View;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 46
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/app/Activity;)V
    .registers 3
    .param p0, "handler"    # Ljava/lang/Object;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 61
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p1}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 62
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/preference/PreferenceActivity;)V
    .registers 3
    .param p0, "handler"    # Ljava/lang/Object;
    .param p1, "preferenceActivity"    # Landroid/preference/PreferenceActivity;

    .prologue
    .line 69
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p1}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 70
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/preference/PreferenceGroup;)V
    .registers 3
    .param p0, "handler"    # Ljava/lang/Object;
    .param p1, "preferenceGroup"    # Landroid/preference/PreferenceGroup;

    .prologue
    .line 65
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p1}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/preference/PreferenceGroup;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 66
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .param p0, "handler"    # Ljava/lang/Object;
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 57
    new-instance v0, Lcom/lidroid/xutils/view/ViewFinder;

    invoke-direct {v0, p1}, Lcom/lidroid/xutils/view/ViewFinder;-><init>(Landroid/view/View;)V

    invoke-static {p0, v0}, Lcom/lidroid/xutils/ViewUtils;->injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V

    .line 58
    return-void
.end method

.method private static injectObject(Ljava/lang/Object;Lcom/lidroid/xutils/view/ViewFinder;)V
    .registers 36
    .param p0, "handler"    # Ljava/lang/Object;
    .param p1, "finder"    # Lcom/lidroid/xutils/view/ViewFinder;

    .prologue
    .line 75
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    .line 78
    .local v10, "handlerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v28, Lcom/lidroid/xutils/view/annotation/ContentView;

    move-object/from16 v0, v28

    invoke-virtual {v10, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/lidroid/xutils/view/annotation/ContentView;

    .line 79
    .local v6, "contentView":Lcom/lidroid/xutils/view/annotation/ContentView;
    if-eqz v6, :cond_45

    .line 81
    :try_start_10
    const-string v28, "setContentView"

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    sget-object v31, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v31, v29, v30

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v10, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v23

    .line 82
    .local v23, "setContentViewMethod":Ljava/lang/reflect/Method;
    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    invoke-interface {v6}, Lcom/lidroid/xutils/view/annotation/ContentView;->value()I

    move-result v30

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_45} :catch_74

    .line 89
    .end local v23    # "setContentViewMethod":Ljava/lang/reflect/Method;
    :cond_45
    :goto_45
    invoke-virtual {v10}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v9

    .line 90
    .local v9, "fields":[Ljava/lang/reflect/Field;
    if-eqz v9, :cond_5b

    array-length v0, v9

    move/from16 v28, v0

    if-lez v28, :cond_5b

    .line 91
    array-length v0, v9

    move/from16 v29, v0

    const/16 v28, 0x0

    :goto_55
    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_7f

    .line 135
    :cond_5b
    invoke-virtual {v10}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v15

    .line 136
    .local v15, "methods":[Ljava/lang/reflect/Method;
    if-eqz v15, :cond_73

    array-length v0, v15

    move/from16 v28, v0

    if-lez v28, :cond_73

    .line 137
    array-length v0, v15

    move/from16 v31, v0

    const/16 v28, 0x0

    move/from16 v30, v28

    :goto_6d
    move/from16 v0, v30

    move/from16 v1, v31

    if-lt v0, v1, :cond_129

    .line 170
    :cond_73
    return-void

    .line 83
    .end local v9    # "fields":[Ljava/lang/reflect/Field;
    .end local v15    # "methods":[Ljava/lang/reflect/Method;
    :catch_74
    move-exception v7

    .line 84
    .local v7, "e":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_45

    .line 91
    .end local v7    # "e":Ljava/lang/Throwable;
    .restart local v9    # "fields":[Ljava/lang/reflect/Field;
    :cond_7f
    aget-object v8, v9, v28

    .line 92
    .local v8, "field":Ljava/lang/reflect/Field;
    const-class v30, Lcom/lidroid/xutils/view/annotation/ViewInject;

    move-object/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v27

    check-cast v27, Lcom/lidroid/xutils/view/annotation/ViewInject;

    .line 93
    .local v27, "viewInject":Lcom/lidroid/xutils/view/annotation/ViewInject;
    if-eqz v27, :cond_bd

    .line 95
    :try_start_8d
    invoke-interface/range {v27 .. v27}, Lcom/lidroid/xutils/view/annotation/ViewInject;->value()I

    move-result v30

    invoke-interface/range {v27 .. v27}, Lcom/lidroid/xutils/view/annotation/ViewInject;->parentId()I

    move-result v31

    move-object/from16 v0, p1

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lcom/lidroid/xutils/view/ViewFinder;->findViewById(II)Landroid/view/View;

    move-result-object v26

    .line 96
    .local v26, "view":Landroid/view/View;
    if-eqz v26, :cond_af

    .line 97
    const/16 v30, 0x1

    move/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 98
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v8, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_af
    .catch Ljava/lang/Throwable; {:try_start_8d .. :try_end_af} :catch_b2

    .line 91
    .end local v26    # "view":Landroid/view/View;
    :cond_af
    :goto_af
    add-int/lit8 v28, v28, 0x1

    goto :goto_55

    .line 100
    :catch_b2
    move-exception v7

    .line 101
    .restart local v7    # "e":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_af

    .line 104
    .end local v7    # "e":Ljava/lang/Throwable;
    :cond_bd
    const-class v30, Lcom/lidroid/xutils/view/annotation/ResInject;

    move-object/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v22

    check-cast v22, Lcom/lidroid/xutils/view/annotation/ResInject;

    .line 105
    .local v22, "resInject":Lcom/lidroid/xutils/view/annotation/ResInject;
    if-eqz v22, :cond_f5

    .line 108
    :try_start_c9
    invoke-interface/range {v22 .. v22}, Lcom/lidroid/xutils/view/annotation/ResInject;->type()Lcom/lidroid/xutils/view/ResType;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/lidroid/xutils/view/ViewFinder;->getContext()Landroid/content/Context;

    move-result-object v31

    invoke-interface/range {v22 .. v22}, Lcom/lidroid/xutils/view/annotation/ResInject;->id()I

    move-result v32

    .line 107
    invoke-static/range {v30 .. v32}, Lcom/lidroid/xutils/view/ResLoader;->loadRes(Lcom/lidroid/xutils/view/ResType;Landroid/content/Context;I)Ljava/lang/Object;

    move-result-object v21

    .line 109
    .local v21, "res":Ljava/lang/Object;
    if-eqz v21, :cond_af

    .line 110
    const/16 v30, 0x1

    move/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 111
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v8, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_e9
    .catch Ljava/lang/Throwable; {:try_start_c9 .. :try_end_e9} :catch_ea

    goto :goto_af

    .line 113
    .end local v21    # "res":Ljava/lang/Object;
    :catch_ea
    move-exception v7

    .line 114
    .restart local v7    # "e":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_af

    .line 117
    .end local v7    # "e":Ljava/lang/Throwable;
    :cond_f5
    const-class v30, Lcom/lidroid/xutils/view/annotation/PreferenceInject;

    move-object/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v20

    check-cast v20, Lcom/lidroid/xutils/view/annotation/PreferenceInject;

    .line 118
    .local v20, "preferenceInject":Lcom/lidroid/xutils/view/annotation/PreferenceInject;
    if-eqz v20, :cond_af

    .line 120
    :try_start_101
    invoke-interface/range {v20 .. v20}, Lcom/lidroid/xutils/view/annotation/PreferenceInject;->value()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p1

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/lidroid/xutils/view/ViewFinder;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v19

    .line 121
    .local v19, "preference":Landroid/preference/Preference;
    if-eqz v19, :cond_af

    .line 122
    const/16 v30, 0x1

    move/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 123
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_11d
    .catch Ljava/lang/Throwable; {:try_start_101 .. :try_end_11d} :catch_11e

    goto :goto_af

    .line 125
    .end local v19    # "preference":Landroid/preference/Preference;
    :catch_11e
    move-exception v7

    .line 126
    .restart local v7    # "e":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_af

    .line 137
    .end local v7    # "e":Ljava/lang/Throwable;
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v20    # "preferenceInject":Lcom/lidroid/xutils/view/annotation/PreferenceInject;
    .end local v22    # "resInject":Lcom/lidroid/xutils/view/annotation/ResInject;
    .end local v27    # "viewInject":Lcom/lidroid/xutils/view/annotation/ViewInject;
    .restart local v15    # "methods":[Ljava/lang/reflect/Method;
    :cond_129
    aget-object v14, v15, v30

    .line 138
    .local v14, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v14}, Ljava/lang/reflect/Method;->getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v5

    .line 139
    .local v5, "annotations":[Ljava/lang/annotation/Annotation;
    if-eqz v5, :cond_143

    array-length v0, v5

    move/from16 v28, v0

    if-lez v28, :cond_143

    .line 140
    array-length v0, v5

    move/from16 v32, v0

    const/16 v28, 0x0

    move/from16 v29, v28

    :goto_13d
    move/from16 v0, v29

    move/from16 v1, v32

    if-lt v0, v1, :cond_149

    .line 137
    :cond_143
    add-int/lit8 v28, v30, 0x1

    move/from16 v30, v28

    goto/16 :goto_6d

    .line 140
    :cond_149
    aget-object v4, v5, v29

    .line 141
    .local v4, "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {v4}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v3

    .line 142
    .local v3, "annType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v28, Lcom/lidroid/xutils/view/annotation/event/EventBase;

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v28

    if-eqz v28, :cond_1a5

    .line 143
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v14, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 146
    :try_start_160
    const-string v28, "value"

    const/16 v33, 0x0

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v33, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_171
    .catch Ljava/lang/Throwable; {:try_start_160 .. :try_end_171} :catch_1f0

    move-result-object v24

    .line 147
    .local v24, "valueMethod":Ljava/lang/reflect/Method;
    const/16 v16, 0x0

    .line 149
    .local v16, "parentIdMethod":Ljava/lang/reflect/Method;
    :try_start_174
    const-string v28, "parentId"

    const/16 v33, 0x0

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v33, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v33

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_185
    .catch Ljava/lang/Throwable; {:try_start_174 .. :try_end_185} :catch_1fb

    move-result-object v16

    .line 152
    :goto_186
    const/16 v28, 0x0

    :try_start_188
    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v28

    invoke-virtual {v0, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    .line 153
    .local v25, "values":Ljava/lang/Object;
    if-nez v16, :cond_1aa

    const/16 v17, 0x0

    .line 154
    .local v17, "parentIds":Ljava/lang/Object;
    :goto_19a
    if-nez v17, :cond_1bb

    const/16 v18, 0x0

    .line 155
    .local v18, "parentIdsLen":I
    :goto_19e
    invoke-static/range {v25 .. v25}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v13

    .line 156
    .local v13, "len":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1a3
    if-lt v11, v13, :cond_1c0

    .line 140
    .end local v11    # "i":I
    .end local v13    # "len":I
    .end local v16    # "parentIdMethod":Ljava/lang/reflect/Method;
    .end local v17    # "parentIds":Ljava/lang/Object;
    .end local v18    # "parentIdsLen":I
    .end local v24    # "valueMethod":Ljava/lang/reflect/Method;
    .end local v25    # "values":Ljava/lang/Object;
    :cond_1a5
    :goto_1a5
    add-int/lit8 v28, v29, 0x1

    move/from16 v29, v28

    goto :goto_13d

    .line 153
    .restart local v16    # "parentIdMethod":Ljava/lang/reflect/Method;
    .restart local v24    # "valueMethod":Ljava/lang/reflect/Method;
    .restart local v25    # "values":Ljava/lang/Object;
    :cond_1aa
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v28

    invoke-virtual {v0, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    goto :goto_19a

    .line 154
    .restart local v17    # "parentIds":Ljava/lang/Object;
    :cond_1bb
    invoke-static/range {v17 .. v17}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v18

    goto :goto_19e

    .line 157
    .restart local v11    # "i":I
    .restart local v13    # "len":I
    .restart local v18    # "parentIdsLen":I
    :cond_1c0
    new-instance v12, Lcom/lidroid/xutils/view/ViewInjectInfo;

    invoke-direct {v12}, Lcom/lidroid/xutils/view/ViewInjectInfo;-><init>()V

    .line 158
    .local v12, "info":Lcom/lidroid/xutils/view/ViewInjectInfo;
    move-object/from16 v0, v25

    invoke-static {v0, v11}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v28

    move-object/from16 v0, v28

    iput-object v0, v12, Lcom/lidroid/xutils/view/ViewInjectInfo;->value:Ljava/lang/Object;

    .line 159
    move/from16 v0, v18

    if-le v0, v11, :cond_1ed

    move-object/from16 v0, v17

    invoke-static {v0, v11}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/Integer;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Integer;->intValue()I

    move-result v28

    :goto_1df
    move/from16 v0, v28

    iput v0, v12, Lcom/lidroid/xutils/view/ViewInjectInfo;->parentId:I

    .line 160
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-static {v0, v12, v4, v1, v14}, Lcom/lidroid/xutils/view/EventListenerManager;->addEventMethod(Lcom/lidroid/xutils/view/ViewFinder;Lcom/lidroid/xutils/view/ViewInjectInfo;Ljava/lang/annotation/Annotation;Ljava/lang/Object;Ljava/lang/reflect/Method;)V
    :try_end_1ea
    .catch Ljava/lang/Throwable; {:try_start_188 .. :try_end_1ea} :catch_1f0

    .line 156
    add-int/lit8 v11, v11, 0x1

    goto :goto_1a3

    .line 159
    :cond_1ed
    const/16 v28, 0x0

    goto :goto_1df

    .line 162
    .end local v11    # "i":I
    .end local v12    # "info":Lcom/lidroid/xutils/view/ViewInjectInfo;
    .end local v13    # "len":I
    .end local v16    # "parentIdMethod":Ljava/lang/reflect/Method;
    .end local v17    # "parentIds":Ljava/lang/Object;
    .end local v18    # "parentIdsLen":I
    .end local v24    # "valueMethod":Ljava/lang/reflect/Method;
    .end local v25    # "values":Ljava/lang/Object;
    :catch_1f0
    move-exception v7

    .line 163
    .restart local v7    # "e":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v7}, Lcom/lidroid/xutils/util/LogUtils;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1a5

    .line 150
    .end local v7    # "e":Ljava/lang/Throwable;
    .restart local v16    # "parentIdMethod":Ljava/lang/reflect/Method;
    .restart local v24    # "valueMethod":Ljava/lang/reflect/Method;
    :catch_1fb
    move-exception v28

    goto :goto_186
.end method
