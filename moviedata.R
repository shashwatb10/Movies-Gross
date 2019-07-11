#Importing the Data
getwd()
setwd("C:/Users/SHASHWAT/Documents/R tutorial 2")
mov <- read.csv("Section6-Homework-Data.csv")

head(mov) #top rows
summary(mov) #column summaries
str(mov) #structure of the dataset

#Activating GGPlot2
#install.packages("ggplot2")
library(ggplot2)

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar(aes(fill=Day.of.Week,color="Black")) #To check number of movies released on various days of the week

#We need to filter our dataset to leave only the 
#Genres and Studios that we are interested in

filt<-(mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

#Doing the same for the Studio filter:
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio == "WB") | (mov$Studio =="Fox") | (mov$Studio =="Universal") | (mov$Studio =="Sony") | (mov$Studio =="Paramount Pictures")
  
#Apply the row filters to the dataframe
mov2 <- mov[filt & filt2,]

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p 

#Add a Point Geom Layer
p + geom_point()

p + geom_jitter(aes(colour=Studio,size=Budget...mill.))+geom_boxplot(size=1,alpha=0.7)


#To remove extra points:
p + geom_jitter(aes(colour=Studio,size=Budget...mill.))+geom_boxplot(size=0.5,alpha=0.7,outlier.colour = NA) 

q <- p + geom_jitter(aes(colour=Studio,size=Budget...mill.))+geom_boxplot(size=0.5,alpha=0.7,outlier.colour = NA) 
q

#Non-data ink
q <- q +xlab("Genre") + ylab("Gross % US") + ggtitle("Gross % in US by Genre")
q

#Theme
q <- q + 
  theme(text = element_text(family="Comic Sans MS"),
              axis.title.x =element_text(colour="Blue",size=40),
              axis.title.y =element_text(colour="Blue",size=40),
              legend.title = element_text(colour = "Green",size=20),
              plot.title = element_text(colour = "Black",size=50),
              axis.text.x= element_text(size=20),
              axis.text.y= element_text(size=20),  
              legend.text= element_text(size=12)
            )
q$labels$size = "Budget $M"
q
