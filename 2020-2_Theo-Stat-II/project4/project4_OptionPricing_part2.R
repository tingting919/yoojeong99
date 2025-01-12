## 이통 project 4 - Part2 ##


# 1) No Arbitrage 조건 mu=r 가정하 주가 {S(t)}일때 call/pull option 계산

  ## 방법1. Monte-Carlo Simulation



for (i in 1:10000){
  for (t in 1/12:1){
    z <- rnorm(10000)
    S <- function(t){
      778000*exp((log(1+i)-0.5*var(z))*t + sqrt(var(z))*sqrt(t)*z[i])}
    c <- function(t){
      exp(-t*log(1+i))*(cumsum(S(t)- 775000)/10000)}
    p <- function(t){
      exp(-t*log(1+i))*(cumsum(775000 - S(t))/10000)}
  }
}


S(1/12);S(3/12); S(6/12); S(9/12); S(1)
c(1/12); c(3/12); c(6/12); c(9/12); c(1)
p(1/12); p(3/12); p(6/12); p(9/12); p(1)



  ## 방법2. Black-Scholes-Merton

z <- rnorm(10000)
BlackScholes <- function( S =778000, K =775000, r = log(1+i), t = 1/12:1, sig=sqrt(var(z)), type){
  if(type=="C"){
    d1 <- (log(S/K) + (r + sig^2/2)*t) / (sig*sqrt(t))
    d2 <- d1 - sig*sqrt(t)
    
    c <- function(t){
      S*pnorm(d1) - K*exp(-r*t)*pnorm(d2)}
  }
      
  if(type=="P"){
    d1 <- (log(S/K) + (r + sig^2/2)*t) / (sig*sqrt(t))
    d2 <- d1 - sig*sqrt(t)
    
    p <- function(t){
      K*exp(-r*t)*pnorm(-d2) - S*pnorm(-d1)}
  }  
  
}

c(1/12); c(3/12); c(6/12); c(9/12); c(1)
p(1/12); p(3/12); p(6/12); p(9/12); p(1)


# 2)2017년 1월,3월,6월 9월,12월말 옵션 만기일의 실제 주가자료 이용하여 2017년 1월 2일에 위(5) 에서 계산한 call/put 옵션 가격으로 각 만기별로

K = 775000  

  # a) Call option 150주 및 Put option 50주
    

# t=1/12, S = 750000
150*c(1/12);50*p(1/12);150*(750000 - K);50*(K - 750000)
T1_1 <- 150*c(1/12) + 50*p(1/12)
N1_1 <- (150*(750000-K)+50*(K-750000))-(150*c(1/12)+50*p(1/12))
P1_1 <- 0.01*(N1_1/T1_1)
N1_1;P1_1

# t=3/12, S=861000
150*c(3/12);50*p(3/12);150*(861000 - K);50*(K - 861000)
T1_2 <- 150*c(3/12) + 50*p(3/12)
N1_2 <- (150*(861000-K)+50*(K-861000))-(150*c(3/12)+50*p(3/12))
P1_2 <- 0.01*(N1_2/T1_2)
N1_2;P1_2

# t=6/12, S=845000
150*c(6/12);50*p(6/12);150*(845000 - K);50*(K - 845000)
T1_3 <- 150*c(6/12) + 50*p(6/12)
N1_3 <- (150*(845000-K)+50*(K-845000))-(150*c(6/12)+50*p(6/12))
P1_3 <- 0.01*(N1_3/T1_3)
N1_3;P1_3

# t=9/12, S=733000
150*c(9/12);50*p(9/12);150*(733000 - K);50*(K - 733000)
T1_4 <- 150*c(9/12) + 50*p(9/12)
N1_4 <- (150*(733000-K)+50*(K-733000))-(150*c(9/12)+50*p(9/12))
P1_4 <- 0.01*(N1_4/T1_4)
N1_4;P1_4

