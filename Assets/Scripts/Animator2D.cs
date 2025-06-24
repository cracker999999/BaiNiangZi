using UnityEngine;
using System.Collections;

[RequireComponent(typeof(WasImage))]
[RequireComponent(typeof(SpriteRenderer))]
public class Animator2D : MonoBehaviour
{
    public const string WASFolder = "WASGame/";//WASGame

    public const string PNGFolder = "2DGame/";
    
    protected const float DELTA_TIME = 0.1f;

    [Tooltip("使用was文件")]
    public bool useWASFile = true;
    [Tooltip("方向数 用于png")]
    public int DirectionCount = 8;
    
    
    protected Sprite[] frames;
    protected SpriteRenderer player;
    protected WasImage wasImage;
    protected Animator animator;


    protected void play(int index)
    {
        if(useWASFile)
        {
            if (index >= wasImage.Length)
                index -= wasImage.Length;
            wasImage.SetFrame(index);
        }
        else
        {
            if(frames != null)
            {
                if (index >= frames.Length)
                    index -= frames.Length;
                player.sprite = frames[index];
            }
        }
    }

    private static string PlayerIDs = "1110, 1120, 1210, 1220, 1310, 1320, " +
                                      "1410, 1420, 1430, 1440, " +
                                      "1510, 1520, 1530, 1540, " +
                                      "1610, 1620, 1630, 1640";
    public static bool isPlayer(int id)
    {
        return PlayerIDs.Contains(id.ToString());
    }
}