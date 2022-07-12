# Week 3 Practice Exercises # 

Reminder of the important notes before starting: 
- Feel free to write out the code/answers for the questions below if that's helpful to you, or feel free to just use these exercises to guide your exploration (no one is grading you!)

- For nearly all of these problems, there are many different ways you could solve them. In the answer key, I provide one (or sometimes two) potential ways, but these aren't necesssarily the only "right" answer

- You are encouraged to use any and all tools available to you, especially the internet! You are not expected to "know" how to do these problems yet or to memorize any of these functions or steps. Virtually everyone who uses R is constantly using the internet/ R help tools for reference and guidance

### 1. Analysis and plotting: Tick example ###

We'll be working with a dataset on tick counts at different sites around the Bay Area. The dataset contains information on 16 sites, with the following information for each:
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

1.6) Lets say we're curious about what factors influence the tick counts at a site. To start, plot the tick counts against the deer counts (with a scatterplot). Does there appear to be any relationship between these variables?

1.7) Lets do the same for the site size (i.e. create a scatterplot of tick counts against site size). Create a title for this plot, change the plotting symbols and colors to something different (whatever you want), and edit the x and y axes labels. Add a line of best fit to your plot. Does there appear to be a relationship here?

1.8) Lets investigate this relationship between tick counts and site size further. Use the code below to create a linear model of tick counts starting with the predictor variables: site size, host diversity, and lizard counts. Examine the output of model1 using the 'summary' function. How "good" is this model? (A subjective question, but can be answered based on R2, pvalue, plot of residuals, etc)

```
model1 = lm(TickCount ~ SiteSize + HostDiversity + LizardCount, data = Ticks)
```

1.9) Lets hone in on these variables. Create a new data frame with just the site size, host diversity, and lizard count info and alter the column names using the code below:

```
Actual = as.data.frame(cbind(Ticks$SiteSize, Ticks$HostDiversity, Ticks$LizardCount))
colnames(Actual) = c("SiteSize", "HostDiversity", "LizardCount")
View(Actual)
```

1.10) Now lets say we want to "predict" the number of ticks we'd find at a new site given it's size, host diversity and lizard abundance. Follow the code below, which makes use of the "predict.lm" function to get estimated tick counts and store them in a new variable called "PredictTicks"
```
PredictTicks = predict.lm(model1, Actual)
```
1.11) Lets see how good our model was at "predicting" tick counts: Plot the *actual* tick counts against the *predicted* tick counts (with a scatterplot). Add a regression line (for a model of actual tick counts against predicted tick counts) to this plot in red

1.12) Lets measure the difference in the actual tick counts and the predicted tick counts for each site. Create a new variable called "Diff" which subtracts the Actual from the predicted

1.13) Use the sort function on the Diff variable to see:
Which site has the most actual ticks compared to expectations?
Which site has the fewest actual ticks compared to expections?

1.14) Now lets say we'd like to incorporate deer counts into our model, because we know deer are an important host of adult ticks. Create a new model (call it model2) with the same predictors as before but adding in 'DeerCounts'. Compare the 'AIC' of these 2 models using the code below. [Model AIC is a measure of how "good" the model is, with lower AIC indicating a better model]. Based on the AIC values, which model is better?

```
AIC(model1)
AIC(model2)
```

1.15) We'd now like to see if there is a difference in the tick counts in the northern vs southern sites. Split up these two parts of the dataset using the subsetting methods we discussed last week. Call one subset "North" and the other "South". To get you started, here is the code for the "North" subset:
```
North = Ticks[Ticks$SiteLocation == "North",]
```

1.16) Lets dig into this further and see if there is a statistically significant difference in tick counts between Northern and Southern sites. Use the "t.test" function to compare tick counts from these two groups [Hint: the first argument to the t.test function should be the tick count column from the North group, and the second argument is the tick count column from the South group]. 

1.17) Looking at the t.test output -- what is the estimated mean tick abundance at the Northern and Southern sites? 

1.18) Is there a statistical difference in tick counts based on sample location? (lets use whether or not p < 0.05 as a guide)

