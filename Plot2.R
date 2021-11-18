NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Data_Baltimore <- subset(NEI,fips=="24510")
yearwise_Data_Baltimore <- tapply(Data_Baltimore$Emissions,Data_Baltimore$year,sum)

png("plot2.png",width = 480, height = 480)

plot(names(yearwise_Data_Baltimore),yearwise_Data_Baltimore,type="o",col=yearwise_Data_Baltimore, xlab = "Year" ,ylab = "Total emmissions",pch=19)

dev.off()