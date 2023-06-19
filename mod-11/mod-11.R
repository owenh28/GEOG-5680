library(data.table)

flights <- fread('./mod-11/flights14.csv')
dim(flights)
flights[origin=='JFK'& month == 6]
ans <- flights[order(origin, -dest)]
head(ans)

ans <- flights[, arr_delay]
ans <- flights[, list(arr_delay)]

