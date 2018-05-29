using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataResolution
{
    class Program
    {
        //***
        //Type:status
        //Origin: My Top 3 #lastfm Artists: Jane's Addiction (3), Stars (3) & The Cure (2) http://bit.ly/dQFbfz
        //Text: My Top 3  Artists: Jane's Addiction (3), Stars (3) & The Cure (2) 
        //URL: http://bit.ly/dQFbfz
        //ID: 81749560074055683
        //Time: Fri Jun 17 10:46:28 CDT 2011
        //RetCount: 0
        //Favorite: false
        //MentionedEntities: 
        //Hashtags:  lastfm
        //***
        List<string> TypeCollection = new List<string>();
        List<string> HashTagCollection = new List<string>();
        static void Main(string[] args)
        {
           
            List<Tweet> TweetStream = new List<Tweet>();
            const int ChunkSize = 100;
            int currentNum = 0;
            int fileName = 0;
            FileReader fileReader = new FileReader();
            CompareTool compareTool = new CompareTool();
            var files = fileReader.ReadFilePath(@"E:\毕业设计\program\data");
            StreamReader sr = new StreamReader(files[0], Encoding.Default);
            String line;
            bool isEnd = true;
            while ((line = sr.ReadLine()) != null)
            {
                //initialize a tweet
                Tweet tweet = new Tweet();
                if (line.StartsWith("***"))
                {
                    isEnd = !isEnd;
                    if (isEnd)
                    {
                        //write to TweetStream
                        Console.WriteLine("current number:{0}", currentNum);
                        Console.WriteLine("HashTag:{0}", tweet.HashTag);
                        TweetStream.Add(tweet);
                        currentNum += 1;
                        if (currentNum >= ChunkSize)
                        {
                            //Write To file
                            string path = @"E:\毕业设计\program\WorkDate";
                            fileReader.FileWrite(path + fileName.ToString() + ".txt", TweetStream);
                            currentNum = 0;
                        }
                    }
                    continue;
                }
                if (!isEnd)
                {
                    
                    //type
                    if (line.ToLower().StartsWith("type"))
                    {
                        string type = line.Split(':')[1].TrimStart().TrimEnd();
                        tweet.type = compareTool.CompareType( type);
                        continue;
                    }
                    //hasUrl
                    if (line.ToLower().StartsWith("url"))
                    {
                        string url = line.Split(':')[1].TrimStart().TrimEnd();
                        tweet.hasUrl = Convert.ToInt32(url.Length>0);
                        continue;
                    }
                    //RetCount
                    if (line.ToLower().StartsWith("RetCount".ToLower()))
                    {
                        string RetCount = line.Split(':')[1].TrimStart().TrimEnd();
                        tweet.RetCount = Convert.ToInt32(RetCount);
                        continue;
                    }
                    //Favorite
                    if (line.ToLower().StartsWith("Favorite".ToLower()))
                    {
                        string Favorite = line.Split(':')[1].TrimStart().TrimEnd();
                        tweet.Favorite = Convert.ToInt32(Favorite.ToLower()=="false");
                        continue;
                    }
                    //HashTag
                    if (line.ToLower().StartsWith("Hashtags".ToLower()))
                    {
                        string hashTag = line.Split(':')[1].TrimStart().TrimEnd();
                        tweet.HashTag = compareTool.CompareHashTag( hashTag);
                        continue;
                    }
                    
                   
                }
            }
            foreach (var file in files)
            {
                Console.WriteLine(file);
            }
            Console.ReadKey();
        }
       
    }
}
