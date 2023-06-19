co2 <- read.csv("./mod-13/co2_mm_mlo.csv")
plot(co2$decdate, co2$interpolated, type='l', main="Mauna Loa CO2",
     xlab="Time", ylab="ppm")
lines(co2$decdate, co2$trend, col=2, lwd=2)