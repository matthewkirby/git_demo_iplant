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


# Can set colors or a scale
aes(color = variable)
scale_fill_brewer(palette = "palette name here")
# A library with different color palettes
library(RColorBrewer)
display.brewer.all()
# Use the color scale
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")
# Can also set out colors
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_value(values = c("red", "green", "blue")) #This scale_fill_value isnt right gah

# Scales can also be added to plots. As an example
scale_y_continuous(labels = (paste0(1:4, "Kg")), breaks = seq(1000,4000, by = 1000))

# Coordinates - can be used to change to polar/log coordinates

# Histograms
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, fill = "steelblue", colour = "black")

# geom_line() can also be used to draw a line plot
# geom_ribbon() can be used to make confidence regions around it

# Themes can be used to set everything about that splot. See options in ?themes()
+theme()

# For everything I can dream and more
# docs.ggplot2.org/current/

# Adding from atmosphere?!?!?!??
