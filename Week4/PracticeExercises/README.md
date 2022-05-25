# Week 4 Practice Exercises  #

Reminder of the important notes before starting:

- Feel free to write out the code/answers for the questions below if that's helpful to you, or feel free to just use these exercises to guide your exploration (no one is grading you!)
- For nearly all of these problems, there are many different ways you could solve them. In the answer key, I provide one (or sometimes two) potential ways, but these aren't necesssarily the only "right" answer
- You are encouraged to use any and all tools available to you, especially the internet! You are not expected to "know" how to do these problems yet or to memorize any of these functions or steps. Virtually everyone who uses R is constantly using the internet/ R help tools for reference and guidance

## Part 1: Small mammal diversity example ##

1.1)  You have the following values for the species richness (i.e., the number of of different species) of small mammals for a given site in CA:
Rich = c(5,8,7,13,11,10,11,7,10,7,8,5,6,9,9,8,11,8,9,5,6,8,6)

1.2) How many entries are in 'Rich'? (i.e. How long is the vector)

1.3) Create a new empty vector, called LogRich, of this same length

1.4) Use a for loop to calculate the log (base 10) of the richness values listed in Rich, and store these in LogRich. 
Exmaine the output to make sure you did this correctly

1.5) You also have the following values for species diversity (a metric based on the number and relative abundance of species) at the same sites:

SpDiversity = c(0.14, 0.92, 0.78, 1.44, 0.824, 0.876, 0.52, 0.72, 1.09, 0.75,
              0.64, 0.78, 0.81, 0.60, 0.57, 0.34, 0.29, 0.694, 1.194, 0.561,
              0.11, 0.65, 0.422)
              
Bring in this variale 'SpDiversity' into R.

1.6) Species "evenness" is a measure of the relative abundances of different species in a community (i.e., how 'evenly' distributed the abundances are). 
It is calculated as the Species Diversity / log(Species Richness). Lets calculate species evenness given our species richness and diversity values. 
First, create an empty vector called 'Evenness', that has a length of 23 (it can be filled with 0s, or blanks)

1.7) Now create a for loop to calculate the species evenness for each of the 23 sites and store these in the Evenness vector. 
The for loop is started for you below, but not finished.

```
for (i in 1:23) {
Evenness[i] = # FILL IN CODE HERE
}
```

1.8) Species evenness values should range between 0 and 1, with 0 signifying no evenness and 1 signifying all species are present at equal abundances.
What is the range of evenness values from our calculation?

1.9)  Rather than using this for-loop approach to calculate evenness, lets see if we can achieve the same result by writing a *function.* 
Namely, lets write a function called "SpEvenness" that calculates species evenness based on two inputs: species richness, and species diversity. 
The function is started for you below, but not finished.

```
SpEvenness = function(x,y) {
evenness = # FILL IN CODE HERE
}

1.10) Use this function to calculate the species evenness on the same vectors from above and commpare your answers between the 2 approaches


1.11) Lets say you now want to group sites based on their diversity values into "Low", "Medium", and "High" groups.
'Low' diversity sites are those with Diversity values between 0.11 and 0.50
'Med' sites are those with values between 0.51 - 1.0
'High' sites are those with values above 1.0

Use the code below to create an empty vector called "DivCategory" that is of the class 'character' and has 23 spots. 
```
DivCategory = vector(mode="character", length=10)
```

1.12) Create a for loop that assigns a category ('Low', 'Medium', or 'High') to a site based on the observed Diversity values. 
The for loop is started for you below, but not finished.  

for (i in 1:23) {
  if (SpDiversity[i] < 0.50)
  {SpDivCategory[i] = "Low"}
  if (SpDiversity[i]> 0.50 & SpDiversity[i]<1.0)
  {# FILL IN CODE HERE}
  if (# FILL IN CODE HERE)
  {DivCategory[i] = "High"}
}

1.13) Examine the output. How many low, medium, and high sites are there? 

1.14) Lets say you also have the following values for the size (in hectares) of each site
```
Size = c(19, 259, 97, 150, 118, 59, 28, 331, 210, 170, 441, 48, 256,21,
         378, 182, 140, 146, 74, 73, 59, 222, 239)
