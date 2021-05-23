using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Card : MonoBehaviour
{
    /* --- Debug --- */
    //private string DebugTag = "[Card]: ";
    //private bool Debug = false;

    /* --- Internal --- */
    public enum Type { monster };

    /* --- Components --- */
    public RectTransform rect;
    public Image cardBase;
    public Image cardIcon;
    public Text cardText;
    public Image starBase;

    /* --- Stats --- */
    public string cardName;
    private Vector2 size;
    public int stars;
    public Type type;

    /*--- Unity Methods ---*/
    void Start()
    {
        size = rect.sizeDelta;
    }

    void Update()
    {
    }

    void FixedUpdate()
    {
    }

    void OnMouseDown()
    {
        cardBase.material.SetFloat("_OutlineWidth", 0.5f);
    }

    void OnMouseOver()
    {
        rect.sizeDelta = size + new Vector2(2, 2);
    }

    void OnMouseExit()
    {
        rect.sizeDelta = size;
    }

    /*--- Methods ---*/


}