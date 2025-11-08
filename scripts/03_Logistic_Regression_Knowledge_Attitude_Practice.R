# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

#import data
data <- read_csv("data/AMR_KAP_PreProcessed_Data_1.csv")

glimpse(data)

# Create multivariate logistic regression model (Knowledge)
mv_model <- glm(Knowledge_Level ~ `Parent’s age (years)`+`Parent’s sex`+
                  `Parent’s education level`+`Employment status`+`Family type`+
                  `Your average household income per month (BDT)`+`Child’s sex`+
                  `Child’s sex`+ `Child’s age (years)`+ `Number of children`,
                data = data, family = binomial())


summary(mv_model)

# tbl_regression 
mv_model %>%  
  tbl_regression(exponentiate = TRUE)  %>%  
  modify_header(estimate = "**OR**") %>% 
  bold_p(t = 0.05)  %>%  
  as_gt()  %>%  
  gtsave("tables/Table4.docx")

# Create multivariate logistic regression model (Attitude)
mv_model1 <- glm(Attitude_Level ~ `Parent’s age (years)`+`Parent’s sex`+
                  `Parent’s education level`+`Employment status`+`Family type`+
                  `Your average household income per month (BDT)`+`Child’s sex`+
                  `Child’s sex`+ `Child’s age (years)`+ `Number of children`,
                 data = data, family = binomial())


summary(mv_model1)

# tbl_regression 
mv_model1 %>%  
  tbl_regression(exponentiate = TRUE)  %>%  
  modify_header(estimate = "**OR**") %>% 
  bold_p(t = 0.05)  %>%  
  as_gt()  %>%  
  gtsave("tables/Table5.docx")

# Create multivariate logistic regression model (Practice)
mv_model2 <- glm(Practice_Level ~ `Parent’s age (years)`+`Parent’s sex`+
                  `Parent’s education level`+`Employment status`+`Family type`+
                  `Your average household income per month (BDT)`+`Child’s sex`+
                  `Child’s sex`+ `Child’s age (years)`+ `Number of children`+
                  `Knowledge_Level` + `Attitude_Level`, data = data,
                 family = binomial())


summary(mv_model2)

# tbl_regression 
mv_model2 %>%  
  tbl_regression(exponentiate = TRUE)  %>%  
  modify_header(estimate = "**OR**") %>% 
  bold_p(t = 0.05)  %>%  
  as_gt()  %>%  
  gtsave("tables/Table6.docx")
