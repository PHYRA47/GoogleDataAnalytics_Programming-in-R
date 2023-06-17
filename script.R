# install data set

install.packages("palmerpenguins")
summary(penguins)
library("palmerpenguins")
View(penguins)
glimpse(penguins) # alternative of View

# install the library for the graphing

install.packages("tidyverse")
library(ggplot2)

# graph the plot
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point(aes(color=species))

## Working with pipes

data("ToothGrowth")
View(ToothGrowth)
library("dplyr")

# for filtering 
filtered_tg <- filter(ToothGrowth, dose==0.5)
View(filtered_tg)

# sort with arrange function
arrange(filtered_tg, len)

# using nested function for filtering and sorting
arrange(filter(ToothGrowth, dose==0.5), len)

# using pipe (ctrl+shift+m)
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose==0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), .group="drop")
  arrange(len)

# Previewing a data frame

library(diamonds)
data("diamonds")
data() # This includes the list of preloaded datasets from the datasets package.

View(diamonds)
head(diamonds)
str(diamonds) # view high level data of the data frame
colnames(diamonds)

mutate(diamonds, carat_2=carat*100) # make change to the column

rename(diamonds, carat_new = carat)

## Cleaning data

install.packages("here")
install.packages("skimr") # makes summarizing data really easy
install.packages("janitor") # 

# then load them all via Library()

# load dplyr
library("dplyr")

# load the dataset or import using read_csv() and here?
library("palmerpenguins")

# overview
skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

# 
penguins %>%
  select(species) # selects the subset of variables 

penguins %>%
  select(-species) # selects all but one column 

# renaming columns
penguins %>%
  rename(island_new=island)

# used to reformat column names to be upper or lower case
rename_with(penguins, tolower) # also toupper. 

clean_names(penguins) # ensures only chars, numbers and underscores in the name