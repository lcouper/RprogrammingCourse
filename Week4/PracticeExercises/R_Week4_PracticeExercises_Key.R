#### Week 4 Practice Exercises Key ####

#### Part 1: Small Diversity Example ####

# 1.1)
Rich = c(5,8,7,13,11,10,11,7,10,7,8,5,6,9,9,8,11,8,9,5,6,8,6)

# 1.2)
length(Rich) # There are 23 entries

# 1.3)
LogRich = rep(0,23)

#1.4)
for (i in 1:length(Rich))  # Could have also written this as for (i in 1:23)
{LogRich[i] = log(Rich[i])}
LogRich
# Output values are all ~ 1-2, so looks like it worked correctly

# 1.5)
SpDiversity = c(0.14, 0.92, 0.78, 1.44, 0.824, 0.876, 0.52, 0.72, 1.09, 0.75,
                0.64, 0.78, 0.81, 0.60, 0.57, 0.34, 0.29, 0.694, 1.194, 0.561,
                0.11, 0.65, 0.422)
# 1.6)
Evenness = vector(mode = "numeric", length = 23)

# Note this is a different way to create an empty vector
# We could have also done:
Evenness = rep(0,23) # as before

# 1.7)
for (i in 1:23) {
  Evenness[i] = SpDiversity[i]/ LogRich[i]
}

# 1.8)
range(Evenness)
# all between 0 and 1 so function seems to be working properly

# 1.9)
SpEvenness = function(x,y) {
  evenness =  y/ log(x)
  print(evenness)
}


# 1.10)
x = SpEvenness(Rich, SpDiversity)
Evenness
# we see that they are the same. One way we could have checked this:
x == Evenness # the == command asks R whether the two vectors are equal, position by position


# 1.11)
DivCategory = vector(mode = "character", length = 23)

# 1.12)
for (i in 1:23)
{
  if (SpDiversity[i] < 0.50)
  {DivCategory[i] = "Low"}
  if (SpDiversity[i]> 0.50 & SpDiversity[i]<1.0)
  {DivCategory[i] = "Medium"}
  if (SpDiversity[i] > 1.0)
  {DivCategory[i] = "High"}
}

# 1.13)
DivCategory
# we could manually count the number of low, medium, and high sites.
# or there is a neat way we could get R to do this for us:
summary(as.factor(DivCategory))

# 1.14)
Size = c(19, 259, 97, 150, 118, 59, 28, 331, 210, 170, 441, 48, 256,21,
         378, 182, 140, 146, 74, 73, 59, 222, 239)

# 1.15)
plot(SpDiversity ~ Size, # Create scatterplot, add a title and some color 
     main = "Species Diversity by Site Size",
     pch = 16, col = "purple") 

# 1.16)
fit1 = lm(SpDiversity ~ Size) # Run a single linear regression
summary(fit1)
# p = 0.62 so we fail to reject the null (i.e., there is no significant relationship)
# We could also add this line of best fit onto our plot from before using:
abline(fit1) 


# 1.17)
Size2 = rep(0,23)
for (i in 1:23) {
  Size2[i] = Size[i] * 10000}


# 1.18)
SizeConvert = function(x)
{y = x*10000
print(y)}

# 1.19)
SizeConvert(Size)
# Output is the same as that of the for loop

# 1.20)
# They are both essentially ways of scaling up a calculation or function call many times 

# 2.1)
Mosqs = read.csv("~/Downloads/Anopheles_Data.csv", header = TRUE)

# 2.2)
length(which(Mosqs$sample_location_info == "Thousand Oaks"))
# 91 observations

# 2.3)
for (i in 1:2270)
  if(Mosqs[i, 3] == "Thousand Oaks")
  {Mosqs[i,2] = Mosqs[i,2]/2}

# 2.4)
# We wanted the for loop to run over all possible rows, 
# and there were 2270 rows in out dataset. We can see this by running:
nrow(Mosqs)
# Another way we could have set up the for loop is:
# for (i in 1:nrow(Mosqs))
# This way, if the number of rows changes later, we don't need to adjust our code


# 2.5) 
# We didn't create an empty vector here because we wanted to overwrite the original dataset
# rather than create a new vector/data set with data

# 2.6)
for (i in 1:2270)
  if(Mosqs[i,3] == "French")
  { Mosqs[i,2] = Mosqs[i,2] + 3}

# 2.7)
QuickPlots = function(a1)
{plot(a1[,6],a1[,2], main = "Mosquito Abundance by Time", col = "blue", pch = 16,
      xlab = "Month", ylab = "Mosquito Abundance")}

# There is no real reason why we used 'a1' as the placeholder variable here, 
# instead of x. Except to show you that you can put whatever you like here 
# as long as you are then consistent with using it inside the command call
# on the next lines

#2.8) The input is now a data frame. You could check this by running:
class(Mosqs)

# 2.9)
QuickPlots(Mosqs) 
# Should get a plot of mosquito abundances over time, shown in blue, filled dots

# 2.10)
QuickStats = function(a1)
 { print(c(mean(a1[,2]), sd(a1[,2]), range(a1[,2])))}

# 2.11)
QuickStats(Mosqs) # outputs the mean, sd, and range of mosquito values
# mean = 16.55, sd = 56.6, range = [0, 1519]

# 3.1)
VO2max = read.csv("~/Downloads/VO2max_AsthmaStudy.csv", header = TRUE, row.names = 1)

# 3.2)
nrow(VO2max) # 14 participants
summary(as.factor(VO2max$Intervention)) # 9 in the control 5 in the treatment

# 3.3)
VO2avgs = rep(0,14)

# 3.4)
for (i in 1:nrow(VO2max))
     {VO2avgs[i] = mean(as.numeric(VO2max[i,2:5]))}
# the mean function only works on numeric or integer data. 
# But we wanted to input data of class 'data frame'. 
# we needed to include the as.numeric() function 
# to essentially force R to consider our data 'numeric'

# 3.5)
VO2max = cbind(VO2max, VO2avgs)

# 3.6)
boxplot(VO2max$VO2avgs ~ VO2max$Intervention,
        col = c("skyblue", "darkblue"),
        main = "VO2 max based on treatment")

# 3.7)
t.test(VO2max$VO2avgs ~ VO2max$Intervention)
# There is a statistically significant difference in VO2 max values between groups (p <0.05)
# with the treatment group being higher than the control
# Based on this data alone, it appears the treatment is effective, 
# but this is a pretty small dataset
       