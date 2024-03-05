# Title: Plot 3
# Author: Gareth Burns
# Creation Date: 05/03/2024
# Description: Gannt (minimal)

# Load Libraries ----------------------------------------------------------

library(ggplot2)
library(ggrepel)

data <- data.frame(
  start = c(0, 0, 0, 10, 25, 5),
  end = c(1, 1, 1, 11, 26, 20),
  position = c(1, 1.2, 1.4, 1, 1, 1),
  label = c(
    "Treatment",
    "Height",
    "Weight",
    "Measurement1",
    "Measurement2",
    "Repeated Measure"
  )
)

events <-  data.frame(
  time = c(5, 10, 20),
  position = c(2, 2, 2),
  label = "Repeated Measure",
  event = c(1, 2, 3)
)

ggplot(data = data, aes(
  x = start,
  xend = end,
  y = reorder(label, start),
  yend = label
)) +
  geom_segment(linewidth = 10, colour = "#002f45") +
  geom_point(
    data = events,
    aes(x = time, y = label),
    shape = 1,
    colour = "#e57a69",
    size = 5,
    inherit.aes = FALSE
  ) +
  ggtitle(label = "Plot3",
          subtitle = "Project X timeline") +
  labs(caption = "Plot | Gareth Burns") +
  xlab("Time") +
  theme_minimal() +
  theme(
    axis.title.y = element_blank(),
    axis.line.x = element_line(colour = "lightgrey"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
