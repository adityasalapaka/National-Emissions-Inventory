NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[with(NEI, order(SCC)),]

SCC <- readRDS("Source_Classification_Code.rds")
SCC <- SCC[with(SCC, order(SCC)),]

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

library("ggplot2")

sources <- SCC[grep("Coal", SCC$Short.Name),]$SCC

data <- NEI[NEI$SCC == sources,]
data <- data[with(data, order(SCC)),]

png("plot4.png")

g <- ggplot(data, aes(year, Emissions))

p <- g + geom_point() + geom_smooth(method = "lm") + 
        labs(title = expression("PM"[2.5]*" Emissions from Coal for United States")) + 
        labs(x = "Year", y = expression("PM"[2.5]*" Emissions in Tons")) +
        coord_cartesian(ylim = c(0,100))

print(p)

dev.off()