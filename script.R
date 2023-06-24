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

## CLEANING DATA

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

## ORGANIZE YOUR DATA

# load packages
library(tidyverse)
library("palmerpenguins")
View(penguins)

penguins %>% arrange(bill_length_mm) # sorted by bill length in ascending
# add -bill_length_mm for descending 

# saving the data from console to dataframe
penguins2 <- penguins %>% arrange(-bill_length_mm)
view(penguins2)

# applying group by
penguins %>% 
  group_by(island) %>% 
  drop_na() %>%
  summarize(mean_bill_length_mm = mean(bill_length_mm))

penguins %>% 
  group_by(island) %>% 
  drop_na() %>%
  summarize(max_bill_length_mm = max(bill_length_mm))

# multiple task
penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>%
  summarize(mean_bl = mean(bill_length_mm), max_bl = max(bill_length_mm))

# filtering
penguins %>%
  filter(species == "Adelie")
  
## TRANSFORMING DATA

# manually create a data frame
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)

# print the whole data frame
print(employee)

# separate the column
separate(employee, name, into=c('first_name', 'last_name'), sep=' ')

new_employee <- separate(employee, name, into=c('first_name', 'last_name'), sep=' ')
print(new_employee)

# merging columns
unite(new_employee, 'name', first_name, last_name, sep=' ')

# add columns with calculations
library("palmerpenguins")

penguins %>% 
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_m=flipper_length_mm/1000)


### TAKE A CLOSER LOOK AT THE DATA

## SAME DATA, DIFFERENT OUTCOME

install.packages("Tmisc")
library(Tmisc)
data(quartet)
View(quartet)

# summarization

quartet %>%
  group_by(set) %>%
  summarise(mean(x), sd(x), mean(y), sd(y), cor(x,y)) # cor=correlation

# graph'em

ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method = lm, se=FALSE) + facet_wrap(~set)

# datasourous

install.packages('datasauRus')
library('datasauRus')

ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset, ncol=3)

# THE BIAS FUNCTION

install.packages("SimDesign")
library(SimDesign)

actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)
bias(actual_temp, predicted_temp)

# negative bias: the predicted > the actual

## ANNOTATE AND SAVE VISUALIZATIONS

# ANNOTATION LAYER

library('ggplot2')
library('palmerpenguins')

ggplot(data=penguins) +
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(
    title= "Palmer Penguins: Body Mass Vs. Flipper Length",
    subtitle= "Sample of Three Penguin Species",
    caption="Data collected by Dr. Kristen Gorman"
  ) +
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)

# can use varibles to assign a chunk of code

var <- ggplot(data=penguins) +
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color=species)) +
  labs(
    title= "Palmer Penguins: Body Mass Vs. Flipper Length",
    subtitle= "Sample of Three Penguin Species",
    caption="Data collected by Dr. Kristen Gorman"
  )

var + annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="purple", fontface="bold", size=4.5, angle=25)