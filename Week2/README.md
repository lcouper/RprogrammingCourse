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
```

You can also subset your data *based on values in other columns*. 
Similar to the above, you still tell R which data frame you're working in. 
But then instead of passing rows/columns, you can pass a logic statement (using ==, >, <=, etc)
  
Examples:
```
iris[iris$Species == "virginica",] # Pull out all the "virginica" species

iris[iris$Petal.Length >= 6.0,] # Pull out all species with petal.length greater than or equal to 6.0
```

## Section 2: Adding and removing rows and columns ###

This can be important if you are adding more data to your dataset, or later identifying data points you need to remove, etc.

To remove rows and columns, we can use a similar strategy as in subsetting, but make use of the '-' operator
Examples
```
  iris[-10, ] # Removes the 10th row of the dataset
 ```
  iris[ , -c(1,2)] # Removes the first two columns:
  
To add rows and columns, we can use the rbind (row bind) and cbind (column bind) function 
  
 Examples
 ```
 # Add another observation, "Flower 151" to the iris dataset:
 Flower151 = c(7.2, 3.0, 6.4, 2.5, "virginica")  
 rbind(iris, Flower151) 
 
 # Add a column with a randomly generated ID to the iris dataset:
 randomID = sample(1:150, 150, replace = FALSE)
 cbind(iris, randomID)
 ```
 
 ## Section 3: Changing row and column names ##

We can view and change the row and column names using: rownames(data), and colnames(data)

Example:
```
rownames(iris) # View the row names for the iris data set
colnames(iris) = c("Sepal.Length", "Sepal.Width", "Petal.Width", "Petal.Length", "Species") # change the colnames of iris dataset (switch petal width/length)
```
 
## Section 4: Data classes ##

R recognizes different data 'types' data 'structures'. 
Here is quick overview:
  
Data types:
- character = for text data
- numeric = for real numbers
- integer = for integers
- logical = for True/False statements
- factor = for integers/text with some sort of hierarchy
  
Data structures:
- data frames = can store different types of data classes
- matrices = can only hold one type of data class
  
Converting between different classes may be important, as R can sometimes mistake your intention for the data and there are some functions that require data of a certain class

Check data class by using "class" function:
Example
```
class(mtcars$gear)
```

Convert between different classes using functions like: as.numeric(), as.character(), as.factor()

Example
```
Grades = c("A", "B", "A", "A", "C", "A", "B")
Grades = as.factor(Grades)

Data = c(0,1,1,1,0,1,0,0,0,1,0,1,1)
Data = as.logical(Data) #note this converts 'Data' into a list of True / False statements
```


## Section 5: Data reshaping ##

Getting your data into the format you need analysis (aka data reshaping) is very important! (and time-consuming and hard)
  
Here are some basic ways you can reshape your data in R:
  
- Transpose your data (i.e. flip the rows and columns) using the 't' function
  Example
  ```
  iris2 = t(iris)
  ```

- Convert between wide and long form
  Example:
  ``` 
  View(mtcars) # mtcars is a dataset included in R (but if it doesn't open for you, trying first running 'library(datasets)'
  library(reshape2) # load the reshape2 package, needed to use the melt function below
  CarsMelt = melt(mtcars) # 'melt' the mtcars dataset (i.e., convert it from a wide format to a long format)
  
  
  CarMelt2 = melt(mtcars, id.vars = c("gear", "cyl")) # melt the dataset, but this time, preserve the gears and cylinder columns (basically you're telling R to classify your data based on the number of gears and cyls)
  
  chick_m <- melt(ChickWeight, id=2:4, na.rm=TRUE) # melt the chick weight dataset
  dcast(chick_m, diet ~ variable, mean) # 'cast' the dataset back to a wide format to easily see the average effect of diet on chick weight
  ```
  
  

