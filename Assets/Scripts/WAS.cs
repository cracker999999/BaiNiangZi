using System.IO;
using System;
using System.Collections;
//using System.Drawing;
using AssetPipeline;
using UnityEngine;
//using Color = System.Drawing.Color;
//using Graphics = System.Drawing.Graphics;
using System.Collections.Generic;

namespace WASWAS
{
    public class WAS
    {
        private bool Load = false;
        private Stream WASF;//文件流
        private MemoryStream WASStream;//leen+
        private int HeadLen;//文件头长度
        public int Direction;//方向数
        public int Frame;//单方向帧数
        private int[] ColorList;//颜色表
        private int[] DevList;//帧偏移表
        public Custom.Size[] SizeList;//图像大小表
        public Custom.Point[] OffsetList;//中心偏移表
        private string fpath;
        public UnityEngine.Color[] colors;
        private int[] steps = new int[4];
        private static Dictionary<string, int[]> stepsCache = new Dictionary<string, int[]>();
        
        private int ShortRGB(short R565)
        {
            int rcol;
            int b0 = R565 & 255;
            int b1 = (R565 >> 8) & 255;
            int r = b1 & 248;
            int g = ((b1 << 5) | ((b0 & 224) >> 3)) & 255;
            int b = b0 << 3;
            r = (r | ((r & 63) >> 3)) & 255;
            g = (g | ((g & 15) >> 2)) & 255;
            b = (b | ((b & 63) >> 3)) & 255;
            rcol = (r << 16) | (g << 8) | b;
            return rcol;

        }
        public WAS()
        {

        }

        public void init(string fpath, Action<WAS> onDone)//leen+
        {
            this.fpath = fpath;
            string url = "";
#if UNITY_ANDROID && !UNITY_EDITOR
            url = fpath;
#elif UNITY_IPHONE && !UNITY_EDITOR
            url = "file://" + fpath;
#elif UNITY_STANDLONE_WIN || UNITY_STANDALONE_WIN|| UNITY_EDITOR
            url = "file://" + fpath;
#endif
            try
            {
                readRanseBoard();
            }
            catch(Exception e)
            {
                Debug.LogError("加载染色文件错误:fpath="+ fpath);
            }
            
            //Debug.Log("~~~~~~~~~ " + url);
            AssetUpdate.Instance.LoadFileByWWW(url, www =>
            {
                //Debug.Log(www.downloadHandler.data.Length);
                WASStream = new MemoryStream(www.bytes);

                byte[] mbuf = new byte[8];
                WASStream.Read(mbuf, 0, 8);
                if (BitConverter.ToInt16(mbuf, 0) == 0x5053)
                {
                    /*加载头*/
                    HeadLen = BitConverter.ToInt16(mbuf, 2);
                    Direction = BitConverter.ToInt16(mbuf, 4);
                    Frame = BitConverter.ToInt16(mbuf, 6);
                    WASStream.Position += HeadLen - 4;
                    /*定义数组*/
                    ColorList = new int[256];
                    DevList = new int[Direction * Frame + 1];
                    SizeList = new Custom.Size[Direction * Frame];
                    OffsetList = new Custom.Point[Direction * Frame];
                    /*读取数组信息*/
                    /*颜色表*/
                    mbuf = new byte[512];
                    WASStream.Read(mbuf, 0, 512);
                    for (int ii = 0; ii < 256; ii++)
                    {
                        ColorList[ii] = ShortRGB(BitConverter.ToInt16(mbuf, ii * 2));
                    }
                    /*帧偏移*/
                    mbuf = new byte[Direction * Frame * 4];
                    WASStream.Read(mbuf, 0, Direction * Frame * 4);
                    for (int ii = 0; ii < Direction * Frame; ii++)
                    {
                        DevList[ii] = BitConverter.ToInt32(mbuf, ii * 4);
                    }
                    DevList[Direction * Frame] = (int)WASStream.Length;
                    /*图像大小信息*/
                    for (int ii = 0; ii < Direction * Frame; ii++)
                    {
                        if (DevList[ii] != 0)
                        {
                            WASStream.Position = 4 + HeadLen + DevList[ii];
                            mbuf = new byte[20];
                            WASStream.Read(mbuf, 0, 16);
                            OffsetList[ii] = new Custom.Point(BitConverter.ToInt32(mbuf, 0), BitConverter.ToInt32(mbuf, 4));
                            SizeList[ii] = new Custom.Size(BitConverter.ToInt32(mbuf, 8), BitConverter.ToInt32(mbuf, 12));
                        }
                    }
                    Load = true;

                    if (onDone != null)
                    {
                        onDone.Invoke(this);
                    }
                }
            }, null);

        }

