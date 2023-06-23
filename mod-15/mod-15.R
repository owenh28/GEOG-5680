library(tmap)
library(sf)
library(raster)

NY8 <- st_read('./mod-15/NY_data/NY8_utm18.shp')

Syracuse <- NY8[NY8$AREANAME == 'Syracuse city',]
plot(Syracuse[,"POP8"])

tm_shape(Syracuse) + tm_borders()+tm_fill('POP8', palette = 'viridis', style = 'quantile') +
  tm_graticules(col='lightgray')+ tm_compass(position = c("left", "bottom"))+  tm_credits(date(), position = c("right", "top"))


tmap_mode("view")
names(Syracuse)
tm_shape(Syracuse) + tm_borders() + tm_fill("Cases", palette = "Greens")
tmap_mode("plot")


wna_climate <- read.csv('./mod-15/WNAclimate.csv')
str(wna_climate)
wna_climate <- st_as_sf(wna_climate, coords = c('LONDD', 'LATDD'), crs = 4326)
tm_shape(wna_climate)+tm_symbols(col = 'Jan_Tmp', alpha = 0.5, palette = '-RdBu')


countries <- st_read('./mod-15/ne_50m_admin_0_countries/ne_50m_admin_0_countries.shp')

tm1 <- tm_shape(wna_climate)+tm_symbols(col = 'Jan_Tmp', alpha = 0.75, palette = '-RdBu') + tm_shape(countries)+
  tm_borders(col='gray')+tm_style('classic')
tm2 <- tm_shape(wna_climate)+tm_symbols(col = 'Jul_Tmp', alpha = 0.75, palette = '-RdBu') + tm_shape(countries)+
  tm_borders(col='gray')+tm_style('classic')

tmap_arrange(tm1, tm2)



r <- raster('./mod-15/air.mon.ltm.nc', varname = 'air')

r <- rotate(r)
crs(r) <- 4326
names(r) <- 'jan_tmp'
tm_shape(r)+tm_raster('jan_tmp', style = 'fisher', palette = '-RdBu', n=11) + tm_shape(countries)+
  tm_borders()+tm_layout(legend.bg.color ='white', legend.bg.alpha = 0.6, legend.outside = TRUE, legend.outside.position = 'left')
