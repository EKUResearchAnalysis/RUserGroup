Jackknife Estimation
--------------------

> In statistics, the jackknife is a resampling technique especially
> useful for variance and bias estimation. The jackknife pre-dates other
> common resampling methods such as the bootstrap. The jackknife
> estimator of a parameter is found by systematically leaving out each
> observation from a dataset and calculating the estimate and then
> finding the average of these calculations.
> [Wikipedia](https://en.wikipedia.org/wiki/Jackknife_resampling)

This is also known as Leave One Out Cross Validation (LOOCV).

This month’s challenge is to implement a jackknife procedure and use it
to estimate the standard error of a mean. It can also be useful for
estimating *distributions* of values that do not have a known
probability distribution formula.

Simple Example
--------------

Suppose we have a sample of observations with values 5, 6, and 7.
Jackknifing this sample will create three sub-samples.

<table>
<thead>
<tr class="header">
<th>Sample Number</th>
<th>Sample Values</th>
<th>Sample Mean</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>6, 7</td>
<td>6.5</td>
</tr>
<tr class="even">
<td>2</td>
<td>5, 7</td>
<td>6</td>
</tr>
<tr class="odd">
<td>3</td>
<td>5, 6</td>
<td>5.5</td>
</tr>
</tbody>
</table>

Challenge Data
--------------

For this challenge, we will use a data set that comes prepackaged with
R. The `ChickWeight` data set comes “from an experiment on the effect of
diet on early growth of chicks” (See `?ChickWeight`). We will use a
linear model to estimate the relationship between age (`Time`) and
weight (`weight`). For this exercise, we will ignore any intra-subject
effects of multiple observation on the same chick.

We can create a linear model for the entire data set with the code

    fit <- lm(weight ~ Time, data = ChickWeight)
    fit

    ## 
    ## Call:
    ## lm(formula = weight ~ Time, data = ChickWeight)
    ## 
    ## Coefficients:
    ## (Intercept)         Time  
    ##      27.467        8.803

To get the *R*<sup>2</sup> value, we can do the following:

    summary(fit)$adj.r.squared

    ## [1] 0.7002197

Unfortunately, the *R*<sup>2</sup> value is a single value that may or
may not be influenced by extreme values. It is subject to *sampling
bias*, but there isn’t an equation that tells us how large this bias
might be. Using a resampling method, such as the jackknife, allows us to
repeatedly resample our data set in a way that can help us identify what
bias might exist in our model.

Challenge
---------

Implement a jackknife procedure to produce a graphical display (such as
a histogram or boxplot) of the *R*<sup>2</sup> value for the model
estimating `weight` as a function of `Time`.

Helpful hints:
--------------

1.  You can omit a row from a data frame in the following manner shown
    below. If you inspect the data closely, you’ll notice that the
    seventh row is omitted from the output.

<!-- -->

    mtcars[-7, ]

You may also use variables to do the same thing.

    omit <- 7
    mtcars[-omit, ]

1.  It will be helpful to make an object to store your results before
    starting a `for` loop. The following examples both create numeric
    vectors of length 5.

<!-- -->

    example1 <- numeric(5) # make a vector of length 5
    example2 <- vector(mode = "numeric", length = 5)

With a loop, this can be utilized as:

    x <- 1:5
    x_squared <- numeric(length(x))

    for (i in seq_along(x)){
      x_squared[i] <- i^2
    }

    x_squared

    ## [1]  1  4  9 16 25
