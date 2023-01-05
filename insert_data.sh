#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATERESULT=$($PSQL "truncate table teams, games")
  { cat games.csv | cut -f3 -d, | sort | uniq; cat games.csv | cut -f4 -d, | sort | uniq; } | sort | uniq | while read TEAM
   do 
   if [[ $TEAM != 'winner' && $TEAM != 'opponent' ]]
   then
    INSERTTEAM=$($PSQL "Insert into teams(name) values('$TEAM')")
   fi
   done 
  TEAMID=$($PSQL "select concat(name,'=', team_id) from teams")
  arr=(`echo ${TEAMID}`);
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
  do
  if [[ $YEAR != 'year' ]]
  then
  for i in "${arr[@]}"
  do
    if [[ $i =~ $WINNER ]]; then
     IFS== read winner1 winner2 <<< $i
    fi
    if [[ $i =~  $OPPONENT ]]; then
     IFS== read opponent1 opponent2 <<< $i
    fi
  done
  INSERTWINNERRESULT=$($PSQL "Insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $winner2, $opponent2, $WINNERGOALS, $OPPONENTGOALS)")
  fi
  done
