NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data_coal <- SCC[grep("coal",SCC$Short.Name,ignore.case=TRUE),]
SCC <- unique(data_coal$SCC)

bigdata = NULL

for (i in 1:length(SCC))

{
  
  bigdata1 <- NEI[NEI$SCC == SCC[i],]
  bigdata <- rbind(bigdata,bigdata1)
  
}

coal_emmission_data <- tapply(bigdata$Emissions,bigdata$year,sum)
png("plot4.png",width = 480, height = 480)

barplot(coal_emmission_data,xlab="Year",ylab="Total Coal emmissions")

dev.off()