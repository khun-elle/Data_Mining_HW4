# Problem 1: Clustering and PCA

## Overview

In this exercise we are interested in applying and comparing
unsupervised learning methods like K-means clustering and Principal
Component Analysis to see whether they can successfully distinguish the
red wines from the white wines, as well as sorting the higher from the
lower quality of wines based on the dataset with 11 chemical properties
of 6500 different bottles of vinho verde wine from northern Portugal.

## Application of unsupervised learning methods to distinguish red wines from white wines

As a first step, the variables are explored to learn by which chemical
properties the white and red wines differentiate most.

![](HW4_files/figure-markdown_github/Figure%201.%20boxplot_colors-1.png)

From these boxplots, it can be concluded that red and white wines
differentiate mostly by chemical properties like total sulphur dioxide,
residual sugar, volatile acidity and density. These features will be
used later to analyze the performance of the selected methods.

#### K-means clustering to distinguish colors of wine

K-means clustering was chosen as a first approach to differentiate the
two types of wines by color. Accordingly, we set the number of clusters
K in K-means as 2.Then we run K-means on 11 chemical properties(the
first 11 columns of the dataset).

The following two figures show visually that K-means clustering could
successfully differentiate two colors of wines in relation to four
chemical properties, by which red and white wines differentiate mostly.
Additionally, in the first figure of boxplots we noticed that two colors
of wines didn’t differentiate much in the other chemical features. For
this reason we chose to show visually the performance of K-means
clustering on these four chemical features. For example, in the Figure
1.2. the top panel shows how k-means clustering partitioned the data
into two clusters in the dimensions of fixed acidity and residual sugar.
The bottom panel shows how actual wine colors differentiate in these
dimensions. It can be inferred, that the two panels appear to be very
similar visually. Figure 1.3. follows similar pattern.

![](HW4_files/figure-markdown_github/figure%201.2-1.3.%20K-means_colors-1.png)![](HW4_files/figure-markdown_github/figure%201.2-1.3.%20K-means_colors-2.png)

#### Prinicipal Components Analysis (PCA) to distinguish colors of wine

Next, Prinipal Components Analysis was performed in a similar attempt to
distinguish the wines by two colors. The table below shows that the
first five principal components explain cumulatively about 80% of the
variation in the data.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<caption>
**Table 1.1. Summary table of PCA to distinguish colors**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
PC1
</th>
<th style="text-align:right;">
PC2
</th>
<th style="text-align:right;">
PC3
</th>
<th style="text-align:right;">
PC4
</th>
<th style="text-align:right;">
PC5
</th>
<th style="text-align:right;">
PC6
</th>
<th style="text-align:right;">
PC7
</th>
<th style="text-align:right;">
PC8
</th>
<th style="text-align:right;">
PC9
</th>
<th style="text-align:right;">
PC10
</th>
<th style="text-align:right;">
PC11
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Standard deviation
</td>
<td style="text-align:right;">
1.740652
</td>
<td style="text-align:right;">
1.579185
</td>
<td style="text-align:right;">
1.247536
</td>
<td style="text-align:right;">
0.985166
</td>
<td style="text-align:right;">
0.8484544
</td>
<td style="text-align:right;">
0.7793021
</td>
<td style="text-align:right;">
0.7232971
</td>
<td style="text-align:right;">
0.7081739
</td>
<td style="text-align:right;">
0.5805377
</td>
<td style="text-align:right;">
0.4771748
</td>
<td style="text-align:right;">
0.1811927
</td>
</tr>
<tr>
<td style="text-align:left;">
Proportion of Variance
</td>
<td style="text-align:right;">
0.275440
</td>
<td style="text-align:right;">
0.226710
</td>
<td style="text-align:right;">
0.141490
</td>
<td style="text-align:right;">
0.088230
</td>
<td style="text-align:right;">
0.0654400
</td>
<td style="text-align:right;">
0.0552100
</td>
<td style="text-align:right;">
0.0475600
</td>
<td style="text-align:right;">
0.0455900
</td>
<td style="text-align:right;">
0.0306400
</td>
<td style="text-align:right;">
0.0207000
</td>
<td style="text-align:right;">
0.0029800
</td>
</tr>
<tr>
<td style="text-align:left;">
Cumulative Proportion
</td>
<td style="text-align:right;">
0.275440
</td>
<td style="text-align:right;">
0.502150
</td>
<td style="text-align:right;">
0.643640
</td>
<td style="text-align:right;">
0.731870
</td>
<td style="text-align:right;">
0.7973200
</td>
<td style="text-align:right;">
0.8525300
</td>
<td style="text-align:right;">
0.9000900
</td>
<td style="text-align:right;">
0.9456800
</td>
<td style="text-align:right;">
0.9763200
</td>
<td style="text-align:right;">
0.9970200
</td>
<td style="text-align:right;">
1.0000000
</td>
</tr>
</tbody>
</table>

![](HW4_files/figure-markdown_github/summary_pcw1,%20figure%201.4.%20PVE%20of%20pca-1.png)

