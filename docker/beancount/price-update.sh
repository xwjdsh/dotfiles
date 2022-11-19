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
  OLD_VALUE=$(tail -1 $FILE)
  if [ "$NEW_VALUE" != "$OLD_VALUE" ]; then
    echo "$NEW_VALUE" >> $FILE
  fi
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
