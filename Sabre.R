# Load library
library(forecast)

# Set working directory
setwd("C:/Program Files/RStudio")

# Import Data, Air_traffic, 2015-Jan to 2016-Dec
inf_data <- read.csv("Final_co_relation.csv")
inf_data$Air_traffic <- ts(inf_data$Air_traffic, start = c(2015,1), end = c(2016,12), frequency = 12)

summary(inf_data)

dAir_traffic <- diff(inf_data$Air_traffic, 1)

# Estimating AR Model:
fit_diff_ar <- arima(dAir_traffic, order=c(1,0,0))

# Forecasting:
fit_diff_arf <- forecast(fit_diff_ar, h=6)

# Plotting:
plot(forecast(fit_diff_ar, h=12), include = 20)

