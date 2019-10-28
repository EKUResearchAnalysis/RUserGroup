#September 2019 Mini Challenge
#Amanda Ellis

#Jackknife Estimation

#Data
cw<-ChickWeight
n.obs<-nrow(ChickWeight)

#Jackknife Procedure for R^2
r.sq.jk<-rep(NA,times=n.obs)
for(i in 1:n.obs){
  fit<-lm(weight~Time, data=cw[-i,])
  r.sq.jk[i]<-summary(fit)$adj.r.square
}

#Visualization of jackknife statistics
mean(r.sq.jk)
hist(r.sq.jk,main="Histogram of Jackknife Adj. R-Squared Values", xlab="Adj. R-Squared")

#Bootstrap Procedure for R^2
n.samples=10000
r.sq.bs<-rep(NA,times=n.samples)
for(i in 1:n.samples){
  bootstrap.sample<-cw[sample(n.samples,size=n.samples,replace=TRUE),]
  fit<-lm(weight~Time, data=bootstrap.sample)
  r.sq.jk[i]<-summary(fit)$adj.r.square
}

#Visualization
mean(r.sq.bs)
hist(r.sq.bs,main="Histogram of Bootstrap Adj. R-Squared Values", xlab="Adj. R-Squared")

