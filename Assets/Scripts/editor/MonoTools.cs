using UnityEngine;
using System.Collections;
using UnityEditor;

public class MonoTools  {
	[MenuItem("GameObject/宠物动画")]
	public static void Add2DSprite()
    {
        var go = new GameObject("宠物动画");
        go.AddComponent<Pet2DAnimator>();
        go.transform.SetParent(Selection.activeGameObject.transform);
    }
}
