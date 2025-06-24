using UnityEngine;

[RequireComponent(typeof(WasImage))]
[RequireComponent(typeof(SpriteRenderer))]
public class Pet2DAnimator : Animator2D
{
    /// <summary>
    /// 宠物ID
    /// </summary>
    public int ID;
    /// <summary>
    /// 动画名
    /// </summary>
    private string frameName;
    /// <summary>
    /// 动画帧数
    /// </summary>
    private int frameCount;
    /// <summary>
    /// 动画方向
    /// </summary>
    private int direction;
    /// <summary>
    /// 当前帧
    /// </summary>
    private Vector3 pos;
    private int frameIndex;
    private float timer;
    private int[] infoNames;

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
        timer = DELTA_TIME;
        player = GetComponent<SpriteRenderer>();
        player.transform.localScale = Vector2.one;
        infoNames = new[]
        {
            Animator.StringToHash ("idleWar"),
            Animator.StringToHash ("attack1"),
            Animator.StringToHash ("magic"),
            Animator.StringToHash ("run"),
            Animator.StringToHash ("runWar"),

            Animator.StringToHash ("defend"),
            Animator.StringToHash ("hit1"),
            Animator.StringToHash ("hit2"),
            Animator.StringToHash ("die"),
            Animator.StringToHash ("rolecreate1"),

            Animator.StringToHash ("rolecreate2"),
            Animator.StringToHash ("rolecreate3"),
            Animator.StringToHash ("rolecreate4"),
            Animator.StringToHash ("rolecreate5"),
            Animator.StringToHash ("idleCity"),

            Animator.StringToHash ("runBack"),
            Animator.StringToHash ("idleRide"),
            Animator.StringToHash ("runRide"),
        };
    }

    private void Update()
    {
        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;

        if (ID == 0)
            return;

        player.enabled = animator.enabled;

        if (!animator.enabled)
            return;

        var nameHash = animator.GetCurrentAnimatorStateInfo(0).shortNameHash;
        if (nameHash == infoNames[0])
        {
            if (transform.position.Equals(pos))
            {
                direction = IsEnemy() ? 0 : 2;
            }
            pos = transform.position;
            RefreshFrames("idleWar", direction);
        }
        if (nameHash == infoNames[1])
            RefreshFrames("attack", direction);
        if (nameHash == infoNames[2])
            RefreshFrames("magic", direction);
        if (nameHash == infoNames[15])
            RefreshFrames("runBack", direction);
        if (nameHash == infoNames[4])
            RefreshFrames("run", direction);
        if (nameHash == infoNames[5])
            RefreshFrames("defend", direction);
        if (nameHash == infoNames[6])
            RefreshFrames("hit", direction);
        if (nameHash == infoNames[7])
            RefreshFrames("hit", direction);
        if (nameHash == infoNames[8])
            RefreshFrames("die", direction);
        if (nameHash == infoNames[14])
        {
			if (IsUI ()) {
				RefreshFrames ( "stand", 4);
				transform.parent.parent.localEulerAngles = Vector3.zero;//new Vector3(0, -0.3f, 3);
			} else {
				if (gameObject.layer == 10)
					RefreshFrames ( "stand", direction);
				else
					RefreshFrames ( "stand");
			}
        }
        if (transform.parent.parent.parent && transform.parent.parent.parent.name == "rotate_node")
            transform.parent.parent.parent.localEulerAngles = Vector3.zero;
        transform.localEulerAngles = Vector3.zero;

        timer -= Time.deltaTime;
        if (timer > 0)
            return;

        timer = DELTA_TIME;
        frameIndex++;
        if (frameIndex >= frameCount)
            frameIndex = 0;
        var index = frameIndex + direction * frameCount;
        
        play(index);
    }

    public void RefreshFrames(string fName, int fY)
    {
        RefreshFrames(fName);
        direction = fY;
    }

    public void RefreshFrames(string fName)
    {
        if (fName != frameName)
        {
            frameName = fName;

            if(useWASFile)
            {
                var path = WASFolder+"texture/" + ID + "/" + frameName;
                wasImage.ReadWas(path, (x) => { frameCount = x; });//leen+
            }
            else
            {
                var path = PNGFolder+"texture/" + ID + "/" + frameName;
                frames = Resources.LoadAll<Sprite>(path);
                frameCount = frames.Length / DirectionCount;
            }
        }
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

    public bool IsEnemy()
    {
        return transform.position.x < 0;
    }
}
