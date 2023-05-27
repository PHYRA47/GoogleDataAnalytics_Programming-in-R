# Working with date and time

# Load tidyverse and lubridate
library(tidyverse)
library(lubridate)

# today's date
today()

# current time and date
now()

# three ways to create date-time format

  # from string
ymd("2021-01-20") # mind the order
mdy("January 20th, 2021")
dmy("20-Jan-2012")

ymd_hms("2021-01-20 20:11:59")

# convert date_time to date
as_date(now())