Below we can examine the loadings of the first 5 principal components.
These are the linear combinations of the original chemical properties,
which preserve as much of the information of those variables as
possible. For example, free sulfur dioxide and total sulfur dioxide are
relatively strongly and positively correlated with the first principal
component, whereas volatile acidity and sulphates are relatively
strongly and negatively correlated with the first principal component.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 1.2. Loadings of the first five principal components**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
PC1
</th>
<th style="text-align:right;">
PC2
</th>
<th style="text-align:right;">
PC3
</th>
<th style="text-align:right;">
PC4
</th>
<th style="text-align:right;">
PC5
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
fixed.acidity
</td>
<td style="text-align:right;">
-0.24
</td>
<td style="text-align:right;">
0.34
</td>
<td style="text-align:right;">
-0.43
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
-0.15
</td>
</tr>
<tr>
<td style="text-align:left;">
volatile.acidity
</td>
<td style="text-align:right;">
-0.38
</td>
<td style="text-align:right;">
0.12
</td>
<td style="text-align:right;">
0.31
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
0.15
</td>
</tr>
<tr>
<td style="text-align:left;">
citric.acid
</td>
<td style="text-align:right;">
0.15
</td>
<td style="text-align:right;">
0.18
</td>
<td style="text-align:right;">
-0.59
</td>
<td style="text-align:right;">
-0.26
</td>
<td style="text-align:right;">
-0.16
</td>
</tr>
<tr>
<td style="text-align:left;">
residual.sugar
</td>
<td style="text-align:right;">
0.35
</td>
<td style="text-align:right;">
0.33
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
0.17
</td>
<td style="text-align:right;">
-0.35
</td>
</tr>
<tr>
<td style="text-align:left;">
chlorides
</td>
<td style="text-align:right;">
-0.29
</td>
<td style="text-align:right;">
0.32
</td>
<td style="text-align:right;">
0.02
</td>
<td style="text-align:right;">
-0.24
</td>
<td style="text-align:right;">
0.61
</td>
</tr>
<tr>
<td style="text-align:left;">
free.sulfur.dioxide
</td>
<td style="text-align:right;">
0.43
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
0.13
</td>
<td style="text-align:right;">
-0.36
</td>
<td style="text-align:right;">
0.22
</td>
</tr>
<tr>
<td style="text-align:left;">
total.sulfur.dioxide
</td>
<td style="text-align:right;">
0.49
</td>
<td style="text-align:right;">
0.09
</td>
<td style="text-align:right;">
0.11
</td>
<td style="text-align:right;">
-0.21
</td>
<td style="text-align:right;">
0.16
</td>
</tr>
<tr>
<td style="text-align:left;">
density
</td>
<td style="text-align:right;">
-0.04
</td>
<td style="text-align:right;">
0.58
</td>
<td style="text-align:right;">
0.18
</td>
<td style="text-align:right;">
0.07
</td>
<td style="text-align:right;">
-0.31
</td>
</tr>
<tr>
<td style="text-align:left;">
pH
</td>
<td style="text-align:right;">
-0.22
</td>
<td style="text-align:right;">
-0.16
</td>
<td style="text-align:right;">
0.46
</td>
<td style="text-align:right;">
-0.41
</td>
<td style="text-align:right;">
-0.45
</td>
</tr>
<tr>
<td style="text-align:left;">
sulphates
</td>
<td style="text-align:right;">
-0.29
</td>
<td style="text-align:right;">
0.19
</td>
<td style="text-align:right;">
-0.07
</td>
<td style="text-align:right;">
-0.64
</td>
<td style="text-align:right;">
-0.14
</td>
</tr>
<tr>
<td style="text-align:left;">
alcohol
</td>
<td style="text-align:right;">
-0.11
</td>
<td style="text-align:right;">
-0.47
</td>
<td style="text-align:right;">
-0.26
</td>
<td style="text-align:right;">
-0.11
</td>
<td style="text-align:right;">
-0.19
</td>
</tr>
</tbody>
</table>

Next, answering the question of where the individual data points fall in
the space defined by first two principal components can help us identify
how PCA performed the clustering of wines by their color.

![](HW4_files/figure-markdown_github/figure%201.5.%20pca%20for%20wine%20colors%20-1.png)

As it can be seen from the plot above, PCA could also perform the
clustering of two types of wine. Mainly, white wines tend to cluster to
the positive direction in the dimension of first principal component,
whereas red wines tend to cluster in the opposite direction.

Further, PCA results can be used to perform K-means clustering based on
them. We performed the K-means clustering on the first five principal
components to check whether we can enhance the partitioning of wine
color done by K-means. Figure 1.6. illustrates that differentiation of
wine colors was done very successfully by these augmented k-means
clustering method.

![](HW4_files/figure-markdown_github/k-means%20via%20pca%20colors-1.png)

Table 1.3. compares the results of two clustering of K=2 based on the
total within-cluster sum of squares and the between-cluster sum of
squares. Clustering via PCA has a relative improvement of about 25% in
the total within-cluster sum of squares, and approximately the same
between-cluster sum of squares.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 1.3 : Evaluating in-sample fit of two clusterings**
</caption>
<tbody>
<tr>
<td style="text-align:left;">
Total within-cluster sum of squares of Basic clustering
</td>
<td style="text-align:right;">
56135.28
</td>
</tr>
<tr>
<td style="text-align:left;">
Total within-cluster sum of squares of Clustering via PCA
</td>
<td style="text-align:right;">
41760.19
</td>
</tr>
<tr>
<td style="text-align:left;">
Between-cluster sum of squares of Basic clustering
</td>
<td style="text-align:right;">
15320.72
</td>
</tr>
<tr>
<td style="text-align:left;">
Between-cluster sum of squares of Clustering via PCA
</td>
<td style="text-align:right;">
15212.77
</td>
</tr>
</tbody>
</table>

To sum up, it can be said that K-means and PCA could succesfully
differentiate the white and red wines using only the “unsupervised
information” contained in the data on chemical properties of wines.
However, by reducing the dimensions of the features of the dataset by
PCA and then applying K-means clustering could distinguish colors of
wine at even better level, which could be seen from the reduced
within-cluster sum of squares.

## Application of unsupervised learning methods to distinguish quality levels of wines

We have divided the wines into three main levels of qualities. Wines
that scored higher that 7 were defined as high quality wines, lower than
5 - as low quality and from 5 to 7 as medium quality wines.

![](HW4_files/figure-markdown_github/Figure%201.7.%20Boxplots%20of%20chemical%20prop%20qualities-1.png)

From these boxplots, it can be concluded that higher and lower quality
wines differentiate mostly by chemical properties like volatile acidity,
alcohol, free sulfur dioxide and chlorides. These features will be used
later to analyze the performance of the selected methods.

#### K-means clustering to distinguish between higher and lower quality levels of wines

K-means clustering was performed to test whether it can also
differentiate the types of wines by quality level. As we have three main
levels of qualities, accordingly the number of clusters K in K-means is
3.

