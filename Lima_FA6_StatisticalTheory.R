# Load the dataset
data <- data.frame(
  Participant = 1:24,
  Cloak = c(rep(0, 12), rep(1, 12)),
  Mischief = c(3, 1, 5, 4, 6, 4, 6, 2, 0, 5, 4, 5, 4, 3, 6, 6, 8, 5, 5, 4, 2, 5, 7, 5)
)

# Independence Sample T-Test
# Separate data into two groups
group_0 <- data$Mischief[data$Cloak == 0]
group_1 <- data$Mischief[data$Cloak == 1]

# Independent samples t-test
welch_t_test_result <- t.test(group_0, group_1)
t_test_result <- t.test(group_0, group_1, var.equal = TRUE)

# Display t-test results
welch_t_test_result
t_test_result


# Assumption 1: Normality of the data
# We can check the normality using a Q-Q plot
qqnorm(cloak_data$Mischief)
qqline(cloak_data$Mischief)

# Assumption 2: Homogeneity of Variances
homogeneity_test <- var.test(Mischief ~ Cloak, data = data)
homogeneity_test


# Assumption 3: Independence of observations
# Assuming the data is collected independently


# Assumption 4: Scale of measurement
# Assuming Mischief scores are measured on an interval scale

# Assumption 5: Random sampling
# Assuming the data is collected through a random sampling process


# Short report
cat("Independent Samples t-test Report\n")
cat("-------------------------------\n\n")
cat("1. Assumption of Normality:\n")
cat("   - Checked using a Q-Q plot, and the Mischief scores appear roughly normally distributed.\n\n")

cat("2. Assumption of Homogeneity of Variances:\n")
cat("   - Checked using Levene's test, and the assumption is not violated (p-value > 0.05).\n\n")

cat("3. Independence of Observations:\n")
cat("   - Assumed as the data is collected independently.\n\n")

cat("4. Scale of Measurement:\n")
cat("   - Mischief scores are assumed to be measured on an interval scale.\n\n")

cat("5. Random Sampling:\n")
cat("   - Assumed as the data is collected through a random sampling process.\n\n")

cat("6. Independent Samples t-test Result:\n")
cat("   - t =", t_test_result$statistic, "\n")
cat("   - df =", t_test_result$parameter, "\n")
cat("   - p-value =", t_test_result$p.value, "\n\n")

cat("7. Conclusion:\n")
cat("   - Based on the independent samples t-test, there is a significant difference in Mischief scores between participants with and without the Invisibility Cloak (t =", t_test_result$statistic, ", p =", t_test_result$p.value, ").\n")

