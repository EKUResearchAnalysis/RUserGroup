#October 2019 Mini Challenge
#Amanda Ellis

#Bootstrap

sample.size<-c(10,25,50,75,100,250,500,1000)
proportions<-matrix(NA, nrow=8, ncol=100)

for(i in 1:8){
  #Create data set with sample.size rows and 100 columns
  temp.data<-replicate(100,sample(sample.size[i],size=sample.size[i],replace=TRUE))
  
  #Find the proportion of unique elements in each rcolumn
  proportions[i,]<-apply(temp.data, 2, FUN=function(x) length(unique(x)))/sample.size[i]
}

#Create Histograms
boxplot(proportions, use.cols = FALSE,names=sample.size)

