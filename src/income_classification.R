# Library ----------------------------------------------------------------
library(Boruta)
library(dotenv)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(VIM)

# Data Import ---------------------------------------

setwd("C:/Users/keita/git/income_classification")

df <- read.csv("data/raw/adult_before_boruta.csv")

# Columns to male it factor
cols_to_factor <- c("workclass", "education.grouped", "marital.status", "occupation", "relationship", "race", "sex", "native.country.grouped", "income")

# Factorize train dataset columns
df[cols_to_factor] <- lapply(df[cols_to_factor], factor)

# columns
columns <- names(df)
print(columns)
sapply(df, class)

# Missing Data -----------------------------------------------------------

missing_data <- df %>%
  summarise_all(function(x) sum(is.na(x) | x == "")) %>%
  gather(variable, missing_count)

missingness = aggr(df,
                   col=c('navyblue','yellow'),numbers=TRUE,sortVars=TRUE,
                   cex.axis=.7,gap=2)
# Correctly there are not any missing values

# Model selection ----------------------------------------------------------

set.seed(9999)
#Boruta
boruta.df = Boruta(income ~., data = df, doTrace = 1)
plot(boruta.df, xlab = "features", xaxt = "n", ylab="MDI")

print(boruta.df)

boruta.metrics = attStats(boruta.df)
head(boruta.metrics)
table(boruta.metrics$decision)

vi_bo = subset(boruta.metrics, decision == "Confirmed")
head(vi_bo)
viname_bo = rownames(vi_bo)

#ggplot2
boruta.df <- data.frame(Feature = rownames(boruta.metrics), MeanImp = boruta.metrics$meanImp)
boruta.df <- boruta.df[boruta.metrics$decision == "Confirmed", ]

# Plot ggplot2
ggplot(boruta.df, aes(x = reorder(Feature, MeanImp), y = MeanImp)) +
  geom_bar(stat = "identity", fill = "green") +
  coord_flip() +  # Ruota l'asse X per mostrare i nomi verticalmente
  xlab("Features") +
  ylab("Mean Decrease in Impurity") +
  theme_minimal(base_size = 12)

