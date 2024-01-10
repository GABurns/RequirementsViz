# Title: Sample Size Reestimation
# Author: Gareth Burns
# Creation Date: 10/01/2024
# Description: Expected Behavior using "Nmax" for 4
# "initial" sample sizes

# Load Libraries ----------------------------------------------------------
library(ggplot2)


# User-defined Variables --------------------------------------------------
Nmax <- 750
SampleSizes <- c(25, 75, 200, 500)

data <-
  data.frame(
    Initial = as.factor(rep(SampleSizes, 2)),
    Cat = c(rep("Initial", 4), rep("Re-estimated", 4)),
    SampleSize = c(SampleSizes, rep(Nmax, length(SampleSizes)))
  )
data1 <-
  data.frame(
    Initial = as.factor(rep(SampleSizes, 2)),
    Cat = c(rep("Initial", 4), rep("Re-estimated", 4)),
    SampleSize = c(SampleSizes, SampleSizes)
  )

# Plot --------------------------------------------------------------------

plot <- ggplot(data, aes(
  x = Cat,
  y = SampleSize,
  group = Initial,
  colour = Initial
)) +
  geom_point() +
  geom_path() +
  ggtitle(label = "Sample Size Reestimation (Nmax)",
          subtitle = "Nmax of 750") +
  theme_minimal() +
  xlab("") +
  geom_segment(
    aes(
      x = "Re-estimated",
      y = 200,
      xend = "Re-estimated",
      yend = 750
    ),
    colour = "#619CFF",
    arrow = arrow(length = unit(0.5, "cm"), ends = "both"),
    show.legend = FALSE
  ) +
  geom_point(data = data1, alpha = 0.8) +
  geom_path(data = data1,  linetype = "dashed") +
  annotate(
    "text",
    x = "Re-estimated",
    y = 450,
    label = "The max re-estimated sample size\n can be between the \n inital and the Nmax \n
           (Initial = 200)",
    hjust = 0,
    colour = "#619CFF"
  )

ggsave(filename = file.path("KerusCloud", "Sample Size Reestimation", "nmax.png"), plot = plot, bg = "white", width = 1000, height = 478, units = "px", dpi = "screen")
