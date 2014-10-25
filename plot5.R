NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in 
# Baltimore City?

library("ggplot2")

t <- NEI[(NEI$fips == "24510" & 
                  (NEI$type == "ON-ROAD" | NEI$type == "OFF-ROAD")),]

png("plot5.png")

g <- ggplot(t, aes(year, Emissions))

p <- g + geom_point() + geom_smooth(method = "lm") + 
        labs(title = expression("PM"[2.5]*" Emissions from Motor Vehicles for Baltimore")) + 
        labs(x = "Year", y = expression("PM"[2.5]*" Emissions in Tons"))

print(p)

dev.off()