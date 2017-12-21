# 1. Basic exploration of Diamonds data set.

library(ggplot2)
data(diamonds)

dim(diamonds) # 53940 obs and 10 variables
str(diamonds) # 3 Ordered Factors
str(diamonds$color)
?diamonds # D Represents the best Color

# 2. Create a histogram of the price of all the diamonds in the diamond data set.

ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 100, 
color = "black", fill = "Orange") + 
  ggtitle("Diamonds Price")

# 3. Describe the shape and center of the price distribution. 
summary(diamonds$price)

# 4. Diamond Counts

nrow(subset(diamonds, price < 500))
nrow(subset(diamonds, price < 250))
nrow(subset(diamonds, price >= 15000))

# 5. Exploring the Peak
ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 10, 
color = "black", fill = "Red") + 
  ggtitle("Diamonds Prices between 0$ and 1500$") + 
  coord_cartesian(xlim=c(0,1500))

# 6. Price by cut histogram
ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 100, 
color = "black", fill = "Green") + 
  ggtitle("Diamonds Price Cut") + 
  facet_grid(. ~ cut)

# 7. Price by Cut
by(diamonds$price,diamonds$cut,summary)

# 8. Scales and Multiple Histograms
ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 100, 
                                  color = "black", fill = "Violet") + 
  ggtitle("Diamonds Price Cut") + 
  facet_grid(. ~ cut)

# 9. Price per Carat by Cut
ggplot(diamonds) + geom_histogram(aes(x=price/carat), binwidth = 0.05,
                                  color = "black", fill = "Yellow") +
  ggtitle("Histogram of Price/Carat, facet/Cut.") + 
  scale_x_log10() +
  facet_grid(. ~ cut)

# 10. Price Box Plots
by(diamonds$price, diamonds$color, summary)
ggplot(diamonds) + geom_boxplot(aes(x = color,  y = price, fill = color)) + 
  coord_cartesian(ylim = c(0, 8000)) + 
  scale_y_continuous(breaks = seq(0,8000,500)) +
  ggtitle("Diamonds Price by Color.")

# 11. Interquartile range - IQR
by(diamonds$price, diamonds$color, summary)
by(diamonds$price, diamonds$color, IQR)

# 12. Price per Carat Box Plots by Color
ggplot(diamonds) + geom_boxplot(aes(x=color,y=price/carat, fill=color)) + 
  scale_y_continuous(breaks = seq(0,8000,500)) + 
  coord_cartesian(ylim = c(0,8000)) + 
  ylab("Price per Carat") +
  ggtitle("Price per Carat by Color")

# 13. Carat Frequency Polygon
ggplot(diamonds) + geom_freqpoly(aes(x = carat), binwidth = 0.02) + 
  scale_x_continuous(breaks = seq(0,5,0.1)) + 
  geom_hline(y = 2000,color = "red") + 
  ggtitle("Carat Frequency Polygon")


