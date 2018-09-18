# plot for equine numbers in canada per province over history
# author: Tiffany A. Timbers
# created: Sept 18, 2018

#load libraries
library(tidyverse)

# load data
horse_pop <- read_csv("data/00030067-eng.csv")
horse_pop <- filter(horse_pop,
                    DATE == "At June 1 (x 1,000)",
                    GEO != "Canada")
horse_pop$Value <- horse_pop$Value * 1000

# create plot 
horse_plot <- ggplot(horse_pop, aes(x = Ref_Date, y = Value)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("Number of horses") +
  ggtitle("Historical number of horses per province in Canada") +
  facet_grid(~GEO) +
  scale_y_continuous(labels = scales::comma)

horse_plot

ggsave(filename = "horse_plot.png", horse_plot, width = 12, height = 3)
