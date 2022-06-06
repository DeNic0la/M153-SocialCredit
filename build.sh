#!/bin/bash

# Build Directory Name
DIRECTORY="build"

# Delete Build dir
rm -rf $DIRECTORY

# Create Build Dir
mkdir $DIRECTORY

# Make Files
touch build/M153_Project_Create.sql build/M153_Project_Insert.sql build/M153_Project_Query.sql

FILE=build/M153_Project_Create.sql

# SQL-Skript M153_Project_Create.sql
{ cat Code/create/create*.sql; cat Code/create/procedure*.sql; cat Code/create/procedure*.sql; } >> $FILE


# SQL-Skript M153_Project_Insert.sql
(cat Code/mock_data/data_*.sql ) > build/M153_Project_Insert.sql

# SQL-Skript M153_Project_Query.sql
(cat Code/*.sql ) > build/M153_Project_Query.sql

