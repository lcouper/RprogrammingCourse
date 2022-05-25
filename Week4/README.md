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
{farenheit[i] = temps[i] * 9/5 + 32}  # This indicates the function you want performed over that range. Note the use of { } and the use of "i" in the index
farenheit # Check that our for loop worked by taking a look at the farenheit vector 
```
For loops will always have the general structure above -- the command 'for' followed by (i in #:#) followed by a command (bracketed by curly braces) to apply over that range. Here are the general steps I like to use when constructing a for loop:

**General steps:**
1) Write out the code for a single case
2) Create any empty vector for your new values to live
3) Identify and Sst the # of times for the loop to run
4) Provide the code to be repeated from step 1, but update it for a general case

Some more examples of basic for loops can be found here: https://www.w3schools.com/r/r_for_loop.asp


## Section 2: if/else Statements ##

if/else statements are logic statements telling R whether or not to run a command *based on whether some other condition is met*
For example:
```
x = 5
if (x >10){print(x)
} else {print(10)}   # Since x is not > 10, R goes to the "else" part and prints out the number 10
```
In the above code, we told R: *if* the value of x is greater than 10, print x, otherwise print the value "10".

if/else statements are often used *inside* for loops as a way to tell R to repeat a command *based on* some condition
For example, say we have the following 100m dash times, which were measured at three different courses (Course "A", "B", and "C")
```
Times = c(12.4, 12.2, 12.7, 11.9, 13.4, 12.9, 13.1, 11.6, 12.1, 13.0)
Course = c("CourseA", "CourseA", "CourseB","CourseA","CourseC",
           "CourseB","CourseC","CourseA", "CourseA","CourseB")
```
We learn that there was a headwind at Course B, making runners times slower than they may have been otherwise, and a tailwind at Course C, making runners times faster than they would have been otehrwise. To correct for this, we want to **subtract 0.2 seconds** to all times that were **measured at Course B** and **add 0.1 seconds** to all times that were **measured at Course C**. We want to leave the times measured at Course A unaltered.
Here is one way we could do this using an if/else statement and for loop in r:
```
for (i in 1:10)  {                # We choose 10 here because there are 10 times listed in the "Times" vector
           if(Course[i] == "CourseB")                  # set up the "if" condition
                      {Times[i] = (Times[i]-0.2)}      # subtract 0.2 from these times
           else if(Course[i] == "CourseC")             # set up the other "else if" condition     
                      {Times[i] = (Times[i]+0.1)}      # add 0.1 to these times
  }   
View(times)                                            # check that the loop worked by viewing the times vector again
```
Since we did not specify any additional if/else commands, we're essentially telling R not to do anything to the times associated with Course A. Notice that in this example, we chose to overwrite the original times vector. However we could have also created a new vector ("TimesCorrected", for example) and stored the corrected times there instead.


In addition to for loops, there are also loops called "while loops" which perform some command *while* a certain condition is met. You will get some practice with these in the exercises.

## Writing Functions ##

As we have seen, R has **many** built-in functions like: mean, rbind, View, summary, etc. 
But there may be times where you want to do something specific to your data for which a function does not already exist. For this, you can write your own function! 

Lets return to the Celsius to Farenheit conversion example above. After some quick googling, it appears there is no function that already does this included in base R. Lets write one ourselves and call the function "CtoF"

Similar to for loops, it can help by first writing out the code you'd like to run on a single value as a test case. 
For example:
```
farenheit = temps[1]*9/5 + 32
```
Now lets build on this to write our function.
```
CtoF = function(x) {     
farenheit = x * 9/5 + 32
print(farenheit)}   # tell R to "print" or output the result of the function
```
Functions will always have the general structure used above -- the name of your function (whatever you want to call it), followed by "function(x)" where 'x' refers to the number of inputs. Note that here the function just takes in one input -- a value in Celsius -- but we can write functions that take multiple inputs as we'll see below. After that you simply write out what you want your function to do with the supplied input. Often the last line will be print(something) or return(something) indicating that we want the output of the funciton to be 'returned' to us rather than hidden in some variable.

Lets check that our function worked by trying it on some data. We can input either a single data point, or a list of data points.

```
CtoF(30.2)                        # convert the Celius value '30.2' into Farenheit
CtoF(c(30.2, 19.2, 29.8, 40.6))   # convert this list of values into Celsius
CtoF(temps)                       # convert all the values in the vector 'temps', which we defined above, into Farenheit 
```

# Can also add in if/else statements, and make fun error messages
CtoF = function(x)
{if (x <= 100) {farenheit = x*9/5 + 32
print(farenheit)}
  else {print("Too hot!!!")}}

# Can create functions with mulitple inputs

# Example: BMI function
# Create a function to calculate body mass index given weight (in lbs) and height (in inches)
# x = weight input, y = height input
BMI = function(x,y)
 { x / (y^2) * 703}
  
# Use the function with first input being weight, second being height (in inches)
BMI(150, 60)


