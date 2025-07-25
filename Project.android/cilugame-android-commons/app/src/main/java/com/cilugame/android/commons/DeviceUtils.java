package com.cilugame.android.commons;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.UUID;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PermissionGroupInfo;
import android.content.pm.PermissionInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings;
import android.provider.Settings.SettingNotFoundException;
import android.telephony.PhoneStateListener;
import android.telephony.SignalStrength;
import android.telephony.TelephonyManager;
import android.util.Log;

import com.cilugame.h1.UnityCallbackWrapper;
import com.cilugame.h1.UnityPlayerActivity;
import com.cilugame.h1.input.UnityEditTextStyle;
import com.cilugame.h1.util.Logger;
import com.unity3d.player.UnityPlayer;

/**
 * @author Tony
 * 
 */
public final class DeviceUtils {
	
	public static final String STORE_DIR_NAME = "com.cilugame";

	public static final String NETWORK_TYPE_NONE = "NONE";

	public static final String NETWORK_TYPE_UNKNOWN = "UNKNOWN";

	public static final String NETWORK_TYPE_WIFI = "WIFI";

	public static final String NETWORK_TYPE_2G = "2G";

	public static final String NETWORK_TYPE_3G = "3G";

	public static final String NETWORK_TYPE_4G = "4G";

	public static long totalMemory;

	private static Activity activity = null;

	/**
	 * 电源电量 100-0
	 * 需要权限: <uses-permission android:name="android.permission.BATTERY_STATS" />
	 * @return
	 */
    private static BroadcastReceiver batteryChangedReceiver = null;

