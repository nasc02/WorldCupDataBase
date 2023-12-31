#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != "winner" ]]
  then
    RESULT_WINNER=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    if [[ -z $RESULT_WINNER ]]
    then
      RESULT_INSERT_QUERY_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $RESULT_INSERT_QUERY_WINNER == "INSERT 0 1" ]]
      then
        echo  "$WINNER inserted into teams(name)"
      fi
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    RESULT_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $RESULT_OPPONENT ]]
    then
      RESULT_INSERT_QUERY_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $RESULT_INSERT_QUERY_OPPONENT == "INSERT 0 1" ]]
      then
        echo  "$OPPONENT inserted into teams(name)"
      fi
    fi
  fi

  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo Game inserted, YEAR: $YEAR, ROUND: $ROUND, $WINNER VS $OPPONENT, score $WINNER_GOALS : $OPPONENT_GOALS
    fi
  fi


done
