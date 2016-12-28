## @knitr ciCoverage
# abundance CI coverage
# 
U = 100
u = 10
N = 100
n.true=rnorm(U,N/U)
#sum(n.true)
# sampling with replacement
sample.it <- function(x,n,U,u){
  n = sample(n,u,replace=TRUE)
  somevariable = x
  N.hat = mean(n)*U
  N.var = U^2*var(n)/u
  N.CI = c(N.hat-qt(0.975,9)*sqrt(N.var),N.hat+qt(0.975,9)*sqrt(N.var))
  return(c(N.hat,N.var,N.CI))
}

samples = sapply(1:20,sample.it,U=U,u=u,n=n.true)
plot(samples[1,],ylim=range(samples[3:4,]),pch=19,axes=FALSE,xlab="",ylab="Abundance")
box()
axis(2,at=seq(0,200,50))
arrows(1:20,samples[3,],1:20,samples[4,],angle=90,code=3,length=0.1)
abline(h=sum(n.true),lty=2)