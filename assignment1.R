#first we'll load our libraries
#make sure to install the tidyverse if it's not already installed
library(tidyverse)
library(lubridate)

# run this line below load the data for this assignment
# we'll use a built-in dataset from the ggplot2 package (loaded as party of the tidyverse)
housesales <- ggplot2::txhousing

# This dataset includes monthly housing sales by city in the state of texas from 2000-2015.
# let's take a look at it
housesales

# You can also see it in the view window by running this line
View(housesales)


# FOR EACH OF THE QUESTIONS BELOW, WRITE YOUR WORKING R CODE TO RETURN THE REQUESTED RESULTS
# USE COMMENTS (PREFACED BY THE #) TO ACCOMPANY YOUR CODE TO EXPLAIN WHAT YOU'RE DOING 
# FOR EACH STEP AS NEEDED



# 1) The column "year" indicates the year. Filter to return only results from 2015. 
# (note that because the column is numeric, you wouldn't use quotes as with text when setting your filter value)

# I am using the filter function to return 2015 data from housesales. 
filter(housesales, year == 2015)


# 2) Similar to the above question, filter results from 2010 onward, so 2010-2015.

# I am using the filter function to return data from years greater than or equal to 2010.
filter(housesales, year >= 2010)


# 3) The "city" column contains the relevant city. Filter to return only results for Houston
# (note, remember R is case sensitive)

# I am using the filter function to return Houston results from the city column.
filter(housesales, city == 'Houston')


# 4) Filter for only where the city is Houston as above, and now also filter for only 
# the year 2010. The results should give you 12 records, one for each month in 2010 for Houston.

# I am using the filter function on the data to make the city equal Houston and the year equal 2010.
filter(housesales, city == "Houston", year == 2010)


# 5) Build on what you've done above. Filter for only where the city is Houston as above, 
# and the year is 2010. Now add a sort using arrange() to sort the results based on the number
# of home sales (the "sales" column) from most to least.

# I am combining the arrange and filter functions to only get results from Houston in 2010
# in descending order by sales.
arrange(filter(housesales, city == "Houston", year == 2010), desc(sales))


# 6) Piggyback on what you've done above. 
# Do the same as #5, only this time instead of Houston return records for Dallas

# I am using the pipe function to build on the code and only return results from 
# Dallas in 2010 in descending order based on sales. 
housesales %>% 
  filter(year == 2010, city == "Dallas") %>% 
  arrange(desc(sales))



# 7) Sometimes metrics like home sales have a seasonal quality to them, much like 
# retail sales. There are times of year that are naturally more active, and others where
# it's slower.
# That means sometimes you'll want to isolate the same time period across multiple years
# to compare how it went based on similar times of year.
# Let's do that here: we're going to look only for sales that happened in the month of JUNE.
#
# Filter for the city is Dallas, and the month is June (the number 6). 

# I am using the filter function to return results where the city equals Dallas and 
# the month equals 6 for June. 
filter(housesales, city == "Dallas", month == 6)


# 8) Build on what we've done above. Now that we have June numbers for Dallas for every year,
# arrange the results by sales from highest-to-lowest to show what year had the highest June sales.

# I am using the pipe to build on what I have already done and add the arrange function
# to show sales in decreasing order. 
housesales %>% 
  filter(city == "Dallas", month == 6) %>% 
  arrange(desc(sales))



# 9) Now do the same as Question 8, but this time instead of Dallas, show results for Corpus Christi

# I used the same methodology as above, but I changed the filter to show Corpus Christi results.
housesales %>%  
  filter(city == "Corpus Christi", month == 6) %>% 
  arrange(desc(sales))



# 10) Finally, using the Corpus Christi code from Question 9, instead of June
# use the month of February (2) instead.

# I pasted the code from above and changed the month to 2. 
housesales %>%  
  filter(city == "Corpus Christi", month == 2) %>% 
  arrange(desc(sales))

