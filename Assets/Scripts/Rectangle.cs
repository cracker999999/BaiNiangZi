using System;
using System.Globalization;

namespace Custom
{
    public struct Rectangle
    {
        public static readonly Rectangle Empty = new Rectangle();
        private int x;
        private int y;
        private int width;
        private int height;

        public Rectangle(int x, int y, int width, int height)
        {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }

        public Rectangle(Point location, Size size)
        {
            this.x = location.X;
            this.y = location.Y;
            this.width = size.Width;
            this.height = size.Height;
        }

        public static Rectangle FromLTRB(int left, int top, int right, int bottom)
        {
            return new Rectangle(left, top, right - left, bottom - top);
        }

        //[Browsable(false)]
        public Point Location
        {
            get { return new Point(this.X, this.Y); }
            set
            {
                this.X = value.X;
                this.Y = value.Y;
            }
        }

        //[Browsable(false)]
        public Size Size
        {
            get { return new Size(this.Width, this.Height); }
            set
            {
                this.Width = value.Width;
                this.Height = value.Height;
            }
        }

        public int X
        {
            get { return this.x; }
            set { this.x = value; }
        }

        public int Y
        {
            get { return this.y; }
            set { this.y = value; }
        }

        public int Width
        {
            get { return this.width; }
            set { this.width = value; }
        }

        public int Height
        {
            get { return this.height; }
            set { this.height = value; }
        }

        //[Browsable(false)]
        public int Left
        {
            get { return this.X; }
        }

        //[Browsable(false)]
        public int Top
        {
            get { return this.Y; }
        }

        //[Browsable(false)]
        public int Right
        {
            get { return this.X + this.Width; }
        }

        //[Browsable(false)]
        public int Bottom
        {
            get { return this.Y + this.Height; }
        }

        //[Browsable(false)]
        public bool IsEmpty
        {
            get
            {
                if(this.height == 0 && this.width == 0 && this.x == 0)
                    return this.y == 0;
                return false;
            }
        }

        public override bool Equals(object obj)
        {
            if(!(obj is Rectangle))
                return false;
            Rectangle rectangle = (Rectangle) obj;
            if(rectangle.X == this.X && rectangle.Y == this.Y && rectangle.Width == this.Width)
                return rectangle.Height == this.Height;
            return false;
        }

        public static bool operator ==(Rectangle left, Rectangle right)
        {
            if(left.X == right.X && left.Y == right.Y && left.Width == right.Width)
                return left.Height == right.Height;
            return false;
        }

        public static bool operator !=(Rectangle left, Rectangle right)
        {
            return !(left == right);
        }

//    public static Rectangle Ceiling(RectangleF value)
//    {
//      return new Rectangle((int) Math.Ceiling((double) value.X), (int) Math.Ceiling((double) value.Y), (int) Math.Ceiling((double) value.Width), (int) Math.Ceiling((double) value.Height));
//    }

//    public static Rectangle Truncate(RectangleF value)
//    {
//      return new Rectangle((int) value.X, (int) value.Y, (int) value.Width, (int) value.Height);
//    }

//    public static Rectangle Round(RectangleF value)
//    {
//      return new Rectangle((int) Math.Round((double) value.X), (int) Math.Round((double) value.Y), (int) Math.Round((double) value.Width), (int) Math.Round((double) value.Height));
//    }

        public bool Contains(int x, int y)
        {
            if(this.X <= x && x < this.X + this.Width && this.Y <= y)
                return y < this.Y + this.Height;
            return false;
        }

        public bool Contains(Point pt)
        {
            return this.Contains(pt.X, pt.Y);
        }

        public bool Contains(Rectangle rect)
        {
            if(this.X <= rect.X && rect.X + rect.Width <= this.X + this.Width && this.Y <= rect.Y)
                return rect.Y + rect.Height <= this.Y + this.Height;
            return false;
        }

        public override int GetHashCode()
        {
            return this.X ^ (this.Y << 13 | (int) ((uint) this.Y >> 19)) ^ (this.Width << 26 | (int) ((uint) this.Width >> 6)) ^
                   (this.Height << 7 | (int) ((uint) this.Height >> 25));
        }

        public void Inflate(int width, int height)
        {
            this.X -= width;
            this.Y -= height;
            this.Width += 2 * width;
            this.Height += 2 * height;
        }

        public void Inflate(Size size)
        {
            this.Inflate(size.Width, size.Height);
        }

        public static Rectangle Inflate(Rectangle rect, int x, int y)
        {
            Rectangle rectangle = rect;
            rectangle.Inflate(x, y);
            return rectangle;
        }

        public void Intersect(Rectangle rect)
        {
            Rectangle rectangle = Rectangle.Intersect(rect, this);
            this.X = rectangle.X;
            this.Y = rectangle.Y;
            this.Width = rectangle.Width;
            this.Height = rectangle.Height;
        }

        public static Rectangle Intersect(Rectangle a, Rectangle b)
        {
            int x = Math.Max(a.X, b.X);
            int num1 = Math.Min(a.X + a.Width, b.X + b.Width);
            int y = Math.Max(a.Y, b.Y);
            int num2 = Math.Min(a.Y + a.Height, b.Y + b.Height);
            if(num1 >= x && num2 >= y)
                return new Rectangle(x, y, num1 - x, num2 - y);
            return Rectangle.Empty;
        }

        public bool IntersectsWith(Rectangle rect)
        {
            if(rect.X < this.X + this.Width && this.X < rect.X + rect.Width && rect.Y < this.Y + this.Height)
                return this.Y < rect.Y + rect.Height;
            return false;
        }

        public static Rectangle Union(Rectangle a, Rectangle b)
        {
            int x = Math.Min(a.X, b.X);
            int num1 = Math.Max(a.X + a.Width, b.X + b.Width);
            int y = Math.Min(a.Y, b.Y);
            int num2 = Math.Max(a.Y + a.Height, b.Y + b.Height);
            return new Rectangle(x, y, num1 - x, num2 - y);
        }

        public void Offset(Point pos)
        {
            this.Offset(pos.X, pos.Y);
        }

        public void Offset(int x, int y)
        {
            this.X += x;
            this.Y += y;
        }

        public override string ToString()
        {
            return "{X=" + this.X.ToString((IFormatProvider) CultureInfo.CurrentCulture) + ",Y=" +
                   this.Y.ToString((IFormatProvider) CultureInfo.CurrentCulture) + ",Width=" +
                   this.Width.ToString((IFormatProvider) CultureInfo.CurrentCulture) + ",Height=" +
                   this.Height.ToString((IFormatProvider) CultureInfo.CurrentCulture) + "}";
        }
    }
}