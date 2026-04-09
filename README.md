# ISM6404FINAL
Lorelai B., Sarah P., Kristen W., Taylor W.

Project Overview
This project analyzes daily sales, customer behavior, and profitability for a mobile food truck operating across multiple locations from March–August 2025. The goal is to identify which factors most strongly influence customer turnout and profit, and to build regression models that support forecasting and business decision‑making.

The analysis follows the same structure as a previous retail‑store analytics project but is fully adapted to the food‑truck dataset.

Dataset
File: ism6404_food_truck.csv  
Rows: ~180
Columns: 15

Key variables include:
  Date, day of week, location
  Weather + temperature
  Event indicators
  Competitors
  Customers
  Items sold (tacos, burritos, quesadillas, drinks)
  Revenue, daily cost, profit

This dataset allows for both descriptive and predictive analytics.

Methods
The analysis includes:
  Exploratory Data Analysis
  Summary statistics
  Correlation analysis
  Visualizations (scatterplots, faceted plots)
  Regression Modeling
  Simple Linear Regression
    customers ~ temperature
  Multiple Regression
    profit ~ temperature + customers
  10‑fold Cross‑Validation (caret)
  Visualizations
    Customers vs Temperature
    Profit vs Temperature
    Profit vs Customers
    Faceted trends by day of week

Key Findings
Temperature has a weak relationship with customer turnout.
Profit is driven primarily by customer count, not weather.
Special events and high‑traffic locations create noticeable spikes.
Weekends outperform weekdays across most locations.
Cross‑validation confirms that temperature adds little predictive power.

R code by Taylor
in collaboration with Lorelai's Python code in Datacamp
Report by Kristen and Sarah