The following set of figures show visually results of K-means clustering
in differentiating the qualities of wines in relation to four chemical
properties. For example, in the Figure 1.8. the top left plot shows how
k-means clustering partitioned the data into three clusters in the
dimensions of volatile acidity and alcohol. The middle left plot shows
how actual three wine quality levels differentiate in these dimensions.
It is difficult to see, how lower and higher quality wines differ,
because of the huge amount of middle quality wines that overlap with
them, so the bottom left plot shows only the high and low qualities of
wines in these dimensions. Although, the distribution pattern of low and
high qualities appear to be similar with red and green clusters in the
top plot, it cannot be said that they follow exact pattern as was in the
case of partitioning the colors of wine. The right panel shows this
comparison in the dimensions of other two chemical features.

![](HW4_files/figure-markdown_github/Figure%201.8%20K-means%20for%20qualities-1.png)

#### Prinicipal Components Analysis (PCA) to distinguish between higher and lower quality levels of wines

Next, Prinipal Components Analysis was performed in a similar attempt to
distinguish the quality levels of wines. From the previous PCA on wine
colors it is known that the first five principal components explain
cumulatively about 80% of the variation in the data. As before,by
answering the question of where the individual data points fall in the
space defined by first two principal components we can identify how PCA
performed the clustering of wines by their quality levels.

![](HW4_files/figure-markdown_github/figure%201.9.%20pca%20qualities-1.png)

As it can be seen from the plot above, now PCA couldn’t perform the
clustering of higher qualities of wine from the lower types in a very
distinctive way. Mainly, higher types of wines tend to cluster to the
right spectrum of the dimension of first principal component, whereas
lower quality wines tend to cluster in the left.

With the same procedure as before, PCA results were used to perform
K-means clustering based on them. We performed the K-means clustering on
the first five principal components to check whether partitioning of
wine quality types done by K-means could be enhanced. Figure 1.10
illustrates that differentiation of wines by quality types was done at a
better level by these augmented k-means clustering method. For example,
the top left plot shows how k-means clustering partitioned the data into
three clusters in the dimensions of volatile acidity and alcohol. The
middle left plot shows how actual three wine quality levels
differentiate in these dimensions. It is difficult to see, how lower and
higher quality wines differ, because of the huge amount of middle
quality wines that overlap with them, so the bottom left plot shows only
the high and low qualities of wines in these dimensions. Although the
distribution pattern of low and high qualities appears to be similar
with red and green clusters in the top plot, it cannot be said that they
follow exact same pattern. The right panel shows this comparison in the
dimensions of other two chemical features like chlorides and free sulfur
dioxide.

![](HW4_files/figure-markdown_github/figure%201.10.%20k-means%20via%20pca%20qualities-1.png)

Table 1.4. compares the results of two clustering with K=3 based on the
total within-cluster sum of squares and the between-cluster sum of
squares. Clustering via PCA has a relative improvement of about 31% in
the total within-cluster sum of squares, and approximately the same
between-cluster sum of squares.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 1.4 : Evaluating in-sample fit of two clusterings**
</caption>
<tbody>
<tr>
<td style="text-align:left;">
Total within-cluster sum of squares of Basic clustering
</td>
<td style="text-align:right;">
45569.97
</td>
</tr>
<tr>
<td style="text-align:left;">
Total within-cluster sum of squares of Clustering via PCA
</td>
<td style="text-align:right;">
31258.71
</td>
</tr>
<tr>
<td style="text-align:left;">
Between-cluster sum of squares of Basic clustering
</td>
<td style="text-align:right;">
25886.03
</td>
</tr>
<tr>
<td style="text-align:left;">
Between-cluster sum of squares of Clustering via PCA
</td>
<td style="text-align:right;">
25714.25
</td>
</tr>
</tbody>
</table>

To sum up, it can be said that neither K-means clustering nor PCA could
very successfully differentiate the higher from the lower quality wines
using only the “unsupervised information” contained in the data on
chemical properties of wines. However, by reducing the dimensions of the
features of the data set by PCA and then applying K-means clustering
could distinguish quality levels of wine at better level, which could be
seen from the reduced within-cluster sum of squares.

## Conclusion

In conclusion, we could say that K-means clustering applied together
with PCA as a dimensionality reduction technique for the chemical
properties of wines works better to differentiate the red and white
colors of wine, compared to the same technique to distinguish higher
from the lower quality wines.

# Problem 2: Market Segmentation

## Overview

Based on data of the its twitter account followers, the brand
“NutrientH20” tries to find out possible approaches to segment those
followers. The key for our market segmentation purpose is to find some
identifiers to identify different clusters of consumers so that
NutrientH20 can target its consumers more accurately in marketing or
advertising. In analysis, we used three approaches to get there:
K-means, Principal Component Analysis (PCA) with Hierarchical
Clustering, and Hierarchical Clustering with K-means. The first two
aimed at doing general market segmentation, and the third aimed at
giving the previous clusters more accurate labels.

## The Data

The data contains 7882 twitter followers (consumers) and 36 categories
of their twitter posts (tweets). For each follower, the data gives the
amount of tweets in each category, during seven days in June 2014.
First, we deleted the observations with either nonzero “spam” tweets or
nonzero “adult” tweets since most of those two kinds of tweets are
likely posted by robots that are meaningless for marketing analysis.
Then, we deleted “spam “and “adult”. At last, we transformed the number
of tweets in each category into the frequency of tweets belonging to
each category to better represent the preferences of consumers.

## K-means

### The Proper K

K-means is a method to partition observations or features with a high
dimension P into lower K dimensions (P\>=K). For our purpose, it is to
partition consumers into K clusters. We used CH index to choose a proper
value of K.

![](HW4_files/figure-markdown_github/setup%202.1-1.png)

The Figure 2.1 is the elbow plot of CH index. It is not so
straightforward to choose a vivid elbow from the graph. Generally,
values of K ranged from 10 to 15 seemed to be good candidates. To make
the clustering as parsimonious as possible, we chose K = 10.

### The Result of K-means

