using System;
using System.Collections.Generic;
using System.Diagnostics;
//using System.Drawing;
using UnityEngine;
using Color = UnityEngine.Color;
using Debug = UnityEngine.Debug;

public class poolData
{
    public WASWAS.WAS was;
    //public Bitmap bitmap;
    public Texture2D texture;
    
    
}

[ExecuteInEditMode]
[RequireComponent(typeof(SpriteRenderer))]
public class WasImage : MonoBehaviour
{
    
    
    private static Dictionary<string, poolData> dic = new Dictionary<string, poolData>();
    
    public bool test;
    private SpriteRenderer image;
    public Texture2D texture;
    
    public Dictionary<string, Texture2D> texDict = new Dictionary<string, Texture2D>();

    public void initDict(int direction, int frame)
    {
        if(texture == null) return;
        
    }

    public Texture2D getTex(int direction, int frame)
    {
        if(texDict.ContainsKey(direction+"_"+frame))
        {
            return texDict[direction+"_"+frame];
        }

        return null;
    }
    
    
    public int DirectionCount;//方向 row
    public int FramePerDirection;//col
    
    public int Length
    {
        get
        {
            return FramePerDirection * DirectionCount;
        }
    }


    public float timeDelta = 0.1f;
    private float timer;
    public WASWAS.WAS obj;
    // Start is called before the first frame update

    private int randomId;
    private void Awake()
    {
        System.Random r = new System.Random();
        randomId = r.Next(1, 99999999);
    }

    void OnEnable()
    {
        image = GetComponent<SpriteRenderer>();
    }

    void OnDestroy()
    {

    }

    public string wasPath;
    public void ReadWas(string path, Action<int> onDone)
    {
        //path = "Assets/Resources/" + path + ".was";
        path = Application.streamingAssetsPath + "/" + path + ".was";
        if (path.Equals(wasPath))
        {
            if (onDone != null)
            {
                onDone.Invoke(FramePerDirection);
            }
            return;
        }
            
        wasPath = path;
        getOrRefreshWas(onDone);
    }

    

    private void Update()
    {
        if (!test)
            return;

        timer += Time.deltaTime;
        if (timer < timeDelta)
        {
            return;
        }
        else
        {
            timer = 0;
        }

        currFrame++;
        if (currFrame >= FramePerDirection)
            currFrame = 0;

        //SetFrame();
    }

    [Range(0, 7)]
    public int currDirection;
    public float currFrame;
    
    public void RefreshFrame()
    {
        currFrame = 0;
        SetFrame();
    }

    private void SetFrame()
    {
        // var stopwatch = new Stopwatch();
        // stopwatch.Start();
        
        try
        {
            var pivot = new Vector2(currFrame / FramePerDirection * (float)texture.width, (float)currDirection / DirectionCount * (float)texture.height);
            //image.sprite = Sprite.Create(texture, new Rect(pivot.x, pivot.y, (float) texture.width / FramePerDirection, (float) texture.height / DirectionCount), Vector2.one * 0.5f);

            image.sprite = Sprite.Create(texture, new Rect(pivot.x, pivot.y, (float)texture.width / FramePerDirection, (float)texture.height / DirectionCount),
                Vector2.one * 0.5f, 100F, 0, SpriteMeshType.FullRect);
        }
        catch (Exception e)
        {
            //ingore
        }
        

        // var tex = getTex(currDirection, Convert.ToInt32(currFrame));
        // image.sprite = Sprite.Create(tex, new Rect(0, 0, tex.width, tex.height), Vector2.one * 0.5f);

        // stopwatch.Stop();
        // Debug.Log("time(ms): " + stopwatch.ElapsedMilliseconds);
    }

    private Sprite sprite;

    public void SetFrame(int frame)
    {
        if (texture == null) return;
        if (FramePerDirection == 0)
            return;
        currDirection = DirectionCount - 1 - frame / (FramePerDirection);
        currFrame = (frame) % FramePerDirection;
        SetFrame();
        //refreshColor();
    }


