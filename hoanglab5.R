# Christine Hoang
# Steve Jobs

ramen <- read_csv("ramen-ratings.csv")
ramen

#Create a bar plot that shows the count of rows for each style
ggplot(ramen, aes(x = Style, fill = Style)) + geom_bar()

#Create a box plot that shows the distribution of the Stars values for each style
ggplot(ramen, aes(x = Style, y = Stars, color = Style)) + geom_boxplot()

#Modify the plot you just created to only use data from the USA.
ggplot(filter(ramen, Country == "USA"), aes(x = Style, y = Stars, color = Style))+geom_boxplot()

#Ramen bars in the USA are highly rated.
#Boxed ramen are the lowest rated which could be due to lower quality.
#Bowl, cup, pack, and tray ramen vary in ratings.
#Canned ramen have an average rating.

#Create a new tibble that only contains data from Japan, India, Taiwan, and the USA. 
#Then, create a boxplot that shows the distribution of stars by style for each country on a subplot with two subplots per row.

filtered_ramen<-ramen %>%
  filter(Country %in% c("Japan", "India", "Taiwan", "USA"))

filtered_ramen

ggplot(filtered_ramen, aes(x = Style, y = Stars, color = Style)) + geom_boxplot() + facet_wrap(~Country, nrow = 2)

#Ramen bars are only popular in the USA.
#India only consumes packs and cups of ramen in which it receives mid-range ratings.
#The quality boxed ramen in Japan is higher than in the USA.

#Create a histogram of the tibble you created in step 5 that uses 12 bins to display the distribution of the Stars values.
ggplot(filtered_ramen, aes(x = Stars, fill = Style)) +
  geom_histogram(stat = "count", bins = 12)

#Ramen packs and bowls have the most received ratings and also the highest rated among other styles.
#Ramen cups receive middle to average ratings.


