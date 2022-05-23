### R Workshop 1: Answers to Practice Exercises ###

#### 1. Simulating data ####

# 1.1)
# Assign '0' as heads and '1' as tails and use the sample function:
Tosses = sample(0:1, 50, replace = TRUE)

# 1.2)
Stems = runif(min = 3.4, max = 11.6, n= 20) 

# 1.3)
Samples = rnorm(100, mean = 0, sd = 1)

# 1.4) 
Indices = rep(1:10, times = 6)

# 1.5)
Indices2 = rep(1:10, each = 6)

# 1.6)
Empty = matrix(0, nrow = 3, ncol = 5)

# 1.7)
Simulated = c(35,8,1,9,12)
Empty[1,] = Simulated

#### 2. Importing and exploring data: mosquito example ####

# Note the file path may be different for you
Anopheles = read.csv("~/Downloads/Anopheles_Data.csv",  header = TRUE)

# 2.1)
AvgMos = mean(Anopheles$value)
AvgMos # 16.56

# 2.2)
MaxMos = max(Anopheles$value)
MaxMos # 1519

# 2.3)
which(Anopheles$value == max(Anopheles$value))
# OR:
which(Anopheles$value == "1519")

# 2.4)
Locations = Anopheles$sample_location_info

# 2.5)
unique(Locations) # 55 unique locations

# 2.6)
NorthF = Anopheles[Anopheles$sample_lat_DD >= 27.45672,]
SouthF = Anopheles[Anopheles$sample_lat_DD < 27.45672,]

# 2.7)
mean(NorthF$value) # Result = 13.03
mean(SouthF$value) # Result = 17.62

# 2.8)
t.test(NorthF$value, SouthF$value) 
# Diff significant at alpha = 0.05

# 2.9) 
MonthlyMos = aggregate(Anopheles$value ~ Anopheles$sample_month, FUN = mean)
# Looks like Jan and March had highest values
# January and February only have one data point 
# January looks like it may have been a typo

#### 3. Importing and exploring data: Disease example ####

# 3.1) 
Bacteria = read.table("~/Downloads/bacteria_data.txt", header= TRUE)
Bacteria$y = as.factor(Bacteria$y)
Bacteria$ap = as.factor(Bacteria$ap)

# 3.2)
head(Bacteria)

# 3.3) 
# There are many different ways to do this. Here are two:
summary(Bacteria$ap)
#OR
length(which(Bacteria$ap == "p"))
length(which(Bacteria$ap == "a"))

# Either way, we see: 124 in active, 96 in placebo

# 3.4)
length(unique(Bacteria$ID))
# 50 "Levels" where a level is a unique patient

# 3.5)
placebo = Bacteria[Bacteria$ap == "p",]
active = Bacteria[Bacteria$ap == "a",]

# 3.6)
summary(placebo$y)
summary(active$y)

# 3.7)
# There are many ways to do this. Here's one way to do it in a single line:
length(which(placebo$y =="y"))/ nrow(placebo)
# 84/96 (87.5%) positive for H. influenzae after placebo treatment

# 3.8) 
length(which(active$y =="y"))/ nrow(active)
# 93/124 (75%) positive after active treatment

#### Importing and exploring data: CA Animals Example ####

# 4.1)
Animals = read.csv("~/Downloads/CA_Animals.csv", header = TRUE, row.names = 1)
View(Animals)

# 4.2)
Totals = colSums(Animals) # Lizards are most abundant

# 4.3)
SiteE = Animals[5,]
sum(SiteE)
# OR:
sum(Animals[5,])

# 4.4)
Chipmunks = c(2, 4, 2, 0, 5, 1)

# 4.5)
Animals = cbind(Animals,Chipmunks)
 
# 4.6)
#Animals = cbind(Chipmunks, Animals) would have added Chipmunks as first column rather than the last

# 4.7)
SiteG = c(3,5,4,8,0,1,2,1)
Animals = rbind(Animals, SiteG)

# 4.8)
# We didn't assign a name for this row so R assigned it to be "7" (since it's the 7th row)

# 4.9)
rownames(Animals)

# 4.10)
rownames(Animals)[7] = "SiteG"

# 4.11)
colnames(Animals)[3] = "CaliforniaMouse"

# 4.12)
SmallMammals = Animals[,-4]

# 4.13)
NoFire = Animals[-c(2,3),]

# 4.14)
dim(NoFire)
# now 5 rows and 8 columns (previously 7 rows and 8 columns)

# 4.15)
Mouse = NoFire$DeerMouse + NoFire$CaliforniaMouse

# 4.16)
Mouse = NoFire[,2] + NoFire[,3]

# 4.17)
SmallMammals2 = NoFire[,-c(2,3)]
SmallMammals2 = cbind(Mouse, SmallMammals2)

# 4.18)
head(SmallMammals2)

# 4.19)
range(SmallMammals2$Mouse)
range(SmallMammals2$Voles)
# OR: 
var(SmallMammals2$Mouse)
var(SmallMammals2$Voles)
# Greater variability in mice than in voles

# 4.20)
SqSm = sqrt(SmallMammals2)
