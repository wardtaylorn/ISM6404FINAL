
library(tidyverse)
library(caret)

food <- read_csv('ism6404_food_truck.csv')

# Inspect data
glimpse(food)

# Data Preparation
food_clean <- food %>%
  filter(!is.na(temperature))

# 1. Correlation Analysis
correlation <- cor(food_clean$customers, food_clean$temperature)
print(paste("Correlation between customers and temperature:", round(correlation, 3)))

# 2. Visualization: Customers vs Temperature
ggplot(food_clean, aes(x = temperature, y = customers)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "darkred") +
  labs(
    title = "Daily Customers vs Temperature",
    x = "Temperature (°F)",
    y = "Number of Customers"
  ) +
  theme_minimal()

# 3. Linear Regression: Customers ~ Temperature
lm_customers <- lm(customers ~ temperature, data = food_clean)
summary(lm_customers)

# 4. Multiple Regression: Profit ~ Temperature + Customers
lm_profit <- lm(profit ~ temperature + customers, data = food_clean)
summary(lm_profit)

# 5. Visualization: Profit vs Temperature & Customers

# Profit vs Temperature
ggplot(food_clean, aes(x = temperature, y = profit)) +
  geom_point(color = "forestgreen", alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "darkorange") +
  labs(
    title = "Daily Profit vs Temperature",
    x = "Temperature (°F)",
    y = "Profit ($)"
  ) +
  theme_minimal()

# Profit vs Customers
ggplot(food_clean, aes(x = customers, y = profit)) +
  geom_point(color = "purple", alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(
    title = "Daily Profit vs Customers",
    x = "Number of Customers",
    y = "Profit ($)"
  ) +
  theme_minimal()

# 6. Extra: Facet by Day of Week
ggplot(food_clean, aes(x = temperature, y = customers, color = day_of_week)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Customer Trends by Day of Week",
    x = "Temperature (°F)",
    y = "Number of Customers"
  ) +
  theme_minimal()

# Cross-Validation (10-fold CV)
train_control <- trainControl(method = "cv", number = 10)

# Model 1: Customers ~ Temperature
cv_customers <- train(customers ~ temperature,
                      data = food_clean,
                      method = "lm",
                      trControl = train_control)
print(cv_customers)

# Model 2: Profit ~ Temperature + Customers
cv_profit <- train(profit ~ temperature + customers,
                   data = food_clean,
                   method = "lm",
                   trControl = train_control)
print(cv_profit)

