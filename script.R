# install data set

install.packages("palmerpenguins")
summary(penguins)
library("palmerpenguins")
View(penguins)

# install the library for the graphing

install.packages("tidyverse")
library(ggplot2)

# graph the plot
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))