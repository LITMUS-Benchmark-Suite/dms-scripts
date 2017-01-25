#This script is to load a graph stored in an XML format, in a Sparksee Database
#The first argument is the number of times which we want to sample the process
#The second argument is the location of the database
#The third argument corresponds to the location of the groovy script.
#The fourth argument corresponds to the location of the log file


for i in $(seq 1 1 $1)
do
	echo "Run Number:$i"
	echo "Run Number:$i" >> $4

	cd /opt/orientdb/bin && sudo ./gremlin.sh -e  $3\ $2 >> $4
done

# Example Run
#./OrientLoad.sh 5 /opt/orientdb/databases/GratefulDeadConcerts/ /home/yashwant/BTP/dms-scripts/orient/groovy_scripts/OrientLoad.groovy /home/yashwant/logs.txt
