library(ggplot2)
library(reshape2)
str(iris)
orange <- read.csv('./datasets/orange.csv')
gapdata <- read.csv('./datasets/gapminderData5.csv')
str(VADeaths)

VADeaths2 <- melt(VADeaths, variable.name = 'DemClass', variable.name = 'DeathRate')

qplot(Sepal.Length, Petal.Length, data=iris, color = Species, size = Petal.Width, alpha = I(0.7))
qplot(Sepal.Length, Petal.Length, data = iris,
      color = Species, size = Petal.Width, alpha=I(0.7),
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Fisher's Iris data")
qplot(Sepal.Width, data=iris, geom='histogram', binwidth=0.1)
qplot(Species, Sepal.Width, data=iris, geom='boxplot')
qplot(age, circumference, data=orange, geom='line')
orange$Tree = factor(orange$Tree)
qplot(age, circumference, data=orange, color=Tree, geom='line')
myplot = ggplot(iris, aes(x=Sepal.Length, y=Petal.Length))
myplot + geom_histogram(aes(fill=continent))
myplot + geom_histogram(color='lightblue', fill='white') + facet_wrap(~ continent)
myplot + geom_histogram(fill='darkorange') + facet_grid(year ~ continent)
myplot + geom_density(aes(fill=continent), alpha=0.4)
myplot = ggplot(gapdata, aes(x=continent, y=lifeExp))
myplot + geom_boxplot()

myplot + geom_boxplot(aes(x=reorder(continent, lifeExp, median)))
myplot = ggplot(gapdata, aes(x=continent))
myplot + geom_bar()
myplot = ggplot(gapdata, aes(x = gdpPercap, y = lifeExp, color=continent)) + scale_x_log10()
myplot = myplot + geom_point() + geom_smooth(method='lm')

myplot = myplot + ggtitle("Life Expectancy vs. GDP") +
  xlab("GDP") + ylab("Life Expectancy")
myplot
ggsave("./mod-7/lifeexp_vs_gdp.png", myplot, width= 6, height=4)
myplot + theme_calc()
myplot + theme_economist()
myplot + theme_wsj()
myplot + theme_fivethirtyeight()


