library(ggrepel)
library(sf)
library(maps)
library(RColorBrewer)
library(tidyverse)
library(scales)
library(ggthemes)

source("thememap.R")
palette <- brewer.pal(6, "Set1")
all.states <- map_data("state")

gas_hubs <- read.csv("./Data/Natural_Gas_Market_Hubs.csv", 
               header=TRUE, 
               stringsAsFactors=FALSE)
pipelines <- st_read("./Data/Natural_Gas_Liquid_Pipelines.shp", quiet = TRUE)
lower48 <- pipelines %>% filter(OperatorNa != "Kenai Kachemak Pipeline")

p <- gas_hubs %>% ggplot(aes(x=X, y=Y)) + 
  geom_polygon(data=all.states, aes(x=long, y=lat, group = group),colour=palette[3], fill=NA)+ 
  geom_sf(data = lower48, inherit.aes =FALSE, color=palette[3]) +
  geom_point(color=palette[1]) + 
  geom_text_repel(aes(label=Hub_name), color="black") + 
  labs(title='Natural Gas Hubs & Pipelines from HIFLD') + 
  theme_map() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

pdf("HubsAndLines.pdf", width = 11, height = 8.5)
print(p)
dev.off()




