# Week 2 Practice Exercises # 

Reminder of the important notes before starting: 
- Feel free to write out the code/answers for the questions below if that's helpful to you, or feel free to just use these exercises to guide your exploration (no one is grading you!)

- For nearly all of these problems, there are many different ways you could solve them. In the answer key, I provide one (or sometimes two) potential ways, but these aren't necesssarily the only "right" answer

- You are encouraged to use any and all tools available to you, especially the internet! You are not expected to "know" how to do these problems yet or to memorize any of these functions or steps. Virtually everyone who uses R is constantly using the internet/ R help tools for reference and guidance

### 1. Reshaping data: Microbiome example ###

1.1) Download and import the "Microbiomedata" csv. Store this data in a new data frame (variable) called "md"
Make sure when you import the dataset that you indicate that there are both column names AND row names.
In this dataset, the row names are names of bacteria found in the microbiome of a tick and the column names are sample identifiers. 
The values represent the number of sequences attributed to each microbe for that sample (like a relative abundance)

1.2) The sample 'PW005' was later found to have issues - remove this column and overwrite the original dataset with this change

1.3) What are the sums of each row in this data frame? (hint: you may need to do some googling to find the correct function call)

1.4) Transpose this data frame so that the samples are now represeted as rows, and the columns are now bacteria. Save the transposed data in a new variable called "mdt"

1.5) Check the class of this new variable, mdt. What happened?. Convert it back to a data frame, using the as.data.frame( ) function

1.6) "Rickettsia" is a particuarly important bacteria inside the tick. What is the average abundance (value) of Rickettsia across all ticks?

1.7) Re-arrange the dataset so that the rows are listed in increasing order of Rickettsia abundance (i.e., low to high abundance) using the code below. Note this requires installing and loading the 'plyr' package - a common package for splitting/combining data.

```
install.packages("plyr")
library(plyr)
Ricks = arrange(mdt, Rickettsia)
```

1.8) What is the *second* most abundant bacteria across all samples after Rickettsia? (Don't count the "Other" column here). There are lots of ways you could do this. If you are stuck, try using the sort function on the column sums

1.9) Create a new variable called "Samples" which is equal to the rownames of the mdt dataset

1.10) Now create a new data frame (mdt2) that has "Samples" as the first column, and all other columns from mdt after that. View this dataset. It should look a little weird because the rownames and first column will be identical. You'll see why we did this is the next step though.

1.11) Now convert this mdt2 dataset from wide format to long format using the "melt" function. Save the output in a new data frame called "Melted"

1.12) We haven't gotten to plotting yet, but lets create a histogram of this dataset to see the distribution of the "values" using the following code:
```
hist(Melted$value)
```


1.13) What is this plot showing you? 

1.14) How did "melting" the data frame enable us to create this plot?


### 2. Data reshaping: esophageal cancer example ###

2.1) Load the 'esoph' data in R using the code below. The 'esoph' data in R contains records on 88 age/alcohol/tobacco combinations from a case-control study in France. Check out the following page for information on what's contained in this datase: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/esoph.html

```
library(datasets)
# Note that the 'esoph' data set is now automatically loaded and is stored in a variable called "esoph"
```

2.2) To start, lets change the column names to be more informative. Change the column names to: "age_group", "alcohol_consump", "tobacco_consump", "num_cases", "num_controls"

2.3) Check the class of the 'tobacco_consump' column. What does it mean for a factor to be ordered?

2.4) Lets say we are only interetsed in looking at records for 25-34 year olds. Create a new variable "youngest" and store just these records here

2.5) What is the *least common* level of alcohol consumption among the 25-34 year olds?

2.6) How many total cases are included in the 'youngest' age category? How many total controls?

2.7) Returning to the full data (i.e., all age classes), use the following code to see how many controls are included in each combination of age class and alcohol consumption levels:

```
dcast(esoph, age_group ~ alcohol_consump, sum)
```
Do you notice any patterns here with alcohol consumption by age categories? 

2.8) How could you adapt the code above to see how many controls are included in each combination of age class and *tobacco* consumption levels?

2.9) We later learn that the age categories were coded incorrectly -- the "25-34" category should instead read "23-34." Use the code below, which makes use of the 'recode' function (in the dplyr package) to "recode" all instances of 25-34 to the proper 23-34. Check that this worked by viewing the dataset.

```
install.packages("dplyr") # install dplyr package
library(dplyr) # load package
esoph$age_group = recode(esoph$age_group, '25-34' = "23-34")
```

2.10) How could you adapt the code above to recode all instances of "0-9g/day" to "1-9g/day" in the tobacco_consum column?

2.11) A few cases and controls were later added to the study. Specifically, there were 3 additional cases and 3 additional controls in the category: "35-44" age, 0-39g/day alcohol consumption and 10-19 tobacco consumption (i.e., row 17). How could you alter the dataset to reflect this?





