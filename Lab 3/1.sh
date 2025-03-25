#!/bin/bash

echo "ALl files in curred directory"
ls *

echo "Shell files in current director"
ls *.sh
echo "Text files in current directory"
ls *.txt

echo "File with exactly 4 character before extenstion"
ls ????.*

echo "Files starting with data"
ls data*

echo "Files excluding those starting with temp"
ls [!t]*

echo "Files excluding those starting with temp"
ls [!'temp']*

echo "All JPG files in the is directory and subdirectory"
find . -name "*.jpg"

#output coming hello not $var
var=Hello
echo "$var"

echo "\$var"

echo "This is a backslash \\"
echo "It's nice day"

ls|sort
cat random.txt
cat random.txt|wc -l
cat random.txt|wc -w
#ps aux
ps aux | grep bash
cat data.txt | tr ' ' '\n'
cat data.txt | tr ' ' '\n' | sort
echo "display disk usage of file"
du -h *
echo "sort using size"
du -h * | sort -h

echo "redirect"

date
#new file will be made ifnot available
date > hell.txt
cat hell.txt
echo "list user"
who > user.txt
cat user.txt
sort fruit.txt > sorted_fruit.txt
cat sorted_fruit.txt

#output date and list of files
{
date
ls
}>output.txt

cat output.txt


wc -w output.txt > count.txt
cat count.txt
awk '{print $1,$4}' identity.txt
#sort by last column
awk '$4 > 20' identity.txt
#count number of file and save in txt file
ls -l|wc -l > count2.txt
cat count2.txt
