# ggplot learning script
# Matthew Kirby matthewkirby@email.arizona.edu
# February 22, 2015

# Install packages
#install.packages("ggplot2, dependencies = TRUE")
#install.packages("plyr")
#install.packages("ggthemes")
#install.packages("reshape2")

# Load the libraries
library("ggplot2")
library("reshape2")
library("plyr")
library("ggthemes")

# Aestheics (how we are mapping the variables) aes
# Geometric Objects (what the geometric objects in the plot look like) geom
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(size=5)

# Change color by species
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3)

# Change shape by species
# Set variables outside aes and map variables inside aes
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(aes(shape = Species), size = 3)





# Now we want to use the diamonds dataset (super gynormous)
# Make a subset
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

# Exercise: Replicate a plot on the screen
# We can add additional layers using + however it all needs to be from the same data frame
head(d2)
ggplot(d2, aes(carat, price, color = color)) + 
  geom_point(size = 3)




# Statistical transformations and data summary
library("MASS")
head(birthwt)
myplot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot(outlier.colour = "red")
summary(myplot)
myplot



# Facets - subsetting data to make lattic plots
# facet_grid (Subset ~ .) for multiple rows
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(Species ~ .)
# facet_grid (~ . Subset) for multiple columns
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  facet_grid(. ~ Species)
# facet_wrap (~ Subset) will do its best to fill in the total space
# as both rows and columns















