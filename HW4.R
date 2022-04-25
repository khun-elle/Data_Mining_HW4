load.libraries <- c('tidyverse', 'mosaic', 'MASS', 'FNN', 'gamlr', 'glmnet', 'randomForest', 'kableExtra', 'data.table', 'sjmisc', 'sjPlot', 'sjlabelled', 'LICORS', 'foreach', 'cluster', 'factoextra', 'knitr', 'GGally', 'scales', 'lubridate', 'gridExtra', 'grid', 'lattice')
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
# ggplot(wine)+
#     geom_bar(aes(x = quality, fill = color, binwidth = 1))+
#     labs(title = "Figure 1.7 Histogram of wine qualities")

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

grid.arrange(pq1, pq2, pq3, pq4, pq5, pq6, pq7, pq8, pq9, pq10, pq11, nrow = 3, top = "Figure 1.8. Boxplots of chemical properties of three wine quality levels")

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
grid.arrange(pq1.1, pq1.5, pq1.2, pq1.6, pq1.8, pq1.10, nrow = 3, top = "Figure 3.9. Results of K-means clustering for wine qualities.")