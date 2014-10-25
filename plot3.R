NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have
# seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen
# increases in emissions from 1999-2008? Use the ggplot2 plotting system to make
# a plot answer this question.

library("ggplot2")

t <- NEI[NEI$fips == "24510",]

png("plot3.png", width = 960)

g <-  ggplot(t, aes(year, Emissions, color = type))

p <- g + geom_point() + facet_grid(. ~ type) + geom_smooth(method = "lm") + 
        labs(title = expression("PM"[2.5]*" Emissions for Baltimore")) + 
        labs(x = "Year", y = expression("PM"[2.5]*" Emissions in Tons")) + 
        coord_cartesian(ylim = c(0,200))

print(p)

dev.off()