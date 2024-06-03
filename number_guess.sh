#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing -t --no-align -c"

# Generate random number
RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))

# Collect username
echo "Enter your username:"
read USERNAME

# Find user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE usernames = '$USERNAME'")

# Check if user_id exists
if [[ -z $USER_ID ]]
then
  # Welcome statement
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  
  # Insert new user into database
  INSERT_USER=$($PSQL "INSERT INTO users(usernames, games_played) VALUES('$USERNAME', 0)")

  # New user indicator
  NEW_USER=0
else
  # Collect user data
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
  USER=$($PSQL "SELECT usernames FROM users WHERE user_id = $USER_ID")

  # Welcome statment
  echo -e "\nWelcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Loop until the secret number is guessed
NUMBER_OF_GUESSES=0
echo "Guess the secret number between 1 and 1000:"
while true
do
  read GUESS

  # Validate input
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES+=1))

  if [[ $GUESS < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    # Update best game
    if [[ $NEW_USER == 0 || $NUMBER_OF_GUESSES < $BEST_GAME ]]
    then
      INSERT_DATA=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE usernames = '$USERNAME'")
    fi

    # Update games played
    INSERT_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE usernames = '$USERNAME' ")

    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    exit
  fi
done