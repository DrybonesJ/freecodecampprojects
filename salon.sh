#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "~~~ Salon ~~~\n"

MAIN_MENU() {
  # Get services
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")

  # Display services
  echo "How may we help you today?"
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # Select service
  read SERVICE_ID_SELECTED
  
  # Check to make sure service exists
  SERVICE_VALID=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_VALID ]]
  then
    echo -e "\nPlease select a valid service number\n"
    MAIN_MENU
  else
    # Get customer phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Make sure phone number is formatted correctly
    while [[ ! $CUSTOMER_PHONE =~ ^([0-9]{3})-([0-9]{3})-([0-9]{4})$ ]]
    do
      echo -e "\nPlease format number as ###-###-####. For example: 555-555-5555"
      read CUSTOMER_PHONE
    done

    # Get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # If new customer
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    fi

    # Get appointment time
    echo -e "\nWhat time would you like your appointment to be at?"
    read SERVICE_TIME

    # Make sure time is formatted correctly
    while [[ ! $SERVICE_TIME =~ ^([01]?[0-9]|2[0-3]):([0-5]?[0-9])$ ]]
    do
      echo -e "\nPlease format time as ##:##. For example: 12:34."
      read SERVICE_TIME
    done

    # Insert appointment into database
    INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # Get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    # Success
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
  fi
}

MAIN_MENU