        //加载调色板文件
        public void readRanseBoard()
        {
            string fpath = this.fpath;
            if (fpath.LastIndexOf("/") == 0){
                return;
            }
            fpath = fpath.Substring(0, fpath.LastIndexOf("/"));
            //如果是e结尾的,代表战斗动作,去掉e
            if (fpath.LastIndexOf("e") == fpath.Length -1)
            {
                fpath = fpath.Substring(0, fpath.Length - 1);
            }
            fpath  = fpath + "/ranse.wpal";
            if (stepsCache.ContainsKey(fpath))
            {
                steps = stepsCache[fpath];
                return;
            }
            //fpath = "C:/Users/AA/Desktop/unity/client/client/Assets/StreamingAssets/2DGame/texture/1110/ranse.wpal";
            if (!File.Exists(fpath))
            {
                return;
            }
            string url = "";
#if UNITY_ANDROID && !UNITY_EDITOR
            url = fpath;
#elif UNITY_IPHONE && !UNITY_EDITOR
            url = "file://" + fpath;
#elif UNITY_STANDLONE_WIN || UNITY_STANDALONE_WIN|| UNITY_EDITOR
            url = "file://" + fpath;
#endif
            AssetUpdate.Instance.LoadFileByWWW(url, www =>
            {
                //Debug.Log(www.downloadHandler.data.Length);
                WASStream = new MemoryStream(www.bytes);

                byte[] b = new byte[4];
                WASStream.Read(b, 0, 4);

                if(BitConverter.ToInt16(b, 0) != 28791)
                {
                    Debug.LogError("这不是调色版文件" + fpath);
                    return;
                }

                byte[] len = new byte[4];
                WASStream.Read(len, 0, 4);
                int length = BitConverter.ToInt16(len, 0);
                steps = new int[length];
                for (int i=0;i< length; i++)
                {
                    byte[] step = new byte[4];
                    WASStream.Read(step, 0, 4);
                    steps[i] = BitConverter.ToInt16(step, 0);
                }
                stepsCache[fpath] = steps;
            }, null);
        }
        
//        public Bitmap Data(int ind)
//        {
//            int alpha, colind, dx, ww, hh, bt, len;
//            int[] hexlist;
//            Stream mem;
//            Color col;
//            Bitmap mbitmap;
//            if (DevList[ind] == 0)
//            {
//                return null;
//            }
//            ww = SizeList[ind].Width;
//            hh = SizeList[ind].Height;
//            if ((ww <= 0) || (hh <= 0))
//            {
//                return null;
//            }
//
//            byte[] mbuf = new byte[hh * 4];
//            hexlist = new int[hh + 1];
//            WASStream.Position = 4 + HeadLen + DevList[ind] + 16;
//            WASStream.Read(mbuf, 0, hh * 4);
//            for (int ii = 0; ii < hh; ii++)
//            {
//                hexlist[ii] = BitConverter.ToInt32(mbuf, ii * 4);
//            }
//            hexlist[hh] = DevList[ind + 1];
//            if (hexlist[hh] == 0)
//            {
//                hexlist[hh] = (int)WASStream.Length - 4 - HeadLen;
//            }
//            mbitmap = new Bitmap(ww, hh);           
//            for (int ii = 0; ii < hh; ii++)
//            {
//                dx = 0;
//                len = hexlist[ii + 1] - hexlist[ii];
//                var _mbuf = new byte[len];
//                WASStream.Position = 4 + HeadLen + DevList[ind] + hexlist[ii];
//                WASStream.Read(_mbuf, 0, len);
//                mem = new MemoryStream(_mbuf);
//                bt = mem.ReadByte();
//                while (bt > 0)
//                {
//                    int duanIndex = (bt >> 6) & 3;
//                    switch ((bt >> 6) & 3)
//                    {
//                        case 0://0-63
//                            {
//                                if (bt < 32)
//                                {
//                                    alpha = mem.ReadByte() * 8;
//                                    colind = mem.ReadByte();
//                                    if ((alpha >= 0) && (colind >= 0) && (colind < 256))
//                                    {
//                                        //col = Color.FromArgb((ColorList[colind]) | (alpha << 24));
//                                        col = changeColor(colind, duanIndex, alpha);
//                                        for (int jj = 0; jj < (bt & 31); jj++)
//                                        {
//                                            if (dx >= ww)
//                                            {
//                                                break;
//                                            }
//                                            mbitmap.SetPixel(dx, ii, col);
//                                            dx++;
//                                        }
//                                    }
//                                }
//                                else
//                                {
//                                    alpha = (bt & 31) * 8;
//                                    colind = mem.ReadByte();
//                                    if ((alpha >= 0) && (colind >= 0) && (colind < 256))
//                                    {
//                                        if (dx >= ww)
//                                        {
//                                            break;
//                                        }
//                                        //col = Color.FromArgb(ColorList[colind] | (alpha << 24));
//                                        col = changeColor(colind, duanIndex, alpha);
//                                        mbitmap.SetPixel(dx, ii, col);
//                                        dx++;
//
//                                    }
//                                }
//                            }
//                            break;
//                        case 1://64-127
//                            {
//                                for (int jj = 0; jj < (bt & 63); jj++)
//                                {
//                                    if (dx >= ww)
//                                    {
//                                        break;
//                                    }
//                                    colind = mem.ReadByte();
//                                    if ((colind >= 0) && (colind < 256))
//                                    {
//                                        //col = Color.FromArgb((ColorList[colind] | color2) | (255 << 24));
//                                        col = changeColor(colind, duanIndex, 255);
//                                        mbitmap.SetPixel(dx, ii, col);
//                                        dx++;
//                                    }
//
//                                }
//                            }
//                            break;
//                        case 2://128-191
//                            {
//                                colind = mem.ReadByte();
//                                if ((colind >= 0) && (colind < 256))
//                                {
//                                    //col = Color.FromArgb((ColorList[colind] | color3) | (255 << 24));
//                                    col = changeColor(colind, duanIndex, 255);
//                                    for (int jj = 0; jj < (bt & 63); jj++)
//                                    {
//                                        if (dx >= ww)
//                                        {
//                                            break;
//                                        }
//                                        mbitmap.SetPixel(dx, ii, col);
//                                        dx++;
//                                    }
//                                }
//                            }
//                            break;
//                        case 3://192-255
//                            {
//                                dx += bt & 63;
//                            }
//                            break;
//                    }
//                    bt = mem.ReadByte();
//                }
//                mem.Close();
//            }
//            return mbitmap;
//        }
        
