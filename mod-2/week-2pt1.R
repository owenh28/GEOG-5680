# Data Input and data general info about data
fluDeaths <- read.csv('./week-2/BirdFlu_deaths.csv')
fdNames <- names(fluDeaths)
fdHead <- head(fluDeaths)
fdStr <- str(fluDeaths)

# Find max fluDeaths in the year 2005 and store it, then find position of that number and the associated country
fd2005 <- max(fluDeaths$yr2005)
fdRow2005 <- which(fluDeaths$yr2005 == fd2005)
# Could also use which.max for direct row number
fdRow2005_2 <- which.max(fluDeaths$yr2005)
maxCountry2005 <- fluDeaths[fdRow2005, which(fdNames == 'Country')]
maxCountry2005

# Same here but for year 2007
fd2007 <- max(fluDeaths$yr2007)
fdRow2007 <- which(fluDeaths$yr2007 == fd2007)
maxCountry2007 <- fluDeaths[fdRow2007, which(fdNames=='Country')]
maxCountry2007