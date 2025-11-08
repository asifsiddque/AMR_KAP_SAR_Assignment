#load packages
library(tidyverse)
library(naniar)

#read data
data <- readxl::read_xlsx("data/AMR_KAP_Coded.xlsx")


#check missing data
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)
help("naniar")

#knowledge level
data <- data %>% 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ "Poor",
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ "Moderate",
    KnowledgePCT >= 80 ~ "Good"
  ))

#attitude level
data <- data %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ "Negative",
    AttitudePCT >= 50 & AttitudePCT < 80 ~ "Uncertain",
    AttitudePCT >= 80 ~ "Positive"
  ))

#practice level
data <- data %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ "Misuse",
    PracticePCT >= 80 ~ "Good"
  ))

#export pre-processed data
write.csv(data,"data/AMR_KAP_Processed_Data.csv", row.names = F)

