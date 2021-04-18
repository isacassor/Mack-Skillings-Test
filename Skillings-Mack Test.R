SM.Test = function(y,c,data=NULL){
  
  if(is.matrix(y)==TRUE) {if(sum(is.na(y))!=0){stop("Error: There are NA's in your data")}}
  if(is.matrix(y)==TRUE & length(data)!= 0) { stop("Error: Data should not be specified when y is a matrix") }
  if(length(data) == 0 & class(y[1])=="formula" ) { stop("Error: data must be specified") }
  if((c <= 0 | is.numeric(c)==FALSE | c!=round(c)) ) { stop("Error: Number of replications must be a positive integer") }
  if(sum(is.na(data))!=0 & class(y[1])=="formula") { stop("Error: There are NA's in your data")}
  if(is.data.frame(y)==TRUE){stop("Error: Data must be a matrix or formula must be specified for a data.frame")}

  M = function(y,n,k,f,c){
    R = matrix(NA,f,k)
    m=1
    for (i in 1:n) {
      vectorC = as.vector(y[m:(m+c-1),])
      R[m:(m+c-1),] = matrix(rank(vectorC),c,k)
      m = m+c
    }
    Sj = apply(R,2,sum)/n
    return(Sj)
  }
  if(is.matrix(y)==TRUE){
    k = dim(y)[2]
    f = dim(y)[1]
    n = f/c
    Sj = M(y,n,k,f,c)
    dataname = deparse(substitute(y))
  }
  
  else if(class(y)=="formula"){
    aa = y[[3]][[2]];aa = as.character(aa)
    trat = data[,aa]
    bb = y[[3]][[3]];bb = as.character(bb)
    bloq = data[,bb]
    cc = y[[2]];cc = as.character(cc)
    datos = data[,cc]
    
    k = length(levels(trat))
    f = length(datos)/length(levels(trat))
    n = f/c
    
    X <- matrix(NA,f,k)
    b <- 1
    for (i in levels(trat)){
      a <- 1
      for (j in levels(bloq)){
        X[a:(a+c-1),b] <- datos[which(trat==i & bloq==j)]
        a=a+c
      }
      b=b+1
    }
    Sj = M(X,n,k,f,c)
    dataname = deparse(substitute(data))
  }
  
  MS = (12/(k*(f*k+n)))*sum(Sj^2)-3*(f*k+n)
  p.value = 1-pchisq(MS,k-1)
  attr(MS,"names") = "MS"
  
  TEST        <- list(method = "Skillings-Mack Test", data.name = dataname,
                      statistic = MS, p.value = p.value);
  class(TEST) <- "htest";
  TEST
}

Datos = matrix(c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                 11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                 7.66,11.5,10.1,11.7,15.1,14.8,15.7),9,4)
SM.Test(Datos,c=3)

Datos = data.frame(x = c(7.58,7.87,7.71,11.63,11.87,11.4,15,15.92,15.58,8,8.27,8,12.2,11.7,
                     11.8,16.6,16.4,15.9,7.6,7.3,7.82,11.04,11.5,11.49,15.87,15.91,16.28,8.03,7.35,
                     7.66,11.5,10.1,11.7,15.1,14.8,15.7),
                   tratamientos=as.factor(c(rep("lab1",9),rep("lab2",9),rep("lab3",9),rep("lab4",9))),
                   bloques =as.factor(c(rep(c(rep("0",3),rep("4",3),rep("8",3)),4))))
SM.Test(x~tratamientos|bloques,3,data = Datos)