        public Texture2D Data2(int ind)
        {
            int alpha, colind, dx, ww, hh, bt, len;
            Stream mem;
            Color col;
            
            if (DevList[ind] == 0)
            {
                return null;
            }
            ww = SizeList[ind].Width;
            hh = SizeList[ind].Height;
            if ((ww <= 0) || (hh <= 0))
            {
                return null;
            }

            byte[] mbuf = new byte[hh * 4];
            var hexlist = new int[hh + 1];
            WASStream.Position = 4 + HeadLen + DevList[ind] + 16;
            WASStream.Read(mbuf, 0, hh * 4);
            for (int ii = 0; ii < hh; ii++)
            {
                hexlist[ii] = BitConverter.ToInt32(mbuf, ii * 4);
            }
            hexlist[hh] = DevList[ind + 1];
            if (hexlist[hh] == 0)
            {
                hexlist[hh] = (int)WASStream.Length - 4 - HeadLen;
            }
            
            var tex = new Texture2D(ww, hh);
            transparentTex(tex);
            
            for (int ii = 0; ii < hh; ii++)
            {
                dx = 0;
                len = hexlist[ii + 1] - hexlist[ii];
                var _mbuf = new byte[len];
                WASStream.Position = 4 + HeadLen + DevList[ind] + hexlist[ii];
                WASStream.Read(_mbuf, 0, len);
                mem = new MemoryStream(_mbuf);
                bt = mem.ReadByte();
                while (bt > 0)
                {
                    int duanIndex = (bt >> 6) & 3;
                    switch ((bt >> 6) & 3)
                    {
                        case 0://0-63
                            {
                                if (bt < 32)
                                {
                                    alpha = mem.ReadByte() * 8;
                                    colind = mem.ReadByte();
                                    if ((alpha >= 0) && (colind >= 0) && (colind < 256))
                                    {
                                        //col = Color.FromArgb((ColorList[colind]) | (alpha << 24));
                                        col = changeColor2(colind, duanIndex, alpha);
                                        for (int jj = 0; jj < (bt & 31); jj++)
                                        {
                                            if (dx >= ww)
                                            {
                                                break;
                                            }
                                            //mbitmap.SetPixel(dx, ii, col);
                                            tex.SetPixel(dx, -ii, col);
                                            dx++;
                                        }
                                    }
                                }
                                else
                                {
                                    alpha = (bt & 31) * 8;
                                    colind = mem.ReadByte();
                                    if ((alpha >= 0) && (colind >= 0) && (colind < 256))
                                    {
                                        if (dx >= ww)
                                        {
                                            break;
                                        }
                                        //col = Color.FromArgb(ColorList[colind] | (alpha << 24));
                                        col = changeColor2(colind, duanIndex, alpha);
                                        //mbitmap.SetPixel(dx, ii, col);
                                        tex.SetPixel(dx, -ii, col);
                                        dx++;

                                    }
                                }
                            }
                            break;
                        case 1://64-127
                            {
                                for (int jj = 0; jj < (bt & 63); jj++)
                                {
                                    if (dx >= ww)
                                    {
                                        break;
                                    }
                                    colind = mem.ReadByte();
                                    if ((colind >= 0) && (colind < 256))
                                    {
                                        //col = Color.FromArgb((ColorList[colind] | color2) | (255 << 24));
                                        col = changeColor2(colind, duanIndex, 255);
                                        //mbitmap.SetPixel(dx, ii, col);
                                        tex.SetPixel(dx, -ii, col);
                                        dx++;
                                    }

                                }
                            }
                            break;
                        case 2://128-191
                            {
                                colind = mem.ReadByte();
                                if ((colind >= 0) && (colind < 256))
                                {
                                    //col = Color.FromArgb((ColorList[colind] | color3) | (255 << 24));
                                    col = changeColor2(colind, duanIndex, 255);
                                    for (int jj = 0; jj < (bt & 63); jj++)
                                    {
                                        if (dx >= ww)
                                        {
                                            break;
                                        }
                                        //mbitmap.SetPixel(dx, ii, col);
                                        tex.SetPixel(dx, -ii, col);
                                        dx++;
                                    }
                                }
                            }
                            break;
                        case 3://192-255
                            {
                                dx += bt & 63;
                            }
                            break;
                    }
                    bt = mem.ReadByte();
                }
                mem.Close();
            }
            return tex;
        }

//        public Bitmap PutPNG()
//        {
//            Bitmap rbitmap;
//            Bitmap mbitmap;
//            Graphics rgdi;
//            Rectangle mrect;
//            Rectangle drect;
//            int mx = 0, my = 0, mr = 0, md = 0, mw, mh;
//
//            if (SizeList == null)
//                return null;
//            for (int ii = 0; ii < SizeList.Length; ii++)
//            {
//                if (mx < OffsetList[ii].X)
//                {
//                    mx = OffsetList[ii].X;
//                }
//                if (my < OffsetList[ii].Y)
//                {
//                    my = OffsetList[ii].Y;
//                }
//                if (mr < SizeList[ii].Width - OffsetList[ii].X)
//                {
//                    mr = SizeList[ii].Width - OffsetList[ii].X;
//                }
//                if (md < SizeList[ii].Height - OffsetList[ii].Y)
//                {
//                    md = SizeList[ii].Height - OffsetList[ii].Y;
//                }
//            }
//            
//            mw = mx + mr;
//            mh = my + md;
//            if ((mw <= 0) || (mh <= 0))
//            {
//                return null;
//            }
//            rbitmap = new Bitmap(mw * Frame, mh * Direction);
//            rgdi = Graphics.FromImage(rbitmap);
//            for (int ii = 0; ii < Direction; ii++)
//            {
//                for (int jj = 0; jj < Frame; jj++)
//                {
//                    mbitmap = Data(ii * Frame + jj);
//                    if (mbitmap == null)
//                    {
//                        /*return null;
//                        rgdi.Dispose();*/
//                    }
//                    else
//                    {
//                        mrect = new Rectangle(0, 0, mbitmap.Width, mbitmap.Height);
//                        drect = new Rectangle(jj * mw + mx - OffsetList[ii * Frame + jj].X, ii * mh + my - OffsetList[ii * Frame + jj].Y, mbitmap.Width, mbitmap.Height);
//                        rgdi.DrawImage(mbitmap, drect, mrect, GraphicsUnit.Pixel);
//                        mbitmap.Dispose();
//                    }                    
//                }
//            }
//            rgdi.Dispose();
//            return rbitmap;
//        }
        
