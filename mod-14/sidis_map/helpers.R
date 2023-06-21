make_map <- function(shp, variable, nclr, pal = "Greens", logtrans=FALSE) {
  breaks.qt <- classIntervals(shp@data[,variable], nclr, style = "jenks")
  plotclr <- brewer.pal(nclr, pal)
  spplot(shp, variable, col.regions = plotclr, col = "lightgray",
         at = breaks.qt$brks)
  if(logtrans){
    shp@data[,variable] <- log10(shp$data[,variable])
  }
}