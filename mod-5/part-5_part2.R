giss <- read.csv('./mod-5/giss_temp.csv')

allyears = unique(giss$Year)
nyears = length(allyears)

ann_temp = mycols = rep(NA, nyears)

for (i in 1:nyears) {
  ann_temp[i] = mean(giss$TempAnom[giss$Year == allyears[i]])
  mycols[i] <- ifelse(allyears[i] < 1980, 'green', 'purple')
}
plot(allyears, ann_temp, type = 'h',
     col = mycols, lwd = 3,
     xlab= "Year", ylab = "T anomaly")