#load packages
library(tidyverse)
library(likert)
library(ggpubr)
library(ggthemes)
library(RColorBrewer)

install.packages("RColorBrewer")

#import data
data <- readxl::read_excel("data/AMR_KAP_No_Code.xlsx")

#Likert items
lds <- data

#check str
glimpse(lds)

#Visualize Knowledge
Knowledge_df <- lds %>% 
  select(12:23) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

#plot in Likert scale
p1 <- plot(likert(Knowledge_df),
           ordered = FALSE,
           group.order =names(Knowledge_df),
           center = 2)
p1 + theme_pubr()
p1

#export
ggsave("figures/Knowledge.tiff", units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')

#Visualize Attitude Response
Attitude_df <- lds %>% 
  select(24:33) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

#plot in Likert scale
p2 <- plot(likert(Attitude_df),
           ordered = FALSE,
           group.order =names(Attitude_df),
           center = 2)
p2 + theme_pubr()
p2

#export
ggsave("figures/Attitude.tiff", units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')

#Visualize Practice Response
Practice_df <- lds %>% 
  select(34:39) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

#plot in Likert scale
p3 <- plot(likert(Practice_df),
           ordered = FALSE,
           group.order =names(Practice_df))
p3 + theme_pubr()
p3

#export
ggsave("figures/Practice.tiff",units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')