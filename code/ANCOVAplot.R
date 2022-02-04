# ***********************************************************************
# Title: Figure 2: Post-test as a function of pretest and condition
# Author: William Murrah
# Description: Plot raw test data with regression lines by condition.
#    Code taken from Regression and Other Stories website at:
#  https://avehtari.github.io/ROS-Examples/ElectricCompany/electric.html
# Created: Friday, 04 February 2022
# R version: R version 4.1.2 (2021-11-01)
# Project(working) directory: /Users/wmm0017/Projects/QMER/electric_company_Example
# ***********************************************************************
attach(electric_wide)
par(mfrow=c(1,4), pty="s")
for (j in 1:4){
  ok <- grade==j
  x <- c(treated_pretest[ok], control_pretest[ok])
  y <- c(treated_posttest[ok], control_posttest[ok])
  t <- rep(c(1,0), rep(sum(ok),2))
  plot(c(0,125),c(0,125), type="n", main=paste("Grade",j), xaxs="i", yaxs="i",
       xlab=expression(paste("pre-test, ",x[i])),
       ylab=expression(paste("post-test, ",y[i])),
       cex.axis=1.5, cex.lab=1.5, cex.main=1.8, mgp=c(2.5,.7,0))
  fit_1 <- lm(y ~ x + t + x:t, data = electric_wide)
  abline(coef(fit_1)[1], coef(fit_1)[2], lwd=.5, lty=2)
  abline(coef(fit_1)[1]+coef(fit_1)[3], coef(fit_1)[2]+coef(fit_1)[4], lwd=.5)
  ## lm.1 <- lm(y ~ x + t + x*t)
  points(control_pretest[ok], control_posttest[ok], pch=20, cex=1.2)
  points(treated_pretest[ok], treated_posttest[ok], pch=21, cex=1.2)
}
detach(electric_wide)