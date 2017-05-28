#Homework Help
#u/doorguote

#I cleaned up the spreadsheet just a little more. 
#Icombined all of your separate tables (barbell and dumbell, alex and khai) 
#into one table

######LOAD DATA########
setwd("C:/MyFile1/MyFolder1")  #CHANGE THIS TO THE FOLDER WHERE YOU .CSV IS LOCATED
df <- read.csv("data.csv")

#"df" is an objetc I created (you could name it Mickey Mouse, it doesn't matter) that is
#a "data frame". THis is the "R" way of saying spreadsheet table. If you type the following
#command, you'll see the table pop up like in a spreadsheet. The benefit of R is that 
#you don't accidentally mess up the table by deleting a row, not including the right cells in a formula, etc.
#the data frame exists and you give commands to change it or perform operations on it.
#You then can graph very easily.
View(df)

###########################3

#####LOAD PACKAGES####
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  ggplot2,   #ggplot2 is the package that does the main graphics.
  scales,     #In case you want to add more customization to your x- and y-axes (may not get used)
  ggthemes
  )
######################

# To look at the data graphically, it's first useful to understand how ggplot2 works
# A very helpful guide of what the language looks like and the types of plots it produces is here:
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

# If I want a boxplot, it's easy enough to code.

my.plot <- ggplot(data = df)+      # I usually have a full RETURN after every "layer" of ggplot so it's easier to read
  geom_boxplot(aes(x= Exercise, y=Power)) #Notice how easy this was. I'm creating a boxplot where the x-axis is exercise, y-axis is the data itself (power)

#The best part? because you ONLY told it to be lumped by exercise, ggplot ignores the Person, Session, Set, Repetion, etc. and does the statistical combination FOR YOU BEFORE MAKING THE GRAPHIC

#VIEW YOUR GRAPH
my.plot

#If you're unfamiliar with boxplots, read the wikipedia page on them. The dark black line is the median. The box represents the 25th percentile to 7th percentile of the values (note: the median = 50th percentile)
#The "whiskers" are the thin vertical lines, that extend to show how much data falls beyond the "standrad" 25th/7th percentile box. Larger verticial lines = more spread in the data


#THIS GGPLOT IS EXTREMELY BARE. You can customize so much of it.

#Want a different name for the axes?
my.plot +
  labs(x = "Type of Exercise", y="Power Expended", title="MY TITLE")
  
#Want your boxes filled red?  
ggplot(data = df)+     
  geom_boxplot(aes(x= Exercise, y=Power), fill = 'red')+
  labs(x = "Type of Exercise", y="Power Expended", title="MY TITLE")

#Want your plot to look like the plots printed by Nate Silver's fivethirtyeight.com?
#Want your boxes filled red?  
ggplot(data = df)+     
  geom_boxplot(aes(x= Exercise, y=Power), fill = 'red')+
  labs(x = "Type of Exercise", y="Power Expended", title="MY TITLE")+
  theme_fivethirtyeight()


#Let's consider this "lesson 1". Let me know when you are comfortable with the intro to ggplot as a package. Then we can make boxplots that do what you actually want to do--introducing all your factors!



