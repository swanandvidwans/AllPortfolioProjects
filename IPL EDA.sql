-- Lets take a look at the data
use IPL;
select * from ['IPL Ball-by-Ball 2008-2020$'];

-- Look at the different sections of data
select distinct batsman from ['IPL Ball-by-Ball 2008-2020$'];
select distinct bowler from ['IPL Ball-by-Ball 2008-2020$'];

-- Top 10 batsman by runs
select top 10 batsman, sum(batsman_runs) as Runs 
from ['IPL Ball-by-Ball 2008-2020$']
group by batsman
order by Runs desc;

-- Top 10 bowlers by wickets
select top 10 bowler, sum(is_wicket) as Wickets
from ['IPL Ball-by-Ball 2008-2020$']
group by bowler
order by Wickets desc;

-- Most Sixes
select top 10 batsman, count(batsman_runs) as Sixers
from ['IPL Ball-by-Ball 2008-2020$']
where batsman_runs = 6
group by batsman
order by Sixers desc;

-- Most Fours
select top 10 batsman, count(batsman_runs) as Fours
from ['IPL Ball-by-Ball 2008-2020$']
where batsman_runs = 4
group by batsman
order by Fours desc;

-- Most Boundaries
select top 10 batsman, count(batsman_runs) as Boundaries
from ['IPL Ball-by-Ball 2008-2020$']
where batsman_runs = 4 or batsman_runs = 6
group by batsman
order by Boundaries desc;

-- Most Extras
select top 10 bowler, count(extras_type) as Extras
from ['IPL Ball-by-Ball 2008-2020$']
where extras_type != 'NA'
group by bowler
order by Extras desc;

-- Most Catches / Run Out
select top 10 fielder, count(fielder) as Dismisslas
from ['IPL Ball-by-Ball 2008-2020$']
where fielder != 'NA'
group by fielder
order by Dismisslas desc;

-- Most Catches
select top 10 fielder, count(fielder) as Dismisslas
from ['IPL Ball-by-Ball 2008-2020$']
where dismissal_kind = 'caught'
group by fielder
order by Dismisslas desc;

-- Most Bowled Dismissals
select top 10 bowler, count(fielder) as Dismisslas
from ['IPL Ball-by-Ball 2008-2020$']
where dismissal_kind = 'bowled'
group by bowler
order by Dismisslas desc;

-- Best strike rate
select top 5 batsman, 100 * sum(batsman_runs)/count(ball) as Strike_Rate
from ['IPL Ball-by-Ball 2008-2020$']
group by batsman
having sum(batsman_runs)>=1000
order by Strike_Rate desc;

-- Most number of balls bowled
select top 5 bowler, count(ball) as BallsBowled
from ['IPL Ball-by-Ball 2008-2020$']
group by bowler
order by BallsBowled desc;

-- Best bowler SR
select  top 5 bowler, count(bowler)/sum(is_wicket) AS Bowler_SR
from ['IPL Ball-by-Ball 2008-2020$']
group by bowler
having sum(is_wicket) >= 100
order by Bowler_SR Asc;

-- Best Bowler Average
select  top 5 bowler, sum(total_runs)/sum(is_wicket) AS Bowler_SR
from ['IPL Ball-by-Ball 2008-2020$']
group by bowler
having sum(is_wicket) >= 100
order by Bowler_SR Asc;

-- Economy Rate
select  top 5 bowler,6 * sum(total_runs)/count(bowler) AS Economy_Rate
from ['IPL Ball-by-Ball 2008-2020$']
group by bowler
having sum(is_wicket) >= 100
order by Economy_Rate Asc;

-----------------------------------------------------------------------------------------------------------------------
-- Lets look at the match data
select * from ['IPL Matches 2008-2020$'];

-- Update repeated values for venue
update ['IPL Matches 2008-2020$']
set venue = REPLACE(venue,'M Chinnaswamy Stadium', 'M.Chinnaswamy Stadium') from ['IPL Matches 2008-2020$'];

-- Lets look at the matches played at different venues
select venue, count(venue) as Matches from ['IPL Matches 2008-2020$']
group by venue
order by Matches desc;

-- Toss decisions
select toss_decision, count(toss_decision) 
from ['IPL Matches 2008-2020$']
group by toss_decision;

-- Toss Winners
select toss_winner, count(toss_winner) as lucky 
from ['IPL Matches 2008-2020$']
group by toss_winner
order by lucky desc;

-- Player of Match
select top 10 player_of_match, count(player_of_match) as counts
from ['IPL Matches 2008-2020$']
group by player_of_match
order by counts desc;

-- Lets get serious now, who won the most IPL matches
select winner, count(winner) as counts
from ['IPL Matches 2008-2020$']
group by winner
order by counts desc;

---------------------------------------------------------------------------------------------------------------------------
--Lets discuss AB Devilliers
--Between overs 1 to 5:
select batsman, 100 * round((sum(batsman_runs)/count(ball)),4) as Strike_Rate
from ['IPL Ball-by-Ball 2008-2020$']
where over_no <= 4 and batsman = 'AB de Villiers'
group by batsman;

-- Between overs 6 to 10:
select batsman, 100 * round((sum(batsman_runs)/count(ball)),4) as Strike_Rate
from ['IPL Ball-by-Ball 2008-2020$']
where over_no > 4  and over_no <= 9 and batsman = 'AB de Villiers'
group by batsman
order by Strike_Rate desc;

-- Between overs 11 to 15:
select batsman, 100 * round((sum(batsman_runs)/count(ball)),4) as Strike_Rate
from ['IPL Ball-by-Ball 2008-2020$']
where over_no > 9  and over_no <= 14 and batsman = 'AB de Villiers'
group by batsman
order by Strike_Rate desc;

-- Between overs 16 to 20:
select batsman, 100 * round((sum(batsman_runs)/count(ball)),4) as Strike_Rate
from ['IPL Ball-by-Ball 2008-2020$']
where over_no > 14 and batsman = 'AB de Villiers'
group by batsman
order by Strike_Rate desc;

-- Count of Fours 
select batsman, count(batsman_runs) as fours
from ['IPL Ball-by-Ball 2008-2020$']
where batsman_runs = 4 and batsman = 'AB de Villiers'
group by batsman;

-- Count of Sixes
select batsman, count(batsman_runs) as sixes
from ['IPL Ball-by-Ball 2008-2020$']
where batsman_runs = 6 and batsman = 'AB de Villiers'
group by batsman;




-- Now, Lets discuss Malinga
-- Economy Rate for first 5 overs
select bowler, 6 * sum(total_runs)/count(bowler) as Economy_Rate
from ['IPL Ball-by-Ball 2008-2020$']
WHERE over_no<=4 and bowler = 'SL Malinga'
group by bowler;

-- Economy Rate between overs 6 to 10
select bowler, 6 * sum(total_runs)/count(bowler) as Economy_Rate
from ['IPL Ball-by-Ball 2008-2020$']
WHERE over_no>4 and over_no<=9 and bowler = 'SL Malinga'
group by bowler;

-- Economy Rate between overs 11 to 15
select bowler, 6 * sum(total_runs)/count(bowler) as Economy_Rate
from ['IPL Ball-by-Ball 2008-2020$']
WHERE over_no>9 and over_no<=14 and bowler = 'SL Malinga'
group by bowler;

-- Economy Rate between overs 16 to 20
select bowler, 6 * sum(total_runs)/count(bowler) as Economy_Rate
from ['IPL Ball-by-Ball 2008-2020$']
WHERE over_no>14 and bowler = 'SL Malinga'
group by bowler;
