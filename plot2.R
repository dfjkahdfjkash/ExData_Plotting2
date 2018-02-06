# Question2, Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

# Get NEI data
source("dataProvider.R")
NEI <- get_NEI()

# Extract data of Baltimore city
baltimore_emissions_and_years <- NEI[NEI$fips == "24510",c(4,6)]

# Calculate pm2.5 emissions per year in Baltimore City
total_emissions_in_each_year <- with(baltimore_emissions_and_years, tapply(Emissions, year, sum))

# Plot the second graph
png("./data/plot2.png", bg = "white")
plot(names(total_emissions_in_each_year), 
        total_emissions_in_each_year,
        type = "o",
        main = "Total PM2.5 emissions in the Baltimore city, 
        Maryland from 1999 to 2008", 
        xlab = "Year",
        ylab = "Emitted PM2.5(ton)")
dev.off()

