NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Data_Baltimore <- subset(NEI,fips=="24510") 
Data_california <- subset(NEI,fips=="06037")
data_Motor <- SCC[grep("vehicle",SCC$Short.Name,ignore.case=TRUE),]
SCC <- unique(data_Motor$SCC)

bigdata_Bal = NULL
bigdata_LA =NULL
for (i in 1:length(SCC))
  
{
  
  bigdata_Bal1 <- Data_Baltimore[Data_Baltimore$SCC == SCC[i],]
  bigdata_Bal <- rbind(bigdata_Bal,bigdata_Bal1)
  
}

for (i in 1:length(SCC))
  
{
  
  bigdata_LA1 <- Data_california[Data_california$SCC == SCC[i],]
  bigdata_LA <- rbind(bigdata_LA,bigdata_LA1)
  
}



Motor_emmission_data_Bal <- tapply(bigdata_Bal$Emissions,bigdata_Bal$year,sum)
Motor_emmission_data_LA <- tapply(bigdata_LA$Emissions,bigdata_LA$year,sum)

png("plot6.png",width = 480, height = 480)

par(mfrow=c(1,2))
plot(names(Motor_emmission_data_Bal),Motor_emmission_data_Bal,type="o",col=Motor_emmission_data_Bal, xlab = "Year" ,ylab = "Total emmissions Bal",pch=19)
plot(names(Motor_emmission_data_LA),Motor_emmission_data_LA,type="o",col=Motor_emmission_data_LA, xlab = "Year" ,ylab = "Total emmissions LA",pch=19)
dev.off
