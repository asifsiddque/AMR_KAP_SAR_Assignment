# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

#read data
data <- readxl::read_xlsx("data/AMR_KAP_Coded.xlsx")

#knowledge level
data <- data %>% 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ 0,
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ 1,
    KnowledgePCT >= 80 ~ 2
  ))

#attitude level
data <- data %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ 0,
    AttitudePCT >= 50 & AttitudePCT < 80 ~ 1,
    AttitudePCT >= 80 ~ 2
  ))

#practice level
data <- data %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ 0,
    PracticePCT >= 80 ~ 1
  ))

# save as csv
write_csv(data, "data/AMR_KAP_PreProcessed_Data_1.csv")