K-means gave us 10 stable clusters of consumers. Then, for each cluster,
we calculated the sum of frequencies of each category over all consumers
in that cluster. After ordering the categories by sums of frequencies,
the first five categories with higher sums of frequencies were picked
out to represent that cluster. Also, the number of consumers in each
cluster was counted. The ultimate result is shown in Table 2.1.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 2.1: Ten Clusters of K-means**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Category 1
</th>
<th style="text-align:left;">
Category 2
</th>
<th style="text-align:left;">
Category 3
</th>
<th style="text-align:left;">
Category 4
</th>
<th style="text-align:left;">
Category 5
</th>
<th style="text-align:left;">
Consumer No. 
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Cluster 1
</td>
<td style="text-align:left;">
sports_fandom
</td>
<td style="text-align:left;">
religion
</td>
<td style="text-align:left;">
food
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
parenting
</td>
<td style="text-align:left;">
967
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 2
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
fashion
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
beauty
</td>
<td style="text-align:left;">
734
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 3
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
music
</td>
<td style="text-align:left;">
603
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 4
</td>
<td style="text-align:left;">
news
</td>
<td style="text-align:left;">
politics
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
automotive
</td>
<td style="text-align:left;">
sports_fandom
</td>
<td style="text-align:left;">
582
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 5
</td>
<td style="text-align:left;">
politics
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
computers
</td>
<td style="text-align:left;">
news
</td>
<td style="text-align:left;">
553
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 6
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
sports_playing
</td>
<td style="text-align:left;">
507
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 7
</td>
<td style="text-align:left;">
art
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
346
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 8
</td>
<td style="text-align:left;">
dating
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
fashion
</td>
<td style="text-align:left;">
school
</td>
<td style="text-align:left;">
275
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 9
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
shopping
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
1564
</td>
</tr>
<tr>
<td style="text-align:left;">
Cluster 10
</td>
<td style="text-align:left;">
health_nutrition
</td>
<td style="text-align:left;">
personal_fitness
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
outdoors
</td>
<td style="text-align:left;">
1178
</td>
</tr>
</tbody>
</table>

## The Principal Component Analysis (PCA) + Hierarchical Clustering

### Choose a Scaled Dataset and the Number of Principal Components

Next, we did segmentation by PCA. Since PCA is sensitive to the scales
of data to some degree, before choosing a proper number of principal
components, the first thing to do is to compare the effects of
differently scaled data on PCA. We used three differently scaled
datasets to do that. The first dataset was the one transformed into
frequencies. The second one was gotten by doing zero-mean
standardization on the frequency dataset. The third one was gotten from
doing zero-mean standardization on the original dataset, the one before
doing frequency transformation. PVE, the proportion of variance of each
principal component, was calculated after doing PCA on each dataset. The
Figure 4.1 shows how PVE of each dataset varies with each principal
component, where the blue line corresponds to the first dataset, the red
line corresponds to the second dataset, and the green one corresponds to
the third dataset. Around the elbow part where the number of principal
components is about eight to twelve, the blue line has the lowest
position, which means the first several principal components of blue one
summarize more variance in data. Hence, we chose the frequency dataset
to do PCA.

![](HW4_files/figure-markdown_github/setup%202.3-1.png)

Also based on the location of elbow in Figure 2.2, the first ten
principal components were chosen as a proper summary of data. Table 2.2
also justifies our choosing: the first ten principal components include
around 73 percent variation in data, which means the rest twenty-four
principal components only represent 27 percent variation in data. So, we
believe that the first ten are representative enough for the data.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<caption>
**Table 2.2: Summary of Variations in Principal Components**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
PC1
</th>
<th style="text-align:right;">
PC2
</th>
<th style="text-align:right;">
PC3
</th>
<th style="text-align:right;">
PC4
</th>
<th style="text-align:right;">
PC5
</th>
<th style="text-align:right;">
PC6
</th>
<th style="text-align:right;">
PC7
</th>
<th style="text-align:right;">
PC8
</th>
<th style="text-align:right;">
PC9
</th>
<th style="text-align:right;">
PC10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Standard deviation
</td>
<td style="text-align:right;">
0.1095786
</td>
<td style="text-align:right;">
0.0932282
</td>
<td style="text-align:right;">
0.0783741
</td>
<td style="text-align:right;">
0.0741907
</td>
<td style="text-align:right;">
0.0685512
</td>
<td style="text-align:right;">
0.054322
</td>
<td style="text-align:right;">
0.0526156
</td>
<td style="text-align:right;">
0.0491107
</td>
<td style="text-align:right;">
0.0443279
</td>
<td style="text-align:right;">
0.0401458
</td>
</tr>
<tr>
<td style="text-align:left;">
Proportion of Variance
</td>
<td style="text-align:right;">
0.1808800
</td>
<td style="text-align:right;">
0.1309300
</td>
<td style="text-align:right;">
0.0925300
</td>
<td style="text-align:right;">
0.0829200
</td>
<td style="text-align:right;">
0.0707900
</td>
<td style="text-align:right;">
0.044450
</td>
<td style="text-align:right;">
0.0417000
</td>
<td style="text-align:right;">
0.0363300
</td>
<td style="text-align:right;">
0.0296000
</td>
<td style="text-align:right;">
0.0242800
</td>
</tr>
<tr>
<td style="text-align:left;">
Cumulative Proportion
</td>
<td style="text-align:right;">
0.1808800
</td>
<td style="text-align:right;">
0.3118100
</td>
<td style="text-align:right;">
0.4043300
</td>
<td style="text-align:right;">
0.4872500
</td>
<td style="text-align:right;">
0.5580400
</td>
<td style="text-align:right;">
0.602490
</td>
<td style="text-align:right;">
0.6441900
</td>
<td style="text-align:right;">
0.6805300
</td>
<td style="text-align:right;">
0.7101200
</td>
<td style="text-align:right;">
0.7344000
</td>
</tr>
</tbody>
</table>

### The Potential Problems of First Ten Principal Components

