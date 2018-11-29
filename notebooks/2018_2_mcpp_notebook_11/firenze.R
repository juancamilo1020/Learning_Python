#### **** Marriage in Renaissance Florence **** ####

install.packages("igraph")
## load the igraph package
library(igraph)

florence <- as.matrix(read.table("firenze.txt"))

## create the graph object
marriage <- graph.edgelist(florence, directed=FALSE)

## set some color atributes (V() gives back the 'vertices' = nodes)
V(marriage)$color = "pink"
V(marriage)["Medici"]$color <- "turquoise"
V(marriage)$frame.color = 0
V(marriage)$label.color = "black"

## plot it
plot(marriage, edge.curved=FALSE)

## print the degree for each family
sort(degree(marriage))

## print the betweenness for each family
sort(round(betweenness(marriage),1))
