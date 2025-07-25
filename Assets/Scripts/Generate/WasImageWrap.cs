﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class WasImageWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(WasImage), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("ReadWas", ReadWas);
		L.RegFunction("SetFrame", SetFrame);
		//L.RegFunction("GetBitMap", GetBitMap);
		L.RegFunction("setColor", setColor);
		L.RegFunction("clean", clean);
		L.RegVar("test", get_test, set_test);
		L.RegVar("texture", get_texture, set_texture);
		L.RegVar("DirectionCount", get_y, set_y);
		L.RegVar("FramePerDirection", get_x, set_x);
		L.RegVar("timeDelta", get_timeDelta, set_timeDelta);
		L.RegVar("obj", get_obj, set_obj);
		L.RegVar("wasPath", get_wasPath, set_wasPath);
		L.RegVar("currFrame", get_col, set_col);
		L.RegVar("currDirection", get_direction, set_direction);
		L.RegVar("colors", get_colors, set_colors);
		L.RegVar("Length", get_Length, null);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ReadWas(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			WasImage obj = (WasImage)ToLua.CheckObject(L, 1, typeof(WasImage));
			string arg0 = ToLua.CheckString(L, 2);
			System.Action<int> arg1 = null;
			LuaTypes funcType3 = LuaDLL.lua_type(L, 3);

			if (funcType3 != LuaTypes.LUA_TFUNCTION)
			{
				 arg1 = (System.Action<int>)ToLua.CheckObject(L, 3, typeof(System.Action<int>));
			}
			else
			{
				LuaFunction func = ToLua.ToLuaFunction(L, 3);
				arg1 = DelegateFactory.CreateDelegate(typeof(System.Action<int>), func) as System.Action<int>;
			}

			obj.ReadWas(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int SetFrame(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			WasImage obj = (WasImage)ToLua.CheckObject(L, 1, typeof(WasImage));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.SetFrame(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

//	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
//	static int GetBitMap(IntPtr L)
//	{
//		try
//		{
//			ToLua.CheckArgsCount(L, 2);
//			WasImage obj = (WasImage)ToLua.CheckObject(L, 1, typeof(WasImage));
//			System.Drawing.Bitmap arg0 = (System.Drawing.Bitmap)ToLua.CheckObject(L, 2, typeof(System.Drawing.Bitmap));
//			byte[] o = obj.GetBitMap(arg0);
//			ToLua.Push(L, o);
//			return 1;
//		}
//		catch(Exception e)
//		{
//			return LuaDLL.toluaL_exception(L, e);
//		}
//	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int setColor(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			WasImage obj = (WasImage)ToLua.CheckObject(L, 1, typeof(WasImage));
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			UnityEngine.Color[] arg1 = ToLua.CheckObjectArray<UnityEngine.Color>(L, 3);
			obj.setColor(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int clean(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 1);
			WasImage obj = (WasImage)ToLua.CheckObject(L, 1, typeof(WasImage));
			obj.clean();
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_test(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			bool ret = obj.test;
			LuaDLL.lua_pushboolean(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index test on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_texture(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			UnityEngine.Texture2D ret = obj.texture;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index texture on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_y(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int ret = obj.DirectionCount;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index y on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_x(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int ret = obj.FramePerDirection;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index x on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_timeDelta(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			float ret = obj.timeDelta;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index timeDelta on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_obj(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			WASWAS.WAS ret = obj.obj;
			ToLua.PushObject(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index obj on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_wasPath(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			string ret = obj.wasPath;
			LuaDLL.lua_pushstring(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index wasPath on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_col(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			float ret = obj.currFrame;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index col on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_direction(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int ret = obj.currDirection;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index direction on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_colors(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			UnityEngine.Color[] ret = obj.colors;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index colors on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_Length(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int ret = obj.Length;
			LuaDLL.lua_pushinteger(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index Length on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_test(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			bool arg0 = LuaDLL.luaL_checkboolean(L, 2);
			obj.test = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index test on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_texture(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			UnityEngine.Texture2D arg0 = (UnityEngine.Texture2D)ToLua.CheckUnityObject(L, 2, typeof(UnityEngine.Texture2D));
			obj.texture = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index texture on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_y(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.DirectionCount = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index y on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_x(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.FramePerDirection = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index x on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_timeDelta(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.timeDelta = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index timeDelta on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_obj(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			WASWAS.WAS arg0 = (WASWAS.WAS)ToLua.CheckObject(L, 2, typeof(WASWAS.WAS));
			obj.obj = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index obj on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_wasPath(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			string arg0 = ToLua.CheckString(L, 2);
			obj.wasPath = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index wasPath on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_col(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.currFrame = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index col on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_direction(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			int arg0 = (int)LuaDLL.luaL_checknumber(L, 2);
			obj.currDirection = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index direction on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_colors(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			WasImage obj = (WasImage)o;
			UnityEngine.Color[] arg0 = ToLua.CheckObjectArray<UnityEngine.Color>(L, 2);
			obj.colors = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index colors on a nil value" : e.Message);
		}
	}
}

