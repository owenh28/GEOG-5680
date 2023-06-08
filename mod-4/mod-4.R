temperature <- read.csv('./mod-4/Temperature.csv')



# Summary stats for temperature
temp_sdtev <- sd(temperature$Temperature, na.rm = TRUE)
temp_mean <- mean(temperature$Temperature, na.rm = TRUE)

# and for salinity
salin_sd <- sd(temperature$Salinity, na.rm = TRUE)
salin_mean <- mean(temperature$Salinity, na.rm = TRUE)

# mean vals for each site
temp_mean_station <- tapply(temperature$Temperature, temperature$Station,
                            mean, na.rm = TRUE)
salin_mean_station <- tapply(temperature$Salinity, temperature$Station,
                             mean, na.rm = TRUE)
# Mean vals for each year

temp_mean_year <- tapply(temperature$Temperature, temperature$Year,
                         mean, na.rm = TRUE)
salin_mean_year <- tapply(temperature$Salinity, temperature$Year,
                          mean, na.rm=TRUE)
# Aggregate series
temp_month_year_station <- aggregate(temperature$Temperature, list(temperature$Month, temperature$Year,
                                        temperature$Station), mean, na.rm= TRUE)

salin_month_year_station <- aggregate(temperature$Salinity, list(temperature$Month, temperature$Year,
                                        temperature$Station), mean, na.rm= TRUE)

# Table

station_table <- table(temperature$Station)

year_table <- table(temperature$Year)

station_year_table <- table(list(temperature$Station, temperature$Year))