1.19) Instead of breaking apart the data to run the t-test as we've done above, we could have also used the code below to achieve the same result:
```
t.test(Ticks$TickCount ~ Ticks$SiteLocation)
```
Can you adapt the code above to run a t.test on tick counts based on the rat counts? [Hint: you will get an error] Why didn't this work?

1.20) We later decided to create categories for the sites based on their relative sizes. The new data is stored in this vector:
```
SizeCat = c("Med", "Large", "Med", "Large", "Large", "Large", "Small", "Small", 
            "Med", "Large", "Med", "Med", "Small", "Large", "Small", "Med")
```
What data class is SizeCat?

1.21) Since there are "levels" associated with this size category data, we want R to treat this variable as a *factor* rather than character data. Convert SizeCat to a factor, and overwrite the original vector (i.e save it as SizeCat)


1.22) Lets add this variable to our Ticks dataframe using the cbind function and store this output in a new data frame called "Ticks2"

1.23) What are the dimensions (i.e., number of rows and columns) of this new 'Ticks2' data frame?

1.24) Lets say we want to understand if host diversity varies between small, medium, and large sites. Run an ANOVA using the host diversity as the dependent variable and new site size category as the grouping variable. Is there a statistically significant difference between differently sized sites?

1.25) Lets visualize these differences using a boxplot: Create a boxplot showing host diversity for each site size category. Alter the box colors so each box (i.e., each site size category) is a different color. How do these two methods -- running an ANOVA and creating a boxplot -- inform our understanding of whether host diversity varies by site size categories?

1.26) Use the following code to calculate the mean tick abudance based on site size:
```
tapply(X = Ticks2$TickCount, INDEX = Ticks2$SizeCat, FUN = mean)
```
We see that the mean tick abundances are: 71 for large sites, 65 for medium sites, and 41.75 for small sites. Create a vector containing these values (name the vector whatever you like).

1.27) Modify the code below to create a pie chart displaying the mean tick counts by site size. Include a label for each slice indicating the size of the site
```
labels = c("Large", "Med", "Small")
pie(mean_counts, labels = labels, col = c("darkblue", "blue", "lightblue"),   # notice "mean_counts" refers to what I named my vector. This may be different for you
    main = "Tick Counts By Site")
```
What did the "labels" function do here?

1.28) Lets say we are curious about whether the rat counts and mouse counts vary similarly across sites (i.e., whether or not they are correlated). Calculate the Pearon's correlation coefficient between these two columns using the code below:
```
cor(Ticks$RatCount, Ticks$MouseCount)
```
What is the correlation? What does this mean practically? (i.e., do rats and mice tend to vary similarly across sites?)

1.29) Modify the code above to calculate the Pearson's correlation between rat counts and *deer* counts. Are these two species more or less strongly correlated?

1.30) Lets say we just obtained some historical data about tick counts at these same sites. This data is stored in the following column:
```
Counts1998 = c(21, 9, 13, 14, 27, 18, 6, 15, 10, 11, 4, 29, 18, 7, 18, 19)
```
What class is the Counts1998 variable? How is this class different from the 'integer' class?

1.31 Lets see if there is a difference in ticks counts at our sites from 1998 to today. To do this statistically, we can use a 'chi-squared test'. Follow the code below to conduct a chi-squared test examining the difference between Counts1998 and our current data:
```
chisq.test(Counts1998, Ticks$TickCount)
```
What does the test output indicate?

1.32 Now lets visualize the difference in tick abundances between 1998 and today. Create side-by-side histograms from the two years using the following code:
```
par(mfrow = c(1,2))
hist(Counts1998,col = "pink")
hist(Ticks$TickCount, col = "skyblue")
```
What did the "par" function do? How do the 2 distributions compare?

### 2. Self-guided analysis and plotting ### 

If you have any data from an independent project, or access to a dataset you're interested in exploring, I encourage you to explore basic stats & plotting on this data! Otherwise, try loading and exploring an R dataset of your interest. You can explore datasets contained in the 'datasets' package here:
https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html. Look through these options and see if any interset you. 
Then import and view that dataset
```
# Example:
library(datasets)
View(airquality)
```
If the column names are uninformative, you can also google the name of the dataset to get more info. Get a sense for what type of data you're working with and what types of plots/stats may be useful. Then try doing some exploratory plotting/ preliminary stats on that dataset. There are no wrong answers here!