The first ten principal components can be used to differentiate
consumers. In each principal component, the importance of categories was
measured by loadings. Those categories assigned with high positive
loadings were supposed to be closer to each other than other categories
so that they were more likely to be in the same cluster.The result was
presented in Table 2.3.

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<caption>
**Table 2.3: The Result of First 10 Principal Components**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
PC 1
</th>
<th style="text-align:left;">
PC 2
</th>
<th style="text-align:left;">
PC 3
</th>
<th style="text-align:left;">
PC 4
</th>
<th style="text-align:left;">
PC 5
</th>
<th style="text-align:left;">
PC 6
</th>
<th style="text-align:left;">
PC 7
</th>
<th style="text-align:left;">
PC 8
</th>
<th style="text-align:left;">
PC 9
</th>
<th style="text-align:left;">
PC 10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Category 1
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
health_nutrition
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
politics
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
cooking
</td>
</tr>
<tr>
<td style="text-align:left;">
Category 2
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
religion
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
sports_fandom
</td>
</tr>
<tr>
<td style="text-align:left;">
Category 3
</td>
<td style="text-align:left;">
shopping
</td>
<td style="text-align:left;">
personal_fitness
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
health_nutrition
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
computers
</td>
<td style="text-align:left;">
family
</td>
<td style="text-align:left;">
tv_film
</td>
</tr>
<tr>
<td style="text-align:left;">
Category 4
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
art
</td>
<td style="text-align:left;">
food
</td>
<td style="text-align:left;">
sports_fandom
</td>
<td style="text-align:left;">
shopping
</td>
</tr>
<tr>
<td style="text-align:left;">
Category 5
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
shopping
</td>
<td style="text-align:left;">
fashion
</td>
<td style="text-align:left;">
personal_fitness
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
parenting
</td>
<td style="text-align:left;">
sports_playing
</td>
<td style="text-align:left;">
college_uni
</td>
</tr>
</tbody>
</table>

But there are two problems in the above result: it includes only 21
categories out of 34, and we do not know yet how many consumers have the
bigest interest in each cluster and who they are, which makes us a few
miles away from our destination.

### Use Hierarchical Clustering to Make a Better Clustering

To solve the problems, we used the scores (indices to indicate the
positions of each observation in the projected space) of PCA to
construct a distance matrix, which measures the distance between each
pair of consumers in the data. By Hierarchical Clustering and cutting
the resulting dendrogram, we got 10 clusters of consumers, in accordance
with the value of K in K-means. Afterwards, we did the same thing as in
K-means after getting 10 clusters. The result is shown in Table 2.4 (To
be more distinguishable, we named the clusters as “Pcluster” here). It
is the exactly same as in K-means, which strongly implies the robustness
of partitioning the market into 10 clusters.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 2.4: An Improved Result of Hierarchical Clustering**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Category 1
</th>
<th style="text-align:left;">
Category 2
</th>
<th style="text-align:left;">
Category 3
</th>
<th style="text-align:left;">
Category 4
</th>
<th style="text-align:left;">
Category 5
</th>
<th style="text-align:left;">
Consumer No. 
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
PCluster 1
</td>
<td style="text-align:left;">
sports_fandom
</td>
<td style="text-align:left;">
religion
</td>
<td style="text-align:left;">
food
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
parenting
</td>
<td style="text-align:left;">
967
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 2
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
fashion
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
beauty
</td>
<td style="text-align:left;">
734
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 3
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
music
</td>
<td style="text-align:left;">
603
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 4
</td>
<td style="text-align:left;">
news
</td>
<td style="text-align:left;">
politics
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
automotive
</td>
<td style="text-align:left;">
sports_fandom
</td>
<td style="text-align:left;">
582
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 5
</td>
<td style="text-align:left;">
politics
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
computers
</td>
<td style="text-align:left;">
news
</td>
<td style="text-align:left;">
553
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 6
</td>
<td style="text-align:left;">
college_uni
</td>
<td style="text-align:left;">
online_gaming
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
sports_playing
</td>
<td style="text-align:left;">
507
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 7
</td>
<td style="text-align:left;">
art
</td>
<td style="text-align:left;">
tv_film
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
346
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 8
</td>
<td style="text-align:left;">
dating
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
fashion
</td>
<td style="text-align:left;">
school
</td>
<td style="text-align:left;">
275
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 9
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
photo_sharing
</td>
<td style="text-align:left;">
shopping
</td>
<td style="text-align:left;">
current_events
</td>
<td style="text-align:left;">
travel
</td>
<td style="text-align:left;">
1564
</td>
</tr>
<tr>
<td style="text-align:left;">
PCluster 10
</td>
<td style="text-align:left;">
health_nutrition
</td>
<td style="text-align:left;">
personal_fitness
</td>
<td style="text-align:left;">
chatter
</td>
<td style="text-align:left;">
cooking
</td>
<td style="text-align:left;">
outdoors
</td>
<td style="text-align:left;">
1178
</td>
</tr>
</tbody>
</table>

## Can We Have More Accurate, Unique or Complete Labels?

The first problem of the result in Table 2.3 also exists in Table 2.2
and Table 2.4, though in a much less evident way: 27 categories out of
34 categories are used to differentiate consumers into 10 clusters.
Probably it is because the rest 7 categories are not discernable or
important enough based on the data, but it could be the possibility that
our method was not refined enough. Of course, we could pick out more
categories, say, first six or seven categories with high sums of
frequencies, from each cluster, to include categories as many as
possible. However, usually the categories below the third one only have
relatively much smaller sums of frequencies than those of the first
three categories. So, including more categories would be likely to put
more infrequent or accident tweets into the description of distinct
preferences. Moreover, some clusters may be not so distinguishable from
other clusters. For example, Cluster 4 and 5 are more likely to consist
of the same group of people. The borders between those clusters are not
so clear. Therefore, in this part, for each of 10 clusters, we tried to
find out the unique category or the combination of several unique
categories dominating all other categories by the sum of frequencies.
Meanwhile, all those unique category or combinations of unique
categories made up a partition of 34 categories. By doing so, we were
attaching labels to each cluster to make them more distinguishable.

