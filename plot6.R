NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

citynames <- list('06037' = "Los Angeles", '24510' = "Baltimore")
citylabeller <- function(variable, value){
        return(citynames[value])
}

t <- NEI[((NEI$fips == "24510" | NEI$fips == "06037") & 
                  (NEI$type == "ON-ROAD" | NEI$type == "OFF-ROAD")),]

png("plot6.png")
g <- ggplot(t, aes(year, Emissions))

p <- g + geom_point() +  facet_grid(. ~ fips, labeller = citylabeller) + 
        geom_smooth(method = "lm") + coord_cartesian(ylim = c(0,50)) + 
        labs(title = expression("PM"[2.5]*" Emissions from Motor Vehicles in Los Angeles vs Baltimore")) + 
        labs(x = "Year", y = expression("PM"[2.5]*" Emissions in Tons"))

print(p)

dev.off()