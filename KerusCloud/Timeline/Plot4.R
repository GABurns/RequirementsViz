# Title: Plot 4
# Author: Gareth Burns
# Creation Date: 05/03/2024
# Description: Gannt (styled)

# Load Libraries ----------------------------------------------------------

data <- data.frame(
  start = c(0, 0, 0, 5, 10, 20, 25, 5),
  end = c(0.2, 0.2, 0.2, 5.2, 10.2, 20.2, 25.2, 20),
  position = c(1, 1.2, 1.4, 1, 1, 1, 1, 1),
  label = c(
    "Treatment",
    "Height",
    "Weight",
    "Measurement1",
    "Measurement2",
    "Measurement3",
    "Measurement4",
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
  geom_segment(linewidth = 10, aes(colour = label), lineend = "round") +
  geom_point(
    aes(x = start, y = label),
    shape = 21,
    fill = "#e57a69",
    size = 5,
    inherit.aes = FALSE
  ) +
  geom_segment(
    data = data,
    aes(
      x = 0,
      xend = 30,
      y = reorder(label, start),
      yend = label,
      colour = label
    ),
    linewidth = 10,
    alpha = 0.1,
    lineend = "round"
  ) +
  geom_point(
    data = events,
    aes(x = time, y = label),
    shape = 21,
    fill = "#e57a69",
    size = 5,
    inherit.aes = FALSE
  ) +
  scale_x_continuous(limits = c(0, 30)) +
  ggtitle(label = "Plot4",
          subtitle = "Project X timeline") +
  labs(caption = "Plot | Gareth Burns") +
  xlab("Time") +
  theme_minimal() +
  theme(
    axis.title.y = element_blank(),
    axis.line.x = element_line(colour = "lightgrey"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "none"
  )
