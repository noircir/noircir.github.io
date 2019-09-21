#' ---
#' title: "Plots of cars data with ggplot2"
#' author: "Michael Friendly"
#' category: "ggplot2"
#' date: "06 Apr 2017"
#' ---


#' ## Load the `mtcars` data
data(mtcars, package="datasets")
str(mtcars)

#' ## Plot with base graphics
#' This doesn't quite come out right because it is hard to coordinate the 
#' choices for point symbols and colors in the plot with those in the legend

mtcars$cyl <- as.factor(mtcars$cyl)
plot(mpg ~ hp , data=mtcars, 
     col=cyl, pch=c(4,6,8)[mtcars$cyl], cex=1.2)
legend("topright", legend=levels(mtcars$cyl),
       pch = c(4,6,8),
       col=levels(mtcars$cyl))

#' ## Plots with ggplot2
library(ggplot2)
ggplot(mtcars, aes(x=hp, y=mpg, color=cyl, shape=cyl)) +
  geom_point(size=3)

#' add separate regression lines
ggplot(mtcars, aes(x=hp, y=mpg, color=cyl, shape=cyl)) +
  geom_point(size=3) +
  geom_smooth(method="lm", aes(fill=cyl)) 

#' add overall smooth
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(size=3, aes(color=cyl, shape=cyl)) +
  geom_smooth(method="loess", color="black", se=FALSE) +
  geom_smooth(method="lm", aes(color=cyl, fill=cyl)) 

#' change the theme
last_plot() + theme_bw()

#' ## break it down into stages
plt <-
  ggplot(mtcars, aes(x=hp, y=mpg, color=cyl, shape=cyl)) +
  geom_point(size=3) 

plt +
  geom_smooth(method="lm", aes(fill=cyl)) 

plt +
  geom_smooth(method="lm", aes(fill=cyl)) +
  geom_smooth(method="loess", color="black", se=FALSE)
  
## faceting
plt <-
  ggplot(mtcars, aes(x=hp, y=mpg, color=cyl, shape=cyl)) +
  geom_point(size=3) +
  geom_smooth(method="lm", aes(fill=cyl)) 

plt + facet_wrap(~cyl)

plt + facet_wrap(~gear)




library(ggplot2)
library(ggrepel)

ggplot(mtcars, aes(wt, mpg)) +
  geom_point(color = 'red') +
  geom_text_repel(aes(label = rownames(mtcars))) +
  theme_classic(base_size = 16)


x = 1:100
y = sqrt(x)
plot(x,y, type='l')
