plot1 = function(){
  
  # this fxn plots the histogram and save as png 480 x 480 pixels (these are default,
  # but I set it any way for practice)
  # NOTE TO SELF: first time: install.packages("sqldf")
  #
  # history
  # 05/08/14 ai wrote it based on: https://class.coursera.org/exdata-002/human_grading/view/courses/972082/assessments/3/submissions
  #
  
  ### go to the target dir so we know where to get data file and save plots
  setwd("/Users/akiko/Documents/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
  
  ### read in data
  require('sqldf')
  fileIn = '../data/household_power_consumption.txt'
  sqlIn = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  d = read.csv2.sql(fileIn,sqlIn)
  
  ### now plot
  png(file='plot1.png',width=480, height=480, units="px")
  hist(d$Global_active_power, freq=TRUE, col='red', main='Global Active Power',
       xlab='Global Active Power (kilowatts)', ylab='Frequency', ylim=c(0,1200))
  dev.off()

}