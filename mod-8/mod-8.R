library(dplyr)

gap <- read.csv('./datasets/gapminderData5.csv')
str(gap)
head(gap)
gap_gdp <- select(gap, country, gdpPercap)
head(gap_gdp)
gap_nogdp <- select(gap, -gdpPercap)
filter(gap, lifeExp > 65, continent == "Africa", year == 2007)
filter(gap, continent %in% c("America","Europe"))
gap %>% arrange(lifeExp) %>% head()

