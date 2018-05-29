using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataResolution
{
    public static class TweenExtensions
    {
        public static StringBuilder SerializeObject(this Tweet tweets, string sep)
        {
            StringBuilder param = new StringBuilder();
            var requestProperties = typeof(Tweet).GetProperties();
            foreach (var property in typeof(Tweet).GetProperties())
            {
                var value = property.GetValue(tweets);
                param.Append(value);
                param.Append(sep);
            }
            return param;
        }
    }
}
