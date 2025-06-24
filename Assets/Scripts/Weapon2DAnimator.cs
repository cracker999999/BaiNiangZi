using UnityEngine;
using UnityEngine.Serialization;

[RequireComponent(typeof(SpriteRenderer))]
[RequireComponent(typeof(WasImage))]
public class Weapon2DAnimator : Animator2D
{

    [FormerlySerializedAs("playerId")]
    public float ID;
    public int 武器等级;
    public float 武器高度;
    public float 站立动画高度;
    public float 行走动画高度;
    public float 待战动画高度;
    public float 攻击动画高度;
    public float 施法动画高度;
    public float 跑回动画高度;
    public float 跑去动画高度;
    public float 防御动画高度;
    public float 挨打动画高度;
    public float 倒地动画高度;

    private string frameName;
    private int frameCount = 4;
    private Player2DAnimator player2D;
    public SpriteRenderer render;

    private void Awake()
    {
        gameObject.layer = 11;
        transform.parent.gameObject.layer = 11;
    }

    private void OnEnable()
    {
        render = GetComponent<SpriteRenderer>();
        render.transform.localScale = Vector2.one;
        
        wasImage = gameObject.GetComponent<WasImage>();
        if (!wasImage)
            wasImage = gameObject.AddComponent<WasImage>();
        
    }

    public void SetHeight(float height)
    {
        if (transform.parent.parent.parent)
        {
            transform.parent.parent.parent.name = null;
            player2D = transform.parent.parent.parent.parent.GetComponentInChildren<Player2DAnimator>();
            if (player2D == null)
            {
                //这里不同角色的目录结构可能不一样，导致无法通过多个parent获取。
                //不改变原来逻辑的情况下，获取不到，直接通过parent获取
                player2D = transform.parent.parent.parent.parent.parent.GetComponentInChildren<Player2DAnimator>();
            }
            if (player2D)
            {
                transform.rotation = player2D.transform.rotation;
                transform.position = player2D.transform.position + height * Vector3.up;
            }
        }
    }

    private void Update()
    {
        if (player2D == null && transform.parent.parent.parent)
            player2D = transform.parent.parent.parent.parent.GetComponentInChildren<Player2DAnimator>();

        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;
    }

    //由人物来控制武器的动画
    public void UpdateSprite(int frameIndex, int dir)
    {
        if (frameIndex >= frameCount && frameCount!=0)
            frameIndex %= frameCount;
        
        var index = frameIndex + dir * frameCount;
        play(index);
    }

    public void RefreshFrames(string fName, float height)
    {
        if(frameName != fName)
        {
            frameName = fName;
            FindWeapon(height);
        	//SetHeight(height);
        }
}

    /// <summary>
    /// 识别出武器名字
    /// </summary>
    private void FindWeapon(float height)
    {
        if(useWASFile)
        {
            var path = WASFolder + "texture/" + ID + "e/" + 武器等级 + "-" + frameName;
            wasImage.ReadWas(path, (x) => {
                frameCount = x;
                //高度设置和图片刷新要在一起，确保不会有一帧误差 by shanniu
                SetHeight(height);
                wasImage.RefreshFrame();
            });
        }
        else
        {
            var path = PNGFolder + "texture/" + ID + "e/" + 武器等级 + "-" + frameName;
            frames = Resources.LoadAll<Sprite>(path);
            frameCount = frames.Length / DirectionCount;
            SetHeight(height);
        }
    }
}