    public static void RegisterPower()
    {
        if(batteryChangedReceiver == null)
        {
            batteryChangedReceiver = new BroadcastReceiver()
            {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (Intent.ACTION_BATTERY_CHANGED.equals(intent.getAction()))
                    {
                        int level = intent.getIntExtra("level", 0);
                        int scale = intent.getIntExtra("scale", 100);
                        int power = level * 100 / scale;
                        int status = intent.getIntExtra("status", BatteryManager.BATTERY_STATUS_UNKNOWN);
                        Logger.Log("电池状态：" + status);
                        Logger.Log("电池电量：" + power);
                        int value = status * 1000 + power;
                        UnityCallbackWrapper.SendToUnity("OnPower", Integer.toString(value));
                    }else if(ConnectivityManager.CONNECTIVITY_ACTION.equals(intent.getAction())) {
                        UnityCallbackWrapper.SendToUnity("OnNetworkChange", ConnectivityManager.CONNECTIVITY_ACTION);
                    }
                }
            };

            IntentFilter mFilter = new IntentFilter();
            mFilter.addAction(Intent.ACTION_BATTERY_CHANGED);
            mFilter.addAction(ConnectivityManager.CONNECTIVITY_ACTION);
            getActivity().registerReceiver(batteryChangedReceiver, mFilter);
        }
    }

    public static void UnregisterPower()
    {
        try {
            if(batteryChangedReceiver != null)
            {
                getActivity().unregisterReceiver(batteryChangedReceiver);
                batteryChangedReceiver = null;
            }
        } catch (IllegalArgumentException e) {
            if (e.getMessage().contains("Receiver not registered")) {
                // Ignore this exception. This is exactly what is desired
            } else {
                // unexpected, re-throw
                throw e;
            }
        }
    }
	
	/**
	 * <pre>
	 * 获取网络类型
	 * 无网络: NONE
	 * 未知类型: UNKNOWN
	 * WIFI: WIFI
	 * 2G: 2G
	 * 3G: 3G
	 * 4G: 4G
	 * </pre>
	 * @return 网络类型标识
	 */
	public static String getNetworkType() {
		ConnectivityManager cm = (ConnectivityManager) getActivity().getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo info = cm.getActiveNetworkInfo();
		String strType = null;
		int type = 0;
		int subType = 0;
		if (null == info || !info.isConnected()) {
			strType = NETWORK_TYPE_NONE;
		} else {
			type = info.getType();
			if (type == ConnectivityManager.TYPE_WIFI) {
				return NETWORK_TYPE_WIFI;
			} else if (type == ConnectivityManager.TYPE_MOBILE) {
				subType = info.getSubtype();
				switch (subType) {
				// ~ 50-100 kbps
				case TelephonyManager.NETWORK_TYPE_1xRTT:
					// ~ 100 kbps
				case TelephonyManager.NETWORK_TYPE_GPRS:
					strType =  NETWORK_TYPE_2G;
					break;
					// ~ 14-64 kbps
				case TelephonyManager.NETWORK_TYPE_CDMA:
					// ~ 50-100 kbps
				case TelephonyManager.NETWORK_TYPE_EDGE:
					// ~ 400-1000 kbps
				case TelephonyManager.NETWORK_TYPE_EVDO_0:
					// ~ 600-1400 kbps
				case TelephonyManager.NETWORK_TYPE_EVDO_A:
					// ~ 2-14 Mbps
				case TelephonyManager.NETWORK_TYPE_HSDPA:
					// ~ 700-1700 kbps
				case TelephonyManager.NETWORK_TYPE_HSPA:
					// ~ 1-23 Mbps
				case TelephonyManager.NETWORK_TYPE_HSUPA:
					// ~ 400-7000 kbps
				case TelephonyManager.NETWORK_TYPE_UMTS:
					strType =  NETWORK_TYPE_3G;
					break;
					/*
					 * Above API level 7, make sure to set android:targetSdkVersion
					 * to appropriate level to use these
					 */
				case TelephonyManager.NETWORK_TYPE_EHRPD: // API level 11
					strType =  NETWORK_TYPE_3G; // ~ 1-2 Mbps
					break;
				case TelephonyManager.NETWORK_TYPE_EVDO_B: // API level 9
					strType =  NETWORK_TYPE_3G; // ~ 5 Mbps
					break;
				case TelephonyManager.NETWORK_TYPE_HSPAP: // API level 13
					strType =  NETWORK_TYPE_3G; // ~ 10-20 Mbps
					break;
				case TelephonyManager.NETWORK_TYPE_IDEN: // API level 8
					strType =  NETWORK_TYPE_2G; // ~25 kbps
					break;
					
				case TelephonyManager.NETWORK_TYPE_LTE: // API level 11
					strType = NETWORK_TYPE_4G; // ~ 10+ Mbps
					break;
					// Unknown
				case TelephonyManager.NETWORK_TYPE_UNKNOWN:
				default:
					strType =  NETWORK_TYPE_UNKNOWN;
					break;
				}
			} else {
				strType =  NETWORK_TYPE_UNKNOWN;
			}
		}
		Logger.Log( "get type: " + type + ", subType:" + subType + " return: " + strType);
		return strType;
	}

	/**
	 * 移动网络(2G/3G/4G) 信号 
	 * 需要权限: <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
	 * @return
	 */
	private static class MyPhoneStateListener extends PhoneStateListener
	{
		public void onSignalStrengthsChanged(SignalStrength signalStrength)  
		{
			super.onSignalStrengthsChanged(signalStrength);
			UnityCallbackWrapper.SendToUnity("OnGsmSignalStrength", Integer.toString(signalStrength.getGsmSignalStrength()));
		}
	}

	private static TelephonyManager telephonyManager = null;
	private static MyPhoneStateListener myPhoneStateListener = null;
	
	public static void RegisterGsmSignalStrength()
	{
		if(myPhoneStateListener == null)
		{
			myPhoneStateListener = new MyPhoneStateListener();
			telephonyManager = (TelephonyManager)getActivity().getSystemService(Context.TELEPHONY_SERVICE);
			telephonyManager.listen(myPhoneStateListener, PhoneStateListener.LISTEN_SIGNAL_STRENGTHS);
		}
	}
	
	public static void UnregisterGsmSignalStrength()
	{
		if(myPhoneStateListener == null)
		{
			telephonyManager.listen(myPhoneStateListener, PhoneStateListener.LISTEN_NONE);
			
			telephonyManager = null;
			myPhoneStateListener = null;
		}
	}
	
	/**
	 * wifi 信号 100-0
	 * 需要权限: <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
	 * @return
	 */
	public static int getWifiSignal(){
		try {
			WifiManager wifiMg = (WifiManager)getActivity().getSystemService(Context.WIFI_SERVICE);  
	        WifiInfo wifiInfo = wifiMg.getConnectionInfo();  
	        int nWSig = WifiManager.calculateSignalLevel(wifiInfo.getRssi(), 100);  
	        Logger.Log( "new SSID : " + wifiInfo.getSSID() + "   signal strength : "+wifiInfo.getRssi() + "   强度:" + nWSig); 
	        return nWSig;
		}catch (Exception e) {
			 return 0;
		}
	}
	
	/**
	 * 获得可用内存大小(KB)
	 * 
	 * @return
	 */
	public static long getFreeMemory() {
		if (null != getActivity()) {
			Logger.Log( "read free memory from MemoryInfo api");
			final ActivityManager activityManager = (ActivityManager) activity
					.getSystemService(Context.ACTIVITY_SERVICE);
			ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
			activityManager.getMemoryInfo(info);

			long freeMemory = info.availMem / 1024;
			Logger.Log( "finish read free memory from MemoryInfo " + freeMemory);
			return freeMemory;
		}
		Logger.Log( "read free memory from /proc/meminfo");
		RandomAccessFile reader = null;
		long freeMemory = 0;
		try {
			reader = new RandomAccessFile("/proc/meminfo", "r");
			String line1 = reader.readLine();
			Logger.Log( "line1: " + line1);
			String strMemFree = reader.readLine();
			if (null != strMemFree) {
				String[] data = strMemFree.split("\\s+");
				if (data.length > 2) {
					try {
						Logger.Log( "src: " + strMemFree);
						freeMemory = Long.valueOf(data[1]);
					} catch (Exception e) {
					}
				}
			}
		} catch (Exception e) {
			Logger.Error("read /proc/meminfo", e);
		} finally {
			if (null != reader) {
				try {
					reader.close();
				} catch (Exception e) {
				}
			}
		}
		Logger.Log( "finish read /proc/meminfo " + freeMemory);
		return freeMemory;
	}

	/**
	 * 获得总内存大小(KB)
	 * 
	 * @return
	 */
	public static long getTotalMemory() {
		checkAndGetMemoryInfo();
		return totalMemory;
	}
	
	/**
	 * 判断是否带sdcard
	 * @return
	 */
	public static boolean hasExternalStorage() {
		String state = Environment.getExternalStorageState();
		if (Environment.MEDIA_MOUNTED.equals(state) ||
				Environment.MEDIA_MOUNTED_READ_ONLY.equals(state)) {
			return true;
		}
		return false;
	}
	
	/**
	 * sdcard是否可读写
	 * @return
	 */
	public static boolean externalStorageAvailable() {
		String state = Environment.getExternalStorageState();
		if (Environment.MEDIA_MOUNTED.equals(state)) {
			return true;
		}
		return false;
	}

	/**
	 * 获得扩展储存可用容量(KB)
	 * 
	 * @return
	 */
	public static long getExternalStorageAvailable() {
		long kbAvailable = 0;
		String state = Environment.getExternalStorageState();
		boolean statAvailable = false;
		if (Environment.MEDIA_MOUNTED.equals(state)) {
			statAvailable = true;
		} else if (Environment.MEDIA_MOUNTED_READ_ONLY.equals(state)) {
			statAvailable = true;
		}
		File dir = null;
		if (statAvailable) {
			dir = Environment.getExternalStorageDirectory();
			Logger.Log( "get size from path " + dir);
		} else {
			dir = Environment.getDataDirectory();
			Logger.Log( "get size from path " + dir);
		}
		StatFs statFs = new StatFs(dir.getPath());
		kbAvailable = (long) statFs.getAvailableBlocks() * (long) statFs.getBlockSize() / 1024;
		Logger.Log( "storage " + kbAvailable);
		return kbAvailable;
	}

	public static String GetInternalPersistencePath() {
    	return GetInternalPersistencePathWithContext(com.unity3d.player.UnityPlayer.currentActivity);
  }

	public static String GetInternalPersistencePathWithContext(Context ctx ) {

		if (ctx == null) {
			Log.e("Unity", "java GetInternalPersistencePath: ctx is null, return empty string");
			return "";
		}

		String s = ctx.getFilesDir().getAbsolutePath();
		Log.i("Unity", "java GetInternalPersistencePath: return " + s);
		return s;
	}
  
  public static String GetExternalPersistencePath() {
        return GetExternalPersistencePathWithContext(com.unity3d.player.UnityPlayer.currentActivity);
    }

	public static String GetExternalPersistencePathWithContext(Context ctx) {
		if (ctx == null) {
			Log.e("Unity", "java GetExternalPersistencePath: ctx is null, return empty string");
			return "";
		}
		String sdState = Environment.getExternalStorageState();

		if (sdState == null ||
				! sdState.equals(Environment.MEDIA_MOUNTED))
		{
			// 没有挂在SD卡
			//return GetInternalPersistencePath();
			String s = ctx.getFilesDir().getAbsolutePath();
			Log.i("Unity", "java GetExternalPersistencePath: no sd card, return " + s);
			return s;
		}

		File f = ctx.getExternalFilesDir(null);
		// 在某些机器上，即使SD卡已经挂载，仍然会出现获取不到外部路径的问题，所以这里需要增加一个判断
		if (f != null)
		{
			String s = f.getAbsolutePath();;
			Log.i("Unity", "java GetExternalPersistencePath: has sd card (1), return " + s);
			return s;
		}

		// 如果取不到路径，则伪造一个路径
		final String filesDir = "/Android/data/" + ctx.getPackageName() + "/files";
		String s = Environment.getExternalStorageDirectory().getAbsolutePath() + filesDir;
		Log.w("Unity", "java GetExternalPersistencePath: has sd card (2), return " + s);

		return s;
	}
	/**
     * 获取本机网卡Mac地址
     * @return
     */
    public static String getLocalMacAddress() {
        WifiManager wifi = (WifiManager) getActivity().getSystemService(Context.WIFI_SERVICE);
        WifiInfo info = wifi.getConnectionInfo();
        return info.getMacAddress();
    }
    
    /**
     * 获取手机号码
     * @return
     */
    public static String getLocalPhoneNumber() {
    	TelephonyManager tm = (TelephonyManager) getActivity().getSystemService(Context.TELEPHONY_SERVICE);
    	String phoneId = tm.getLine1Number();
    	return phoneId;
    }
    
	/**
     * 取sdcard容量与本机容量, 返回字符串(sdcard容量|手机容量)
     * @return
     */
    public static String getStorageInfos() {
		String state = Environment.getExternalStorageState();
		boolean statAvailable = false;
		if (Environment.MEDIA_MOUNTED.equals(state)) {
			statAvailable = true;
		} else if (Environment.MEDIA_MOUNTED_READ_ONLY.equals(state)) {
			statAvailable = true;
		}
		File dir = null;
		StringBuilder infos = new StringBuilder(128);
		if (statAvailable) {
			dir = Environment.getExternalStorageDirectory();
			StatFs statFs = new StatFs(dir.getPath());
			long total = getTotalKB(statFs);
			infos.append(total);
			Logger.Log( "get sdcard " + dir.getPath() + ": " + total);
		} else {
			infos.append('0');
		}
		infos.append('|');
		
		dir = Environment.getDataDirectory();
		StatFs statFs = new StatFs(dir.getPath());
		long total = getTotalKB(statFs);
		infos.append(total);
		Logger.Log( "get local " + dir.getPath() + ": " + total);
		Logger.Log( "get sizes sdcard|local " + infos);
		return infos.toString();
	}

	private static long getTotalKB(StatFs statFs) {
		long blockCount = statFs.getBlockCount();
		long blockSize = statFs.getBlockSize();
		long total = blockCount * blockSize / 1024;
		return total;
	}
	

    private static void checkAndGetMemoryInfo() {
		if (totalMemory > 0)
			return;
		Logger.Log( "calling checkAndGetMemoryInfo...");
		RandomAccessFile reader = null;
		try {
			reader = new RandomAccessFile("/proc/meminfo", "r");
			String strMemTotal = reader.readLine();
			if (null != strMemTotal) {
				String[] data = strMemTotal.split("\\s+");
				if (data.length > 2) {
					try {
						totalMemory = Long.valueOf(data[1]);
					} catch (Exception e) {
					}
				}
			}
		} catch (Exception e) {
			Logger.Error("read /proc/meminfo", e);
		} finally {
			if (null != reader) {
				try {
					reader.close();
				} catch (Exception e) {
				}
			}
		}
		Logger.Log( "finish checkAndGetMemoryInfo " + totalMemory);
	}
    
    /**
     * 清除UUID文件
     */
    public static void clearUUID() {
    	File uuidFile = null;
		if ( uuidFile == null || !uuidFile.exists() ) {
			File localDir = getActivity().getDir("uuid", Context.MODE_PRIVATE);
			uuidFile = getUUIDFile(localDir);
		}
		if ( uuidFile != null && uuidFile.exists() ) {
			uuidFile.delete();
		}
		String state = Environment.getExternalStorageState();
		if (Environment.MEDIA_MOUNTED.equals(state)) {
			File exDir = new File(Environment.getExternalStorageDirectory().getPath()+File.separator+STORE_DIR_NAME, "uuid");
			if ( uuidFile == null )
				uuidFile = getUUIDFile(exDir);
		}
		if ( uuidFile != null && uuidFile.exists() ) {
			uuidFile.delete();
		}
    }
    
    /**
     * 取得生成应用的唯一串,返回字符串(新生成标记|UUID)
     * 新生成标记: 1首次生成, 0读取缓存的
     * @return
     */
    public static String getUUID() {
    	
    	// check local dir;
    	// if null check external dir
    	// if null create file in local and external dir
    	// else return uuid;
    	
    	File localDir = null;
    	File exDir = null;
		File uuidFile = null;
		if ( uuidFile == null || !uuidFile.exists() ) {
			localDir = getActivity().getDir("uuid", Context.MODE_PRIVATE);
			uuidFile = getUUIDFile(localDir);
		}
		String state = Environment.getExternalStorageState();
		if (Environment.MEDIA_MOUNTED.equals(state)) {
			exDir = new File(Environment.getExternalStorageDirectory().getPath()+File.separator+STORE_DIR_NAME, "uuid");
			if ( uuidFile == null )
				uuidFile = getUUIDFile(exDir);
		}
		String uuid = UUID.randomUUID().toString();
		if ( uuidFile == null ) {
			uuidFile = createUUIDFile(localDir,exDir,uuid);
			return "1|" + uuidFile.getName().replace(".uuid", "");
		}
		if ( uuidFile == null || !uuidFile.exists() ) {
			return "1|"+uuid;
		}
		return "0|" + uuidFile.getName().replace(".uuid", "");
    }
    
    private static File createUUIDFile(File localDir,File exDir, String uuid) {
    	File uuidFile = createFileAtDir(localDir,uuid);
    	if ( null == uuidFile ) {
    		uuidFile = createFileAtDir(exDir, uuid);
    	} else {
    		createFileAtDir(exDir, uuid);
    	}
		return uuidFile;
	}

	private static File createFileAtDir(File dir,String uuid) {
		if ( null == dir ) return null;
		File uuidFile = null;
		if ( !dir.exists() ) { 
			boolean success = dir.mkdirs();
			if ( !success ) {
				return null;
			}
		}
		uuidFile = new File(dir,uuid+".uuid");
		try {
			uuidFile.createNewFile();
		} catch (IOException e) {
			Logger.Error("create file at "+dir, e);
		}
		return uuidFile;
	}

	private static File getUUIDFile(File dir) {
		File uuidFile = null;
		if ( !dir.exists() ) {
			return null;
		}
		File[] files = dir.listFiles(new FileFilter() {
			@Override
			public boolean accept(File file) {
				if ( file.getName().endsWith(".uuid") ) {
					return true;
				}
				return false;
			}
		});
		if ( files!=null && files.length>0 ) {
			uuidFile = files[0];
		}
		return uuidFile;
	}

	public static void installApk(String apkUrl){
		String fileName = apkUrl;
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.setDataAndType(Uri.fromFile(new File(fileName)), "application/vnd.android.package-archive");
		getActivity().startActivity(intent);
	}
	
	/**
	 * 是否可安装未签名APP
	 * @return
	 * 			0 不可安装
	 * 			1可安装
	 */
	public static int getOptionInstallNonMarketApps() {
		String key = null; 
		if ( Build.VERSION.SDK_INT >= 17 ) {
			key = Settings.Global.INSTALL_NON_MARKET_APPS;
		} else {
			key = Settings.Secure.INSTALL_NON_MARKET_APPS;
		}
		int result = Settings.Secure.getInt(getActivity().getContentResolver(), key, 0);
		return result;
	}
	
	/**
	 * 显示安装未签名app的设置窗口
	 */
	public static void showSettingsInstallNonMarketApps() {
		Intent intent = new Intent();     
		if ( Build.VERSION.SDK_INT >= 14 ) {
			intent.setAction(Settings.ACTION_SECURITY_SETTINGS);
		} else {
			intent.setAction(Settings.ACTION_APPLICATION_SETTINGS);  
		}
		getActivity().startActivity(intent);
	}
	
	/**
	 * Restart this Game
	 */
	public static void RestartGame(int delay){				
		Activity currentActivity =  UnityPlayerActivity.instance;
		String packageName = currentActivity.getPackageName();
		Logger.Log( "RestartGame packageName="+packageName);
		
		Intent intent = currentActivity.getPackageManager().getLaunchIntentForPackage(packageName);
		if (intent != null){
			Logger.Log( "Intent != null");	
		}

//		intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//		Logger.Log( "intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)");
		
		PendingIntent pendIntent = PendingIntent.getActivity(currentActivity, 0, intent, Intent.FLAG_ACTIVITY_CLEAR_TOP);
		AlarmManager manager = (AlarmManager) currentActivity.getSystemService(Context.ALARM_SERVICE);
		manager.set(AlarmManager.RTC, System.currentTimeMillis() + delay, pendIntent);
	
	    currentActivity.finish();
	    android.os.Process.killProcess(android.os.Process.myPid());

		Logger.Log( "baseContext.startActivity(intent)");
		
	}
	
	public static void GetPermisson()
	{
	       try
	       {  
	    	   Activity currentActivity =  getActivity();
	    	   Context context = currentActivity.getBaseContext();
	            PackageManager pm = context.getPackageManager();  
	            PackageInfo pi = pm.getPackageInfo(context.getPackageName(), 0);  
	            // 得到自己的包名  
	            String pkgName = pi.packageName;  
	  
	            PackageInfo pkgInfo = pm.getPackageInfo(pkgName,  PackageManager.GET_PERMISSIONS);//通过包名，返回包信息  
	            String sharedPkgList[] = pkgInfo.requestedPermissions;//得到权限列表  
	  
	            //for (int i = 0; i < sharedPkgList.length; i++) 
	            {  
	            	int i = 0;
	                String permName = "android.permission.RECORD_AUDIO";//sharedPkgList[i];  
	
	                PermissionInfo tmpPermInfo = pm.getPermissionInfo(permName, 0);//通过permName得到该权限的详细信息  
	                PermissionGroupInfo pgi = pm.getPermissionGroupInfo(tmpPermInfo.group, 0);//权限分为不同的群组，通过权限名，我们得到该权限属于什么类型的权限。  
	                
	                Log.e("##ddd", i + "-" + permName + "\n");  
	                Log.e("##ddd", i + "-" + pgi.loadLabel(pm).toString() +" PermissionInfo.flags"+tmpPermInfo.flags + "\n");  
	                Log.e("##ddd", i + "-" + tmpPermInfo.loadLabel(pm).toString()  +" PermissionGroupInfo.flags"+pgi.flags + "\n");  
	                Log.e("##ddd", i + "-" + tmpPermInfo.loadDescription(pm).toString()+ "\n");  
	                //tv.append(mDivider + "\n");  
	            }  
	        } 
	       catch (NameNotFoundException e)
	       {  
	            Log.e("##ddd", "Could'nt retrieve permissions for package");  
	        }  
	}
	
	public static void CheckWriteExternalPermission()
	{

	    String permission = "android.permission.RECORD_AUDIO";
	    Activity currentActivity =  getActivity();
	    Context context = currentActivity.getBaseContext();
	    int res = context.checkCallingOrSelfPermission(permission);
	    Log.e("##ddd", "android.permission.RECORD_AUDIO = " + res +",  is ok:" +(res == PackageManager.PERMISSION_GRANTED)+ "\n");  
	    //return (res == PackageManager.PERMISSION_GRANTED);            
	}
	
    /** 
     * 判断是否开启了自动亮度调节 
     */ 
    public static boolean isAutoBrightness() 
    {  
    	return BrightnessUtil.isAutoBrightness(getActivity());
    }  
    
    /** 
     * 关闭亮度自动调节 
     */ 
    public static void stopAutoBrightness() 
    {  
    	BrightnessUtil.stopAutoBrightness(getActivity());
    }  
   
    /** 
     * 开启亮度自动调节 
     */ 
    public static void startAutoBrightness()
    {  
    	BrightnessUtil.startAutoBrightness(getActivity());
    }  
	/**
	 * 获取当前屏幕亮度
	 */
	 public static int getScreenBrightness()
	 {
		 return BrightnessUtil.getScreenBrightness(getActivity());
	 }
	 
	/**
	 * 设置亮度
	 */
	 public static void setBrightness(final int brightness)
	 {
			final Activity curActivity = getActivity();
			curActivity.runOnUiThread(new Runnable() {
				@Override
				public void run() {
					 BrightnessUtil.setBrightness(curActivity, brightness); 
				}
			});
		 //BrightnessUtil.setBrightness(getActivity(), brightness); 
	 }

	public static Activity getActivity() {
		if (null == activity) {
			setActivity(UnityPlayer.currentActivity);
		}
		return activity;
	}

	public static void setActivity(Activity activity) {
		DeviceUtils.activity = activity;
	}

	public static String GetBundleId(){
		Activity currentActivity =  getActivity();
		Context context = currentActivity.getBaseContext();
		PackageManager pm = context.getPackageManager();
		String bundleId = "";
		try
		{
			PackageInfo pi = pm.getPackageInfo(context.getPackageName(), 0);
			bundleId = pi.packageName;
		}
		catch (NameNotFoundException e)
		{
			Log.e("##ddd", "GetBundleId error");
		}
		Log.d("DeviceUtils", "Call GetBundleId = "+bundleId);
		return bundleId;
	}

  /*
   * 唯一的设备ID：
   * GSM手机的 IMEI 和 CDMA手机的 MEID.
   * Return null if device ID is not available.
   */
	public static String GetDeviceId(){
		Activity currentActivity =  getActivity();
		Context context = currentActivity.getBaseContext();
		TelephonyManager tm  = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
		try
		{
			String deviceId = tm.getDeviceId();
			if(deviceId == null)
				return "";
			return deviceId;
		}
		catch (Exception e)
		{
			Log.e("##ddd", "GetDeviceId error");
		}
		return "";
	}

	public static void SetEditText(String paramString)
	{
		UnityPlayerActivity.instance.GetViewManager().SetEditText(paramString);
	}
	public static void HideEditDialog()
	{
		UnityPlayerActivity.instance.GetViewManager().HideEditDialog();
	}

	public static void ShowEditDialog(String paramString, UnityEditTextStyle paramUnityEditTextStyle)
	{
		UnityPlayerActivity.instance.GetViewManager().ShowEditDialog(paramString, paramUnityEditTextStyle);
	}

    public static void SetClipBoardText(final String text)
    {
        UnityPlayerActivity.instance.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                ClipboardManager cm = (ClipboardManager)UnityPlayerActivity.instance.getSystemService(Context.CLIPBOARD_SERVICE);
                cm.setPrimaryClip(ClipData.newPlainText("CopyText", text));
            }
        });
    }

    public static String GetClipBoardText()
    {
        ClipboardManager cm = (ClipboardManager)UnityPlayerActivity.instance.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData data = cm.getPrimaryClip();

        if(data != null)
        {
            if(data.getItemCount() > 0)
            {
                ClipData.Item item = data.getItemAt(0);
                if(item != null)
                {
                    return item.getText().toString();
                }
            }
        }
        return null;
    }

	public static String GetVersionName(Activity activity)
	{
		Context context = activity.getBaseContext();
        //  获取packagemanager的实例
		PackageManager packageManager = context.getPackageManager();
		String localVersion = "";
		try
		{
			//  getPackageName()是当前类的包名，0代表是获取版本信息
			PackageInfo packageInfo = packageManager.getPackageInfo(context.getPackageName(), 0);
			localVersion = packageInfo.versionName;
		}
		catch (NameNotFoundException e)
		{
			Log.e("DeviceUtils", "GetVersionName error");
		}
		Log.d("DeviceUtils", "Call GetVersionName = " + localVersion);
        return localVersion;
	}

	public static String getDeviceName(){
		return Build.MODEL;
	}
}