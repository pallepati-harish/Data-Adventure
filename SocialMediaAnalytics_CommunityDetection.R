## Social Media Analytics - Community Detection Analysis 
##    (Use Undirected Network)


library(dplyr)
library(igraph)
library(threejs)

# Hypothetical Soccer Network
edgelist_1 <- rbind(c("ronaldo", "messi"),
                    c("ronaldo", "neymar"), 
                    c("ronaldo", "zlatan"), 
                    c("messi", "neymar"), 
                    c("messi", "suarez"),  
                    c("neymar", "suarez"),  
                    c("neymar", "pogba"), 
                    c("salah", "ronaldo"),   
                    c("salah", "messi"),  
                    c("pogba", "zlatan"), 
                    c("pogba", "ronaldo"), 
                    c("pogba", "mbappe"),
                    c("salah", "hazard"), 
                    c("hazard", "fellaini"))



## Plot the Network
gr_best1 <- graph_from_edgelist(edgelist_1, directed = FALSE)   ## undirected network

### Using R's nice_layout
plot(gr_best1, 
     layout = layout_nicely(gr_best1),
     edge.arrow.size = 0.2,
     vertex.size = 25,
     vertex.color = "gold")



  # FastGreedy Community Detection 
    ##(based on modularity index -- 
      ## how interconnected edges are within community vs. between communities) 
fgc1 <- fastgreedy.community(gr_best1)

  ## no. of communities
length(fgc1)

  ## size of the community
sizes(fgc1)

  ## Determine membership
membership(fgc1)
  
  ## Plot the fast greedy community
plot(fgc1, gr_best1)


  # Edge Betweenness Community Detecion
    ## (based on divisive method --
      ## dividng the network in smaller and smaller pieces 
        ##until it find edges it considers to be bridges between communities)
ebc1 <- edge.betweenness.community(gr_best1)

  ## no. of communities
length(ebc1)

  ## size of the community
sizes(ebc1)

  ## Determine membership
membership(ebc1)

  ## Plot the fast greedy community
par(mfrow = c(1, 2))
plot(fgc1, gr_best1)
plot(ebc1, gr_best1)

