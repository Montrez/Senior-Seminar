# JMJ Travel-Tracker

An automated solution for requesting, approving, and reimbursing corporate travel.



## *Cloning the repository*

To begin, clone the git repo from our team's url and move into the directory:

__git clone https://github.com/VSU-CS-Senior-Seminar/Group-Project-for-Cox-Oldfield-Wa
cd Group-Project-for-Cox-Oldfield-Wardell__

## Install Dependencies, Set Up Database, Launch Server

Execute the config.sh script which is located in the project's root directory. 

__./config.sh__

## Commands in Detail

* #!/usr/bin/env bash
* echo "download gems with bundle"
* bundle
* echo "download yarn modules"
* yarn add axios
* yarn add react-currency-format
* echo "set up the database"
* bin/rails db:drop
* bin/rails db:create
* bin/rails db:migrate
* bin/rails db:seed
* echo "start up the server"
* rails s