    //    public byte[] GetBitMap(Bitmap bitmap)
    //    {
    //        using (var ms = new System.IO.MemoryStream())
    //        {
    //            //using (Bitmap bitmap = System.Drawing.Image.FromHbitmap(intPtr))
    //            {
    //                //Debug.Log(bitmap.RawFormat);
    //                bitmap.Save(ms, bitmap.RawFormat);
    //                return ms.ToArray();
    //            }
    //        }
    //    }

    private String getDicKey()
    {
        if (wasPath == null || wasPath == "") return "";
        string dicKey = wasPath;
        //string colorStr = "";
        //for (int i = 0; i < colors.Length; i++)
        //{
        //    colorStr += colors[i].r + "-" + colors[i].g + "-" + colors[i].b;
        //}
        //如果是染色数据，则加上自己的id值，避免跟其他相同角色不同染色的角色冲突
        if (isRanseColor()) {
            dicKey += randomId;
        }
        return dicKey;
    }

    private Boolean isRanseColor()
    {
        for (int i = 0; i < colors.Length; i++)
        {
            if (colors[i].r != 0 || colors[i].g != 0 || colors[i].b != 0)
            {
                return true;
            }
        }
        return false;
    }

    private void getOrRefreshWas(Action<int> onDone)
    {
        if (wasPath == null || wasPath == "") return;
        string filePath = wasPath;
        string dicKey = getDicKey();
        if (dic.ContainsKey(dicKey))
        {
            var dt = dic[dicKey];
            if (!dt.was.isSameColor(colors))
            {
                dt.was.setColor(colors);
                dt.was.readRanseBoard();

                //                dt.bitmap.Dispose();
                //                dt.bitmap = dt.was.PutPNG();
                //                dt.texture.LoadImage(GetBitMap(dt.bitmap));
                var tex = dt.was.PutPNG2();
                if (dt.texture != null)
                {
                    dt.texture.Resize(tex.width, tex.height);
                    dt.texture.LoadImage(tex.EncodeToPNG());
                    dt.texture.Apply();
                    UnityEngine.Object.Destroy(tex, 0.1f);
                }
                else
                {
                    dt.texture = tex;
                    dt.texture.Apply();
                }
            }
            texture = dt.texture;
            FramePerDirection = dt.was.Frame;
            DirectionCount = dt.was.Direction;

            if (onDone != null)
            {
                onDone.Invoke(FramePerDirection);
            }
            return;
        }
        
        WASWAS.WAS was0 = new WASWAS.WAS();
        was0.setColor(colors);
        was0.init(filePath, (was) =>
        {
            poolData data = new poolData();
            data.was = was;
            
//            data.bitmap = was.PutPNG();
//            data.texture = new Texture2D(data.bitmap.Width, data.bitmap.Height, TextureFormat.ARGB32, true);
//            data.texture.LoadImage(GetBitMap(data.bitmap));
//            data.texture.Apply();
            
            var tex = was.PutPNG2();
            data.texture = new Texture2D(tex.width, tex.height, TextureFormat.ARGB32, true);
            data.texture.LoadImage(tex.EncodeToPNG());
            data.texture.Apply();
            
            dic[dicKey] = data;

            FramePerDirection = was.Frame;
            DirectionCount = was.Direction;
            texture = data.texture;
            if (onDone != null)
            {
                onDone.Invoke(FramePerDirection);
            }
        });
    }
    
    
    public Color[] colors = new Color[4];
    public void setColor(int partType, Color[] cols)
    {
        //hair = 1,
        //clothes = 2,
        //other = 3,
        //pant = 4,
        //dic.Clear();
        if (partType > colors.Length || partType<1) return;
        colors = cols;
        getOrRefreshWas(null);
    }

    public void clean()
    {
        colors = new Color[4];
    }
}
