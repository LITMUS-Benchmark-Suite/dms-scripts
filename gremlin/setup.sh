if which unzip >/dev/null; then
    echo "unzip exists. Continuing with the procedure"
else
    echo "Installing unzip"
    sudo apt-get install unzip
fi


wget "http://www.tinkerpop.com/downloads/gremlin/gremlin-groovy-2.6.0.zip"
unzip gremlin-groovy-2.6.0.zip


