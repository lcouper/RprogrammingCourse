# Week 2: Data Manipulation #

This week's **learning objectives** are to:

Become familiar with various ways of re-shaping and manipulating data in R including:
- subsetting data
- adding & removing columns and rows
- changing row and column names
- converting between different data 'classes'
- converting between long and wide data forms

## Section 1: Subsetting data ## 

Last week we discussed subsetting data when you know the specific rows and columns you want to pull out (i.e., using either the square brackets [ , ] , or the $ for columns)

You can also subset your data *based on values in other columns*. 
Here, instead of indexing based on rows & columns, you can pass a logic statement (using ==, >, <=, etc)
  
For example:   
*(Note the examples below use the built-in dataset 'iris'. If it's not already loaded for you, run *'library(datasets)')
```
iris[iris$Species == "virginica",] # Pulls out all rows that have "virginica" as the species

# Can do the same with numeric data
iris[iris$Petal.Length >= 6.0,] # Pull out all species with petal.length greater than or equal to 6.0
```

## Section 2: Removing and adding rows and columns ###

This can be important if you are adding more data to your dataset, or later identifying data points you need to remove, etc.

To remove rows and columns, we can use a similar strategy as in subsetting, but make use of the '-' operator  
For example:
```
  iris[-10, ] # Removes the 10th row of the dataset

  iris[ , -c(1,2)] # Removes the first two columns  
```

Similar to the above, we can also remove rows based on their values rather than the row & column numbers.   
We can do this using the "!=" operator, which means "not equal to"
For example:
```
  iris[iris$Species != "setosa",]  # removes all the rows with "setosa" in the Species column
```
Note the above code did not actually *overwrite* the original iris dataframe. If we want to do this, we would instead write:  
```
  iris = iris[iris$Species != "setosa",] 
```

To add rows and columns, we can use the rbind (row bind) and cbind (column bind) function 
  
For example:
 ```
 # Add another observation, "Flower 151" to the iris dataset:
 Flower151 = c(7.2, 3.0, 6.4, 2.5, "virginica")  
 iris = rbind(iris, Flower151) 
 
 # Add a column with a randomly generated ID to the iris dataset:
 randomID = sample(1:150, 150, replace = FALSE)
 iris = cbind(iris, randomID)
 ```
 
 ## Section 3: Changing row and column names ##

We can view and change the row and column names using: rownames(data), and colnames(data)

For example:
```
rownames(iris) # View the row names for the iris data set
colnames(iris) = c("Sepal.Length.cm", "Sepal.Width.cm", "Petal.Length.cm", "Petal.Width.cm", "Species") 
```
 
## Section 4: Data classes ##

R recognizes different data 'classes' including:

*for 1-dimensional data*
- character = for text data
- numeric = for real numbers
- integer = for integers
- logical = for True/False statements
- factor = for integers/text with some sort of hierarchy
  
*for 2-dimensional data*
- data frames = can store different types of data classes
- matrices = can only hold one type of data class

*for >1-dimensional data*
- arrays & lists
  
Converting between different classes may be important, as R can sometimes mistake your intention for the data and there are some functions that require data of a certain class

Check data class by using "class" function:
Example
```
class(mtcars$gear)
```

Convert between different classes using functions like: as.numeric(), as.character(), as.factor()

For example:
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
  For example
  ```
  iris2 = t(iris)
  ```

- Convert between wide and long form   
  Example:
  ``` 
  library(reshape2) # load the reshape2 package, needed to use the melt function below
  # Example using the 'airquality' dataset - another built-in dataset in R that has info on air quality measurements from NY in 173
  View(airquality)
  
  # If you "melt" mtcars without specifying anything further:
  melt1 = melt(airquality)
  
  # Now "melt" the dataset but preserve the "gear" & "cyl" column
  melt2 = melt(airquality, id.vars = c("Month", "Day"))  # id.vars = which columns you want to keep

  # Go from long to wide ("casting") using the dcast() function:
  cast1 = dcast(melt2, Month + Day ~ variable) 
  # The variables to the left of the '~' are the ones you want to keep
  # The variable(s) to the right of the '~' are the ones to cast so that each unique value has its own column

  
  ```
  
  

