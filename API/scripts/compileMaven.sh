# $1: clonePath $2:resultPath $3:currentUserName $4:projectName
cd $1/$3/$4/
mvn compile > ../../../$2/$3.txt