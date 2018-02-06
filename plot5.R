# Question5, how have emissions from motor vehicle sources changed
# from 1999–2008 in Baltimore City?

# Get NEI data
source("dataProvider.R")
NEI <- get_NEI()

# Extract Baltimore city data of type "ON-ROAD"
# then merge NEI and SCC by selected "SCC"
baltimore_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",c(4,6)]

# Calculate pm2.5 emissions per year
emissions_sum_per_year <- sapply(with(baltimore_data, split(Emissions, year)), sum)

# Plot the fifth graph
png("./data/plot5.png", bg = "white")
plot(names(emissions_sum_per_year), 
     emissions_sum_per_year,
     type = "o",
     main = "PM2.5 emissions from motor vehicle sources
     in Baltimore City between 1999 and 2008",
     xlab = "Year",
     ylab = "Emitted PM2.5(ton)")
dev.off()

