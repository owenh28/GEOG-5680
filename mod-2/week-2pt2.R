co2 <- read.table("./week-2/co2_mm_mlo.txt", col.names = c("year", "month", "decdate", "average", "interpolated", "trend", "ndays"))
co2Vals1 <- co2$interpolated[which(co2$year <= 1985)]
co2Vals2 <- co2$interpolated[which(co2$year > 1985)]
co2Vals1mean <- mean(co2Vals1)
co2Vals2mean <- mean(co2Vals2)

co2$fmnth <- factor(co2$month)
