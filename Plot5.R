NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Data_Baltimore <- subset(NEI,fips=="24510") 
data_Motor <- SCC[grep("vehicle",SCC$Short.Name,ignore.case=TRUE),]
SCC <- unique(data_Motor$SCC)

bigdata = NULL

for (i in 1:length(SCC))
  
{
  
  bigdata1 <- Data_Baltimore[Data_Baltimore$SCC == SCC[i],]
  bigdata <- rbind(bigdata,bigdata1)
  
}

Motor_emmission_data <- tapply(bigdata$Emissions,bigdata$year,sum)

png("plot5.png",width = 480, height = 480)

barplot(Motor_emmission_data,xlab="Year",ylab="Total Motor emmissions",main = "Baltimore PM2.5")

dev.off()
