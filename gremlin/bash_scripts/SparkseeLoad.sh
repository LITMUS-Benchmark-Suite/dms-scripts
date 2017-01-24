#This script is to load a graph stored in an XML format, in a Sparksee Database
#The first argument is the number of times which we want to sample the process
#The second argument is the location where we want to create a db.
#The third argument is the location of the XML file
#The fourth argument corresponds to the location of the log file

for i in $(seq 1 1 $1)
do
	echo "Run Number:$i"
	echo "Run Number:$i" >> $4
	../gremlin-groovy-2.6.0/bin/gremlin.sh -e ../groovy_scripts/SparkseeLoad.groovy $2 $3 >> $4
done

# Example Run
# ./SparkseeLoad.sh 5 ./HelloWorld.gdb ../gremlin-groovy-2.6.0/data/graph-example-2.xml logs.txt

