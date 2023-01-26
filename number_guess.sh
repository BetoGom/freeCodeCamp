#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER(){
  secretNumber=$[ $RANDOM % 1000 + 1 ]
   echo $secretNumber
}

RANDOM_NUMBER

echo "Enter your username:"
read USERNAME

idUser=$($PSQL "SELECT id FROM usergames WHERE name = '$USERNAME'")

if [[ -z $idUser ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  insert=$($PSQL "Insert into usergames(id,name,games_played,best_game) values(nextVal('seqId'),'$USERNAME',0,1000)")

else
  gamesPlayed=$($PSQL "SELECT games_played FROM usergames WHERE name = '$USERNAME'")
  bestGame=$($PSQL "SELECT best_game FROM usergames WHERE name = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $gamesPlayed games, and your best game took $bestGame guesses."
fi



echo "Guess the secret number between 1 and 1000:"
read TRY

count=1

TEST_NUMBER(){
  if ! [[ $1 =~ [0-9] ]]
  then
    echo "That is not an integer, guess again:"
   read TRY
  fi
}

TEST_NUMBER $TRY

until [[ $TRY -eq $secretNumber ]]
do
  if [[ $TRY -lt $secretNumber ]]
      then 
       echo "It's higher than that, guess again:"
       read TRY
       TEST_NUMBER $TRY
        ((count+=1))
      else
       echo "It's lower than that, guess again:" 
       read TRY
       TEST_NUMBER $TRY
       ((count+=1))
  fi
done


FINAL_MESSAGE(){
    echo "You guessed it in $1 tries. The secret number was $secretNumber. Nice job!"
}

FINAL_MESSAGE $count

((gamesPlayed+=1))
idUser=$($PSQL "SELECT id FROM usergames WHERE name='$USERNAME'")
bestGame=$($PSQL "SELECT best_game FROM usergames WHERE id=$idUser")


if [[ $count -lt $bestGame ]]
then
  insert=$($PSQL "Update usergames set games_played=$gamesPlayed, best_game=$count where id=$idUser" )
else
  insert=$($PSQL "Update usergames set games_played=$gamesPlayed where id=$idUser" )
fi

exit 0

