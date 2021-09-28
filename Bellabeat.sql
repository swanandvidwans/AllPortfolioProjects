-- Lets look at the data
use bellabeat;
select * from Daily_data$;

-- Lets look at the participants
select count(distinct Id)
from Daily_data$;

select distinct id
from Daily_data$;

-- Lets Look at the description of Total Steps
select Id, min(totalSteps) as Minimum_Steps, cast(AVG(totalSteps) as int) as Average_Steps, max(totalSteps) as Maximum_Steps
from Daily_data$
group by Id;

-- Lets look at overall average, minimum and maximum values of attributes from activities table
select  min(totalSteps) as Minimum_Steps, cast(AVG(totalSteps) as int) as Average_Steps, max(totalSteps) as Maximum_Steps
from Daily_data$;

select * from activity$;

-- Minimum, Maximum and Average Steps
select  min(totalSteps) as Minimum_Steps, cast(AVG(totalSteps) as int) as Average_Steps, max(totalSteps) as Maximum_Steps
from activity$;

-- Minimum, Maximum and Average Distance
select  min(totalDistance) as Minimum_Distance, round(AVG(totalDistance),2) as Average_Distance, round(max(totalDistance),2) as Maximum_Distance
from activity$;

-- Min, Max and Avg sedentary time
select  min(SedentaryMinutes) as Minimum_SM, round(AVG(SedentaryMinutes),2) as Average_SM, round(max(SedentaryMinutes),2) as Maximum_SM
from activity$;

-- Min, Max and Avg Calories
select  min(calories) as Minimum_calories, round(AVG(Calories),2) as Average_calories, round(max(Calories),2) as Maximum_calories
from activity$;

-- Number of active minutes per category
select  min(VeryActiveMinutes) as Minimum_vam, cast(AVG(VeryActiveMinutes) as int) as Average_vam, max(VeryActiveMinutes) as Maximum_vam
from activity$;

-- Min, Max and Average Fairly Active time
select  min(FairlyActiveMinutes) as Minimum_fam, cast(AVG(FairlyActiveMinutes) as int) as Average_fam, max(FairlyActiveMinutes) as Maximum_fam
from activity$;

-- Min, Max and Avg lightly Active time
select  min(LightlyActiveMinutes) as Minimum_lam, cast(AVG(LightlyActiveMinutes) as int) as Average_lam, max(LightlyActiveMinutes) as Maximum_lam
from activity$;

-- About Calories
select  min(Calories) as Minimum_cal, cast(AVG(Calories) as int) as Average_cal, max(Calories) as Maximum_cal
from calories$;

-- About sleep
select  min(TotalMinutesAsleep) as Minimum_sleep, cast(AVG(TotalMinutesAsleep) as int)/60 as Average_sleep, round(max(TotalMinutesAsleep)/60,2) as Maximum_sleep
from sleep$;

-- About weight
select  min(WeightKg) as Minimum_weight, cast(AVG(WeightKg) as int) as Average_weight, max(WeightKg) as Maximum_weight
from weight$;

select * from weight$

-- About BMI
select  min(BMI) as Minimum_BMI, cast(AVG(BMI) as int) as Average_BMI, max(BMI) as Maximum_BMI
from weight$;

/*
Some interesting discoveries from this summary:

Average sedentary time is 991 minutes or 16 hours. Definately needs to be reduced!
The majority of the participants are lightly active.
On the average, participants sleep 1 time for 7 hours.
Average total steps per day are 7638 which a little bit less for having health benefits for according to the CDC research. They found that taking 8,000 steps per day was associated with a 51% lower risk for all-cause mortality (or death from all causes). Taking 12,000 steps per day was associated with a 65% lower risk compared with taking 4,000 steps.
*/