        public Texture2D PutPNG2()
        {
            var dict = new Dictionary<string, Texture2D>();
            
            int mx = 0, my = 0, mr = 0, md = 0;

            if (SizeList == null)
                return null;
            for (int ii = 0; ii < SizeList.Length; ii++)
            {
                if (mx < OffsetList[ii].X)
                {
                    mx = OffsetList[ii].X;
                }
                if (my < OffsetList[ii].Y)
                {
                    my = OffsetList[ii].Y;
                }
                if (mr < SizeList[ii].Width - OffsetList[ii].X)
                {
                    mr = SizeList[ii].Width - OffsetList[ii].X;
                }
                if (md < SizeList[ii].Height - OffsetList[ii].Y)
                {
                    md = SizeList[ii].Height - OffsetList[ii].Y;
                }
            }
            
            var mw = mx + mr;
            var mh = my + md;
            if (mw <= 0 || mh <= 0)
            {
                return null;
            }
            
            var bigTex = new Texture2D(mw * Frame, mh * Direction);
            transparentTex2(bigTex);
            Texture2D smallTex = null;
            
            for (int i = 0; i < Direction; i++)
            {
                for (int j = 0; j < Frame; j++)
                {
                    smallTex = Data2(i * Frame + j);
                    if (smallTex == null)
                    {
                        
                    }
                    else
                    {
                        var x = j * mw + mx - OffsetList[i * Frame + j].X;
                        var y = i * mh + my - OffsetList[i * Frame + j].Y;
                        //从左下角开始画
                        bigTex.SetPixels(x, bigTex.height - smallTex.height - y, smallTex.width, smallTex.height, smallTex.GetPixels(0, 0, smallTex.width, smallTex.height));
                    }
                    UnityEngine.Object.Destroy(smallTex);
                }
            }
            
            return bigTex;
        }
        
//        private Color changeColor(int colorIndex,int index,int alpha)
//        {
//            //int[] step = {63,127,191,255};  //逍遥生
//            //int[] step = { 39, 79, 119, 255 };  //剑侠客
//            int[] step = steps;
//            
//            Color orgColor = Color.FromArgb(ColorList[colorIndex] | (alpha << 24));
//            UnityEngine.Color stepColor = UnityEngine.Color.black;
//            int r = 0,g = 0, b = 0,a=0;
//            r = orgColor.R;
//            g = orgColor.G;
//            b = orgColor.B;
//            a = orgColor.A;
//            
//            int stepMax = 64;
//            //如果只有2段,对应0和2
//            if (step.Length == 2)
//            {
//                if (colorIndex < step[1]) 
//                {
//                    stepColor = colors[0];
//                }
//                else
//                {
//                    stepColor = colors[2];
//                }
//            }
//            else
//            {
//                if (step.Length > 1 && colorIndex < step[1])  //头发
//                {
//                    stepColor = colors[0];
//                }
//                else if (step.Length > 2 && colorIndex < step[2]) //飘带
//                {
//                    stepColor = colors[3];
//                }
//                else if (step.Length > 3 && colorIndex < step[3]) //衣服
//                {
//                    stepColor = colors[1];
//                }
//            }
//            
//            r += Convert.ToInt32(stepColor.r * stepMax);
//            g += Convert.ToInt32(stepColor.g * stepMax);
//            b += Convert.ToInt32(stepColor.b * stepMax);
//            a *= Convert.ToInt32(stepColor.a * stepMax);
//
//            r = Math.Min(r,255);
//            g = Math.Min(g, 255);
//            b = Math.Min(b, 255);
//            a = Math.Min(a, 255);
//            Color color = Color.FromArgb(alpha, r, g, b);
//            return color;
//        }
        
