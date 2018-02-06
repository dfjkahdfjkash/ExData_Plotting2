# Question 1, Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Get NEI data
source("dataProvider.R")
NEI <- get_NEI()

# Extract data
year_and_emissions <- NEI[,c(4,6)]

# Calculate pm2.5 emissions per year
emissions_sum_per_year <- sapply(with(year_and_emissions, split(Emissions, year)), sum)

# Plot the first graph
png("./data/plot1.png", bg = "white")
plot(names(emissions_sum_per_year),
     emissions_sum_per_year,
     type = "o",
     main = "Total PM2.5 emissions from 1999 to 2008", 
     xlab = "Year",
     ylab = "Emitted PM2.5(ton)")
dev.off()