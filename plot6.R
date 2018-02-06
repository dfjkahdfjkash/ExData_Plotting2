# Question 6, Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# Get NEI data
source("dataProvider.R")
NEI <- get_NEI()

# Extract Baltimore city data and Los Angeles County data
baltimore_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",c(4,6)]
LA_data <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",c(4,6)]

# Calculate pm2.5 emissions per year
baltimore_sum_per_year <- sapply(with(baltimore_data, split(Emissions, year)), sum)
LA_sum_per_year <- sapply(with(LA_data, split(Emissions, year)), sum)

# Plot the sixth graph
png("./data/plot6.png", bg = "white")
plot(names(LA_sum_per_year), 
     LA_sum_per_year,
     type = "o",
     col = "blue",
     ylim = c(0, 5500),
     main = "PM2.5 emissions from motor vehicle sources
     in Baltimore City and in Los Angeles County
     between 1999 and 2008",
     xlab = "Year",
     ylab = "Emitted PM2.5(ton)")
lines(names(baltimore_sum_per_year),
      baltimore_sum_per_year,
      type = "o",
      col = "red")
legend("topright", 
       c("Los Angeles County", "Baltimore City"), 
       col = c("blue","red"), 
       lty = 1)
dev.off()
