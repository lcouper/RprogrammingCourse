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
