# Title: Time to Event Estimands
# Author: Gareth Burns
# Creation Date: 16/01/2024
# Description: Initial dataviz on how KerusCloud should handle time to event  
# variables with estimands applied in KerusCloud.

# Load Libraries ----------------------------------------------------------
library(ggplot2)
library(tidyr)
library(dplyr)

# Create Dataset ----------------------------------------------------------

n <- 10


data <- data.frame(PatientID = seq(n),
                   Event = c(5, NA, 20, NA, NA, NA, 15, NA, NA, 22), 
                   Censor = c(NA, 20, 15, NA, 25, 10, 20, 25, 25, NA), 
                   `InterCurrent 1` = c(NA, 8, NA, 10, NA, NA, NA, NA, NA, 15), 
                   `InterCurrent 2` = c(NA, NA, NA, 15, NA, NA, NA, 20, NA, 10)) |>
  pivot_longer(!PatientID)

recordedEvent <- data |>
  filter(name != "InterCurrent.2")|>
  group_by(PatientID) |>
  summarise(Selected = min(value, na.rm = TRUE))
  

ggplot(data, aes(x = value, y = as.factor(PatientID), colour = name, shape = name)) +
  geom_point(size = 2.5) +
  geom_point(data = recordedEvent, mapping =  aes(y = as.factor(PatientID), x = Selected), shape = 21, colour = "red", size = 6, inherit.aes = FALSE) +
  geom_vline(xintercept = 25, linetype = "dashed", colour = "Red") +
  annotate("text", x = 25.2, y = 9.5, label = "Study end", hjust = 0, colour = "red") +
  annotate("text", x = 7, y = 2, label = "Earliest event takes precedence", hjust = 1) +
  annotate("text", x = 24, y = 5, label = "No event in study\nCensor at study end", hjust = 1) +
  annotate("text", x = 19, y = 8, label = "Event with 'No Action',\nNo events in study", hjust = 1) +
  annotate("text", x = 9, y = 10, label = "Event with 'No Action'\nNext Event used", hjust = 1) +
  labs(x = "Time", y = "Patient ID" , caption = "Plot: Gareth Burns", colour = "Event Type", shape = "Event Type")+
  ggtitle(label = "'Estimands' on a Time to Event variable",
          subtitle = "The earliest chronological event that occurs will be the one that is recorded against that Patient.
          \nThat has a composite selection strategy. InterCurrent Event 2 has 'Do Nothing'. Selected Event Circled." 
          ) +
  scale_x_continuous(limits = c(0,30)) +
  theme_minimal() 

