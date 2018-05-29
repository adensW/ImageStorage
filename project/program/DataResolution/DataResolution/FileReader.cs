using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataResolution
{
    class FileReader
    {
        public List<string> ReadFilePath(string path)
        {
            List<string> Files = new List<string>();
            DirectoryInfo folder = new DirectoryInfo(path);

            foreach (FileInfo file in folder.GetFiles("*"))
            {
                Files.Add(file.FullName);
            }
            return Files;
        }
        public void FileWrite(string path,string value)
        {
            FileStream fs = new FileStream(path, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            //开始写入
            sw.Write(value);
            //清空缓冲区
            sw.Flush();
            //关闭流
            sw.Close();
            fs.Close();
        }
        public void FileWrite(string path, List<Tweet> value)
        {
            FileStream fs = new FileStream(path, FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            //开始写入
            foreach(Tweet v in value)
            {
                sw.Write(v.SerializeObject(","));
            }
            //清空缓冲区
            sw.Flush();
            //关闭流
            sw.Close();
            fs.Close();
        }
        
    }
}
