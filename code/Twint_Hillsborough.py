import twint
import datetime
import pandas as pd


file1=open("cities.txt", 'r')
cities = file1.readlines()
city_list=[]
for city in cities:
    city=city.strip()
    city_list.append(city)
    
file2=open("word_list.txt", 'r')
words = file2.readlines()
word_list=[]
for word in words:
    word=word.strip()
    word_list.append(word)

count=2
base = "2018-12-31 12:49:05"
base1 = datetime.datetime.strptime(base,'%Y-%m-%d %H:%M:%S')
date_list = [base1 - datetime.timedelta(days=x) for x in range(360)]

for city in city_list:
    for word in word_list:
        print(word)
        c = twint.Config()
        c.Search = word
        c.Pandas = True
        c.Since = "2015-01-01"
        c.Until = "2021-01-01"
        #c.Location = True
        #c.Limit = 1000
        c.Near = "{}".format(city)
        c.Custom_csv = ["id", "user_id", "username", "date", "tweet"]
        c.Output = f"hh{count}{city}.csv"
        twint.run.Search(c);
        Tweets_df = twint.storage.panda.Tweets_df
        count+=1
        Tweets_df.to_csv(f"hh_{count}_{city}.csv")
    
filenames = [f"hh_{word}{city}.csv" for word in word_list for city in city_list]
combined_los = pd.concat( [pd.read_csv(f"/path to/twint_output2/{f}") for f in filenames] )
