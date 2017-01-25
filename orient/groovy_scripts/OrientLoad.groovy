println "===============Loading the Graph Model============"
s = System.currentTimeMillis()
x = new OrientGraph("plocal:"+args[0])
println System.currentTimeMillis() - s
println "===============Graph Model Loaded================="
x.shutdown()
