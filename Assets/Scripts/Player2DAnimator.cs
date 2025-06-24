using UnityEngine;
using UnityEngine.Serialization;

[RequireComponent(typeof(SpriteRenderer))]
[RequireComponent(typeof(WasImage))]
public class Player2DAnimator : Animator2D
{
    private float 帧动画每秒帧数 = 10;


    public Vector3[] 翅膀位置 = new Vector3[8]
    {
        Vector3.zero,
        Vector3.zero,
        Vector3.zero,
        Vector3.zero,
        Vector3.zero,
        Vector3.zero,
        Vector3.zero,
        Vector3.zero
    };

    public Vector3[] angles = new Vector3[8]   //面板控制方向
    //private float[] angles = new float[8]    //代码控制方向
    {
         90*Vector3.up,    // 0.右下方
        180*Vector3.up,    // 1.右上方
        -90*Vector3.up,    // 2.左上方
          0*Vector3.up,    // 3.左下方
       -285*Vector3.up,    // 4.右方   
       -180*Vector3.up,    // 5.后方
       -105*Vector3.up,    // 6.左方
         30*Vector3.up     // 7.前方
    };
    [FormerlySerializedAs("ID")]
    public int playerId;
    public float 高度;

    private string frameName;
    public int frameCount;
    public int direction;
    private int frameIndex;
    private bool loop = true;
    private float timer;
    private int[] infoNames;
    
    public int nameHash;
    [HideInInspector]
    public Weapon2DAnimator weapon
    {
        get { return transform.parent.GetComponentInChildren<Weapon2DAnimator>(true); }
    }
    public Ride2DAnimator ride;
    private int index;

    private void Awake()
    {
        wasImage = gameObject.GetComponent<WasImage>();
        if (wasImage == null)
            wasImage = gameObject.AddComponent<WasImage>();

        animator = GetComponentInParent<Animator>();
        if (animator == null)
            animator = transform.parent.gameObject.AddComponent<Animator>();

        gameObject.layer = 11;
        transform.parent.gameObject.layer = 11;
    }

    private void OnEnable()
    {
        animator = GetComponentInParent<Animator>();
        animator.enabled = enabled;
        timer = 1/帧动画每秒帧数;
        player = GetComponent<SpriteRenderer>();
        player.transform.localScale = Vector2.one;
        infoNames = new[]
        {
            Animator.StringToHash ("idleWar"),//0
            Animator.StringToHash ("attack1"),
            Animator.StringToHash ("magic"),
            Animator.StringToHash ("run"),
            Animator.StringToHash ("runWar"),

            Animator.StringToHash ("defend"),//5
            Animator.StringToHash ("hit1"),
            Animator.StringToHash ("hit2"),
            Animator.StringToHash ("die"),
            Animator.StringToHash ("rolecreate1"),

            Animator.StringToHash ("rolecreate2"),//10
            Animator.StringToHash ("rolecreate3"),
            Animator.StringToHash ("rolecreate4"),
            Animator.StringToHash ("rolecreate5"),
            Animator.StringToHash ("idleCity"),

            Animator.StringToHash ("attack1"),//15
            Animator.StringToHash ("runBack"),
            Animator.StringToHash ("idleRide"),
            Animator.StringToHash ("runRide"),
        };
    }

    private bool InWar()
    {
        return transform.parent.parent.parent.name.Equals("rotate_node");
    }

    public bool IsRide()
    {
        return transform.parent.parent.name.Equals("Mount_ride");
    }

