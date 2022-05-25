# Week 4: 'Advanced' Topics in R #

This week's **learning objectives** are to:

- become familiar with some more 'advanced' topics in R (e.g., for loops, if/else statements, and custom functions)
- feel comfortable looking at help documentation to figure out how to use these
- modify example code to write basic loops and functions

## Section 1: For loops ##

For loops are used when you want to repeat some type of function/command many times (“Loop over your code”). They're similar to the "apply" function family (e.g., lapply, sapply, tapply) but can be more powerful

Example 1: Lets say we have a list of temperatures in Celsius that we want to convert to farenheit.
```
temps = c(31.0, 29.1, 28.5, 32.3, 32.7, 29.4) 
```
Lets start by focusing on just the first entry in "temps": 31.0. If we wanted to convert this value from Celius to Farenheit, we would multiply it by 9/5 and add 32.
In R, we could do this as:
```
farenheit = temps[1]*9/5 + 32   # recall that temps[1] tells R we want the first entry in the temps vector
```

How could we repeat this for all the values in the temps vector?
To start, lets create an empty vector for our new data to live. Lets call this vector, "farenheit".
```
farenheit = rep(0,6) 
```
The rep() function tells R we want to repeat a certain value (here, '0') some number of times. Here, we want to repeat the '0' value **6** times since we want to match the 6 values in "temps"
There are lots of way to initialize an empty vector. We could have also used the code below to create a blank vector of no pre-determined size:
```
farenheit = vector() 
```

Now that we have created an empty vector, we can begin converting Celius values from the temps vector into Farenheit values and store them in the empty vector.
Here's what a for loop looks:
```
for (i in 1:6)  # This indicates the range over which you want to iterate
{farenheit[i] = temps[i] * 9/5 + 32}  # This indicates the function you want performed over that range
farenheit # Check that our for loop worked by taking a look at the farenheit vector 
```
For loops will always have the general structure above -- the command 'for' followed by (i in #:#) followed by a command to apply over that range.
Here are the general steps I like to use when constructing a for loop:

**General steps:**
1) Write out the code for a single case
2) Create any empty vector for your new values to live
3) Identify and Sst the # of times for the loop to run
4) Provide the code to be repeated from step 1, but update it for a general case


