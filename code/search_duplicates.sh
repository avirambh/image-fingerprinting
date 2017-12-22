#!/bin/bash

DB_DIR=$1
IMAGES_TO_SEARCH_DIR=$2

\rm -rf my_db
python index.py --dataset $DB_DIR --shelve my_db
images=`ls $IMAGES_TO_SEARCH_DIR`
for i in $images; do
  echo "looking for duplications of $i"
  python search.py --dataset $DB_DIR --shelve my_db --query $IMAGES_TO_SEARCH_DIR/$i
  if [ $? -ne 0 ];then
    read -p "Press Enter to continue" </dev/tty
  fi
done
