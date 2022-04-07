library(igraph)
NW1 <- matrix(c(0,13,0,0, 0,0,0,0,
                13,0,10,10, 0,0,0,0,
                0,10,0,0, 10,10,0,0,
                0,10,0,0, 13,0,13,0,
                0,0,10,13, 0,14,0,0,
                0,0,10,0, 14,0,0,20,
                0,0,0,13, 0,0,0,20,
                0,0,0,0, 0,20,20,0),
              byrow=T, ncol=8)
# 0 1:6 7
rownames(NW1) <- colnames(NW1) <- c("S",1:6,"T")

# shorest path matrix NW1
ig <- graph.adjacency(NW1, mode="undirected", weighted=TRUE)
plot(ig, edge.label=E(ig)$weight)

# get shortest path, start from S end to T, mode=result: all = show all result
ShortPth <- get.shortest.paths(ig, "S", "T", mode="all", output="both")
ShortPth

ecol <- rep("gray80", ecount(ig))
ecol[unlist(ShortPth$epath)] <- "orange"
ew <- rep(2, ecount(ig))
ew[unlist(ShortPth$epath)] <- 4
vcol <- rep("gray40", vcount(ig))
vcol[unlist(ShortPth$vpath)] <- "gold"
plot(ig, vertex.color=vcol, edge.color=ecol, edge.width=ew, edge.arrow.mode=0)
shortest.paths(ig,"S")
