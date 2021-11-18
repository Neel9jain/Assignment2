NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data_frame <- tapply(NEI$Emissions,NEI$year,sum)


# Opening the Plotting device 
png("plot1.png",width = 480, height = 480)

plot(names(data_frame),data_frame,type="o",xlab ="year"  ,ylab = "Total emmissions",pch=19)

dev.off()