library(ggplot2)
library(terra)
library(RColorBrewer)
library(sf)
library(viridis)

path_to_data <- system.file("shape/nc.shp", package="sf")
north_carolina <- st_read(path_to_data, quiet = TRUE)

north_carolina <- north_carolina[ , c("CNTY_ID", "NAME", "AREA", "PERIMETER")]

north_carolina

point_one <- st_point(c(0, 3))
point_two <- st_point(c(5, 7))
a_line <- st_linestring(c(point_one, point_two))
st_geometry_type(a_line)

st_crs(4326)
st_bbox(north_carolina)


NY8 <- st_read( "./mod-12/NY_data/NY_data/NY8_utm18.shp")

wna_climate <- read.csv("./mod-12/WNAclimate.csv")
wna_climate <- st_as_sf(wna_climate,
                        coords = c("LONDD", "LATDD"),
                        crs = 4326)
wna_climate

NY8 <- st_transform(NY8, crs = 4326)

oregon_tann <- read_sf("./mod-12/oregon/oregon/oregontann.shp")

plot(oregon_tann)
plot(st_geometry(oregon_tann))

binghamton <- subset(NY8, AREANAME == "Binghamton city")
ggplot() +
  geom_sf(data = binghamton) +
  theme_bw()


set.seed(1234)

random_pnts <- st_sample(north_carolina, size = 500)

random_pnts <- st_as_sf(random_pnts)

sf::sf_use_s2(FALSE)

bingies_neighbors <- st_filter(NY8, binghamton)

random_pnts <- st_sample(bingies_neighbors, size = 25)

random_pnts <- st_as_sf(random_pnts)

ggplot() +
  geom_sf(data = bingies_neighbors) +
  geom_sf(data = binghamton, fill = "blue") +
  geom_sf(data = random_pnts, color = "darkgreen") +
  theme_bw()


names(binghamton)
ggplot() +
  geom_sf(data = binghamton, aes(fill = POP8)) +
  theme_bw()

ggplot() +
  geom_sf(data = binghamton, aes(fill = PEXPOSURE)) +
  scale_fill_viridis(option = "viridis") +
  theme_bw()

ggplot() +
  geom_sf(data = binghamton, aes(fill = PEXPOSURE)) +
  scale_fill_viridis(option = "magma") +
  theme_bw()