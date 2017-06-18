using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace AdenSpider.OCR
{
    class ImageProcessing
    {
        public Bitmap ToGray(Bitmap bmp)
        {
            for (int i = 0; i < bmp.Width; i++)
            {
                for (int j = 0; j < bmp.Height; j++)
                {
                    //获取该点的像素的RGB的颜色  
                    Color color = bmp.GetPixel(i, j);
                    //利用公式计算灰度值  
                    int gray = (int)(color.R * 0.3 + color.G * 0.59 + color.B * 0.11);
                    Color newColor = Color.FromArgb(gray, gray, gray);
                    bmp.SetPixel(i, j, newColor);
                }
            }
            return bmp;
        }
        public int[] getHist(Bitmap grayMap)
        {
            int[] hist= new int[256];
            
            for (int i = 0; i < grayMap.Width; i++)
            {
                for (int j = 0; j < grayMap.Height; j++)
                {
                    Color color = grayMap.GetPixel(i, j);
                    int gray = color.R;
                    hist[gray] += 1;
                }
            }
            return hist;
        }
    }

}
