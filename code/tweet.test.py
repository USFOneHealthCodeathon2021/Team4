import twint
import datetime
import pandas
# Configure
list_ = ["outage","power out","power outage","pwr out","power failure","without power","power is out",
         "electric is out","electricity out","electricity out","without electricity","lost electricity","lost power" ,
         "#poweroutage", "electricity","failure", "utility", "utilities","power lines", "outage"]

count=2
base = "2018-12-31 12:49:05"
base1 = datetime.datetime.strptime(base,'%Y-%m-%d %H:%M:%S')
date_list = [base1 - datetime.timedelta(days=x) for x in range(360)]

for i in list_:
    print(i)
    c = twint.Config()
    c.Search = i
    c.Pandas = True
    c.Since = "2015-01-01"
    c.Until = "2020-01-01"
    #c.Location = True
    #c.Limit = 1000
    c.Near = "Tampa "
    c.Custom_csv = ["id", "user_id", "username", "date", "tweet"]
    c.Output = f"hh{count}.csv"
    twint.run.Search(c);
    Tweets_df = twint.storage.panda.Tweets_df
    count+=1
    Tweets_df.to_csv(f"hh_{count}.csv")

filenames = [f"hh_{i}.csv" for i in range(2,23)]
combined_los = pd.concat( [pd.read_csv(f"/home/j/jobersta/team4/{f}") for f in filenames] )
