# Title: "Building a Data Pipeline"
# Author: "Rafi Alim"
# Email: "ralim2@illinois.edu"
# Date: "January 25th, 2023"

# Script Name: Task 3

# Description:

# Notes:

# Working Environment Setup

# Load required libraries
load_packages <- c("tidyverse", "sf") 

# Add more packages here as needed
lapply(load_packages, library, character.only = TRUE)

# Set global options

# Define functions

# Load library for reading csv files
library(readr)

# Read csv file
data <- read.csv("data/ReferenceCCAProfiles20162020.csv", header=TRUE)

# Calculate numeric and percentage change
data$numeric_change <- data$X2020_POP - data$X2010_POP
data$percent_change <- (data$numeric_change / data$X2010_POP)

install.packages("ggplot2")

# Load ggplot2
library("ggplot2")

library(tidyverse)

install.packages("tidyverse")

data |> 
  mutate(GEOG = fct_reorder(GEOG, percent_change)) |> 
  ggplot()+
  geom_col(aes(x = percent_change, y=GEOG)) +
  labs(x = "Population Change", y = NULL)+
  scale_x_continuous(labels = scales::percent, n.breaks = 6)+
  theme_minimal()

# Load the necessary libraries
library(dplyr)

# Filter the data to include only GEOG values with percent_change greater than 10
increase_data <- data %>%
  filter(percent_change > .10)

# Select only the GEOG and percent_change columns
increase_data <- increase_data %>%
  select(GEOG, percent_change)

# Convert the percent_change values to percentages
increase_data$percent_change <- round(increase_data$percent_change * 100, 2)

# Print the increase data
increase_data

# Filter the data to include only GEOG values with percent_change less than -10
decrease_data <- data %>%
  filter(percent_change < -0.10)

# Select only the GEOG and percent_change columns
decrease_data <- decrease_data %>%
  select(GEOG, percent_change)

# Convert the percent_change values to percentages
decrease_data$percent_change <- round(decrease_data$percent_change * 100, 2)

# Print the decrease data
decrease_data

