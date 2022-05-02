load.libraries <- c('tidyverse', 'mosaic', 'MASS', 'FNN', 'gamlr', 'glmnet', 'randomForest', 'kableExtra', 'data.table', 'sjmisc', 'sjPlot', 'sjlabelled', 'LICORS', 'foreach', 'cluster', 'factoextra', 'knitr', 'GGally', 'scales', 'lubridate', 'gridExtra', 'grid', 'lattice', 'arules', 'arulesViz', 'igraph', 'png')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependences = TRUE)
sapply(load.libraries, require, character = TRUE)

#QUESTION 1
wine <- read_csv("https://raw.githubusercontent.com/jgscott/ECO395M/master/data/wine.csv")

p1 <- qplot(x = color, y = fixed.acidity, data = wine, geom = "boxplot")
p2 <- qplot(x = color, y = volatile.acidity, data = wine, geom = "boxplot")
p3 <- qplot(x = color, y = citric.acid, data = wine, geom = "boxplot")
p4 <- qplot(x = color, y = residual.sugar, data = wine, geom = "boxplot")
p5 <- qplot(x = color, y = chlorides, data = wine, geom = "boxplot")
p6 <- qplot(x = color, y = free.sulfur.dioxide, data = wine, geom = "boxplot")
p7 <- qplot(x = color, y = total.sulfur.dioxide, data = wine, geom = "boxplot")
p8 <- qplot(x = color, y = density, data = wine, geom = "boxplot")
p9 <- qplot(x = color, y = pH, data = wine, geom = "boxplot")
p10 <- qplot(x = color, y = sulphates, data = wine, geom = "boxplot")
p11 <- qplot(x = color, y = alcohol, data = wine, geom = "boxplot")
p12 <- qplot(x = color, y = quality, data = wine, geom = "boxplot")

grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, nrow = 3, top = "Figure 1.1 Boxplots of chemical properties of white and red wines")

# K-means clustering to distinguish colors of wine

# Center and scale the data
x_wine <- wine[,(1:11)]
x_wine <- scale(x_wine, center=TRUE, scale=TRUE)

# Run k-means with 2 clusters and 25 starts
set.seed(1)
clust1 <- kmeanspp(x_wine, 2, nstart=25) #automatically pick the best one

p1.1 <- qplot(fixed.acidity, residual.sugar , data=wine, color=factor(clust1$cluster))

p1.2 <- qplot(fixed.acidity, residual.sugar , data=wine, color=factor(wine$color))

grid.arrange(p1.1, p1.2, nrow = 2, top = "Figure 1.2. Results of K-means clustering for wine colors in the dimensions of fixed acidity and residual sugar")

p1.3 <- qplot(total.sulfur.dioxide, volatile.acidity, data=wine, color=factor(clust1$cluster))

p1.4 <- qplot(total.sulfur.dioxide, volatile.acidity, data=wine, color=factor(wine$color))

grid.arrange(p1.3, p1.4, nrow = 2, top = "Figure 1.3 Results of K-means clustering for wine colors in the dimensions of total sulfur dioxide and volatile acidity")

#PCA
pca_wine <- prcomp(x_wine, scale = TRUE, center = TRUE)
summary_pca_wine <- data.frame(summary(pca_wine)$importance)
summary_pca_wine <- summary_pca_wine[ , 1:11]
kable(summary_pca_wine, caption="**Table 1.1. Summary table of PCA to distinguish colors**", format_caption = c("italic", "underline"), booktabs = TRUE) %>%
    kable_styling(bootstrap_options = "striped", full_width = T)

plot(pca_wine, main = "Figure 1.4. Proportions of variance explained by\n each principal component", xlab='Principal Components')
loadings <- pca_wine$rotation #red v vector

