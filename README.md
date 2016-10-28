## Introduction

This project uses data from the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning Repository</a>, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which may be downloaded from:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Dataset includes measurements of one household's electric power consumption, sampled once a minute over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

## Loading the data

The dataset has 2,075,259 rows and 9 columns. A rough estimate of how much memory the dataset will require to load into memory on the local machine is:

(2,075,259 rows) * (9 columns) * (8 bytes/entry) = approx. 149 Mbyte.

This is not a conservative figure, as it will have to load into contiguous RAM, but the author's local machine has 16 Gbyte of RAM, so no problems are expected.  If the user's machine has only 4 Gbyte of RAM some applications may need to be closed before the load is attempted.  If memory has been allocated to previous R simulations, the user may need to run R's garbage collection [ by executing gc() ].  This does not repack memory, and since the file will need to be loaded into contiguous RAM, the user may need to restart R.

* This analysis will consider data for the two day range 2007-02-01 and 2007-02-02, so only these observations are read into the `data` dataframe.

* The original dataset contains missing values coded as `?`, but no missing values are found in the date range of interest.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.


* The following nine variables are included in the dataset.  Note that columns in the subset of interest have been renamed, as follows:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global.active.power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global.reactive.power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global.intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub.metering.1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub.metering.2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub.metering.3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

