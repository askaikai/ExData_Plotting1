plot3 = function(){
  
  # this fxn plots the high-density vertical lines and 
  # save as png 480 x 480 pixels (these are default, but I set it any way for practice)
  # NOTE TO SELF: first time: install.packages("sqldf")
  #
  # history
  # 05/09/14 ai wrote it based on: https://class.coursera.org/exdata-002/human_grading/view/courses/972082/assessments/3/submissions
  #
  
  ### go to the target dir so we know where to get data file and save plots
  setwd("/Users/akiko/Documents/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
  
  ### read in data
  require('sqldf')
  fileIn = '../data/household_power_consumption.txt'
  sqlIn = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  d = read.csv2.sql(fileIn,sqlIn)
  # add a column that specifies days of the week for this plot
  d$day = weekdays(strptime(as.character(d$Date),"%d/%m/%Y"),abbreviate=TRUE)
  
  ### now plot & save as png
  png(file='plot3.png',width=480, height=480, units="px")
  plot(d$Sub_metering_1, type="l", ann=FALSE, xaxt="n")
  lines(d$Sub_metering_2,col='red')
  lines(d$Sub_metering_3,col='blue')
  legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         lty=1, col=c('black','red','blue'))
  axis(1, at=c(1,which(d$day=="Fri")[1],length(d$Global_active_power)+1),
       labels=c("Thu","Fri","Sat"))
  title(ylab='Energy sub metering')
  dev.off()
  
}