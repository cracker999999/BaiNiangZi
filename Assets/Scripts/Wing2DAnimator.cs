using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(WasImage))]
[RequireComponent(typeof(SpriteRenderer))]
public class Wing2DAnimator : Animator2D
{

    public int ID;
    private int frameCount = 28;
    //public float size = 0.4f;
    //public float 高度;
    private string frameName = "stand";
    public int direction;
    private int frameIndex;
    

    private float timer;

    public List<GameObject> models = new List<GameObject>();
    

    private void Awake()
    {
        wasImage = gameObject.GetComponent<WasImage>();
        if(wasImage == null)
        {
            wasImage = gameObject.AddComponent<WasImage>();
        }

        animator = transform.parent.gameObject.GetComponent<Animator>();
        if(animator == null)
        {
            animator = transform.parent.gameObject.AddComponent<Animator>();
        }
        
        gameObject.layer = 11;
        transform.parent.gameObject.layer = 11;
    }

    private void OnEnable()
    {
        animator = GetComponentInParent<Animator>();
        player = GetComponent<SpriteRenderer>();
        player.sortingOrder = -1;
        player.transform.localScale = Vector2.one;
        animator.enabled = enabled;
        timer = DELTA_TIME;
        
        if (frameName != null)
        {
            if(useWASFile)
            {
                wasImage.ReadWas(WASFolder + "texture/" + ID + "/" + frameName, (x) => { frameCount = x; });
            }
            else
            {
                var path = PNGFolder+"texture/" + ID + "/" + frameName;
                frames = Resources.LoadAll<Sprite>(path);
                frameCount = frames.Length / DirectionCount;
            }
        }
    }

    private void Update()
    {
        if (transform.parent.parent.name.StartsWith("ActorNode"))
        {
            direction = 4;
            //transform.localScale = Vector3.one * 0.7f;
            //transform.parent.localPosition = Vector3.up * 0.1f;
           // var camera = GetComponentInParent<Camera>();
            //if (camera)
              //  camera.orthographicSize = 0.7f;
        }
        if (transform.parent.parent.name == "Mount_wing")
        {
            //人身上
            var P = transform.parent.parent.parent.parent.GetComponentInChildren<Player2DAnimator>();
            transform.localScale = Vector3.one;
            //transform.position = P.transform.position + 高度 * Vector3.up;
            transform.rotation = P.transform.rotation;
            direction = P.direction;
            if (transform.parent.parent.parent.parent.parent.parent.name == "posobj")
            {
                //UI上
                direction = 4;
            }

            if (P.IsRide())
            {
                if(P.ride)
                {
                    transform.parent.localPosition = (Vector3)P.ride.骑乘翅膀位置[7 - direction];
                    transform.parent.localEulerAngles = (Vector3)P.ride.骑乘翅膀旋转[7 - direction];
                }
                
                models.ForEach(go => go.SetActive(false));
            }
            else
            {
                transform.parent.localEulerAngles = P.angles[7 - direction];
                transform.parent.localPosition = (Vector3)P.翅膀位置[7 - direction];
                models.ForEach(go => go.SetActive(true));
            }
        }

        if (transform.parent && transform.parent.parent)
            gameObject.layer = transform.parent.parent.gameObject.layer;

        if (ID == 0)
            return;

        player.enabled = animator.enabled;
        player.enabled = false;

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

        timer -= Time.deltaTime;

        if (timer > 0|| frameCount==0)
            return;
        timer = DELTA_TIME;
        
        frameIndex++;
        if (frameIndex >= frameCount)
            frameIndex %= frameCount;
        
        var index = frameIndex + direction * frameCount;
        //play(index);
    }

    public bool IsEnemy()
    {
        return transform.position.x < 0;
    }
}
