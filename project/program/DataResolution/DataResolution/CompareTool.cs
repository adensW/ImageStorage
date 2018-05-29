using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataResolution
{
    class CompareTool
    {
        List<string> TypeCollection = new List<string>();
        List<string> HashTagCollection = new List<string>();
        public int CompareType(string value)
        {
            bool isIn = false;
            for (int i = 0; i < TypeCollection.Count && !isIn; i++)
            {
                if (value.Equals(TypeCollection[i]))
                {
                    isIn = true;
                    return i;
                }
            }
            if (!isIn)
            {
                TypeCollection.Add(value);
            }
            return TypeCollection.Count;
        }
        public int CompareHashTag(string value)
        {
            bool isIn = false;
            for (int i = 0; i < HashTagCollection.Count && !isIn; i++)
            {
                if (value.Equals(HashTagCollection[i]))
                {
                    isIn = true;
                    return i;
                }
            }
            if (!isIn)
            {
                HashTagCollection.Add(value);
            }
            return HashTagCollection.Count;
        }
        public int IsInCollection(ref List<string> collection,string value)
        {
            bool isIn = false;
            for(int i = 0; i < collection.Count&&!isIn; i++)
            {
                if (value.Equals(collection[i]))
                {
                    isIn = true;
                    return i;
                }
            }
            if (!isIn)
            {
                collection.Add(value);
            }
            return collection.Count;
        }
    }
}
