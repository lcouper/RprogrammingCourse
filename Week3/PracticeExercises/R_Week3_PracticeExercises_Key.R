### Week 3 Practice Exercises Key ####

#### 1. Analysis and plotting: Tick example ####
# 1.1)
Ticks = read.csv("~/Downloads/TickCounts.csv", header = TRUE, row.names = 1)
# There are many options for "inspecting the dataset". Here are a few I commonly use:
head(Ticks) 
View(Ticks)
str(Ticks)

# 1.2)
class(Ticks) # it's a dataframe. If it wasn't, use code below to convert it to a dataframe:
Ticks = as.data.frame(Ticks)

# 1.3)
sapply(Ticks[,1:5], FUN = mean)
# sapply function lets you apply a function to multiple columns & rows at once

# 1.4)
sapply(Ticks[,1:5], FUN = range)

# 1.5)
hist(Ticks$TickCount, main = "Distribution of tick counts",
     xlab = "Tick counts", col = "skyblue") # Go TarHeels :) 

# 1.6)
plot(TickCount ~ DeerCount, data = Ticks)
# No obvious trend

# 1.7)
plot(TickCount ~ SiteSize, data = Ticks,
     main = "Tick Counts Versus Site Size",
     pch = 16, cex = 1.5,
     col = "darkblue",
     xlab = "site size (hectares)", ylab = "tick count")
abline(lm(TickCount ~ SiteSize, data = Ticks))
# Does appear to be a relationship between site size and tick counts

# 1.8) 
model1 = lm(TickCount ~ SiteSize + HostDiversity + LizardCount, data = Ticks)
summary(model1)
# pretty high R squared (in ecology, R2 > 0.5 is AMAZING!)

# 1.9) 
Actual = as.data.frame(cbind(Ticks$SiteSize, Ticks$HostDiversity, Ticks$LizardCount))
colnames(Actual) = c("SiteSize", "HostDiversity", "LizardCount")
View(Actual)

# 1.10)
PredictTicks = predict.lm(model1, Actual)

# 1.11)
plot(Ticks$TickCount ~ PredictTicks, pch = 16)
abline(lm(Ticks$TickCount ~ PredictTicks), col = "red")

# 1.12)
Diff = PredictTicks - Ticks$TickCount

# 1.13)
sort(Diff) 
# Site 8 has many more actual ticks than predicted
# Site 6 has many fewer actual ticks than predicted

# 1.14)
model2 = lm(TickCount~ SiteSize + HostDiversity + LizardCount + DeerCount, data = Ticks)
AIC(model1)
AIC(model2)
# Model 2 is slightly worse (although differences <2 in AIC don't really matter)
# But essentially adding deer count info doesn't substantially improve our model

# 1.15) 
North = Ticks[Ticks$SiteLocation == "North",]
South = Ticks[Ticks$SiteLocation == "South", ]

# 1.16)
t.test(North$TickCount, South$TickCount)

# 1.17)
# mean for North sites = 58.4, mean for South sites = 64.5

# 1.18) 
# p-value = 0.5057, so there is no statistical difference between sites
# (or in statistical speak, 'we fail to reject the null hypothesis that there is no significant difference')

# 1.19)
t.test(Ticks$TickCount ~ Ticks$RatCount)
# Doesn't work because rat count has >2 levels, and we can 
# only do a t.test on a vector or data with 2 levels

# 1.20)
SizeCat = c("Med", "Large", "Med", "Large", "Large", "Large", "Small", "Small", 
            "Med", "Large", "Med", "Med", "Small", "Large", "Small", "Med")
class(SizeCat)

# 1.21)
SizeCat = as.factor(SizeCat) 

# 1.22)
Ticks2= cbind(Ticks, SizeCat)
View(Ticks2)

# 1.23)
dim(Ticks2) # 16 rows, 9 columns

# 1.24)
fit = aov(HostDiversity ~ SizeCat, data = Ticks)
summary(fit) # No significant difference in host diversity based on these size categories (i.e, p > 0.05)

# 1.25)
boxplot(HostDiversity ~ SizeCat, 
        col = c("darkgreen", "limegreen", "palegreen"),
        data = Ticks)
# These are two ways of determining whether host diversity differs based on site size
# The ANOVA can tell us the p-value of the statistical test on this relationship
# The boxplot can graphically show us how sites differ 
# (and the overlapping ranges of the boxplot indicate that there is no statistical difference)


# 1.26)
mean_counts = c(71, 65, 41.75)

# 1.27) 
labels = c("Large", "Med", "Small")
pie(mean_counts, labels = labels, col = c("darkblue", "blue", "lightblue"),
    main = "Tick Counts By Site")
# the labels function added text labels next to each slice of the pie

# 1.28)
cor(Ticks$RatCount, Ticks$MouseCount)
# correlation: 0.03098345. 
# This is quite low. The rat and mouse counts don't appear to vary similarly

# 1.29) 
cor(Ticks$RatCount, Ticks$DeerCount)
# correlation: 0.5053624. Rats and deer are more strongly correlated than rats & mice.

# 1.30)
Counts1998 = c(21, 9, 13, 14, 27, 18, 6, 15, 10, 11, 4, 29, 18, 7, 18, 19)
class(Counts1998)
# The data class is 'numeric'. Numeric data can be any real number
# while integers must be positive, whole numbers

#1.31) 
t.test(Counts1998, Ticks$TickCount)
# Output indicates they are not significantly different

# 1.32
par(mfrow = c(1,2))
hist(Counts1998,col = "pink")
hist(Ticks$TickCount, col = "skyblue")
# The par line adjusted the plotting window to allow us to 2 plots in a single row 
# The distributions look roughly similar, but the current year's counts appear higher



#### 2. Self-guided analysis and plotting ####
# Using example dataset "road"
# Which has info about road deaths in the US

plot(deaths ~ popden, data = road)

# Removing DC (outlier, masking trends)
roads2 = road[-9,]
plot(deaths ~ popden, data = roads2)
abline(lm(deaths ~ popden, data = roads2))
# No apparent trend between population density and road deaths

# Trying now to understand what variables relate to road deaths
fit = lm(deaths ~ rural + popden + fuel + temp, data = roads2)
summary(fit)
# Looks like rural and temp are important
fit2 = lm(deaths ~ rural + temp, data = roads2)
summary(fit2)
AIC(fit) - AIC(fit2)
# They're essentially equivalent models 

# How do road deaths vary by state?
# pie charts are THE WORST, but this is just for practice
pie(roads2$deaths, labels = rownames(roads2),
    col = sample(palette(rainbow(30)), 25, replace = FALSE))

# Much better to do a histogram or barplot
barplot(roads2$deaths, main = "road deaths by state", las =2,
        ylim = c(0,5000))