rotation_pca_wine <- data.frame(round(pca_wine$rotation[, 1:5], 2))
kable(rotation_pca_wine, caption="**Table 1.2. Loadings of the first five principal components**", format_caption = c("italic", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = F)

scores <- pca_wine$x
qplot(scores[, 1], scores[, 2], color = wine$color, xlab = 'Component 1', ylab = 'Component 2', main = "Figure 1.5. Results of PCA for wine colors in the dimensions of first two principal components")

#k-means with PCA
clust1_pca <- kmeanspp(scores[,1:5], 2, nstart = 20)

p3.1 <- qplot(fixed.acidity, residual.sugar , data=wine, color=factor(clust1_pca$cluster))
p3.2 <- qplot(fixed.acidity, residual.sugar , data=wine, color=factor(wine$color))

grid.arrange(p3.1, p3.2, nrow = 2, top = "Figure 1.6 Results of K-means clustering via PCA for wine colors in the dimensions of fixed acidity and residual sugar") 

totwithinbetweenss <- rbind("Total within-cluster sum of squares of Basic clustering " = clust1$tot.withinss, 
                           "Total within-cluster sum of squares of Clustering via PCA " = clust1_pca$tot.withinss, 
                           "Between-cluster sum of squares of Basic clustering " = clust1$betweenss, 
                           "Between-cluster sum of squares of Clustering via PCA " = clust1_pca$betweenss)
kable(totwithinbetweenss, caption="**Table 1.3 : Evaluating in-sample fit of two clusterings**")%>%
    kable_styling(full_width = FALSE)

#wine qualities
wine$qualityindicator <- 
    ifelse(wine$quality <= 4, 'low', 
           ifelse(wine$quality <= 7, 'medium', 'high'))

wine$qualityindicator <- factor(wine$qualityindicator , levels=c("low", "medium", "high"))

pq1 <- qplot(x = qualityindicator, y = fixed.acidity, data = wine, geom = "boxplot")
pq2 <- qplot(x = qualityindicator, y = volatile.acidity, data = wine, geom = "boxplot")
pq3 <- qplot(x = qualityindicator, y = citric.acid, data = wine, geom = "boxplot")
pq4 <- qplot(x = qualityindicator, y = residual.sugar, data = wine, geom = "boxplot")
pq5 <- qplot(x = qualityindicator, y = chlorides, data = wine, geom = "boxplot")
pq6 <- qplot(x = qualityindicator, y = free.sulfur.dioxide, data = wine, geom = "boxplot")
pq7 <- qplot(x = qualityindicator, y = total.sulfur.dioxide, data = wine, geom = "boxplot")
pq8 <- qplot(x = qualityindicator, y = density, data = wine, geom = "boxplot")
pq9 <- qplot(x = qualityindicator, y = pH, data = wine, geom = "boxplot")
pq10 <- qplot(x = qualityindicator, y = sulphates, data = wine, geom = "boxplot")
pq11 <- qplot(x = qualityindicator, y = alcohol, data = wine, geom = "boxplot")

grid.arrange(pq1, pq2, pq3, pq4, pq5, pq6, pq7, pq8, pq9, pq10, pq11, nrow = 3, top = "Figure 1.7. Boxplots of chemical properties of three wine quality levels")

# K-means clustering to distinguish between higher and lower quality levels of wines
set.seed(2)

clust_quality <- kmeanspp(x_wine, 3, nstart=25)

pq1.1 <- qplot(alcohol, volatile.acidity,  data=wine, color=factor(clust_quality$cluster), alpha=I(0.3))
pq1.2 <- ggplot(wine, aes(x=alcohol, y = volatile.acidity, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high", "medium")))
pq1.8 <- ggplot(wine, aes(x=alcohol, y = volatile.acidity, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high")))
pq1.5 <- ggplot(wine, aes(free.sulfur.dioxide, chlorides))+
    geom_point(aes(color=factor(clust_quality$cluster),alpha = I(0.3)))
pq1.6 <- ggplot(wine, aes(x=free.sulfur.dioxide, y = chlorides, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high","medium")))
pq1.10 <- ggplot(wine, aes(x=free.sulfur.dioxide, y = chlorides, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high")))
grid.arrange(pq1.1, pq1.5, pq1.2, pq1.6, pq1.8, pq1.10, nrow = 3, top = "Figure 1.9. Results of K-means clustering for wine qualities.")

# Prinicipal Components Analysis (PCA) to distinguish between higher and lower quality levels of wines

pc_wine_qualities <- prcomp(x_wine, scale = TRUE)
scores2 <- pc_wine_qualities$x
qplot(scores2[, 1], scores2[, 2], color = wine$qualityindicator, xlab = 'Component 1', ylab = 'Component 2', main = "Figure 1.10. Results of PCA for wine qualities in the dimensions of first two principal components", alpha = I(0.1))

#k-means with pca
set.seed(3)
pc <- kmeanspp(scores2[,1:5], 3, nstart=20)
pq1.11 <- qplot(alcohol, volatile.acidity,  data=wine, color=factor(pc$cluster), alpha=I(0.3))
pq1.12 <- ggplot(wine, aes(x=alcohol, y = volatile.acidity, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high", "medium")))
pq1.18 <- ggplot(wine, aes(x=alcohol, y = volatile.acidity, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high")))
pq1.15 <- ggplot(wine, aes(free.sulfur.dioxide, chlorides))+
    geom_point(aes(color=factor(pc$cluster),alpha = I(0.3)))
pq1.16 <- ggplot(wine, aes(x=free.sulfur.dioxide, y = chlorides, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high","medium")))
pq1.110 <- ggplot(wine, aes(x=free.sulfur.dioxide, y = chlorides, color=qualityindicator, alpha = I(0.3)))+
    geom_point(data = subset(wine, qualityindicator %in% c("low","high")))
grid.arrange(pq1.11, pq1.15, pq1.12, pq1.16, pq1.18, pq1.110, nrow = 3, top = "Figure 1.11. Results of K-means clustering via PCA for wine qualities.")

#SSE comparison qualities
totwithinbetweenss <- rbind("Total within-cluster sum of squares of Basic clustering " = clust_quality$tot.withinss, 
                           "Total within-cluster sum of squares of Clustering via PCA " = pc$tot.withinss, 
                           "Between-cluster sum of squares of Basic clustering " = clust_quality$betweenss, 
                           "Between-cluster sum of squares of Clustering via PCA " = pc$betweenss)

kable(totwithinbetweenss, caption="**Table 1.4 : Evaluating in-sample fit of two clusterings**")%>%
    kable_styling(full_width = FALSE)

#QUESTION 2
social_marketing <- read_csv("https://raw.githubusercontent.com/jgscott/ECO395M/master/data/social_marketing.csv")

social_marketing <- filter(social_marketing, social_marketing$spam == 0 & socialmarketingraw$adult == 0)

x <- social_marketing[ , c(-1, -36, -37)]
x <- x/rowSums(x)
x_scale <- scale(x, center = TRUE, scale = TRUE)

n <- nrow(x_scale)
k_grid <- seq(2, 20, by = 1)
CH_grids <- foreach(k = k_grid, .combine='c') %do% {
    cluster_ks = kmeans(x_scale, k, nstart=25)
    W = cluster_ks$tot.withinss
    B = cluster_ks$betweenss
    CH = (B/W)*((n-k)/(k-1))
}

plot(k_grid, CH_grids, main="Figure 2.1 CH Index") #choose k=10

# The Result of K-means
set.seed(1)
clust_k <- kmeans(x_scale, 10, nstart = 25)

result <- data.frame(clust_k$cluster) #which cluster?

resultCombinedData <- cbind(x, result$clust_k.cluster)

table_kmeans <- data.frame("Cluster" = character(7))

for (i in 1:10) {
    Cluster = filter(resultCombinedData, result$clust_k.cluster == i)
    ClusterMeans = as.data.table(colMeans(Cluster), keep.rownames=TRUE)
    colnames(ClusterMeans) <- c("Categories", "Cluster Means")
    ClusterMeans = ClusterMeans[order(-`Cluster Means`)]
    ClusterMeans = ClusterMeans[1:6,1]
    c = data.frame(nrow(Cluster))
    ClusterMeans = rbind(ClusterMeans,c, use.names=FALSE)
    table_kmeans = cbind(table_kmeans, ClusterMeans)
}
table_kmeans <- table_kmeans[-1, -1]
table_kmeans <- transpose(table_kmeans)
table_kmeans <- table_kmeans[order(table_kmeans[, ncol(table_kmeans)], decreasing = TRUE),]

rownames(table_kmeans) <- c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5", "Cluster 6",
                         "Cluster 7", "Cluster 8", "Cluster 9", "Cluster 10")
colnames(table_kmeans)=c("Category 1", "Category 2", "Category 3", "Category 4", "Category 5",
                         "Consumer No.")
kable(table_kmeans, caption ="**Table 2.1: Ten Clusters of K-means**" ,format_caption = c("bold", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = F)

# The Principal Component Analysis (PCA) + Hierarchical Clustering. Choose a Scaled Dataset and the Number of Principal Components

pca1 <- prcomp(x)
pve1 <- 100*pca1$sdev^2/sum(pca1$sdev^2) #pve is proportion of variance

pca2 <- prcomp(x, scale=TRUE)
pve2 <- 100*pca2$sdev^2/sum(pca2$sdev^2)

x2 <- social_marketing[ , c(-1, -36, -37)]
pca3 <- prcomp(x2, scale=TRUE)
pve3 <- 100*pca3$sdev^2/sum(pca3$sdev^2)

PC <- c(1:34)
pvecombine <- cbind.data.frame(PC, pve1, pve2, pve3)

ggplot(data=pvecombine)+
    geom_line(aes(x=PC,y=pve1), col="blue")+geom_point(aes(x=PC, y=pve1), col="blue", shape=1, size=2)+
    geom_line(aes(x=PC,y=pve2), col="red")+geom_point(aes(x=PC, y=pve2), col="red", shape=2, size=2)+
    geom_line(aes(x=PC,y=pve3), col="green3")+geom_point(aes(x=PC, y=pve3), col="green3", shape=3, size=2)+
    labs(y="PVE", x="Principal Component")+
    theme_bw()+
    labs(title = "Figure 1.2: PVE of PCA Based on Datasets Scaled Differently")+
    theme(plot.title = element_text(hjust = 0.5))

sum_pca1 <- data.frame(summary(pca1)$importance)
sum_pca1 <- sum_pca1[ , 1:10]
kable(sum_pca1, caption ="**Table 2.2: Summary of Variations in Principal Components**", format_caption = c("italic", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = T)

pca1_loading <- pca1$rotation[ , c(1:10)]

pc <- data.frame(rep(1:34))
for (i in c(1:10)){
    sort = data.frame(sort(pca1_loading[,i], decreasing = TRUE))
    rownames = data.frame(row.names(sort))
    c = cbind(rownames, sort[,1])
    pc = cbind(pc,c)
}
pc <- pc[,-1]
colnames(pc) <- c("Categories", "PC1", "Categories", "PC2", "Categories", "PC3", "Categories", "PC4", "Categories", "PC5",
               "Categories", "PC6", "Categories", "PC7", "Categories", "PC8", "Categories", "PC9", "Categories", "PC10")

tablePCA <- pc[1:5,-c(seq(2, 20, by=2))]

colnames(tablePCA) <- c("PC 1", "PC 2", "PC 3", "PC 4", "PC 5", "PC 6",
                     "PC 7", "PC 8", "PC 9", "PC 10")
rownames(tablePCA) <- c("Category 1", "Category 2", "Category 3", "Category 4", "Category 5")

kable(tablePCA,  caption ="**Table 2.3: The Result of First 10 Principal Components**", format_caption = c("italic", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = T)

# Use Hierarchical Clustering to Make a Better Clustering
pca1 <- prcomp(x)
pca1_scores <- pca1$x[ , c(1:10)]

D0 <- dist(pca1_scores)
hclust10 <- hclust(D0, method='complete')
cluster_pca1_10 <- cutree(hclust10, 10)

resultp <- data.frame(cluster_pca1_10)

resultpCombinedData <- cbind(x, result$clust_k.cluster)

table_pca <- data.frame("Cluster"=character(7))
for (i in 1:10) {
    Cluster = filter(resultpCombinedData, result$clust_k.cluster == i)
    ClusterMeans = as.data.table(colMeans(Cluster), keep.rownames=TRUE)
    colnames(ClusterMeans) <- c("Categories", "Cluster Means")
    ClusterMeans = ClusterMeans[order(-`Cluster Means`)]
    ClusterMeans = ClusterMeans[1:6,1]
    c=data.frame(nrow(Cluster))
    ClusterMeans=rbind(ClusterMeans,c, use.names=FALSE)
    table_pca=cbind(table_pca, ClusterMeans)
}

table_pca <- table_pca[-1, -1]
table_pca <- transpose(table_pca)
table_pca <- table_pca[order(table_pca[, ncol(table_pca)], decreasing = TRUE),]
rownames(table_pca) <- c("PCluster 1", "PCluster 2", "PCluster 3", "PCluster 4", "PCluster 5", "PCluster 6",
                      "PCluster 7", "PCluster 8", "PCluster 9", "PCluster 10")
colnames(table_pca) <- c("Category 1", "Category 2", "Category 3", "Category 4", "Category 5",
                      "Consumer No.")
kable(table_pca,  caption ="**Table 2.4: An Improved Result of Hierarchical Clustering**", format_caption = c("italic", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = F)

# Can We Have More Accurate, Unique or Complete Labels?
xs_corr <- cor(x_scale)
d_xscorr <- dist(xs_corr)

hc_corr1 <- hclust(d_xscorr, method = "complete")
plot(hc_corr1, cex=0.8, xlab="", sub="", main="Figure 2.3: Dendrogram of Hierarchical Clustering of Categories")

###
hc_corr10 <- cutree(hc_corr1, 10)

hc_corr10_table <- data.frame(hc_corr10)
rownames <- data.frame(rownames(hc_corr10_table))
hc_corr10_table <- cbind(rownames, hc_corr10_table$hc_corr10)
colnames(hc_corr10_table) <- c("Category", "Hcluster")
hc_corr10_table <- hc_corr10_table[order(hc_corr10_table$Hcluster), ]
rownames(hc_corr10_table) <- c()


xclust10 <- x %>% transmute(c1=chatter+photo_sharing+shopping, c2=eco+current_events+uncategorized+home_and_garden+ music
                         +business+small_business, c3=travel+ politics+computers, c4=tv_film+ crafts +art, c5=sports_fandom
                         +food+family+religion+parenting+school, c6= news+automotive, c7= online_gaming+college_uni
                         +sports_playing, c8=health_nutrition+ outdoors+personal_fitness, c9=cooking+beauty +fashion,
                         c10=dating)
## kmeans
xclust_scale10 <- scale(xclust10, center = TRUE, scale = TRUE)
kmeans10 <- kmeans(xclust_scale10, 10, nstart = 25)
cluster_k10 <- data.frame(kmeans10$cluster)
xclustcombine10 <- cbind(xclust10, cluster_k10)
colnames(xclustcombine10)[11]="cluster"

result_save10 <- data.frame("Cluster"=character(10), "Consumers No."=numeric(10), "cluster in kmeans"=numeric(10),stringsAsFactors=FALSE)
for (i in 1:10){
    group=filter(xclustcombine10, cluster==i)[, -11]
    gmean=data.frame(apply(group, 2, mean))
    result_save10[i,]=c(rownames(gmean)[apply(gmean, 2, which.max)], nrow(group), i)
}
result_save10 <- result_save10[order(result_save10$cluster), ]
rownames(result_save10) <- c()
result_save10[which(result_save10$Consumers.No.==297) ,1]=colnames(Xclust_scale10)[10]

tableclust <- data.frame()
for (j in c("c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10")){
    a=result_save10[which(result_save10$Cluster==j), ]
    tableclust=rbind(tableclust,a)
}

Core_Categories <- c("chatter, photo_sharing, shopping", "eco, current_events, uncategorized, home_and_garden, music, 
             business, small_business", "travel, politics, computers", "tv_film, crafts, art", "sports_fandom, food, family, religion, parenting, school", "news, automotive", "online_gaming, college_uni, sports_playing", "health_nutrition, outdoors, personal_fitness", "cooking, beauty, fashion", "dating" )

tableclust <- cbind(tableclust, Core_Categories)[ ,-3]
tableclust <- tableclust[order(tableclust[, 2], decreasing = TRUE),]

rownames(tableclust) <- c("Hcluster 1", "Hcluster 2", "Hcluster 3", "Hcluster 4", "Hcluster 5", "Hcluster 6",
                       "Hcluster 7", "Hcluster 8", "Hcluster 9", "Hcluster 10")
tableclust <-tableclust[,-1]

kable(tableclust, caption ="**Table 2.5: Result of Hierarachical Clustering with K-means**", format_caption = c("italic", "underline")) %>%
    kable_styling(bootstrap_options = "striped", full_width = F)
###

#groceries
groceries <- read_lines("https://raw.githubusercontent.com/jgscott/ECO395M/master/data/groceries.txt")

#clean data
clean_groceries <- list()
for (i in 1:length(groceries)) {
    clean_groceries[i] <- str_split(groceries[i], ",") %>% unique()
}

#cast to transactions class
clean_groceries_trans <- as(clean_groceries, "transactions")
summary(clean_groceries_trans)

# number of items in each observation
size(head(clean_groceries_trans)) 

#average number of items purchased
mean(
    matrix(data= c(lengths(clean_groceries)),
       ncol = 1,
       byrow = TRUE)
)

#now run the 'apriori' algorithm
#maxlen defines the maximum number of items in each itemset of frequent items
groceries_rules <- apriori(clean_groceries_trans,
                 parameter = list(support = 0.01, 
                                  confidence = 0.5,
                                  maxlen = 4))
# Look at the output... so many rules!                 
arules::inspect(groceries_rules)

## Choose a subset
arules::inspect(subset(groceries_rules, lift > 2))

#'high-confidence' rules.
high_conf <- sort(groceries_rules, by = "confidence", decreasing = TRUE)

# show the support, lift and confidence for all rules
arules::inspect(head(high_conf))

# 'high-lift' rules.
high_lift <- sort(groceries_rules, by = "lift", decreasing=TRUE) 

# show the support, lift and confidence for all rules
arules::inspect(head(high_lift)) 

###############################
#most frequent items
frequent_items <- eclat(clean_groceries_trans, parameter = list(supp = 0.07, maxlen = 15)) # calculates support for frequent items

arules::inspect(frequent_items)

itemFrequencyPlot(clean_groceries_trans, topN = 10, type = "absolute", main = "Item Frequency")

# plot all the rules in (support, confidence) space
plot(groceries_rules)

#Customers who bought ‘Whole Milk’ also bought
milk <- apriori(data = clean_groceries_trans, parameter = list (supp=0.001, conf = 0.15, minlen = 2), appearance = list(default = "rhs",lhs = "whole milk"), control = list (verbose=F))

# 'high-confidence' rules.
milk_conf <- sort(milk, by = "confidence", decreasing=TRUE) 
arules::inspect(head(milk_conf))
###############################

# rules with lift > 3
arules::inspect(subset(groceries_rules, lift > 3)) %>% as_tibble()

# plot all the rules in (support, confidence) space
plot(groceries_rules)

# can swap the axes and color scales
plot(groceries_rules, measure = c("support", "lift"), shading = "confidence")

# "two key" plot: coloring is by size (order) of item set
plot(groceries_rules, method='two-key plot')

# can now look at subsets driven by the plot
arules::inspect(subset(groceries_rules, support > 0.04))
arules::inspect(subset(groceries_rules, confidence > 0.4))

# export a graph
sub1 = subset(groceries_rules, subset=confidence > 0.01 & support > 0.005)
saveAsGraph(sub1, file = "groceries_rules.graphml")

png::readPNG(source = "/Users/jirapat/Desktop/R/Data_Mining_HW4/hw4graph.png")
