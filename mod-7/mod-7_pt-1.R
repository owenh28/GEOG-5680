temp <- read.csv('./datasets/Temperature.csv')
myplot <- ggplot(temp, aes(x=Salinity))
myplot + geom_histogram()