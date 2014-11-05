library(dplyr)
library(tidyr)
library(lubridate)

midwives <- read.csv("~//Desktop/midwives.csv", stringsAsFactors = FALSE) %>%
  select(Date.paid, Mother.delivered, Midwife) #Read in midwives csv

mwdates <- midwives %>%
  select(Date.paid) 

mwdates <- parse_date_time(mwdates, "mm/dd/yyyy", tz = "UTC") %>%
  parse_date_time(mwdates, "yyyy") #I tried to parse the date format into mm/yyyy, but I couldn't get it to work

bishop <- midwives %>%
  filter(Midwife == "Susanna Bishop") #With the mm/yyyy, I wanted to plot Bishop's and Parker's deliveries over time

parker <- midwives %>%
  filter(Midwife == "Darcus Parker")

midwives_n <- midwives %>%
  group_by(Midwife) %>%
  summarize(Name = n()) #The number of deliveries per midwife

write.csv(midwives_n)
