# Christine Hoang

ramen <- read_csv("ramen-ratings.csv")
ramen

#Create a bar plot that shows the count of rows for each style
ggplot(ramen, aes(x = Style, fill = Style)) + geom_bar()

#Create a box plot that shows the distribution of the Stars values for each style
ggplot(ramen, aes(x = Style, y = Stars, color = Style)) + geom_boxplot()

#Modify the plot you just created to only use data from the USA.
ggplot(filter(ramen, Country == "USA"), aes(x = Style, y = Stars, color = Style))+geom_boxplot()

#Create a new tibble that only contains data from Japan, India, Taiwan, and the USA. 
#Then, create a boxplot that shows the distribution of stars by style for each country on a subplot with two subplots per row.
