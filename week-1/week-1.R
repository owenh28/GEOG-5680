## My first r script for geog 5680
## Owen Harlacker, u1370317

print('Reading iris file...')
iris <- read.csv('./week-1/iris.csv')
## Summary stats section

print('mean:')
print(mean(iris$Sepal.Width))
print('s.d:')
print(sd(iris$Sepal.Width))
print('range:')
print(range(iris$Sepal.Width))

# Plot petals

plot(iris$Petal.Length, iris$Petal.Width, pch = 16, col = as.factor(iris$Species))

# Petal Area

iris$Petal.Area <- pi * iris$Petal.Length * iris$Petal.Width
write.csv(iris, './week-1/iris2.csv', row.names = FALSE)