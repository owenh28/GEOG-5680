deer <- read.csv('./datasets/Deer.csv')
xx <- 0:10
pp <- dpois(xx, 4)
barplot(pp, names=xx)