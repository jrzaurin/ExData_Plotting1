README
========================================================

Two options to create the plots required for this assignment. 

OPTION A
--------
The exdata-data-household_power_consumption.zip is already unzipped in your directory.

Then you simply type 

```{r}
source("PlotAll.R")
```

and it will generate the 4 plots in less than 3 seconds

OPTION B. 
--------
The exdata-data-household_power_consumption.zip is  NOT unzipped in your directory.

Then you "uncomment" the 1st line in PlotAll.R
```{r}
unzip("exdata-data-household_power_consumption.zip")
```

and type

```{r}
source("PlotAll.R")
```

which will generate the plots in something less than 5 seconds.
