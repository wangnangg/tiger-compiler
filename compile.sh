#!/bin/bash

testlist=$(ls $1)
echo $testlist
for file in $testlist;
do
echo
echo
echo vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
echo testing $file
if test -z $2; then
    cat $file
    echo -----------------------------------------------
    sed "s:\$1:$file:g" live_template.sml | sml
    ret=$?
else
    sed "s:\$1:$file:g" live_template.sml | sml
    ret=$?
fi
echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
echo
echo
done

