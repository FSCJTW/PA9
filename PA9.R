# PA9
# T. Wallace
# 07/15/2026
# Simple Linear Regression Using Dataset: mtcars (built-in R dataset)

# Step 1: Plot the Data
plot(mtcars$wt, mtcars$mpg,
     main = "Fuel Efficiency vs Vehicle Weight",
     xlab = "Vehicle Weight (in 1000 lbs)",
     ylab = "Fuel Efficiency (Miles Per Gallon)",
     pch = 16, col = "blue", cex = 1.2)

# Step 2 & 3: Fit Linear Regression Model + Add Regression Line
model <- lm(mpg ~ wt, data = mtcars)
abline(model, col = "red", lwd = 3)

# Step 4: Interpret the Slope + Statistical Significance
summary(model)
# Confidence interval for the slope
confint(model, level = 0.95)
# Interpretation
# Estimated slope = About -5.34
# Explanation = Every additional 1,000 pounds in vehicle weight, the predicted fuel efficiency decreases by about 5.34 miles per gallon, on average
# p-value for wt = Very small (much less than 0.05)
# 95% confidence level = Does not include 0
# Conclusion = No statistically significant negative relationship between vehicle weight and fuel efficiency

# Step 5: Create new data for prediction
new_car <- data.frame(wt = 6.0)   # 6000 lbs = 6 (in thousands)

# Step 6: Get point estimate + 95% Prediction Interval
prediction <- predict(model, newdata = new_car, interval = "prediction", level = 0.95)
print(prediction)

# Step 7: Evaluation
# Weight of 6,000 lbs (wt = 6) within range of mtcars dataset and ranges between 1.5 and 5.4
# It is within the observed range so we can be confident in this prediction
# There could other factors we may want to consider though in the future

