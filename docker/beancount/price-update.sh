#! /bin/bash

set -e

if [ "$#" -ne 2 ] || ! [ -d "$2" ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi

update_file()
{

  FILE=$1
  NEW_VALUE=$2
  NEW_VALUE_DATE=$(echo $NEW_VALUE | awk '{print $1}')
  OLD_VALUE_DATE=$(tail -1 $FILE | awk '{print $1}')
  if [ "$NEW_VALUE_DATE" == "$OLD_VALUE_DATE" ]; then
    head -n -1 $FILE > temp.txt ; mv temp.txt $FILE
  fi
  echo "$NEW_VALUE" >> $FILE
}

case $1 in
  usdjpy|jpyusd|all)
    NV=$(bean-price -e 'JPY:yahoo/JPY=X' | sed -e "s/JPY=X/USD/g")
    update_file "$2/usdjpy.bean" "$NV";;&
  usdcny|cnyusd|all)
    NV=$(bean-price -e 'CNY:yahoo/CNY=X' | sed -e "s/CNY=X/USD/g")
    update_file "$2/usdcny.bean" "$NV";;&
  cnyjpy|jpycny|all)
    NV=$(bean-price -e 'JPY:yahoo/CNYJPY=X' | sed -e "s/CNYJPY=X/CNY/g")
    update_file "$2/cnyjpy.bean" "$NV";;
  *)
    echo "Invalid type: $1" >&2
    exit 1;;
esac
