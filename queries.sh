#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "Select sum(winner_goals+opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT avg(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(avg(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "Select avg(winner_goals+opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "Select max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "Select count(winner_goals) from games where winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "Select name from teams where team_id=(select winner_id from games where year=2018 and round='Final') ")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "Select name from teams where team_id in (select winner_id from games where year=2014 and round='Eighth-Final') or  team_id in (select opponent_id from games where year=2014 and round='Eighth-Final') ")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "Select name from teams where team_id in (select winner_id from games)")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "Select distinct year, name from (select year, winner_id from games where round='Final' order by year) G inner join teams T on G.winner_id=T.team_id")"


echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "Select name from teams where name like 'Co%'")"
