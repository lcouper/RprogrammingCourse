# Week 4 Practice Exercises  #

Reminder of the important notes before starting:

- Feel free to write out the code/answers for the questions below if that's helpful to you, or feel free to just use these exercises to guide your exploration (no one is grading you!)
- For nearly all of these problems, there are many different ways you could solve them. In the answer key, I provide one (or sometimes two) potential ways, but these aren't necesssarily the only "right" answer
- You are encouraged to use any and all tools available to you, especially the internet! You are not expected to "know" how to do these problems yet or to memorize any of these functions or steps. Virtually everyone who uses R is constantly using the internet/ R help tools for reference and guidance

## Part 1: Small mammal diversity example ##

Species richness, evenness, and diversity are common ways of measuring and describing how many species are present at a given site and are used often in ecology. We will work with data concerning small mammal species from different sites in California. 

1.1)  You have the following values for the species richness (i.e., the number of of different species) of small mammals for a given site in CA:
```
Rich = c(5,8,7,13,11,10,11,7,10,7,8,5,6,9,9,8,11,8,9,5,6,8,6)
```

1.2) How many entries are in 'Rich'? (i.e. How long is the vector)

1.3) Create a new empty vector, called LogRich, of this same length

1.4) Use a for loop to calculate the log (base 10) of the richness values listed in Rich, and store these in LogRich. 
Exmaine the output to make sure you did this correctly

1.5) You also have the following values for species diversity (a metric based on the number and relative abundance of species) at the same sites:
```
SpDiversity = c(0.14, 0.92, 0.78, 1.44, 0.824, 0.876, 0.52, 0.72, 1.09, 0.75,
              0.64, 0.78, 0.81, 0.60, 0.57, 0.34, 0.29, 0.694, 1.194, 0.561,
             0.11, 0.65, 0.422)
```             
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

1.18) Lets do the same thing but using a function instead of a for loop. Create a function called "SizeConvert" that takes as input a value in hectares and provides as output, the size value in square meters (1 hectare = 10,000 square meters)

1.19) Use your newly created function on the Size vector and compare your answer to that obtained from the for loop approach 

1.20) You are probably starting to see that the same task can often be achieved by either using a for loop or a function. 
What is the commonality in these two approaches? (i.e. what is the basic common goal of both the for loop and function?)


## Part 2: Mosquito example ##

Lets return to the Anopheles dataset from Week 1. Recall that this dataset contains information on the abundance of mosquitoes (specifically *Anopheles quadrimaculatus*, the common malaria mosquito) at different locations (in Florida) and sampling times.

2.1) Import the Anopheles_Data.csv and store it in a data frame called "Mosqs"

2.2) We learned later that the team that collected mosquitoes at the "Thousand Oaks" site made an error in species identification. To start, lets see how many observations were from the "Thousand Oaks" site.
```
length(which(Mosqs$sample_location_info == "Thousand Oaks"))
```
How many observations were affected? (i.e., what is the output from above?)

2.3) To correct for the species ident, we need to divide all mosquito values from this site by 2. Fill in the code below to do this, overwriting the original dataset with the new values:

```
for (i in 1:2270)
if(Mosqs[i, 3] == "FILL IN CODE HERE")
{Mosqs[i,2] = Mosqs[i,2]/2}
```

2.4) Why did we the for loop to run from 1:2270?

2.5) How come we did not create an empty vector to store values in?

2.6) Similar to the above example, lets say all the mosquitoes collected at the site "French" were underestimated. 
We want to **add 3** to the value column for all rows with counts taken at the French data set. Modify the code from question 2.3 to create a for loop that can do this

2.7) Lets say you work at the mosquito control district, where you look at lots of datasets like this Anopheles one. To make your work go faster, create a function that can quickly take in a dataset and create a plot of mosquito abundances by month. Call the function "QuickPlots":
```
QuickPlots = function(a1)
{plot(a1[,6],a1[,2], main = "Mosquito Abundance by Time", col = "blue", pch = 16,
      xlab = "Month", ylab = "Mosquito Abundance")}
```
Why did we put 'a1' as the placerholder inside of the function rather than 'x' as we've done before?

2.8) What is the format of the input to the function QuickPlots? (i.e. is it a vector? data point?)

2.9) Try running the QuickPlots function on the Mosq dataset. Did you get the expected output?

2.10) Using a similar approach as above, create a function that will take the same input as the QuickPlots function (i.e. a dataframe formatted the same way as Mosqs) and print out some basic summary stats including the mean, standard deviation and range for mosquito abundance values (across all months, not separated by month). Name the function "QuickStats"

2.11) Run your function on the Mosqs dataset. What do you get for the mean, standard deviation, and range of mosquito abundances?

## Part 3: Asthma intervention study ##

The VO2max_AsthmaStudy dataset contains data on the VO2 max (a measure of the maximum amount of oxygen your body can utilize during exercise) measured at 4 separate visits for participants enrolled in an asthma drug trial. 

3.1) Import the dataset and name it "VO2max". Make sure to pecify that there *are* column names and row names (the first column, which contains the participant IDs) in this dataset.

3.2) How many participants are included in this dataset? How many are in the control group? How many in the treatment group?

3.3) For each participant, you want to calculate their average VO2 max value. Start by creating an empty vector called "VO2avgs"

3.4) Use the code below to write a for loop calculating the average VO2 max for each participant
```
for (i in 1:nrow(VO2max))
     {VO2avgs[i] = mean(as.numeric(VO2max[i,2:5]))}
```
Why did we need to include the 'as.numeric' inside of the mean function here?

3.5) Add this "VO2avgs" vector as a column onto the VO2max dataset using cbind() (i.e., overwrite the original dataframe)

3.6) Practicing some stats concept from last week, lets examine if there is a difference in average VO2 max values between the control and treatment participants. To start, create a boxplot (either in ggplot or base R) that shows the average VO2 max values for control participants in one box and for treatment participants in another. Feel free to spruce up your plot with a title, colors, etc.

3.7) To dig into this further, run a t.test to see if there is a statistical difference in average VO2 max values between the treatment and control groups. What do you find? Would you conclude that the treatment is effective?


