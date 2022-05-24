# Week 3: Basic Stats & Plotting #

This week's **learning objectives** are to:

- become familiar with different statistical analyses you can perform in R
- understand how to conduct basic summary statistics on your data 
- feel comfortable looking at help documentation to figure out how to use more advanced functions
- create basic data visualizations

## Section 1: Statistics ##

There are many, many tools for statistical analysis either within base R or contained in other packages. Some examples include: 
Chi-squared, Fisher's exact test, correlations, t-tests, Wilcoxon signed-rank test, multiple regression, cross-validation, variable selection, outlier detection, ANOVAs, power calculations.

There is no need to 'memorize' all of these different tools and functions (nobody does this!). The goal is simply to become familiar with the variety of tools that exist, and to learn to use the help documentation and online examples to make use of the ones we want. 

Below are a few examples of some common statistical procedures.

### Analaysis of Variance (ANOVA) example ####
A statistical test used to analyze the differences in means among groups (e.g., between control and treatment groups, or a group pre- and post-some type of intervention).
[Note that using an ANOVA assumes that your data are independent, normally distributed, and that groups have approximatley equal variances. We'll ignore this for now and assume it's true]

Lets use the ChickWeight dataset from R
```
library(datasets)
View(ChickWeight)
```
This dataset provides info on the weights of chicks on different diets (1-4). You want to see if there's a mean difference in chick weight based on diet. This can be tested statistically using an ANOVA function executed through the "aov" function in base R

```
fit = aov(ChickWeight$weight ~ ChickWeight$Diet)
# OR
fit = aov(weight ~ Diet, data = ChickWeight) # This will achieve the exact same result as the above, its just another way to code it
```
Here, aov is the name of the function that fits an analysis of variance model. The first argument is the dependent or outcome variable. The second argument, after the ~, is the independent variable. To see the results of this model fit:
```
summary(fit)
```

![Model summary](./ModelSummary.jpg)

The model output shows there is a significant difference in chick weight based on diet.

#### Multiple regression Example ####