```
Input this 'Size' variable into R

1.15) Lets practice some stats concepts from last week and examine if there a relationship between the *size* of the plot and the *species diversity*
at the site. First, to get a visualization of the relationship, create a scatterplot with species diversity as the dependent variable and size as the independent variable.

1.16) To get some statistics on this relationship, run a linear regression model (again with species diversity as the dependent variable and size as the independent variable)
Is the relationship significant? 

1.17) You want to compare the size of your plots to that of a different dataset. Unfortunately this other researcher measured their sites in square meters rather than hectares.
So we need to first convert our size data from hectares into square meters
Complete the code below to create a for loop that converts the size values from step 1.5 to units of m^2 and store these values in a new vector called Size2
[Note that 1 hectare = 10,000 square meters]
```
Size2 = rep(0,23)
for (i in 1:23) {
Size2[i] = # FILL IN CODE HERE}
```


# 1.7) Create a function called "SizeConvert"
# That takes as input a value in hectares and provides as output, 
# the size value in square meters (1 hectare = 10,000 square meters)
# Use your newly created function on the Size vector 
# and compare your answer to that obtained from the for loop approach 

# 1.8) You are probably starting to see that the same task can often be achieved
# by either using a for loop or a function. What is the commonality in these two approaches?
# i.e. what is the basic common goal of both the for loop and function?


# 2
# Pull up the Anopheles data set from workshop 1 and refamiliarize yourself with this dataset
# The team that collected mosquitoes at the "Thousand Oaks" site made an error in species identification
# To correct for this, you need to divide all mosquito values from this site by 2
# Use the code below to do this & overwrite the original dataset with the new values:

for (i in 1:2270)
if(Mosqs[i, 3] == "Thousand Oaks")
{Mosqs[i,2] = Mosqs[i,2]/2}

# 2.1) Why did the for loop run from 1:2270?
# 2.2) How come we did not create an empty vector to store values in?

# 2.3) 
# Similar to the above example, lets say all the mosquitoes collected at the site "French"
# were underestimated. We want to add 3 to the value column for all rows with
# counts taken at the French data set.
# Modify the code in question 2 to create a for loop that can do this

# 2.4) CHALLENGE
# At the mosquito control district, you will get lots of datasets that look similar to this one
# You want to create a function that can quickly take in a dataset and
# create a plot of mosquito abundance by month
# Call the function "QuickPlots":

QuickPlots = function(a1)
{plot(a1[,6],a1[,2], main = "Mosquito Abundance by Time", col = "blue", pch = 16,
      xlab = "Month", ylab = "Mosquito Abundance")}

# 2.4.1)
# What is the format of the input to the function QuickPlots? (i.e. is it a vector? data point?)

# 2.4.2)
# Try running the QuickHits function on the Mosq dataset. Did you get the expected output?

# 2.4.3)
# Using a similar approach as above, create a function that will take the same input
# as the QuickPlots function (i.e. a dataframe formatted the same way as Mosqs)
# and print out basic summary stats including the mean, standard deviation 
# and range for mosquito abundance values. Name the function whatever you like

# 2.4.4)
# Run your function on the Mosqs dataset to make sure it works

# 3)
# Import and View the "ExamScores" csv file uploaded on github
# This dataset contains various quiz and exam scores for a class
# Make sure when importing that you specify that there are column names in this dataset

# 3.1)
# For each student, you want to calculate the average score on the Exams only.
# Create a for loop that can perform this calculation for you, for every student
# Store the output in a new vector, named whatever you like

# 3.2)
# Create a function that identifies the lowest QUIZ score for a single student
# The input to this function should be a vector of quiz and exam grades, 
# and the output should be the lowest QUIZ grade 
# Note this is slightly different from the "min" function because it ignores the exam grades
# Call this function "LowQuiz"

# 3.3)
# Now use this function on the first row of the dataset to make sure that it works

# 3.4)
# Now use this funciton within a for loop to calculate the lowest quiz score
# for each student. Store the output in a vector called "LowestQuizScore"

# 3.5)
# Create a new function that calculates a final numeric grade for each student
# which combines all the quiz scores as 30% of the grade and the exam scores as 70% of the grade
# The function should again take as an input, a vector of grades for a single student,
# and output a single numeric grade

# 3.6)
# Run this function on the first student to calculate their final exam grade

# 3.7)
# Again, use a for-loop to use this function on all students. Store the output 
# in a vector called "StudentFinalGrades"

# 3.8)
# Use the cbind function to add this new vector onto the end of the Exams dataframe

# 3.9)
# Practicing some stats concepts from last time - how well does the student's exam1 grade
# predict the student's final grade? (i.e. run a linear regression)
# You can also create a scatterplot and add the regression line 

# 4) While loop walk through
# While loops work by running the loop until some condition is met
# This is unlike for loops which run for a pre-specified range

# Here we'll use a while loop to print out the first Fibonacci numbers: 0,1,1,2,3,5,8,13...
# where each number in the sequence is the sum of the 2 previous numbers

# The code below demonstrates how to do this using a while loop:
a <- 0
b <- 1
while (b < 50) {
  print(b)
  temp <- a + b
  a <- b
  b <- temp
}

# 4.1 How would you update the code above to produce more numbers in the sequence?
# 4.2 Why does the loop here end at the number 34? Why not 49?
# 4.3 What are 'a' and 'b' placeholders for in this example?

# 5.1) While loop practice (HARD)
# You are playing a lottery style game where you randomly select numbers (with replacement)
# from the pool of integers 1:100
# The person to draw the number '100' first, i.e. in the fewest number of draws, wins
# Simulate this game using a while loop
# Then try playing it for yourself and see how many draws it takes you to get to 100
# Hint: you'll want to create the pool of potential numbers first
# i.e. the vector of integers ranging from 1:100
# Then use the sample function, within a while loop, to draw from it
