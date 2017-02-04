# dms-scripts/utilities #

## Introduction ##

The Python scripts which have been provided in this directory will be used to convert the datasets from a RDF/XML Representation to a GraphML file.

The two datasets are:
* [Berlin SPARQL Benchmark Dataset](http://wifo5-03.informatik.uni-mannheim.de/bizer/berlinsparqlbenchmark/spec/Dataset/)
* [Waterloo SPARQL Diversity Test Suite](http://dsg.uwaterloo.ca/watdiv/#dataset)

### BSBM ###
The BSBM dataset is generated using the data generator which is provided as a part of [BSBM tools](https://sourceforge.net/projects/bsbmtools/) .
Installing the BSBM tools package is a  really straigforward process. You only have to extract it and start using the shellscript with a few arguments. 
I ran this command to generate the dataset.

```bash
./generate -s xml -fc -pc 100 -fn /path/to/xml/file
```

The script converts the dataset generated in an XML to the GraphML format using the [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/) module in Python.
Beautiful Soup can be easily installed using pip. The package name for pip is *BeautifulSoup4*.

The [logical schema](http://wifo5-03.informatik.uni-mannheim.de/bizer/berlinsparqlbenchmark/spec/Dataset/) (Section 2.2) for the BSBM dataset has been used heavily to write the parser script.

The Python script works in the following way:
* All the classes which are mentioned in the [logical schema](http://wifo5-03.informatik.uni-mannheim.de/bizer/berlinsparqlbenchmark/spec/Dataset/) are nodes in the graph. There is a *type* attribute in each node which identifies what kind of a node it is (like a Product, ProductType etc) 
* A subject-predicate-object triple is an attribure if the object is not an URI. An attribute with the attribute name set to the Predicate and the with value equal to the object is added to the graph node.
* If the object of a subject-predicate-object triple is an URI, we create an Edge from the subject to the object with the label of the edge set as the predicate.
* All the data is written to a file in the GraphML syntax.

To run the python script
```bash
python3 bsbm.py /path/to/xml/file /path/to/graphml/file
```

The first argument is the path to the XML file which was generated by the BSBM tools package. The second argument is the path where the graphml file should be generated.

A log file by the name of *BSBM.log* will also be generated, in the same directory from where the Python script is run.


## WatDiv ##

The WatDiv also provides a dataset generator which can be downloaded from [here](http://dsg.uwaterloo.ca/watdiv/watdiv_v06.tar). There are a few dependencies which need to be satisfied which have been mentioned [here](http://dsg.uwaterloo.ca/watdiv/) (Section 5). 
The WatDiv dataset generator is more robust, in the sense that you can define probability distribution between two entities to be connected, the attributes, etc. [WatDiv Schema Tutorial] (http://dsg.uwaterloo.ca/watdiv/watdiv-schema-tutorial).

For the task, I used the [following dataset file] (http://dsg.uwaterloo.ca/watdiv/watdiv.10M.tar.bz2).

When the tar file is extracted, there are two text files
* saved.txt
* watdiv.10m.nt

The *saved.txt* file has metadeta aboout how many objects of a Class are there in the *watdiv.10m.nt* file.
The *watdiv.10m.nt* file has all the RDF triples in it.

The python script works in the following way:
* It first parses the *saved.txt* file and creates empty nodes for each of types of class mentioned in the file. There is a *type* attributes associated with every node which tells us what kind of Information it will have.
* The *watdiv.10m.nt* file is parsed now. The approach is similar to that of BSBM dataset.
* The subject-predicate-object triple, in which the object is a URI is an edge, with the label of the edge as predicate.
* The subject-predicate-object triple, in which the object has some text value, is added as an attribute to the node, with the attribute name the same as the predicate and the attribute value equal to object.

To use the Python Script,
```bash
python3 watdiv.py /path/to/file/savd.txt /path/to/file/watdiv.nt /path/to/file/output
```

The first argument is the path to the file *saved.txt*.
The second argument is the path to the file *watdiv.10m.nt*.
The third argument is the path to the file where the GraphML file needs to be stored.

There is no external Python module used for this script. 

