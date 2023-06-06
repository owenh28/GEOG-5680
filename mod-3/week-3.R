plot(iris$Petal.Length, iris$Petal.Width,
     xlab = 'Petal Length (cm)', ylab = 'Petal Width (cm)',
     main = "Fisher's Iris Dataset", pch= 16, col = iris$Species)
legend('topleft', legend = levels(iris$Species), pch = 16, col=c(1,2,3))
