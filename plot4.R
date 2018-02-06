# Question 4, across the United States, how have emissions 
# from coal combustion-related sources changed from 1999–2008?

# Get NEI and SCC data
source("dataProvider.R")
NEI <- get_NEI()
SCC <- get_SCC()

# Extract indices related to coal combustion-related sources
# then merge NEI and SCC by selected "SCC"
coal_index <- grep("Coal", SCC[,3])
merged <- merge(NEI[,c(2,4,6)], SCC[coal_index,c(1,3)], by = "SCC")

# Calculate pm2.5 emissions per year
emissions_sum_per_year <- sapply(with(merged, split(Emissions, year)), sum)

# Plot the forth graph
png("./data/plot4.png", bg = "white")
plot(names(emissions_sum_per_year),
     emissions_sum_per_year,
     type = "o",
     main = "Total PM2.5 emissions from coal combustion-related sources 
     between 1999 and 2008", 
     xlab = "Year",
     ylab = "Emitted PM2.5(ton)")
dev.off()

