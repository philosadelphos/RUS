#!/bin/bash

# 1 - Define path variables
Path_input1=/shared/Training/LAND06_UrbanClassification_Germany/Original/Input1
Path_input2=/shared/Training/LAND06_UrbanClassification_Germany/Original/Input2
Path_output=/shared/Training/LAND06_UrbanClassification_Germany/Processing/

# 2-Define name of variables
oldEnd=.zip
cor=Coherence_
undsc=_

#3 Extract Data and Run GPT
for i in $(ls -d -1 $Path_input1$S1A*.zip)
do
	for j in $(ls -d -1 $Path_input2$S1A*.zip)
	do
	n=${i%.*}
	n=${i%T*}
	n=${n#"${n%_*}_"}
	m=${i%.*}
	m=${i%T*}
	m=${n#"${n%_*}_"}
		date
		gpt /shared/Training/LAND06_UrbanClassification_Germany/AuxData/myGraph_gpt.xml -Pinput1=i -Pinput2=j -Poutput="$Path_output$cor$n$undsc$m"
		date
done
