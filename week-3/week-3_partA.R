par(mfrow=c(3,3))
# Generic Plot of Iris
plot(iris$Petal.Length, iris$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset", pch= 16, col = 'violet')

# Petal Length vs petal width, different colors for different species
plot(iris$Petal.Length, iris$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset", pch= 16, col = iris$Species)
legend('topleft', legend = levels(iris$Species), pch = 16, col=c(1,2,3))

# Subset of above with setosa
setosa <- subset(iris, Species == 'setosa')
plot(setosa$Petal.Length, setosa$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset, Setosa Subset", pch= 16, col = 'goldenrod2')

# Different symbols for different species

plot(iris$Petal.Length, iris$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset", pch= c(15, 16, 23)[as.numeric(iris$Species)], col = 'orangered1')
legend('topleft', legend = levels(iris$Species), pch= c(15, 16, 23), col='orangered1')
# Different symbol sizes

plot(iris$Petal.Length, iris$Petal.Width, xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset", pch = 16, col = 'salmon', cex = c(0.5,1,1.5)[as.numeric(iris$Species)])

# Smoothing line

plot(iris$Petal.Length, iris$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset",  col = 'violet')
scatter.smooth(iris$Petal.Length, iris$Petal.Width,
               xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
               main = "Fisher's Iris Dataset",  col = 'violet')