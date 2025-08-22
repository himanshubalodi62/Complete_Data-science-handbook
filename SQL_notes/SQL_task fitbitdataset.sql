create database himu;
use himu;
select * from fitbitdata

# Q.3 -> check the datatype of columns ,column already in date #format
select COLUMN_NAME,DATA_TYPE from INFORMATION_SCHEMA. COLUMNS where table_schema = 'TASK' and table_name = 'FITBITDATA';

# Q.4 -> check distinct id's from dataset?
select count(Distinct(Id)) from fitbitdata;

# Q.5 -> evaluate active person in dataset?
select Id ,sum(TotalSteps) as TotalSteps
from fitbitdata
group by Id
Order by TotalSteps desc limit 3;

# Q.6 -> comparison of active vs inactive persons?
select(select count(distinct(Id)) from fibitdata where LoggedActivitiesDistance != '0.0') as IDS_which_LOGGED_ONCE,
count(distinct(Id)) - (select count(distinct(Id)) from fitbitdata where LoggedActivitiesDistance != '0.0') as IDS_never_LOGGED
from fitbitdata;
        