# t=1, S=880000
150*c(1);50*p(1);150*(880000 - K);50*(K - 880000)
T1_5 <- 150*c(1) + 50*p(1)
N1_5 <- (150*(880000-K)+50*(K-880000))-(150*c(1)+50*p(1))
P1_5 <- 0.01*(N1_5/T1_5)
N1_5;P1_5



  ## b) Call option 100주 및 Put option 100주

  
# t=1/12, S = 750000
100*c(1/12);100*p(1/12);100*(750000 - K);100*(K - 750000)
T2_1 <- 100*c(1/12) + 100*p(1/12)
N2_1 <- (100*(750000-K)+100*(K-750000))-(100*c(1/12)+100*p(1/12))
P2_1 <- 0.01*(N2_1/T2_1)
N2_1;P2_1

# t=3/12, S=861000
100*c(3/12);100*p(3/12);100*(861000 - K);100*(K - 861000)
T2_2 <- 100*c(3/12) + 100*p(3/12)
N2_2 <- (100*(861000-K)+100*(K-861000))-(100*c(3/12)+100*p(3/12))
P2_2 <- 0.01*(N2_2/T2_2)
N2_2;P2_2

# t=6/12, S=845000
100*c(6/12);100*p(6/12);100*(845000 - K);100*(K - 845000)
T2_3 <- 100*c(6/12) + 100*p(6/12)
N2_3 <- (100*(845000-K)+100*(K-845000))-(100*c(6/12)+100*p(6/12))
P2_3 <- 0.01*(N2_3/T2_3 )
N2_3;P2_3

# t=9/12, S=733000
100*c(9/12);100*p(9/12);100*(733000 - K);100*(K - 733000)
T2_4 <- 100*c(9/12) + 100*p(9/12)
N2_4 <- (100*(733000-K)+100*(K-733000))-(100*c(9/12)+100*p(9/12))
P2_4 <- 0.01*(N2_4/T2_4)
N2_4;P2_4

# t=1, S=880000
100*c(1);100*p(1);100*(880000 - K);100*(K - 880000)
T2_5 <- 100*c(1) + 100*p(1)
N2_5 <- (100*(880000-K)+100*(880000))-(100*c(1)+100*p(1))
P2_5 <- 0.01*(N2_5/T2_5)
N2_5;P2_5



  ## c) Call option 50주 및 Put option 150주

# t=1/12, S = 750000
50*c(1/12);150*p(1/12);50*(750000 - K);150*(K - 750000)
T3_1 <- 50*c(1/12) + 150*p(1/12)
N3_1 <- (50*(750000-K)+150*(K-750000))-(50*c(1/12)+150*p(1/12))
P3_1 <- 0.01*(N3_1/T3_1)
N3_1;P3_1

# t=3/12, S=861000
50*c(3/12);150*p(3/12);50*(750000 - K);150*(K - 750000)
T3_2 <- 50*c(3/12) + 150*p(3/12)
N3_2 <- (50*(750000-K)+150*(K-750000))-(50*c(3/12)+150*p(3/12))
P3_2 <- 0.01*(N3_2/T3_1)
N3_2;P3_2

# t=6/12, S=845000
50*c(6/12);150*p(6/12);50*(845000 - K);150*(K - 845000)
T3_3 <- 50*c(6/12) + 150*p(6/12)
N3_3 <- (50*(845000-K)+150*(K-845000))-(50*c(6/12)+150*p(6/12))
P3_3 <- 0.01*(N3_3/T3_3)
N3_3;P3_3


# t=9/12, S=733000
50*c(9/12);150*p(9/12);50*(733000 - K);150*(K - 733000)
T3_4 <- 50*c(9/12) + 150*p(9/12)
N3_4 <- (50*(733000-K)+150*(K-733000))-(50*c(9/12)+150*p(9/12))
P3_4 <- 0.01*(N3_4/T3_4)
N3_4;P3_4


# t=1, S=880000
50*c(1);150*p(1);50*(880000 - K);150*(K - 880000)
T3_5 <- 50*c(1) + 150*p(1)
N3_5 <- (50*(880000-K)+150*(K-880000))-(50*c(1)+150*p(1))
P3_5 <- 0.01*(N3_5/T3_5)
N3_5;P3_5

