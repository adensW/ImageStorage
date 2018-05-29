#!/usr/bin/python3
# -*- coding:utf8 -*-
import codecs
from os import listdir
from os.path import isfile, join
twitter=[]
twitterStack =[]
TimeStr = 'Time'
HashtagStr = 'Hashtags'
def getFiles(mypath):
    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
    return onlyfiles

def loaddata(filepath):
    f = open(filepath, 'r',encoding="utf8")
    return f

def tweetStream(stream):
    twitterStream=[]
    for line in stream.readlines():
        if(line.startswith('***')&len(twitterStack)==0):
            #start tweet
            twitterStack.append(line)
        elif (line.startswith('***')&len(twitterStack)>0):
            for t in twitterStack:
                
                if(t.startswith(TimeStr,0,len(t))):
                    str= t
                   
                    twitter.append(str[5:len(str)])
                if(t.startswith(HashtagStr,0,len(t))):
                
                    str= t
                    
                    twitter.append(str[9:len(str)])
            twitterStream.append(twitter)
            twitterStack.clear()
    stream.close()
    return twitterStream

def singleUsingData(stream):
    pass

def singleToStream(stream):
    pass

def WriteToCSV(stream):
    pass
# f = open('/1376531', 'r')
mypath = 'E:/毕业设计/program/data/'
files = getFiles(mypath)
print(files)
for file in files:
    filedata = loaddata(mypath+file)
    print(len(tweetStream(filedata)))