The approach we applied was Hierarchical Clustering with K-means. The
Hierarchical Clustering was to find out a hierarchical structure of
categories based on the proximity matrix of correlations between each
pair of categories. Figure 2.3 shows the dendrogram.

![](HW4_files/figure-markdown_github/setup%202.7-1.png)

Then, we horizontally cut the dendrogram into ten clusters of categories
as a partition of 34 categories. Based on the partition, we added up the
categories belonging to the same cluster in the frequency dataset, to
get a new dataset with 10 clusters. Then we used K-means to split
consumers into 10 clusters of consumers and applied the same procedure
as in K-means to attach ten clusters of categories to ten clusters of
consumers. The result is shown in Table 2.5 (Again, to be
distinguishable, we named clusters as “Hcluster” here).

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
**Table 2.5: Result of Hierarachical Clustering with K-means**
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Consumers.No.
</th>
<th style="text-align:left;">
Core_Categories
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Hcluster 1
</td>
<td style="text-align:left;">
913
</td>
<td style="text-align:left;">
sports_fandom, food, family, religion, parenting, school
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 2
</td>
<td style="text-align:left;">
740
</td>
<td style="text-align:left;">
eco, current_events, uncategorized, home_and_garden, music, business,
small_business
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 3
</td>
<td style="text-align:left;">
718
</td>
<td style="text-align:left;">
cooking, beauty, fashion
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 4
</td>
<td style="text-align:left;">
558
</td>
<td style="text-align:left;">
news, automotive
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 5
</td>
<td style="text-align:left;">
521
</td>
<td style="text-align:left;">
online_gaming, college_uni, sports_playing
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 6
</td>
<td style="text-align:left;">
516
</td>
<td style="text-align:left;">
travel, politics, computers
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 7
</td>
<td style="text-align:left;">
457
</td>
<td style="text-align:left;">
tv_film, crafts, art
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 8
</td>
<td style="text-align:left;">
297
</td>
<td style="text-align:left;">
dating
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 9
</td>
<td style="text-align:left;">
1412
</td>
<td style="text-align:left;">
chatter, photo_sharing, shopping
</td>
</tr>
<tr>
<td style="text-align:left;">
Hcluster 10
</td>
<td style="text-align:left;">
1177
</td>
<td style="text-align:left;">
health_nutrition, outdoors, personal_fitness
</td>
</tr>
</tbody>
</table>

One good news is that there exists one to one mapping between ten
clusters of categories and ten clusters of consumers. The other good
news is that the distribution of the numbers of consumers over ten
clusters is extremely close to the distribution in Table 2.3 or Table
2.4. Hence, by comparing the number of consumers, it is straightforward
to link the clusters in Table 2.5 to those clusters in Table 2.3 or
Table 2.4. The stable clustering structures across different approaches
proves that our ten clusters are very robust based on our data.

It should be noted that the labels in Table 2.5 are supplements to
categories of each cluster in Table 2.3 or Table 2.4. By labels in Table
2.5, the brand can try to do more accurate advertising or marketing for
consumers in any clusters. It also helps the brand to recognize a new
consumer. For example, if a new consumer has some crafts posts, just by
categories in Table 2.3 or 2.4, it is difficulty to put her into any
cluster. But by labels in Table 2.5, we know crafts is more likely to be
clustered with movie and art, so it is reasonable to put her in Cluster
6 before having more information about this new consumer.

## Conclusion

Based on the above ten clusters of consumers, now we can make some
comments.

The largest cluster of the audience of NurientH20 was those who focused
much on eco or home and garden. The second largest paid more attention
to cooking, beauty, and fashion. The third to fifth largest clusters
focused more on news, travel, politics. All those largest five clusters
probably could be grouped into a more general consumer type: less likely
to be students, perhaps having families and children, female teenagers
who have interests in beauty and fashion, or businessmen. Also, they
were more likely to have high incomes. Therefore, this type of consumers
could be in priority in the marketing of NutrientH20.

The second type of consumers might be younger people. Most of them
probably were college students with those classical student preferences
like online gaming, sporting, watching movies and TV shows, dating and
so forth. This type of consumers might have minor purchase power, but
they could be potential future consumers of the brand, with more
permanent brand loyalty. Hence, it was also important for NutrientH20 to
attract those type of consumers as many as possible.

# Problem 3: Groceries

    ## [1] 4 3 1 4 4 5

    ## [1] 4.409456

