using UnityEngine;

[RequireComponent(typeof(WasImage))]
[RequireComponent(typeof(SpriteRenderer))]
public class Ride2DAnimator : Animator2D
{
    public int ID;
    private int frameCount = 4;
    public float 骑乘高度 = 0.1f;
    private string frameName;
    
    private int frameIndex;
    private bool loop = true;

    private float timer;
    public Vector3[] 骑乘翅膀位置;
    public Vector3[] 骑乘翅膀旋转;

    private void Awake()
    {
        wasImage = gameObject.GetComponent<WasImage>();
        if (wasImage == null)
            wasImage = gameObject.AddComponent<WasImage>();

        animator = transform.parent.gameObject.GetComponent<Animator>();
        if (animator == null)
            animator = transform.parent.gameObject.AddComponent<Animator>();

        gameObject.layer = 11;
        transform.parent.gameObject.layer = 11;
    }

    private void OnEnable()
    {
        animator = GetComponentInParent<Animator>();
        player = GetComponent<SpriteRenderer>();
        player.sortingOrder = -1;
        animator.enabled = enabled;
        timer = DELTA_TIME;
        player.transform.localScale = Vector2.one;
    }

    private void Update()
    {
        if (transform.parent.GetComponentInChildren<Player2DAnimator>() == null)
        {
            // if(wasImage.Length == 0)
            //    RefreshFrames("stand");leen-
            timer -= Time.deltaTime;
            if (timer > 0)
                return;
            timer = DELTA_TIME;
            frameIndex++;
            if (frameIndex >= frameCount)
                frameIndex = loop ? frameIndex % frameCount : frameCount - 1;
            var index = frameIndex;
            
            play(index);
        }

        transform.eulerAngles = Vector3.zero;
        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;

        if (ID == 0)
            return;

        player.enabled = animator.enabled;

        if (!animator.enabled)
            return;

        if (transform.parent)
        {
            if (transform.parent.parent)
                if (transform.parent.parent.parent)
                    transform.parent.parent.parent.localEulerAngles = Vector3.zero;
        }
        if (transform.parent.parent.parent && transform.parent.parent.parent.name == "rotate_node")
            transform.parent.parent.parent.localEulerAngles = Vector3.zero;
    }

    public bool IsUI()
    {
        if (transform.parent)
            if (transform.parent.parent)
                if (transform.parent.parent.parent)
                    if (transform.parent.parent.parent.name == "posobj")
                        return true;
        return false;
    }

    public void RefreshFrames(string fName)
    {
        if (frameName != fName)
        {
            frameName = fName;
            var realName = frameName;
            if(frameName == "runRide")
            {
                realName = "walk";
            }

            if(frameName == "idleRide")
            {
                realName = "stand";
            }

            if(useWASFile)
            {
                var path = WASFolder+"texture/" + ID + "/" + realName;
                wasImage.ReadWas(path, (x) => { frameCount = x;});
            }
            else
            {
                var path = PNGFolder+"texture/" + ID + "/" + realName;
                frames = Resources.LoadAll<Sprite>(path);
                frameCount = frames.Length / DirectionCount;
            }
        }
    }

    public void UpdateSprite(int index, int dir, string name)
    {
        RefreshFrames(name);
        frameIndex = index % frameCount;
        //wasImage.SetFrame(frameIndex + dir * frameCount);
        play(frameIndex + dir * frameCount);
    }
}
