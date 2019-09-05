#!/bin/bash

# 1 - Define path variables
Sar_input=/home/pedro/RUS/LAND06/Input/
Sar_list=/home/pedro/RUS/LAND06/
Path_output=/home/pedro/RUS/LAND06/Processing/

# 2 Define name of variables
cor=Coherence_
undsc=_ 

# 3 Extract list, path of files and dates (please note that you have to change the number after the option <<-f>>, 
# in the 'cut' function, for this example the number <<6>>, accordingly to the length of your path string where it will be the <<_>> 
# underscore character. As an advice test the result with a sigle comamand line just to see what happens, 
# after appyling the 'cut' function to the pathe with the file of interest.
ls -d -1 $Sar_input$S1*.zip > $Sar_list/sar_list.txt
cut -f 6 -d '_' $Sar_list/sar_list.txt > $Sar_list/aux_date.txt
cut -f 1 -d 'T' $Sar_list/aux_date.txt > $Sar_list/date_list.txt
count=`wc -l < $Sar_list/date_list.txt`
a=1; b=2

# 4 Extract specific lines of path from sar list and date list for execution of gpt 
for n in $(seq 1 $((count/2))); do
 i=`sed -n "${a}p" $Sar_list/sar_list.txt`; j=`sed -n "${b}p" $Sar_list/sar_list.txt`
 id=`sed -n "${a}p" $Sar_list/date_list.txt`; jd=`sed -n "${b}p" $Sar_list/date_list.txt`
 date
 gpt /home/pedro/RUS/LAND06/myGraph.xml -Pinput2=$j -Pinput1=$i -Poutput="$Path_output$cor$id$undsc$jd"
 date
 a=$((a+2))
 b=$((b+2))  
done