        private Color32 changeColor2(int colorIndex,int index,int alpha)
        {
            //int[] step = {63,127,191,255};  //逍遥生
            //int[] step = { 39, 79, 119, 255 };  //剑侠客
            int[] step = steps;

            var argb = ColorList[colorIndex] | (alpha << 24);
            //Color orgColor = Color.FromArgb(argb);
            var orgColor = getColor32(argb);
            UnityEngine.Color stepColor = UnityEngine.Color.black;
            int r = 0,g = 0, b = 0,a=0;
            r = orgColor.r;
            g = orgColor.g;
            b = orgColor.b;
            a = orgColor.a;
            
            int stepMax = 64;
            //如果只有2段,对应0和2
            if (step.Length == 2)
            {
                if (colorIndex < step[1]) 
                {
                    stepColor = colors[0];
                }
                else
                {
                    stepColor = colors[2];
                }
            }
            else
            {
                if (step.Length > 1 && colorIndex < step[1])  //头发
                {
                    stepColor = colors[0];
                }
                else if (step.Length > 2 && colorIndex < step[2]) //飘带
                {
                    stepColor = colors[3];
                }
                else if (step.Length > 3 && colorIndex < step[3]) //衣服
                {
                    stepColor = colors[1];
                }
            }
            
            r += Convert.ToInt32(stepColor.r * stepMax);
            g += Convert.ToInt32(stepColor.g * stepMax);
            b += Convert.ToInt32(stepColor.b * stepMax);
            a *= Convert.ToInt32(stepColor.a * stepMax);

            r = Math.Min(r,255);
            g = Math.Min(g, 255);
            b = Math.Min(b, 255);
            a = Math.Min(a, 255);
            //Color color = Color.FromArgb(alpha, r, g, b);
            Color32 color = new Color32((byte)r, (byte)g, (byte)b, (byte)alpha);
            return color;
        }

