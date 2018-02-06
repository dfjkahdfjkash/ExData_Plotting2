# Question3, Of the four types of sources indicated 
# by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases 
# in emissions from 1999–2008? Use the ggplot2 plotting system
# to make a plot answer this question.
library("ggplot2")
library("reshape2")

# Get data
source("dataProvider.R")
NEI <- get_NEI()

# Extract data
baltimore_data <- NEI[NEI$fips == "24510",c(4:6)]

# Calculate pm2.5 emissions of four types per year in Baltimore city
melted <- melt(baltimore_data, id.vars = c("type", "year"))
baltimore_data_sum <- dcast(melted, type+year~variable, sum)

# Plot the third graph
png("./data/plot3.png", bg = "white")
p <- ggplot(baltimore_data_sum, aes(year, Emissions, col = type)) 
p <- p + geom_point() + geom_line()
p + ggtitle("PM2.5 emissions change of the four sources 
            in Baltimore city from 1999 to 2008")
dev.off()