package com.cilugame.h1;

import com.cilugame.h1.util.Logger;
import com.unity3d.player.UnityPlayer;

import org.json.JSONObject;

public class UnityCallbackWrapper
{
	private static void SendToUnity(String type, int code, String data)
	{
		try {
			JSONObject jobj = new JSONObject();
			jobj.put("type", type);
			jobj.put("code", code);
			jobj.put("data", data);

			SendToUnity("OnSdkCallback", jobj.toString());
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public static void SendToUnity(String function)
	{
		UnityPlayer.UnitySendMessage("PlatformAPI" ,function, "");
	}

	public static void SendToUnity(String function, String params)
	{
		UnityPlayer.UnitySendMessage("PlatformAPI", function, params);
	}

	public static void OnInit(boolean success)
	{
		SendToUnity("init", success?0:1, "");
	}
	
	public static void OnLoginSuccess(String jsonStr)
	{
		SendToUnity("login", 0, jsonStr);
	}
 
	public static void OnLoginCancel()
	{
		SendToUnity("login", 2, "");
	}
	
	public static void OnLoginFail()
	{
		SendToUnity("login", 3, "");
	}
	
	public static void OnLoginOut(boolean  success )
	{
		SendToUnity("logout", success?0:1, "");
	}	
	
	public static void OnExit(boolean success)
	{
		SendToUnity("exit", success?0:1, "");
	}
	
	public static void OnNoExiterProvide()
	{
		SendToUnity("noExiterProvide", 0, "");
	}
	
	public static void OnPay(int flag)
	{
		SendToUnity("pay", flag, "");
	}

	public static void OnSwitchAccount(boolean  success, String jsonStr)
	{
		SendToUnity("switchAccount", success?0:1, jsonStr);
	}
}