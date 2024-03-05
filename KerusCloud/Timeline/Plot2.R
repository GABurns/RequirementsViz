# Title: Plot 2
# Author: Gareth Burns
# Creation Date: 05/03/2024
# Description: Lollipop above and below

# Load Libraries ----------------------------------------------------------

library(ggplot2)
library(ggrepel)

data1 <- data.frame(
  time = c(-0.7, 0, 0.7, 10, 25),
  time_line = c(0, 0, 0, 10, 25),
  position = c(1, 1, 1, 1, 1),
  label = c(
    "Treatment",
    "Height",
    "Weight",
    "Measurement1",
    "Measurement2"
  )
)

repeatedMeasure <- data.frame(
  time = c(5, 10, 20),
  position = c(-1,-1,-1),
  label = "Repeated Measure",
  event = c(1, 2, 3)
)



ggplot(data = data1, aes(x = time, y = position)) +
  geom_point(
    data = repeatedMeasure,
    aes(x = time, y = position),
    fill = "#e57a69",
    shape = 21,
    size = 3,
    inherit.aes = FALSE
  ) +
  geom_line(
    data = repeatedMeasure,
    aes(x = time, y = position),
    colour = "#e57a69",
    linetype = "dashed",
    inherit.aes = FALSE
  ) +
  geom_segment(
    data = repeatedMeasure,
    aes(x = time, xend = time, yend = 0),
    colour = "#e57a69",
    linewidth = 1
  ) +
  geom_segment(
    aes(x = time_line, xend = time_line, yend = 0),
    colour = "#66b4eb",
    linewidth = 1
  ) +
  geom_label(data = repeatedMeasure[which.max(repeatedMeasure$time),], aes(label = label), nudge_x = 3.0) +
  geom_point(
    size = 5,
    colour = "#73dabf",
    fill = "#002f45",
    shape = 21
  ) +
  geom_label_repel(aes(label = label), nudge_y = 0.3) +
  scale_y_continuous(limits = c(-2, 2)) +
  scale_x_continuous(limits = c(-1, 30), position = "top") +
  geom_hline(yintercept = 0) +
  ggtitle(label = "Plot2",
          subtitle = "Project X timeline") +
  labs(caption = "Plot | Gareth Burns") +
  theme_minimal() +
  theme(
    axis.title.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank(),
    axis.line.x = element_line(colour = "lightgrey"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
