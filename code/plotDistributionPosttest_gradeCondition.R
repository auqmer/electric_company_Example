# ***********************************************************************
# Title: Distribution of post-test scores by grade and condition
# Author: William Murrah
# Description: Histogram comparing post-test scores emphasizing changes by
#              grade.
#              Code from Regression and Other Stories website: 
#   https://avehtari.github.io/ROS-Examples/ElectricCompany/electric.html
# Created: Friday, 04 February 2022
# R version: R version 4.1.2 (2021-11-01)
# Project(working) directory: /Users/wmm0017/Projects/QMER/electric_company_Example
# ***********************************************************************
attach(electric_wide)
onlytext<-function(string){
  plot(0:1, 0:1, bty='n', type='n', xaxt='n', yaxt='n', xlab='', ylab='')
  text(0.5, 0.5, string, cex=1.2, font=2)
}
nf<-layout(matrix(c(0,1:14), 3, 5, byrow=FALSE), c(5, 10, 10, 10, 10), 
           c(1, 5, 5), TRUE)
par(mar=c(.2, .2, .2, .2))
onlytext('Control\nclasses')
onlytext('Treated\nclasses')
par(mar=c(.2,.4,.2,.4), lwd=.5)
for (j in 1:4){
  onlytext(paste('Grade', j))
  hist(control_posttest[grade==j], breaks=seq(40,125,5), xaxt='n', yaxt='n',
       main=NULL, col="gray", ylim=c(0,14))
  axis(side=1, seq(50,100,25), line=-.25, cex.axis=1, mgp=c(1,.2,0), 
       tck=0, lty="blank")
  lines(rep(mean(control_posttest[grade==j]),2), c(0,11), lwd=2)
  hist(treated_posttest[grade==j], breaks=seq(40,125,5), xaxt='n',
       yaxt='n', main=NULL, col="gray", ylim=c(0,14))
  axis(side=1, seq(50,100,25), line=-.25, cex.axis=1, mgp=c(1,.2,0), 
       tck=0, lty="blank")
  lines(rep(mean(treated_posttest[grade==j]),2), c(0,11), lwd=2)
}
detach(electric_wide)