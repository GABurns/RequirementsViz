# Title: Likert Data Wrangling
# Author: Gareth Burns
# Creation Date: 06/03/2024
# Description: A script to produce plots from Likert Data

# Plot --------------------------------------------------------------------

ggplot(data = data, aes(x = Percent, fill = Response, y = Feature)) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "YlGn")+
  labs(
    title = "KerusCloud VPV",
    subtitle = "Reponse to 'How important would you view the feature?'",
    x = "Response (%)",
    y = "Feature"
  ) +
  theme_classic() +
  theme(legend.position = "bottom")


# Summary

data$Response <- scale[match(data$Response, names(scale))]

data <- data |>
  group_by(Feature) |>
  summarise(Mean = mean(Response)) |>
  arrange(Mean)

ggplot(data, aes(x = Mean, xend = 1, y = reorder(Feature, Mean), yend = Feature)) +
  geom_segment() +
  geom_point(size = 8, colour = "lightblue") +
  geom_text(aes(label = Mean)) +
  ggtitle(label = "Virtual Population Visualisation", 
          subtitle = "Average Response of Feature on Likert scale (1-5)") +
  scale_x_continuous(limits = c(1, 5))+
  xlab("Mean Response") +
  ylab("Feature") +
  theme_classic() 

