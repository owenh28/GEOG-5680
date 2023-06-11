giss <- read.csv('./mod-5/giss_temp.csv')

for (x in unique(giss$Year)){
  monthPts <- giss$TempAnom[which(giss$Year == x)]
  png(paste("./mod-5/plt/giss_temp_",x,".png",sep=''))
  plot(1:12, monthPts,
       xlab="Month", ylab="Temperature Anomaly", main = x)
  dev.off()
}




