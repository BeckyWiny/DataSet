# Set seed for reproducibility
set.seed(123)

# Number of customers
num_customers <- 1000

# Generating customer ID
customer_id <- 1:num_customers

# Generating age values between 18 and 70
age <- sample(18:70, num_customers, replace = TRUE)

# Generating random spending amounts
spending_amount <- rnorm(num_customers, mean = 50, sd = 20)

# Generating membership status - random assignment
membership_status <- sample(c("Regular", "Premium"), num_customers, replace = TRUE, prob = c(0.7, 0.3))

# Generating product preferences - random assignment
products <- sample(c("Coke", "Diet Coke", "Sprite", "Fanta"), num_customers, replace = TRUE, prob = c(0.4, 0.3, 0.2, 0.1))

# Creating the dataframe
customer_data <- data.frame(CustomerID = customer_id, Age = age, SpendingAmount = spending_amount, 
                            MembershipStatus = membership_status, Products = products)

# Saving the dataset to a CSV file
write.csv(customer_data, "coca_cola_data.csv", row.names = FALSE)

# Displaying the first few rows of the dataset
head(customer_data)

# View structure of the dataset
str(customer_data)

# Summary statistics
summary(customer_data)

# View the first few rows
head(customer_data)

#DATA EXPLORATION.
# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Check the structure of the dataset
str(customer_data)

# Summary statistics
summary(customer_data)

# Check for missing values
colSums(is.na(customer_data))

# Outlier detection for numerical columns
# For example, boxplot for 'Age' and 'SpendingAmount'
boxplot(customer_data$Age, main = "Age Boxplot")
dev.off()

boxplot(customer_data$SpendingAmount, main = "Spending Amount Boxplot")
dev.off()

#DESCRIPTIVE ANALYSIS
# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Calculate descriptive statistics for 'Age'
mean_age <- mean(customer_data$Age)
median_age <- median(customer_data$Age)
sd_age <- sd(customer_data$Age)

# Calculate descriptive statistics for 'SpendingAmount'
mean_spending <- mean(customer_data$SpendingAmount)
median_spending <- median(customer_data$SpendingAmount)
sd_spending <- sd(customer_data$SpendingAmount)

# Display the calculated statistics
cat("Age - Mean:", mean_age, "Median:", median_age, "Standard Deviation:", sd_age, "\n")
cat("Spending Amount - Mean:", mean_spending, "Median:", median_spending, "Standard Deviation:", sd_spending, "\n")

#ASSOCIATION DESCRIPTIVE MINING

# Association Rule Mining

# Install the arules package if you haven't installed it already
install.packages("arules")

# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Load required packages
library(arules)

# Convert the 'Products' column to transactions
transactions <- as(split(customer_data$Products, customer_data$CustomerID), "transactions")

# Run the association rule mining using Apriori algorithm
rules <- apriori(transactions, parameter = list(support = 0.05, confidence = 0.5))

print("Association Rules")

# Show the discovered rules
inspect(rules)

#TIME SERIES ANALYSIS

# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# 4. Time Series Analysis
# Set 'Purchase_Date' as the index
df$Purchase_Date <- as.Date(df$Purchase_Date)
df_ts <- ts(df$Spending_Amount, start = min(df$Purchase_Date), end = max(df$Purchase_Date), frequency = 365)

# Plot the time series
plot(df_ts, main = 'Monthly Customer Spending', xlab = 'Date', ylab = 'Spending Amount')

dev.off()

#CUSTOMER SEGMENTATION.
# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Select columns for segmentation (Age and SpendingAmount)
segment_data <- customer_data[, c("Age", "SpendingAmount")]

# Standardize the data (if needed)
# segment_data <- scale(segment_data)

# Set the number of clusters (for example, 3 clusters)
num_clusters <- 3

# Perform K-means clustering
kmeans_model <- kmeans(segment_data, centers = num_clusters)

# Add the cluster labels to the dataset
customer_data$Segment <- as.factor(kmeans_model$cluster)

# Analyze segment characteristics
summary_table <- aggregate(segment_data, by = list(Segment = customer_data$Segment), FUN = mean)

# Display segment characteristics
summary_table

#Analyze the distribution of membership status among customers. 
#Compare spending patterns between different membership levels.
# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Bar plot for Membership Status distribution
barplot(table(customer_data$MembershipStatus), main = "Membership Status Distribution", xlab = "Membership Status", ylab = "Frequency")
dev.off()

# Box plot for spending patterns by Membership Status
boxplot(SpendingAmount ~ MembershipStatus, data = customer_data, main = "Spending Patterns by Membership Status", xlab = "Membership Status", ylab = "Spending Amount")
dev.off()

#Customer Visualization. 
#Create visualizations to represent key findings. 
#Use appropriate plots (e.g., histograms, box plots, bar charts).
# Load the dataset
customer_data <- read.csv("coca_cola_data.csv")

# Histogram for Age distribution
hist(customer_data$Age, main = "Age Distribution", xlab = "Age", ylab = "Frequency")
dev.off()

# Bar plot for Membership Status distribution
barplot(table(customer_data$MembershipStatus), main = "Membership Status Distribution", xlab = "Membership Status", ylab = "Frequency")
dev.off()

# Box plot for SpendingAmount distribution
boxplot(customer_data$SpendingAmount, main = "Spending Amount Distribution", ylab = "Spending Amount")
dev.off()

# Scatter plot of Age vs. SpendingAmount
plot(customer_data$Age, customer_data$SpendingAmount, main = "Age vs. Spending Amount", xlab = "Age", ylab = "Spending Amount")
dev.off()

# Pairwise scatterplot matrix
pairs(customer_data[, c("Age", "SpendingAmount")])
dev.off()



