# Week 2: Data Manipulation #

This week's **learning objectives** are to:

Become familiar with various ways of re-shaping and manipulating data in R including:
- subsetting data
- adding & removing columns and rows
- changing row and column names
- converting between different data 'classes'
- transposing data (flipping long and wide)

## Section 1: Subsetting data ## 

If you know the specific rows and columns you want to pull out, you can use either the square brackets [ , ] , or the $ (for columns only)
In the square brackets, list the rows first & columns second

Example
```
iris[ ,3] # To extract the third column of the iris data set
```
By leaving the "row" argument blank above, we're telling R, we want all the rows in the third column

Example:
```
iris[1:10, 1:4] # Pull out the petal and sepal measurements for the first 10 rows: 
```

For columns only, if you know the name of the column, you can use '$' with the column name

Example
```
iris$Species # Pulls out the Species column from the iris data set
```

Once you've isolated some subset of your data, you can then use functions on these subsets either by saving them as a new variable first, or directly.

Examples
```
  mean(iris[,3]) # calculate the mean of the third column of the data set
  # Same idea, but done with the intermediate step of defining a variable 'PetalLength'
  PetalLength = iris[,3] 
  mean(PetalLength)





