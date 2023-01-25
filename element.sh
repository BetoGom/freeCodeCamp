#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

PRINT_TEXT(){
  echo "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
}

PRINT_INFO(){

#if is a number
if [[ $1 =~ [0-9] ]]
then

  symbol=$($PSQL"SELECT LTRIM(cast(symbol as varchar),'') FROM elements where atomic_number=$1")

  if [ -z $symbol  ]
   then
    echo "I could not find that element in the database."
   else
    name=$($PSQL"SELECT name FROM elements where atomic_number=$1")
    type=$($PSQL"SELECT type2 FROM properties where atomic_number=$1")
    mass=$($PSQL"SELECT LTRIM(cast(atomic_mass as varchar),'') FROM properties where atomic_number=$1")
    melting=$($PSQL"SELECT LTRIM(cast(melting_point_celsius as varchar),'') FROM properties where atomic_number=$1")
    boiling=$($PSQL"SELECT LTRIM(cast(boiling_point_celsius as varchar),'') FROM properties where atomic_number=$1")
    PRINT_TEXT $1 $name $symbol $type $mass $melting $boiling
  fi
#if is the name
elif [[ $1 =~ [A-Z][a-z]+[a-z]+ ]]
then

  atomicId=$($PSQL"SELECT LTRIM(cast(atomic_number as varchar),'') FROM elements where name='$1'")

  if [ -z $atomicId ]
   then
    echo "I could not find that element in the database."
   else
    symbol=$($PSQL"SELECT LTRIM(cast(symbol as varchar),'') FROM elements where atomic_number=$atomicId")
    type=$($PSQL"SELECT type2 FROM properties where atomic_number=$atomicId")
    mass=$($PSQL"SELECT LTRIM(cast(atomic_mass as varchar),'') FROM properties where atomic_number=$atomicId")
    melting=$($PSQL"SELECT LTRIM(cast(melting_point_celsius as varchar),'') FROM properties where atomic_number=$atomicId")
    boiling=$($PSQL"SELECT LTRIM(cast(boiling_point_celsius as varchar),'') FROM properties where atomic_number=$atomicId")
    PRINT_TEXT $atomicId $1 $symbol $type $mass $melting $boiling
  fi

#if is the symbol
elif [[ $1 =~ [A-Z][a-z]? ]]
then
  
  atomicId=$($PSQL"SELECT LTRIM(cast(atomic_number as varchar),'') FROM elements where symbol='$1'")

  if [ -z $atomicId ]
   then
    echo "I could not find that element in the database."
   else
    name=$($PSQL"SELECT name FROM elements where atomic_number=$atomicId")
    type=$($PSQL"SELECT type2 FROM properties where atomic_number=$atomicId")
    mass=$($PSQL"SELECT LTRIM(cast(atomic_mass as varchar),'') FROM properties where atomic_number=$atomicId")
    melting=$($PSQL"SELECT LTRIM(cast(melting_point_celsius as varchar),'') FROM properties where atomic_number=$atomicId")
    boiling=$($PSQL"SELECT LTRIM(cast(boiling_point_celsius as varchar),'') FROM properties where atomic_number=$atomicId")
    PRINT_TEXT $atomicId $name $1 $type $mass $melting $boiling
 fi

else
echo "I could not find that element in the database."
fi

}

if [[ $1 ]]
then 
PRINT_INFO $1
else
echo "Please provide an element as an argument."
fi

#feat commit
#refactor commit
#chore commit
#test commit
exit 0