Because the average number of items purchased is approximately 4, it
seems appropriate to set `maxlen` equals to 4. I also set `support`
which is marginal probability to be 1% and `confidence` equals to 50%.
It is worth reminding that the higher value of `confidence` parameter,
the stronger the rules. Also, low support does not preclude high
confidence or high lift. Once you know that something is purchased
(although rarely purchased), you know with high probability that another
item is likely to be bought too.

    ## Apriori
    ## 
    ## Parameter specification:
    ##  confidence minval smax arem  aval originalSupport maxtime support minlen
    ##         0.5    0.1    1 none FALSE            TRUE       5    0.01      1
    ##  maxlen target  ext
    ##       4  rules TRUE
    ## 
    ## Algorithmic control:
    ##  filter tree heap memopt load sort verbose
    ##     0.1 TRUE TRUE  FALSE TRUE    2    TRUE
    ## 
    ## Absolute minimum support count: 98 
    ## 
    ## set item appearances ...[0 item(s)] done [0.00s].
    ## set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
    ## sorting and recoding items ... [88 item(s)] done [0.00s].
    ## creating transaction tree ... done [0.00s].
    ## checking subsets of size 1 2 3 4 done [0.00s].
    ## writing ... [15 rule(s)] done [0.00s].
    ## creating S4 object  ... done [0.00s].

    ##      lhs                                       rhs                support   
    ## [1]  {curd, yogurt}                         => {whole milk}       0.01006609
    ## [2]  {butter, other vegetables}             => {whole milk}       0.01148958
    ## [3]  {domestic eggs, other vegetables}      => {whole milk}       0.01230300
    ## [4]  {whipped/sour cream, yogurt}           => {whole milk}       0.01087951
    ## [5]  {other vegetables, whipped/sour cream} => {whole milk}       0.01464159
    ## [6]  {other vegetables, pip fruit}          => {whole milk}       0.01352313
    ## [7]  {citrus fruit, root vegetables}        => {other vegetables} 0.01037112
    ## [8]  {root vegetables, tropical fruit}      => {other vegetables} 0.01230300
    ## [9]  {root vegetables, tropical fruit}      => {whole milk}       0.01199797
    ## [10] {tropical fruit, yogurt}               => {whole milk}       0.01514997
    ## [11] {root vegetables, yogurt}              => {other vegetables} 0.01291307
    ## [12] {root vegetables, yogurt}              => {whole milk}       0.01453991
    ## [13] {rolls/buns, root vegetables}          => {other vegetables} 0.01220132
    ## [14] {rolls/buns, root vegetables}          => {whole milk}       0.01270971
    ## [15] {other vegetables, yogurt}             => {whole milk}       0.02226741
    ##      confidence coverage   lift     count
    ## [1]  0.5823529  0.01728521 2.279125  99  
    ## [2]  0.5736041  0.02003050 2.244885 113  
    ## [3]  0.5525114  0.02226741 2.162336 121  
    ## [4]  0.5245098  0.02074225 2.052747 107  
    ## [5]  0.5070423  0.02887646 1.984385 144  
    ## [6]  0.5175097  0.02613116 2.025351 133  
    ## [7]  0.5862069  0.01769192 3.029608 102  
    ## [8]  0.5845411  0.02104728 3.020999 121  
    ## [9]  0.5700483  0.02104728 2.230969 118  
    ## [10] 0.5173611  0.02928317 2.024770 149  
    ## [11] 0.5000000  0.02582613 2.584078 127  
    ## [12] 0.5629921  0.02582613 2.203354 143  
    ## [13] 0.5020921  0.02430097 2.594890 120  
    ## [14] 0.5230126  0.02430097 2.046888 125  
    ## [15] 0.5128806  0.04341637 2.007235 219

    ##      lhs                                  rhs                support   
    ## [1]  {curd, yogurt}                    => {whole milk}       0.01006609
    ## [2]  {butter, other vegetables}        => {whole milk}       0.01148958
    ## [3]  {domestic eggs, other vegetables} => {whole milk}       0.01230300
    ## [4]  {whipped/sour cream, yogurt}      => {whole milk}       0.01087951
    ## [5]  {other vegetables, pip fruit}     => {whole milk}       0.01352313
    ## [6]  {citrus fruit, root vegetables}   => {other vegetables} 0.01037112
    ## [7]  {root vegetables, tropical fruit} => {other vegetables} 0.01230300
    ## [8]  {root vegetables, tropical fruit} => {whole milk}       0.01199797
    ## [9]  {tropical fruit, yogurt}          => {whole milk}       0.01514997
    ## [10] {root vegetables, yogurt}         => {other vegetables} 0.01291307
    ## [11] {root vegetables, yogurt}         => {whole milk}       0.01453991
    ## [12] {rolls/buns, root vegetables}     => {other vegetables} 0.01220132
    ## [13] {rolls/buns, root vegetables}     => {whole milk}       0.01270971
    ## [14] {other vegetables, yogurt}        => {whole milk}       0.02226741
    ##      confidence coverage   lift     count
    ## [1]  0.5823529  0.01728521 2.279125  99  
    ## [2]  0.5736041  0.02003050 2.244885 113  
    ## [3]  0.5525114  0.02226741 2.162336 121  
    ## [4]  0.5245098  0.02074225 2.052747 107  
    ## [5]  0.5175097  0.02613116 2.025351 133  
    ## [6]  0.5862069  0.01769192 3.029608 102  
    ## [7]  0.5845411  0.02104728 3.020999 121  
    ## [8]  0.5700483  0.02104728 2.230969 118  
    ## [9]  0.5173611  0.02928317 2.024770 149  
    ## [10] 0.5000000  0.02582613 2.584078 127  
    ## [11] 0.5629921  0.02582613 2.203354 143  
    ## [12] 0.5020921  0.02430097 2.594890 120  
    ## [13] 0.5230126  0.02430097 2.046888 125  
    ## [14] 0.5128806  0.04341637 2.007235 219

## How to get the product recommendation rules?

### High-confidence rules

Event with high confidence means the probability of RHS(consequent)
given LHS(antecedent) is high. The rule with confidence of 1 imply that
when LHS item was purchased, the RHS item was also purchased 100% of the
time.

    ##     lhs                                  rhs                support   
    ## [1] {citrus fruit, root vegetables}   => {other vegetables} 0.01037112
    ## [2] {root vegetables, tropical fruit} => {other vegetables} 0.01230300
    ## [3] {curd, yogurt}                    => {whole milk}       0.01006609
    ## [4] {butter, other vegetables}        => {whole milk}       0.01148958
    ## [5] {root vegetables, tropical fruit} => {whole milk}       0.01199797
    ## [6] {root vegetables, yogurt}         => {whole milk}       0.01453991
    ##     confidence coverage   lift     count
    ## [1] 0.5862069  0.01769192 3.029608 102  
    ## [2] 0.5845411  0.02104728 3.020999 121  
    ## [3] 0.5823529  0.01728521 2.279125  99  
    ## [4] 0.5736041  0.02003050 2.244885 113  
    ## [5] 0.5700483  0.02104728 2.230969 118  
    ## [6] 0.5629921  0.02582613 2.203354 143

### High-lift rules

