# Title: Likert Data Wrangling
# Author: Gareth Burns
# Creation Date: 06/03/2024
# Description: A script to wrangle data from MS Forms Likert data


# Libraries ---------------------------------------------------------------

library(tidyverse)


# Local Data --------------------------------------------------------------

LikertData <-
  readxl::read_excel(path = "KerusCloudVPV/KerusCloud Virtual Population Visualisations.xlsx", sheet = "Sheet1")


# Data Wrangling ----------------------------------------------------------
scale <-  c(
  "Not Important" = 1,
  "Slightly Important" = 2,
  "Moderately Important" = 3,
  "Very Important" = 4,
  "Extremely Important" = 5
)

colnames(LikertData)[6:15] <-
  gsub('.*\\.', '', colnames(LikertData[6:15]))

# LikertData[,6:15] <- lapply(LikertData[,6:15], factor, levels = scale)
# dataSummary <- likert(LikertData[,6:15])
response <- nrow(LikertData)

data <-  LikertData |>
  gather("Feature",
         "Response",
         -Id,
         -`Start time`,
         -`Completion time`,
         -`Email`,
         -Name) |>
  mutate(Response = factor(
    Response,
    levels = c(
      "Not Important",
      "Slightly Important",
      "Moderately Important",
      "Very Important",
      "Extremely Important"
    )
  )) |> 
  group_by(Feature, Response) |>
  summarise(count = n(), 
            Percent = n()/response *100)

