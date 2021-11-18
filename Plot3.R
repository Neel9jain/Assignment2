library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


Data_Baltimore <- subset(NEI,fips=="24510")

png("plot3.png",width = 480, height = 480)

ggplot(Data_Baltimore) +geom_col(aes(x=as.character(year),y=Emissions))+ facet_wrap(~type,nrow=2,ncol=2)+xlab("Year")

dev.off()