.class public Lcom/worklight/androidgap/plugin/WLNetworkListener;
.super Lcom/worklight/androidgap/plugin/WLLocationListener;
.source "WLNetworkListener.java"


# direct methods
.method public constructor <init>(Landroid/location/LocationManager;Lcom/worklight/androidgap/plugin/WLGeolocationPlugin;)V
    .registers 4
    .param p1, "locationManager"    # Landroid/location/LocationManager;
    .param p2, "m"    # Lcom/worklight/androidgap/plugin/WLGeolocationPlugin;

    .prologue
    .line 42
    const-string v0, "network"

    invoke-direct {p0, p1, p2, v0}, Lcom/worklight/androidgap/plugin/WLLocationListener;-><init>(Landroid/location/LocationManager;Lcom/worklight/androidgap/plugin/WLGeolocationPlugin;Ljava/lang/String;)V

    .line 43
    return-void
.end method
