#!/usr/bin/env bash

echo "download gems with bundle"
bundle


echo "download yarn modules"
yarn install
yarn add axios
yarn add react-currency-format

echo "set up the database"
bin/rails db:drop
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

echo "start up the server"
rails s
