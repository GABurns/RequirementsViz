# Title: Plot 1 
# Author: Gareth Burns
# Creation Date: 05/03/2024
# Description: Lollipop timeline

# Load Libraries ----------------------------------------------------------

library(ggplot2)


# Create Data -------------------------------------------------------------

data <- data.frame(
  time = c(0, 0, 0, 10, 25),
  position = c(1, 1.2, 1.4, 1, 1),
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
  position = c(2, 2, 2),
  label = "Repeated Measure",
  event = c(1, 2, 3)
)


# Create Plot -------------------------------------------------------------

ggplot(data = data, aes(x = time, y = position)) +
  geom_point(
    data = repeatedMeasure,
    aes(x = time, y = position),
    colour = "#e57a69",
    shape = 17,
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
  geom_segment(aes(xend = time, yend = 0),
               colour = "#66b4eb",
               linewidth = 1) +
  geom_label(data = repeatedMeasure[which.max(repeatedMeasure$time), ], aes(label = label), nudge_x = 3.0) +
  geom_point(
    size = 5,
    colour = "#73dabf",
    fill = "#002f45",
    shape = 21
  ) +
  geom_label(aes(label = label), nudge_x = 3.0) +
  scale_y_continuous(limits = c(0, 3)) +
  scale_x_continuous(limits = c(0, 30)) +
  ggtitle(label = "Plot1",
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