        public void setColor(UnityEngine.Color[] cs)
        {
            colors = new UnityEngine.Color[cs.Length];
            for(int i = 0; i < cs.Length; i++)
            {
                colors[i] = new UnityEngine.Color(cs[i].r, cs[i].g, cs[i].b, cs[i].a);
                //colors[i] = cs[i];
            }
        }

        public Boolean isSameColor(UnityEngine.Color[] cs)
        {
            if (cs.Length == colors.Length)
            {
                for (int i = 0; i < cs.Length; i++)
                {
                    if (cs[i] != colors[i])
                    {
                        return false;
                    }
                }
            }
            else
            {
                return false;
            }
            return true;
        }


        public void Close()
        {
            ColorList = null;
            DevList = null;
            if (Load)
            {
                WASF.Dispose();
                WASStream.Dispose();
            }
        }
        
        //
        private static void transparentTex(Texture2D tex)
        {
            for(int i = 0; i < tex.width; i++)
            {
                for(int j = 0; j < tex.height; j++)
                {
                    tex.SetPixel(i, j, UnityEngine.Color.clear);
                }
            }
        }

        private static void transparentTex2(Texture2D tex)
        {
            var colors = new Color32[tex.width * tex.height];
            for(int i = 0; i < colors.Length; i++)
            {
                colors[i] = UnityEngine.Color.clear;
            }
            tex.SetPixels32(colors);
        }

        private static Color32 tempC = new Color32();
        private static Color32 getColor32(int argb)
        {
            long value = (long) argb & (long) uint.MaxValue;
            byte alpha = (byte) ((ulong) (value >> 24) & (ulong) byte.MaxValue);
            byte red = (byte) ((ulong) (value >> 16) & (ulong) byte.MaxValue);
            byte green = (byte) ((ulong) (value >> 8) & (ulong) byte.MaxValue);
            byte blue = (byte) ((ulong) value & (ulong) byte.MaxValue);
            
            tempC.a = alpha;
            tempC.r = red;
            tempC.g = green;
            tempC.b = blue;
            return tempC;
        }
    }
}
