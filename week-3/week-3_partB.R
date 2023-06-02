squid <- read.csv('./week-3/squid.csv')
hist(squid$GSI, xlab = 'GSI', main = 'Histogram of GSI for the squid dataset')
hist(subset(squid, Sex == 1, GSI, drop = TRUE), xlab = 'GSI',
     main = 'Histogram of GSI for the squid dataset, Sex = 1')
hist(subset(squid, Sex == 2, GSI, drop = TRUE), xlab = 'GSI',
     main = 'Histogram of GSI for the squid dataset, Sex = 2')
squid$GSIlog <- log(squid$GSI)
boxplot(GSIlog ~ Sex, squid, ylab = 'GSI', col = c('blue', 'red'),
        main = 'Boxplots comparing each Sex')

boxplot(GSI ~ Location, squid, main = 'GSI based on each location',
        col = c('red', 'orange', 'green','blue')[squid$Location])