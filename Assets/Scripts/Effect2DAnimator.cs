using UnityEngine;

[RequireComponent(typeof(WasImage))]
[RequireComponent(typeof(SpriteRenderer))]
public class Effect2DAnimator : Animator2D
{
    //public int ID;
    private int frameCount = 1;
    //public float size = 0.4f;
    //public float 高度;
    public string frameName = "唧唧歪歪-特效";
    [HideInInspector]
    public int direction;
    private int frameIndex;

    private float timer;


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
        if(useWASFile)
        {
            wasImage.ReadWas(WASFolder+"effect/" + frameName, (x) => { frameCount = x; });
        }
        else
        {
            var path = PNGFolder+"effect/" + frameName;
            Debug.Log("加载特效 "+path);
            frames = Resources.LoadAll<Sprite>(path);
            frameCount = frames.Length / DirectionCount;
            if(frameName == "lg-ljyj1")
            {
                Debug.Log("111111 ");
            }
        }
    }

    private void Update()
    {
        /*if (transform.parent.parent.name.StartsWith("ActorNode"))
        {
            direction = 4;
            //transform.localScale = Vector3.one * size;
            transform.parent.localPosition = Vector3.up * 0.1f;
        }
        if (transform.parent.parent.name == "Mount_wing")
        {
            //人身上
            var P = transform.parent.parent.parent.parent.GetComponentInChildren<Player2DAnimator>();
            transform.localScale = Vector3.one;
            transform.position = P.transform.position;// + 高度 * Vector3.up;
            transform.rotation = P.transform.rotation;
            direction = P.direction;
            if (transform.parent.parent.parent.parent.parent.parent.name == "posobj")
            {
                //UI上
                direction = 4;
            }
        }
            
        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;*/

        //if (ID == 0)
            //return;

        player.enabled = animator.enabled;

        if (!animator.enabled)
            return;

        /*if (transform.parent)
        {
            if (transform.parent.parent)
                if (transform.parent.parent.parent)
                    transform.parent.parent.parent.localEulerAngles = Vector3.zero;
        }
        if (transform.parent.parent.parent && transform.parent.parent.parent.name == "rotate_node")
            transform.parent.parent.parent.localEulerAngles = Vector3.zero;*/

        timer -= Time.deltaTime;
        if (timer > 0)
            return;
        timer = DELTA_TIME;
        frameIndex++;
        if (frameIndex >= frameCount)
            frameIndex %= frameCount;
        var index = frameIndex + direction * frameCount;
        
        play(index);
    }

    public bool IsEnemy()
    {
        return transform.position.x < 0;
    }
}