    private bool fail = false;
    private Vector3 pos;
    private void Update()
    {
        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;

        if (playerId == 0)
            return;

        player.enabled = animator.enabled;
        if (!animator.enabled)
            return;

        nameHash = animator.GetCurrentAnimatorStateInfo(0).shortNameHash;
        if (transform.parent.parent.parent && transform.parent.parent.parent.name == "rotate_node")
            transform.parent.parent.parent.localEulerAngles = Vector3.zero;
        transform.eulerAngles = Vector3.zero;

        if (nameHash == infoNames[0])
        {
            if (transform.position.Equals(pos))
            {
                direction = IsEnemy() ? 0 : 2;
            }
            pos = transform.position;
            RefreshFrames("idleWar", direction);
            if (weapon)
                weapon.RefreshFrames("idleWar", weapon.待战动画高度);
        }
        if (nameHash == infoNames[1])
        {
            RefreshFrames("attack", direction);
            if (weapon)
                weapon.RefreshFrames("attack", weapon.攻击动画高度);
        }
        if (nameHash == infoNames[2])
        {
            RefreshFrames("magic", direction);
            if (weapon)
                weapon.RefreshFrames("magic", weapon.施法动画高度);
        }
        if (nameHash == infoNames[16])
        {
            fail = true;
            RefreshFrames("runBack", direction);
            if (weapon)
                weapon.RefreshFrames("runBack",  weapon.跑回动画高度);
        }
        if (nameHash == infoNames[3] && InWar())
        {
            RefreshFrames("run", 0);
            if (weapon)
                weapon.RefreshFrames("run",  weapon.跑去动画高度);
        }
        if (nameHash == infoNames[5])
        {
            RefreshFrames("defend", direction, false);
            if (weapon)
                weapon.RefreshFrames("defend",  weapon.防御动画高度);
        }
        if (nameHash == infoNames[6] || nameHash == infoNames[7])
        {
            RefreshFrames("hit", direction, false);
            if (weapon)
                weapon.RefreshFrames("hit",  weapon.挨打动画高度);
        }
        if (nameHash == infoNames[8] && !fail)
        {
            RefreshFrames("die", direction, false);
            if (weapon)
                weapon.RefreshFrames("die",  weapon.倒地动画高度);
        }
        
        if (nameHash == infoNames[14])
        {
            fail = false;
            if (IsUI())
            {
                //GetComponentInParent<Camera>().orthographicSize = 2f;
                RefreshFrames("stand", 4);
                transform.parent.parent.localEulerAngles = Vector3.zero;
            }
            else
            {
                if (gameObject.layer == 10)
                    RefreshFrames("stand", direction);
                else
                    RefreshFrames("stand", direction);
            }
            if (weapon)
                weapon.RefreshFrames("stand", weapon.站立动画高度);
        }
        if (transform.parent)
        {
            if (transform.parent.parent)
                if (transform.parent.parent.parent)
                    transform.parent.parent.parent.localEulerAngles = Vector3.zero;
        }
        if (nameHash == infoNames[9] || nameHash == infoNames[10] || nameHash == infoNames[11] || nameHash == infoNames[12] || nameHash == infoNames[13])
        {
            RefreshFrames("stand", 4);
            if (weapon)
                weapon.RefreshFrames("stand", weapon.站立动画高度);
        }

        if (IsRide())
        {
            if (nameHash == infoNames[17] || nameHash == 0)
            {
                RefreshFrames("idleRide");
            }

            if (nameHash == infoNames[18])
            {
                RefreshFrames("runRide");
            }
        }

        timer -= Time.deltaTime;
        if (timer > 0)
            return;
        timer = 1 / 帧动画每秒帧数;
        frameIndex++;
        if (frameIndex >= frameCount && frameCount != 0)
            frameIndex = loop ? frameIndex % frameCount : frameCount - 1;
        index = frameIndex + direction * frameCount;
        
        play(index);
        
        if (weapon)
            weapon.UpdateSprite(frameIndex, direction);
        if (IsRide())
        {
            var rideRoot = transform.parent.parent.GetComponentInParent<Animator>().gameObject;
            ride = rideRoot.GetComponentInChildren<Ride2DAnimator>();
            direction = ride.IsUI() ? 0 : direction;
            transform.position = ride.transform.position + ride.骑乘高度 * Vector3.up;
            ride.UpdateSprite(frameIndex, direction, frameName);

            if (weapon)
                weapon.gameObject.SetActive(rideRoot.name.EndsWith("4008(Clone)"));
        }
        else
        {
            transform.localPosition = Vector3.up * 高度;
            if (weapon)
                weapon.gameObject.SetActive(true);
        }
        //注册反向
        if (transform.parent&& 
            transform.parent.parent&&
            transform.parent.parent.parent&&
            transform.parent.parent.parent.parent&&
            transform.parent.parent.parent.parent.name.StartsWith("Warrior"))
            player.flipX = false;
        else
            player.flipX = false;
        if (weapon)
            weapon.render.flipX = player.flipX;
    }

    //换方向和动作
    public void RefreshFrames(string fName, int fY, bool isLoop = true)
    {
        if (fName != frameName)
        {
            frameName = fName;

            if (useWASFile)
            {
                var path = WASFolder + "texture/" + playerId + "/" + frameName;
                if (!IsRide())   //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                {
                    wasImage.ReadWas(path, (x) => {          //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                        frameCount = x;                       //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                //        //这里图片资源要调用刷新一下，不然会有一帧误差 by shanniu
                       wasImage.RefreshFrame();              //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                   });                                      //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                }                                           //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                else                                        //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                {                                            //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
                wasImage.ReadWas(path, (x) => {
                        frameCount = x;
                    });
                }                                            //起步动作同步的话不屏蔽，但是有问题，屏蔽了起步动画不同步
            }
            else
            {
                var path = PNGFolder+"texture/" + playerId + "/" + frameName;
                frames = Resources.LoadAll<Sprite>(path);
                frameCount = frames.Length / DirectionCount;
            }
        }
        direction = fY;
        loop = isLoop;
    }

    //不换方向只换动作
    public void RefreshFrames(string fName, bool isLoop = true)
    {
        if (fName != frameName)
        {
            frameName = fName;
            
            if(useWASFile)
            {
                var path = WASFolder+"texture/" + playerId + "/" + frameName;
                wasImage.ReadWas(path, (x) => { frameCount = x; });
            }
            else
            {
                var path = PNGFolder+"texture/" + playerId + "/" + frameName;
                frames = Resources.LoadAll<Sprite>(path);
                frameCount = frames.Length / DirectionCount;
            }
        }
        loop = isLoop;
    }

    public bool IsUI()
    {
        if (transform.parent)
            if (transform.parent.parent)
                if (transform.parent.parent.parent)
                    if (transform.parent.parent.parent.parent.name == "ActorCamera(Clone)")
                        return true;
        return false;
    }

    /// <summary>
    /// 判断敌我
    /// </summary>
    public bool IsEnemy()
    {
        return transform.position.x < 0;
    }
}
