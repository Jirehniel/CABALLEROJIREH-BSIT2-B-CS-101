# Read existing CSV files
product1 <- read.csv("1st_Product_updated.csv")
product2 <- read.csv("2nd_Product_updated.csv")
product3 <- read.csv("3rd_product_updated.csv")

# Combine data frames vertically using rbind
merged_products <- rbind(product1, product2, product3)

# Save the merged data frame to a new CSV file
write.csv(merged_products, "merged_products.csv", row.names = FALSE)



