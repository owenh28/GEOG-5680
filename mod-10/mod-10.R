library(ggplot2)

lotr <- read.csv('./mod-10/lotr_hw.csv')
str(lotr)
summary(lotr)

ggplot(lotr, aes(x = height, fill = role)) + geom_histogram(binwidth = 5,
                                                            alpha = 0.4,
                                                            position = "identity")
ggplot(lotr, aes(x = weight, fill = role)) + geom_histogram(binwidth = 5,
                                                            alpha = 0.4,
                                                            position = "identity")
aragorn = subset(lotr, role == "Aragorn")
ggplot(aragorn, aes(x = height, y = weight)) + geom_point()
cor.test(aragorn$height, aragorn$weight)
lm(weight ~ height, data = aragorn)
aragorn$height.cen = aragorn$height - mean(aragorn$height)
lm(weight ~ height.cen, data = aragorn)
fit1 = lm(weight ~ height.cen, data = aragorn)
class(fit1)
str(fit1)


plot(weight ~ height.cen, data = aragorn, pch = 16, col = 4,
     xlab = "Centered height (cm)", ylab = "Weight (kg)")
abline(fit1, col = 2, lwd = 2)
r2text = paste("r2=",round(summary(fit1)$r.squared,4))
text(20,65, r2text)
x = ggplot(aragorn, aes(x = height.cen, y = weight)) + geom_point()
x = x + geom_abline(slope = coef(fit1)[2], intercept = coef(fit1)[1])
hist(residuals(fit1))
plot(fit1, which = 4)

plot(fit1, which = 1)








