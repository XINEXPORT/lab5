# load the package tidyverse, it should be installed from chapter 3
library(tidyverse)
# load datasets
library(datasets)
# display the available datasets
data()
# to display the iris data
iris
# to display the first 6 rows of the ChickWeight data set
head(ChickWeight)
#discrete data is mostly Categorical, it is similar to an Enum data type in sql, where the stored values 
#are limited to a few possible values. Continuos data continuos data can be any number within a range
#think of student ids or dollar amounts of a sales transaction. 
# the iris dataset consists of sepals and petals - these are different
# parts of an iris flower
head(iris)
# the species column is limited to certain types of irises and is therefor
# discrete data
# in data visualizations you commonly plot data based on discrete data columns
#to load the iris data set into a tibble that R can work with use the 
# as tibble function
irises <- as_tibble(iris)
# you can then display additional information about the data as a tibble
irises
# in this example there are four data columns indicating the length and 
# width of the iris sepals and iris petals - all are data types of <dbl>
# also note that the Species column is a data type of <fct> (factor) type. 
# this categorizes rows of data, in the irises tibble by 3 different species 
#types
# Convert the ChickWeight data set to a tibble
chicks <- as_tibble(ChickWeight)
# display the tibble
chicks
# for consistency you can rename the first column weight so that the first
# letter is capitalized, like the other columns
# to check the names of the columns in a large tibble use the names function
names(chicks)
# to rename the first column
chicks <- rename(chicks, Weight = weight)
# check the column names again
names(chicks)
chicks
head(chicks)
# notice that the Chick column has a data type of <ord> ordered or ordered factor.
# this denotes a factored data type that is within a range, like sequential
# numbers or letter of the alphabet
# notice also that the Diet column is limited to a range of numbers
# relational operators such as > < = can select rows of a dataset based on 
# some condition
filter(irises, Species == 'setosa')
filter(chicks, Diet == 2)
filter(irises, Species == 'setosa' & Petal.Length > 1.4 )
# the aes() function, which is short for aesthetics, is part of the ggplot2
# package and defines the column to be used as the x axis of a plot - 
# (the horizontal, the y axis of a plot, (the vertical) and the color or fill mapping
# that the plot will use
# two methods to use, they work the same but be consistent within a single 
# analysis first method sets a dataframe to be used for the plot
ggplot(chicks, aes(x = Time, y = Weight, color = Chick))
# second method uses mapping for the plot - again both methods work the same
ggplot(data = chicks, mapping = aes(x = Time, y = Weight, color = Chick))
# this creates an empty plot, there are other parameters such as fill and size
# that can be used with the aes() function
# relational plots show the relationship between two or more variables,
# typically columns (filtered or not) of a dataset
# line plots or graphs show relationships over time, scatter plots show 
# variations between variables
# geom_line() function is added to a ggplot statement to include a line plot 
# of the color parameter
ggplot(chicks, aes(x = Time, y = Weight, color = Chick))+ geom_line()
# look for the distinct number of chickens in the data
unique(chicks$Chick)
# this shows that there are 50 distinct chickens in the data
# the plot indicated on line 70 will draw 50 lines, one per
# chicken and show the increase in weight (y axis), based 
# on time intervals (x axis)
# creating a scatter plot - a scatter plot shows the relationship between
# two variables as dots on a plot using the geom_point() function
# use the aes() function to select the varialbes, columns or columns 
# in a filtered row, then pass a fixed size to the geom_point() function
# if you want to have the dot sizes increase relative to values within the 
# variables use a formula in the to calculate the size in the aes()
# look at the data again
head(irises)
# for this scatter plot you are wish to demonstrate the relationship between
# the width and length ofone particular portion of the iris flower (the sepal)
# this could show that the width of some species is greater than others and the 
# length of some species is greater than others
ggplot(irises, aes(x = Sepal.Length, y = Sepal.Width, color = Species))+geom_point(size = 5)
# zoom this plot in the options window on the bottom right of the RStudio IDE
# You will see that most of the setosa species of iris is wider than versicolor and
# and virginica, but the length is shorter than about half of the versicolor
# and almost all of the virginica species
# if you wish to indicate size of each iris in the plot relative to the others
# use a formula in the aaes function to dynamically change the size of the dots instead of a having a fixed size for each one.
ggplot(irises, aes(x = Sepal.Length, y = Sepal.Width, color = Species, size = Sepal.Length * Sepal.Width ))+geom_point()
# remember your job as a data analyst is to understand the data and then perhaps convey to your audience with visualizations what the data shows
# categorical plots shuch as bar and box plots compare different categories of data
# in the irises tipple, each species types has 50 rows of data
# a bar plot without any row selection criteria will only show this fact
# note that there is no y axis in a bar plot. A bar plot by default shows the count of rows in the tibble
ggplot(irises, aes(x= Species, fill = Species)) + geom_bar()
ggplot(irises, aes(x = Species, fill = Species ))
# but lets suppose you want to compare just the little irises by species
# part of your role as a data analyst is helping to define the definitions. What does little mean? Your stakeholder needs to be asked that if you are delivering an analysis to another party. 
print(irises, n=150)
# lets suppose we determine that a "small" iris is one that has a sepal.width of 2.5 or less, filter the rows based on the criteria
ggplot(filter(irises, Sepal.Width <= 2.5), aes(x = Species, fill = Species))+geom_bar()
# zoom this plot and you can see quickly that based on Sepal width, versicolor irises tend to be the biggest of the 3 species
# a box plot categorizes data like a bar plot, but it also divides the data into quartiles (each of four equal groups), for example in a series like - (1, 2, 3, 6, 19, 72, 78, 80) the first quartile would contain (1,2), the second quartile would contain (3,6) third would be (19, 72), fourth would be (78,80)
# the box plot will display values as whiskers ranging from the minimum value to the bottom of the box, the 2nd quartile ending at the median, within the box, the the third quartile extending up from the median to the top of the box, and the fourth quartile as the top whisker ranging from the top of the box to the maximum values. 
# most data has outliers or anomalies, think about a student who wins the lottery, at the exact same time they start an Ecampus test, they may decide then and there to drop out of school and the test will be scored as a "0". All other test scores range from 60 to 100. The 0 is an outlier. A Box plot determine outliers, based on a formula that I won't go into here,  and places them above or below the plot. 
ggplot(irises, aes(x = Species, y = Sepal.Width, color = Species)) + geom_boxplot()
# a box plot can be useful for your data analysis to spot outliers in your data, and perhaps investigate them before delivering your analysis to someone else
# distribution plots show how values are distributed over categories
# a histogram is similar to a bar plot, but it will stack values based on criteria that can be set
# you set the x paramater as some column in the tibble 
# additionally you define the number of bins for the plot 
# the default number of bins is 30 when creating a histogram 
# so for the irises tibble, which has 150 rows, each bin will contain a range of values based on a calculation that takes the minimum value in the colum and the maximum value and calculates equal increments based on the number of bins 
ggplot(irises, aes(x = Sepal.Length, fill = Species))+geom_histogram()
# notice the warning message 
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
# if your data logically should be placed 30 bins, great! just specify that in the command to avoid the warning message
ggplot(irises, aes(x = Sepal.Length, fill = Species))+geom_histogram(bins = 30)
# in this small dataset of irises it might make sense to use a smaller number of bins
ggplot(irises, aes(x = Sepal.Length, fill = Species))+geom_histogram(bins = 15)
# the resulting visual shows that all very small irises, when measured by Sepal.Length are setosa, all very large irises are virginica and somewhere around 5.75 - 6.00 centimeters is a length that can be found in all three species. 
# the plot also shows that in total, the fewest irises of any species has a length of 8.00 or greater and the most common length is between 4.00 and 5.00. In short histograms display a distribution by category and a total distribution that can greatly aid in interpreting data
# a KDE plot is a histogram that has been smooted into curves. It can be stacked or not. The visualization helps determine probability. 
ggplot(irises, aes(x = Sepal.Length, color = Species))+geom_density()
# to increase the density or thickness of the lines set the size in geom_density() function
ggplot(irises, aes(x = Sepal.Length, color = Species))+geom_density(size = 3)
# a stacked KDE plot should only be used when the lines don't overlap as the values of some of the categories will be obscured
ggplot(irises, aes(x = Sepal.Length, color = Species, fill = Species))+geom_density(position = "stack")
# an ECDF plot shows what percent of the data falls at or below the x value
ggplot(irises, aes(x = Sepal.Length, color = Species))+stat_ecdf(size = 1)
# this diagram shows the percentages a y axis, so for example, 25 % of the virginca species has a length between 7 and 8, 25 % of setosa has a length between 0 and 5, 50 % of setosa has a length less than 5, 50 % of versicolor has a length less than 6, and 50 % of virginica has length between 7 and 8. 
# there might be instances when plotting one line of all data, regardless of category makes sense, this can be done in different types of plots by omitting the Color parameter
ggplot(irises, aes(x = Sepal.Length))+stat_ecdf(size = 1)
# in this example tou see that 50 % of all irises, irrespective of species are less than 6 cms long in the length of the Sepal. 
# a plot can contain more than one dimension. In this example we will draw contour lines that measure two different columns 
ggplot(irises, aes(x= Sepal.Length, y = Sepal.Width, color = Species))+geom_density2d(size = 1)
# this plot would show that closer the lines the denser(more rows) in the data. 
# to adjust the bin size 
ggplot(irises, aes(x= Sepal.Length, y = Sepal.Width, color = Species))+geom_density2d(size = 1, bins = 20)
# for this type of complex plotting trial and error in setting bin size is necessary depending on the trends you wish to highlight in the data
# combining plots - often you might want to combine different types of plots into one visualization for example place a scatter plot to show exact data point into a 2d KDE plot 
ggplot(irises, aes(x = Sepal.Length, y = Sepal.Width, color = Species))+ geom_density2d(bins = 15, size = 1 ) + geom_point(size = 3)
# in this example you have a dot for each row of data placed on or within the lines of the 2d KDE plot. 
# a common example of this is combining a line plot with a scatter plot to show the exact data points of a progression line
ggplot(data = chicks, aes(x = Time, y = Weight, color = Chick))+geom_line() + geom_point()
# this type of plot might demonstrate for example that the weight for the chick number 25 increased dramatically between the 15th and 20th day. 
# Depending on the data set you a grid of plots can help tell your story
# in the Chicks tibble for example the chickens being studied have four seperate diets. It might be useful to plot each diet seperately and include in one grid. You can use the facet_wrap() function to determine how to parse out the plot, (which column) and also specify how many rows and columns you wish to put into grid
ggplot(chicks, aes(x = Time, y = Weight, color = Chick)) + geom_line() + facet_wrap(facets = vars(Diet), nrow = 2, ncol =2)
# in this example the chickens using diet 1 tend to have less deviation in weight gain than the chickens using diet 2, the very fattest chicken is on diet 3, you may have noticed in all of the Chicks plotting that we have done, one or more chicks have died. I'm not a chicken expert, but I can tell from the visualizations that some lines or data points end before the 20th day
# if you ever need help with a function you simply can type a ? in front of the function, dataset, or package, assuming the package has been installed into your R environment
? ggplot
# the results are displayed in the Help pane at the bottom right
? seq 
# the seq() is not in a package, it is native to the R language so help for the function is always available
? aes
? iris
? geom_bar
# this can be extremely useful and often avoids web surfing for solutions about what an object does, and what it requires