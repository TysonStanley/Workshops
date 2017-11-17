## Data for the R Courses
## The Office, Parks and Rec

setwd("~/Dropbox/Teaching/R for the Social Sciences 2/Data/")

library(foreign)
library(haven)
library(tidyverse)

df_office = data.frame(
  nam = c("Michael", "Pam", "Jim", "Dwight", "Stanley", "Phyllis", "Creed", "Meredith", "Oscar", 
          "Angela", "Kevin", "Kelley", "Ryan", "Toby", "Andy", "Jan"),
  prod1 = c(2, 3, 3, 5, 4, 4, 1, 3, 5, 4, 2, 3, 2, 4, 3, 4),
  ment1 = c(3, 8, 8, 6, 7, 8, 2, 5, 7, 5, 6, 5, 2, 1, 5, 6),
  phys = c(8, 7, 8, 8, 4, 4, 4, 4, 7, 7, 2, 5, 5, 6, 7, 6),
  marr = c(0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
  gend = c(0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1),
  race = c(1, 1, 1, 1, 2, 1, 1, 1, 3, 1, 1, 4, 1, 1, 1, 1),
  inco = c(55, 35, 70, 70, 70, 70, 45, 40, 50, 50, 45, 40, 40, 60, 60, 80),
  chil = c(0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
  subs = c(1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0),
  alco = c(1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1),
  spor = c(1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  depr1 = c(15, 8,  5,  12, 13, 10, NA, 13, 10, 9,  14, 17, 11, 19, 16, 10),
  awkw1 = c(5, 2, 3, 4, 1, 1, 3, 4, 3, 4, 3, 2, 2, 1, 3, 1),
  prod2 = c(2, 3, 3, 5, 4, 4, 1, 3, 5, 4, 2, 3, 2, 4, 3, 1) + 1 + round(rnorm(16),0),
  ment2 = c(3, 8, 8, 6, 7, 8, 2, 5, 7, 5, 6, 5, 2, 1, 5, 1) + 1 + round(rnorm(16),0),
  depr2 = c(15, 8, 5,12, 13, 10, 10, 13, 10, 9,  14, 17, 11, 19, 16, 19) + round(rnorm(16),0),
  awkw2 = round(c(5, 2, 3, 4, 1, 1, 3, 4, 3, 4, 3, 2, 2, 1, 3, 1) * 1.5 - 2, 0),
  show  = "The Office"
) %>%
  mutate(race = factor(race, 
                       labels = c("White", "Black", "Mexican American", "Indian"))) %>%
  mutate(start_date = "March 24, 2005",
         last_aired = "May 16, 2013")

df_parks = readr::read_csv("ParksRec.csv") %>%
  mutate(race = factor(race, 
                       labels = c("White", "Black", "Mexican American", "Indian"))) %>%
  mutate(prod2 = ifelse(is.na(prod2), prod1 + 1 + round(rnorm(22),0), prod2),
         ment2 = ifelse(is.na(ment2), ment1 + 1 + round(rnorm(22),0), ment2),
         depr2 = ifelse(is.na(depr2), depr1 + round(rnorm(22),0), depr2),
         awkw2 = ifelse(is.na(awkw2), round(awkw1 * 1.5 - 2, 0), awkw2)) %>%
  mutate(start_date = "April 9, 2009",
         last_aired = "February 24, 2015")

df = rbind(df_office, df_parks)

save(df, file="OfficeParks.RData")
write.csv(df, file = "OfficeParks.csv")
write.table(df, file = "OfficeParks.txt", sep = " ")

