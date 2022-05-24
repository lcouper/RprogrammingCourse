# Week 3 Practice Exercises # 

Reminder of the important notes before starting: 
- Feel free to write out the code/answers for the questions below if that's helpful to you, or feel free to just use these exercises to guide your exploration (no one is grading you!)

- For nearly all of these problems, there are many different ways you could solve them. In the answer key, I provide one (or sometimes two) potential ways, but these aren't necesssarily the only "right" answer

- You are encouraged to use any and all tools available to you, especially the internet! You are not expected to "know" how to do these problems yet or to memorize any of these functions or steps. Virtually everyone who uses R is constantly using the internet/ R help tools for reference and guidance

### 1. Analysis and plotting: Tick example ###

We'll be working with a dataset on tick count at different sites around the Bay Area. The dataset contains information on 16 sites, with the following information for each:
- the number of ticks collected via a standard "drag collection" technique
- the abundance of deer, lizards, rats and mice
- the diversity of host species
- the size (in hectares)
- the location (North or South Bay Area)

1.1) Download and import the "TickCounts" csv. Make sure to specify that this data DOES have row names (the first column) and column names when you bring it in. Inspect the dataset to make sure it was imported correctly and you get the gist for its structure.

1.2) What class is the "Ticks" data set? (Make sure it is a data frame before proceeding)

1.3) Lets do some quick descriptive statistics (or "data exploration") on this dataset. Lets find the average tick, lizard, rat, deer, and mouse counts across all sites. To do this, we'll use a powerful function we haven't talked about yet: 'sapply'
```
sapply(Ticks[,1:5], FUN = mean)
```
Using the output from the code above and the help documentation, can you figure out what the sapply function does?

1.4) Modify the above code to also get the *range* of these counts at each site

1.5) Take a look at the distribution of tick count by creating a histogram of the tick count column. Feel free to add any other plotting arguments to spruce up your plot!

# 1.3) 
# With this dataset, we're curious about what factors relate to the tick counts at a site
# To start, plot the tick counts against the deer counts (a scatterplot)
# Does there appear to be any relationship between these variables?

# 1.4) 
# Lets do the same for the site size (i.e. plot tick counts against site size)
# Create a title for this plot, change the plotting symbols and colors to something different (whatever you want)
# Add a line of best fit to your plot
# Does there appear to be a relationship here?

# 1.5)
# Create a linear model of tick counts starting with the predictor variables:
# site size, host diversity, and lizard counts
# Save this model call into a variable called "model1"
# Examine the output of model1 using the 'summary' function
# How "good" is this model? (A subjective question, but can be answered based on R2, pvalue, plot of residuals, etc)

# 1.6)
# Create a new data frame with just the site size, host diversity, and lizard count info
# using the code below:

Actual = as.data.frame(cbind(Ticks$SiteSize, Ticks$HostDiversity, Ticks$LizardCount))
View(Actual)

# Add the column names "SiteSize", "HostDiversity" and "LizardCount" to this dataset
# It's important to match the case & spacing of the above names in order for the next step to work

# 1.7)
# Now use the "predict.lm" function to get estimated tick counts
# based on the site size, host diversity, and lizard counts for each site
# Store the predicted values in a variable called "PredictTicks"

# 1.8)
# Now plot the actual tick counts against the predicted tick counts (a scatterplot)
# Add a regression line (for a model of actual tick counts against predicted tick counts)
# to this plot in red

# 1.9) 
# Lets measure the difference in the actual tick counts and the predicted tick counts for each site
# Create a new variable called "Diff" which subtracts the Actual from the predicted

# 1.10)
# Use the sort function on the Diff variable to see:
# Which site has the most actual ticks compared to expectations?
# Which site has the fewest actual ticks compared to expections?

# 1.10.1) We'd like to incorporate deer counts into our model.
# Create a new model (call it model2) with the same predictors as before
# but adding in DeerCounts
# Compare the AIC of these 2 models -- which is better?

# 1.11) 
# We'd now like to see if there is a statistical difference in the tick counts
# in the northern vs southern sites
# Split up these two parts of the dataset (using the subsetting commands we learned last week)
# Call one subset "North" and the other "South"

# 1.12)
# Use the "t.test" function to compare tick counts from these two groups
# Hint: the first argument to the t.test function should be the tick count
# column from the North group, and the second argument is the tick count column
# from the South group

# 1.13)
# What are the sample estimates of the mean for each site? 
# Is there a statistical difference in tick counts based on sample location?

# 1.14)
# Instead of breaking apart the data to run the t-test as we've done above,
# we could have also used the code below to achieve the same result:
t.test(Ticks$TickCount ~ Ticks$SiteLocation)
# What would have happened if we had tried to adapt the above code to 
# run a t.test on tick counts based on the rat counts? (i.e. why doesn't this work?)

# 1.15
# We later decided to create categories for the sites based on their relative sizes
# The new data is stored in this vector:
SizeCat = c("Med", "Large", "Med", "Large", "Large", "Large", "Small", "Small", 
            "Med", "Large", "Med", "Med", "Small", "Large", "Small", "Med")

# What class is SizeCat?
# Convert SizeCat to a factor, and overwrite the original vector (i.e save it as SizeCat)

# 1.16
# Now cbind the SizeCat vector onto the Ticks dataframe 
# And store this output in a new data frame called "Ticks2"

# 1.17
# Run an ANOVA to see if host diversity relates to site size based on the new site size category
# Also create a boxplot of host diversity broken down by SizeCat

# 1.17.1
# The mean value for tick counts based on size are:
# 71 at LARGE, 65 at MED, and 41.75 at SMALL
# Create a vector containing these values (e.g. x = c(71, 65, 41.75))
# And create a pie chart displaying this data
# Include a label for each slice indicating the size of the site

# 1.18
# We are curious how the rat counts and mouse counts compare across sites
# Calculate the Pearon's correlation coefficient between these two columns
# (Will probably require googling what function to use unless you are a very good guesser)
# Also calculate the Pearson's correlation between rat counts and deer counts

# 1.19
# We also obtain some historic data about tick counts at these same sites
# This data is stored in the following column:

Counts1998 = c(21, 9, 13, 14, 27, 18, 6, 15, 10, 11, 4, 29, 18, 7, 18, 19)

# Perform a chi-squared test on Counts1998 and the current Tick Counts
# to test if they are different. What does the test output indicate?

# 1.20
# Create side-by-side histograms from the two years using the following code:
par(mfrow = c(1,2))
hist(Counts1998,col = "pink")
hist(Ticks$TickCount, col = "skyblue")

# What did the "par" line do? How do the 2 distributions compare?
