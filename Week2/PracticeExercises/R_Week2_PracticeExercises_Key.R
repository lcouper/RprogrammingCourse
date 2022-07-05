#### Week 2: Practice Exercises Key #####

#### 1. Reshaping data: Microbiome example ###

# 1.1)
md = read.csv("~/Downloads/MicrobiomeData.csv", header = TRUE, row.names = 1)

# 1.2)
md = md[,-1]

# 1.3)
rowSums(md) 

# 1.4)
mdt = t(md)

# 1.5)
class(mdt) # The data got converted to a "matrix" data class during the tranpose step.
mdt = as.data.frame(mdt)
class(mdt) # Check that it worked

# 1.6)
mean(mdt$Rickettsia) # 8087.953

# 1.7)
library(plyr)
Ricks = arrange(mdt, Rickettsia)

# 1.8)
sort(colSums(mdt)) # Shows us that Bacillus is the second most common (recall instructions say to discount "Other")

# 1.9)
Samples = rownames(mdt)

# 1.10)
mdt2 = cbind(Samples, mdt)

# 1.11)
Melted = melt(mdt2)

# 1.12)
hist(Melted$value)


# 1.13)
# This shows us the distribution of sequence values for different bacteria,
# but ignores the specific name of the bacteria 
# I.e. doesn't care if it's called Rickettsia, Bacillus, other, etc, 
# It just looks at how many sequences are found in each case

# 1.14)
# It reformatted the data so that all the species names were in 1 column, 
# and we could ignore this column when plotting if we wanted


#### Data reshaping: Esophageal cancer example ####

# 2.1) 
library(datasets)

# 2.2)
colnames(esoph) = c("age_group", "alcohol_consump", "tobacco_consump", "num_cases", "num_controls")


# 2.3) 
class(esoph$tobacco_consump) # this column is an ordered factor, meaning there 
# is an order associated with the different values -- 
# i.e., 0-9g/ day is a level below 10-19, which is below 20-29 and so forth
levels(esoph$tobacco_consump)

# 2.4) 
youngest = esoph[esoph$age_group == "25-34",]

# 2.5)
summary(youngest$alcgp) # the 80-119 category has the fewest records

# 2.6)
sum(youngest$ncases) # 1 case
sum(youngest$ncontrols) # 116 controls 

# 2.7)
dcast(esoph, age_group ~ alcohol_consump, sum)

# 2.8)
dcast(esoph, age_group ~ tobacco_consump, sum)

# 2.9) 
#install.packages("dplyr") # install dplyr package
library(dplyr) # load package
esoph$age_group = recode_factor(esoph$age_group, '25-34' = "23-34")
View(esoph)

# 2.10)
esoph$tobacco_consump = recode_factor(esoph$tobacco_consump, '0-9g/day' = "1-9g/day")

# 2.11) 
esoph[17, 4:5] = c(4,17)



