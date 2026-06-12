#!/bin/bash

# index is start from 0, size is 3
FRUITS=("Apple" "KIWI" "ORANGE") #Array

echo "First Fruit is: ${FRUITS[0]}"
echo "second Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"

echo "All Fruits is: ${FRUITS[@]}"