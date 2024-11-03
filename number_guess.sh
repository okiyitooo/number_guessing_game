#!/bin/bash

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER=$($PSQL "SELECT name, games_played, best_game FROM users WHERE name='$USERNAME'")
if [[ -z $USER ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
else
  echo $USER | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME; do
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))

GAME() {
  #guess is not integer
  if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read NEW_GUESS
    GAME $NEW_GUESS
  # too high
  elif [[ $1 -gt $SECRET_NUMBER ]]; then
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    echo "It's lower than that, guess again:"
    read NEW_GUESS
    GAME $NEW_GUESS
  # too low
  elif [[ $1 -lt $SECRET_NUMBER ]]; then
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    echo "It's higher than that, guess again:"
    read NEW_GUESS
    GAME $NEW_GUESS
  # correct answer
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    UPDATE_USERS_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE name='$USERNAME';")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")
    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE name='$USERNAME';")
    fi
  fi
}
GAME $GUESS