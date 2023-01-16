#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "\n ~~~~~ MY SALON ~~~~~ \n"

echo -e "Welcome to My Salon, how can I help you? \n"

options=$($PSQL "SELECT * FROM services")


OPTIONS(){
echo "$options" | while read service_id BAR name
    do
      echo "$service_id) $name"
    done
    read SERVICE_ID_SELECTED
    answer=$($PSQL "SELECT service_id FROM services where service_id=$SERVICE_ID_SELECTED")

}

OPTIONS

CHECK(){
  if [ -z $answer  ]
   then
   echo -e "\nI could not find that service. What would you like today?" 
   OPTIONS
   CHECK
   fi
}

CHECK

echo -e "\nWhat's your phone number"
read CUSTOMER_PHONE
phone_answer=$($PSQL "SELECT phone FROM customers where phone='$CUSTOMER_PHONE'")

 if [ -z $phone_answer  ]
   then
   echo -e "\nI don't have a record for that phone number, what's your name?" 
   read CUSTOMER_NAME
   else
   exit 0
fi

insert=$($PSQL "Insert into customers(customer_id,phone,name) values(nextVal('seqTest'),'$CUSTOMER_PHONE','$CUSTOMER_NAME')")

service_name=$($PSQL "SELECT name FROM services where service_id=$SERVICE_ID_SELECTED")

echo -e "\nWhat time would you like your $service_name, $CUSTOMER_NAME?"
read SERVICE_TIME

INSERT_APPOINTMENT(){

id_customer=$($PSQL "SELECT customer_id from customers where phone='$1' ")

appointment=$($PSQL "Insert into appointments(appointment_id,customer_id,service_id, time) values(nextVal('seqAppoint'),'$id_customer','$2','$3')")

}

INSERT_APPOINTMENT $CUSTOMER_PHONE $SERVICE_ID_SELECTED $SERVICE_TIME

echo -e "\nI have put you down for a $service_name at $SERVICE_TIME, $CUSTOMER_NAME."

exit 0

