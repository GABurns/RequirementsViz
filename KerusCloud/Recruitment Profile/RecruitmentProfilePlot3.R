# Title: Recruitment Profile
# Author: Gareth Burns
# Creation Date: 06/03/2024
# Description: A mock stream chart of the recruitment profile.
# Link: https://r-graph-gallery.com/web-stacked-area-chart-inline-labels.html


# Load Libraries ----------------------------------------------------------

library(ggplot2)
library(ggstream)
library(dplyr)


# Local Variables ---------------------------------------------------------

CoporateColours <- c("#73dabf", "#002f45", "#66b4eb", "#e57a69", "#91c0d6")


# Create Data -------------------------------------------------------------

data <- as.data.frame(expand.grid(list(time = c(0, 5, 10, 25, 50), 
                                       site = c("SiteA", "SiteB", "SiteC", "SiteD"))))

data$patients <- c(seq(from = 100, to = 500, length.out = 5), seq(from = 0, to = 100, length.out = 5),
                   seq(from = 50, to = 250, length.out = 5), seq(from = 0, to = 25, length.out = 5))

order <- c("SiteA", "SiteB", "SiteC", "SiteD")

data$site <- factor(data$site, levels = order) 

groupData <- data |>
  group_by(time) |>
  summarise(patients = sum(patients))

ggplot(data = site, aes(x = time, y = patients, fill = site, label = site, color = site)) +
  geom_area(alpha = 0.5) +
  xlab("Time") +
  ylab("") +
  labs(title = "Recruitment Profile of Project X",
       subtitle = "Number of patients recruited over time at 4 sites",
       caption = "Plot | Gareth Burns")+
  theme_minimal() +
  theme(
    axis.line.x = element_line(linewidth = .75),
    plot.margin = margin(20,120,20,20),
  ) +

  scale_fill_manual(values=CoporateColours) +
  scale_color_manual(values=CoporateColours) +
  scale_x_continuous(breaks=c(0,5,10,25,50)) +
  scale_y_continuous(expand = c(0,0)) +
  coord_cartesian(clip = "off") 


