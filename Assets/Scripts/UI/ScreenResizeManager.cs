using System;
using UnityEngine;
using System.Collections.Generic;
using LuaInterface;

public class ScreenResizeManager
{
    private const int ScreenFixedFill = 20;

    private static ScreenResizeManager _instance;

    public static ScreenResizeManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new ScreenResizeManager();
                _instance.Init();
            }
            return _instance;
        }
    }

    public class EdgeInset
    {
        public int Left;
        public int Bottom;
        public int Right;
        public int Top;

        public int Width;
        public int Height;

        public EdgeInset(int left, int bottom, int right, int top, int width, int height)
        {
            Left = left;
            Bottom = bottom;
            Right = right;
            Top = top;
            Width = width;
            Height = height;
        }
    }

    public class Rect
    {
        public float X;
        public float Y;
        public float Width;
        public float Height;

        public float Left;
        public float Bottom;
        public float Right;
        public float Top;
        public float ScreenWidth;
        public float ScreenHeight;

        public Rect()
        {
        }

        public Rect(float x, float y, float width, float height, float left, float bottom, float right, float top, float screenWidth, float screenHeight)
        {
            X = x;
            Y = y;
            Width = width;
            Height = height;
            Left = left;
            Bottom = bottom;
            Right = right;
            Top = top;
            ScreenWidth = screenWidth;
            ScreenHeight = screenHeight;
        }

        public Rect Flip()
        {
            return new Rect(-X, -Y, Width, Height, Right, Top, Left, Bottom, ScreenWidth, ScreenHeight);
        }
    }

    public enum PhoneState
    {
        None,
        Default,
        iPhone_2436,//x xs 11Pro
        iPhone_1792,//xr 11
        iPhone_2688,//11ProMax
        iPhone_2340,
        iPhone_2532,//12 12Pro
        iPhone_2778//
    }

    private const string ScreenResizeManagerUpdate = "ScreenResizeManagerUpdate";

    private PhoneState _curPhoneState = PhoneState.None;
    private Dictionary<PhoneState, EdgeInset> _phoneEdgeInsetDict;
    private Rect _leftRect;
    private Rect _rightRect;
    private ScreenOrientation _curOrientation = ScreenOrientation.Unknown;

	public event Action OnOrientationChanged;
	public LuaFunction luaOnOrientationChanged;
	
	private void Init()
    {
        _phoneEdgeInsetDict = new Dictionary<PhoneState, EdgeInset>()
        {
            {PhoneState.iPhone_2436, new EdgeInset(110, 0, 0, 0, 2436, 1125) },//2.16
            {PhoneState.iPhone_1792, new EdgeInset(82, 0, 0, 0, 1792, 828) },//2.16
            {PhoneState.iPhone_2688, new EdgeInset(122, 0, 0, 0, 2688, 1242) },//2.16
            {PhoneState.iPhone_2340, new EdgeInset(105, 0, 0, 0, 2340, 1080) },//2.16
            {PhoneState.iPhone_2532, new EdgeInset(115, 0, 0, 0, 2532, 1170) },//2.16
            {PhoneState.iPhone_2778, new EdgeInset(125, 0, 0, 0, 2778, 1284) },//2.16
        };

        _curPhoneState = GetCurPhone();
        UpdateOrientation();
        _leftRect = CalculateNGUIRect();

        _rightRect = _leftRect != null ? _leftRect.Flip() : null;

        if (IsNeedResize())
        {
            JSTimer.Instance.SetupTimer(ScreenResizeManagerUpdate, UpdateOrientation);
        }
	}
	
	public void SetOnOrientationChangedCallback(LuaFunction func)
	{
		if (luaOnOrientationChanged != null)
		{
			luaOnOrientationChanged.Dispose();
		}
		luaOnOrientationChanged = func;
	}
	
	private string GetDeviceModel()
	{
		if (Application.isEditor && IsEditorOrientation())
        {
            switch (GetPhoneState())
            {
                case PhoneState.iPhone_2436:
                    return "iPhone10,3";
            }
        }

        return SystemInfo.deviceModel;
    }

    private PhoneState GetCurPhone()
    {
        var deviceModel = GetDeviceModel();

        if (deviceModel.Contains("iPhone10,3") || deviceModel.Contains("iPhone10,6") || 
            deviceModel.Contains("iPhone11,2") || deviceModel.Contains("iPhone12,3"))
        {
            return PhoneState.iPhone_2436;
        }

        if(deviceModel.Contains("iPhone11,8") || deviceModel.Contains("iPhone12,1"))
        {
            return PhoneState.iPhone_1792;
        }

        if(deviceModel.Contains("iPhone11,4") || deviceModel.Contains("iPhone11,6") || deviceModel.Contains("iPhone12,5"))
        {
            return PhoneState.iPhone_2688;
        }

        if(deviceModel.Contains("iPhone13,1") || deviceModel.Contains("iPhone14,4"))
        {
            return PhoneState.iPhone_2340;
        }

        if(deviceModel.Contains("iPhone13,2") || deviceModel.Contains("iPhone13,3") || 
           deviceModel.Contains("iPhone14,5") || deviceModel.Contains("iPhone14,2"))
        {
            return PhoneState.iPhone_2532;
        }

        if(deviceModel.Contains("iPhone13,4") || deviceModel.Contains("iPhone14,3"))
        {
            return PhoneState.iPhone_2778;
        }

        return PhoneState.Default;
    }

    private EdgeInset GetPhoneEdgeInset()
    {
        EdgeInset _edgeInset = null;
        _phoneEdgeInsetDict.TryGetValue(_curPhoneState, out _edgeInset);

        return _edgeInset;
    }

    private Rect CalculateNGUIRect()
    {
        var edgeInset = GetPhoneEdgeInset();
        if (edgeInset == null)
        {
            return null;
        }

        // 这里偷懒处理
        //var root = LayerManager.Root.UIModuleRoot.GetComponentInParent<UIRoot>();
		var root = UnityEngine.GameObject.Find("GameRoot/UIRoot").GetComponentInParent<UIRoot>();
        var pixelSizeAdjustment = root.pixelSizeAdjustment;
        var screen = NGUITools.screenSize;
        var widthScale = 1f;
        var heightScale = 1f;
#if UNITY_EDITOR
        widthScale = screen.x/edgeInset.Width;
        heightScale = screen.y/edgeInset.Height;
#endif
        var width = screen.x - (edgeInset.Left - edgeInset.Right) * widthScale;
        var height = screen.y - (edgeInset.Top - edgeInset.Bottom) * heightScale;
        var rect = new Rect
        {
            Width = width*pixelSizeAdjustment,
            Height = height*pixelSizeAdjustment,
            X = (edgeInset.Left - edgeInset.Right)*pixelSizeAdjustment/2 * widthScale,
            Y = (edgeInset.Bottom - edgeInset.Top)*pixelSizeAdjustment/2 * heightScale,
            Left = edgeInset.Left * pixelSizeAdjustment * widthScale,
            Bottom = edgeInset.Bottom * pixelSizeAdjustment * heightScale,
            Right = edgeInset.Right * pixelSizeAdjustment * widthScale,
            Top = edgeInset.Top * pixelSizeAdjustment * heightScale,
            ScreenWidth = edgeInset.Width * pixelSizeAdjustment * widthScale,
            ScreenHeight = edgeInset.Height * pixelSizeAdjustment * heightScale,
        };

        return rect;
    }

    private ScreenOrientation GetScreenOrientationRuntime()
    {
        if (Application.isEditor)
        {
            return GetScreenOrientation();
        }

        var orientation = Screen.orientation;
        if (orientation != ScreenOrientation.Landscape && orientation != ScreenOrientation.LandscapeRight &&
            orientation != ScreenOrientation.LandscapeLeft)
        {
            switch (Input.deviceOrientation)
            {
                case DeviceOrientation.LandscapeRight:
                    {
                        orientation = ScreenOrientation.LandscapeRight;
                        break;
                    }
                default:
                    {
                        orientation = ScreenOrientation.Landscape;
                        break;
                    }
            }
        }
        return orientation;
    }

    private void UpdateOrientation()
    {
        var lastOrientation = _curOrientation;
        _curOrientation = GetScreenOrientationRuntime();

        if (lastOrientation != _curOrientation && lastOrientation != ScreenOrientation.Unknown)
        {
            OrientationChanging();
        }
    }

    private void OrientationChanging()
    {
        if (OnOrientationChanged != null)
        {
            OnOrientationChanged();
        }
		if (luaOnOrientationChanged != null)
		{
			luaOnOrientationChanged.BeginPCall();
			luaOnOrientationChanged.Push();
			luaOnOrientationChanged.PCall();
			luaOnOrientationChanged.EndPCall();
		}
	}
	
	public Rect GetRect()
	{
		if (_rightRect == null || _leftRect == null)
        {
            return null;
        }

        if (_curOrientation == ScreenOrientation.LandscapeRight)
        {
            return _rightRect;
        }
        else
        {
            return _leftRect;
        }
    }


    public bool  IsOrientationRight()
    {
        return _curOrientation == ScreenOrientation.LandscapeRight;
    }

    public bool IsNeedResize()
    {
        return GetRect() != null;
    }

    /// <summary>
    /// 修改根Panel，并且对所有子节点 Rect UpdateAnchor
    /// </summary>
    /// <param name="go"></param>
    public void ResizePanel(GameObject go, bool clip = false)
    {
        if (IsNeedResize())
        {
            var rect = GetRect();
            var panel = go.GetComponentInChildren<UIPanel>();
            if (panel != null)
            {
                panel.clipping = clip ? UIDrawCall.Clipping.SoftClip : UIDrawCall.Clipping.ConstrainButDontClip;
                panel.SetRect(rect.X, rect.Y, rect.Width, rect.Height);

                var rects = go.GetComponentsInChildren<UIRect>(true);
                var count = rects.Length;
                for (int i = 0; i < count; i++)
                {
                    rects[i].UpdateAnchors();
                }
            }
        }
    }

    public void ForceScreenSize(UIWidget widget)
    {
        ScreenFilling(widget, 0);
    }

    public void ScreenFilling(UIWidget widget, int fill = ScreenFixedFill)
    {
        if (IsNeedResize() && widget != null)
        {
            var rect = GetRect();
            var pivotOffset = widget.pivotOffset;
            var width = rect.ScreenWidth + fill;
            var height = rect.ScreenHeight + fill;
            widget.SetRect(-width * pivotOffset.x, -height * pivotOffset.y, width, height);
        }
    }

    #region 辅助测试用
    private const string ScreenOrientationKey = "ScreenOrientationKey";
    private const string PhoneStateKey = "PhoneStateKey";

    private static bool IsEditorOrientation()
    {
        var orientation = GetScreenOrientation();
        return orientation == ScreenOrientation.Landscape || orientation == ScreenOrientation.LandscapeRight || orientation == ScreenOrientation.LandscapeLeft;
    }

    public static ScreenOrientation GetScreenOrientation()
    {
        if (PlayerPrefs.HasKey(ScreenOrientationKey))
        {
            return (ScreenOrientation)PlayerPrefs.GetInt(ScreenOrientationKey);
        }

        return ScreenOrientation.Unknown;
    }

    public static PhoneState GetPhoneState()
    {
        if (PlayerPrefs.HasKey(PhoneStateKey))
        {
            return (PhoneState)PlayerPrefs.GetInt(PhoneStateKey);
        }

        return PhoneState.Default;
    }

    public static void SetScreenOrientation(ScreenOrientation orientation)
    {
        PlayerPrefs.SetInt(ScreenOrientationKey, (int)orientation);
    }

    public static void SetPhoneState(PhoneState state)
    {
        PlayerPrefs.SetInt(PhoneStateKey, (int)state);
    }
    #endregion
}