Lift is calculated by taking confidence divided by support. Generally,
association rules with high lift are most useful because they tell you
something you don’t already know. Rules with high lift mean that items
in LHS and RHS are more likely to be bought together compared to the
purchases when they are assumed to be unrelated.

    ##     lhs                                  rhs                support   
    ## [1] {citrus fruit, root vegetables}   => {other vegetables} 0.01037112
    ## [2] {root vegetables, tropical fruit} => {other vegetables} 0.01230300
    ## [3] {rolls/buns, root vegetables}     => {other vegetables} 0.01220132
    ## [4] {root vegetables, yogurt}         => {other vegetables} 0.01291307
    ## [5] {curd, yogurt}                    => {whole milk}       0.01006609
    ## [6] {butter, other vegetables}        => {whole milk}       0.01148958
    ##     confidence coverage   lift     count
    ## [1] 0.5862069  0.01769192 3.029608 102  
    ## [2] 0.5845411  0.02104728 3.020999 121  
    ## [3] 0.5020921  0.02430097 2.594890 120  
    ## [4] 0.5000000  0.02582613 2.584078 127  
    ## [5] 0.5823529  0.01728521 2.279125  99  
    ## [6] 0.5736041  0.02003050 2.244885 113

## Most frequenly purchased items

We see that whole milk is the most commonly purchased item followed by
vegetables and buns. This makes sense because they are all basic foods.

    ## Eclat
    ## 
    ## parameter specification:
    ##  tidLists support minlen maxlen            target  ext
    ##     FALSE    0.07      1     15 frequent itemsets TRUE
    ## 
    ## algorithmic control:
    ##  sparse sort verbose
    ##       7   -2    TRUE
    ## 
    ## Absolute minimum support count: 688 
    ## 
    ## create itemset ... 
    ## set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
    ## sorting and recoding items ... [18 item(s)] done [0.00s].
    ## creating sparse bit matrix ... [18 row(s), 9835 column(s)] done [0.00s].
    ## writing  ... [19 set(s)] done [0.00s].
    ## Creating S4 object  ... done [0.00s].

    ##      items                          support    count
    ## [1]  {other vegetables, whole milk} 0.07483477  736 
    ## [2]  {whole milk}                   0.25551601 2513 
    ## [3]  {other vegetables}             0.19349263 1903 
    ## [4]  {rolls/buns}                   0.18393493 1809 
    ## [5]  {yogurt}                       0.13950178 1372 
    ## [6]  {soda}                         0.17437722 1715 
    ## [7]  {root vegetables}              0.10899847 1072 
    ## [8]  {tropical fruit}               0.10493137 1032 
    ## [9]  {bottled water}                0.11052364 1087 
    ## [10] {sausage}                      0.09395018  924 
    ## [11] {shopping bags}                0.09852567  969 
    ## [12] {citrus fruit}                 0.08276563  814 
    ## [13] {pastry}                       0.08896797  875 
    ## [14] {pip fruit}                    0.07564820  744 
    ## [15] {whipped/sour cream}           0.07168277  705 
    ## [16] {fruit/vegetable juice}        0.07229283  711 
    ## [17] {newspapers}                   0.07981698  785 
    ## [18] {bottled beer}                 0.08052872  792 
    ## [19] {canned beer}                  0.07768175  764

![](HW4_files/figure-markdown_github/setup%202.14-1.png)

## Customers who bought ‘Whole Milk’ also bought

Let’s find out what customers had purchased before buying ‘Whole Milk’.
This will help us understand the patterns that led to the purchase of
‘whole milk’.

In the following graph, we observe negative relationship between support
and lift. When you have high support, it means that the items is
commonly purchased. It’s like almost everyone buys it. So it is not very
helpful or telling you much information.

![](HW4_files/figure-markdown_github/setup%202.17-1.png)![](HW4_files/figure-markdown_github/setup%202.17-2.png)

In the graph below, we see that the highest confidence tends to be order
3 (order 3 has more items). The more items you condition on, the more
sure.

![](HW4_files/figure-markdown_github/setup%202.18-1.png)

    ##      lhs                                       rhs                support   
    ## [1]  {curd, yogurt}                         => {whole milk}       0.01006609
    ## [2]  {butter, other vegetables}             => {whole milk}       0.01148958
    ## [3]  {domestic eggs, other vegetables}      => {whole milk}       0.01230300
    ## [4]  {whipped/sour cream, yogurt}           => {whole milk}       0.01087951
    ## [5]  {other vegetables, whipped/sour cream} => {whole milk}       0.01464159
    ## [6]  {other vegetables, pip fruit}          => {whole milk}       0.01352313
    ## [7]  {citrus fruit, root vegetables}        => {other vegetables} 0.01037112
    ## [8]  {root vegetables, tropical fruit}      => {other vegetables} 0.01230300
    ## [9]  {root vegetables, tropical fruit}      => {whole milk}       0.01199797
    ## [10] {tropical fruit, yogurt}               => {whole milk}       0.01514997
    ## [11] {root vegetables, yogurt}              => {other vegetables} 0.01291307
    ## [12] {root vegetables, yogurt}              => {whole milk}       0.01453991
    ## [13] {rolls/buns, root vegetables}          => {other vegetables} 0.01220132
    ## [14] {rolls/buns, root vegetables}          => {whole milk}       0.01270971
    ## [15] {other vegetables, yogurt}             => {whole milk}       0.02226741
    ##      confidence coverage   lift     count
    ## [1]  0.5823529  0.01728521 2.279125  99  
    ## [2]  0.5736041  0.02003050 2.244885 113  
    ## [3]  0.5525114  0.02226741 2.162336 121  
    ## [4]  0.5245098  0.02074225 2.052747 107  
    ## [5]  0.5070423  0.02887646 1.984385 144  
    ## [6]  0.5175097  0.02613116 2.025351 133  
    ## [7]  0.5862069  0.01769192 3.029608 102  
    ## [8]  0.5845411  0.02104728 3.020999 121  
    ## [9]  0.5700483  0.02104728 2.230969 118  
    ## [10] 0.5173611  0.02928317 2.024770 149  
    ## [11] 0.5000000  0.02582613 2.584078 127  
    ## [12] 0.5629921  0.02582613 2.203354 143  
    ## [13] 0.5020921  0.02430097 2.594890 120  
    ## [14] 0.5230126  0.02430097 2.046888 125  
    ## [15] 0.5128806  0.04341637 2.007235 219

# Graph-Based Visualization: Top 30 rules by lift

![](HW4_files/figure-markdown_github/setup%202.20-1.png)
